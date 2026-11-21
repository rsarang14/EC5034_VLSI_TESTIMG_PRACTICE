# Genus Synthesis Script

#1. Library

set DESIGN dtmf_recvr_core
set design_name $DESIGN
set design_id rtl1
set OUT_DIR work/task1

set LIB_PATH "../../library/gsclib045 ../../library/timing_custom"
set LIB_FILE [list \
    slow_vdd1v0_basicCells_hvt.lib \
    ram_256x16A_slow_syn.lib \
    rom_512x16A_slow_syn.lib \
    pllclk_slow.lib \
]

set SDC "../constraints/constraints.sdc"

file mkdir $OUT_DIR
file mkdir $OUT_DIR/reports

suppress_messages {LBR-30 LBR-31 LBR-40 LBR-41 LBR-72 LBR-77 LBR-162}
set_db init_lib_search_path $LIB_PATH
set_db library $LIB_FILE
set_db lp_insert_clock_gating true

#===========================

#2. RTL design reading

source ../mbist/${DESIGN}.dc_design_load_script

elaborate $DESIGN

check_design -unresolved > $OUT_DIR/reports/${DESIGN}_check_design.rpt

#===========================

#3. Constraints

source $SDC

source ./mbist_postelab.tcl

#===============

#4. Stages

syn_generic

syn_map

syn_opt

#====================

#5 Reports

report_timing > $OUT_DIR/reports/${DESIGN}_timing.rpt

report_area > $OUT_DIR/reports/${DESIGN}_area.rpt

report_qor > $OUT_DIR/reports/${DESIGN}_qor.rpt

report_gates > $OUT_DIR/reports/${DESIGN}_gates.rpt

report_power > $OUT_DIR/reports/${DESIGN}_power.rpt

report_clock_gating > $OUT_DIR/reports/${DESIGN}_clock_gating.rpt

set flops [get_db insts -if {.is_flop==true}]
set fp [open $OUT_DIR/reports/${DESIGN}_flop_count.rpt w]
puts $fp "Total flip-flops : [llength $flops]"
foreach f $flops { puts $fp "[get_db $f .name]  [get_db $f .base_cell.name]" }
close $fp
puts "Total flip-flops : [llength $flops]"

#=============================

#6

write_hdl > $OUT_DIR/${DESIGN}_gates.v

write_sdc > $OUT_DIR/${DESIGN}.sdc

exit
