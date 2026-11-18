//--------------------------------------------------------------------------
//
//  Unpublished work. Copyright 2022 Siemens
//
//  This material contains trade secrets or otherwise confidential 
//  information owned by Siemens Industry Software Inc. or its affiliates 
//  (collectively, SISW), or its licensors. Access to and use of this 
//  information is strictly limited as set forth in the Customer's 
//  applicable agreements with SISW.
//
//--------------------------------------------------------------------------
//  File created by: Tessent Shell
//          Version: 2022.4
//       Created on: Sat Oct 24 02:51:42 IST 2026
//--------------------------------------------------------------------------


module dtmf_recvr_core_rtl1_tessent_mbist_c3_controller_assembly(LV_TM, MEM_BYPASS_EN, 
                                                                 SCAN_SHIFT_EN, 
                                                                 MCP_BOUNDING_EN, 
                                                                 BIST_ON, BIST_DONE, 
                                                                 BIST_GO, clk_m_clk, 
                                                                 m1_inst_Q, m1_inst_A, 
                                                                 m1_inst_CEN, reset, 
                                                                 ijtag_select, 
                                                                 si, capture_en, 
                                                                 shift_en, update_en, 
                                                                 tck, so);
  input  [8:0] m1_inst_A;
  input  LV_TM, MEM_BYPASS_EN, SCAN_SHIFT_EN, MCP_BOUNDING_EN, clk_m_clk, 
         m1_inst_CEN, reset, ijtag_select, si, capture_en, shift_en, update_en, 
         tck;
  output [15:0] m1_inst_Q;
  output BIST_ON, BIST_DONE, BIST_GO, so;

  wire [15:0] m1_inst_Q_ts1;
  wire [8:0] m1_interface_instance_A;
  wire [4:0] BIST_ROW_ADD;
  wire [3:0] BIST_COL_ADD;
  wire [2:2] toBist, bistEn;
  wire [2:1] BIST_SETUP_ts1;
  wire [1:0] tessent_filler_net, tessent_filler_net_ts1, 
             tessent_filler_net_ts2, tessent_filler_net_ts3;
  wire BIST_HOLD, BIST_SETUP, BIST_SELECT_TEST_DATA, to_controllers_tck, 
       mcp_bounding_to_en, scan_to_en, memory_bypass_to_en, ltest_to_en, 
       ENABLE_MEM_RESET, REDUCED_ADDRESS_COUNT, BIST_ASYNC_RESET, 
       MEM0_BIST_COLLAR_SI, MBISTPG_SO, BIST_SO, BIST_GO_ts1, 
       MBISTPG_COMPARE_MISR, BIST_SELECT, BIST_CMP, INCLUDE_MEM_RESULTS_REG, 
       BIST_COLLAR_EN0, BIST_RUN_TO_COLLAR0, to_interfaces_tck, 
       BIST_TESTDATA_SELECT_TO_COLLAR, BIST_SHIFT_COLLAR, BIST_COLLAR_SETUP, 
       BIST_CLEAR_DEFAULT, BIST_CLEAR, BIST_COLLAR_HOLD, CEN;

  rom_512x16A m1_inst(
      .CLK(clk_m_clk), .CEN(CEN), .A(m1_interface_instance_A), .Q(m1_inst_Q_ts1)
  );
  dtmf_recvr_core_rtl1_tessent_mbist_bap dtmf_recvr_core_rtl1_tessent_mbist_bap_inst(
      .reset(reset), .ijtag_select(ijtag_select), .si(si), .capture_en(capture_en), 
      .shift_en(shift_en), .shift_en_R(), .update_en(update_en), .tck(tck), .to_interfaces_tck(to_interfaces_tck), 
      .to_controllers_tck(to_controllers_tck), .mcp_bounding_en(MCP_BOUNDING_EN), 
      .mcp_bounding_to_en(mcp_bounding_to_en), .scan_en(SCAN_SHIFT_EN), .scan_to_en(scan_to_en), 
      .memory_bypass_en(MEM_BYPASS_EN), .memory_bypass_to_en(memory_bypass_to_en), 
      .ltest_en(LV_TM), .ltest_to_en(ltest_to_en), .BIST_HOLD(BIST_HOLD), .ENABLE_MEM_RESET(ENABLE_MEM_RESET), 
      .REDUCED_ADDRESS_COUNT(REDUCED_ADDRESS_COUNT), .BIST_SELECT_TEST_DATA(BIST_SELECT_TEST_DATA), 
      .BIST_ALGO_MODE0(), .BIST_ALGO_MODE1(), .BIST_DIAG_EN(), .BIST_ASYNC_RESET(BIST_ASYNC_RESET), 
      .FL_CNT_MODE0(), .FL_CNT_MODE1(), .INCLUDE_MEM_RESULTS_REG(INCLUDE_MEM_RESULTS_REG), 
      .CHAIN_BYPASS_EN(), .TCK_MODE(), .BIST_SETUP({BIST_SETUP_ts1[2:1], 
      BIST_SETUP}), .MBISTPG_GO({BIST_GO, tessent_filler_net}), .MBISTPG_DONE({
      BIST_DONE, tessent_filler_net_ts1}), .bistEn({bistEn, 
      tessent_filler_net_ts2}), .toBist({toBist, tessent_filler_net_ts3}), .fromBist({
      MBISTPG_SO, 1'b0, 1'b0}), .so(so)
  );
  dtmf_recvr_core_rtl1_tessent_mbist_c3_controller dtmf_recvr_core_rtl1_tessent_mbist_c3_controller_inst(
      .MBISTPG_MEM_RST(ENABLE_MEM_RESET), .MBISTPG_REDUCED_ADDR_CNT_EN(REDUCED_ADDRESS_COUNT), 
      .MEM_BYPASS_EN(memory_bypass_to_en), .MCP_BOUNDING_EN(mcp_bounding_to_en), 
      .MEM0_BIST_COLLAR_SO(BIST_SO), .BIST_COLLAR_GO(BIST_GO_ts1), .BIST_CLK(clk_m_clk), 
      .BIST_SI(toBist), .BIST_HOLD(BIST_HOLD), .BIST_SETUP2(BIST_SETUP_ts1[2]), 
      .BIST_SETUP({BIST_SETUP_ts1[1], BIST_SETUP}), .MBISTPG_TESTDATA_SELECT(BIST_SELECT_TEST_DATA), 
      .TCK(to_controllers_tck), .MBISTPG_EN(bistEn), .MBISTPG_ASYNC_RESETN(BIST_ASYNC_RESET), 
      .LV_TM(ltest_to_en), .BIST_COL_ADD(BIST_COL_ADD), .BIST_ROW_ADD(BIST_ROW_ADD), 
      .BIST_SHIFT_COLLAR(BIST_SHIFT_COLLAR), .BIST_TESTDATA_SELECT_TO_COLLAR(BIST_TESTDATA_SELECT_TO_COLLAR), 
      .MEM0_BIST_COLLAR_SI(MEM0_BIST_COLLAR_SI), .BIST_COLLAR_SETUP(BIST_COLLAR_SETUP), 
      .BIST_COLLAR_HOLD(BIST_COLLAR_HOLD), .BIST_CLEAR_DEFAULT(BIST_CLEAR_DEFAULT), 
      .BIST_CLEAR(BIST_CLEAR), .MBISTPG_COMPARE_MISR(MBISTPG_COMPARE_MISR), .MBISTPG_SO(MBISTPG_SO), 
      .BIST_SELECT(BIST_SELECT), .BIST_CMP(BIST_CMP), .BIST_COLLAR_EN0(BIST_COLLAR_EN0), 
      .BIST_RUN_TO_COLLAR0(BIST_RUN_TO_COLLAR0), .MBISTPG_GO(BIST_GO), .MBISTPG_DONE(BIST_DONE), 
      .BIST_ON_TO_COLLAR(BIST_ON)
  );
  dtmf_recvr_core_rtl1_tessent_mbist_c3_interface_m1 m1_interface_instance(
      .MBISTPG_COMPARE_MISR(MBISTPG_COMPARE_MISR), .CEN_IN(m1_inst_CEN), .A_IN(m1_inst_A[8:0]), 
      .Q_IN(m1_inst_Q_ts1), .TCK(to_interfaces_tck), .BIST_CMP(BIST_CMP), .INCLUDE_MEM_RESULTS_REG(INCLUDE_MEM_RESULTS_REG), 
      .BIST_SELECT(BIST_SELECT), .BIST_COL_ADD(BIST_COL_ADD), .BIST_ROW_ADD(BIST_ROW_ADD), 
      .BIST_TESTDATA_SELECT_TO_COLLAR(BIST_TESTDATA_SELECT_TO_COLLAR), .MEM_BYPASS_EN(memory_bypass_to_en), 
      .SCAN_SHIFT_EN(scan_to_en), .MCP_BOUNDING_EN(mcp_bounding_to_en), .BIST_ON(BIST_ON), 
      .BIST_RUN(BIST_RUN_TO_COLLAR0), .BIST_ASYNC_RESETN(BIST_ASYNC_RESET), .BIST_CLK(clk_m_clk), 
      .BIST_SHIFT_COLLAR(BIST_SHIFT_COLLAR), .BIST_SI(MEM0_BIST_COLLAR_SI), .BIST_COLLAR_SETUP(BIST_COLLAR_SETUP), 
      .BIST_COLLAR_HOLD(BIST_COLLAR_HOLD), .BIST_CLEAR_DEFAULT(BIST_CLEAR_DEFAULT), 
      .BIST_CLEAR(BIST_CLEAR), .BIST_SETUP0(BIST_SETUP), .LV_TM(ltest_to_en), .BIST_COLLAR_EN(BIST_COLLAR_EN0), 
      .CEN(CEN), .A(m1_interface_instance_A), .Q(m1_inst_Q[15:0]), .SCAN_OBS_FLOPS(), 
      .BIST_SO(BIST_SO), .BIST_GO(BIST_GO_ts1)
  );
endmodule

