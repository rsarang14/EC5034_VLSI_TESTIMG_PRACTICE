# EC23I2015 - Lab 8: Scan insertion on counter_system

Tessent (MBIST), Genus (synthesis, muxed scan, DFT DRC), Conformal (LEC).
Report: `EC23I2015_Lab_8.pdf` (answers Q1-Q6, Q9, Q10; Q5 diagrams; before/after DRC table; LEC explanation).

## Folder contents

| Folder / file | Contents |
|---|---|
| `EC23I2015_Lab_8.pdf` | Lab report |
| `dft/` | `run_mbist_insertion` script and log (Task 1.2, simulation `pass 3 fail 0`, log line 238) |
| `syn/` | `task1_run.tcl` (clock gating, no scan), `task2_run.tcl` / `task2_genus.log` (muxed scan), `task3_run.tcl` / `task3_genus.log` (`fix_dft_violations` + clock-gating test signal); `setup.tcl`, `mbist_postelab.tcl` are sourced by the run scripts |
| `reports/` | `task2_*` and `task3_*`: `dft_drc`, `scan_chains`, `scan_setup_aft`, `scan_chain_summary`, `scan_registers`; `task2_*_scan_setup_bfr.rpt` |
| `netlist/` | `task3_counter_system_scan.v` - final scan-inserted netlist |
| `lec/` | `task4_lec.do` / `.log`: fv_map vs final netlist (PASS). `task4_lec_rtl2map.*`: RTL vs fv_map (PASS). `*_run.log` are the Conformal stdout logs |
| `lab8_changes_log.md` | Every non-path change made to the handout scripts |
| `rename_map.txt` | Original file name -> submitted file name |

## Results

- **Task 2 (initial DRC):** 9 violations (8 clock, 1 async); 215 registers fail, 107 pass (33%).
- **Task 3 (final):** 1 violation (tied-constant clock in the Tessent SIB); 3 fail, 302 pass (99.0%); 0 async violations.
- **Task 4:** 4 scan chains (lengths 3, 244, 29, 26); 0 lock-up elements; both LEC stages `LEC Comparison: PASS`, 0 non-equivalent points.

## Notes

- **DRC reports are extracted:** `task2_*_dft_drc.rpt` and `task3_*_dft_drc.rpt` are the verbatim `check_dft_rules` output copied out of `task2_genus.log` (lines 486-534) and `task3_genus.log` (lines 4210-4240) because the script printed DRC to the log instead of a file.
- **No Task 1 Genus log:** `syn/task1_run.tcl` is the Task 1 script, but its log was not saved. Not included.
- **Task 1 netlist/reports are not included;** the Task 1 outputs were overwritten by later runs. Task 3 is the final netlist.
- **LEC run with `-xl`:** `set_analyze_option -auto -report_map` needs a Conformal_Ultra licence, so the do-files were run with `lec -nogui -xl -dofile ...`.
- **Failed and superseded runs are not included:** the Task 2 runs that stopped at DFT-307, and the fix-only Task 3 run.
- The `tsdb_outdir` Tessent output, the foundry library and the memory models are not included.
