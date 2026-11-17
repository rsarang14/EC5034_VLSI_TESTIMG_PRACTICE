add notranslate modules \
	 SYNC_1RW_256x16 \
   SYNC_1RW_64Kx8 \
	-library -both

set log file mbist_lec.log -replace
read library ../../library/standard_cells/liberty/adk.lib -liberty -both
read design -file ../mbist/rtl_file_list ../../library/memories/SYNC_1RW_256x16.v_interface  ../../library/memories/SYNC_1RW_64Kx8.v_interface -verilog -golden
read design -file ../mbist/mbist_file_list ../../library/memories/SYNC_1RW_256x16.v_interface ../../library/memories/SYNC_1RW_64Kx8.v_interface -verilog -revised
add pin constraints 0 scan_enable -both
add pin constraints 0 scan_mode -both
add pin constraints 0 ijtag_reset -revised
add ignored outputs ijtag_so -revised
  add primary input u1_interface_inst/BIST_INPUT_SELECT_reg/Q -pin -revised
   add primary input u2_interface_inst/BIST_INPUT_SELECT_reg/Q -pin -revised
  add pin constraints 0 u1_interface_inst/BIST_INPUT_SELECT_reg/Q -revised
  add pin constraints 0 u2_interface_inst/BIST_INPUT_SELECT_reg/Q -revised


set system mode lec
add compared point -all
compare

