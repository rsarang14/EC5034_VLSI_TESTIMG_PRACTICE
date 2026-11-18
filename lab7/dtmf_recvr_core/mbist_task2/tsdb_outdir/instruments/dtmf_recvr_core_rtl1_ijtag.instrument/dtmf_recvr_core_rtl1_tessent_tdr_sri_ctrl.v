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
//       Created on: Tue Nov 17 18:34:46 IST 2026
//--------------------------------------------------------------------------

module dtmf_recvr_core_rtl1_tessent_tdr_sri_ctrl (
  input wire ijtag_reset,
  input wire ijtag_sel,
  input wire ijtag_si,
  input wire ijtag_ce,
  input wire ijtag_se,
  input wire ijtag_ue,
  input wire ijtag_tck,
  output wire all_test,
  output wire test_mode,
  output wire ijtag_so
);
wire                all_test_to_buf;
wire                test_mode_to_buf;
reg    [1:0]        tdr;
reg                 retiming_so ;
reg                 all_test_latch;
reg                 test_mode_latch;
 
 
buf02 tessent_persistent_cell_all_test ( .A (all_test_latch), .Y (all_test) );
buf02 tessent_persistent_cell_test_mode ( .A (test_mode_latch), .Y (test_mode) );
 
// --------- ShiftRegister ---------
 
always @ (posedge ijtag_tck) begin
  if (ijtag_ce & ijtag_sel) begin
    tdr <= { 2'b00};
  end else if (ijtag_se & ijtag_sel) begin
    tdr <= {ijtag_si,tdr[1:1]};
  end
end
 
assign ijtag_so = retiming_so;
always @ (ijtag_tck or tdr[0]) begin
  if (~ijtag_tck) begin
    retiming_so <= tdr[0];
  end
end
 
// --------- DataOutPort 1 ---------
always @ (negedge ijtag_tck or negedge ijtag_reset) begin
  if (~ijtag_reset) begin
    all_test_latch <= 1'b0;
  end else begin
    if (ijtag_ue & ijtag_sel) begin
      all_test_latch <= tdr[1];
    end
  end
end
 
// --------- DataOutPort 0 ---------
always @ (negedge ijtag_tck or negedge ijtag_reset) begin
  if (~ijtag_reset) begin
    test_mode_latch <= 1'b0;
  end else begin
    if (ijtag_ue & ijtag_sel) begin
      test_mode_latch <= tdr[0];
    end
  end
end
 
endmodule
