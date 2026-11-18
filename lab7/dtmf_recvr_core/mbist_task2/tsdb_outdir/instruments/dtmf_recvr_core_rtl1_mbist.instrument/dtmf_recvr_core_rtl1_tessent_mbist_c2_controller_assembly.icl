//-------------------------------------------------
//  File created by: Tessent Shell
//          Version: 2022.4
//       Created on: Tue Nov 17 18:36:41 IST 2026
//-------------------------------------------------


Module dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_assembly {
   // Created by ICL extraction
   DataOutPort BIST_DONE {
      Source dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst.MBISTPG_DONE;
      Attribute tessent_use_in_dft_specification = "false";
   }
   DataOutPort BIST_GO {
      Source dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst.MBISTPG_GO;
      Attribute tessent_use_in_dft_specification = "false";
   }
   DataInPort LV_TM {
      DefaultLoadValue 1'b0;
      Attribute tessent_timing = "scan_reconfiguration";
      Attribute connection_rule_option = "allowed_tied_low";
      Attribute tessent_use_in_dft_specification = "false";
   }
   CaptureEnPort capture_en;
   ClockPort clk_m_dsram_clk {
      Attribute tessent_clock_domain_labels = "clk_m_dsram_clk clk_m_dsram_clk";
      Attribute tessent_clock_periods = "all 16.00ns";
   }
   SelectPort ijtag_select;
   ResetPort reset {
      ActivePolarity 0;
   }
   ShiftEnPort shift_en;
   ScanInPort si;
   ScanOutPort so {
      Source dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.so;
   }
   TCKPort tck;
   UpdateEnPort update_en;
   ScanInterface C0 {
      Port si;
      Port so;
      Port ijtag_select;
      Port shift_en;
      Port capture_en;
      Port update_en;
      Port reset;
      Port tck;
   }
   Attribute tessent_design_format = "verilog_2001";
   Attribute test_setup_procfile = "";
   Attribute forced_low_input_port_list = "{MCP_BOUNDING_EN} {MEM_BYPASS_EN}";
   Attribute icl_extraction_date = "Tue Nov 17 18:36:41 IST 2026";
   Attribute created_by_tessent_icl_extract = "true";
   Attribute tessent_design_id = "rtl";
   Instance dtmf_recvr_core_rtl1_tessent_mbist_bap_inst Of 
       dtmf_recvr_core_rtl1_tessent_mbist_bap {
      InputPort reset = reset;
      InputPort ijtag_select = ijtag_select;
      InputPort si = si;
      InputPort capture_en = capture_en;
      InputPort shift_en = shift_en;
      InputPort update_en = update_en;
      InputPort tck = tck;
      InputPort memory_bypass_en = 'b0;
      InputPort mcp_bounding_en = 'b0;
      InputPort ltest_en = LV_TM;
      InputPort fromBist[3] = 'b0;
      InputPort fromBist[2] = 'b0;
      InputPort fromBist[1] = 
          dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst.MBISTPG_SO;
      InputPort fromBist[0] = 'b0;
      InputPort MBISTPG_GO[3] = 'bx;
      InputPort MBISTPG_GO[2] = 'bx;
      InputPort MBISTPG_GO[1] = 
          dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst.MBISTPG_GO;
      InputPort MBISTPG_GO[0] = 'bx;
      InputPort MBISTPG_DONE[3] = 'bx;
      InputPort MBISTPG_DONE[2] = 'bx;
      InputPort MBISTPG_DONE[1] = 
          dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst.MBISTPG_DONE;
      InputPort MBISTPG_DONE[0] = 'bx;
      Attribute tessent_design_instance = 
          "dtmf_recvr_core_rtl1_tessent_mbist_bap_inst";
   }
   Instance dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst Of 
       dtmf_recvr_core_rtl1_tessent_mbist_c2_controller {
      InputPort BIST_CLK = clk_m_dsram_clk;
      InputPort MBISTPG_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.bistEn[1];
      InputPort LV_TM = dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.ltest_to_en;
      InputPort MEM_BYPASS_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.memory_bypass_to_en;
      InputPort MCP_BOUNDING_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.mcp_bounding_to_en;
      InputPort MBISTPG_ASYNC_RESETN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_ASYNC_RESET;
      InputPort MBISTPG_DIAG_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_DIAG_EN;
      InputPort BIST_SETUP2 = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SETUP[2];
      InputPort BIST_SETUP[1] = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SETUP[1];
      InputPort BIST_SETUP[0] = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SETUP[0];
      InputPort MBISTPG_REDUCED_ADDR_CNT_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.REDUCED_ADDRESS_COUNT;
      InputPort MBISTPG_MEM_RST = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.ENABLE_MEM_RESET;
      InputPort MBISTPG_TESTDATA_SELECT = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SELECT_TEST_DATA;
      InputPort FL_CNT_MODE[1] = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.FL_CNT_MODE1;
      InputPort FL_CNT_MODE[0] = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.FL_CNT_MODE0;
      InputPort MBISTPG_ALGO_MODE[1] = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_ALGO_MODE1;
      InputPort MBISTPG_ALGO_MODE[0] = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_ALGO_MODE0;
      InputPort TCK = tck;
      InputPort BIST_SI = dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.toBist[1];
      InputPort BIST_HOLD = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_HOLD;
      InputPort MEM0_BIST_COLLAR_SO = m1_interface_instance.BIST_SO;
      Attribute tessent_design_instance = 
          "dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst";
   }
   Instance m1_inst Of ram_256x16A {
      InputPort A[7] = m1_interface_instance.A[7];
      InputPort A[6] = m1_interface_instance.A[6];
      InputPort A[5] = m1_interface_instance.A[5];
      InputPort A[4] = m1_interface_instance.A[4];
      InputPort A[3] = m1_interface_instance.A[3];
      InputPort A[2] = m1_interface_instance.A[2];
      InputPort A[1] = m1_interface_instance.A[1];
      InputPort A[0] = m1_interface_instance.A[0];
      InputPort CLK = clk_m_dsram_clk;
      Attribute tessent_design_instance = "m1_inst";
   }
   Instance m1_interface_instance Of 
       dtmf_recvr_core_rtl1_tessent_mbist_c2_interface_m1 {
      InputPort BIST_CLK = clk_m_dsram_clk;
      InputPort BIST_COLLAR_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst.BIST_COLLAR_EN0;
      InputPort BIST_ASYNC_RESETN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_ASYNC_RESET;
      InputPort BIST_SI = 
          dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst.MEM0_BIST_COLLAR_SI;

      InputPort BIST_SHIFT_COLLAR = 
          dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst.BIST_SHIFT_COLLAR;

      InputPort BIST_SETUP0 = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SETUP[0];
      InputPort MEM_BYPASS_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.memory_bypass_to_en;
      InputPort MCP_BOUNDING_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.mcp_bounding_to_en;
      InputPort INCLUDE_MEM_RESULTS_REG = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.INCLUDE_MEM_RESULTS_REG;
      Attribute tessent_design_instance = "m1_interface_instance";
   }
}

// instanced as dtmf_recvr_core_rtl1_tessent_mbist_c1_controller_assembly.dtmf_recvr_core_rtl1_tessent_mbist_bap_inst
// instanced as dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_assembly.dtmf_recvr_core_rtl1_tessent_mbist_bap_inst
Module dtmf_recvr_core_rtl1_tessent_mbist_bap {
   // ICL module read from source on or near line 17 of file '/home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist_task2/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/dtmf_recvr_core_rtl1_tessent_mbist_bap.icl'
   ResetPort reset {
      ActivePolarity 0;
   }
   SelectPort ijtag_select;
   ScanInPort si;
   CaptureEnPort capture_en;
   ShiftEnPort shift_en;
   ToShiftEnPort BIST_HOLD {
      Attribute connection_rule_option = "allowed_no_destination";
   }
   UpdateEnPort update_en;
   TCKPort tck;
   DataInPort memory_bypass_en {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataOutPort memory_bypass_to_en {
      Source memory_bypass_en;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataInPort mcp_bounding_en {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataOutPort mcp_bounding_to_en {
      Source mcp_bounding_en;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataInPort ltest_en {
      DefaultLoadValue 1'b0;
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataOutPort ltest_to_en {
      Source ltest_en;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   ScanOutPort so {
      Source ctl_group_sib;
   }
   ScanOutPort toBist[3:0] {
      Source toBist_int;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   ScanInPort fromBist[3:0] {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort MBISTPG_GO[3:0] {
      Attribute connection_rule_option = "allowed_no_source";
   }
   DataInPort MBISTPG_DONE[3:0] {
      Attribute connection_rule_option = "allowed_no_source";
   }
   DataOutPort bistEn[3:0] {
      Source bistEn_int[3:0];
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort ENABLE_MEM_RESET {
      Source ENABLE_MEM_RESET_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort REDUCED_ADDRESS_COUNT {
      Source REDUCED_ADDRESS_COUNT_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort BIST_SELECT_TEST_DATA {
      Source BIST_SELECT_TEST_DATA_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort BIST_ALGO_MODE0 {
      Source BIST_ALGO_MODE0_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort BIST_ALGO_MODE1 {
      Source BIST_ALGO_MODE1_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort BIST_DIAG_EN {
      Source BIST_DIAG_EN_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort BIST_ASYNC_RESET {
      Source BIST_ASYNC_RESET_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort FL_CNT_MODE0 {
      Source FL_CNT_MODE0_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort FL_CNT_MODE1 {
      Source FL_CNT_MODE1_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort INCLUDE_MEM_RESULTS_REG {
      Source INCLUDE_MEM_RESULTS_REG_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort CHAIN_BYPASS_EN {
      Source CHAIN_BYPASS_EN_tdr;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort TCK_MODE {
      Source TCK_MODE_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort BIST_SETUP[2:0] {
      Source BIST_SETUP_tdr[2:0];
      Attribute connection_rule_option = "allowed_no_destination";
   }
   ScanInterface client {
      Port si;
      Port so;
      Port ijtag_select;
   }
   ScanInterface host_3 {
      Port toBist[3];
      Port fromBist[3];
      Port BIST_HOLD;
   }
   ScanInterface host_2 {
      Port toBist[2];
      Port fromBist[2];
      Port BIST_HOLD;
   }
   ScanInterface host_1 {
      Port toBist[1];
      Port fromBist[1];
      Port BIST_HOLD;
   }
   ScanInterface host_0 {
      Port toBist[0];
      Port fromBist[0];
      Port BIST_HOLD;
   }
   Attribute ijtag_logical_connection = 
       "{tck to_interfaces_tck} {tck to_controllers_tck}";
   Attribute keep_active_during_scan_test = "false";
   Attribute tessent_use_in_dft_specification = "false";
   Attribute tessent_instrument_type = "mentor::memory_bist";
   Attribute tessent_instrument_subtype = "bist_access_port";
   Attribute tessent_signature = "15cbca1b2efbe7b9fba7c02262c9cbdf";
   Alias tdr[14:0] = BIST_SETUP_tdr[2:0], TCK_MODE_tdr, CHAIN_BYPASS_EN_tdr, 
       INCLUDE_MEM_RESULTS_REG_tdr, FL_CNT_MODE1_tdr, FL_CNT_MODE0_tdr, 
       BIST_ASYNC_RESET_tdr, BIST_DIAG_EN_tdr, BIST_ALGO_MODE1_tdr, 
       BIST_ALGO_MODE0_tdr, BIST_SELECT_TEST_DATA_tdr, REDUCED_ADDRESS_COUNT_tdr,
       ENABLE_MEM_RESET_tdr {
      RefEnum tdr_symbols;
   }
   Alias ChainBypassMode = CHAIN_BYPASS_EN_tdr {
   }
   Alias bistEn_int[3:0] = mbist_go_3, mbist_go_2, mbist_go_1, mbist_go_0 {
   }
   Alias toBist_int[3:0] = tdr_bypass_sib_inst, mbist_go_3, mbist_go_2, 
       mbist_go_1 {
   }
   Enum OnOff {
      ON = 1'b1;
      OFF = 1'b0;
   }
   Enum tdr_symbols {
      idle = 15'b000010001000100;
      ignore = 15'bxxxxxxxxxxxxxxx;
      mbist_async_reset = 15'b000010000000000;
   }
   ScanRegister BIST_SETUP_tdr[2:0] {
      ScanInSource si;
      CaptureSource BIST_SETUP_tdr[2], BIST_SETUP_tdr[1], BIST_SETUP_tdr[0];
      DefaultLoadValue 3'b000;
      ResetValue 3'b000;
   }
   ScanRegister TCK_MODE_tdr {
      ScanInSource BIST_SETUP_tdr[0];
      CaptureSource TCK_MODE_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister CHAIN_BYPASS_EN_tdr {
      ScanInSource TCK_MODE_tdr;
      CaptureSource CHAIN_BYPASS_EN_tdr;
      DefaultLoadValue 1'b1;
      ResetValue 1'b1;
   }
   ScanRegister INCLUDE_MEM_RESULTS_REG_tdr {
      ScanInSource CHAIN_BYPASS_EN_tdr;
      CaptureSource INCLUDE_MEM_RESULTS_REG_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister FL_CNT_MODE1_tdr {
      ScanInSource INCLUDE_MEM_RESULTS_REG_tdr;
      CaptureSource FL_CNT_MODE1_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister FL_CNT_MODE0_tdr {
      ScanInSource FL_CNT_MODE1_tdr;
      CaptureSource FL_CNT_MODE0_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister BIST_ASYNC_RESET_tdr {
      ScanInSource FL_CNT_MODE0_tdr;
      CaptureSource BIST_ASYNC_RESET_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister BIST_DIAG_EN_tdr {
      ScanInSource BIST_ASYNC_RESET_tdr;
      CaptureSource BIST_DIAG_EN_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister BIST_ALGO_MODE1_tdr {
      ScanInSource BIST_DIAG_EN_tdr;
      CaptureSource BIST_ALGO_MODE1_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister BIST_ALGO_MODE0_tdr {
      ScanInSource BIST_ALGO_MODE1_tdr;
      CaptureSource BIST_ALGO_MODE0_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister BIST_SELECT_TEST_DATA_tdr {
      ScanInSource BIST_ALGO_MODE0_tdr;
      CaptureSource BIST_SELECT_TEST_DATA_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister REDUCED_ADDRESS_COUNT_tdr {
      ScanInSource BIST_SELECT_TEST_DATA_tdr;
      CaptureSource REDUCED_ADDRESS_COUNT_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister ENABLE_MEM_RESET_tdr {
      ScanInSource REDUCED_ADDRESS_COUNT_tdr;
      CaptureSource ENABLE_MEM_RESET_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister tdr_bypass_sib_inst {
      ScanInSource tdr_bypass_sib_mux_inst;
      CaptureSource 1'b0;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister mbist_done_3 {
      ScanInSource fromBistMux_3;
      CaptureSource MBISTPG_DONE[3];
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister mbist_go_3 {
      ScanInSource mbist_done_3;
      CaptureSource MBISTPG_GO[3];
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister mbist_done_2 {
      ScanInSource fromBistMux_2;
      CaptureSource MBISTPG_DONE[2];
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister mbist_go_2 {
      ScanInSource mbist_done_2;
      CaptureSource MBISTPG_GO[2];
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister mbist_done_1 {
      ScanInSource fromBistMux_1;
      CaptureSource MBISTPG_DONE[1];
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister mbist_go_1 {
      ScanInSource mbist_done_1;
      CaptureSource MBISTPG_GO[1];
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister mbist_done_0 {
      ScanInSource fromBistMux_0;
      CaptureSource MBISTPG_DONE[0];
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister mbist_go_0 {
      ScanInSource mbist_done_0;
      CaptureSource MBISTPG_GO[0];
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister ctl_group_sib {
      ScanInSource ctl_sib_mux_inst;
      CaptureSource 1'b0;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanMux tdr_bypass_sib_mux_inst SelectedBy tdr_bypass_sib_inst {
      1'b0 : si;
      1'b1 : ENABLE_MEM_RESET_tdr;
   }
   ScanMux fromBistMux_3 SelectedBy bistEn_int[3], BIST_SETUP_tdr[1], 
       ChainBypassMode {
      3'b100 : fromBist[3];
      3'bxxx : tdr_bypass_sib_inst;
   }
   ScanMux fromBistMux_2 SelectedBy bistEn_int[2], BIST_SETUP_tdr[1], 
       ChainBypassMode {
      3'b100 : fromBist[2];
      3'bxxx : mbist_go_3;
   }
   ScanMux fromBistMux_1 SelectedBy bistEn_int[1], BIST_SETUP_tdr[1], 
       ChainBypassMode {
      3'b100 : fromBist[1];
      3'bxxx : mbist_go_2;
   }
   ScanMux fromBistMux_0 SelectedBy bistEn_int[0], BIST_SETUP_tdr[1], 
       ChainBypassMode {
      3'b100 : fromBist[0];
      3'bxxx : mbist_go_1;
   }
   ScanMux ctl_sib_mux_inst SelectedBy ctl_group_sib {
      1'b0 : tdr_bypass_sib_inst;
      1'b1 : mbist_go_0;
   }
}

// instanced as dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_assembly.dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst
Module dtmf_recvr_core_rtl1_tessent_mbist_c2_controller {
   // ICL module read from source on or near line 26 of file '/home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist_task2/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/dtmf_recvr_core_rtl1_tessent_mbist_c2_controller.icl'
   ClockPort BIST_CLK;
   DataInPort MBISTPG_EN;
   DataInPort LV_TM {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort MEM_BYPASS_EN {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort MCP_BOUNDING_EN {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort MBISTPG_ASYNC_RESETN {
      RefEnum AsyncResetN;
   }
   DataInPort MBISTPG_DIAG_EN;
   DataInPort BIST_SETUP2;
   DataInPort BIST_SETUP[1:0];
   DataInPort MBISTPG_REDUCED_ADDR_CNT_EN {
      RefEnum OnOff;
   }
   DataInPort MBISTPG_MEM_RST {
      RefEnum OnOff;
   }
   DataInPort MBISTPG_TESTDATA_SELECT {
      RefEnum OnOff;
   }
   DataInPort FL_CNT_MODE[1:0];
   DataInPort MBISTPG_ALGO_MODE[1:0];
   DataOutPort MBISTPG_GO {
      RefEnum PassFail;
   }
   DataOutPort MBISTPG_DONE {
      RefEnum PassFail;
   }
   TCKPort TCK;
   ScanInPort BIST_SI;
   ScanOutPort MBISTPG_SO {
      Source BIST_SO_INT;
   }
   ShiftEnPort BIST_HOLD;
   ToShiftEnPort BIST_SHIFT_COLLAR {
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort BIST_COLLAR_EN0 {
      Attribute tessent_memory_alias = "m1";
   }
   ScanOutPort MEM0_BIST_COLLAR_SI {
      Source MEM0_BIST_COLLAR_SI_INT;
   }
   ScanInPort MEM0_BIST_COLLAR_SO;
   ScanInterface Client {
      Port BIST_SI;
      Port MBISTPG_SO;
      Port BIST_HOLD;
   }
   ScanInterface MEM0_INTERFACE {
      Port BIST_SHIFT_COLLAR;
      Port MEM0_BIST_COLLAR_SI;
      Port MEM0_BIST_COLLAR_SO;
   }
   Attribute tessent_instrument_container = "dtmf_recvr_core_rtl1_mbist";
   Attribute tessent_instrument_type = "mentor::memory_bist";
   Attribute tessent_instrument_subtype = "controller";
   Attribute tessent_signature = "8a980ba2f423e6fd67427e611839140a";
   Attribute tessent_ignore_during_icl_verification = "on";
   Attribute keep_active_during_scan_test = "false";
   Attribute tessent_use_in_dft_specification = "false";
   Attribute tessent_bist_clk_persistent_cell_output_list = 
       "tessent_persistent_cell_GATING_BIST_CLK/GCK";
   Alias SETUP_MODE[2:0] = BIST_SETUP2, BIST_SETUP[1:0] {
      RefEnum SetupModes;
   }
   Alias RUN_MODE[2:0] = BIST_SETUP2, BIST_SETUP[1:0] {
      RefEnum RunModes;
   }
   Alias INST_POINTER_REG[5:0] = INST_POINTER_REG_HW[5:0] {
   }
   Alias A_ADD_REG_Y[3:0] = A_ADD_REG_Y_HW[3:0] {
   }
   Alias A_ADD_REG_X[3:0] = A_ADD_REG_X_HW[3:0] {
   }
   Alias B_ADD_REG_Y[3:0] = B_ADD_REG_Y_HW[3:0] {
   }
   Alias B_ADD_REG_X[3:0] = B_ADD_REG_X_HW[3:0] {
   }
   Alias JCNT[2:0] = JCNT_HW[2:0] {
   }
   Alias WDATA_REG[1:0] = WDATA_REG_HW[1:0] {
   }
   Alias EDATA_REG[1:0] = EDATA_REG_HW[1:0] {
   }
   Alias REPEATLOOP_A_CNTR_REG[1:0] = REPEATLOOP_A_CNTR_REG_HW[1:0] {
   }
   Alias REPEATLOOP_B_CNTR_REG[1:0] = REPEATLOOP_B_CNTR_REG_HW[1:0] {
   }
   Alias MEM0_BIST_COLLAR_SI_INT = REPEATLOOP_B_CNTR_REG_HW[1] {
   }
   Alias STOP_ERROR_CNT_REG[11:0] = STOP_ERROR_CNT_REG_HW[11:0] {
   }
   Alias BIST_SO_INT = BIST_SO_Pipeline {
   }
   Enum PassFail {
      Pass = 1'b1;
      Fail = 1'b0;
      Ignore = 1'bx;
   }
   Enum AsyncResetN {
      On = 1'b0;
      Off = 1'b1;
   }
   Enum SetupModes {
      Short = 3'b000;
      Long = 3'b001;
   }
   Enum OnOff {
      On = 1'b1;
      Off = 1'b0;
   }
   Enum RunModes {
      HWDefault = 3'b010;
      RunTimeProg = 3'b011;
      Idle = 3'bx0x;
      Off = 3'bxxx;
   }
   ScanRegister BIST_SI_Pipeline {
      ScanInSource BIST_SI;
      ResetValue 1'b0;
   }
   ScanRegister DIAG_EN_REG[0:0] {
      ScanInSource BIST_SI_Pipeline;
   }
   ScanRegister CMP_EN_MASK_EN[0:0] {
      ScanInSource DIAG_EN_REG[0];
   }
   ScanRegister CMP_EN_PARITY[0:0] {
      ScanInSource CMP_EN_MASK_EN[0];
      CaptureSource 1'bx;
   }
   ScanRegister MEM_SELECT_REG0[0:0] {
      ScanInSource CMP_EN_PARITY[0];
      ResetValue 1'd1;
   }
   ScanRegister REDUCED_ADDR_CNT_EN_REG[0:0] {
      ScanInSource MEM_SELECT_REG0[0];
      RefEnum OnOff;
   }
   ScanRegister ALGO_SEL_CNT_REG[0:0] {
      ScanInSource REDUCED_ADDR_CNT_EN_REG[0];
      RefEnum OnOff;
   }
   ScanRegister SELECT_COMMON_OPSET_REG[0:0] {
      ScanInSource ALGO_SEL_CNT_REG[0];
      RefEnum OnOff;
   }
   ScanRegister SELECT_COMMON_DATA_PAT_REG[0:0] {
      ScanInSource SELECT_COMMON_OPSET_REG[0];
      RefEnum OnOff;
   }
   ScanRegister MICROCODE_EN_REG[0:0] {
      ScanInSource SELECT_COMMON_DATA_PAT_REG[0];
   }
   ScanRegister INST_POINTER_REG_HW[0:5] {
      ScanInSource MICROCODE_EN_REG[0];
   }
   ScanRegister A_ADD_REG_Y_HW[0:3] {
      ScanInSource INST_POINTER_REG_HW[5];
   }
   ScanRegister A_ADD_REG_X_HW[0:3] {
      ScanInSource A_ADD_REG_Y_HW[3];
   }
   ScanRegister B_ADD_REG_Y_HW[0:3] {
      ScanInSource A_ADD_REG_X_HW[3];
   }
   ScanRegister B_ADD_REG_X_HW[0:3] {
      ScanInSource B_ADD_REG_Y_HW[3];
   }
   ScanRegister JCNT_HW[0:2] {
      ScanInSource B_ADD_REG_X_HW[3];
   }
   ScanRegister OPSET_SELECT_REG[0:0] {
      ScanInSource JCNT_HW[2];
   }
   ScanRegister WDATA_REG_HW[0:1] {
      ScanInSource OPSET_SELECT_REG[0];
   }
   ScanRegister EDATA_REG_HW[0:1] {
      ScanInSource WDATA_REG_HW[1];
   }
   ScanRegister X_ADDR_BIT_SEL_REG[0:0] {
      ScanInSource EDATA_REG_HW[1];
   }
   ScanRegister Y_ADDR_BIT_SEL_REG[0:0] {
      ScanInSource X_ADDR_BIT_SEL_REG[0];
   }
   ScanRegister REPEATLOOP_A_CNTR_REG_HW[0:1] {
      ScanInSource Y_ADDR_BIT_SEL_REG[0];
   }
   ScanRegister REPEATLOOP_B_CNTR_REG_HW[0:1] {
      ScanInSource REPEATLOOP_A_CNTR_REG_HW[1];
   }
   ScanRegister STOP_ON_ERROR_REG[0:0] {
      ScanInSource MEM0_BIST_COLLAR_SO;
   }
   ScanRegister FREEZE_STOP_ERROR_REG[0:0] {
      ScanInSource STOP_ON_ERROR_REG[0];
   }
   ScanRegister STOP_ERROR_CNT_REG_HW[0:11] {
      ScanInSource FREEZE_STOP_ERROR_REG[0];
   }
   ScanRegister BIST_SO_Pipeline {
      ScanInSource BIST_SO_OUT;
      ResetValue 1'b0;
   }
   ScanMux CONTROLLER_SETUP_CHAIN SelectedBy MBISTPG_EN, SETUP_MODE[2:0] {
      1'b1, 3'b00x : STOP_ERROR_CNT_REG_HW[11];
   }
   ScanMux BIST_SO_OUT SelectedBy LV_TM, MBISTPG_ASYNC_RESETN {
      2'b01 : CONTROLLER_SETUP_CHAIN;
   }
   LogicSignal LONG_SETUP {
      MBISTPG_EN, SETUP_MODE[2:0] == 1'b1, 3'b001;
   }
   LogicSignal SHORT_SETUP {
      MBISTPG_EN, SETUP_MODE[2:0] == 1'b1, 3'b000;
   }
}

// instanced as dtmf_recvr_core_rtl1_tessent_mbist_c1_controller_assembly.m1_inst
// instanced as dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_assembly.m1_inst
Module ram_256x16A {
   // ICL module read from source on or near line 17 of file '/home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist_task2/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/ram_256x16A.icl'
   DataInPort A[7:0] {
      Attribute connection_rule_option = "allowed_no_source";
      Attribute tessent_memory_bist_function = "address";
   }
   ClockPort CLK;
   Attribute tessent_use_in_dft_specification = "false";
   Attribute keep_active_during_scan_test = "false";
   Attribute tessent_memory_module = "without_internal_scan_logic";
}

// instanced as dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_assembly.m1_interface_instance
Module dtmf_recvr_core_rtl1_tessent_mbist_c2_interface_m1 {
   // ICL module read from source on or near line 25 of file '/home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist_task2/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/dtmf_recvr_core_rtl1_tessent_mbist_c2_interface_m1.icl'
   ClockPort BIST_CLK;
   DataInPort BIST_COLLAR_EN;
   DataInPort BIST_ASYNC_RESETN;
   ScanInPort BIST_SI;
   ScanOutPort BIST_SO {
      Source BIST_SO_INT;
   }
   ShiftEnPort BIST_SHIFT_COLLAR;
   DataInPort BIST_SETUP0;
   DataInPort MEM_BYPASS_EN {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort MCP_BOUNDING_EN {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort INCLUDE_MEM_RESULTS_REG;
   DataOutPort A[7:0] {
      Attribute connection_rule_option = "allowed_no_destination";
      Attribute tessent_memory_bist_function = "address";
   }
   Attribute tessent_instrument_type = "mentor::memory_bist";
   Attribute tessent_instrument_subtype = "memory_interface";
   Attribute tessent_signature = "b4eb696b18dd307427dfa255f2bd97a0";
   Attribute tessent_ignore_during_icl_verification = "on";
   Attribute keep_active_during_scan_test = "false";
   Attribute tessent_use_in_dft_specification = "false";
   Attribute tessent_bist_input_select_persistent_cell_output_list = 
       "tessent_persistent_cell_BIST_INPUT_SELECT_INT/Y";
   Attribute tessent_async_bypass_persistent_cell_input_list = "";
   Attribute tessent_bist_clk_persistent_cell_output_list = 
       "tessent_persistent_cell_GATING_BIST_CLK/GCK";
   Attribute tessent_memory_output_is_tristate = "false";
   Attribute tessent_memory_control_inputs_list = "CEN SELECT ACTIVELOW";
   Attribute tessent_memory_test_inputs_list = "";
   Attribute tessent_memory_test_outputs_list = "";
   Attribute tessent_memory_control_inputs_di_coverage_list = "partial";
   Alias GO_ID_REG_BYPASS_SOURCE = BIST_SI {
   }
   Alias BIST_SO_INT = FREEZE_STOP_ERROR_REG[0] {
   }
   ScanRegister GO_ID_REG[15:0] {
      ScanInSource BIST_SI;
   }
   ScanRegister FREEZE_STOP_ERROR_REG[0:0] {
      ScanInSource GO_ID_REG_BYPASS_MUX;
   }
   ScanMux GO_ID_REG_BYPASS_MUX SelectedBy INCLUDE_MEM_RESULTS_REG {
      1'b0 : GO_ID_REG_BYPASS_SOURCE;
      1'b1 : GO_ID_REG[0];
   }
}
