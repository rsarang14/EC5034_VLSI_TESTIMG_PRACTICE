
module ram_256x16_test (
    a,
    din,
    dout,
    oe,
    wr,
    test_mode
    , BIST_SETUP, mcp_bounding_to_en, scan_to_en, memory_bypass_to_en, 
    MEM0_BIST_COLLAR_SI, BIST_SO, BIST_GO, BIST_COLLAR_DIAG_EN, ltest_to_en, 
    BIST_WRITEENABLE, BIST_SELECT, BIST_CMP, INCLUDE_MEM_RESULTS_REG, 
    BIST_COL_ADD, BIST_ROW_ADD, BIST_COLLAR_EN0, BIST_RUN_TO_COLLAR0, 
    BIST_ASYNC_RESET, to_interfaces_tck, BIST_TESTDATA_SELECT_TO_COLLAR, 
    BIST_ON_TO_COLLAR, BIST_WRITE_DATA, BIST_EXPECT_DATA, CHKBCI_PHASE, 
    BIST_SHIFT_COLLAR, BIST_COLLAR_SETUP, BIST_CLEAR_DEFAULT, BIST_CLEAR, 
    BIST_COLLAR_HOLD, FREEZE_STOP_ERROR, ERROR_CNT_ZERO, 
    MBISTPG_RESET_REG_SETUP2) ;


/*
 *
 *  @(#) ram_128x16.v 15.4@(#)
 *  4/24/96  21:03:42
 *
 */

/*
 * Behavioral module for a RAM
 *   stolen from somewhere...
 *   15apr93mai
 */

    parameter
    addrsize = 8,           // number of address bits
    datasize = 16,          // number of data bits
    words = 128,            // total number of words in ram
    addrs = addrsize - 1,
    data = datasize - 1,
    wordLen = words - 1;

    input [addrs:0] a;      // address bus inputs
    input [data:0] din;     // input data bus
    output [data:0] dout;   // output data bus
    input wr;               // write strobe
    input oe;               // output enable strobe
    input test_mode;
    input BIST_SETUP, mcp_bounding_to_en, scan_to_en, memory_bypass_to_en, 
          MEM0_BIST_COLLAR_SI, BIST_COLLAR_DIAG_EN, ltest_to_en, 
          BIST_WRITEENABLE, BIST_SELECT, BIST_CMP, INCLUDE_MEM_RESULTS_REG, 
          BIST_COLLAR_EN0, BIST_RUN_TO_COLLAR0, BIST_ASYNC_RESET, 
          to_interfaces_tck, BIST_TESTDATA_SELECT_TO_COLLAR, BIST_ON_TO_COLLAR, 
          CHKBCI_PHASE, BIST_SHIFT_COLLAR, BIST_COLLAR_SETUP, 
          BIST_CLEAR_DEFAULT, BIST_CLEAR, BIST_COLLAR_HOLD, FREEZE_STOP_ERROR, 
          ERROR_CNT_ZERO, MBISTPG_RESET_REG_SETUP2;
    wire BIST_SETUP, mcp_bounding_to_en, scan_to_en, memory_bypass_to_en, 
         MEM0_BIST_COLLAR_SI, BIST_COLLAR_DIAG_EN, ltest_to_en, 
         BIST_WRITEENABLE, BIST_SELECT, BIST_CMP, INCLUDE_MEM_RESULTS_REG, 
         BIST_COLLAR_EN0, BIST_RUN_TO_COLLAR0, BIST_ASYNC_RESET, 
         to_interfaces_tck, BIST_TESTDATA_SELECT_TO_COLLAR, BIST_ON_TO_COLLAR, 
         CHKBCI_PHASE, BIST_SHIFT_COLLAR, BIST_COLLAR_SETUP, 
         BIST_CLEAR_DEFAULT, BIST_CLEAR, BIST_COLLAR_HOLD, FREEZE_STOP_ERROR, 
         ERROR_CNT_ZERO, MBISTPG_RESET_REG_SETUP2;
    output BIST_SO, BIST_GO;
    wire BIST_SO, BIST_GO;
    input [3:0] BIST_COL_ADD, BIST_ROW_ADD;
    wire [3:0] BIST_COL_ADD, BIST_ROW_ADD;
    input [1:0] BIST_WRITE_DATA, BIST_EXPECT_DATA;
    wire [1:0] BIST_WRITE_DATA, BIST_EXPECT_DATA;


    wire [data:0] ramout ;   // testable dout pins

  wire [7:0] RAM_256x16_INST_interface_inst_A;
  wire WEN, CEN;
  wire [15:0] RAM_256x16_INST_interface_inst_D, RAM_256x16_INST_Q;

assign #2 dout = test_mode ? din : ramout ;


ram_256x16A RAM_256x16_INST(
        .A(RAM_256x16_INST_interface_inst_A),
        .D(RAM_256x16_INST_interface_inst_D),
        .Q(RAM_256x16_INST_Q),
        .CLK(wr),
	.WEN(WEN),
	.CEN(CEN)
);


  dtmf_recvr_core_rtl1_tessent_mbist_c2_interface_m1 RAM_256x16_INST_interface_inst(
      .WEN_IN(1'b0), .CEN_IN(1'b0), .A_IN(a[7:0]), .D_IN(din[15:0]), .Q_IN(RAM_256x16_INST_Q), 
      .TCK(to_interfaces_tck), .BIST_CMP(BIST_CMP), .INCLUDE_MEM_RESULTS_REG(INCLUDE_MEM_RESULTS_REG), 
      .BIST_WRITEENABLE(BIST_WRITEENABLE), .BIST_SELECT(BIST_SELECT), .BIST_COL_ADD(BIST_COL_ADD[3:0]), 
      .BIST_ROW_ADD(BIST_ROW_ADD[3:0]), .BIST_WRITE_DATA(BIST_WRITE_DATA[1:0]), 
      .CHKBCI_PHASE(CHKBCI_PHASE), .BIST_TESTDATA_SELECT_TO_COLLAR(BIST_TESTDATA_SELECT_TO_COLLAR), 
      .MEM_BYPASS_EN(memory_bypass_to_en), .SCAN_SHIFT_EN(scan_to_en), .MCP_BOUNDING_EN(mcp_bounding_to_en), 
      .BIST_ON(BIST_ON_TO_COLLAR), .BIST_RUN(BIST_RUN_TO_COLLAR0), .BIST_ASYNC_RESETN(BIST_ASYNC_RESET), 
      .BIST_CLK(wr), .BIST_SHIFT_COLLAR(BIST_SHIFT_COLLAR), .BIST_EXPECT_DATA(BIST_EXPECT_DATA[1:0]), 
      .BIST_SI(MEM0_BIST_COLLAR_SI), .BIST_COLLAR_SETUP(BIST_COLLAR_SETUP), .BIST_COLLAR_HOLD(BIST_COLLAR_HOLD), 
      .BIST_DIAG_EN(BIST_COLLAR_DIAG_EN), .BIST_CLEAR_DEFAULT(BIST_CLEAR_DEFAULT), 
      .BIST_CLEAR(BIST_CLEAR), .BIST_SETUP0(BIST_SETUP), .LV_TM(ltest_to_en), .FREEZE_STOP_ERROR(FREEZE_STOP_ERROR), 
      .BIST_COLLAR_EN(BIST_COLLAR_EN0), .RESET_REG_SETUP2(MBISTPG_RESET_REG_SETUP2), 
      .ERROR_CNT_ZERO(ERROR_CNT_ZERO), .WEN(WEN), .CEN(CEN), .A(RAM_256x16_INST_interface_inst_A), 
      .D(RAM_256x16_INST_interface_inst_D), .Q(ramout[15:0]), .SCAN_OBS_FLOPS(), 
      .BIST_SO(BIST_SO), .BIST_GO(BIST_GO)
  );
endmodule // ram_128x16_test
