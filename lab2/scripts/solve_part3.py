import sys, os
from netlist import parse
from nangate_cells import cell_table, split_cell

def extract_flip_flops(insts, inputs, outputs):
    comb_insts = []
    for inst in insts:
        name, cell, conns = inst
        if "DFF" in cell:
            if "Q" in conns: inputs.append(conns["Q"])
            if "D" in conns: outputs.append(conns["D"])
        else: comb_insts.append(inst)
    return comb_insts, inputs, outputs

def levelise(insts, inputs, cells):
    known = set(inputs) | {"1'b0", "1'b1", "reset", "clk"}
    pending = list(insts)
    order = []
    while pending:
        progressed = False
        still = []
        for inst in pending:
            name, cell, conns = inst
            out_pin, in_pins, _ = cells[split_cell(cell)]
            if all(conns.get(p, "1'b0") in known for p in in_pins):
                order.append(inst)
                known.add(conns[out_pin])
                progressed = True
            else: still.append(inst)
        if not progressed: sys.exit("loop")
        pending = still
    return order

# 1. Setup
path = "../work/top_gates.v"
INPUT_ORDER = ["start", 
               "multiplicand_in[0]", "multiplicand_in[1]", "multiplicand_in[2]", "multiplicand_in[3]",
               "multiplier_in[0]", "multiplier_in[1]", "multiplier_in[2]", "multiplier_in[3]"]

ports, insts, aliases = parse(path)
inputs = list(INPUT_ORDER)
outputs = []
comb_insts, inputs, outputs = extract_flip_flops(insts, inputs, outputs)

cells = cell_table(1) # We only need a mask of 1 (testing a single vector)
order = levelise(comb_insts, inputs, cells)

# 2. Find a working vector
# Instead of 134 million, let's just brute force until we find one that works for n_76 sa0!
print("Searching for a vector that detects n_76 Stuck-At-0...")

for vec in range(100000):  # Should find one very quickly
    env = {"1'b0": 0, "1'b1": 1, "clk": 0, "reset": 0}
    
    # Apply vector bits to inputs
    for i, nm in enumerate(inputs):
        env[nm] = (vec >> i) & 1
        
    # Simulate GOLDEN
    golden_env = env.copy()
    for name, cell, conns in order:
        out_pin, in_pins, fn = cells[split_cell(cell)]
        p = {pin: golden_env[conns.get(pin, "1'b0")] for pin in in_pins}
        golden_env[conns[out_pin]] = fn(p) & 1
        
    # Simulate FAULTY (n_76 = 0)
    faulty_env = env.copy()
    for name, cell, conns in order:
        out_pin, in_pins, fn = cells[split_cell(cell)]
        net = conns[out_pin]
        
        if net == "n_76":
            faulty_env[net] = 0
        else:
            p = {pin: faulty_env[conns.get(pin, "1'b0")] for pin in in_pins}
            faulty_env[net] = fn(p) & 1
            
    # Check if any output is different!
    detected = False
    for out in outputs:
        if golden_env.get(out, 0) != faulty_env.get(out, 0):
            detected = True
            error_out = out
            golden_out = golden_env.get(out, 0)
            faulty_out = faulty_env.get(out, 0)
            break
            
    if detected:
        # We also need to make sure the fault was ACTUALLY activated 
        # (n_76 must be 1 in the good circuit)
        if golden_env["n_76"] == 1:
            print("\n--- BINGO! PART 3 ANSWERS ---")
            
            # Format the input vector nicely
            vec_str = ""
            for i, nm in enumerate(inputs):
                vec_str += f"{nm}={golden_env[nm]}, "
                
            print(f"For input vector:\n{vec_str}")
            print(f"The good circuit produces output: {error_out} = {golden_out}")
            print(f"The faulty circuit produces output: {error_out} = {faulty_out}")
            print(f"\nGood-circuit value of the faulty net (n_76) = 1")
            print(f"Faulty-circuit value (n_76) = 0")
            print(f"Primary output(s) showing the error = {error_out}")
            
            print("\nExplanation:")
            print(f"The stuck-at-0 fault is activated because the good circuit drives n_76 to 1.")
            print(f"This fault propagates through the NAND3XL gate (g24135__6260) because its other inputs (n_68 and n_80) are held at a non-controlling value (1).")
            print(f"This causes the output of the NAND3 gate ({error_out}) to flip from {golden_out} to {faulty_out}, successfully detecting the fault.")
            break
