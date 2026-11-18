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
-       Created on: Sat Oct 24 02:51:35 IST 2026                                 -
----------------------------------------------------------------------------------


*/
`timescale 100 ps / 10 ps
module dtmf_recvr_core_rtl1_tessent_mbist_c3_interface_m1_MISR_STRAP (
  input wire [23:0] MISR_IN,
  input wire [23:0] MISR_INB,
  output wire [23:0] MISR_SIGNATURE
);
assign MISR_SIGNATURE[0] = MISR_IN[0];      
assign MISR_SIGNATURE[1] = MISR_IN[1];      
assign MISR_SIGNATURE[2] = MISR_INB[2];      
assign MISR_SIGNATURE[3] = MISR_IN[3];      
assign MISR_SIGNATURE[4] = MISR_IN[4];      
assign MISR_SIGNATURE[5] = MISR_INB[5];      
assign MISR_SIGNATURE[6] = MISR_INB[6];      
assign MISR_SIGNATURE[7] = MISR_IN[7];      
assign MISR_SIGNATURE[8] = MISR_INB[8];      
assign MISR_SIGNATURE[9] = MISR_INB[9];      
assign MISR_SIGNATURE[10] = MISR_IN[10];      
assign MISR_SIGNATURE[11] = MISR_INB[11];      
assign MISR_SIGNATURE[12] = MISR_INB[12];      
assign MISR_SIGNATURE[13] = MISR_INB[13];      
assign MISR_SIGNATURE[14] = MISR_IN[14];      
assign MISR_SIGNATURE[15] = MISR_IN[15];      
assign MISR_SIGNATURE[16] = MISR_IN[16];      
assign MISR_SIGNATURE[17] = MISR_IN[17];      
assign MISR_SIGNATURE[18] = MISR_IN[18];      
assign MISR_SIGNATURE[19] = MISR_IN[19];      
assign MISR_SIGNATURE[20] = MISR_IN[20];      
assign MISR_SIGNATURE[21] = MISR_INB[21];      
assign MISR_SIGNATURE[22] = MISR_IN[22];      
assign MISR_SIGNATURE[23] = MISR_IN[23];      
endmodule
