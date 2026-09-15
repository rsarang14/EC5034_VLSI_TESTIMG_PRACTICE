# nangate_cells.py -- boolean function table for standard cells.
# Used by inject.py / faultsim.py to know each cell's output pin,
# input pins, and boolean function.

import re


def _cells(M):
    def inv(x):
        return M ^ x

    return {
        "INV":       ("Y", ["A"],              lambda p: inv(p["A"])),
        "BUF":       ("Y", ["A"],              lambda p: p["A"]),

        "AND2":      ("Y", ["A", "B"],         lambda p: p["A"] & p["B"]),
        "NAND2":     ("Y", ["A", "B"],         lambda p: inv(p["A"] & p["B"])),
        "OR2":       ("Y", ["A", "B"],         lambda p: p["A"] | p["B"]),
        "NOR2":      ("Y", ["A", "B"],         lambda p: inv(p["A"] | p["B"])),
        "XOR2":      ("Y", ["A", "B"],         lambda p: p["A"] ^ p["B"]),
        "XNOR2":     ("Y", ["A", "B"],         lambda p: inv(p["A"] ^ p["B"])),
        "CLKAND2":   ("Y", ["A", "B"],         lambda p: p["A"] & p["B"]),
        "CLKINV":    ("Y", ["A"],              lambda p: inv(p["A"])),
        "CLKBUF":    ("Y", ["A"],              lambda p: p["A"]),

        "NAND2B":    ("Y", ["AN", "B"],        lambda p: inv(inv(p["AN"]) & p["B"])),
        "AND2B":     ("Y", ["AN", "B"],        lambda p: inv(p["AN"]) & p["B"]),
        "OR2B":      ("Y", ["AN", "B"],        lambda p: inv(p["AN"]) | p["B"]),
        "NOR2B":     ("Y", ["AN", "B"],        lambda p: inv(inv(p["AN"]) | p["B"])),

        "AND3":      ("Y", ["A", "B", "C"],    lambda p: p["A"] & p["B"] & p["C"]),
        "NAND3":     ("Y", ["A", "B", "C"],    lambda p: inv(p["A"] & p["B"] & p["C"])),
        "OR3":       ("Y", ["A", "B", "C"],    lambda p: p["A"] | p["B"] | p["C"]),
        "NOR3":      ("Y", ["A", "B", "C"],    lambda p: inv(p["A"] | p["B"] | p["C"])),

        "AND4":      ("Y", ["A", "B", "C", "D"], lambda p: p["A"] & p["B"] & p["C"] & p["D"]),
        "NAND4":     ("Y", ["A", "B", "C", "D"], lambda p: inv(p["A"] & p["B"] & p["C"] & p["D"])),
        "OR4":       ("Y", ["A", "B", "C", "D"], lambda p: p["A"] | p["B"] | p["C"] | p["D"]),
        "NOR4":      ("Y", ["A", "B", "C", "D"], lambda p: inv(p["A"] | p["B"] | p["C"] | p["D"])),

        "AOI21":     ("Y", ["A0", "A1", "B0"], lambda p: inv((p["A0"] & p["A1"]) | p["B0"])),
        "OAI21":     ("Y", ["A0", "A1", "B0"], lambda p: inv((p["A0"] | p["A1"]) & p["B0"])),
        "AOI31":     ("Y", ["A0", "A1", "A2", "B0"], lambda p: inv((p["A0"] & p["A1"] & p["A2"]) | p["B0"])),
        "OAI31":     ("Y", ["A0", "A1", "A2", "B0"], lambda p: inv((p["A0"] | p["A1"] | p["A2"]) & p["B0"])),
        "OAI211":    ("Y", ["A0", "A1", "B0", "C0"], lambda p: inv(((p["A0"] | p["A1"]) & p["B0"]) & p["C0"])),
        "AOI211":    ("Y", ["A0", "A1", "B0", "C0"], lambda p: inv(((p["A0"] & p["A1"]) | p["B0"]) | p["C0"])),
        "OAI22":     ("Y", ["A0", "A1", "B0", "B1"], lambda p: inv((p["B0"] | p["B1"]) & (p["A0"] | p["A1"]))),
        "AOI22":     ("Y", ["A0", "A1", "B0", "B1"], lambda p: inv((p["A0"] & p["A1"]) | (p["B0"] & p["B1"]))),

        "AO21":      ("Y", ["A0", "A1", "B0"], lambda p: (p["A0"] & p["A1"]) | p["B0"]),
        "OA21":      ("Y", ["A0", "A1", "B0"], lambda p: (p["A0"] | p["A1"]) & p["B0"]),
        "AO22":      ("Y", ["A0", "A1", "B0", "B1"], lambda p: (p["A0"] & p["A1"]) | (p["B0"] & p["B1"])),
        "OA22":      ("Y", ["A0", "A1", "B0", "B1"], lambda p: (p["A0"] | p["A1"]) & (p["B0"] & p["B1"])),
        "AO31":      ("Y", ["A0", "A1", "A2", "B0"], lambda p: (p["A0"] & p["A1"] & p["A2"]) | p["B0"]),
        "OA31":      ("Y", ["A0", "A1", "A2", "B0"], lambda p: (p["A0"] | p["A1"] | p["A2"]) & p["B0"]),

        "AOI2BB1":   ("Y", ["A0N", "A1N", "B0"], lambda p: inv(inv(p["A0N"] | p["A1N"]) | p["B0"])),
        "OAI2BB1":   ("Y", ["A0N", "A1N", "B0"], lambda p: inv(inv(p["A0N"] & p["A1N"]) & p["B0"])),

        "LOGIC0":    ("Y", [], lambda p: 0),
        "LOGIC1":    ("Y", [], lambda p: M),
    }


def cell_table(M):
    # cell table specialised for a given bit-width mask M
    table = _cells(M)
    table["MUX2"] = ("Z", ["A", "B", "S"], lambda p: (p["B"] & p["S"]) | (p["A"] & (M ^ p["S"])))
    table["MX2"] = ("Y", ["A", "B", "S0"], lambda p: (p["B"] & p["S0"]) | (p["A"] & (M ^ p["S0"])))
    return table


_SUFFIX_RE = re.compile(r'_?(X\d+|XL)$')


def split_cell(inst_type):
    # "NAND2X1" -> "NAND2"
    return _SUFFIX_RE.sub("", inst_type)
