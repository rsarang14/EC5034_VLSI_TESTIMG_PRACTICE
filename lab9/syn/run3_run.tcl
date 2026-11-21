# Genus Synthesis Script

#1. Library

set DESIGN dtmf_recvr_core
set design_name $DESIGN
set design_id rtl1
set OUT_DIR work/task3

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

#===========================

#4. Scan configuration


set_db dft_scan_style muxed_scan
set_db dft_prefix dft_
define_shift_enable -name scan_en -active high scan_en
define_test_mode -name test_mode -active high test_mode
define_test_clock -name scan_clk scan_clk
set_db [current_design] .lp_clock_gating_test_signal use_shift_enable
add_shadow_logic -around [get_db insts -if {.base_cell.name == ram_256x16A || .base_cell.name == rom_512x16A}] -mode share -test_control test_mode -test_clock_pin scan_clk
set_db [current_design] .dft_mix_clock_edges_in_scan_chains true
set_db [current_design] .dft_min_number_of_scan_chains 6

report_scan_setup > $OUT_DIR/reports/${DESIGN}_scan_setup_bfr.rpt

check_dft_rules > $OUT_DIR/reports/${DESIGN}_dft_drc_bfr.rpt

fix_dft_violations -test_control test_mode -async_reset -async_set -clock

check_dft_rules > $OUT_DIR/reports/${DESIGN}_dft_drc_aft.rpt

#===============

#5. Stages

syn_generic

syn_map
write_do_lec -golden rtl -revised fv_map -logfile rtl2map.log > ../lec/rtl2fvmap1.tcl
fix_dft_violations -clock -test_control test_mode

check_dft_rules > $OUT_DIR/reports/${DESIGN}_dft_drc_map.rpt
convert_to_scan

connect_scan_chains -auto_create_chains

syn_opt

#====================

#6 Reports

report_scan_chains > $OUT_DIR/reports/${DESIGN}_scan_chains.rpt

report_scan_setup > $OUT_DIR/reports/${DESIGN}_scan_setup_aft.rpt

report_scan_chains -summary > $OUT_DIR/reports/${DESIGN}_scan_chain_summary.rpt

report_scan_registers -lockup > $OUT_DIR/reports/${DESIGN}_scan_registers.rpt

check_dft_rules > $OUT_DIR/reports/${DESIGN}_dft_drc_final.rpt

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

#7

write_hdl > $OUT_DIR/${DESIGN}_gates.v
write_do_lec -golden fv_map -revised $OUT_DIR/${DESIGN}_gates.v -logfile fvmap2final.log > ../lec/fvmap2final1.tcl

write_sdc > $OUT_DIR/${DESIGN}.sdc

write_scandef > $OUT_DIR/${DESIGN}.scandef

exit
