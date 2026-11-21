# Submission check: EC23I2015, Lab 10

**Status: INCOMPLETE (by the manifest)** - 1 required name not present, README not written locally (the repo's initial-commit README is used). All other required items found; sizes verified against the originals (see rename_map.txt).

| ID | Deliverable | Status | Path |
|----|-------------|--------|------|
| 10.1 | Run 1 script + Genus log | RENAMED | syn/run1_run.tcl, syn/run1_genus.log |
| 10.2 | Run 2 script + Genus log | RENAMED | syn/run2_run.tcl, syn/run2_genus.log |
| 10.3 | include_libraries.v | FOUND | syn/include_libraries.v |
| 10.4 | Memory ATPG models | FOUND | syn/SYNC_1RW_256x16.atpg.v, syn/SYNC_1RW_64Kx8.atpg.v |
| 10.5 | Run 1 Modus script | FOUND | atpg_run1/runmodus.atpg.tcl |
| 10.6 | Run 1 logs (testmode, verify, report, faultmodel, create_logic_tests) | FOUND | atpg_run1/logs/ |
| 10.6 | `log_build_fault_model` | **MISSING** (no file of that name; Modus wrote `log_build_faultmodel`, which is included) | - |
| 10.7 | Run 2 script and logs | FOUND | atpg_run2/ |
| 10.8 | Simulation logs | RENAMED | sim/run1_ncverilog_FULLSCAN.log, sim/run2_ncverilog_FULLSCAN.log |
| 10.9 | Waveform screenshots (optional) | MISSING (optional) | - |
| 10.10 | Report PDF | RENAMED | EC23I2015_Lab_10.pdf |
| 10.11 | README.md | MISSING locally (the GitHub repo's initial README is kept) | - |

## Extra file included
`log_build_model` is in both `logs/` folders although it is not in the manifest, because the Q1 to Q3 answers (blackboxes, errors, severe warnings) come from it.

## Missing list
1. `log_build_fault_model`: Task 3, step 2a. Modus names this file `log_build_faultmodel`; no file with the underscore name exists in either run.
2. Waveform screenshots (optional, Task 4): open the simulation in Xcelium with waveforms enabled; not done.
3. README.md: to be written by the student.

## Warnings
- `run_fullscan_sim` and `runmodus.atpg.tcl` use relative directory names (`counter_system_atpg`, `counter_system_atpg_6chains`) and `include_libraries.v` has absolute server paths; the copies are for reading and will not rerun from this folder.
- Both Genus logs end with "Abnormal exit" (Ctrl-C after the Modus scripts were written); all output is present.
- Not copied: ATPG database (`tbdata`), `test_netlist.v`, vector files, `pinassign`, `run_fullscan_sim*`, timestamped duplicate logs, Genus `reports_task1/5`.

## Checklist (cannot be verified from files)
- Report PDF contains Q1 to Q15 for run 1 and the run 1 vs run 2 table for Q1 to Q5 (and the simulation comparison).
- No blank placeholders left in the report.
