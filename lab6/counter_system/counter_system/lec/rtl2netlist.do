add notranslate modules SYNC_1RW_256x16 SYNC_1RW_64Kx8 -library -both

set log file rtl2netlist_lec.log -replace

read library ../../library/standard_cells/liberty/adk.lib -liberty -both

read design -file ../mbist/mbist_file_list ../../library/memories/SYNC_1RW_256x16.v_interface ../../library/memories/SYNC_1RW_64Kx8.v_interface -verilog -golden

read design ../synth/counter_system.vg ../../library/memories/SYNC_1RW_256x16.v_interface ../../library/memories/SYNC_1RW_64Kx8.v_interface -verilog -revised

set system mode lec
add compared point -all
compare
