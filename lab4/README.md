# Lab 4: Logic Equivalence Checking (LEC) with Cadence Conformal

This lab uses Cadence Conformal LEC to formally verify that a synthesized gate-level
netlist for a sequential multiplier design is logically equivalent to its golden RTL,
across three progressively harder scenarios: a plain synthesis check, a synthesis run
with automatic clock gating enabled, and a deliberately injected netlist bug.

The full write-up with all screenshots is in [`lab4_report.pdf`](lab4_report.pdf)
(source: [`lab4_report.tex`](lab4_report.tex)). Screenshots are also available
individually under [`images/`](images).

## Design under test

RTL (`rtl/`): `controller.v`, `datapath.v`, `top.v` — a sequential multiplier with a
controller/datapath split, verified against `tb_top.v`. Synthesized with Cadence Genus
against the `slow_vdd1v0_basiccells` standard cell library (`lib/LIB/`).

## Task 1 — Baseline LEC

Synthesized `top_gates.v` (`work/`) is compared against the golden RTL using
`lec_task_1/multiplier_lec.do`, which reads the liberty library, reads golden RTL and
revised netlist, and runs `compare`.

**Result:** all 27 flip-flops and primary outputs mapped, **0 non-equivalent points** —
clean PASS (log: `lec_task_1/multiplier_lec.log`).

## Task 2 — LEC with automatic clock gating

Genus synthesis (`syn/genus_syn.tcl`) was re-run with
`set_db / .lp_insert_clock_gating true` enabled, and a report of flip-flops removed by
clock gating was generated with `report_sequential -deleted`
(`work_cg/top_deleted_flops.rpt`).

- **Without a flattening constraint** (`lec_task_2/multiplier_cg_lec.do`), LEC **fails**
  with 16 non-equivalent points: Conformal cannot map the newly inserted clock-gating
  cells (`RC_CG_MOD`) in the revised netlist back to the golden RTL.
- **Adding `set flatten model -gated_clock`** before comparison tells Conformal to
  recognize and mathematically flatten the clock-gating logic. Re-running LEC then
  **passes** with all 27 EQ points and 0 non-equivalent points.

Logs: `lec_task_2/multiplier_cg_lec.log`.

## Task 3 — Debugging an injected netlist bug

A bug was manually injected into `work_cg/top_gates_buggy.v`: the input to inverter
`g1072` was re-routed from `accumulated_prod[5]` to `accumulated_prod[4]`.

Running LEC (`lec_task_3/multiplier_buggy.do`) reports 3 non-equivalent compare points.
Using Conformal's GUI:

1. The **Mapping Manager** was used to isolate the failing DFF, `accumulated_prod_reg[5]`.
2. **Diagnose** in the Diagnosis Manager ran Conformal's mathematical solver over the
   logic cone and flagged `INVX1 g1072` as the error candidate with probability **1.00**.
3. The **flattened Schematics** view was used to visually trace the logic backward from
   the DFF input on both sides, confirming the revised netlist was reading bit `[4]`
   where the golden RTL read bit `[5]`.

The netlist was corrected back to `accumulated_prod[5]` and LEC (`multiplier_buggy_lec.do`)
was re-run, confirming the fix: all 27 points map with **0 non-equivalent points**.

Logs: `lec_task_3/multiplier_buggy_lec.log`.

## Folder contents

```
lab4_report.tex / lab4_report.pdf   Full report with all screenshots
images/                             Individual PASS/FAIL/diagnosis screenshots
lec_task_1/                         Task 1 .do script and log
lec_task_2/                         Task 2 .do script and log (clock-gated LEC)
lec_task_3/                         Task 3 .do scripts and log (buggy netlist debug)
rtl/                                Golden RTL sources
syn/                                Genus synthesis scripts and constraints
lib/                                Standard cell / LEF / capacitance / QRC tech libraries
work/, work_cg/                     Synthesis outputs (gate-level netlists, reports)
```
