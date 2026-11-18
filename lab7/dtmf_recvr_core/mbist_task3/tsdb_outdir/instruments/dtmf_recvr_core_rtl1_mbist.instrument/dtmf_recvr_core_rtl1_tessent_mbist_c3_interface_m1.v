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
-       Created on: Tue Nov 17 19:22:01 IST 2026                                 -
----------------------------------------------------------------------------------


*/
`timescale 100 ps / 10 ps

/*------------------------------------------------------------------------------
     Module      :  dtmf_recvr_core_rtl1_tessent_mbist_c3_interface_m1
 
     Description :  This module contains the interface logic for the memory
                    module rom_512x16A
 
--------------------------------------------------------------------------------
     Interface Options in Effect
 
     BistDataPipelineStages        : 0;
     BitGrouping                   : 1;
     BitSliceWidth                 : 1;
     ConcurrentWrite               : OFF 
     ConcurrentRead                : OFF 
     ControllerType                : PROG;
     DataOutStage                  : NONE;
     DefaultAlgorithm              : READONLY;
     DefaultOperationSet           : ROM;
     InternalScanLogic             : OFF;
     LocalComparators              : ON;
     MemoryType                    : ROM;
     ObservationLogic              : ON;
     OutputEnableControl           : ALWAYSON;
     PipelineSerialDataOut         : OFF;
     ScanWriteThru                 : OFF;
     ShadowRead                    : OFF;
     ShadowWrite                   : OFF;
     Stop-On-Error Limit           : OFF;
     TransparentMode               : SYNCMUX;
 
---------------------------------------------------------------------------- */

module dtmf_recvr_core_rtl1_tessent_mbist_c3_interface_m1 (
  input  wire        MBISTPG_COMPARE_MISR,
  input  wire        CEN_IN,
  input  wire [8:0]  A_IN,
  input  wire [15:0] Q_IN,
  input  wire        TCK,
  input  wire        BIST_CMP,
  input  wire        INCLUDE_MEM_RESULTS_REG,
  input  wire        BIST_SELECT,
  input  wire [3:0]  BIST_COL_ADD,
  input  wire [4:0]  BIST_ROW_ADD,
  input  wire        BIST_TESTDATA_SELECT_TO_COLLAR,
  input  wire        MEM_BYPASS_EN,
  input  wire        SCAN_SHIFT_EN,
  input  wire        MCP_BOUNDING_EN,
  input  wire        BIST_ON,
  input  wire        BIST_RUN,
  input  wire        BIST_ASYNC_RESETN,
  input  wire        BIST_CLK,
  input  wire        BIST_SHIFT_COLLAR,
  input  wire        BIST_SI,
  input  wire        BIST_COLLAR_SETUP,
  input  wire        BIST_COLLAR_HOLD,
  input  wire        BIST_CLEAR_DEFAULT,
  input  wire        BIST_CLEAR,
  input  wire        BIST_SETUP0,
  input  wire        LV_TM,
  input  wire        BIST_COLLAR_EN,
  output wire        CEN,
  output reg  [8:0]  A,
  output wire [15:0] Q,
  output reg  [3:0]  SCAN_OBS_FLOPS,
  output wire        BIST_SO,
  output wire        BIST_GO
);


wire [23:0] BIST_PORT0_MISR_Q;
wire [23:0] BIST_PORT0_MISR_QB;
wire [23:0] BIST_PORT0_MISR_SIGNATURE;
reg         MISR_SIGNATURE;
wire        MISR_GO_INT;
reg         MISR_GO_R;
wire        CMP_EN;
wire        MISR_BYPASS_MUX;
reg         BIST_INPUT_SELECT;
wire        BIST_EN_RST;
wire        BIST_CLK_INT;
wire        BIST_CLK_OR_TCK;
wire        BIST_CLK_EN;
wire        STATUS_SO;
wire        BIST_MISR_PORT0_SO;
wire        BIST_MISR_PORT0_STB;
wire        BIST_INPUT_SELECT_INT;
wire [0:0]  ERROR;
wire [0:0]  ERROR_R;
wire [15:0] DATA_TO_MEM;
wire [15:0] DATA_FROM_MEM;
wire [15:0] DATA_FROM_MEM_EXP;
wire        CEN_TEST_IN;
reg         CEN_NOT_GATED;
wire        CEN_TO_MUX;
wire [8:0]  A_TEST_IN;
wire [15:0] Q_TO_BYPASS;
wire [15:0] Q_FROM_BYPASS;
wire [15:0] Q_SCAN_IN;
wire        USE_DEFAULTS;
wire        BIST_COLLAR_HOLD_INT;
reg         BIST_COLLAR_EN_REG;
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

//-------------------
//-- Collar Enable --
//-------------------
    // synopsys async_set_reset "BIST_ASYNC_RESETN"
    always @ (posedge BIST_CLK_INT or negedge BIST_ASYNC_RESETN) begin
        if (~BIST_ASYNC_RESETN) begin
            BIST_COLLAR_EN_REG      <= 1'b0;
        end else begin
            BIST_COLLAR_EN_REG      <= BIST_COLLAR_EN;
        end
    end
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
    assign BIST_COLLAR_HOLD_INT = BIST_COLLAR_HOLD;
//-----------------------
//-- Observation Logic --
//-----------------------
  // synopsys async_set_reset "BIST_ASYNC_RESETN"
  always @ (posedge BIST_CLK_INT or negedge BIST_ASYNC_RESETN) begin
    if (~BIST_ASYNC_RESETN)
      SCAN_OBS_FLOPS    <= 4'b0000;
    else
      SCAN_OBS_FLOPS    <= {4{MEM_BYPASS_EN} } & {
                          CEN_NOT_GATED        ^ A[8]                 ^ A[7]                 ,
                          A[6]                 ^ A[5]                 ^ A[4]                 ,
                          A[3]                 ^ A[2]                 ^ A[1]                 ,
                          A[0]                 
                           };
  end
 
 
 
 
 

//--------------------------
//-- Memory Control Ports --
//--------------------------

   // Port: CEN LogicalPort: ## Type: READ {{{

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

   // Port: A LogicalPort: ## Type: READ {{{

   // Intercept functional signal with test mux
   always @( A_IN or A_TEST_IN or BIST_INPUT_SELECT_INT) begin
      case (BIST_INPUT_SELECT_INT) // synopsys infer_mux
      1'b0 : A = A_IN;
      1'b1 : A = A_TEST_IN;
      endcase
   end
   // Address logic during memory test
   wire   [3:0]                     BIST_COL_ADD_SHADOW;
   wire   [4:0]                     BIST_ROW_ADD_SHADOW;
   assign BIST_ROW_ADD_SHADOW[4] = BIST_ROW_ADD[4];
   assign BIST_ROW_ADD_SHADOW[3] = BIST_ROW_ADD[3];
   assign BIST_ROW_ADD_SHADOW[2] = BIST_ROW_ADD[2];
   assign BIST_ROW_ADD_SHADOW[1] = BIST_ROW_ADD[1];
   assign BIST_ROW_ADD_SHADOW[0] = BIST_ROW_ADD[0];
   assign BIST_COL_ADD_SHADOW[3] = BIST_COL_ADD[3];
   assign BIST_COL_ADD_SHADOW[2] = BIST_COL_ADD[2];
   assign BIST_COL_ADD_SHADOW[1] = BIST_COL_ADD[1];
   assign BIST_COL_ADD_SHADOW[0] = BIST_COL_ADD[0];
   assign #(20.0) A_TEST_IN         = {
                                         BIST_ROW_ADD_SHADOW[4],
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

//----------------------
//-- Data From Memory --
//----------------------
   // External memory bypass during logic test
   assign Q_SCAN_IN = MEM_BYPASS_EN ? BIST_PORT0_MISR_Q[15:0] : Q_IN;
   assign Q = Q_SCAN_IN;
 
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
 
assign CMP_EN = BIST_CMP;
  
 
 
wire CLEAR_MISR;
wire COMPARE_MISR;
 
assign BIST_MISR_PORT0_STB = BIST_CMP;
 
assign CLEAR_MISR = BIST_CLEAR;
 
assign COMPARE_MISR = MBISTPG_COMPARE_MISR & BIST_COLLAR_EN_REG;
 
dtmf_recvr_core_rtl1_tessent_mbist_c3_interface_m1_MISR MBISTPG_PORT0_MISR (
        .DOUT              ( DATA_FROM_MEM        ) ,
        .BIST_CLK          ( BIST_CLK_OR_TCK         ) ,
        .BIST_SHIFT        ( BIST_SHIFT_COLLAR    ) ,
        .BIST_HOLD         ( BIST_COLLAR_HOLD_INT ) ,
        .BIST_ON           ( BIST_ON              ) ,
        .BIST_SI           ( BIST_SI         ) , 
        .BIST_MISR_STB     ( BIST_MISR_PORT0_STB ) ,
        .BIST_COLLAR_EN    ( BIST_COLLAR_EN   ) , 
        .BIST_CLEAR        ( CLEAR_MISR           ) ,
        .MISR_Q            ( BIST_PORT0_MISR_Q  ) ,
        .MISR_QB           ( BIST_PORT0_MISR_QB ) ,
        .BIST_ASYNC_RESETN ( BIST_ASYNC_RESETN    ),
        .BIST_SO           ( BIST_MISR_PORT0_SO ) 
);
 
dtmf_recvr_core_rtl1_tessent_mbist_c3_interface_m1_MISR_STRAP M1_PORT0_MISR_STRAP (
        .MISR_IN            ( BIST_PORT0_MISR_Q              ) ,
        .MISR_INB           ( BIST_PORT0_MISR_QB             ) ,
        .MISR_SIGNATURE     ( BIST_PORT0_MISR_SIGNATURE      )
);
assign MISR_BYPASS_MUX = INCLUDE_MEM_RESULTS_REG ? BIST_MISR_PORT0_SO : BIST_SI;
 
always @( COMPARE_MISR or MISR_GO_R or BIST_PORT0_MISR_SIGNATURE ) begin
    if ( MISR_GO_R ) begin
        if ( COMPARE_MISR ) begin
            MISR_SIGNATURE = MISR_GO_R & (&BIST_PORT0_MISR_SIGNATURE);
        end else begin
            MISR_SIGNATURE = MISR_GO_R ;
        end
    end else begin
        MISR_SIGNATURE = 1'b0;
    end
end
assign MISR_GO_INT = COMPARE_MISR ? MISR_SIGNATURE : MISR_GO_R;
 
// synopsys async_set_reset "BIST_ASYNC_RESETN"
always @(posedge BIST_CLK_OR_TCK or negedge BIST_ASYNC_RESETN) begin
    if ( ~ BIST_ASYNC_RESETN ) 
        MISR_GO_R <= 1'b0;
    else
    if ( BIST_SHIFT_COLLAR )
        MISR_GO_R <= MISR_BYPASS_MUX;
    else
    if ( CLEAR_MISR ) 
        MISR_GO_R <= 1'b1;
    else 
        MISR_GO_R <= BIST_ON & MISR_GO_R & MISR_GO_INT; 
end
 
assign BIST_GO = MISR_GO_R;
 
assign STATUS_SO = MISR_GO_R;
    
assign BIST_SO                      = STATUS_SO;
 
 
    assign BIST_CLK_EN  = BIST_RUN | BIST_COLLAR_SETUP|BIST_CLEAR|BIST_CLEAR_DEFAULT|(BIST_INPUT_SELECT ^ BIST_TESTDATA_SELECT_TO_COLLAR);
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

endmodule // dtmf_recvr_core_rtl1_tessent_mbist_c3_interface_m1



module dtmf_recvr_core_rtl1_tessent_mbist_c3_interface_m1_MISR (
  input  wire        BIST_CLK,
  input  wire        BIST_SHIFT,
  input  wire        BIST_HOLD,
  input  wire        BIST_ON,
  input  wire        BIST_SI,
  input  wire        BIST_MISR_STB,
  input  wire        BIST_COLLAR_EN,
  input  wire        BIST_CLEAR,
  input  wire        BIST_ASYNC_RESETN,
  input  wire [15:0] DOUT,
  output wire        BIST_SO,
  output wire [23:0] MISR_Q,
  output wire [23:0] MISR_QB
);
wire [15:0] DOUT_GATED;
wire        CAPTURE_MISR;
reg  [23:0] MISR_SEG0;
reg  [23:0] MISR_SEG0_INT;

assign MISR_Q = {
                MISR_SEG0[23:0]
                };
assign MISR_QB = ~MISR_Q;
 
assign CAPTURE_MISR = BIST_MISR_STB & BIST_COLLAR_EN;
 
wire X_PREV_CELL_GATE_EN;
 
assign X_PREV_CELL_GATE_EN = CAPTURE_MISR;
 
and02 tessent_persistent_cell_AND_DOUT0 (
            .A0      ( DOUT[0]      ),
            .A1      ( X_PREV_CELL_GATE_EN         ),
            .Y       ( DOUT_GATED[0]               )
        );
and02 tessent_persistent_cell_AND_DOUT1 (
            .A0      ( DOUT[1]      ),
            .A1      ( X_PREV_CELL_GATE_EN         ),
            .Y       ( DOUT_GATED[1]               )
        );
and02 tessent_persistent_cell_AND_DOUT2 (
            .A0      ( DOUT[2]      ),
            .A1      ( X_PREV_CELL_GATE_EN         ),
            .Y       ( DOUT_GATED[2]               )
        );
and02 tessent_persistent_cell_AND_DOUT3 (
            .A0      ( DOUT[3]      ),
            .A1      ( X_PREV_CELL_GATE_EN         ),
            .Y       ( DOUT_GATED[3]               )
        );
and02 tessent_persistent_cell_AND_DOUT4 (
            .A0      ( DOUT[4]      ),
            .A1      ( X_PREV_CELL_GATE_EN         ),
            .Y       ( DOUT_GATED[4]               )
        );
and02 tessent_persistent_cell_AND_DOUT5 (
            .A0      ( DOUT[5]      ),
            .A1      ( X_PREV_CELL_GATE_EN         ),
            .Y       ( DOUT_GATED[5]               )
        );
and02 tessent_persistent_cell_AND_DOUT6 (
            .A0      ( DOUT[6]      ),
            .A1      ( X_PREV_CELL_GATE_EN         ),
            .Y       ( DOUT_GATED[6]               )
        );
and02 tessent_persistent_cell_AND_DOUT7 (
            .A0      ( DOUT[7]      ),
            .A1      ( X_PREV_CELL_GATE_EN         ),
            .Y       ( DOUT_GATED[7]               )
        );
and02 tessent_persistent_cell_AND_DOUT8 (
            .A0      ( DOUT[8]      ),
            .A1      ( X_PREV_CELL_GATE_EN         ),
            .Y       ( DOUT_GATED[8]               )
        );
and02 tessent_persistent_cell_AND_DOUT9 (
            .A0      ( DOUT[9]      ),
            .A1      ( X_PREV_CELL_GATE_EN         ),
            .Y       ( DOUT_GATED[9]               )
        );
and02 tessent_persistent_cell_AND_DOUT10 (
            .A0      ( DOUT[10]     ),
            .A1      ( X_PREV_CELL_GATE_EN         ),
            .Y       ( DOUT_GATED[10]              )
        );
and02 tessent_persistent_cell_AND_DOUT11 (
            .A0      ( DOUT[11]     ),
            .A1      ( X_PREV_CELL_GATE_EN         ),
            .Y       ( DOUT_GATED[11]              )
        );
and02 tessent_persistent_cell_AND_DOUT12 (
            .A0      ( DOUT[12]     ),
            .A1      ( X_PREV_CELL_GATE_EN         ),
            .Y       ( DOUT_GATED[12]              )
        );
and02 tessent_persistent_cell_AND_DOUT13 (
            .A0      ( DOUT[13]     ),
            .A1      ( X_PREV_CELL_GATE_EN         ),
            .Y       ( DOUT_GATED[13]              )
        );
and02 tessent_persistent_cell_AND_DOUT14 (
            .A0      ( DOUT[14]     ),
            .A1      ( X_PREV_CELL_GATE_EN         ),
            .Y       ( DOUT_GATED[14]              )
        );
and02 tessent_persistent_cell_AND_DOUT15 (
            .A0      ( DOUT[15]     ),
            .A1      ( X_PREV_CELL_GATE_EN         ),
            .Y       ( DOUT_GATED[15]              )
        );
 
always @(DOUT_GATED or CAPTURE_MISR or MISR_SEG0 ) begin
    if (CAPTURE_MISR) begin
        MISR_SEG0_INT[0]            = DOUT_GATED[0] ^ MISR_SEG0[23];
        MISR_SEG0_INT[1]            = DOUT_GATED[1] ^ MISR_SEG0[0] ^ MISR_SEG0[23]; 
        MISR_SEG0_INT[2]            = DOUT_GATED[2] ^ MISR_SEG0[1]; 
        MISR_SEG0_INT[3]            = DOUT_GATED[3] ^ MISR_SEG0[2] ^ MISR_SEG0[23]; 
        MISR_SEG0_INT[4]            = DOUT_GATED[4] ^ MISR_SEG0[3] ^ MISR_SEG0[23]; 
        MISR_SEG0_INT[5]            = DOUT_GATED[5] ^ MISR_SEG0[4]; 
        MISR_SEG0_INT[6]            = DOUT_GATED[6] ^ MISR_SEG0[5]; 
        MISR_SEG0_INT[7]            = DOUT_GATED[7] ^ MISR_SEG0[6]; 
        MISR_SEG0_INT[8]            = DOUT_GATED[8] ^ MISR_SEG0[7]; 
        MISR_SEG0_INT[9]            = DOUT_GATED[9] ^ MISR_SEG0[8]; 
        MISR_SEG0_INT[10]           = DOUT_GATED[10] ^ MISR_SEG0[9]; 
        MISR_SEG0_INT[11]           = DOUT_GATED[11] ^ MISR_SEG0[10]; 
        MISR_SEG0_INT[12]           = DOUT_GATED[12] ^ MISR_SEG0[11]; 
        MISR_SEG0_INT[13]           = DOUT_GATED[13] ^ MISR_SEG0[12]; 
        MISR_SEG0_INT[14]           = DOUT_GATED[14] ^ MISR_SEG0[13]; 
        MISR_SEG0_INT[15]           = DOUT_GATED[15] ^ MISR_SEG0[14]; 
        MISR_SEG0_INT[16]           = MISR_SEG0[15]; 
        MISR_SEG0_INT[17]           = MISR_SEG0[16]; 
        MISR_SEG0_INT[18]           = MISR_SEG0[17]; 
        MISR_SEG0_INT[19]           = MISR_SEG0[18]; 
        MISR_SEG0_INT[20]           = MISR_SEG0[19]; 
        MISR_SEG0_INT[21]           = MISR_SEG0[20]; 
        MISR_SEG0_INT[22]           = MISR_SEG0[21]; 
        MISR_SEG0_INT[23]           = MISR_SEG0[22]; 
    end else begin
        MISR_SEG0_INT = MISR_SEG0; 
    end
end
 
// synopsys sync_set_reset "BIST_CLEAR"
// synopsys async_set_reset "BIST_ASYNC_RESETN"
always @(posedge BIST_CLK or negedge BIST_ASYNC_RESETN) begin
  if ( ~ BIST_ASYNC_RESETN ) begin
      MISR_SEG0 <= 24'd0;
  end else begin
    if ( BIST_SHIFT ) begin
        MISR_SEG0 <= {BIST_SI, MISR_SEG0[23:1]};
    end else begin
        if ( BIST_CLEAR ) begin
            MISR_SEG0 <= 24'b000000000000000000000000;
        end else begin
            if ( ~BIST_HOLD & BIST_COLLAR_EN ) begin
                MISR_SEG0 <= MISR_SEG0_INT;
            end
        end
    end
  end
end
 
assign BIST_SO = MISR_SEG0[0];
 
endmodule // dtmf_recvr_core_rtl1_tessent_mbist_c3_interface_m1_MISR


