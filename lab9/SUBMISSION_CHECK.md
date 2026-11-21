# SUBMISSION_CHECK - EC23I2015 Lab 9

**Status: INCOMPLETE** (required items missing, see below)

Run mapping: run1 = Task 1 (no-scan baseline), run2 = Task 2 (4 chains), run3 = Task 3 (shadow logic, 6 chains). LEC covers run3 only, in two stages (stage1 RTL vs fv_map, stage2 fv_map vs final).

## Found / renamed
- 9.1 dft/run_mbist_insertion: RENAMED
- 9.2 syn/run1_run.tcl, run2_run.tcl, run3_run.tcl, run3_genus.log: RENAMED
- 9.3 reports/run2_* and run3_* (setup_bfr, chains, setup_aft, chain_summary, dft_drc (= dft_drc_final)): RENAMED
- 9.4 reports/run1-3_area.rpt (+ timing, power): RENAMED
- 9.5 lec/run3_lec_stage1/2 .do and .log (+ stage1 failed log and original do-file): RENAMED
- 9.6 netlist/run1-3_dtmf_recvr_core.v: RENAMED
- 9.7 EC23I2015_Lab_9.pdf (from lab9_report.pdf): RENAMED
- screenshots/: 4 PNGs RENAMED

## MISSING / EMPTY
| Item | Task | How to produce |
|---|---|---|
| dft/run_mbist_insertion.log | 1.2 | re-run the MBIST insertion with output teed to a log |
| syn/run1_genus.log | 1.3 | re-run `genus -f run_task1.tcl` with `-log` |
| syn/run2_genus.log | 2 | re-run `genus -f run_task2.tcl` with `-log` |
| reports/run1_* scan reports | 1 | none exist: run1 has no scan insertion |
| run2/run3 *_scan_registers.rpt | 2, 3 | EMPTY (114 B header only); regenerate with the Lab 8 Task 2.5 report command |
| README.md | - | to be written by the student |

## Warnings
- Scripts (run*_run.tcl, run3_lec_stage*.do) still refer to server-side names (run_task*, ../lec, work/taskK paths); they were not edited.
- Task 3 netlist in work/task3 differs from task3_run1_backup; work/task3 was used.
- task3.log and task3_run1.log are byte-identical; task3.log used.
- Ignored: .swp files, library/, rtl/, task3_run1_backup, zip, tex.

## Cannot be verified from files
- Report PDF has per-run DRC counts, flop counts, chain table, comparison with reasons, LEC result.
- No blank ____ left in the report.
