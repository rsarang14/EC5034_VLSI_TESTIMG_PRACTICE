# SUBMISSION_CHECK - EC23I2015 Lab 8 (counter_system scan insertion)

**Status: INCOMPLETE** (2 required items missing). All copies size-checked against their originals; originals untouched. Old -> new names are in `rename_map.txt`.

| ID | Deliverable | Result | Path |
|---|---|---|---|
| 8.1 | MBIST script + log | RENAMED | dft/run_mbist_insertion(.log) |
| 8.2 | Simulation pass evidence | FOUND in log (line 238); screenshot not in folder | dft/run_mbist_insertion.log |
| 8.3 | Task 1 script / Genus log | script RENAMED; **log MISSING** | syn/task1_run.tcl |
| 8.4 | Task 2 script / log | RENAMED (log = run_task2c.log) | syn/task2_run.tcl, task2_genus.log |
| 8.5 | scan_setup_bfr | RENAMED | reports/task2_counter_system_scan_setup_bfr.rpt |
| 8.6 | Task 2 DRC | EXTRACTED from log (not a tool-written file) | reports/task2_counter_system_dft_drc.rpt |
| 8.7-8.10 | Task 2 scan reports | RENAMED | reports/task2_counter_system_*.rpt |
| 8.11 | Task 3 script / log | RENAMED (log = run_task3b.log) | syn/task3_run.tcl, task3_genus.log |
| 8.12 | Task 3 reports | RENAMED + DRC EXTRACTED | reports/task3_counter_system_*.rpt |
| 8.13 | Final netlist | RENAMED | netlist/task3_counter_system_scan.v |
| 8.14 | LEC do / log | RENAMED (fv_map vs netlist as task4_lec; RTL vs fv_map also kept) | lec/ |
| 8.15 | Q5 diagram | inside PDF | EC23I2015_Lab_8.pdf |
| 8.16 | Report PDF | RENAMED | EC23I2015_Lab_8.pdf |
| 8.17 | README.md | WRITTEN | README.md |

## MISSING LIST
1. **8.3 syn/task1_genus.log** - Task 1.3. Rerun on the server: `cd lab8/synth && cp ../task1_results/run.tcl run_t1.tcl && genus -f run_t1.tcl -log task1_genus.log` (then `exit`). Tell me when done and I will add it.
2. **8.2 screenshot** (optional alternative to the log line) - `screenshots/task1_sim_pass.png`.

## Checklist (cannot be verified from files)
- [ ] Report PDF author line and roll number are correct.
- [ ] Decide whether the extracted DRC files are acceptable in place of tool-written `.rpt` files.
- [ ] Task 1 run (above) done before pushing, or accept the missing log.
