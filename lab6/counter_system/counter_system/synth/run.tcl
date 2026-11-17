source setup.tcl

set REPORTS_PATH "${LOCAL_DIR}/work/reports"
set design_name counter_system
set design_id rtl1
source ../mbist/${design_name}.dc_design_load_script

read_hdl ../../library/memories/SYNC_1RW_256x16.v_interface ../../library/memories/SYNC_1RW_64Kx8.v_interface
elaborate
current_design ${design_name}
check_design -unresolved

source ../constraints/constraints.sdc
source ./mbist_postelab.tcl 

set_db lp_insert_clock_gating true

syn_generic
syn_map
write_do_lec -golden rtl -revised fv_map -logfile rtl2map.log > ../lec/rtl2fvmap1.tcl

syn_opt

report_qor > ${REPORTS_PATH}/${DESIGN}_qor.rpt
report_area > ${REPORTS_PATH}/${DESIGN}_area.rpt
report_gates > ${REPORTS_PATH}/${DESIGN}_gates.rpt
report_timing > ${REPORTS_PATH}/${DESIGN}_timing.rpt
report_power > ${REPORTS_PATH}/${DESIGN}_power.rpt

write_sdc $design_name > ${design_name}.merged_sdc
write_netlist > $design_name.vg
write_do_lec -golden fv_map -revised $design_name.vg -logfile fvmap2final.log > ../lec/fvmap2final1.tcl
