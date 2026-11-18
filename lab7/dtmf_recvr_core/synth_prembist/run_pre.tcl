source setup.tcl
set design_name dtmf_recvr_core
set fh [open rtl_list_pre r]
set rtl_files [split [string trim [read $fh]] "\n"]
close $fh
read_hdl -language v2001 $rtl_files
elaborate
current_design ${design_name}
check_design -unresolved
source ../constraints/constraints.sdc
syn_generic
syn_map
syn_opt
write_netlist > ${design_name}_pre.vg
write_sdc $design_name > ${design_name}_pre.merged_sdc
report_area > area.rpt
report_power > power.rpt
report_timing > timing.rpt
report_gates > gates.rpt
report_qor > qor.rpt
exit

