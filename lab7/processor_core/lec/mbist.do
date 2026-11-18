add notranslate modules \
	SYNC_1RW_8Kx16 \
	-library -both

set log file mbist_lec.log -replace
read library /home/ec5002_lab/libraries/TIMING/STDCELL/ss_g_1v08_125c.lib  /home/ec5002_lab/libraries/TIMING/STDCELL/ss_hvt_1v08_125c.lib ../../library/standard_cells/liberty/adk.lib -liberty -both
read design -file ../mbist/rtl_file_list ../../library/memories/SYNC_1RW_8Kx16.v_interface -verilog -golden
read design -file ../mbist/mbist_file_list ../../library/memories/SYNC_1RW_8Kx16.v_interface -verilog -revised
add pin constraints 0 scan_enable -both
add pin constraints 0 scan_mode -both
//add pin constraints 0 ijtag_tck -revised
add pin constraints 0 ijtag_reset -revised
//add pin constraints 0 ijtag_ce -revised
//add pin constraints 0 ijtag_se -revised
//add pin constraints 0 ijtag_ue -revised
//add pin constraints 0 ijtag_sel -revised
//add pin constraints 0 ijtag_si -revised
add ignored outputs ijtag_so -revised
  //add primary input DATA_MEM_1_interface_inst/BIST_ASYNC_RESETN -pin -revised
  //add pin constraints 0 DATA_MEM_1_interface_inst/BIST_ASYNC_RESETN -revised
  //add primary input PROG_MEM_2_interface_inst/BIST_ASYNC_RESETN -pin -revised
  //add pin constraints 0 PROG_MEM_2_interface_inst/BIST_ASYNC_RESETN -revised
  add primary input DATA_MEM_1_interface_inst/BIST_INPUT_SELECT_reg/Q -pin -revised
   add primary input PROG_MEM_2_interface_inst/BIST_INPUT_SELECT_reg/Q -pin -revised
  add pin constraints 0 DATA_MEM_1_interface_inst/BIST_INPUT_SELECT_reg/Q -revised
  add pin constraints 0 PROG_MEM_2_interface_inst/BIST_INPUT_SELECT_reg/Q -revised


set system mode lec
add compared point -all
compare

