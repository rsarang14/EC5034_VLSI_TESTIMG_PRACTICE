# Lab 6 changes log (non-path changes)

## 1. Pre-MBIST baseline synthesis (added 2026-11-17)

**What:** Added a separate Genus run on the original `counter_system` RTL (no MBIST), to give the baseline for the area / power / timing / instance-count comparison table.

**Where (server):** `.../LAB6_SUBSMISSION/counter_system/counter_system/`
- `synth_pre/run_pre.tcl` (new), `synth_pre/setup.tcl` (copy of `synth/setup.tcl`, unchanged)
- Outputs: `synth_pre/counter_system_pre.vg`, `synth_pre/genus_pre.log`, `work_pre/reports/counter_system_{area,gates,power,qor,timing}.rpt`

**How it differs from `synth/run.tcl`:**
- Reads `../rtl/counter_system.v` and the other original RTL files directly, instead of `../mbist/counter_system.dc_design_load_script` (Tessent-modified RTL + SIB/BAP/controller/interface instruments).
- Does not source `mbist_postelab.tcl` (Tessent tsdb SDC, IJTAG retargeting, preserve/size-only rules).
- No `write_do_lec` (no LEC needed for baseline).
- Reports go to `work_pre/reports`, netlist to `counter_system_pre.vg`, so nothing in `synth/` or `work/` is overwritten.

**Kept identical for a fair comparison:** same libraries (`setup.tcl`), same `constraints.sdc` (10 ns clock), `lp_insert_clock_gating true`, same memory interface models, same `syn_generic` / `syn_map` / `syn_opt` flow.

**Why:** the task requires a comparison table; the post-MBIST reports alone have no reference point.

**Result:** 0 errors, no unresolved references (SRAMs are black boxes, VRO-14 warnings expected).

## Comparison table

| Metric | Pre-MBIST | Post-MBIST | Change |
|---|---|---|---|
| Cell area | 334.212 | 3578.971 | +3244.759 (10.7x) |
| Instance count | 119 | 1745 | +1626 (14.7x) |
| Worst setup slack | 2405 ps | 2128 ps | -277 ps |
| Total power (W) | 2.576e-04 | 3.136e-03 | +2.878e-03 (12.2x) |

Notes:
- Slack is the single worst path in each run; post-MBIST worst path is a clock-gating setup check, so the two are not the same kind of path.
- Power is vectorless switching power only; library reports 0 leakage/internal power in both runs.
- Post-MBIST clock power is 2.438e-03 W (77.7% of total) vs 1.528e-04 W (59.3%) pre-MBIST.
