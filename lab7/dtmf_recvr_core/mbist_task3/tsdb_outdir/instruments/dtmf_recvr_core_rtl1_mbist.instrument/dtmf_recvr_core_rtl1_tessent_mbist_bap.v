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
//       Created on: Tue Nov 17 19:22:26 IST 2026
//--------------------------------------------------------------------------

module dtmf_recvr_core_rtl1_tessent_mbist_bap (
// dtmf_recvr_core_rtl1_tessent_mbist_bap {{{
  input wire reset,
  input wire ijtag_select,
  input wire si,
  input wire capture_en,
  input wire shift_en,
  output wire shift_en_R,
  input wire update_en,
  input wire tck,
  output wire to_interfaces_tck,
  output wire to_controllers_tck,
  input wire mcp_bounding_en,
  output wire mcp_bounding_to_en,
  input wire scan_en,
  output wire scan_to_en,
  input wire memory_bypass_en,
  output wire memory_bypass_to_en,
  input wire ltest_en,
  output wire ltest_to_en,
  output wire BIST_HOLD,
  output wire   ENABLE_MEM_RESET,
  output wire   REDUCED_ADDRESS_COUNT,
  output wire   BIST_SELECT_TEST_DATA,
  output wire   BIST_ALGO_MODE0,
  output wire   BIST_ALGO_MODE1,
  output wire   BIST_DIAG_EN,
  output wire   BIST_ASYNC_RESET,
  output wire   FL_CNT_MODE0,
  output wire   FL_CNT_MODE1,
  output wire   INCLUDE_MEM_RESULTS_REG,
  output wire   CHAIN_BYPASS_EN,
  output wire   TCK_MODE,
  output wire [2:0]   BIST_SETUP,
  input wire [3:0] MBISTPG_GO,
  input wire [3:0] MBISTPG_DONE,
  output wire [3:0] bistEn,
  output reg [3:0] toBist,
  input wire [3:0] fromBist,
  output wire so
);
wire [3:0] sib_scan_out;
wire [3:0] sib_bist_en;
wire [3:0] sib_bist_en_reg;
wire [3:0] sib_bist_en_latch;
wire tdr_so;
wire ENABLE_MEM_RESET_int;
wire REDUCED_ADDRESS_COUNT_int;
wire BIST_SELECT_TEST_DATA_int;
wire BIST_ALGO_MODE0_int;
wire BIST_ALGO_MODE1_int;
wire BIST_DIAG_EN_int;
wire FL_CNT_MODE0_int;
wire FL_CNT_MODE1_int;
wire INCLUDE_MEM_RESULTS_REG_int;
wire CHAIN_BYPASS_EN_int;
wire CHAIN_BYPASS_EN_reg;
wire [2:0] BIST_SETUP_int;
wire [2:0] BIST_SETUP_reg;
wire  BIST_ASYNC_RESET_to_buf;
wire  TCK_MODE_to_buf;
assign ltest_to_en         = ltest_en;
assign memory_bypass_to_en = memory_bypass_en;
assign scan_to_en          = scan_en;
assign mcp_bounding_to_en  = mcp_bounding_en;
 
// TDR instance {{{
wire ijtag_select_bap_tdr;
dtmf_recvr_core_rtl1_tessent_mbist_bap_tdr tdr_inst (
  .reset            (reset),
  .ijtag_select     (ijtag_select_bap_tdr),
  .si               (si),
  .capture_en       (capture_en),
  .shift_en         (shift_en),
  .update_en        (update_en),
  .tck              (tck),
  .ltest_en         (ltest_en),
  .ENABLE_MEM_RESET ( ENABLE_MEM_RESET_int ),
  .REDUCED_ADDRESS_COUNT( REDUCED_ADDRESS_COUNT_int ),
  .BIST_SELECT_TEST_DATA( BIST_SELECT_TEST_DATA_int ),
  .BIST_ALGO_MODE0  ( BIST_ALGO_MODE0_int ),
  .BIST_ALGO_MODE1  ( BIST_ALGO_MODE1_int ),
  .BIST_DIAG_EN     ( BIST_DIAG_EN_int ),
  .BIST_ASYNC_RESET ( BIST_ASYNC_RESET_to_buf ),
  .FL_CNT_MODE0     ( FL_CNT_MODE0_int ),
  .FL_CNT_MODE1     ( FL_CNT_MODE1_int ),
  .INCLUDE_MEM_RESULTS_REG( INCLUDE_MEM_RESULTS_REG_int ),
  .CHAIN_BYPASS_EN  ( CHAIN_BYPASS_EN_int ),
  .CHAIN_BYPASS_EN_reg( CHAIN_BYPASS_EN_reg ),
  .TCK_MODE         ( TCK_MODE_to_buf ),
  .BIST_SETUP       ( BIST_SETUP_int ),
  .BIST_SETUP_reg   ( BIST_SETUP_reg ),
  .so               (tdr_so)
);
// TDR instance }}}
buf02 tessent_persistent_cell_BIST_SETUP_2_buf (.A(BIST_SETUP_int[2]),.Y(BIST_SETUP[2]));
buf02 tessent_persistent_cell_BIST_SETUP_1_buf (.A(BIST_SETUP_int[1]),.Y(BIST_SETUP[1]));
buf02 tessent_persistent_cell_BIST_SETUP_0_buf (.A(BIST_SETUP_int[0]),.Y(BIST_SETUP[0]));
// SIB dtmf_recvr_core_rtl1_tessent_mbist_controller_sib_tdr_bypass_inst instance {{{
wire tdr_bypass_so;
dtmf_recvr_core_rtl1_tessent_mbist_bap_sib dtmf_recvr_core_rtl1_tessent_mbist_controller_sib_tdr_bypass_inst (
  .reset             (reset),
  .si                (si),
  .capture_en        (capture_en),
  .shift_en          (shift_en),
  .update_en         (update_en),
  .tck               (tck),
  .ijtag_select      (ijtag_select),
  .ijtag_to_select   (ijtag_select_bap_tdr),
  .ijtag_to_select_reg  ( ),
  .from_scan_out     (tdr_so),
  .so                (tdr_bypass_so)); 
// SIB dtmf_recvr_core_rtl1_tessent_mbist_controller_sib_tdr_bypass_inst instance }}}
wire ChainBypassMode_int;
assign ChainBypassMode_int = CHAIN_BYPASS_EN_int | BIST_SETUP_int[1];
reg [3:0] fromBist_retime;
wire ijtag_select_ctl_sib;
wire ijtag_select_ctl_sib_reg;
// SIB 3 instance {{{
dtmf_recvr_core_rtl1_tessent_mbist_bap_ctl_sib dtmf_recvr_core_rtl1_tessent_mbist_controller_sib_inst3 (
  .reset             (reset),
  .si                (tdr_bypass_so),
  .capture_en        (capture_en),
  .shift_en          (shift_en),
  .update_en         (update_en),
  .tck               (tck),
  .bist_go           (MBISTPG_GO[3]), 
  .bist_done         (MBISTPG_DONE[3]), 
  .ijtag_select      (ijtag_select_ctl_sib),
  .bistEn            (sib_bist_en[3]),
  .bistEn_reg        (sib_bist_en_reg[3]),
  .bistEn_latch      (sib_bist_en_latch[3]),
  .from_scan_out     (fromBist_retime[3]),
  .ChainBypassMode   (ChainBypassMode_int),
  .so                (sib_scan_out[3])); 
 
// SIB 3 instance }}}
// SIB 2 instance {{{
dtmf_recvr_core_rtl1_tessent_mbist_bap_ctl_sib dtmf_recvr_core_rtl1_tessent_mbist_controller_sib_inst2 (
  .reset             (reset),
  .si                (sib_scan_out[3]),
  .capture_en        (capture_en),
  .shift_en          (shift_en),
  .update_en         (update_en),
  .tck               (tck),
  .bist_go           (MBISTPG_GO[2]), 
  .bist_done         (MBISTPG_DONE[2]), 
  .ijtag_select      (ijtag_select_ctl_sib),
  .bistEn            (sib_bist_en[2]),
  .bistEn_reg        (sib_bist_en_reg[2]),
  .bistEn_latch      (sib_bist_en_latch[2]),
  .from_scan_out     (fromBist_retime[2]),
  .ChainBypassMode   (ChainBypassMode_int),
  .so                (sib_scan_out[2])); 
 
// SIB 2 instance }}}
// SIB 1 instance {{{
dtmf_recvr_core_rtl1_tessent_mbist_bap_ctl_sib dtmf_recvr_core_rtl1_tessent_mbist_controller_sib_inst1 (
  .reset             (reset),
  .si                (sib_scan_out[2]),
  .capture_en        (capture_en),
  .shift_en          (shift_en),
  .update_en         (update_en),
  .tck               (tck),
  .bist_go           (MBISTPG_GO[1]), 
  .bist_done         (MBISTPG_DONE[1]), 
  .ijtag_select      (ijtag_select_ctl_sib),
  .bistEn            (sib_bist_en[1]),
  .bistEn_reg        (sib_bist_en_reg[1]),
  .bistEn_latch      (sib_bist_en_latch[1]),
  .from_scan_out     (fromBist_retime[1]),
  .ChainBypassMode   (ChainBypassMode_int),
  .so                (sib_scan_out[1])); 
 
// SIB 1 instance }}}
// SIB 0 instance {{{
dtmf_recvr_core_rtl1_tessent_mbist_bap_ctl_sib dtmf_recvr_core_rtl1_tessent_mbist_controller_sib_inst0 (
  .reset             (reset),
  .si                (sib_scan_out[1]),
  .capture_en        (capture_en),
  .shift_en          (shift_en),
  .update_en         (update_en),
  .tck               (tck),
  .bist_go           (MBISTPG_GO[0]), 
  .bist_done         (MBISTPG_DONE[0]), 
  .ijtag_select      (ijtag_select_ctl_sib),
  .bistEn            (sib_bist_en[0]),
  .bistEn_reg        (sib_bist_en_reg[0]),
  .bistEn_latch      (sib_bist_en_latch[0]),
  .from_scan_out     (fromBist_retime[0]),
  .ChainBypassMode   (ChainBypassMode_int),
  .so                (sib_scan_out[0])); 
 
// SIB 0 instance }}}
// SIB dtmf_recvr_core_rtl1_tessent_mbist_controller_sib_ctl_bypass_inst instance {{{
wire sib_ctl_bypass_so;
dtmf_recvr_core_rtl1_tessent_mbist_bap_sib dtmf_recvr_core_rtl1_tessent_mbist_controller_sib_ctl_bypass_inst (
  .reset             (reset),
  .si                (tdr_bypass_so),
  .capture_en        (capture_en),
  .shift_en          (shift_en),
  .update_en         (update_en),
  .tck               (tck),
  .ijtag_select      (ijtag_select),
  .ijtag_to_select   (ijtag_select_ctl_sib ),
  .ijtag_to_select_reg  (ijtag_select_ctl_sib_reg ),
  .from_scan_out     (sib_scan_out[0]),
  .so                (sib_ctl_bypass_so)); 
 
// SIB dtmf_recvr_core_rtl1_tessent_mbist_controller_sib_ctl_bypass_inst instance }}}
// --------- Bist hold  ---------
// [start] : BistHold pipeline {{{
wire BIST_HOLD_to_latch;
reg BIST_HOLD_latch;
assign BIST_HOLD_to_latch = ijtag_select_ctl_sib_reg & (~BIST_SETUP_reg[1]) & (~CHAIN_BYPASS_EN_reg) & (|sib_bist_en_reg) ;
always @ (negedge tck or negedge reset) begin
  if (~reset) begin
    BIST_HOLD_latch     <= 1'b0;
  end else if (update_en & ijtag_select) begin
    BIST_HOLD_latch     <= BIST_HOLD_to_latch;
  end
end
// [end]   : BistHold pipeline }}}
wire to_mbist_tck_en;
wire update_setup_chain_retime;
assign update_setup_chain_retime = ijtag_select & capture_en & (~BIST_SETUP_int[1]) & (~(|sib_bist_en_latch));
assign to_mbist_tck_en = shift_en_R | update_setup_chain_retime;
assign shift_en_R = ijtag_select_ctl_sib & shift_en & (~ChainBypassMode_int) & (|sib_bist_en_latch);
reg                 retiming_so ;
always @ (negedge tck) begin 
  retiming_so <= sib_ctl_bypass_so;
end
always @ (negedge tck) begin 
  fromBist_retime <= fromBist;
end
assign so = retiming_so;
always @ (negedge tck) begin 
  toBist[3] <= tdr_bypass_so;
  toBist[2] <= sib_scan_out[3];
  toBist[1] <= sib_scan_out[2];
  toBist[0] <= sib_scan_out[1];
end
// --------- to_controllers_tck (inversion) -----------
wire tck_out_gated;
cgand tessent_persistent_cell_GATING_TCK (
  .CK               (tck),
  .TE               (1'b0),
  .FE               (to_mbist_tck_en),
  .GCK              (tck_out_gated)
);
  clock_buf02 tessent_persistent_cell_BUF_C_TCK (
    .A               (tck_out_gated),
    .Y               (to_controllers_tck)
  );
  clock_buf02 tessent_persistent_cell_BUF_I_TCK (
    .A               (tck_out_gated),
    .Y               (to_interfaces_tck)
  );
 
// --------- Persistent Buffers for SDC anchors -----------
buf02 tessent_persistent_cell_bistEn_3 (.A(sib_bist_en[3]),.Y(bistEn[3]));
buf02 tessent_persistent_cell_bistEn_2 (.A(sib_bist_en[2]),.Y(bistEn[2]));
buf02 tessent_persistent_cell_bistEn_1 (.A(sib_bist_en[1]),.Y(bistEn[1]));
buf02 tessent_persistent_cell_bistEn_0 (.A(sib_bist_en[0]),.Y(bistEn[0]));
buf02 tessent_persistent_cell_BIST_ASYNC_RESET (.A(BIST_ASYNC_RESET_to_buf),.Y(BIST_ASYNC_RESET));
buf02 tessent_persistent_cell_TCK_MODE (.A(TCK_MODE_to_buf),.Y(TCK_MODE));
buf02 tessent_persistent_cell_BIST_HOLD (.A(BIST_HOLD_latch),.Y(BIST_HOLD));
buf02 tessent_persistent_cell_ENABLE_MEM_RESET_buf (.A(ENABLE_MEM_RESET_int),.Y(ENABLE_MEM_RESET));
buf02 tessent_persistent_cell_REDUCED_ADDRESS_COUNT_buf (.A(REDUCED_ADDRESS_COUNT_int),.Y(REDUCED_ADDRESS_COUNT));
buf02 tessent_persistent_cell_BIST_SELECT_TEST_DATA_buf (.A(BIST_SELECT_TEST_DATA_int),.Y(BIST_SELECT_TEST_DATA));
buf02 tessent_persistent_cell_BIST_ALGO_MODE0_buf (.A(BIST_ALGO_MODE0_int),.Y(BIST_ALGO_MODE0));
buf02 tessent_persistent_cell_BIST_ALGO_MODE1_buf (.A(BIST_ALGO_MODE1_int),.Y(BIST_ALGO_MODE1));
buf02 tessent_persistent_cell_BIST_DIAG_EN_buf (.A(BIST_DIAG_EN_int),.Y(BIST_DIAG_EN));
buf02 tessent_persistent_cell_FL_CNT_MODE0_buf (.A(FL_CNT_MODE0_int),.Y(FL_CNT_MODE0));
buf02 tessent_persistent_cell_FL_CNT_MODE1_buf (.A(FL_CNT_MODE1_int),.Y(FL_CNT_MODE1));
buf02 tessent_persistent_cell_INCLUDE_MEM_RESULTS_REG_buf (.A(INCLUDE_MEM_RESULTS_REG_int),.Y(INCLUDE_MEM_RESULTS_REG));
buf02 tessent_persistent_cell_CHAIN_BYPASS_EN_buf (.A(CHAIN_BYPASS_EN_int),.Y(CHAIN_BYPASS_EN));
// dtmf_recvr_core_rtl1_tessent_mbist_bap }}}
endmodule
 
module dtmf_recvr_core_rtl1_tessent_mbist_bap_tdr (
// dtmf_recvr_core_rtl1_tessent_mbist_bap_tdr {{{
  input wire reset,
  input wire ijtag_select,
  input wire si,
  input wire capture_en,
  input wire shift_en,
  input wire update_en,
  input wire tck,
  input wire ltest_en,
  output wire ENABLE_MEM_RESET,
  output wire REDUCED_ADDRESS_COUNT,
  output wire BIST_SELECT_TEST_DATA,
  output wire BIST_ALGO_MODE0,
  output wire BIST_ALGO_MODE1,
  output wire BIST_DIAG_EN,
  output wire BIST_ASYNC_RESET,
  output wire FL_CNT_MODE0,
  output wire FL_CNT_MODE1,
  output wire INCLUDE_MEM_RESULTS_REG,
  output wire CHAIN_BYPASS_EN,
  output wire CHAIN_BYPASS_EN_reg,
  output wire TCK_MODE,
  output wire [2:0] BIST_SETUP,
  output wire [2:0] BIST_SETUP_reg,
  output wire so
);
// Shift Register {{{
reg    [14:0]       tdr;
reg                 tdr_latch14;
reg                 tdr_latch13;
reg                 tdr_latch12;
reg                 tdr_latch11;
reg                 tdr_latch10;
reg                 tdr_latch9;
reg                 tdr_latch8;
reg                 tdr_latch7;
reg                 tdr_latch6;
reg                 tdr_latch5;
reg                 tdr_latch4;
reg                 tdr_latch3;
reg                 tdr_latch2;
reg                 tdr_latch1;
reg                 tdr_latch0;
always @ (posedge tck) begin
  if (capture_en & ijtag_select) begin
    tdr <= { tdr_latch14,
             tdr_latch13,
             tdr_latch12,
             tdr_latch11,
             tdr_latch10,
             tdr_latch9,
             tdr_latch8,
             tdr_latch7,
             tdr_latch6,
             tdr_latch5,
             tdr_latch4,
             tdr_latch3,
             tdr_latch2,
             tdr_latch1,
             tdr_latch0};
  end else if (shift_en & ijtag_select) begin
    tdr <= {si,tdr[14:1]};
  end
end
// Shift Register }}}
// Update Latches {{{
// --------- DataOutPort 14 ---------
always @ (negedge tck or negedge reset) begin
  if (~reset) begin
    tdr_latch14 <= 1'b0;
  end else begin
    if (update_en & ijtag_select) begin
      tdr_latch14 <= tdr[14];
    end
  end
end
// --------- DataOutPort 13 ---------
always @ (negedge tck or negedge reset) begin
  if (~reset) begin
    tdr_latch13 <= 1'b0;
  end else begin
    if (update_en & ijtag_select) begin
      tdr_latch13 <= tdr[13];
    end
  end
end
// --------- DataOutPort 12 ---------
always @ (negedge tck or negedge reset) begin
  if (~reset) begin
    tdr_latch12 <= 1'b0;
  end else begin
    if (update_en & ijtag_select) begin
      tdr_latch12 <= tdr[12];
    end
  end
end
// --------- DataOutPort 11 ---------
always @ (negedge tck or negedge reset) begin
  if (~reset) begin
    tdr_latch11 <= 1'b0;
  end else begin
    if (update_en & ijtag_select) begin
      tdr_latch11 <= tdr[11];
    end
  end
end
// --------- DataOutPort 10 ---------
always @ (negedge tck or negedge reset) begin
  if (~reset) begin
    tdr_latch10 <= 1'b1;
  end else begin
    if (update_en & ijtag_select) begin
      tdr_latch10 <= tdr[10];
    end
  end
end
// --------- DataOutPort 9 ---------
always @ (negedge tck or negedge reset) begin
  if (~reset) begin
    tdr_latch9 <= 1'b0;
  end else begin
    if (update_en & ijtag_select) begin
      tdr_latch9 <= tdr[9];
    end
  end
end
// --------- DataOutPort 8 ---------
always @ (negedge tck or negedge reset) begin
  if (~reset) begin
    tdr_latch8 <= 1'b0;
  end else begin
    if (update_en & ijtag_select) begin
      tdr_latch8 <= tdr[8];
    end
  end
end
// --------- DataOutPort 7 ---------
always @ (negedge tck or negedge reset) begin
  if (~reset) begin
    tdr_latch7 <= 1'b0;
  end else begin
    if (update_en & ijtag_select) begin
      tdr_latch7 <= tdr[7];
    end
  end
end
// --------- DataOutPort 6 ---------
always @ (negedge tck or negedge reset) begin
  if (~reset) begin
    tdr_latch6 <= 1'b0;
  end else begin
    if (update_en & ijtag_select) begin
      tdr_latch6 <= tdr[6];
    end
  end
end
// --------- DataOutPort 5 ---------
always @ (negedge tck or negedge reset) begin
  if (~reset) begin
    tdr_latch5 <= 1'b0;
  end else begin
    if (update_en & ijtag_select) begin
      tdr_latch5 <= tdr[5];
    end
  end
end
// --------- DataOutPort 4 ---------
always @ (negedge tck or negedge reset) begin
  if (~reset) begin
    tdr_latch4 <= 1'b0;
  end else begin
    if (update_en & ijtag_select) begin
      tdr_latch4 <= tdr[4];
    end
  end
end
// --------- DataOutPort 3 ---------
always @ (negedge tck or negedge reset) begin
  if (~reset) begin
    tdr_latch3 <= 1'b0;
  end else begin
    if (update_en & ijtag_select) begin
      tdr_latch3 <= tdr[3];
    end
  end
end
// --------- DataOutPort 2 ---------
always @ (negedge tck or negedge reset) begin
  if (~reset) begin
    tdr_latch2 <= 1'b0;
  end else begin
    if (update_en & ijtag_select) begin
      tdr_latch2 <= tdr[2];
    end
  end
end
// --------- DataOutPort 1 ---------
always @ (negedge tck or negedge reset) begin
  if (~reset) begin
    tdr_latch1 <= 1'b0;
  end else begin
    if (update_en & ijtag_select) begin
      tdr_latch1 <= tdr[1];
    end
  end
end
// --------- DataOutPort 0 ---------
always @ (negedge tck or negedge reset) begin
  if (~reset) begin
    tdr_latch0 <= 1'b0;
  end else begin
    if (update_en & ijtag_select) begin
      tdr_latch0 <= tdr[0];
    end
  end
end
// Update Latches }}}
// Data Output Ports {{{
assign BIST_SETUP[2] = tdr_latch14;
assign BIST_SETUP_reg[2] = tdr[14];
assign BIST_SETUP[1] = tdr_latch13;
assign BIST_SETUP_reg[1] = tdr[13];
assign BIST_SETUP[0] = tdr_latch12;
assign BIST_SETUP_reg[0] = tdr[12];
assign TCK_MODE     = tdr_latch11;
assign CHAIN_BYPASS_EN = tdr_latch10;
assign CHAIN_BYPASS_EN_reg = tdr[10];
assign INCLUDE_MEM_RESULTS_REG = tdr_latch9;
assign FL_CNT_MODE1 = tdr_latch8;
assign FL_CNT_MODE0 = tdr_latch7;
mux21 tessent_persistent_cell_BIST_ASYNC_RESET_mux (.A0(tdr_latch6),.A1(reset),.S0(ltest_en),.Y(BIST_ASYNC_RESET));
assign BIST_DIAG_EN = tdr_latch5;
assign BIST_ALGO_MODE1 = tdr_latch4;
assign BIST_ALGO_MODE0 = tdr_latch3;
assign BIST_SELECT_TEST_DATA = tdr_latch2;
assign REDUCED_ADDRESS_COUNT = tdr_latch1;
assign ENABLE_MEM_RESET = tdr_latch0;
// Data Output Ports }}}
  
assign so = tdr[0];
// dtmf_recvr_core_rtl1_tessent_mbist_bap_tdr }}}
endmodule
 
module dtmf_recvr_core_rtl1_tessent_mbist_bap_sib (
// dtmf_recvr_core_rtl1_tessent_mbist_controller_sib {{{
   input wire reset,
   input wire ijtag_select,
   input wire si,
   input wire capture_en,
   input wire shift_en,
   input wire update_en,
   input wire tck,
   output wire so,
   input wire from_scan_out,
   output wire ijtag_to_select_reg,
   output wire ijtag_to_select
);
   reg            sib;
   reg            sib_latch;
   reg            to_enable_int;
   assign ijtag_to_select_reg = sib;
   assign ijtag_to_select = ijtag_select & to_enable_int;
   always @ (negedge tck or negedge reset) begin
      if (~reset) begin
         sib_latch     <= 1'b0;
      end else if (update_en & ijtag_select) begin
         sib_latch     <= sib;
      end
   end
   always @ (negedge tck or negedge reset) begin
      if (~reset) begin
         to_enable_int <= 1'b0;
      end else  begin
         to_enable_int <= sib_latch;
      end
   end
 
   assign so = sib;
 
   always @ (posedge tck) begin
      if (capture_en & ijtag_select) begin
         sib <= 1'b0;
      end else if (shift_en & ijtag_select) begin
         if (sib_latch) begin
            sib <= from_scan_out;
         end else begin
            sib <= si;
         end
      end
   end
// dtmf_recvr_core_rtl1_tessent_mbist_controller_sib }}}
endmodule
module dtmf_recvr_core_rtl1_tessent_mbist_bap_ctl_sib (
// dtmf_recvr_core_rtl1_tessent_mbist_controller_sib {{{
   input wire reset,
   input wire ijtag_select,
   input wire si,
   input wire capture_en,
   input wire shift_en,
   input wire update_en,
   input wire tck,
   output wire so,
   input wire from_scan_out,
   input wire ChainBypassMode,
   input wire bist_done,
   input wire bist_go,
   output wire bistEn_reg,
   output wire bistEn_latch,
   output wire bistEn
);
   reg            sib;
   reg            tdr;
   reg            sib_latch;
   reg            to_enable_int;
   assign bistEn = to_enable_int;
   assign bistEn_reg = sib;
   assign bistEn_latch = sib_latch;
   always @ (negedge tck or negedge reset) begin
      if (~reset) begin
         sib_latch     <= 1'b0;
      end else if (update_en & ijtag_select) begin
         sib_latch     <= sib;
      end
   end
   always @ (negedge tck or negedge reset) begin
      if (~reset) begin
         to_enable_int <= 1'b0;
      end else  begin
         to_enable_int <= sib_latch;
      end
   end
 
   assign so = sib;
 
   always @ (posedge tck) begin
      if (capture_en & ijtag_select) begin
         tdr <= bist_done;
         sib <= bist_go;
      end else if (shift_en & ijtag_select) begin
         if (sib_latch & (ChainBypassMode==0)) begin
            tdr <= from_scan_out;
         end else begin
            tdr <= si;
         end
         sib <= tdr;
      end
   end
// dtmf_recvr_core_rtl1_tessent_mbist_controller_sib }}}
endmodule
