#!/usr/bin/env python3
"""
inject.py -- inject one stuck-at fault into a structural Verilog netlist.

    python3 scripts/inject.py work/alu_core_gates.v n21 0 \
            work/alu_core_faulty.v --rename alu_core_faulty

A stuck-at fault means a net is permanently held at a value. In a gate
netlist that is a rewiring job, and this script does exactly what you would
do by hand:

    1. find the instance that DRIVES net N
    2. move its output onto a new, now-dangling net N__unused
    3. drive N from a constant instead

The result is a netlist where every load of N sees the stuck value, which is
precisely the definition. Open the output file and read the diff - do not
treat this script as a black box, it is four lines of idea.
"""
import re, sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from netlist import parse, INST_RE
from nangate_cells import cell_table, split_cell


def main():
    if len(sys.argv) < 5:
        sys.exit(__doc__)
    src, net, val, dst = sys.argv[1:5]
    rename = None
    if "--rename" in sys.argv:
        rename = sys.argv[sys.argv.index("--rename") + 1]
    if val not in ("0", "1"):
        sys.exit("stuck value must be 0 or 1")

    cells = cell_table(1)                       # mask irrelevant, we want pins
    ports, insts, _ = parse(src)

    driver = None
    for name, cell, conns in insts:
        out_pin = cells[split_cell(cell)][0]
        if conns.get(out_pin) == net:
            driver = (name, cell, out_pin)
            break
    if driver is None:
        sys.exit(f"no instance drives net '{net}'. "
                 f"Is it a primary input, or did you mistype it?")

    inst_name, cell, out_pin = driver
    text = open(src).read()

    # 1+2: move the driver's output onto a dangling net
    def rewire(m):
        if m.group(2) != inst_name:
            return m.group(0)
        body = re.sub(r"\.%s\s*\(\s*%s\s*\)" % (out_pin, re.escape(net)),
                      f".{out_pin}({net}__unused)", m.group(3))
        return f"{m.group(1)} {m.group(2)} ( {body} );"

    text, n = INST_RE.subn(rewire, text)
    if f"{net}__unused" not in text:
        sys.exit("failed to rewire the driver - check the netlist by hand")

    # 3: declare the new net and tie the faulty net to a constant
    decl = f"  wire {net}__unused;\n  assign {net} = 1'b{val};   " \
           f"// STUCK-AT-{val} injected by inject.py\n"
    first_inst = INST_RE.search(text)
    text = text[:first_inst.start()] + decl + text[first_inst.start():]

    if rename:
        top = re.search(r"\bmodule\s+(\w+)", text).group(1)
        text = re.sub(r"\bmodule\s+%s\b" % top, f"module {rename}", text)
        text = re.sub(r"\bendmodule\b", "endmodule", text)

    os.makedirs(os.path.dirname(dst) or ".", exist_ok=True)
    open(dst, "w").write(text)
    print(f"net {net} stuck-at-{val}")
    print(f"  driver was {cell} {inst_name} (.{out_pin})")
    print(f"  wrote {dst}" + (f" as module {rename}" if rename else ""))


if __name__ == "__main__":
    main()
