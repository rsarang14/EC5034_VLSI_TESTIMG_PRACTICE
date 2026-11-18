add notranslate modules \
	ram_256x16A rom_512x16A \
	-library -both

set log file mbist_lec.log -replace
read library ../../library/standard_cells/liberty/adk.lib -liberty -both
read design -file ../mbist/rtl_file_list ../../library/memories/ram_256x16A.v_interface ../../library/memories/rom_512x16A.v ../../library/memories/pllclk.v -verilog -golden
read design -file ../mbist/mbist_file_list ../../library/memories/ram_256x16A.v_interface ../../library/memories/rom_512x16A.v ../../library/memories/pllclk.v -verilog -revised
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
  add primary input RAM_128x16_TEST_INST/RAM_128x16_INST_interface_inst/BIST_INPUT_SELECT_reg/Q -pin -revised
  add primary input RAM_256x16_TEST_INST_1/RAM_256x16_INST_interface_inst/BIST_INPUT_SELECT_reg/Q -pin -revised
  add primary input RAM_256x16_TEST_INST_2/RAM_256x16_INST_interface_inst/BIST_INPUT_SELECT_reg/Q -pin -revised
  add primary input RAM_256x16_TEST_INST_3/RAM_256x16_INST_interface_inst/BIST_INPUT_SELECT_reg/Q -pin -revised
  add primary input ROM_512x16_0_INST_interface_inst/BIST_INPUT_SELECT_reg/Q -pin -revised
  add pin constraints 0 RAM_128x16_TEST_INST/RAM_128x16_INST_interface_inst/BIST_INPUT_SELECT_reg/Q -revised
  add pin constraints 0 RAM_256x16_TEST_INST_1/RAM_256x16_INST_interface_inst/BIST_INPUT_SELECT_reg/Q -revised
  add pin constraints 0 RAM_256x16_TEST_INST_2/RAM_256x16_INST_interface_inst/BIST_INPUT_SELECT_reg/Q -revised
  add pin constraints 0 RAM_256x16_TEST_INST_3/RAM_256x16_INST_interface_inst/BIST_INPUT_SELECT_reg/Q -revised
  add pin constraints 0 ROM_512x16_0_INST_interface_inst/BIST_INPUT_SELECT_reg/Q -revised

  add pin constraints 0 test_mode -both
  add primary input dft_ctrl_test_mode_mux2/Y -pin -revised
  add pin constraints 0 dft_ctrl_test_mode_mux2/Y -revised


set system mode lec
add compared point -all
compare
