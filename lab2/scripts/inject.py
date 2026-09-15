#!/usr/bin/env python3
# inject.py -- inject one stuck-at fault into a structural Verilog netlist.
#
#   python3 scripts/inject.py work/top_gates.v n76 0 work/top_gates_faulty.v --rename top_faulty
#
# Finds the instance that drives the given net, moves its output onto a
# new dangling net, and ties the original net to a constant instead.

import re
import sys
import os

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from netlist import parse, INST_RE
from nangate_cells import cell_table, split_cell


def main():
    if len(sys.argv) < 5:
        sys.exit("usage: inject.py <netlist.v> <net> <0|1> <out.v> [--rename NAME]")
    src, net, val, dst = sys.argv[1:5]
    rename = None
    if "--rename" in sys.argv:
        rename = sys.argv[sys.argv.index("--rename") + 1]
    if val not in ("0", "1"):
        sys.exit("stuck value must be 0 or 1")

    cells = cell_table(1)
    ports, insts, aliases = parse(src)

    driver = None
    for name, cell, conns in insts:
        out_pin = cells[split_cell(cell)][0]
        if conns.get(out_pin) == net:
            driver = (name, cell, out_pin)
            break
    if driver is None:
        sys.exit("no instance drives net '" + net + "'")

    inst_name, cell, out_pin = driver
    text = open(src).read()

    def rewire(m):
        if m.group(2) != inst_name:
            return m.group(0)
        pattern = r"\." + out_pin + r"\s*\(\s*" + re.escape(net) + r"\s*\)"
        replacement = "." + out_pin + "(" + net + "__unused)"
        body = re.sub(pattern, replacement, m.group(3))
        return m.group(1) + " " + m.group(2) + " ( " + body + " );"

    text, n = INST_RE.subn(rewire, text)
    if net + "__unused" not in text:
        sys.exit("failed to rewire the driver - check the netlist by hand")

    decl = "  wire " + net + "__unused;\n"
    decl += "  assign " + net + " = 1'b" + val + ";   // STUCK-AT-" + val + " injected\n"
    first_inst = INST_RE.search(text)
    text = text[:first_inst.start()] + decl + text[first_inst.start():]

    if rename:
        top = re.search(r"\bmodule\s+(\w+)", text).group(1)
        text = re.sub(r"\bmodule\s+" + top + r"\b", "module " + rename, text)

    out_dir = os.path.dirname(dst) or "."
    os.makedirs(out_dir, exist_ok=True)
    open(dst, "w").write(text)

    print("net " + net + " stuck-at-" + val)
    print("  driver was " + cell + " " + inst_name + " (." + out_pin + ")")
    if rename:
        print("  wrote " + dst + " as module " + rename)
    else:
        print("  wrote " + dst)


if __name__ == "__main__":
    main()
