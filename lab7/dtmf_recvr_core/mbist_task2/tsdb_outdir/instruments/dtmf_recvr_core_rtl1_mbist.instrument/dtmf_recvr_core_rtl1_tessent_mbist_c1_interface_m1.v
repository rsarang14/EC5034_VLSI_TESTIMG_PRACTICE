/*
----------------------------------------------------------------------------------
-                                                                                -
-  Unpublished work. Copyright 2022 Siemens                                      -
-                                                                                -
-  This material contains trade secrets or otherwise confidential                -
-  information owned by Siemens Industry Software Inc. or its affiliates         -
-  (collectively, SISW), or its licensors. Access to and use of this             -
-  information is strictly limited as set forth in the Customer's                -
-  applicable agreements with SISW.                                              -
-                                                                                -
----------------------------------------------------------------------------------
-  File created by: Tessent Shell                                                -
-          Version: 2022.4                                                       -
-       Created on: Tue Nov 17 18:35:18 IST 2026                                 -
----------------------------------------------------------------------------------


*/
`timescale 100 ps / 10 ps

/*------------------------------------------------------------------------------
     Module      :  dtmf_recvr_core_rtl1_tessent_mbist_c1_interface_m1
 
     Description :  This module contains the interface logic for the memory
                    module ram_256x16A
 
--------------------------------------------------------------------------------
     Interface Options in Effect
 
     BistDataPipelineStages        : 0;
     BitGrouping                   : 1;
     BitSliceWidth                 : 1;
     ConcurrentWrite               : OFF 
     ConcurrentRead                : OFF 
     ControllerType                : PROG;
     DataOutStage                  : NONE;
     DefaultAlgorithm              : SMARCHCHKBCIL;
     DefaultOperationSet           : SYNC;
     InternalScanLogic             : OFF;
     LocalComparators              : ON;
     MemoryType                    : RAM;
     ObservationLogic              : ON;
     OutputEnableControl           : ALWAYSON;
     PipelineSerialDataOut         : OFF;
     ScanWriteThru                 : OFF;
     ShadowRead                    : OFF;
     ShadowWrite                   : OFF;
     Stop-On-Error Limit           : 4096;
     TransparentMode               : SYNCMUX;
 
---------------------------------------------------------------------------- */

module dtmf_recvr_core_rtl1_tessent_mbist_c1_interface_m1 (
  input  wire        WEN_IN,
  input  wire        CEN_IN,
  input  wire [7:0]  A_IN,
  input  wire [15:0] D_IN,
  input  wire [15:0] Q_IN,
  input  wire        TCK,
  input  wire        BIST_CMP,
  input  wire        INCLUDE_MEM_RESULTS_REG,
  input  wire        BIST_WRITEENABLE,
  input  wire        BIST_SELECT,
  input  wire [3:0]  BIST_COL_ADD,
  input  wire [3:0]  BIST_ROW_ADD,
  input  wire [1:0]  BIST_WRITE_DATA,
  input  wire        CHKBCI_PHASE,
  input  wire        BIST_TESTDATA_SELECT_TO_COLLAR,
  input  wire        MEM_BYPASS_EN,
  input  wire        SCAN_SHIFT_EN,
  input  wire        MCP_BOUNDING_EN,
  input  wire        BIST_ON,
  input  wire        BIST_RUN,
  input  wire        BIST_ASYNC_RESETN,
  input  wire        BIST_CLK,
  input  wire        BIST_SHIFT_COLLAR,
  input  wire [1:0]  BIST_EXPECT_DATA,
  input  wire        BIST_SI,
  input  wire        BIST_COLLAR_SETUP,
  input  wire        BIST_COLLAR_HOLD,
  input  wire        BIST_DIAG_EN,
  input  wire        BIST_CLEAR_DEFAULT,
  input  wire        BIST_CLEAR,
  input  wire        BIST_SETUP0,
  input  wire        LV_TM,
  input  wire        FREEZE_STOP_ERROR,
  input  wire        BIST_COLLAR_EN,
  input  wire        RESET_REG_SETUP2,
  input  wire        ERROR_CNT_ZERO,
  output wire        WEN,
  output wire        CEN,
  output reg  [7:0]  A,
  output reg  [15:0] D,
  output reg  [15:0] Q,
  output reg  [3:0]  SCAN_OBS_FLOPS,
  output wire        BIST_SO,
  output wire        BIST_GO
);


wire        CMP_EN;
wire [15:0] BIST_WRITE_DATA_REP;
wire [15:0] BIST_WRITE_DATA_INT;
reg         BIST_INPUT_SELECT;
wire        BIST_EN_RST;
wire        BIST_CLK_INT;
wire        BIST_CLK_OR_TCK;
wire [15:0] BIST_EXPECT_DATA_REP;
wire [15:0] BIST_EXPECT_DATA_INT;
wire        BIST_CLK_EN;
wire        GO_EN;
wire        COLLAR_STATUS_SO;
wire        STATUS_SO;
wire        COLLAR_STATUS_SI;
wire        BIST_INPUT_SELECT_INT;
wire [0:0]  ERROR;
wire [0:0]  ERROR_R;
wire [15:0] RAW_CMP_STAT;
wire [15:0] DATA_TO_MEM;
wire [15:0] DATA_FROM_MEM;
wire [15:0] DATA_FROM_MEM_EXP;
wire        WEN_TEST_IN;
reg         WEN_NOT_GATED;
wire        WEN_TO_MUX;
wire        CEN_TEST_IN;
reg         CEN_NOT_GATED;
wire        CEN_TO_MUX;
wire [7:0]  A_TEST_IN;
wire [15:0] D_DIN_OBS;
wire [15:0] Q_TO_BYPASS;
wire [15:0] Q_FROM_BYPASS;
wire [15:0] D_TEST_IN;
reg  [15:0] Q_SCAN_IN;
wire        EDATA_CKB_EN;
wire        EDATA_COL_ADD_BIT0;
wire        USE_DEFAULTS;
wire        BIST_COLLAR_HOLD_INT;
wire        FREEZE_STOP_ERROR_RST;
wire        FREEZE_STOP_ERROR_SI;
wire        HOLD_EN;
wire        BIST_SETUP0_SYNC;
wire        LOGIC_HIGH;

//---------------------------
// Memory Interface Main Code
//---------------------------
   assign LOGIC_HIGH = 1'b1;
//----------------------
//-- BIST_ON Sync-ing --
//----------------------
    and02 tessent_persistent_cell_AND_BIST_SETUP0_SYNC (
        .A0         ( BIST_SETUP0                                ),
        .A1         ( BIST_ON                                    ),
        .Y          ( BIST_SETUP0_SYNC                           )
    );

//----------------------
//-- BIST_EN Retiming --
//----------------------
    assign BIST_EN_RST              = ~BIST_ASYNC_RESETN;
    always @ (posedge BIST_CLK_INT or negedge BIST_ASYNC_RESETN) begin
       if (~BIST_ASYNC_RESETN)
          BIST_INPUT_SELECT <= 1'b0;
       else
       if (~MCP_BOUNDING_EN) begin
          BIST_INPUT_SELECT <= BIST_RUN | BIST_TESTDATA_SELECT_TO_COLLAR;
       end
   end

    wire BIST_INPUT_SELECT_INT_BUF;
    buf02 tessent_persistent_cell_BIST_INPUT_SELECT_INT (
        .A                          (BIST_INPUT_SELECT & ((~LV_TM)|MEM_BYPASS_EN)),
        .Y                          (BIST_INPUT_SELECT_INT_BUF)
    );
    assign #(20.0) BIST_INPUT_SELECT_INT = BIST_INPUT_SELECT_INT_BUF;
    assign USE_DEFAULTS = ~BIST_SETUP0_SYNC;
    assign BIST_COLLAR_HOLD_INT = HOLD_EN;
//-----------------------
//-- Observation Logic --
//-----------------------
  // synopsys async_set_reset "BIST_ASYNC_RESETN"
  always @ (posedge BIST_CLK_INT or negedge BIST_ASYNC_RESETN) begin
    if (~BIST_ASYNC_RESETN)
      SCAN_OBS_FLOPS    <= 4'b0000;
    else
      SCAN_OBS_FLOPS    <= {4{MEM_BYPASS_EN} } & {
                          WEN_NOT_GATED        ^ CEN_NOT_GATED        ^ A[7]                 ,
                          A[6]                 ^ A[5]                 ^ A[4]                 ,
                          A[3]                 ^ A[2]                 ^ A[1]                 ,
                          A[0]                 
                           };
  end
 
//--------------------------
//-- Replicate Write Data --
//--------------------------
   assign BIST_WRITE_DATA_REP      = {
                                       BIST_WRITE_DATA,
                                       BIST_WRITE_DATA,
                                       BIST_WRITE_DATA,
                                       BIST_WRITE_DATA,
                                       BIST_WRITE_DATA,
                                       BIST_WRITE_DATA,
                                       BIST_WRITE_DATA,
                                       BIST_WRITE_DATA
                                     };
 
//-----------------------
//-- Checkerboard Data --
//-----------------------
   assign BIST_WRITE_DATA_INT       = ~(CHKBCI_PHASE) ? BIST_WRITE_DATA_REP : ({16{BIST_WRITE_DATA_REP[0]}} ^ {16{BIST_COL_ADD[0]}});
   assign DATA_TO_MEM              = BIST_WRITE_DATA_INT;
 
 
 
 

//--------------------------
//-- Memory Control Ports --
//--------------------------

   // Port: WEN LogicalPort: ## Type: READWRITE {{{

   // Intercept functional signal with test mux
   always @( WEN_IN or WEN_TEST_IN or BIST_INPUT_SELECT_INT) begin
      case (BIST_INPUT_SELECT_INT) // synopsys infer_mux
      1'b0 : WEN_NOT_GATED = WEN_IN;
      1'b1 : WEN_NOT_GATED = WEN_TEST_IN;
      endcase
   end

   // Disable memory port during logic test
   assign WEN                       = WEN_NOT_GATED | (LV_TM & (MEM_BYPASS_EN | SCAN_SHIFT_EN));

   // Control logic during memory test
   assign #(20.0) WEN_TEST_IN       = ~(BIST_COLLAR_EN & WEN_TO_MUX);
   assign WEN_TO_MUX                = BIST_WRITEENABLE;

   // Port: WEN }}}

   // Port: CEN LogicalPort: ## Type: READWRITE {{{

   // Intercept functional signal with test mux
   always @( CEN_IN or CEN_TEST_IN or BIST_INPUT_SELECT_INT) begin
      case (BIST_INPUT_SELECT_INT) // synopsys infer_mux
      1'b0 : CEN_NOT_GATED = CEN_IN;
      1'b1 : CEN_NOT_GATED = CEN_TEST_IN;
      endcase
   end

   // Disable memory port during logic test
   assign CEN                       = CEN_NOT_GATED | (LV_TM & (MEM_BYPASS_EN | SCAN_SHIFT_EN));

   // Control logic during memory test
   assign #(20.0) CEN_TEST_IN       = ~(BIST_COLLAR_EN & CEN_TO_MUX);
   assign CEN_TO_MUX                = BIST_SELECT;

   // Port: CEN }}}

//--------------------------
//-- Memory Address Ports --
//--------------------------

   // Port: A LogicalPort: ## Type: READWRITE {{{

   // Intercept functional signal with test mux
   always @( A_IN or A_TEST_IN or BIST_INPUT_SELECT_INT) begin
      case (BIST_INPUT_SELECT_INT) // synopsys infer_mux
      1'b0 : A = A_IN;
      1'b1 : A = A_TEST_IN;
      endcase
   end
   // Address logic during memory test
   wire   [3:0]                     BIST_COL_ADD_SHADOW;
   wire   [3:0]                     BIST_ROW_ADD_SHADOW;
   assign BIST_ROW_ADD_SHADOW[3] = BIST_ROW_ADD[3];
   assign BIST_ROW_ADD_SHADOW[2] = BIST_ROW_ADD[2];
   assign BIST_ROW_ADD_SHADOW[1] = BIST_ROW_ADD[1];
   assign BIST_ROW_ADD_SHADOW[0] = BIST_ROW_ADD[0];
   assign BIST_COL_ADD_SHADOW[3] = BIST_COL_ADD[3];
   assign BIST_COL_ADD_SHADOW[2] = BIST_COL_ADD[2];
   assign BIST_COL_ADD_SHADOW[1] = BIST_COL_ADD[1];
   assign BIST_COL_ADD_SHADOW[0] = BIST_COL_ADD[0];
   assign #(20.0) A_TEST_IN         = {
                                         BIST_ROW_ADD_SHADOW[3],
                                         BIST_ROW_ADD_SHADOW[2],
                                         BIST_ROW_ADD_SHADOW[1],
                                         BIST_ROW_ADD_SHADOW[0],
                                         BIST_COL_ADD_SHADOW[3],
                                         BIST_COL_ADD_SHADOW[2],
                                         BIST_COL_ADD_SHADOW[1],
                                         BIST_COL_ADD_SHADOW[0] 
                                      };

   // Port: A }}}

//--------------------
//-- Data To Memory --
//--------------------


   // Intercept functional signal with test mux
   always @( D_IN or D_TEST_IN or BIST_INPUT_SELECT_INT ) begin
      case (BIST_INPUT_SELECT_INT) // synopsys infer_mux
      1'b0 : D = D_IN;
      1'b1 : D = D_TEST_IN;
      endcase
   end
   // Write data during memory test
   assign #(20.0) D_TEST_IN         = {
                                        DATA_TO_MEM[15],
                                        DATA_TO_MEM[14],
                                        DATA_TO_MEM[13],
                                        DATA_TO_MEM[12],
                                        DATA_TO_MEM[11],
                                        DATA_TO_MEM[10],
                                        DATA_TO_MEM[9],
                                        DATA_TO_MEM[8],
                                        DATA_TO_MEM[7],
                                        DATA_TO_MEM[6],
                                        DATA_TO_MEM[5],
                                        DATA_TO_MEM[4],
                                        DATA_TO_MEM[3],
                                        DATA_TO_MEM[2],
                                        DATA_TO_MEM[1],
                                        DATA_TO_MEM[0] 
                                      };
   // External memory bypass during logic test
   assign D_DIN_OBS                 = {
                                        D[15],
                                        D[14],
                                        D[13],
                                        D[12],
                                        D[11],
                                        D[10],
                                        D[9],
                                        D[8],
                                        D[7],
                                        D[6],
                                        D[5],
                                        D[4],
                                        D[3],
                                        D[2],
                                        D[1],
                                        D[0] 
                                      };
//-------------------
//-- Memory Bypass --
//-------------------
   always @( Q_IN or Q_FROM_BYPASS or MEM_BYPASS_EN) begin
      case (MEM_BYPASS_EN) // synopsys infer_mux
      1'b0 : Q = Q_IN;
      1'b1 : Q = Q_FROM_BYPASS;
      endcase
   end

   assign Q_FROM_BYPASS             = Q_SCAN_IN;

   // synopsys async_set_reset "BIST_ASYNC_RESETN"
   always @ (posedge BIST_CLK_INT or negedge BIST_ASYNC_RESETN) begin
   if (~BIST_ASYNC_RESETN)
      Q_SCAN_IN                     <= 16'd0;
   else
      Q_SCAN_IN                     <= {16{MEM_BYPASS_EN}} & Q_TO_BYPASS;
   end
 
   assign Q_TO_BYPASS               = {
                                        D_DIN_OBS[15],
                                        D_DIN_OBS[14],
                                        D_DIN_OBS[13],
                                        D_DIN_OBS[12],
                                        D_DIN_OBS[11],
                                        D_DIN_OBS[10],
                                        D_DIN_OBS[9],
                                        D_DIN_OBS[8],
                                        D_DIN_OBS[7],
                                        D_DIN_OBS[6],
                                        D_DIN_OBS[5],
                                        D_DIN_OBS[4],
                                        D_DIN_OBS[3],
                                        D_DIN_OBS[2],
                                        D_DIN_OBS[1],
                                        D_DIN_OBS[0] 
                                      };
 

//----------------------
//-- Data From Memory --
//----------------------
 
   assign DATA_FROM_MEM             = {
                                       Q[15],
                                       Q[14],
                                       Q[13],
                                       Q[12],
                                       Q[11],
                                       Q[10],
                                       Q[9],
                                       Q[8],
                                       Q[7],
                                       Q[6],
                                       Q[5],
                                       Q[4],
                                       Q[3],
                                       Q[2],
                                       Q[1],
                                       Q[0] 
                                      };
 
    assign EDATA_CKB_EN             = CHKBCI_PHASE;

    assign EDATA_COL_ADD_BIT0       = BIST_COL_ADD[0:0];

//---------------------------
//-- Replicate Expect Data --
//---------------------------
 
   assign BIST_EXPECT_DATA_REP      = { // 
                                      BIST_EXPECT_DATA,
                                      BIST_EXPECT_DATA,
                                      BIST_EXPECT_DATA,
                                      BIST_EXPECT_DATA,
                                      BIST_EXPECT_DATA,
                                      BIST_EXPECT_DATA,
                                      BIST_EXPECT_DATA,
                                      BIST_EXPECT_DATA
                                     };
//-----------------
//-- Expect Data --
//-----------------
   assign BIST_EXPECT_DATA_INT      = ~(EDATA_CKB_EN) ? BIST_EXPECT_DATA_REP : ({16{BIST_EXPECT_DATA_REP[0]}} ^ {16{EDATA_COL_ADD_BIT0}});
   assign DATA_FROM_MEM_EXP         = BIST_EXPECT_DATA_INT;
assign CMP_EN = BIST_CMP;

//-----------------------
//-- Local Comparators --
//-----------------------
 
   assign RAW_CMP_STAT[15]          = ~(DATA_FROM_MEM[15] == DATA_FROM_MEM_EXP[15]);
   assign RAW_CMP_STAT[14]          = ~(DATA_FROM_MEM[14] == DATA_FROM_MEM_EXP[14]);
   assign RAW_CMP_STAT[13]          = ~(DATA_FROM_MEM[13] == DATA_FROM_MEM_EXP[13]);
   assign RAW_CMP_STAT[12]          = ~(DATA_FROM_MEM[12] == DATA_FROM_MEM_EXP[12]);
   assign RAW_CMP_STAT[11]          = ~(DATA_FROM_MEM[11] == DATA_FROM_MEM_EXP[11]);
   assign RAW_CMP_STAT[10]          = ~(DATA_FROM_MEM[10] == DATA_FROM_MEM_EXP[10]);
   assign RAW_CMP_STAT[9]           = ~(DATA_FROM_MEM[9] == DATA_FROM_MEM_EXP[9]);
   assign RAW_CMP_STAT[8]           = ~(DATA_FROM_MEM[8] == DATA_FROM_MEM_EXP[8]);
   assign RAW_CMP_STAT[7]           = ~(DATA_FROM_MEM[7] == DATA_FROM_MEM_EXP[7]);
   assign RAW_CMP_STAT[6]           = ~(DATA_FROM_MEM[6] == DATA_FROM_MEM_EXP[6]);
   assign RAW_CMP_STAT[5]           = ~(DATA_FROM_MEM[5] == DATA_FROM_MEM_EXP[5]);
   assign RAW_CMP_STAT[4]           = ~(DATA_FROM_MEM[4] == DATA_FROM_MEM_EXP[4]);
   assign RAW_CMP_STAT[3]           = ~(DATA_FROM_MEM[3] == DATA_FROM_MEM_EXP[3]);
   assign RAW_CMP_STAT[2]           = ~(DATA_FROM_MEM[2] == DATA_FROM_MEM_EXP[2]);
   assign RAW_CMP_STAT[1]           = ~(DATA_FROM_MEM[1] == DATA_FROM_MEM_EXP[1]);
   assign RAW_CMP_STAT[0]           = ~(DATA_FROM_MEM[0] == DATA_FROM_MEM_EXP[0]);
  
wire                                FREEZE_GO_ID;
reg                                 FREEZE_STOP_ERROR_EARLY_R; 
assign FREEZE_GO_ID = BIST_SHIFT_COLLAR | (~(BIST_CMP & BIST_COLLAR_EN)) | FREEZE_STOP_ERROR_EARLY_R;
   
//----------------
// STOP_ON_ERROR  
//----------------
wire                                SOE_ERROR;
wire                                FREEZE_STOP_ERROR_CLEAR;
wire                                FREEZE_STOP_ERROR_EARLY;
assign SOE_ERROR = (|ERROR) & BIST_ON;
assign FREEZE_STOP_ERROR_EARLY = ERROR_CNT_ZERO & SOE_ERROR;
  
// synopsys sync_set_reset "FREEZE_STOP_ERROR_CLEAR"
assign FREEZE_STOP_ERROR_CLEAR = (~GO_EN) & (~(BIST_COLLAR_HOLD|FREEZE_STOP_ERROR)) & (~BIST_SHIFT_COLLAR);
 
// synopsys async_set_reset "BIST_ASYNC_RESETN"
always @(posedge BIST_CLK_OR_TCK or negedge BIST_ASYNC_RESETN) begin
  if (~BIST_ASYNC_RESETN) begin
    FREEZE_STOP_ERROR_EARLY_R <= 1'b0;
  end else 
  if (FREEZE_STOP_ERROR_CLEAR) begin
    FREEZE_STOP_ERROR_EARLY_R <= 1'b0;
  end else begin
    if (BIST_SHIFT_COLLAR) begin
      FREEZE_STOP_ERROR_EARLY_R <= FREEZE_STOP_ERROR_SI;
    end else 
    if ((~(BIST_COLLAR_HOLD|FREEZE_STOP_ERROR)) & GO_EN) begin
        FREEZE_STOP_ERROR_EARLY_R <= FREEZE_STOP_ERROR_EARLY | FREEZE_STOP_ERROR_EARLY_R;
    end
  end
end

assign HOLD_EN = BIST_COLLAR_HOLD | FREEZE_STOP_ERROR_EARLY_R | FREEZE_STOP_ERROR;
 
assign COLLAR_STATUS_SI = BIST_SI;
dtmf_recvr_core_rtl1_tessent_mbist_c1_interface_m1_STATUS MBISTPG_STATUS (
    .BIST_CLK                      ( BIST_CLK_OR_TCK              ),
    .BIST_ASYNC_RESETN             (BIST_ASYNC_RESETN           ),
    .MCP_BOUNDING_EN               (MCP_BOUNDING_EN      ), 
    .FREEZE_GO_ID                  (FREEZE_GO_ID                ),
    .CMP_EN                        (CMP_EN                      ),
    .FREEZE_STOP_ERROR_EARLY_R     (FREEZE_STOP_ERROR_EARLY_R   ),
   .GO_EN                          (GO_EN                      ),
   .BIST_COLLAR_SETUP              (BIST_COLLAR_SETUP          ),
   .BIST_COLLAR_HOLD               (BIST_COLLAR_HOLD_INT       ),
   .BIST_SHIFT_COLLAR              (BIST_SHIFT_COLLAR          ),
   .BIST_ON                        (BIST_ON                    ),
   .BIST_CLEAR                     (BIST_CLEAR                 ),
   .USE_DEFAULTS                   (USE_DEFAULTS               ),
   .SI                             (COLLAR_STATUS_SI           ),
   .ERROR                          ( ERROR               ),
   .ERROR_R                        ( ERROR_R             ),
   .BIST_DIAG_EN                   (BIST_DIAG_EN         ),
   .RAW_CMP_STAT                   (RAW_CMP_STAT               ),
   .BIST_GO                        (BIST_GO              ),
   .INCLUDE_MEM_RESULTS_REG        (INCLUDE_MEM_RESULTS_REG    ),
   .SO                             (COLLAR_STATUS_SO           )
);
assign FREEZE_STOP_ERROR_SI = COLLAR_STATUS_SO;
 
assign STATUS_SO = FREEZE_STOP_ERROR_EARLY_R;
    
assign BIST_SO                      = STATUS_SO;
 
 
    assign BIST_CLK_EN  = BIST_RUN | BIST_COLLAR_SETUP|BIST_CLEAR|BIST_CLEAR_DEFAULT|RESET_REG_SETUP2|(BIST_INPUT_SELECT ^ BIST_TESTDATA_SELECT_TO_COLLAR);
//---------------------
//-- BIST_CLK Gating --
//---------------------
wire   INJECT_TCK;      
    assign INJECT_TCK = BIST_SHIFT_COLLAR & ~LV_TM; 
    cgand tessent_persistent_cell_GATING_BIST_CLK (
        .CK         ( BIST_CLK                    ),
        .TE         ( 1'b0         ),
        .FE         ( BIST_CLK_EN  ),
        .GCK        ( BIST_CLK_INT                )
    );
        clock_mux21 tessent_persistent_cell_BIST_CLK_OR_TCK (
        .S0         ( INJECT_TCK                                 ),
        .A0         ( BIST_CLK_INT                               ),
        .A1         ( TCK                                        ),
        .Y          ( BIST_CLK_OR_TCK                            )
    );

endmodule // dtmf_recvr_core_rtl1_tessent_mbist_c1_interface_m1



    
module dtmf_recvr_core_rtl1_tessent_mbist_c1_interface_m1_STATUS (
  input  wire        BIST_CLEAR,
  input  wire        FREEZE_STOP_ERROR_EARLY_R,
  input  wire        FREEZE_GO_ID,
  input  wire        CMP_EN,
  input  wire        BIST_ASYNC_RESETN,
  input  wire        BIST_CLK,
  input  wire        BIST_COLLAR_SETUP,
  input  wire        BIST_COLLAR_HOLD,
  input  wire        BIST_SHIFT_COLLAR,
  input  wire        BIST_ON,
  input  wire        USE_DEFAULTS,
  input  wire        SI,
  input  wire        BIST_DIAG_EN,
  input  wire [15:0] RAW_CMP_STAT,
  input  wire        MCP_BOUNDING_EN,
  input  wire        INCLUDE_MEM_RESULTS_REG,
  output reg         GO_EN,
  output wire [0:0]  ERROR,
  output wire [0:0]  ERROR_R,
  output wire        SO,
  output wire        BIST_GO
);
wire        GO_ID_REG_RST;
reg  [15:0] GO_ID_REG;
wire        BIST_GO_INT;
wire [15:0] ROW_DATA_MAP;
wire        GO_ID_FEEDBACK_EN;
wire [0:0]  IO_SEG_GLOBAL_GO_ID;
reg  [0:0]  ERROR_R1;

 
   //----------------
   // Row Data Map --
   //----------------
 assign ROW_DATA_MAP = RAW_CMP_STAT;
 
   //-----------
   //-- GO_EN --
   //-----------
   //synopsys sync_set_reset "BIST_ON"
   // synopsys async_set_reset "BIST_ASYNC_RESETN"
   always @ (posedge BIST_CLK or negedge BIST_ASYNC_RESETN) begin
      if (~BIST_ASYNC_RESETN)
         GO_EN       <= 1'b0;
      else
      if (~BIST_ON) begin
         GO_EN       <= 1'b0;
      end else begin
         if (BIST_COLLAR_SETUP) begin
            GO_EN    <= 1'b1; 
         end
      end
   end
   assign GO_ID_FEEDBACK_EN         = ~(BIST_DIAG_EN) ;
   assign BIST_GO_INT               = ~|ERROR_R;
   assign BIST_GO    = BIST_GO_INT;
 
 
 
   //---------------
   //-- GO_ID_REG --
   //---------------
reg  CMP_EN_R;
  // synopsys async_set_reset "BIST_ASYNC_RESETN"
   always @ (posedge BIST_CLK or negedge BIST_ASYNC_RESETN) begin
      if (~BIST_ASYNC_RESETN) begin
         CMP_EN_R    <= 1'b0;
      end else begin
         CMP_EN_R    <= (~FREEZE_GO_ID) & (~BIST_COLLAR_HOLD);
      end
   end

   assign GO_ID_REG_RST            = BIST_CLEAR | (~INCLUDE_MEM_RESULTS_REG & BIST_SHIFT_COLLAR);
   wire HOLD_OR_RESET;
    
wire [15:0] GO_ID_REG_MUX, BIST_SHIFT_COLLAR_MUX;
wire [15:0] GO_ID_REG_MUX_SEL ;
wire GO_ID_REG_CLR;
wire GO_ID_REG_BYPASS;
  // synopsys sync_set_reset "GO_ID_REG_RST"
   assign HOLD_OR_RESET = MCP_BOUNDING_EN | GO_ID_REG_RST | BIST_COLLAR_HOLD | ~GO_EN;
   assign GO_ID_REG_CLR = (~MCP_BOUNDING_EN) & (GO_ID_REG_RST | ((~BIST_COLLAR_HOLD) & (~GO_ID_FEEDBACK_EN) & CMP_EN) | (CMP_EN_R & BIST_COLLAR_HOLD & (~FREEZE_STOP_ERROR_EARLY_R)));
// Instantiate persistent GO_ID_REG_MUX cells {{{
    mux21 tessent_persistent_cell_MUX_GO_ID_REG0 (
            .S0      ( GO_ID_REG_MUX_SEL[0]        ),
            .A1      ( BIST_SHIFT_COLLAR_MUX[0] & ~GO_ID_REG_CLR  ),
            .A0      ( ROW_DATA_MAP[0]             ),
            .Y       ( GO_ID_REG_MUX[0]            )
            );
    mux21 tessent_persistent_cell_MUX_GO_ID_REG1 (
            .S0      ( GO_ID_REG_MUX_SEL[1]        ),
            .A1      ( BIST_SHIFT_COLLAR_MUX[1] & ~GO_ID_REG_CLR  ),
            .A0      ( ROW_DATA_MAP[1]             ),
            .Y       ( GO_ID_REG_MUX[1]            )
            );
    mux21 tessent_persistent_cell_MUX_GO_ID_REG2 (
            .S0      ( GO_ID_REG_MUX_SEL[2]        ),
            .A1      ( BIST_SHIFT_COLLAR_MUX[2] & ~GO_ID_REG_CLR  ),
            .A0      ( ROW_DATA_MAP[2]             ),
            .Y       ( GO_ID_REG_MUX[2]            )
            );
    mux21 tessent_persistent_cell_MUX_GO_ID_REG3 (
            .S0      ( GO_ID_REG_MUX_SEL[3]        ),
            .A1      ( BIST_SHIFT_COLLAR_MUX[3] & ~GO_ID_REG_CLR  ),
            .A0      ( ROW_DATA_MAP[3]             ),
            .Y       ( GO_ID_REG_MUX[3]            )
            );
    mux21 tessent_persistent_cell_MUX_GO_ID_REG4 (
            .S0      ( GO_ID_REG_MUX_SEL[4]        ),
            .A1      ( BIST_SHIFT_COLLAR_MUX[4] & ~GO_ID_REG_CLR  ),
            .A0      ( ROW_DATA_MAP[4]             ),
            .Y       ( GO_ID_REG_MUX[4]            )
            );
    mux21 tessent_persistent_cell_MUX_GO_ID_REG5 (
            .S0      ( GO_ID_REG_MUX_SEL[5]        ),
            .A1      ( BIST_SHIFT_COLLAR_MUX[5] & ~GO_ID_REG_CLR  ),
            .A0      ( ROW_DATA_MAP[5]             ),
            .Y       ( GO_ID_REG_MUX[5]            )
            );
    mux21 tessent_persistent_cell_MUX_GO_ID_REG6 (
            .S0      ( GO_ID_REG_MUX_SEL[6]        ),
            .A1      ( BIST_SHIFT_COLLAR_MUX[6] & ~GO_ID_REG_CLR  ),
            .A0      ( ROW_DATA_MAP[6]             ),
            .Y       ( GO_ID_REG_MUX[6]            )
            );
    mux21 tessent_persistent_cell_MUX_GO_ID_REG7 (
            .S0      ( GO_ID_REG_MUX_SEL[7]        ),
            .A1      ( BIST_SHIFT_COLLAR_MUX[7] & ~GO_ID_REG_CLR  ),
            .A0      ( ROW_DATA_MAP[7]             ),
            .Y       ( GO_ID_REG_MUX[7]            )
            );
    mux21 tessent_persistent_cell_MUX_GO_ID_REG8 (
            .S0      ( GO_ID_REG_MUX_SEL[8]        ),
            .A1      ( BIST_SHIFT_COLLAR_MUX[8] & ~GO_ID_REG_CLR  ),
            .A0      ( ROW_DATA_MAP[8]             ),
            .Y       ( GO_ID_REG_MUX[8]            )
            );
    mux21 tessent_persistent_cell_MUX_GO_ID_REG9 (
            .S0      ( GO_ID_REG_MUX_SEL[9]        ),
            .A1      ( BIST_SHIFT_COLLAR_MUX[9] & ~GO_ID_REG_CLR  ),
            .A0      ( ROW_DATA_MAP[9]             ),
            .Y       ( GO_ID_REG_MUX[9]            )
            );
    mux21 tessent_persistent_cell_MUX_GO_ID_REG10 (
            .S0      ( GO_ID_REG_MUX_SEL[10]       ),
            .A1      ( BIST_SHIFT_COLLAR_MUX[10] & ~GO_ID_REG_CLR                ),
            .A0      ( ROW_DATA_MAP[10]            ),
            .Y       ( GO_ID_REG_MUX[10]           )
            );
    mux21 tessent_persistent_cell_MUX_GO_ID_REG11 (
            .S0      ( GO_ID_REG_MUX_SEL[11]       ),
            .A1      ( BIST_SHIFT_COLLAR_MUX[11] & ~GO_ID_REG_CLR                ),
            .A0      ( ROW_DATA_MAP[11]            ),
            .Y       ( GO_ID_REG_MUX[11]           )
            );
    mux21 tessent_persistent_cell_MUX_GO_ID_REG12 (
            .S0      ( GO_ID_REG_MUX_SEL[12]       ),
            .A1      ( BIST_SHIFT_COLLAR_MUX[12] & ~GO_ID_REG_CLR                ),
            .A0      ( ROW_DATA_MAP[12]            ),
            .Y       ( GO_ID_REG_MUX[12]           )
            );
    mux21 tessent_persistent_cell_MUX_GO_ID_REG13 (
            .S0      ( GO_ID_REG_MUX_SEL[13]       ),
            .A1      ( BIST_SHIFT_COLLAR_MUX[13] & ~GO_ID_REG_CLR                ),
            .A0      ( ROW_DATA_MAP[13]            ),
            .Y       ( GO_ID_REG_MUX[13]           )
            );
    mux21 tessent_persistent_cell_MUX_GO_ID_REG14 (
            .S0      ( GO_ID_REG_MUX_SEL[14]       ),
            .A1      ( BIST_SHIFT_COLLAR_MUX[14] & ~GO_ID_REG_CLR                ),
            .A0      ( ROW_DATA_MAP[14]            ),
            .Y       ( GO_ID_REG_MUX[14]           )
            );
    mux21 tessent_persistent_cell_MUX_GO_ID_REG15 (
            .S0      ( GO_ID_REG_MUX_SEL[15]       ),
            .A1      ( BIST_SHIFT_COLLAR_MUX[15] & ~GO_ID_REG_CLR                ),
            .A0      ( ROW_DATA_MAP[15]            ),
            .Y       ( GO_ID_REG_MUX[15]           )
            );
// Instantiate persistent GO_ID_REG_MUX cells }}}
   assign GO_ID_REG_MUX_SEL = (GO_ID_REG & {16{GO_ID_FEEDBACK_EN}})  | {16 {HOLD_OR_RESET | FREEZE_GO_ID }};
   assign BIST_SHIFT_COLLAR_MUX = ((~MCP_BOUNDING_EN) & BIST_SHIFT_COLLAR) ? {SI,GO_ID_REG[15:1]} : GO_ID_REG;
 
   // synopsys async_set_reset "BIST_ASYNC_RESETN"
   always @ (posedge BIST_CLK or negedge BIST_ASYNC_RESETN) begin
      if (~BIST_ASYNC_RESETN)
         GO_ID_REG   <= {16{1'b0}};
      else
         GO_ID_REG   <= GO_ID_REG_MUX;
   end
   assign GO_ID_REG_BYPASS = (INCLUDE_MEM_RESULTS_REG) ? GO_ID_REG[0] : SI;

    
  assign IO_SEG_GLOBAL_GO_ID[0] = |GO_ID_REG;
  assign ERROR[0] = GO_EN & IO_SEG_GLOBAL_GO_ID[0] & (CMP_EN_R | GO_ID_FEEDBACK_EN | BIST_COLLAR_HOLD);
  // synopsys async_set_reset "BIST_ASYNC_RESETN"
   always @ (posedge BIST_CLK  or negedge BIST_ASYNC_RESETN) begin
        if (~BIST_ASYNC_RESETN) begin
         ERROR_R1    <= {1{1'b0}};
      end else 
      if ( BIST_CLEAR ) begin
         ERROR_R1    <= {1{1'b0}};
      end else begin
         ERROR_R1    <= ERROR;
      end
   end
  assign ERROR_R   = ERROR_R1;

                       
   //------
   // SO --
   //------
   assign SO         = GO_ID_REG_BYPASS;
endmodule // dtmf_recvr_core_rtl1_tessent_mbist_c1_interface_m1_STATUS



