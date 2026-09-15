#!/usr/bin/env python3

import sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from netlist import parse
from nangate_cells import cell_table, split_cell


INPUT_ORDER = ["start", 
               "multiplicand_in[0]", "multiplicand_in[1]", "multiplicand_in[2]", "multiplicand_in[3]",
               "multiplier_in[0]", "multiplier_in[1]", "multiplier_in[2]", "multiplier_in[3]"]

def fast_column(bit, nv):
    # generate one input column for all nv vectors at once, bitwise
    block = (1 << (1 << bit)) - 1
    pattern = block << (1 << bit)
    length = 1 << (bit + 1)

    while length < nv:
        pattern = pattern | (pattern << length)
        length *= 2

    return pattern

def extract_flip_flops(insts, inputs, outputs):
    # turn flip-flops into pseudo inputs (Q) and pseudo outputs (D)
    comb_insts = []
    for inst in insts:
        name, cell, conns = inst
        if "DFF" in cell:
            if "Q" in conns:
                inputs.append(conns["Q"])  # Psuedo Input
            if "D" in conns:
                outputs.append(conns["D"]) # Psuedo Output
        else:
            comb_insts.append(inst)
            
    return comb_insts, inputs, outputs

def levelise(insts, inputs, cells):
    # sort gates so every gate is computed after its inputs are known
    known = set(inputs) | {"1'b0", "1'b1", "reset", "clk"}
    pending = list(insts)
    order = []
    
    while pending:
        progressed = False
        still = []
        for inst in pending:
            name, cell, conns = inst
            base = split_cell(cell)
            if base not in cells:
                sys.exit("unknown cell " + str(cell) + " on instance " + str(name))
            out_pin, in_pins, _ = cells[base]
            
            if all(conns.get(p, "1'b0") in known for p in in_pins):
                order.append(inst)
                known.add(conns[out_pin])
                progressed = True
            else:
                still.append(inst)
                
        if not progressed:
            print("STUCK ON:", still)
            sys.exit("combinational loop among " + str(len(still)) + " instances")
        pending = still
        
    return order

def get_all_nets(insts, cells):
    # every wire in the circuit, so each one can be fault-tested
    nets = set()
    for _, cell, conns in insts:
        out_pin, in_pins, _ = cells[split_cell(cell)]
        nets.add(conns[out_pin])
        for p in in_pins:
            if conns.get(p, "1'b0") not in ("1'b0", "1'b1", "clk", "reset"):
                nets.add(conns[p])
    return sorted(nets)

def simulate(inputs, outputs, order, aliases, cells, nv, mask, force=None):
    # simulate all nv test vectors together, one machine word per net
    env = {"1'b0": 0, "1'b1": mask, "clk": 0, "reset": 0}

    for i, nm in enumerate(inputs):
        env[nm] = fast_column(i, nv)

    if force and force[0] in env:
        env[force[0]] = mask if force[1] else 0

    for name, cell, conns in order:
        out_pin, in_pins, fn = cells[split_cell(cell)]
        net = conns[out_pin]
        
        if force and force[0] == net:
            env[net] = mask if force[1] else 0
        else:
            p = {pin: env[conns.get(pin, "1'b0")] for pin in in_pins}
            env[net] = fn(p) & mask

    for dst, src in aliases:
        if force and force[0] == dst:
            env[dst] = mask if force[1] else 0
        elif force and force[0] == src:
            pass
        else:
            env[dst] = env.get(src, 0)

    return {nm: env.get(nm, 0) for nm in outputs}

def run(path, input_order):
    print("1. Parsing netlist...")
    ports, insts, aliases = parse(path)
    
    print("2. Extracting Flip-Flops to break loops...")
    inputs = list(input_order)
    outputs = []
    comb_insts, inputs, outputs = extract_flip_flops(insts, inputs, outputs)
    
    nv = 1 << len(inputs)
    mask = (1 << nv) - 1
    
    print("3. Sorting logic gates...")
    cells = cell_table(mask)
    order = levelise(comb_insts, inputs, cells)
    
    print("   -> Total Inputs (Real + Flip-Flops):", len(inputs))
    print("   -> Total Test Vectors:", nv)

    print("4. Simulating golden circuit...")
    golden = simulate(inputs, outputs, order, aliases, cells, nv, mask)

    nets = get_all_nets(comb_insts, cells)
    detect_sets = {}
    
    print("5. Simulating", len(nets)*2, "faults. This may take a moment...")
    
    total_faults = 0
    for net in nets:
        for sa in (0, 1):
            total_faults += 1
            faulty = simulate(inputs, outputs, order, aliases, cells, nv, mask, force=(net, sa))
            diff = 0
            for out in outputs:
                diff |= (golden[out] ^ faulty[out])
            if diff:
                fault_name = str(net) + "/sa" + str(sa)
                detect_sets[fault_name] = diff

    print("\n--- FAULT SIMULATION RESULTS ---")
    print("Vectors simulated  :", nv, "(exhaustive)")
    print("Stuck-at faults    :", total_faults)
    print("Detected           :", len(detect_sets))
    
    coverage = round(100 * len(detect_sets) / total_faults, 2)
    print("Coverage           :", coverage, "%")

    print("\n6. Starting FAST Compaction algorithm...")
    chosen = set()
    for diff in detect_sets.values():
        if diff:
            # Instantly grabs the lowest bit (first vector) that catches this fault
            first_vector = (diff & -diff).bit_length() - 1
            chosen.add(first_vector)

    print("\nExhaustive set     :", nv, "vectors")
    
    if len(chosen) > 0:
        reduction = round(nv / len(chosen))
    else:
        reduction = 0
    print("Fast compacted     :", len(chosen), "vectors (", reduction, "x smaller)")

# Run the script immediately
netlist_path = sys.argv[1] if len(sys.argv) > 1 else "work/top_gates.v"
run(netlist_path, INPUT_ORDER)
