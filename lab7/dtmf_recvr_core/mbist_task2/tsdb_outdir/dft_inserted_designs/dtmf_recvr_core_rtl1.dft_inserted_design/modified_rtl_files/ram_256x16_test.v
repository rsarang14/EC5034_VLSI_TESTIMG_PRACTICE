
module ram_256x16_test (
    a,
    din,
    dout,
    oe,
    wr,
    test_mode
    , BIST_HOLD, BIST_SETUP, BIST_SETUP_ts1, BIST_SETUP_ts2, 
    BIST_SELECT_TEST_DATA, to_controllers_tck, mcp_bounding_to_en, scan_to_en, 
    memory_bypass_to_en, ltest_to_en, BIST_ALGO_MODE0, ENABLE_MEM_RESET, 
    REDUCED_ADDRESS_COUNT, BIST_ASYNC_RESET, toBist, MBISTPG_SO, bistEn, 
    MBISTPG_DONE, MBISTPG_GO, BIST_DIAG_EN, FL_CNT_MODE0, 
    INCLUDE_MEM_RESULTS_REG, to_interfaces_tck) ;


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
    input BIST_HOLD, BIST_SETUP, BIST_SETUP_ts2, BIST_SELECT_TEST_DATA, 
          to_controllers_tck, mcp_bounding_to_en, scan_to_en, 
          memory_bypass_to_en, ltest_to_en, ENABLE_MEM_RESET, 
          REDUCED_ADDRESS_COUNT, BIST_ASYNC_RESET, toBist, bistEn, 
          BIST_DIAG_EN, INCLUDE_MEM_RESULTS_REG, to_interfaces_tck;
    wire BIST_HOLD, BIST_SETUP, BIST_SETUP_ts2, BIST_SELECT_TEST_DATA, 
         to_controllers_tck, mcp_bounding_to_en, scan_to_en, 
         memory_bypass_to_en, ltest_to_en, ENABLE_MEM_RESET, 
         REDUCED_ADDRESS_COUNT, BIST_ASYNC_RESET, toBist, bistEn, BIST_DIAG_EN, 
         INCLUDE_MEM_RESULTS_REG, to_interfaces_tck;
    output MBISTPG_SO, MBISTPG_DONE, MBISTPG_GO;
    wire MBISTPG_SO, MBISTPG_DONE, MBISTPG_GO;
    input [1:1] BIST_SETUP_ts1;
    wire [1:1] BIST_SETUP_ts1;
    input [1:0] BIST_ALGO_MODE0, FL_CNT_MODE0;
    wire [1:0] BIST_ALGO_MODE0, FL_CNT_MODE0;


    wire [data:0] ramout ;   // testable dout pins

  wire [3:0] BIST_COL_ADD, BIST_ROW_ADD;
  wire [1:0] BIST_WRITE_DATA, BIST_EXPECT_DATA;
  wire [7:0] RAM_256x16_INST_interface_inst_A;
  wire MEM0_BIST_COLLAR_SI, BIST_SO, BIST_GO, BIST_COLLAR_DIAG_EN, 
       BIST_WRITEENABLE, BIST_SELECT, BIST_CMP, BIST_COLLAR_EN0, 
       BIST_RUN_TO_COLLAR0, BIST_TESTDATA_SELECT_TO_COLLAR, BIST_ON_TO_COLLAR, 
       CHKBCI_PHASE, BIST_SHIFT_COLLAR, BIST_COLLAR_SETUP, BIST_CLEAR_DEFAULT, 
       BIST_CLEAR, BIST_COLLAR_HOLD, FREEZE_STOP_ERROR, ERROR_CNT_ZERO, 
       MBISTPG_RESET_REG_SETUP2, WEN, CEN;
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


  dtmf_recvr_core_rtl1_tessent_mbist_c2_controller dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst(
      .MBISTPG_ALGO_MODE(BIST_ALGO_MODE0[1:0]), .MBISTPG_MEM_RST(ENABLE_MEM_RESET), 
      .MBISTPG_REDUCED_ADDR_CNT_EN(REDUCED_ADDRESS_COUNT), .MEM_BYPASS_EN(memory_bypass_to_en), 
      .MCP_BOUNDING_EN(mcp_bounding_to_en), .MEM0_BIST_COLLAR_SO(BIST_SO), .FL_CNT_MODE(FL_CNT_MODE0[1:0]), 
      .BIST_COLLAR_GO(BIST_GO), .MBISTPG_DIAG_EN(BIST_DIAG_EN), .BIST_CLK(wr), 
      .BIST_SI(toBist), .BIST_HOLD(BIST_HOLD), .BIST_SETUP2(BIST_SETUP_ts2), .BIST_SETUP({
      BIST_SETUP_ts1, BIST_SETUP}), .MBISTPG_TESTDATA_SELECT(BIST_SELECT_TEST_DATA), 
      .TCK(to_controllers_tck), .MBISTPG_EN(bistEn), .MBISTPG_ASYNC_RESETN(BIST_ASYNC_RESET), 
      .LV_TM(ltest_to_en), .MBISTPG_RESET_REG_SETUP2(MBISTPG_RESET_REG_SETUP2), 
      .BIST_COL_ADD(BIST_COL_ADD), .BIST_ROW_ADD(BIST_ROW_ADD), .BIST_WRITE_DATA(BIST_WRITE_DATA), 
      .BIST_EXPECT_DATA(BIST_EXPECT_DATA), .BIST_SHIFT_COLLAR(BIST_SHIFT_COLLAR), 
      .BIST_TESTDATA_SELECT_TO_COLLAR(BIST_TESTDATA_SELECT_TO_COLLAR), .MEM0_BIST_COLLAR_SI(MEM0_BIST_COLLAR_SI), 
      .BIST_COLLAR_SETUP(BIST_COLLAR_SETUP), .BIST_COLLAR_HOLD(BIST_COLLAR_HOLD), 
      .FREEZE_STOP_ERROR(FREEZE_STOP_ERROR), .ERROR_CNT_ZERO(ERROR_CNT_ZERO), .BIST_COLLAR_DIAG_EN(BIST_COLLAR_DIAG_EN), 
      .BIST_CLEAR_DEFAULT(BIST_CLEAR_DEFAULT), .BIST_CLEAR(BIST_CLEAR), .MBISTPG_SO(MBISTPG_SO), 
      .BIST_WRITEENABLE(BIST_WRITEENABLE), .BIST_SELECT(BIST_SELECT), .BIST_CMP(BIST_CMP), 
      .BIST_COLLAR_EN0(BIST_COLLAR_EN0), .BIST_RUN_TO_COLLAR0(BIST_RUN_TO_COLLAR0), 
      .CHKBCI_PHASE(CHKBCI_PHASE), .MBISTPG_GO(MBISTPG_GO), .MBISTPG_DONE(MBISTPG_DONE), 
      .BIST_ON_TO_COLLAR(BIST_ON_TO_COLLAR)
  );

  dtmf_recvr_core_rtl1_tessent_mbist_c2_interface_m1 RAM_256x16_INST_interface_inst(
      .WEN_IN(1'b0), .CEN_IN(1'b0), .A_IN(a[7:0]), .D_IN(din[15:0]), .Q_IN(RAM_256x16_INST_Q), 
      .TCK(to_interfaces_tck), .BIST_CMP(BIST_CMP), .INCLUDE_MEM_RESULTS_REG(INCLUDE_MEM_RESULTS_REG), 
      .BIST_WRITEENABLE(BIST_WRITEENABLE), .BIST_SELECT(BIST_SELECT), .BIST_COL_ADD(BIST_COL_ADD), 
      .BIST_ROW_ADD(BIST_ROW_ADD), .BIST_WRITE_DATA(BIST_WRITE_DATA), .CHKBCI_PHASE(CHKBCI_PHASE), 
      .BIST_TESTDATA_SELECT_TO_COLLAR(BIST_TESTDATA_SELECT_TO_COLLAR), .MEM_BYPASS_EN(memory_bypass_to_en), 
      .SCAN_SHIFT_EN(scan_to_en), .MCP_BOUNDING_EN(mcp_bounding_to_en), .BIST_ON(BIST_ON_TO_COLLAR), 
      .BIST_RUN(BIST_RUN_TO_COLLAR0), .BIST_ASYNC_RESETN(BIST_ASYNC_RESET), .BIST_CLK(wr), 
      .BIST_SHIFT_COLLAR(BIST_SHIFT_COLLAR), .BIST_EXPECT_DATA(BIST_EXPECT_DATA), 
      .BIST_SI(MEM0_BIST_COLLAR_SI), .BIST_COLLAR_SETUP(BIST_COLLAR_SETUP), .BIST_COLLAR_HOLD(BIST_COLLAR_HOLD), 
      .BIST_DIAG_EN(BIST_COLLAR_DIAG_EN), .BIST_CLEAR_DEFAULT(BIST_CLEAR_DEFAULT), 
      .BIST_CLEAR(BIST_CLEAR), .BIST_SETUP0(BIST_SETUP), .LV_TM(ltest_to_en), .FREEZE_STOP_ERROR(FREEZE_STOP_ERROR), 
      .BIST_COLLAR_EN(BIST_COLLAR_EN0), .RESET_REG_SETUP2(MBISTPG_RESET_REG_SETUP2), 
      .ERROR_CNT_ZERO(ERROR_CNT_ZERO), .WEN(WEN), .CEN(CEN), .A(RAM_256x16_INST_interface_inst_A), 
      .D(RAM_256x16_INST_interface_inst_D), .Q(ramout[15:0]), .SCAN_OBS_FLOPS(), 
      .BIST_SO(BIST_SO), .BIST_GO(BIST_GO)
  );
endmodule
module ram_256x16_test_1 (
    a,
    din,
    dout,
    oe,
    wr,
    test_mode
    , BIST_SETUP, mcp_bounding_to_en, scan_to_en, memory_bypass_to_en, 
    MEM1_BIST_COLLAR_SI, BIST_SO, BIST_GO, BIST_COLLAR_DIAG_EN, ltest_to_en, 
    BIST_WRITEENABLE, BIST_SELECT, BIST_CMP, INCLUDE_MEM_RESULTS_REG, 
    BIST_COL_ADD, BIST_ROW_ADD, BIST_COLLAR_EN1, BIST_RUN_TO_COLLAR1, 
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
          MEM1_BIST_COLLAR_SI, BIST_COLLAR_DIAG_EN, ltest_to_en, 
          BIST_WRITEENABLE, BIST_SELECT, BIST_CMP, INCLUDE_MEM_RESULTS_REG, 
          BIST_COLLAR_EN1, BIST_RUN_TO_COLLAR1, BIST_ASYNC_RESET, 
          to_interfaces_tck, BIST_TESTDATA_SELECT_TO_COLLAR, BIST_ON_TO_COLLAR, 
          CHKBCI_PHASE, BIST_SHIFT_COLLAR, BIST_COLLAR_SETUP, 
          BIST_CLEAR_DEFAULT, BIST_CLEAR, BIST_COLLAR_HOLD, FREEZE_STOP_ERROR, 
          ERROR_CNT_ZERO, MBISTPG_RESET_REG_SETUP2;
    wire BIST_SETUP, mcp_bounding_to_en, scan_to_en, memory_bypass_to_en, 
         MEM1_BIST_COLLAR_SI, BIST_COLLAR_DIAG_EN, ltest_to_en, 
         BIST_WRITEENABLE, BIST_SELECT, BIST_CMP, INCLUDE_MEM_RESULTS_REG, 
         BIST_COLLAR_EN1, BIST_RUN_TO_COLLAR1, BIST_ASYNC_RESET, 
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


  dtmf_recvr_core_rtl1_tessent_mbist_c4_interface_m2 RAM_256x16_INST_interface_inst(
      .WEN_IN(1'b0), .CEN_IN(1'b0), .A_IN(a[7:0]), .D_IN(din[15:0]), .Q_IN(RAM_256x16_INST_Q), 
      .TCK(to_interfaces_tck), .BIST_CMP(BIST_CMP), .INCLUDE_MEM_RESULTS_REG(INCLUDE_MEM_RESULTS_REG), 
      .BIST_WRITEENABLE(BIST_WRITEENABLE), .BIST_SELECT(BIST_SELECT), .BIST_COL_ADD(BIST_COL_ADD[3:0]), 
      .BIST_ROW_ADD(BIST_ROW_ADD[3:0]), .BIST_WRITE_DATA(BIST_WRITE_DATA[1:0]), 
      .CHKBCI_PHASE(CHKBCI_PHASE), .BIST_TESTDATA_SELECT_TO_COLLAR(BIST_TESTDATA_SELECT_TO_COLLAR), 
      .MEM_BYPASS_EN(memory_bypass_to_en), .SCAN_SHIFT_EN(scan_to_en), .MCP_BOUNDING_EN(mcp_bounding_to_en), 
      .BIST_ON(BIST_ON_TO_COLLAR), .BIST_RUN(BIST_RUN_TO_COLLAR1), .BIST_ASYNC_RESETN(BIST_ASYNC_RESET), 
      .BIST_CLK(wr), .BIST_SHIFT_COLLAR(BIST_SHIFT_COLLAR), .BIST_EXPECT_DATA(BIST_EXPECT_DATA[1:0]), 
      .BIST_SI(MEM1_BIST_COLLAR_SI), .BIST_COLLAR_SETUP(BIST_COLLAR_SETUP), .BIST_COLLAR_HOLD(BIST_COLLAR_HOLD), 
      .BIST_DIAG_EN(BIST_COLLAR_DIAG_EN), .BIST_CLEAR_DEFAULT(BIST_CLEAR_DEFAULT), 
      .BIST_CLEAR(BIST_CLEAR), .BIST_SETUP0(BIST_SETUP), .LV_TM(ltest_to_en), .FREEZE_STOP_ERROR(FREEZE_STOP_ERROR), 
      .BIST_COLLAR_EN(BIST_COLLAR_EN1), .RESET_REG_SETUP2(MBISTPG_RESET_REG_SETUP2), 
      .ERROR_CNT_ZERO(ERROR_CNT_ZERO), .WEN(WEN), .CEN(CEN), .A(RAM_256x16_INST_interface_inst_A), 
      .D(RAM_256x16_INST_interface_inst_D), .Q(ramout[15:0]), .SCAN_OBS_FLOPS(), 
      .BIST_SO(BIST_SO), .BIST_GO(BIST_GO)
  );
endmodule


module ram_256x16_test_2 (
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


  dtmf_recvr_core_rtl1_tessent_mbist_c4_interface_m1 RAM_256x16_INST_interface_inst(
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
endmodule

 // ram_128x16_test
