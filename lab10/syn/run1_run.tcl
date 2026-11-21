source setup.tcl

set REPORTS_PATH "${LOCAL_DIR}/work/reports"
set design_name counter_system
set design_id rtl1
source ../mbist/${design_name}.dc_design_load_script

read_hdl ../library/memories/SYNC_1RW_256x16.v_interface ../library/memories/SYNC_1RW_64Kx8.v_interface
elaborate
current_design ${design_name}
check_design -unresolved

source ../constraints/constraints.sdc
source ./mbist_postelab.tcl

set_db / .lp_insert_clock_gating true

# ---- Lab 8 Task 2.1: scan configuration ----
set_db dft_scan_style muxed_scan
set_db dft_prefix dft_
define_shift_enable -active high scan_en -create
define_test_mode -active high test_mode -create
define_test_clock -create_port scan_clk
set_db design:${design_name} .lp_clock_gating_test_signal test_mode

# ---- Lab 8 Task 3: fix DFT violations (test_mode override for clock/async) ----
check_dft_rules
fix_dft_violations -test_control test_mode -async_reset -async_set -clock

# ---- Lab 8 Task 2.2: scan setup report (before) ----
report_scan_setup > ${REPORTS_PATH}/${DESIGN}_scan_setup_bfr.rpt

# ---- Lab 8 Task 2.3: scan DRC ----
check_dft_rules

syn_generic
syn_map
write_do_lec -golden rtl -revised fv_map -logfile rtl2map.log > ../lec/rtl2fvmap1.tcl

# ---- Lab 8 Task 2.4: connect scan chains after mapping ----
check_dft_rules
connect_scan_chains -auto_create_chains

syn_opt

report_qor > ${REPORTS_PATH}/${DESIGN}_qor.rpt
report_area > ${REPORTS_PATH}/${DESIGN}_area.rpt
report_gates > ${REPORTS_PATH}/${DESIGN}_gates.rpt
report_timing > ${REPORTS_PATH}/${DESIGN}_timing.rpt
report_power > ${REPORTS_PATH}/${DESIGN}_power.rpt

# ---- Lab 8 Task 2.5: scan reports ----
check_dft_rules
report_scan_chains > ${REPORTS_PATH}/${DESIGN}_scan_chains.rpt
report_scan_setup > ${REPORTS_PATH}/${DESIGN}_scan_setup_aft.rpt
report_scan_chains -summary > ${REPORTS_PATH}/${DESIGN}_scan_chain_summary.rpt
report_scan_registers -lockup > ${REPORTS_PATH}/${DESIGN}_scan_registers.rpt

write_sdc $design_name > ${design_name}.merged_sdc
write_netlist > $design_name.vg
write_do_lec -golden fv_map -revised $design_name.vg -logfile fvmap2final.log > ../lec/fvmap2final1.tcl
write_dft_atpg -directory ${DESIGN}_atpg -library ./include_libraries.v
