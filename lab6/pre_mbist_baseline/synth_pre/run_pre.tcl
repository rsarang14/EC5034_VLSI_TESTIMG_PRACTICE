source setup.tcl

set REPORTS_PATH "${LOCAL_DIR}/work_pre/reports"
set design_name counter_system

read_hdl -language v2001 { ../rtl/updown_counter.v ../rtl/shift_register.v ../rtl/lfsr.v ../rtl/counter_system.v ../rtl/counter_shift.v ../rtl/counter_lfsr.v }
read_hdl ../../library/memories/SYNC_1RW_256x16.v_interface ../../library/memories/SYNC_1RW_64Kx8.v_interface
elaborate
current_design ${design_name}
check_design -unresolved

source ../constraints/constraints.sdc

set_db lp_insert_clock_gating true

syn_generic
syn_map
syn_opt

report_qor > ${REPORTS_PATH}/${DESIGN}_qor.rpt
report_area > ${REPORTS_PATH}/${DESIGN}_area.rpt
report_gates > ${REPORTS_PATH}/${DESIGN}_gates.rpt
report_timing > ${REPORTS_PATH}/${DESIGN}_timing.rpt
report_power > ${REPORTS_PATH}/${DESIGN}_power.rpt

write_netlist > $design_name.vg
