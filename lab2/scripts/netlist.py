"""
netlist.py -- read a structural Verilog netlist of Nangate cells.

Design Compiler writes instances, not equations:

    NAND2_X1 U17 ( .A1(n12), .A2(n9), .ZN(n21) );

This module turns that text into a list of (instance, cell, {pin: net}) and a
port list. It is deliberately small enough to read in one sitting.
"""
import re

INST_RE = re.compile(
    # Cadence/Genus cell-type names have NO underscore before the drive
    # strength suffix (NAND2X1, AOI2BB1XL) -- unlike DC's NAND2_X1 style.
    # Suffix is "X" + digits (X1, X2, X12, ...) or the literal "XL".
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
        for nm in [n.strip() for n in names.split(",") if n.strip()]:
            if hi:
                for b in range(int(lo), int(hi) + 1):
                    ports[f"{nm}[{b}]"] = direction
            else:
                ports[nm] = direction

    insts = []
    for cell, name, body in INST_RE.findall(text):
        conns = {pin: net.strip() for pin, net in CONN_RE.findall(body)}
        insts.append((name, cell, conns))

    aliases = ASSIGN_RE.findall(text)     # DC emits a few plain assigns
    return ports, insts, aliases


if __name__ == "__main__":
    import sys
    p, i, a = parse(sys.argv[1])
    print(f"ports     : {len(p)}")
    print(f"instances : {len(i)}")
    print(f"aliases   : {len(a)}")
    from collections import Counter
    for cell, n in Counter(c for _, c, _ in i).most_common():
        print(f"   {cell:14s} {n}")
