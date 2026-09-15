# netlist.py -- read a structural Verilog netlist of Nangate/Genus cells.
# Turns instance lines like:
#     NAND2X1 U17 ( .A1(n12), .A2(n9), .ZN(n21) );
# into a list of (instance, cell, {pin: net}) plus the port list.

import re

INST_RE = re.compile(
    r"\b([A-Z][A-Z0-9]*(?:X\d+|XL))\s+(\\?\S+?)\s*\(\s*(.*?)\s*\)\s*;",
    re.DOTALL)
CONN_RE = re.compile(r"\.(\w+)\s*\(\s*([^)]*?)\s*\)")
PORT_RE = re.compile(r"\b(input|output|inout)\s+(?:wire\s+|reg\s+)?"
                     r"(?:\[\s*(\d+)\s*:\s*(\d+)\s*\]\s*)?([^;]+?)\s*;")
ASSIGN_RE = re.compile(r"^\s*assign\s+(\S+)\s*=\s*(\S+)\s*;", re.MULTILINE)


def parse(path):
    text = open(path).read()
    text = re.sub(r"//.*", "", text)
    text = re.sub(r"/\*.*?\*/", "", text, flags=re.DOTALL)

    ports = {}
    for direction, hi, lo, names in PORT_RE.findall(text):
        for name in names.split(","):
            name = name.strip()
            if not name:
                continue
            if hi:
                for bit in range(int(lo), int(hi) + 1):
                    key = name + "[" + str(bit) + "]"
                    ports[key] = direction
            else:
                ports[name] = direction

    insts = []
    for cell, name, body in INST_RE.findall(text):
        conns = {}
        for pin, net in CONN_RE.findall(body):
            conns[pin] = net.strip()
        insts.append((name, cell, conns))

    aliases = ASSIGN_RE.findall(text)
    return ports, insts, aliases


if __name__ == "__main__":
    import sys
    from collections import Counter

    ports, insts, aliases = parse(sys.argv[1])
    print("ports     :", len(ports))
    print("instances :", len(insts))
    print("aliases   :", len(aliases))

    counts = Counter(cell for _, cell, _ in insts)
    for cell, n in counts.most_common():
        print("   " + cell.ljust(14), n)
