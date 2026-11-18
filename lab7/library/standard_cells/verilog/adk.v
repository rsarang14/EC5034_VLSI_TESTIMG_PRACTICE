`ifdef USE_XILINX_CELLS
   `define ADK_RTL_PRIMITIVES
   `define USE_FPGA_CELLS
`endif
`ifdef USE_ALTERA_CELLS
   `define ADK_RTL_PRIMITIVES
   `define USE_FPGA_CELLS
`endif
////////////////////////////////////////////////////////////////////////
//  Verilog library for ASIC Design Kit (ADK)                         //
//  Library : adk_typ                                                 //
//                                                                    //
//  ADK 4.1 Verilog format                                            //
//
//  Released May 27, 2014
//                                                                    //
////////////////////////////////////////////////////////////////////////
//
// DISCLAIMER:
// Copyright 2002 Mentor Graphics Corporation 2001 All Rights Reserved.
// THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION
// WHICH IS THE PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS
// LICENSORS AND IS SUBJECT TO LICENSE TERMS.
//
// DISCLAIMER OF WARRANTY:  Unless otherwise agreed in writing,
// Mentor Graphics software and associated files are provided "as is"
// and without warranty.  Mentor Graphics has no obligation to support
// or otherwise maintain software.  Mentor Graphics makes no warranties,
// express or implied with respect to software including any warranty
// of merchantability or fitness for a particular purpose.
//
// LIMITATION OF LIABILITY: Mentor Graphics is not liable for any property
// damage, personal injury, loss of profits, interruption of business, or for
// any other special, consequential or incidental damages, however caused,
// whether for breach of warranty, contract, tort (including negligence),
// strict liability or otherwise. In no event shall Mentor Graphics'
// liability exceed the amount paid for the product giving rise to the claim.
//
////////////////////////////////////////////////////////////////////////

`timescale 1ns / 10ps


//%BEGIN and02

`celldefine
module and02 (A0, A1, Y);
	input A0, A1;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////
	and (Y, A0, A1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
	endspecify
endmodule
`endcelldefine

//%END and02

//%BEGIN and03

`celldefine
module and03 (A0, A1, A2, Y);
	input A0, A1, A2;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	and (Y, A0, A1, A2);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
	endspecify
endmodule
`endcelldefine

//%END and03

//%BEGIN and04

`celldefine
module and04 (A0, A1, A2, A3, Y);
	input A0, A1, A2, A3;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	and (Y, A0, A1, A2, A3);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_A3_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(A3 => Y) = tpd_A3_Y;
	endspecify
endmodule
`endcelldefine

//%END and04

//%BEGIN ao21

`celldefine
module ao21 (A0, A1, B0, Y);
	input A0, A1, B0;
	output Y;

	wire int_res_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	and (int_res_0, A0, A1);
	or (Y, int_res_0, B0);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_B0_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(B0 => Y) = tpd_B0_Y;
	endspecify
endmodule
`endcelldefine

//%END ao21

//%BEGIN ao22

`celldefine
module ao22 (A0, A1, B0, B1, Y);
	input A0, A1, B0, B1;
	output Y;

	wire int_res_0, int_res_1;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	and (int_res_0, A0, A1);
	and (int_res_1, B0, B1);
	or (Y, int_res_0, int_res_1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
	endspecify
endmodule
`endcelldefine

//%END ao22

//%BEGIN ao221

`celldefine
module ao221 (A0, A1, B0, B1, C0, Y);
	input A0, A1, B0, B1, C0;
	output Y;

	wire int_res_0, int_res_1;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	and (int_res_0, A0, A1);
	and (int_res_1, B0, B1);
	or (Y, int_res_0, int_res_1, C0);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_C0_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(C0 => Y) = tpd_C0_Y;
	endspecify
endmodule
`endcelldefine

//%END ao221

//%BEGIN ao32

`celldefine
module ao32 (A0, A1, A2, B0, B1, Y);
	input A0, A1, A2, B0, B1;
	output Y;

	wire int_res_0, int_res_1;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	and (int_res_0, A0, A1, A2);
	and (int_res_1, B0, B1);
	or (Y, int_res_0, int_res_1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
	endspecify
endmodule
`endcelldefine

//%END ao32

//%BEGIN aoi21

`celldefine
module aoi21 (A0, A1, B0, Y);
	input A0, A1, B0;
	output Y;

	wire int_res_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	and (int_res_0, A0, A1);
	nor (Y, int_res_0, B0);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_B0_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(B0 => Y) = tpd_B0_Y;
	endspecify
endmodule
`endcelldefine

//%END aoi21

//%BEGIN aoi22

`celldefine
module aoi22 (A0, A1, B0, B1, Y);
	input A0, A1, B0, B1;
	output Y;

	wire int_res_0, int_res_1;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	and (int_res_0, A0, A1);
	and (int_res_1, B0, B1);
	nor (Y, int_res_0, int_res_1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
	endspecify
endmodule
`endcelldefine

//%END aoi22

//%BEGIN aoi221

`celldefine
module aoi221 (A0, A1, B0, B1, C0, Y);
	input A0, A1, B0, B1, C0;
	output Y;

	wire int_res_0, int_res_1;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	and (int_res_0, A0, A1);
	and (int_res_1, B0, B1);
	nor (Y, int_res_0, int_res_1, C0);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_C0_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(C0 => Y) = tpd_C0_Y;
	endspecify
endmodule
`endcelldefine

//%END aoi221

//%BEGIN aoi222

`celldefine
module aoi222 (A0, A1, B0, B1, C0, C1, Y);
	input A0, A1, B0, B1, C0, C1;
	output Y;

	wire int_res_0, int_res_1, int_res_2;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	and (int_res_0, A0, A1);
	and (int_res_1, B0, B1);
	and (int_res_2, C0, C1);
	nor (Y, int_res_0, int_res_1, int_res_2);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_C0_Y = 0.0;
		specparam tpd_C1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(C0 => Y) = tpd_C0_Y;
		(C1 => Y) = tpd_C1_Y;
	endspecify
endmodule
`endcelldefine

//%END aoi222

//%BEGIN aoi32

`celldefine
module aoi32 (A0, A1, A2, B0, B1, Y);
	input A0, A1, A2, B0, B1;
	output Y;

	wire int_res_0, int_res_1;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	and (int_res_0, A0, A1, A2);
	and (int_res_1, B0, B1);
	nor (Y, int_res_0, int_res_1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
	endspecify
endmodule
`endcelldefine

//%END aoi32

//%BEGIN aoi321

`celldefine
module aoi321 (A0, A1, A2, B0, B1, C0, Y);
	input A0, A1, A2, B0, B1, C0;
	output Y;

	wire int_res_0, int_res_1;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	and (int_res_0, A0, A1, A2);
	and (int_res_1, B0, B1);
	nor (Y, int_res_0, int_res_1, C0);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_C0_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(C0 => Y) = tpd_C0_Y;
	endspecify
endmodule
`endcelldefine

//%END aoi321

//%BEGIN aoi322

`celldefine
module aoi322 (A0, A1, A2, B0, B1, C0, C1, Y);
	input A0, A1, A2, B0, B1, C0, C1;
	output Y;

	wire int_res_0, int_res_1, int_res_2;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	and (int_res_0, A0, A1, A2);
	and (int_res_1, B0, B1);
	and (int_res_2, C0, C1);
	nor (Y, int_res_0, int_res_1, int_res_2);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_C0_Y = 0.0;
		specparam tpd_C1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(C0 => Y) = tpd_C0_Y;
		(C1 => Y) = tpd_C1_Y;
	endspecify
endmodule
`endcelldefine

//%END aoi322

//%BEGIN aoi33

`celldefine
module aoi33 (A0, A1, A2, B0, B1, B2, Y);
	input A0, A1, A2, B0, B1, B2;
	output Y;

	wire int_res_0, int_res_1;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	and (int_res_0, A0, A1, A2);
	and (int_res_1, B0, B1, B2);
	nor (Y, int_res_0, int_res_1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_B2_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(B2 => Y) = tpd_B2_Y;
	endspecify
endmodule
`endcelldefine

//%END aoi33

//%BEGIN aoi332

`celldefine
module aoi332 (A0, A1, A2, B0, B1, B2, C0, C1, 
		Y);
	input A0, A1, A2, B0, B1, B2, C0, C1;
	output Y;

	wire int_res_0, int_res_1, int_res_2;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	and (int_res_0, A0, A1, A2);
	and (int_res_1, B0, B1, B2);
	and (int_res_2, C0, C1);
	nor (Y, int_res_0, int_res_1, int_res_2);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_B2_Y = 0.0;
		specparam tpd_C0_Y = 0.0;
		specparam tpd_C1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(B2 => Y) = tpd_B2_Y;
		(C0 => Y) = tpd_C0_Y;
		(C1 => Y) = tpd_C1_Y;
	endspecify
endmodule
`endcelldefine

//%END aoi332

//%BEGIN aoi333

`celldefine
module aoi333 (A0, A1, A2, B0, B1, B2, C0, C1, 
		C2, Y);
	input A0, A1, A2, B0, B1, B2, C0, C1, 
		C2;
	output Y;

	wire int_res_0, int_res_1, int_res_2;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	and (int_res_0, A0, A1, A2);
	and (int_res_1, B0, B1, B2);
	and (int_res_2, C0, C1, C2);
	nor (Y, int_res_0, int_res_1, int_res_2);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_B2_Y = 0.0;
		specparam tpd_C0_Y = 0.0;
		specparam tpd_C1_Y = 0.0;
		specparam tpd_C2_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(B2 => Y) = tpd_B2_Y;
		(C0 => Y) = tpd_C0_Y;
		(C1 => Y) = tpd_C1_Y;
		(C2 => Y) = tpd_C2_Y;
	endspecify
endmodule
`endcelldefine

//%END aoi333

//%BEGIN aoi422

`celldefine
module aoi422 (A0, A1, A2, A3, B0, B1, C0, C1, 
		Y);
	input A0, A1, A2, A3, B0, B1, C0, C1;
	output Y;

	wire int_res_0, int_res_1, int_res_2;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	and (int_res_0, A0, A1, A2, A3);
	and (int_res_1, B0, B1);
	and (int_res_2, C0, C1);
	nor (Y, int_res_0, int_res_1, int_res_2);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_A3_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_C0_Y = 0.0;
		specparam tpd_C1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(A3 => Y) = tpd_A3_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(C0 => Y) = tpd_C0_Y;
		(C1 => Y) = tpd_C1_Y;
	endspecify
endmodule
`endcelldefine

//%END aoi422

//%BEGIN aoi43

`celldefine
module aoi43 (A0, A1, A2, A3, B0, B1, B2, Y);
	input A0, A1, A2, A3, B0, B1, B2;
	output Y;

	wire int_res_0, int_res_1;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	and (int_res_0, A0, A1, A2, A3);
	and (int_res_1, B0, B1, B2);
	nor (Y, int_res_0, int_res_1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_A3_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_B2_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(A3 => Y) = tpd_A3_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(B2 => Y) = tpd_B2_Y;
	endspecify
endmodule
`endcelldefine

//%END aoi43

//%BEGIN aoi44

`celldefine
module aoi44 (A0, A1, A2, A3, B0, B1, B2, B3, 
		Y);
	input A0, A1, A2, A3, B0, B1, B2, B3;
	output Y;

	wire int_res_0, int_res_1;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	and (int_res_0, A0, A1, A2, A3);
	and (int_res_1, B0, B1, B2, B3);
	nor (Y, int_res_0, int_res_1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_A3_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_B2_Y = 0.0;
		specparam tpd_B3_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(A3 => Y) = tpd_A3_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(B2 => Y) = tpd_B2_Y;
		(B3 => Y) = tpd_B3_Y;
	endspecify
endmodule
`endcelldefine

//%END aoi44

//%BEGIN buf02

`celldefine
module buf02 (A, Y);
	input A;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	buf (Y, A);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A_Y = 0.0;

		(A => Y) = tpd_A_Y;
	endspecify
endmodule
`endcelldefine

//%END buf02

//%BEGIN buf04

`celldefine
module buf04 (A, Y);
	input A;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	buf (Y, A);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A_Y = 0.0;

		(A => Y) = tpd_A_Y;
	endspecify
endmodule
`endcelldefine

//%END buf04

//%BEGIN buf08

`celldefine
module buf08 (A, Y);
	input A;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	buf (Y, A);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A_Y = 0.0;

		(A => Y) = tpd_A_Y;
	endspecify
endmodule
`endcelldefine

//%END buf08

//%BEGIN buf12

`celldefine
module buf12 (A, Y);
	input A;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	buf (Y, A);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A_Y = 0.0;

		(A => Y) = tpd_A_Y;
	endspecify
endmodule
`endcelldefine

//%END buf12

//%BEGIN buf16

`celldefine
module buf16 (A, Y);
	input A;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	buf (Y, A);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A_Y = 0.0;

		(A => Y) = tpd_A_Y;
	endspecify
endmodule
`endcelldefine

//%END buf16


`celldefine
module nck_dff (D, CLK, Q, QB);
	input D, CLK;
	output Q, QB;

	reg viol_0;
	wire int_res_0, int_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	nck_dff_p ff (Q, viol_0, CLK, D);
	not (QB, Q);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_CLK_Q_negedge = 0.1;
		specparam tpd_CLK_QB_negedge = 0.1;
		specparam tsetup_D_CLK_noedge_negedge = 0.1;
		specparam thold_D_CLK_noedge_negedge = 0.0;
		specparam tpw_CLK_negedge = 0.1;
		specparam tpw_CLK_posedge = 0.1;

		(negedge CLK => (Q+:D)) = tpd_CLK_Q_negedge;
		(negedge CLK => (QB-:D)) = tpd_CLK_QB_negedge;
		$setup (posedge D, negedge CLK,
			tsetup_D_CLK_noedge_negedge, viol_0);
		$setup (negedge D, negedge CLK,
			tsetup_D_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, posedge D,
			thold_D_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, negedge D,
			thold_D_CLK_noedge_negedge, viol_0);
		$width (posedge CLK, tpw_CLK_posedge,
			0, viol_0);
		$width (negedge CLK, tpw_CLK_negedge,
			0, viol_0);
	endspecify
endmodule
`endcelldefine

//%BEGIN nck_dff

`celldefine
module dff (D, CLK, Q, QB);
	input D, CLK;
	output Q, QB;

	reg viol_0;
	wire int_res_0, int_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	dff_p ff (Q, viol_0, CLK, D);
	not (QB, Q);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_CLK_Q_posedge = 0.1;
		specparam tpd_CLK_QB_posedge = 0.1;
		specparam tsetup_D_CLK_noedge_posedge = 0.1;
		specparam thold_D_CLK_noedge_posedge = 0.0;
		specparam tpw_CLK_posedge = 0.1;
		specparam tpw_CLK_negedge = 0.1;

		(posedge CLK => (Q+:D)) = tpd_CLK_Q_posedge;
		(posedge CLK => (QB-:D)) = tpd_CLK_QB_posedge;
		$setup (posedge D, posedge CLK,
			tsetup_D_CLK_noedge_posedge, viol_0);
		$setup (negedge D, posedge CLK,
			tsetup_D_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, posedge D,
			thold_D_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, negedge D,
			thold_D_CLK_noedge_posedge, viol_0);
		$width (posedge CLK, tpw_CLK_posedge,
			0, viol_0);
		$width (negedge CLK, tpw_CLK_negedge,
			0, viol_0);
	endspecify
endmodule
`endcelldefine

//%END dff


`celldefine
`ifdef ADK_RTL_PRIMITIVES
// Underlying Verilog model.  ActiveHI set & reset, posedge clock.
module dff_p_sr ( q, v, set, reset, clock, data );
    input v, set, reset, clock, data;
    output q;
    reg q;
    always @ (posedge clock or posedge set or posedge reset) begin
        if (reset) begin
           q <= 1'b0;

        end else if (set) begin
           q <= 1'b1;

        end else begin
           q <= data;

        end
    end
endmodule
 
// Underlying Verilog model.  ActiveHI set & reset, negedge clock.
module nck_dff_p_sr ( q, v, set, reset, clock, data );
    input v, set, reset, clock, data;
    output q;
    reg q;

    always @ (negedge clock or posedge set or posedge reset) begin
        if (reset) begin
           q <= 1'b0;

        end else if (set) begin
           q <= 1'b1;

        end else begin
           q <= data;

        end
    end
endmodule

// Underlying Verilog model.  ActiveHI set , posedge clock.
module dff_p_s ( q, v, set, clock, data );
    input v, set, clock, data;
    output q;
    reg q;

    always @ (posedge clock or posedge set) begin
        if (set) begin
           q <= 1'b1;
        end else begin
           q <= data;
        end
    end
endmodule

// Underlying Verilog model.  ActiveHI set , negedge clock.
module nck_dff_p_s ( q, v, set, clock, data );
    input v, set, clock, data;
    output q;
    reg q;

    always @ (negedge clock or posedge set) begin
        if (set) begin
            q <= 1'b1;
        end else begin
            q <= data;
        end
    end

endmodule

// Underlying Verilog model.  ActiveHI reset, posedge clock.
module dff_p_r ( q, v, reset, clock, data );
    input v, reset, clock, data;
    output q;
    reg q;

    always @ (posedge clock or posedge reset) begin
        if (reset) begin
            q <= 1'b0;
        end else begin
            q <= data;
        end
    end

endmodule


// Underlying Verilog model.  ActiveHI reset, negedge clock.
module nck_dff_p_r ( q, v, reset, clock, data );
    input v, reset, clock, data;
    output q;
    reg q;

    always @ (negedge clock or posedge reset) begin
        if (reset) begin
            q <= 1'b0;
        end else begin
            q <= data;
        end
    end

endmodule


// Underlying Verilog model.  posedge clock.
module dff_p ( q, v, clock, data );
    input v, clock, data;
    output q;
    reg q;

    always @ (posedge clock) begin
        q <= data;
    end
endmodule

// Underlying Verilog model.  posedge clock.
module nck_dff_p ( q, v, clock, data );
    input v, clock, data;
    output q;
    reg q;

    always @ (negedge clock) begin
        q <= data;
    end

endmodule
`else
// Underlying Verilog model.  ActiveHI set & reset, posedge clock.
primitive dff_p_sr ( q, v, set, reset, clock, data );
    input v, set, reset, clock, data;
    output q;
    reg q;

        table
        // v   s   r   c   d : q : q+;
        //----------------------------
           ?   1   0   ?   ? : ? : 1 ;  // asynchronous Set (reset deasserted).
           ?   0   1   ?   ? : ? : 0 ;  // asynchronous Reset (set deasserted).
           ? (10)  0   b   ? : ? : - ;  // Hold when deassert set while reset inactive if clock known.
           ?   0 (10)  b   ? : ? : - ;  // Hold when deassert reset while set inactive if clock known.
           ?   0   ? (01)  0 : ? : 0 ;  // Clock in a 0 from d (set must be known inactive).
           ?   ?   0 (01)  1 : ? : 1 ;  // Clock in a 1 from d (reset must be known inactive).
           ?   ?   ? (10)  ? : ? : - ;  // Clock falling can never change state.
           ?   ?   0   ?   1 : 1 : 1 ;  // When d=q=1, & reset deasserted, q remains known 1.
           ?   0   ?   ?   0 : 0 : 0 ;  // When d=q=0, & set deasserted, q remains known 0.
           ?   ?   ?   b   * : ? : - ;  // Data changing can never change DFF state when clock known.
           *   ?   ?   ?   ? : ? : X ;  // Violation changes the state to X
        endtable
endprimitive
 
// Underlying Verilog model.  ActiveHI set & reset, negedge clock.
primitive nck_dff_p_sr ( q, v, set, reset, clock, data );
    input v, set, reset, clock, data;
    output q;
    reg q;

        table
        // v   s   r   c   d : q : q+;
        //----------------------------
           ?   1   0   ?   ? : ? : 1 ;  // asynchronous Set (reset deasserted).
           ?   0   1   ?   ? : ? : 0 ;  // asynchronous Reset (set deasserted).
           ? (10)  0   b   ? : ? : - ;  // Hold when deassert set while reset inactive if clock known.
           ?   0 (10)  b   ? : ? : - ;  // Hold when deassert reset while set inactive if clock known.
           ?   0   ? (10)  0 : ? : 0 ;  // Clock in a 0 from d (set must be known inactive).
           ?   ?   0 (10)  1 : ? : 1 ;  // Clock in a 1 from d (reset must be known inactive).
           ?   ?   ? (01)  ? : ? : - ;  // Clock rising can never change state.
           ?   ?   0   ?   1 : 1 : 1 ;  // When d=q=1, & reset deasserted, q remains known 1.
           ?   0   ?   ?   0 : 0 : 0 ;  // When d=q=0, & set deasserted, q remains known 0.
           ?   ?   ?   b   * : ? : - ;  // Data changing can never change DFF state when clock known.
           *   ?   ?   ?   ? : ? : X ;  // Violation changes the state to X
        endtable
endprimitive

// Underlying Verilog model.  ActiveHI set , posedge clock.
primitive dff_p_s ( q, v, set, clock, data );
    input v, set, clock, data;
    output q;
    reg q;

        table
        // v   s    c   d : q : q+;
        //----------------------------
           ?   1   ?   ? : ? : 1 ;  // asynchronous Set.
           ? (10)  b   ? : ? : - ;  // Hold when deassert set if clock known
           ?   0 (01)  0 : ? : 0 ;  // Clock in a 0 from d (set must be known inactive).
           ?   ? (01)  1 : ? : 1 ;  // Clock in a 1 from d (set does not matter)
           ?   ? (10)  ? : ? : - ;  // Clock falling can never change state.
           ?   ?   ?   1 : 1 : 1 ;  // When d=q=1, q remains known 1.
           ?   0   ?   0 : 0 : 0 ;  // When d=q=0, & set deasserted, q remains known 0.
           ?   ?   b   * : ? : - ;  // Data changing can never change DFF state when clock known.
           *   ?   ?   ? : ? : X ;  // Violation changes the state to X
        endtable
endprimitive

// Underlying Verilog model.  ActiveHI set , negedge clock.
primitive nck_dff_p_s ( q, v, set, clock, data );
    input v, set, clock, data;
    output q;
    reg q;

        table
        // v   s    c   d : q : q+;
        //----------------------------
           ?   1   ?   ? : ? : 1 ;  // asynchronous Set.
           ? (10)  b   ? : ? : - ;  // Hold when deassert set if clock known
           ?   0 (10)  0 : ? : 0 ;  // Clock in a 0 from d (set must be known inactive).
           ?   ? (10)  1 : ? : 1 ;  // Clock in a 1 from d (set does not matter)
           ?   ? (01)  ? : ? : - ;  // Clock rising can never change state.
           ?   ?   ?   1 : 1 : 1 ;  // When d=q=1, q remains known 1.
           ?   0   ?   0 : 0 : 0 ;  // When d=q=0, & set deasserted, q remains known 0.
           ?   ?   b   * : ? : - ;  // Data changing can never change DFF state when clock known.
           *   ?   ?   ? : ? : X ;  // Violation changes the state to X
        endtable
endprimitive

// Underlying Verilog model.  ActiveHI reset, posedge clock.
primitive dff_p_r ( q, v, reset, clock, data );
    input v, reset, clock, data;
    output q;
    reg q;

        table
        // v   r   c   d : q : q+;
        //----------------------------
           ?   1   ?   ? : ? : 0 ;  // asynchronous Reset.
           ? (10)  b   ? : ? : - ;  // Hold when deassert reset if clock known
           ?   ? (01)  0 : ? : 0 ;  // Clock in a 0 from d (reset does not matter).
           ?   0 (01)  1 : ? : 1 ;  // Clock in a 1 from d (reset must be known inactive).
           ?   ? (10)  ? : ? : - ;  // Clock falling can never change state.
           ?   0   ?   1 : 1 : 1 ;  // When d=q=1, & reset deasserted, q remains known 1.
           ?   ?   ?   0 : 0 : 0 ;  // When d=q=0, q remains known 0.
           ?   ?   b   * : ? : - ;  // Data changing can never change DFF state when clock known.
           *   ?   ?   ? : ? : X ;  // Violation changes the state to X
        endtable
endprimitive


// Underlying Verilog model.  ActiveHI reset, negedge clock.
primitive nck_dff_p_r ( q, v, reset, clock, data );
    input v, reset, clock, data;
    output q;
    reg q;

        table
        // v   r   c   d : q : q+;
        //----------------------------
           ?   1   ?   ? : ? : 0 ;  // asynchronous Reset.
           ? (10)  b   ? : ? : - ;  // Hold when deassert reset if clock known
           ?   ? (10)  0 : ? : 0 ;  // Clock in a 0 from d (reset does not matter).
           ?   0 (10)  1 : ? : 1 ;  // Clock in a 1 from d (reset must be known inactive).
           ?   ? (01)  ? : ? : - ;  // Clock rising can never change state.
           ?   0   ?   1 : 1 : 1 ;  // When d=q=1, & reset deasserted, q remains known 1.
           ?   ?   ?   0 : 0 : 0 ;  // When d=q=0, q remains known 0.
           ?   ?   b   * : ? : - ;  // Data changing can never change DFF state when clock known.
           *   ?   ?   ? : ? : X ;  // Violation changes the state to X
        endtable
endprimitive


// Underlying Verilog model.  posedge clock.
primitive dff_p ( q, v, clock, data );
    input v, clock, data;
    output q;
    reg q;

        table
        // v   c   d : q : q+;
        //----------------------------
           ? (01)  0 : ? : 0 ;  // Clock in a 0 from d (set must be known inactive).
           ? (01)  1 : ? : 1 ;  // Clock in a 1 from d (reset must be known inactive).
           ? (10)  ? : ? : - ;  // Clock falling can never change state.
           ?   b   * : ? : - ;  // Data changing when clock known can never change DFF state when clock known.
           *   ?   ? : ? : X ;  // Violation changes the state to X
        endtable
endprimitive

// Underlying Verilog model.  posedge clock.
primitive nck_dff_p ( q, v, clock, data );
    input v, clock, data;
    output q;
    reg q;

        table
        // v   c   d : q : q+;
        //----------------------------
           ? (10)  0 : ? : 0 ;  // Clock in a 0 from d (set must be known inactive).
           ? (10)  1 : ? : 1 ;  // Clock in a 1 from d (reset must be known inactive).
           ? (01)  ? : ? : - ;  // Clock rising can never change state.
           ?   b   * : ? : - ;  // Data changing when clock known can never change DFF state when clock known.
           *   ?   ? : ? : X ;  // Violation changes the state to X
        endtable
endprimitive
`endif
`endcelldefine



//%BEGIN dffr

`celldefine
module dffr (D, CLK, R, Q, QB);
	input D, CLK, R;
	output Q, QB;

	reg viol_0;
	wire int_res_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	dff_p_r ff (Q, viol_0, R, CLK, D );
	not (QB, Q);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_CLK_Q_posedge = 0.1;
		specparam tpd_R_Q_posedge = 0.1;
		specparam tpd_CLK_QB_posedge = 0.1;
		specparam tpd_R_QB_posedge = 0.1;
		specparam tsetup_D_CLK_noedge_posedge = 0.1;
		specparam thold_D_CLK_noedge_posedge = 0.0;
		specparam trecovery_R_CLK_negedge_posedge = 0.0;
		specparam tremoval_R_CLK_negedge_posedge = 0.0;
		specparam tpw_CLK_R_EQ_0_posedge = 0.1;
		specparam tpw_CLK_R_EQ_0_negedge = 0.1;
		specparam tpw_R_posedge = 0.1;

		(posedge CLK => (Q+:D)) = tpd_CLK_Q_posedge;
		(posedge R => (Q-:R)) = tpd_R_Q_posedge;
		(posedge CLK => (QB-:D)) = tpd_CLK_QB_posedge;
		(posedge R => (QB+:R)) = tpd_R_QB_posedge;
		$setup (posedge D &&& (R == 0), posedge CLK,
			tsetup_D_CLK_noedge_posedge, viol_0);
		$setup (negedge D &&& (R == 0), posedge CLK,
			tsetup_D_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, posedge D &&& (R == 0),
			thold_D_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, negedge D &&& (R == 0),
			thold_D_CLK_noedge_posedge, viol_0);
		$recovery (negedge R, posedge CLK,
			trecovery_R_CLK_negedge_posedge, viol_0);
		$hold (posedge CLK, negedge R,
			tremoval_R_CLK_negedge_posedge, viol_0);
		$width (posedge CLK &&& (R == 0), tpw_CLK_R_EQ_0_posedge,
			0, viol_0);
		$width (negedge CLK &&& (R == 0), tpw_CLK_R_EQ_0_negedge,
			0, viol_0);
		$width (posedge R, tpw_R_posedge,
			0, viol_0);
	endspecify
endmodule
`endcelldefine

//%END dffr

//%BEGIN nck_dffr

`celldefine
module nck_dffr (D, CLK, R, Q, QB);
	input D, CLK, R;
	output Q, QB;

	reg viol_0;
	wire int_res_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	nck_dff_p_r ff (Q, viol_0, R, CLK, D );
	not (QB, Q);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_CLK_Q_negedge = 0.1;
		specparam tpd_R_Q_posedge = 0.1;
		specparam tpd_CLK_QB_negedge = 0.1;
		specparam tpd_R_QB_posedge = 0.1;
		specparam tsetup_D_CLK_noedge_negedge = 0.1;
		specparam thold_D_CLK_noedge_negedge = 0.0;
		specparam trecovery_R_CLK_negedge_negedge = 0.0;
		specparam tremoval_R_CLK_negedge_negedge = 0.0;
		specparam tpw_CLK_R_EQ_0_posedge = 0.1;
		specparam tpw_CLK_R_EQ_0_negedge = 0.1;
		specparam tpw_R_posedge = 0.1;

		(negedge CLK => (Q+:D)) = tpd_CLK_Q_negedge;
		(posedge R => (Q-:R)) = tpd_R_Q_posedge;
		(negedge CLK => (QB-:D)) = tpd_CLK_QB_negedge;
		(posedge R => (QB+:R)) = tpd_R_QB_posedge;
		$setup (posedge D &&& (R == 0), negedge CLK,
			tsetup_D_CLK_noedge_negedge, viol_0);
		$setup (negedge D &&& (R == 0), negedge CLK,
			tsetup_D_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, posedge D &&& (R == 0),
			thold_D_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, negedge D &&& (R == 0),
			thold_D_CLK_noedge_negedge, viol_0);
		$recovery (negedge R, negedge CLK,
			trecovery_R_CLK_negedge_negedge, viol_0);
		$hold (negedge CLK, negedge R,
			tremoval_R_CLK_negedge_negedge, viol_0);
		$width (negedge CLK &&& (R == 0), tpw_CLK_R_EQ_0_negedge,
			0, viol_0);
		$width (posedge CLK &&& (R == 0), tpw_CLK_R_EQ_0_posedge,
			0, viol_0);
		$width (posedge R, tpw_R_posedge,
			0, viol_0);
	endspecify
endmodule
`endcelldefine

//%END nck_dffr

//%BEGIN dffs

`celldefine
module dffs (D, CLK, S, Q, QB);
	input D, CLK, S;
	output Q, QB;

	reg viol_0;
	wire dummy_0, int_res_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	dff_p_s ff (Q, viol_0, S, CLK, D );
	not (QB, Q);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_CLK_Q_posedge = 0.1;
		specparam tpd_S_Q_posedge = 0.1;
		specparam tpd_CLK_QB_posedge = 0.1;
		specparam tpd_S_QB_posedge = 0.1;
		specparam tsetup_D_CLK_posedge_posedge = 0.1;
		specparam tsetup_D_CLK_negedge_posedge = 0.1;
		specparam thold_D_CLK_posedge_posedge = 0.0;
		specparam thold_D_CLK_negedge_posedge = 0.0;
		specparam trecovery_S_CLK_posedge_posedge = 0.0;
		specparam tremoval_S_CLK_posedge_posedge = 0.0;
		specparam tpw_CLK_S_EQ_0_posedge = 0.1;
		specparam tpw_CLK_S_EQ_0_negedge = 0.1;
		specparam tpw_S_negedge = 0.1;

		(posedge CLK => (Q+:D)) = tpd_CLK_Q_posedge;
		(posedge S => (Q:D)) = tpd_S_Q_posedge;
		(posedge CLK => (QB-:D)) = tpd_CLK_QB_posedge;
		(posedge S => (QB:D)) = tpd_S_QB_posedge;
		$setup (posedge D &&& (S == 0), posedge CLK,
			tsetup_D_CLK_posedge_posedge, viol_0);
		$setup (negedge D &&& (S == 0), posedge CLK,
			tsetup_D_CLK_negedge_posedge, viol_0);
		$hold (posedge CLK, posedge D &&& (S == 0),
			thold_D_CLK_posedge_posedge, viol_0);
		$hold (posedge CLK, negedge D &&& (S == 0),
			thold_D_CLK_negedge_posedge, viol_0);
		$recovery (posedge S, posedge CLK,
			trecovery_S_CLK_posedge_posedge, viol_0);
		$hold (posedge CLK, posedge S,
			tremoval_S_CLK_posedge_posedge, viol_0);
		$width (posedge CLK &&& (S == 0), tpw_CLK_S_EQ_0_posedge,
			0, viol_0);
		$width (negedge CLK &&& (S == 0), tpw_CLK_S_EQ_0_negedge,
			0, viol_0);
		$width (negedge S, tpw_S_negedge,
			0, viol_0);
	endspecify
endmodule
`endcelldefine

//%END dffs

//%BEGIN nck_dffs

`celldefine
module nck_dffs (D, CLK, S, Q, QB);
	input D, CLK, S;
	output Q, QB;

	reg viol_0;
	wire dummy_0, int_res_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	nck_dff_p_s ff (Q, viol_0, S, CLK, D );
	not (QB, Q);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_CLK_Q_negedge = 0.1;
		specparam tpd_S_Q_posedge = 0.1;
		specparam tpd_CLK_QB_negedge = 0.1;
		specparam tpd_S_QB_posedge = 0.1;
		specparam tsetup_D_CLK_posedge_negedge = 0.1;
		specparam tsetup_D_CLK_negedge_negedge = 0.1;
		specparam thold_D_CLK_posedge_negedge = 0.0;
		specparam thold_D_CLK_negedge_negedge = 0.0;
		specparam trecovery_S_CLK_posedge_negedge = 0.0;
		specparam tremoval_S_CLK_posedge_negedge = 0.0;
		specparam tpw_CLK_S_EQ_0_posedge = 0.1;
		specparam tpw_CLK_S_EQ_0_negedge = 0.1;
		specparam tpw_S_negedge = 0.1;

		(negedge CLK => (Q+:D)) = tpd_CLK_Q_negedge;
		(posedge S => (Q:D)) = tpd_S_Q_posedge;
		(negedge CLK => (QB-:D)) = tpd_CLK_QB_negedge;
		(posedge S => (QB:D)) = tpd_S_QB_posedge;
		$setup (posedge D &&& (S == 0), negedge CLK,
			tsetup_D_CLK_posedge_negedge, viol_0);
		$setup (negedge D &&& (S == 0), negedge CLK,
			tsetup_D_CLK_negedge_negedge, viol_0);
		$hold (negedge CLK, posedge D &&& (S == 0),
			thold_D_CLK_posedge_negedge, viol_0);
		$hold (negedge CLK, negedge D &&& (S == 0),
			thold_D_CLK_negedge_negedge, viol_0);
		$recovery (posedge S, negedge CLK,
			trecovery_S_CLK_posedge_negedge, viol_0);
		$hold (negedge CLK, posedge S,
			tremoval_S_CLK_posedge_negedge, viol_0);
		$width (negedge CLK &&& (S == 0), tpw_CLK_S_EQ_0_negedge,
			0, viol_0);
		$width (posedge CLK &&& (S == 0), tpw_CLK_S_EQ_0_posedge,
			0, viol_0);
		$width (negedge S, tpw_S_negedge,
			0, viol_0);
	endspecify
endmodule
`endcelldefine

//%END nck_dffs



//%BEGIN dffsr

`celldefine
module dffsr (D, CLK, S, R, Q, QB);
	input D, CLK, S, R;
	output Q, QB;

	reg viol_0;
	wire dummy_0, int_res_0, int_res_1,
		int_res_2, cond0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	dff_p_sr ff (Q, viol_0, S, R, CLK, D );
	not (QB, Q );

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	not (int_res_1, S);
	not (int_res_2, R);
	and (cond0, int_res_1, int_res_2);
	specify
		specparam tpd_CLK_Q_posedge = 0.1;
		specparam tpd_S_Q_posedge = 0.1;
		specparam tpd_R_Q_posedge = 0.1;
		specparam tpd_CLK_QB_posedge = 0.1;
		specparam tpd_S_QB_posedge = 0.1;
		specparam tpd_R_QB_posedge = 0.1;
		specparam tsetup_D_CLK_posedge_posedge = 0.1;
		specparam tsetup_D_CLK_negedge_posedge = 0.1;
		specparam thold_D_CLK_posedge_posedge = 0.0;
		specparam thold_D_CLK_negedge_posedge = 0.0;
		specparam trecovery_S_CLK_R_EQ_0_posedge_posedge = 0.0;
		specparam trecovery_R_CLK_S_EQ_1_posedge_posedge = 0.0;
		specparam tremoval_S_CLK_R_EQ_0_posedge_posedge = 0.0;
		specparam tremoval_R_CLK_S_EQ_1_posedge_posedge = 0.0;
		specparam tpw_CLK_cond0_posedge = 0.1;
		specparam tpw_CLK_cond0_negedge = 0.1;
		specparam tpw_S_R_EQ_0_posedge = 0.1;
		specparam tpw_R_S_EQ_0_posedge = 0.1;

		(posedge CLK => (Q+:D)) = tpd_CLK_Q_posedge;
		(posedge S => (Q+:S)) = tpd_S_Q_posedge;
		(posedge R => (Q-:R)) = tpd_R_Q_posedge;
		(posedge CLK => (QB-:D)) = tpd_CLK_QB_posedge;
		(posedge S => (QB-:R)) = tpd_S_QB_posedge;
		(posedge R => (QB+:R)) = tpd_R_QB_posedge;
		$setup (posedge D &&& cond0, posedge CLK,
			tsetup_D_CLK_posedge_posedge, viol_0);
		$setup (negedge D &&& cond0, posedge CLK,
			tsetup_D_CLK_negedge_posedge, viol_0);
		$hold (posedge CLK, posedge D &&& cond0,
			thold_D_CLK_posedge_posedge, viol_0);
		$hold (posedge CLK, negedge D &&& cond0,
			thold_D_CLK_negedge_posedge, viol_0);
		$recovery (posedge S &&& (R == 0), posedge CLK,
			trecovery_S_CLK_R_EQ_0_posedge_posedge, viol_0);
		$recovery (negedge R &&& (S == 1), posedge CLK,
			trecovery_R_CLK_S_EQ_1_posedge_posedge, viol_0);
		$hold (posedge CLK, posedge S &&& (R == 0),
			tremoval_S_CLK_R_EQ_0_posedge_posedge, viol_0);
		$hold (posedge CLK, negedge R &&& (S == 1),
			tremoval_R_CLK_S_EQ_1_posedge_posedge, viol_0);
		$width (posedge CLK &&& cond0, tpw_CLK_cond0_posedge,
			0, viol_0);
		$width (negedge CLK &&& cond0, tpw_CLK_cond0_negedge,
			0, viol_0);
		$width (posedge S &&& (R == 0), tpw_S_R_EQ_0_posedge,
			0, viol_0);
		$width (posedge R &&& (S == 0), tpw_R_S_EQ_0_posedge,
			0, viol_0);
	endspecify
endmodule
`endcelldefine

//%END dffsr

//%BEGIN nck_dffsr

`celldefine
module nck_dffsr (D, CLK, S, R, Q, QB);
	input D, CLK, S, R;
	output Q, QB;

	reg viol_0;
	wire dummy_0, int_res_0, int_res_1,
		int_res_2, cond0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	nck_dff_p_sr ff (Q, viol_0, S, R, CLK, D );
	not (QB, Q );

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	not (int_res_1, S);
	not (int_res_2, R);
	and (cond0, int_res_1, int_res_2);
	specify
		specparam tpd_CLK_Q_negedge = 0.1;
		specparam tpd_S_Q_posedge = 0.1;
		specparam tpd_R_Q_posedge = 0.1;
		specparam tpd_CLK_QB_negedge = 0.1;
		specparam tpd_S_QB_posedge = 0.1;
		specparam tpd_R_QB_posedge = 0.1;
		specparam tsetup_D_CLK_posedge_negedge = 0.1;
		specparam tsetup_D_CLK_negedge_negedge = 0.1;
		specparam thold_D_CLK_posedge_negedge = 0.0;
		specparam thold_D_CLK_negedge_negedge = 0.0;
		specparam trecovery_S_CLK_R_EQ_0_posedge_negedge = 0.0;
		specparam trecovery_R_CLK_S_EQ_1_posedge_negedge = 0.0;
		specparam tremoval_S_CLK_R_EQ_0_posedge_negedge = 0.0;
		specparam tremoval_R_CLK_S_EQ_1_posedge_negedge = 0.0;
		specparam tpw_CLK_cond0_posedge = 0.1;
		specparam tpw_CLK_cond0_negedge = 0.1;
		specparam tpw_S_R_EQ_0_posedge = 0.1;
		specparam tpw_R_S_EQ_0_posedge = 0.1;

		(negedge CLK => (Q+:D)) = tpd_CLK_Q_negedge;
		(posedge S => (Q+:S)) = tpd_S_Q_posedge;
		(posedge R => (Q-:R)) = tpd_R_Q_posedge;
		(negedge CLK => (QB-:D)) = tpd_CLK_QB_negedge;
		(posedge S => (QB-:S)) = tpd_S_QB_posedge;
		(posedge R => (QB+:R)) = tpd_R_QB_posedge;
		$setup (posedge D &&& cond0, negedge CLK,
			tsetup_D_CLK_posedge_negedge, viol_0);
		$setup (negedge D &&& cond0, negedge CLK,
			tsetup_D_CLK_negedge_negedge, viol_0);
		$hold (negedge CLK, posedge D &&& cond0,
			thold_D_CLK_posedge_negedge, viol_0);
		$hold (negedge CLK, negedge D &&& cond0,
			thold_D_CLK_negedge_negedge, viol_0);
		$recovery (posedge S &&& (R == 0), negedge CLK,
			trecovery_S_CLK_R_EQ_0_posedge_negedge, viol_0);
		$recovery (negedge R &&& (S == 1), negedge CLK,
			trecovery_R_CLK_S_EQ_1_posedge_negedge, viol_0);
		$hold (negedge CLK, posedge S &&& (R == 0),
			tremoval_S_CLK_R_EQ_0_posedge_negedge, viol_0);
		$hold (negedge CLK, negedge R &&& (S == 1),
			tremoval_R_CLK_S_EQ_1_posedge_negedge, viol_0);
		$width (negedge CLK &&& cond0, tpw_CLK_cond0_negedge,
			0, viol_0);
		$width (posedge CLK &&& cond0, tpw_CLK_cond0_posedge,
			0, viol_0);
		$width (posedge S &&& (R == 0), tpw_S_R_EQ_0_posedge,
			0, viol_0);
		$width (posedge R &&& (S == 0), tpw_R_S_EQ_0_posedge,
			0, viol_0);
	endspecify
endmodule
`endcelldefine

//%END nck_dffsr



//%BEGIN fadd1

`celldefine
module fadd1 (A, B, CI, S, CO);
	input A, B, CI;
	output S, CO;

	wire int_res_0, int_res_1, int_res_2;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	xor (S, A, B, CI);
	and (int_res_0, A, B);
	and (int_res_1, A, CI);
	and (int_res_2, B, CI);
	or (CO, int_res_0, int_res_1, int_res_2);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A_S = 0.0;
		specparam tpd_B_S = 0.0;
		specparam tpd_CI_S = 0.0;
		specparam tpd_A_CO = 0.0;
		specparam tpd_B_CO = 0.0;
		specparam tpd_CI_CO = 0.0;

		(A => S) = tpd_A_S;
		(B => S) = tpd_B_S;
		(CI => S) = tpd_CI_S;
		(A => CO) = tpd_A_CO;
		(B => CO) = tpd_B_CO;
		(CI => CO) = tpd_CI_CO;
	endspecify
endmodule
`endcelldefine

//%END fadd1

//%BEGIN hadd1

`celldefine
module hadd1 (A, B, S, CO);
	input A, B;
	output S, CO;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	xor (S, A, B);
	and (CO, A, B);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A_S = 0.0;
		specparam tpd_B_S = 0.0;
		specparam tpd_A_CO = 0.0;
		specparam tpd_B_CO = 0.0;

		(A => S) = tpd_A_S;
		(B => S) = tpd_B_S;
		(A => CO) = tpd_A_CO;
		(B => CO) = tpd_B_CO;
	endspecify
endmodule
`endcelldefine

//%END hadd1

//%BEGIN inv01

`celldefine
module inv01 (A, Y);
	input A;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	not (Y, A);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A_Y = 0.0;

		(A => Y) = tpd_A_Y;
	endspecify
endmodule
`endcelldefine

//%END inv01

//%BEGIN inv02

`celldefine
module inv02 (A, Y);
	input A;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	not (Y, A);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A_Y = 0.0;

		(A => Y) = tpd_A_Y;
	endspecify
endmodule
`endcelldefine

//%END inv02

//%BEGIN inv04

`celldefine
module inv04 (A, Y);
	input A;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	not (Y, A);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A_Y = 0.0;

		(A => Y) = tpd_A_Y;
	endspecify
endmodule
`endcelldefine

//%END inv04

//%BEGIN inv08

`celldefine
module inv08 (A, Y);
	input A;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	not (Y, A);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A_Y = 0.0;

		(A => Y) = tpd_A_Y;
	endspecify
endmodule
`endcelldefine

//%END inv08

//%BEGIN inv12

`celldefine
module inv12 (A, Y);
	input A;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	not (Y, A);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A_Y = 0.0;

		(A => Y) = tpd_A_Y;
	endspecify
endmodule
`endcelldefine

//%END inv12

//%BEGIN inv16

`celldefine
module inv16 (A, Y);
	input A;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	not (Y, A);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A_Y = 0.0;

		(A => Y) = tpd_A_Y;
	endspecify
endmodule
`endcelldefine

//%END inv16

//%BEGIN nlatch

`celldefine
module nlatch (D, CLK, Q);
	input D, CLK;
	output Q;

	reg viol_0;
	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	latch_n lat (Q, viol_0, CLK, D);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_CLK_Q_negedge = 0.1;
		specparam tpd_D_Q = 0.1;
		specparam tpw_CLK_negedge = 0.1;
		specparam tsetup_D_CLK_posedge_posedge = 0.1;
		specparam tsetup_D_CLK_negedge_posedge = 0.1; 
		specparam thold_D_CLK_posedge_posedge = 0.0; 
		specparam thold_D_CLK_negedge_posedge = 0.0;  
	
		(negedge CLK => (Q+:D)) = tpd_CLK_Q_negedge;
		(D => Q) = tpd_D_Q;

		$setup (posedge D, posedge CLK,                
			tsetup_D_CLK_posedge_posedge, viol_0);
		$setup (negedge D, posedge CLK,
			tsetup_D_CLK_negedge_posedge, viol_0);
		$hold (posedge CLK, posedge D,
			thold_D_CLK_posedge_posedge, viol_0);
		$hold (posedge CLK, negedge D,
			thold_D_CLK_negedge_posedge, viol_0);  
		$width (posedge CLK, tpw_CLK_negedge,
			0, viol_0);                         
	

	endspecify
endmodule
`endcelldefine

//%END nlatch

//%BEGIN latch

`celldefine
module latch (D, CLK, Q);
	input D, CLK;
	output Q;

	reg viol_0;
	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	latch_p lat (Q, viol_0, CLK, D);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_CLK_Q_posedge = 0.1;
		specparam tpd_D_Q = 0.1;
		specparam tpw_CLK_posedge = 0.1;
		specparam tsetup_D_CLK_noedge_negedge = 0.1; //added
		specparam thold_D_CLK_noedge_negedge = 0.0;  //added
	
		(posedge CLK => (Q+:D)) = tpd_CLK_Q_posedge;
		(D => Q) = tpd_D_Q;

		$setup (posedge D, negedge CLK,                //beg added
			tsetup_D_CLK_noedge_negedge, viol_0);
		$setup (negedge D, negedge CLK,
			tsetup_D_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, posedge D,
			thold_D_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, negedge D,
			thold_D_CLK_noedge_negedge, viol_0);  
		$width (posedge CLK, tpw_CLK_posedge,
			0, viol_0); 
	

	endspecify
endmodule
`endcelldefine

//%END latch

`celldefine
`ifdef ADK_RTL_PRIMITIVES
  
module latch_p (q, v, clk, d);
	output q;
	reg q;
	input v, clk, d;
  always @ (clk or d) begin
    if (clk) begin
      q <= d;
    end
  end 
endmodule

module latch_n (q, v, clk, d);
	output q;
	reg q;
	input v, clk, d;

  always @ (clk or d) begin
    if (~clk) begin
      q <= d;
    end
  end 

endmodule

`else // !`ifdef ADK_RTL_PRIMITIVES
    
primitive latch_p (q, v, clk, d);
	output q;
	reg q;
	input v, clk, d;

	table
		* ? ? : ? : x;
		? 1 0 : ? : 0;
		? 1 1 : ? : 1;
		? x 0 : 0 : -;
		? x 1 : 1 : -;
		? 0 ? : ? : -;
	endtable
endprimitive

primitive latch_n (q, v, clk, d);
	output q;
	reg q;
	input v, clk, d;

	table
		* ? ? : ? : x;
		? 0 0 : ? : 0;
		? 0 1 : ? : 1;
		? x 0 : 0 : -;
		? x 1 : 1 : -;
		? 1 ? : ? : -;
	endtable
endprimitive
`endif // !`ifdef ADK_RTL_PRIMITIVES
`endcelldefine

//%BEGIN latchr

`celldefine
module latchr (D, CLK, R, Q);
	input D, CLK, R;
	output Q;

	reg viol_0;
	wire int_res_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	latch_r lat (Q, viol_0, CLK, 
		D, R);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_CLK_Q_posedge = 0.1;
		specparam tpd_D_Q = 0.1;
		specparam tpd_R_Q_posedge = 0.1;
		specparam tsetup_D_CLK_noedge_negedge = 0.1;
		specparam thold_D_CLK_noedge_negedge = 0.0;
		specparam trecovery_R_CLK_noedge_negedge = 0.0;
		specparam tremoval_R_CLK_noedge_negedge = 0.0;
		specparam tpw_CLK_R_EQ_0_posedge = 0.1;
		specparam tpw_R_posedge = 0.1;

		(posedge CLK => (Q+:D)) = tpd_CLK_Q_posedge;
		(D => Q) = tpd_D_Q;
		(posedge R => (Q-:R)) = tpd_R_Q_posedge;
		$setup (posedge D &&& (R == 0), negedge CLK,
			tsetup_D_CLK_noedge_negedge, viol_0);
		$setup (negedge D &&& (R == 0), negedge CLK,
			tsetup_D_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, posedge D &&& (R == 0),
			thold_D_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, negedge D &&& (R == 0),
			thold_D_CLK_noedge_negedge, viol_0);
		$recovery (negedge R, negedge CLK,
			trecovery_R_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, negedge R,
			tremoval_R_CLK_noedge_negedge, viol_0);
		$width (posedge CLK &&& (R == 0), tpw_CLK_R_EQ_0_posedge,
			0, viol_0);
		$width (posedge R, tpw_R_posedge,
			0, viol_0);
	endspecify
endmodule
`endcelldefine

//%END latchr
//
//%BEGIN nlatchr

`celldefine
module nlatchr (D, CLK, R, Q);
	input D, CLK, R;
	output Q;

	reg viol_0;
	wire int_res_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	nlatch_r lat (Q, viol_0, CLK, 
		D, R);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_CLK_Q_negedge = 0.1;
		specparam tpd_D_Q = 0.1;
		specparam tpd_R_Q_posedge = 0.1;
		specparam tsetup_D_CLK_noedge_posedge = 0.1;
		specparam thold_D_CLK_noedge_posedge = 0.0;
		specparam trecovery_R_CLK_noedge_posedge = 0.0;
		specparam tremoval_R_CLK_noedge_posedge = 0.0;
		specparam tpw_CLK_R_EQ_0_negedge = 0.1;
		specparam tpw_R_posedge = 0.1;

		(negedge CLK => (Q+:D)) = tpd_CLK_Q_negedge;
		(D => Q) = tpd_D_Q;
		(posedge R => (Q-:R)) = tpd_R_Q_posedge;
		$setup (posedge D &&& (R == 0), posedge CLK,
			tsetup_D_CLK_noedge_posedge, viol_0);
		$setup (negedge D &&& (R == 0), posedge CLK,
			tsetup_D_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, posedge D &&& (R == 0),
			thold_D_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, negedge D &&& (R == 0),
			thold_D_CLK_noedge_posedge, viol_0);
		$recovery (negedge R, posedge CLK,
			trecovery_R_CLK_noedge_posedge, viol_0);
		$hold (negedge CLK, negedge R,
			tremoval_R_CLK_noedge_posedge, viol_0);
		$width (negedge CLK &&& (R == 0), tpw_CLK_R_EQ_0_negedge,
			0, viol_0);
		$width (posedge R, tpw_R_posedge,
			0, viol_0);
	endspecify
endmodule
`endcelldefine

//%END nlatchr

`celldefine
`ifdef ADK_RTL_PRIMITIVES
  
module latch_r (q, v, clk, d, r);
	output q;
	reg q;
	input v, clk, d, r;

   always @ (clk or d  or r) begin
      if (r) begin
         q <= 1'b0;
      end else if (clk) begin
         q <= d;
      end
   end
endmodule

module nlatch_r (q, v, clk, d, r);
	output q;
	reg q;
	input v, clk, d, r;

   always @ (clk or d  or r) begin
      if (r) begin
         q <= 1'b0;
      end else if (~clk) begin
         q <= d;
      end
   end
endmodule

module latch_s (q, v, clk, d, s);
	output q;
	reg q;
	input v, clk, d, s;
   always @ (clk or d  or s) begin
      if (s) begin
         q <= 1'b1;
      end else if (clk) begin
         q <= d;
      end
   end

endmodule

module nlatch_s (q, v, clk, d, s);
	output q;
	reg q;
	input v, clk, d, s;
   always @ (clk or d  or s) begin
      if (s) begin
         q <= 1'b1;
      end else if (~clk) begin
         q <= d;
      end
   end

endmodule
`else // !`ifdef ADK_RTL_PRIMITIVES
    
primitive latch_r (q, v, clk, d, r);
	output q;
	reg q;
	input v, clk, d, r;

	table
		* ? ? ? : ? : x;
		? ? ? 1 : ? : 0;
		? 0 ? 0 : ? : -;
		? 0 ? x : 0 : -;
		? 1 0 0 : ? : 0;
		? 1 0 x : ? : 0;
		? 1 1 0 : ? : 1;
		? x 0 0 : 0 : -;
		? x 0 x : 0 : -;
		? x 1 0 : 1 : -;
	endtable
endprimitive

primitive nlatch_r (q, v, clk, d, r);
	output q;
	reg q;
	input v, clk, d, r;

	table
		* ? ? ? : ? : x;
		? ? ? 1 : ? : 0;
		? 1 ? 0 : ? : -;
		? 1 ? x : 0 : -;
		? 0 0 0 : ? : 0;
		? 0 0 x : ? : 0;
		? 0 1 0 : ? : 1;
		? x 0 0 : 0 : -;
		? x 0 x : 0 : -;
		? x 1 0 : 1 : -;
	endtable
endprimitive

primitive latch_s (q, v, clk, d, s);
	output q;
	reg q;
	input v, clk, d, s;

	table
		* ? ? ? : ? : x;
		? ? ? 1 : ? : 1;
		? 0 ? 0 : ? : -;
		? 0 ? x : 1 : -;
		? 1 1 0 : ? : 1;
		? 1 1 x : ? : 1;
		? 1 0 0 : ? : 0;
		? x 1 0 : 1 : -;
		? x 1 x : 1 : -;
		? x 0 0 : 0 : -;
	endtable
endprimitive

primitive nlatch_s (q, v, clk, d, s);
	output q;
	reg q;
	input v, clk, d, s;

	table
		* ? ? ? : ? : x;
		? ? ? 1 : ? : 1;
		? 1 ? 0 : ? : -;
		? 1 ? x : 1 : -;
		? 0 1 0 : ? : 1;
		? 0 1 x : ? : 1;
		? 0 0 0 : ? : 0;
		? x 1 0 : 1 : -;
		? x 1 x : 1 : -;
		? x 0 0 : 0 : -;
	endtable
endprimitive
`endif // !`ifdef ADK_RTL_PRIMITIVES
  
`endcelldefine

//%BEGIN latchs

`celldefine
module latchs (D, CLK, S, Q);
	input D, CLK, S;
	output Q;

	reg viol_0;
	wire int_res_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	latch_s lat (Q, viol_0, CLK, 
		D, S);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_CLK_Q_posedge = 0.1;
		specparam tpd_D_Q = 0.1;
		specparam tpd_S_Q_negedge = 0.1;
		specparam tpw_CLK_posedge = 0.1;

		specparam tsetup_D_CLK_posedge_negedge = 0.1;
		specparam tsetup_D_CLK_negedge_negedge = 0.1;
		specparam thold_D_CLK_posedge_negedge = 0.0;
		specparam thold_D_CLK_negedge_negedge = 0.0;
		specparam trecovery_S_CLK_noedge_posedge = 0.0;
		specparam tremoval_S_CLK_noedge_negedge = 0.0;
		specparam tpw_S_negedge = 0.1;
		

		(posedge CLK => (Q+:D)) = tpd_CLK_Q_posedge;
		(D => Q) = tpd_D_Q;
		(negedge S => (Q:D)) = tpd_S_Q_negedge;

		$setup (posedge D &&& (S == 0), negedge CLK,
			tsetup_D_CLK_posedge_negedge, viol_0);
		$setup (negedge D &&& (S == 0), negedge CLK,
			tsetup_D_CLK_negedge_negedge, viol_0);
		$hold (negedge CLK, posedge D &&& (S == 0),
			thold_D_CLK_posedge_negedge, viol_0);
		$hold (negedge CLK, negedge D &&& (S == 0),
			thold_D_CLK_negedge_negedge, viol_0);
		$recovery (negedge S, negedge CLK,
			trecovery_S_CLK_noedge_posedge, viol_0);
		$hold (negedge CLK, negedge S,
			tremoval_S_CLK_noedge_negedge, viol_0);
		$width (posedge CLK &&& (S == 1), tpw_CLK_posedge,
			0, viol_0);
		$width (posedge S, tpw_S_negedge,
		0, viol_0);

	endspecify
endmodule
`endcelldefine

//%END latchs
//
//%BEGIN nlatchs

`celldefine
module nlatchs (D, CLK, S, Q);
	input D, CLK, S;
	output Q;

	reg viol_0;
	wire int_res_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	nlatch_s lat (Q, viol_0, CLK, 
		D, S);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_CLK_Q_negedge = 0.1;
		specparam tpd_D_Q = 0.1;
		specparam tpd_S_Q_negedge = 0.1;
		specparam tpw_CLK_negedge = 0.1;

		specparam tsetup_D_CLK_posedge_posedge = 0.1;
		specparam tsetup_D_CLK_negedge_posedge = 0.1;
		specparam thold_D_CLK_posedge_posedge = 0.0;
		specparam thold_D_CLK_negedge_posedge = 0.0;
		specparam trecovery_S_CLK_noedge_negedge = 0.0;
		specparam tremoval_S_CLK_noedge_negedge = 0.0;
		specparam tpw_S_negedge = 0.1;
		

		(negedge CLK => (Q+:D)) = tpd_CLK_Q_negedge;
		(D => Q) = tpd_D_Q;
		(negedge S => (Q:D)) = tpd_S_Q_negedge;

		$setup (posedge D &&& (S == 0), posedge CLK,
			tsetup_D_CLK_posedge_posedge, viol_0);
		$setup (negedge D &&& (S == 0), posedge CLK,
			tsetup_D_CLK_negedge_posedge, viol_0);
		$hold (posedge CLK, posedge D &&& (S == 0),
			thold_D_CLK_posedge_posedge, viol_0);
		$hold (posedge CLK, negedge D &&& (S == 0),
			thold_D_CLK_negedge_posedge, viol_0);
		$recovery (negedge S, negedge CLK,
			trecovery_S_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, posedge S,
			tremoval_S_CLK_noedge_negedge, viol_0);
		$width (negedge CLK &&& (S == 1), tpw_CLK_negedge,
			0, viol_0);
		$width (posedge S, tpw_S_negedge,
		0, viol_0);

	endspecify
endmodule
`endcelldefine

//%END nlatchs

`celldefine
  `ifdef ADK_RTL_PRIMITIVES
module latch_sr_1 (q, v, clk, d, s, r);
	output q;
	reg q;
	input v, clk, d, s, r;

   always @ (clk or d  or s or r) begin
      if (s) begin
         q <= 1'b1;
      end else if (r) begin
         q <= 1'b0;  
      end else if (clk) begin
         q <= d;
      end
   end

endmodule

module nlatch_sr_1 (q, v, clk, d, s, r);
	output q;
	reg q;
	input v, clk, d, s, r;

   always @ (clk or d  or s or r) begin
      if (s) begin
         q <= 1'b1;
      end else if (r) begin
         q <= 1'b0;  
      end else if (~clk) begin
         q <= d;
      end
   end
endmodule
`else // !`ifdef ADK_RTL_PRIMITIVES
primitive latch_sr_1 (q, v, clk, d, s, r);
	output q;
	reg q;
	input v, clk, d, s, r;

	table
		* ? ? ? ? : ? : x;
		? ? ? 0 1 : ? : 0;
		? ? ? 1 ? : ? : 1;
		? 0 ? 0 0 : ? : -;
		? 0 ? x 0 : 1 : -;
		? 0 ? 0 x : 0 : -;
		? 1 0 0 0 : ? : 0;
		? 1 0 0 x : ? : 0;
		? 1 1 x 0 : ? : 1;
		? 1 1 0 0 : ? : 1;
		? x 0 0 0 : 0 : -;
		? x 0 0 x : 0 : -;
		? x 1 0 0 : 1 : -;
		? x 1 x 0 : 1 : -;
	endtable
endprimitive

primitive nlatch_sr_1 (q, v, clk, d, s, r);
	output q;
	reg q;
	input v, clk, d, s, r;

	table
		* ? ? ? ? : ? : x;
		? ? ? 0 1 : ? : 0;
		? ? ? 1 ? : ? : 1;
		? 1 ? 0 0 : ? : -;
		? 1 ? x 0 : 1 : -;
		? 1 ? 0 x : 0 : -;
		? 0 0 0 0 : ? : 0;
		? 0 0 0 x : ? : 0;
		? 0 1 x 0 : ? : 1;
		? 0 1 0 0 : ? : 1;
		? x 0 0 0 : 0 : -;
		? x 0 0 x : 0 : -;
		? x 1 0 0 : 1 : -;
		? x 1 x 0 : 1 : -;
	endtable
endprimitive
  
`endif
  
`endcelldefine

//%BEGIN latchsr

`celldefine
module latchsr (D, CLK, S, R, Q);
	input D, CLK, S, R;
	output Q;

	reg viol_0;
	wire int_res_0, int_res_1, int_res_2,
		cond0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	latch_sr_1 lat (Q, viol_0, CLK, 
		D, S, R);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	not (int_res_1, S);
	not (int_res_2, R);
	and (cond0, int_res_1, int_res_2);
	specify
		specparam tpd_CLK_Q_posedge = 0.1;
		specparam tpd_D_Q = 0.1;
		specparam tpd_S_Q_posedge = 0.1;
		specparam tpd_R_Q_posedge = 0.1;
		specparam tsetup_D_CLK_noedge_negedge = 0.1;
		specparam thold_D_CLK_noedge_negedge = 0.0;
		specparam trecovery_S_CLK_R_EQ_0_posedge_negedge = 0.0;
		specparam trecovery_R_CLK_S_EQ_1_negedge_negedge = 0.0;
		specparam tremoval_S_CLK_R_EQ_0_posedge_negedge = 0.0;
		specparam tremoval_R_CLK_S_EQ_1_negedge_negedge = 0.0;
		specparam tpw_CLK_cond0_posedge = 0.1;
		specparam tpw_S_R_EQ_0_negedge = 0.1;
		specparam tpw_R_S_EQ_1_posedge = 0.1;

		(posedge CLK => (Q+:D)) = tpd_CLK_Q_posedge;
		(D => Q) = tpd_D_Q;
		(posedge S => (Q:D)) = tpd_S_Q_posedge;
		(posedge R => (Q-:R)) = tpd_R_Q_posedge;
		$setup (posedge D &&& cond0, negedge CLK,
			tsetup_D_CLK_noedge_negedge, viol_0);
		$setup (negedge D &&& cond0, negedge CLK,
			tsetup_D_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, posedge D &&& cond0,
			thold_D_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, negedge D &&& cond0,
			thold_D_CLK_noedge_negedge, viol_0);
		$recovery (posedge S &&& (R == 0), negedge CLK,
			trecovery_S_CLK_R_EQ_0_posedge_negedge, viol_0);
		$recovery (negedge R &&& (S == 1), negedge CLK,
			trecovery_R_CLK_S_EQ_1_negedge_negedge, viol_0);
		$hold (negedge CLK, posedge S &&& (R == 0),
			tremoval_S_CLK_R_EQ_0_posedge_negedge, viol_0);
		$hold (negedge CLK, negedge R &&& (S == 1),
			tremoval_R_CLK_S_EQ_1_negedge_negedge, viol_0);
		$width (posedge CLK &&& cond0, tpw_CLK_cond0_posedge,
			0, viol_0);
		$width (negedge S &&& (R == 0), tpw_S_R_EQ_0_negedge,
			0, viol_0);
		$width (posedge R &&& (S == 1), tpw_R_S_EQ_1_posedge,
			0, viol_0);
	endspecify
endmodule
`endcelldefine

//%END latchsr

//%BEGIN nlatchsr

`celldefine
module nlatchsr (D, CLK, S, R, Q);
	input D, CLK, S, R;
	output Q;

	reg viol_0;
	wire int_res_0, int_res_1, int_res_2,
		cond0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	nlatch_sr_1 lat (Q, viol_0, CLK, 
		D, S, R);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	not (int_res_1, S);
	not (int_res_2, R);
	and (cond0, int_res_1, int_res_2);
	specify
		specparam tpd_CLK_Q_negedge = 0.1;
		specparam tpd_D_Q = 0.1;
		specparam tpd_S_Q_posedge = 0.1;
		specparam tpd_R_Q_posedge = 0.1;
		specparam tsetup_D_CLK_noedge_posedge = 0.1;
		specparam thold_D_CLK_noedge_posedge = 0.0;
		specparam trecovery_S_CLK_R_EQ_0_posedge_posedge = 0.0;
		specparam trecovery_R_CLK_S_EQ_1_negedge_posedge = 0.0;
		specparam tremoval_S_CLK_R_EQ_0_posedge_posedge = 0.0;
		specparam tremoval_R_CLK_S_EQ_1_negedge_posedge = 0.0;
		specparam tpw_CLK_cond0_negedge = 0.1;
		specparam tpw_S_R_EQ_0_negedge = 0.1;
		specparam tpw_R_S_EQ_1_posedge = 0.1;

		(negedge CLK => (Q+:D)) = tpd_CLK_Q_negedge;
		(D => Q) = tpd_D_Q;
		(posedge S => (Q:D)) = tpd_S_Q_posedge;
		(posedge R => (Q-:R)) = tpd_R_Q_posedge;
		$setup (posedge D &&& cond0, posedge CLK,
			tsetup_D_CLK_noedge_posedge, viol_0);
		$setup (negedge D &&& cond0, posedge CLK,
			tsetup_D_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, posedge D &&& cond0,
			thold_D_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, negedge D &&& cond0,
			thold_D_CLK_noedge_posedge, viol_0);
		$recovery (posedge S &&& (R == 0), posedge CLK,
			trecovery_S_CLK_R_EQ_0_posedge_posedge, viol_0);
		$recovery (negedge R &&& (S == 1), posedge CLK,
			trecovery_R_CLK_S_EQ_1_negedge_posedge, viol_0);
		$hold (posedge CLK, posedge S &&& (R == 0),
			tremoval_S_CLK_R_EQ_0_posedge_posedge, viol_0);
		$hold (posedge CLK, negedge R &&& (S == 1),
			tremoval_R_CLK_S_EQ_1_negedge_posedge, viol_0);
		$width (negedge CLK &&& cond0, tpw_CLK_cond0_negedge,
			0, viol_0);
		$width (negedge S &&& (R == 0), tpw_S_R_EQ_0_negedge,
			0, viol_0);
		$width (posedge R &&& (S == 1), tpw_R_S_EQ_1_posedge,
			0, viol_0);
	endspecify
endmodule
`endcelldefine

//%END nlatchsr

`celldefine
`ifdef ADK_RTL_PRIMITIVES
  
module mux2 (q, i1, i0, s0);
	input i1, i0, s0;
	output q;

assign q = (s0) ? i1 : i0;

endmodule
`else // !`ifdef ADK_RTL_PRIMITIVES
    
primitive mux2 (q, i1, i0, s0);
	input i1, i0, s0;
	output q;

	table
		  ?  0  0 : 0;
		  ?  1  0 : 1;
		  0  ?  1 : 0;
		  1  ?  1 : 1;
		  0  0  ? : 0;
		  1  1  ? : 1;
	endtable
endprimitive

`endif // !`if ADK_RTL_PRIMITIVES
  
`endcelldefine

//%BEGIN mux21

`celldefine
module mux21 (A0, A1, S0, Y);
	input A0, A1, S0;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	mux2 mux (Y, A1, A0, S0);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_S0_Y = 0.0;
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;

		(S0 => Y) = tpd_S0_Y;
		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
	endspecify
endmodule
`endcelldefine

//%END mux21


//%BEGIN nand02

`celldefine
module nand02 (A0, A1, Y);
	input A0, A1;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	nand (Y, A0, A1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
	endspecify
endmodule
`endcelldefine

//%END nand02

//%BEGIN nand02_2x

`celldefine
module nand02_2x (A0, A1, Y);
	input A0, A1;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	nand (Y, A0, A1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
	endspecify
endmodule
`endcelldefine

//%END nand02_2x

//%BEGIN nand03

`celldefine
module nand03 (A0, A1, A2, Y);
	input A0, A1, A2;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	nand (Y, A0, A1, A2);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
	endspecify
endmodule
`endcelldefine

//%END nand03

//%BEGIN nand03_2x

`celldefine
module nand03_2x (A0, A1, A2, Y);
	input A0, A1, A2;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	nand (Y, A0, A1, A2);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
	endspecify
endmodule
`endcelldefine

//%END nand03_2x

//%BEGIN nand04

`celldefine
module nand04 (A0, A1, A2, A3, Y);
	input A0, A1, A2, A3;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	nand (Y, A0, A1, A2, A3);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_A3_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(A3 => Y) = tpd_A3_Y;
	endspecify
endmodule
`endcelldefine

//%END nand04

//%BEGIN nand04_2x

`celldefine
module nand04_2x (A0, A1, A2, A3, Y);
	input A0, A1, A2, A3;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	nand (Y, A0, A1, A2, A3);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_A3_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(A3 => Y) = tpd_A3_Y;
	endspecify
endmodule
`endcelldefine

//%END nand04_2x

//%BEGIN nor02

`celldefine
module nor02 (A0, A1, Y);
	input A0, A1;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	nor (Y, A0, A1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
	endspecify
endmodule
`endcelldefine

//%END nor02

//%BEGIN nor02_2x

`celldefine
module nor02_2x (A0, A1, Y);
	input A0, A1;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	nor (Y, A0, A1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
	endspecify
endmodule
`endcelldefine

//%END nor02_2x

//%BEGIN nor02ii

`celldefine
module nor02ii (A0, A1, Y);
	input A0, A1;
	output Y;

	wire int_res_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	not (int_res_0, A1);
	nor (Y, A0, int_res_0);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
	endspecify
endmodule
`endcelldefine

//%END nor02ii

//%BEGIN nor03

`celldefine
module nor03 (A0, A1, A2, Y);
	input A0, A1, A2;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	nor (Y, A0, A1, A2);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
	endspecify
endmodule
`endcelldefine

//%END nor03

//%BEGIN nor03_2x

`celldefine
module nor03_2x (A0, A1, A2, Y);
	input A0, A1, A2;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	nor (Y, A0, A1, A2);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
	endspecify
endmodule
`endcelldefine

//%END nor03_2x

//%BEGIN nor04

`celldefine
module nor04 (A0, A1, A2, A3, Y);
	input A0, A1, A2, A3;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	nor (Y, A0, A1, A2, A3);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_A3_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(A3 => Y) = tpd_A3_Y;
	endspecify
endmodule
`endcelldefine

//%END nor04

//%BEGIN nor04_2x

`celldefine
module nor04_2x (A0, A1, A2, A3, Y);
	input A0, A1, A2, A3;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	nor (Y, A0, A1, A2, A3);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_A3_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(A3 => Y) = tpd_A3_Y;
	endspecify
endmodule
`endcelldefine

//%END nor04_2x

//%BEGIN oai21

`celldefine
module oai21 (A0, A1, B0, Y);
	input A0, A1, B0;
	output Y;

	wire int_res_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	or (int_res_0, A0, A1);
	nand (Y, int_res_0, B0);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_B0_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(B0 => Y) = tpd_B0_Y;
	endspecify
endmodule
`endcelldefine

//%END oai21

//%BEGIN oai22

`celldefine
module oai22 (A0, A1, B0, B1, Y);
	input A0, A1, B0, B1;
	output Y;

	wire int_res_0, int_res_1;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	or (int_res_0, A0, A1);
	or (int_res_1, B0, B1);
	nand (Y, int_res_0, int_res_1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
	endspecify
endmodule
`endcelldefine

//%END oai22

//%BEGIN oai221

`celldefine
module oai221 (A0, A1, B0, B1, C0, Y);
	input A0, A1, B0, B1, C0;
	output Y;

	wire int_res_0, int_res_1;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	or (int_res_0, A0, A1);
	or (int_res_1, B0, B1);
	nand (Y, int_res_0, int_res_1, C0);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_C0_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(C0 => Y) = tpd_C0_Y;
	endspecify
endmodule
`endcelldefine

//%END oai221

//%BEGIN oai222

`celldefine
module oai222 (A0, A1, B0, B1, C0, C1, Y);
	input A0, A1, B0, B1, C0, C1;
	output Y;

	wire int_res_0, int_res_1, int_res_2;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	or (int_res_0, A0, A1);
	or (int_res_1, B0, B1);
	or (int_res_2, C0, C1);
	nand (Y, int_res_0, int_res_1, int_res_2);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_C0_Y = 0.0;
		specparam tpd_C1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(C0 => Y) = tpd_C0_Y;
		(C1 => Y) = tpd_C1_Y;
	endspecify
endmodule
`endcelldefine

//%END oai222

//%BEGIN oai32

`celldefine
module oai32 (A0, A1, A2, B0, B1, Y);
	input A0, A1, A2, B0, B1;
	output Y;

	wire int_res_0, int_res_1;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	or (int_res_0, A0, A1, A2);
	or (int_res_1, B0, B1);
	nand (Y, int_res_0, int_res_1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
	endspecify
endmodule
`endcelldefine

//%END oai32

//%BEGIN oai321

`celldefine
module oai321 (A0, A1, A2, B0, B1, C0, Y);
	input A0, A1, A2, B0, B1, C0;
	output Y;

	wire int_res_0, int_res_1;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	or (int_res_0, A0, A1, A2);
	or (int_res_1, B0, B1);
	nand (Y, int_res_0, int_res_1, C0);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_C0_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(C0 => Y) = tpd_C0_Y;
	endspecify
endmodule
`endcelldefine

//%END oai321

//%BEGIN oai322

`celldefine
module oai322 (A0, A1, A2, B0, B1, C0, C1, Y);
	input A0, A1, A2, B0, B1, C0, C1;
	output Y;

	wire int_res_0, int_res_1, int_res_2;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	or (int_res_0, A0, A1, A2);
	or (int_res_1, B0, B1);
	or (int_res_2, C0, C1);
	nand (Y, int_res_0, int_res_1, int_res_2);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_C0_Y = 0.0;
		specparam tpd_C1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(C0 => Y) = tpd_C0_Y;
		(C1 => Y) = tpd_C1_Y;
	endspecify
endmodule
`endcelldefine

//%END oai322

//%BEGIN oai33

`celldefine
module oai33 (A0, A1, A2, B0, B1, B2, Y);
	input A0, A1, A2, B0, B1, B2;
	output Y;

	wire int_res_0, int_res_1;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	or (int_res_0, A0, A1, A2);
	or (int_res_1, B0, B1, B2);
	nand (Y, int_res_0, int_res_1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_B2_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(B2 => Y) = tpd_B2_Y;
	endspecify
endmodule
`endcelldefine

//%END oai33

//%BEGIN oai332

`celldefine
module oai332 (A0, A1, A2, B0, B1, B2, C0, C1, 
		Y);
	input A0, A1, A2, B0, B1, B2, C0, C1;
	output Y;

	wire int_res_0, int_res_1, int_res_2;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	or (int_res_0, A0, A1, A2);
	or (int_res_1, B0, B1, B2);
	or (int_res_2, C0, C1);
	nand (Y, int_res_0, int_res_1, int_res_2);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_B2_Y = 0.0;
		specparam tpd_C0_Y = 0.0;
		specparam tpd_C1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(B2 => Y) = tpd_B2_Y;
		(C0 => Y) = tpd_C0_Y;
		(C1 => Y) = tpd_C1_Y;
	endspecify
endmodule
`endcelldefine

//%END oai332

//%BEGIN oai333

`celldefine
module oai333 (A0, A1, A2, B0, B1, B2, C0, C1, 
		C2, Y);
	input A0, A1, A2, B0, B1, B2, C0, C1, 
		C2;
	output Y;

	wire int_res_0, int_res_1, int_res_2;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	or (int_res_0, A0, A1, A2);
	or (int_res_1, B0, B1, B2);
	or (int_res_2, C0, C1, C2);
	nand (Y, int_res_0, int_res_1, int_res_2);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_B2_Y = 0.0;
		specparam tpd_C0_Y = 0.0;
		specparam tpd_C1_Y = 0.0;
		specparam tpd_C2_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(B2 => Y) = tpd_B2_Y;
		(C0 => Y) = tpd_C0_Y;
		(C1 => Y) = tpd_C1_Y;
		(C2 => Y) = tpd_C2_Y;
	endspecify
endmodule
`endcelldefine

//%END oai333

//%BEGIN oai422

`celldefine
module oai422 (A0, A1, A2, A3, B0, B1, C0, C1, 
		Y);
	input A0, A1, A2, A3, B0, B1, C0, C1;
	output Y;

	wire int_res_0, int_res_1, int_res_2;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	or (int_res_0, A0, A1, A2, A3);
	or (int_res_1, B0, B1);
	or (int_res_2, C0, C1);
	nand (Y, int_res_0, int_res_1, int_res_2);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_A3_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_C0_Y = 0.0;
		specparam tpd_C1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(A3 => Y) = tpd_A3_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(C0 => Y) = tpd_C0_Y;
		(C1 => Y) = tpd_C1_Y;
	endspecify
endmodule
`endcelldefine

//%END oai422

//%BEGIN oai43

`celldefine
module oai43 (A0, A1, A2, A3, B0, B1, B2, Y);
	input A0, A1, A2, A3, B0, B1, B2;
	output Y;

	wire int_res_0, int_res_1;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	or (int_res_0, A0, A1, A2, A3);
	or (int_res_1, B0, B1, B2);
	nand (Y, int_res_0, int_res_1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_A3_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_B2_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(A3 => Y) = tpd_A3_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(B2 => Y) = tpd_B2_Y;
	endspecify
endmodule
`endcelldefine

//%END oai43

//%BEGIN oai44

`celldefine
module oai44 (A0, A1, A2, A3, B0, B1, B2, B3, 
		Y);
	input A0, A1, A2, A3, B0, B1, B2, B3;
	output Y;

	wire int_res_0, int_res_1;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	or (int_res_0, A0, A1, A2, A3);
	or (int_res_1, B0, B1, B2, B3);
	nand (Y, int_res_0, int_res_1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_A3_Y = 0.0;
		specparam tpd_B0_Y = 0.0;
		specparam tpd_B1_Y = 0.0;
		specparam tpd_B2_Y = 0.0;
		specparam tpd_B3_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(A3 => Y) = tpd_A3_Y;
		(B0 => Y) = tpd_B0_Y;
		(B1 => Y) = tpd_B1_Y;
		(B2 => Y) = tpd_B2_Y;
		(B3 => Y) = tpd_B3_Y;
	endspecify
endmodule
`endcelldefine

//%END oai44

//%BEGIN or02

`celldefine
module or02 (A0, A1, Y);
	input A0, A1;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	or (Y, A0, A1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
	endspecify
endmodule
`endcelldefine

//%END or02

//%BEGIN or03

`celldefine
module or03 (A0, A1, A2, Y);
	input A0, A1, A2;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	or (Y, A0, A1, A2);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
	endspecify
endmodule
`endcelldefine

//%END or03

//%BEGIN or04

`celldefine
module or04 (A0, A1, A2, A3, Y);
	input A0, A1, A2, A3;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	or (Y, A0, A1, A2, A3);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;
		specparam tpd_A2_Y = 0.0;
		specparam tpd_A3_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
		(A2 => Y) = tpd_A2_Y;
		(A3 => Y) = tpd_A3_Y;
	endspecify
endmodule
`endcelldefine

//%END or04

//%BEGIN nck_sff

`celldefine
module nck_sff (D, SI, SE, CLK, Q, QB);
	input D, SI, SE, CLK;
	output Q, QB;

	reg viol_0;
	wire int_res__D, dummy_0, int_res_0, 
		int_res_1, int_res_2, int_res_3, int_res_4, 
		cond0, int_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	mux2 mux (int_res__D, SI, D, SE);
	nck_dff_p ff (Q, viol_0, CLK, int_res__D );
	not (QB, Q);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	not (int_res_1, D);
	and (int_res_2, SI, int_res_1);
	not (int_res_3, SI);
	and (int_res_4, int_res_3, D);
	or (cond0, int_res_2, int_res_4);
	specify
		specparam tpd_CLK_Q_negedge = 0.1;
		specparam tpd_CLK_QB_negedge = 0.1;
		specparam tsetup_SE_CLK_noedge_negedge = 0.1;
		specparam tsetup_D_CLK_noedge_negedge = 0.1;
		specparam tsetup_SI_CLK_noedge_negedge = 0.1;
		specparam thold_SE_CLK_noedge_negedge = 0.0;
		specparam thold_D_CLK_noedge_negedge = 0.0;
		specparam thold_SI_CLK_noedge_negedge = 0.0;
		specparam tpw_CLK_posedge = 0.1;
		specparam tpw_CLK_negedge = 0.1;

		(negedge CLK => (Q+:int_res__D)) = tpd_CLK_Q_negedge;
		(negedge CLK => (QB-:int_res__D)) = tpd_CLK_QB_negedge;
		$setup (posedge SE &&& cond0, negedge CLK,
			tsetup_SE_CLK_noedge_negedge, viol_0);
		$setup (negedge SE &&& cond0, negedge CLK,
			tsetup_SE_CLK_noedge_negedge, viol_0);
		$setup (posedge D &&& (SE == 0), negedge CLK,
			tsetup_D_CLK_noedge_negedge, viol_0);
		$setup (negedge D &&& (SE == 0), negedge CLK,
			tsetup_D_CLK_noedge_negedge, viol_0);
		$setup (posedge SI &&& (SE == 1), negedge CLK,
			tsetup_SI_CLK_noedge_negedge, viol_0);
		$setup (negedge SI &&& (SE == 1), negedge CLK,
			tsetup_SI_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, posedge SE &&& cond0,
			thold_SE_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, negedge SE &&& cond0,
			thold_SE_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, posedge D &&& (SE == 0),
			thold_D_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, negedge D &&& (SE == 0),
			thold_D_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, posedge SI &&& (SE == 1),
			thold_SI_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, negedge SI &&& (SE == 1),
			thold_SI_CLK_noedge_negedge, viol_0);
		$width (negedge CLK, tpw_CLK_negedge,
			0, viol_0);
		$width (posedge CLK, tpw_CLK_posedge,
			0, viol_0);
	endspecify
endmodule
`endcelldefine

//%END nck_sff


//%BEGIN sff

`celldefine
module sff (D, SI, SE, CLK, Q, QB);
	input D, SI, SE, CLK;
	output Q, QB;

	reg viol_0;
	wire int_res__D, dummy_0, int_res_0, 
		int_res_1, int_res_2, int_res_3, int_res_4, 
		cond0, int_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	mux2 mux (int_res__D, SI, D, SE);
	dff_p ff (Q, viol_0, CLK, int_res__D );
	not (QB, Q);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	not (int_res_1, D);
	and (int_res_2, SI, int_res_1);
	not (int_res_3, SI);
	and (int_res_4, int_res_3, D);
	or (cond0, int_res_2, int_res_4);
	specify
		specparam tpd_CLK_Q_posedge = 0.1;
		specparam tpd_CLK_QB_posedge = 0.1;
		specparam tsetup_SE_CLK_noedge_posedge = 0.1;
		specparam tsetup_D_CLK_noedge_posedge = 0.1;
		specparam tsetup_SI_CLK_noedge_posedge = 0.1;
		specparam thold_SE_CLK_noedge_posedge = 0.0;
		specparam thold_D_CLK_noedge_posedge = 0.0;
		specparam thold_SI_CLK_noedge_posedge = 0.0;
		specparam tpw_CLK_posedge = 0.1;
		specparam tpw_CLK_negedge = 0.1;

		(posedge CLK => (Q+:int_res__D)) = tpd_CLK_Q_posedge;
		(posedge CLK => (QB-:int_res__D)) = tpd_CLK_QB_posedge;
		$setup (posedge SE &&& cond0, posedge CLK,
			tsetup_SE_CLK_noedge_posedge, viol_0);
		$setup (negedge SE &&& cond0, posedge CLK,
			tsetup_SE_CLK_noedge_posedge, viol_0);
		$setup (posedge D &&& (SE == 0), posedge CLK,
			tsetup_D_CLK_noedge_posedge, viol_0);
		$setup (negedge D &&& (SE == 0), posedge CLK,
			tsetup_D_CLK_noedge_posedge, viol_0);
		$setup (posedge SI &&& (SE == 1), posedge CLK,
			tsetup_SI_CLK_noedge_posedge, viol_0);
		$setup (negedge SI &&& (SE == 1), posedge CLK,
			tsetup_SI_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, posedge SE &&& cond0,
			thold_SE_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, negedge SE &&& cond0,
			thold_SE_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, posedge D &&& (SE == 0),
			thold_D_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, negedge D &&& (SE == 0),
			thold_D_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, posedge SI &&& (SE == 1),
			thold_SI_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, negedge SI &&& (SE == 1),
			thold_SI_CLK_noedge_posedge, viol_0);
		$width (posedge CLK, tpw_CLK_posedge,
			0, viol_0);
		$width (negedge CLK, tpw_CLK_negedge,
			0, viol_0);
	endspecify
endmodule
`endcelldefine

//%END sff


//%BEGIN sffr

`celldefine
module sffr (D, SI, SE, CLK, R, Q, QB);
	input D, SI, SE, CLK, R;
	output Q, QB;

	reg viol_0;
	wire int_res__D, dummy_0, int_res_0,
		int_res_1, int_res_2, int_res_3, int_res_4, 
		int_res_5, int_res_6, cond0, int_res_7, 
		int_res_8, cond1, int_res_9, cond2, int_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	mux2 mux (int_res__D, SI, D, SE);
	dff_p_r ff (Q, viol_0, R, CLK, int_res__D );
	not (QB, Q);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	not (int_res_1, D);
	not (int_res_2, R);
	and (int_res_3, SI, int_res_1, int_res_2);
	not (int_res_4, SI);
	not (int_res_5, R);
	and (int_res_6, int_res_4, D, int_res_5);
	or (cond0, int_res_3, int_res_6);
	not (int_res_7, SE);
	not (int_res_8, R);
	and (cond1, int_res_7, int_res_8);
	not (int_res_9, R);
	and (cond2, SE, int_res_9);
	specify
		specparam tpd_CLK_Q_posedge = 0.1;
		specparam tpd_R_Q_negedge = 0.1;
		specparam tpd_CLK_QB_posedge = 0.1;
		specparam tpd_R_QB_negedge = 0.1;
		specparam tsetup_SE_CLK_noedge_posedge = 0.1;
		specparam tsetup_D_CLK_noedge_posedge = 0.1;
		specparam tsetup_SI_CLK_noedge_posedge = 0.1;
		specparam thold_SE_CLK_noedge_posedge = 0.0;
		specparam thold_D_CLK_noedge_posedge = 0.0;
		specparam thold_SI_CLK_noedge_posedge = 0.0;
		specparam trecovery_R_CLK_posedge_posedge = 0.0;
		specparam tremoval_R_CLK_posedge_posedge = 0.0;
		specparam tpw_CLK_R_EQ_1_posedge = 0.1;
		specparam tpw_CLK_R_EQ_1_negedge = 0.1;
		specparam tpw_R_negedge = 0.1;

		(posedge CLK => (Q+:int_res__D)) = tpd_CLK_Q_posedge;
		(posedge R => (Q-:R)) = tpd_R_Q_negedge;
		(posedge CLK => (QB-:int_res__D)) = tpd_CLK_QB_posedge;
		(posedge R => (QB+:R)) = tpd_R_QB_negedge;
		$setup (posedge SE &&& cond0, posedge CLK,
			tsetup_SE_CLK_noedge_posedge, viol_0);
		$setup (negedge SE &&& cond0, posedge CLK,
			tsetup_SE_CLK_noedge_posedge, viol_0);
		$setup (posedge D &&& cond1, posedge CLK,
			tsetup_D_CLK_noedge_posedge, viol_0);
		$setup (negedge D &&& cond1, posedge CLK,
			tsetup_D_CLK_noedge_posedge, viol_0);
		$setup (posedge SI &&& cond2, posedge CLK,
			tsetup_SI_CLK_noedge_posedge, viol_0);
		$setup (negedge SI &&& cond2, posedge CLK,
			tsetup_SI_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, posedge SE &&& cond0,
			thold_SE_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, negedge SE &&& cond0,
			thold_SE_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, posedge D &&& cond1,
			thold_D_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, negedge D &&& cond1,
			thold_D_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, posedge SI &&& cond2,
			thold_SI_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, negedge SI &&& cond2,
			thold_SI_CLK_noedge_posedge, viol_0);
		$recovery (posedge R, posedge CLK,
			trecovery_R_CLK_posedge_posedge, viol_0);
		$hold (posedge CLK, posedge R,
			tremoval_R_CLK_posedge_posedge, viol_0);
		$width (posedge CLK &&& (R == 1), tpw_CLK_R_EQ_1_posedge,
			0, viol_0);
		$width (negedge CLK &&& (R == 1), tpw_CLK_R_EQ_1_negedge,
			0, viol_0);
		$width (negedge R, tpw_R_negedge,
			0, viol_0);
	endspecify
endmodule
`endcelldefine

//%END sffr

//%BEGIN nck_sffr

`celldefine
module nck_sffr (D, SI, SE, CLK, R, Q, QB);
	input D, SI, SE, CLK, R;
	output Q, QB;

	reg viol_0;
	wire int_res__D, dummy_0, int_res_0,
		int_res_1, int_res_2, int_res_3, int_res_4, 
		int_res_5, int_res_6, cond0, int_res_7, 
		int_res_8, cond1, int_res_9, cond2, int_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	mux2 mux (int_res__D, SI, D, SE);
	nck_dff_p_r ff (Q, viol_0, R, CLK, int_res__D );
	not (QB, Q);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	not (int_res_1, D);
	not (int_res_2, R);
	and (int_res_3, SI, int_res_1, int_res_2);
	not (int_res_4, SI);
	not (int_res_5, R);
	and (int_res_6, int_res_4, D, int_res_5);
	or (cond0, int_res_3, int_res_6);
	not (int_res_7, SE);
	not (int_res_8, R);
	and (cond1, int_res_7, int_res_8);
	not (int_res_9, R);
	and (cond2, SE, int_res_9);
	specify
		specparam tpd_CLK_Q_negedge = 0.1;
		specparam tpd_R_Q_negedge = 0.1;
		specparam tpd_CLK_QB_negedge = 0.1;
		specparam tpd_R_QB_negedge = 0.1;
		specparam tsetup_SE_CLK_noedge_negedge = 0.1;
		specparam tsetup_D_CLK_noedge_negedge = 0.1;
		specparam tsetup_SI_CLK_noedge_negedge = 0.1;
		specparam thold_SE_CLK_noedge_negedge = 0.0;
		specparam thold_D_CLK_noedge_negedge = 0.0;
		specparam thold_SI_CLK_noedge_negedge = 0.0;
		specparam trecovery_R_CLK_posedge_negedge = 0.0;
		specparam tremoval_R_CLK_posedge_negedge = 0.0;
		specparam tpw_CLK_R_EQ_1_posedge = 0.1;
		specparam tpw_CLK_R_EQ_1_negedge = 0.1;
		specparam tpw_R_negedge = 0.1;

		(negedge CLK => (Q+:int_res__D)) = tpd_CLK_Q_negedge;
		(posedge R => (Q-:R)) = tpd_R_Q_negedge;
		(negedge CLK => (QB-:int_res__D)) = tpd_CLK_QB_negedge;
		(posedge R => (QB+:R)) = tpd_R_QB_negedge;
		$setup (posedge SE &&& cond0, negedge CLK,
			tsetup_SE_CLK_noedge_negedge, viol_0);
		$setup (negedge SE &&& cond0, negedge CLK,
			tsetup_SE_CLK_noedge_negedge, viol_0);
		$setup (posedge D &&& cond1, negedge CLK,
			tsetup_D_CLK_noedge_negedge, viol_0);
		$setup (negedge D &&& cond1, negedge CLK,
			tsetup_D_CLK_noedge_negedge, viol_0);
		$setup (posedge SI &&& cond2, negedge CLK,
			tsetup_SI_CLK_noedge_negedge, viol_0);
		$setup (negedge SI &&& cond2, negedge CLK,
			tsetup_SI_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, posedge SE &&& cond0,
			thold_SE_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, negedge SE &&& cond0,
			thold_SE_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, posedge D &&& cond1,
			thold_D_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, negedge D &&& cond1,
			thold_D_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, posedge SI &&& cond2,
			thold_SI_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, negedge SI &&& cond2,
			thold_SI_CLK_noedge_negedge, viol_0);
		$recovery (posedge R, negedge CLK,
			trecovery_R_CLK_posedge_negedge, viol_0);
		$hold (negedge CLK, posedge R,
			tremoval_R_CLK_posedge_negedge, viol_0);
		$width (negedge CLK &&& (R == 1), tpw_CLK_R_EQ_1_negedge,
			0, viol_0);
		$width (posedge CLK &&& (R == 1), tpw_CLK_R_EQ_1_posedge,
			0, viol_0);
		$width (negedge R, tpw_R_negedge,
			0, viol_0);
	endspecify
endmodule
`endcelldefine

//%END nck_sffr


//%BEGIN sffs

`celldefine
module sffs (D, SI, SE, CLK, S, Q, QB);
	input D, SI, SE, CLK, S;
	output Q, QB;

	reg viol_0;
	wire int_res__D, dummy_0, int_res_0, 
		int_res_1, int_res_2, int_res_3, int_res_4, 
		int_res_5, int_res_6, cond0, int_res_7, 
		int_res_8, cond1, int_res_9, cond2, int_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	mux2 mux (int_res__D, SI, D, SE);
	dff_p_s dff (Q, viol_0,S, CLK, int_res__D );
	not (QB, Q);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	not (int_res_1, D);
	not (int_res_2, S);
	and (int_res_3, SI, int_res_1, int_res_2);
	not (int_res_4, SI);
	not (int_res_5, S);
	and (int_res_6, int_res_4, D, int_res_5);
	or (cond0, int_res_3, int_res_6);
	not (int_res_7, SE);
	not (int_res_8, S);
	and (cond1, int_res_7, int_res_8);
	not (int_res_9, S);
	and (cond2, SE, int_res_9);
	specify
		specparam tpd_CLK_Q_posedge = 0.1;
		specparam tpd_S_Q_posedge = 0.1;
		specparam tpd_CLK_QB_posedge = 0.1;
		specparam tpd_S_QB_posedge = 0.1;
		specparam tsetup_SE_CLK_noedge_posedge = 0.1;
		specparam tsetup_D_CLK_noedge_posedge = 0.1;
		specparam tsetup_SI_CLK_noedge_posedge = 0.1;
		specparam thold_SE_CLK_noedge_posedge = 0.0;
		specparam thold_D_CLK_noedge_posedge = 0.0;
		specparam thold_SI_CLK_noedge_posedge = 0.0;
		specparam trecovery_S_CLK_negedge_posedge = 0.0;
		specparam tremoval_S_CLK_negedge_posedge = 0.0;
		specparam tpw_CLK_S_EQ_0_posedge = 0.1;
		specparam tpw_CLK_S_EQ_0_negedge = 0.1;
		specparam tpw_S_posedge = 0.1;

		(posedge CLK => (Q+:int_res__D)) = tpd_CLK_Q_posedge;
		(posedge S => (Q:int_res__D)) = tpd_S_Q_posedge;
		(posedge CLK => (QB-:int_res__D)) = tpd_CLK_QB_posedge;
		(posedge S => (QB:int_res__D)) = tpd_S_QB_posedge;
		$setup (posedge SE &&& cond0, posedge CLK,
			tsetup_SE_CLK_noedge_posedge, viol_0);
		$setup (negedge SE &&& cond0, posedge CLK,
			tsetup_SE_CLK_noedge_posedge, viol_0);
		$setup (posedge D &&& cond1, posedge CLK,
			tsetup_D_CLK_noedge_posedge, viol_0);
		$setup (negedge D &&& cond1, posedge CLK,
			tsetup_D_CLK_noedge_posedge, viol_0);
		$setup (posedge SI &&& cond2, posedge CLK,
			tsetup_SI_CLK_noedge_posedge, viol_0);
		$setup (negedge SI &&& cond2, posedge CLK,
			tsetup_SI_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, posedge SE &&& cond0,
			thold_SE_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, negedge SE &&& cond0,
			thold_SE_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, posedge D &&& cond1,
			thold_D_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, negedge D &&& cond1,
			thold_D_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, posedge SI &&& cond2,
			thold_SI_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, negedge SI &&& cond2,
			thold_SI_CLK_noedge_posedge, viol_0);
		$recovery (negedge S, posedge CLK,
			trecovery_S_CLK_negedge_posedge, viol_0);
		$hold (posedge CLK, negedge S,
			tremoval_S_CLK_negedge_posedge, viol_0);
		$width (posedge CLK &&& (S == 0), tpw_CLK_S_EQ_0_posedge,
			0, viol_0);
		$width (negedge CLK &&& (S == 0), tpw_CLK_S_EQ_0_negedge,
			0, viol_0);
		$width (posedge S, tpw_S_posedge,
			0, viol_0);
	endspecify
endmodule
`endcelldefine

//%END sffs

//%BEGIN nck_sffs

`celldefine
module nck_sffs (D, SI, SE, CLK, S, Q, QB);
	input D, SI, SE, CLK, S;
	output Q, QB;

	reg viol_0;
	wire int_res__D, dummy_0, int_res_0, 
		int_res_1, int_res_2, int_res_3, int_res_4, 
		int_res_5, int_res_6, cond0, int_res_7, 
		int_res_8, cond1, int_res_9, cond2, int_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	mux2 mux (int_res__D, SI, D, SE);
	nck_dff_p_s ff (Q, viol_0,S, CLK, int_res__D );
	not (QB, Q);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	not (int_res_1, D);
	not (int_res_2, S);
	and (int_res_3, SI, int_res_1, int_res_2);
	not (int_res_4, SI);
	not (int_res_5, S);
	and (int_res_6, int_res_4, D, int_res_5);
	or (cond0, int_res_3, int_res_6);
	not (int_res_7, SE);
	not (int_res_8, S);
	and (cond1, int_res_7, int_res_8);
	not (int_res_9, S);
	and (cond2, SE, int_res_9);
	specify
		specparam tpd_CLK_Q_negedge = 0.1;
		specparam tpd_S_Q_posedge = 0.1;
		specparam tpd_CLK_QB_negedge = 0.1;
		specparam tpd_S_QB_posedge = 0.1;
		specparam tsetup_SE_CLK_noedge_negedge = 0.1;
		specparam tsetup_D_CLK_noedge_negedge = 0.1;
		specparam tsetup_SI_CLK_noedge_negedge = 0.1;
		specparam thold_SE_CLK_noedge_negedge = 0.0;
		specparam thold_D_CLK_noedge_negedge = 0.0;
		specparam thold_SI_CLK_noedge_negedge = 0.0;
		specparam trecovery_S_CLK_negedge_negedge = 0.0;
		specparam tremoval_S_CLK_negedge_negedge = 0.0;
		specparam tpw_CLK_S_EQ_0_posedge = 0.1;
		specparam tpw_CLK_S_EQ_0_negedge = 0.1;
		specparam tpw_S_posedge = 0.1;

		(negedge CLK => (Q+:int_res__D)) = tpd_CLK_Q_negedge;
		(posedge S => (Q:int_res__D)) = tpd_S_Q_posedge;
		(negedge CLK => (QB-:int_res__D)) = tpd_CLK_QB_negedge;
		(posedge S => (QB:int_res__D)) = tpd_S_QB_posedge;
		$setup (posedge SE &&& cond0, negedge CLK,
			tsetup_SE_CLK_noedge_negedge, viol_0);
		$setup (negedge SE &&& cond0, negedge CLK,
			tsetup_SE_CLK_noedge_negedge, viol_0);
		$setup (posedge D &&& cond1, negedge CLK,
			tsetup_D_CLK_noedge_negedge, viol_0);
		$setup (negedge D &&& cond1, negedge CLK,
			tsetup_D_CLK_noedge_negedge, viol_0);
		$setup (posedge SI &&& cond2, negedge CLK,
			tsetup_SI_CLK_noedge_negedge, viol_0);
		$setup (negedge SI &&& cond2, negedge CLK,
			tsetup_SI_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, posedge SE &&& cond0,
			thold_SE_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, negedge SE &&& cond0,
			thold_SE_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, posedge D &&& cond1,
			thold_D_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, negedge D &&& cond1,
			thold_D_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, posedge SI &&& cond2,
			thold_SI_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, negedge SI &&& cond2,
			thold_SI_CLK_noedge_negedge, viol_0);
		$recovery (negedge S, negedge CLK,
			trecovery_S_CLK_negedge_negedge, viol_0);
		$hold (negedge CLK, negedge S,
			tremoval_S_CLK_negedge_negedge, viol_0);
		$width (negedge CLK &&& (S == 0), tpw_CLK_S_EQ_0_negedge,
			0, viol_0);
		$width (posedge CLK &&& (S == 0), tpw_CLK_S_EQ_0_posedge,
			0, viol_0);
		$width (posedge S, tpw_S_posedge,
			0, viol_0);
	endspecify
endmodule
`endcelldefine

//%END nck_sffs


//%BEGIN sffsr

`celldefine
module sffsr (D, SI, SE, CLK, S, R, Q, QB);
	input D, SI, SE, CLK, S, R;
	output Q, QB;

	reg viol_0;
	wire int_res__D, int_res_0, 
		int_res_1, int_res_2, int_res_3, int_res_4, 
		int_res_5, int_res_6, int_res_7, int_res_8,
		cond0, int_res_9, int_res_10, int_res_11,
		cond1, int_res_12, int_res_13, cond2, 
		int_res_14, int_res_15, cond3;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	mux2 mux (int_res__D, SI, D, SE);
	dff_p_sr ff (Q, viol_0, S, R, CLK, int_res__D );
	not (QB, Q);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	not (int_res_1, D);
	not (int_res_2, S);
	not (int_res_3, R);
	and (int_res_4, SI, int_res_1, int_res_2, int_res_3);
	not (int_res_5, SI);
	not (int_res_6, S);
	not (int_res_7, R);
	and (int_res_8, int_res_5, D, int_res_6, int_res_7);
	or (cond0, int_res_4, int_res_8);
	not (int_res_9, SE);
	not (int_res_10, S);
	not (int_res_11, R);
	and (cond1, int_res_9, int_res_10, int_res_11);
	not (int_res_12, S);
	not (int_res_13, R);
	and (cond2, SE, int_res_12, int_res_13);
	not (int_res_14, S);
	not (int_res_15, R);
	and (cond3, int_res_14, int_res_15);
	specify
		specparam tpd_CLK_Q_posedge = 0.1;
		specparam tpd_S_Q_posedge = 0.1;
		specparam tpd_R_Q_posedge = 0.1;
		specparam tpd_CLK_QB_posedge = 0.1;
		specparam tpd_S_QB_posedge = 0.1;
		specparam tpd_R_QB_posedge = 0.1;
		specparam tsetup_SE_CLK_noedge_posedge = 0.1;
		specparam tsetup_D_CLK_noedge_posedge = 0.1;
		specparam tsetup_SI_CLK_noedge_posedge = 0.1;
		specparam thold_SE_CLK_noedge_posedge = 0.0;
		specparam thold_D_CLK_noedge_posedge = 0.0;
		specparam thold_SI_CLK_noedge_posedge = 0.0;
		specparam trecovery_S_CLK_noedge_posedge = 0.0;
		specparam trecovery_R_CLK_noedge_posedge = 0.0;
		specparam tremoval_S_CLK_noedge_posedge = 0.0;
		specparam tremoval_R_CLK_noedge_posedge = 0.0;
		specparam tpw_CLK_cond3_posedge = 0.1;
		specparam tpw_CLK_cond3_negedge = 0.1;
		specparam tpw_S_R_EQ_1_posedge = 0.1;
		specparam tpw_R_S_EQ_0_posedge = 0.1;

		(posedge CLK => (Q+:int_res__D)) = tpd_CLK_Q_posedge;
		(posedge S => (Q:int_res__D)) = tpd_S_Q_posedge;
		(posedge R => (Q-:R)) = tpd_R_Q_posedge;
		(posedge CLK => (QB-:int_res__D)) = tpd_CLK_QB_posedge;
		(posedge S => (QB:int_res__D)) = tpd_S_QB_posedge;
		(posedge R => (QB+:R)) = tpd_R_QB_posedge;
		$setup (posedge SE &&& cond0, posedge CLK,
			tsetup_SE_CLK_noedge_posedge, viol_0);
		$setup (negedge SE &&& cond0, posedge CLK,
			tsetup_SE_CLK_noedge_posedge, viol_0);
		$setup (posedge D &&& cond1, posedge CLK,
			tsetup_D_CLK_noedge_posedge, viol_0);
		$setup (negedge D &&& cond1, posedge CLK,
			tsetup_D_CLK_noedge_posedge, viol_0);
		$setup (posedge SI &&& cond2, posedge CLK,
			tsetup_SI_CLK_noedge_posedge, viol_0);
		$setup (negedge SI &&& cond2, posedge CLK,
			tsetup_SI_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, posedge SE &&& cond0,
			thold_SE_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, negedge SE &&& cond0,
			thold_SE_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, posedge D &&& cond1,
			thold_D_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, negedge D &&& cond1,
			thold_D_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, posedge SI &&& cond2,
			thold_SI_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, negedge SI &&& cond2,
			thold_SI_CLK_noedge_posedge, viol_0);
		$recovery (negedge S &&& (R == 1), posedge CLK,
			trecovery_S_CLK_noedge_posedge, viol_0);
		$recovery (posedge R &&& (S == 0), posedge CLK,
			trecovery_R_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, negedge S &&& (R == 1),
			tremoval_S_CLK_noedge_posedge, viol_0);
		$hold (posedge CLK, posedge R &&& (S == 0),
			tremoval_R_CLK_noedge_posedge, viol_0);
		$width (posedge CLK &&& cond3, tpw_CLK_cond3_posedge,
			0, viol_0);
		$width (negedge CLK &&& cond3, tpw_CLK_cond3_posedge,
			0, viol_0);
		$width (posedge S &&& (R == 1), tpw_S_R_EQ_1_posedge,
			0, viol_0);
		$width (negedge R &&& (S == 0), tpw_R_S_EQ_0_posedge,
			0, viol_0);
	endspecify
endmodule
`endcelldefine

//%END sffsr

//%BEGIN nck_sffsr

`celldefine
module nck_sffsr (D, SI, SE, CLK, S, R, Q, QB);
	input D, SI, SE, CLK, S, R;
	output Q, QB;

	reg viol_0;
	wire int_res__D, int_res_0, 
		int_res_1, int_res_2, int_res_3, int_res_4, 
		int_res_5, int_res_6, int_res_7, int_res_8,
		cond0, int_res_9, int_res_10, int_res_11,
		cond1, int_res_12, int_res_13, cond2, 
		int_res_14, int_res_15, cond3;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	mux2 mux (int_res__D, SI, D, SE);
	nck_dff_p_sr ff (Q, viol_0, S, R, CLK, int_res__D );
	not (QB, Q);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	not (int_res_1, D);
	not (int_res_2, S);
	not (int_res_3, R);
	and (int_res_4, SI, int_res_1, int_res_2, int_res_3);
	not (int_res_5, SI);
	not (int_res_6, S);
	not (int_res_7, R);
	and (int_res_8, int_res_5, D, int_res_6, int_res_7);
	or (cond0, int_res_4, int_res_8);
	not (int_res_9, SE);
	not (int_res_10, S);
	not (int_res_11, R);
	and (cond1, int_res_9, int_res_10, int_res_11);
	not (int_res_12, S);
	not (int_res_13, R);
	and (cond2, SE, int_res_12, int_res_13);
	not (int_res_14, S);
	not (int_res_15, R);
	and (cond3, int_res_14, int_res_15);
	specify
		specparam tpd_CLK_Q_negedge = 0.1;
		specparam tpd_S_Q_posedge = 0.1;
		specparam tpd_R_Q_posedge = 0.1;
		specparam tpd_CLK_QB_negedge = 0.1;
		specparam tpd_S_QB_posedge = 0.1;
		specparam tpd_R_QB_posedge = 0.1;
		specparam tsetup_SE_CLK_noedge_negedge = 0.1;
		specparam tsetup_D_CLK_noedge_negedge = 0.1;
		specparam tsetup_SI_CLK_noedge_negedge = 0.1;
		specparam thold_SE_CLK_noedge_negedge = 0.0;
		specparam thold_D_CLK_noedge_negedge = 0.0;
		specparam thold_SI_CLK_noedge_negedge = 0.0;
		specparam trecovery_S_CLK_noedge_negedge = 0.0;
		specparam trecovery_R_CLK_noedge_negedge = 0.0;
		specparam tremoval_S_CLK_noedge_negedge = 0.0;
		specparam tremoval_R_CLK_noedge_negedge = 0.0;
		specparam tpw_CLK_cond3_posedge = 0.1;
		specparam tpw_CLK_cond3_negedge = 0.1;
		specparam tpw_S_R_EQ_1_posedge = 0.1;
		specparam tpw_R_S_EQ_0_posedge = 0.1;

		(negedge CLK => (Q+:int_res__D)) = tpd_CLK_Q_negedge;
		(posedge S => (Q+:R)) = tpd_S_Q_posedge;
		(posedge R => (Q-:R)) = tpd_R_Q_posedge;
		(negedge CLK => (QB-:int_res__D)) = tpd_CLK_QB_negedge;
		(posedge S => (QB-:R)) = tpd_S_QB_posedge;
		(posedge R => (QB+:R)) = tpd_R_QB_posedge;
		$setup (posedge SE &&& cond0, negedge CLK,
			tsetup_SE_CLK_noedge_negedge, viol_0);
		$setup (negedge SE &&& cond0, negedge CLK,
			tsetup_SE_CLK_noedge_negedge, viol_0);
		$setup (posedge D &&& cond1, negedge CLK,
			tsetup_D_CLK_noedge_negedge, viol_0);
		$setup (negedge D &&& cond1, negedge CLK,
			tsetup_D_CLK_noedge_negedge, viol_0);
		$setup (posedge SI &&& cond2, negedge CLK,
			tsetup_SI_CLK_noedge_negedge, viol_0);
		$setup (negedge SI &&& cond2, negedge CLK,
			tsetup_SI_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, posedge SE &&& cond0,
			thold_SE_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, negedge SE &&& cond0,
			thold_SE_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, posedge D &&& cond1,
			thold_D_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, negedge D &&& cond1,
			thold_D_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, posedge SI &&& cond2,
			thold_SI_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, negedge SI &&& cond2,
			thold_SI_CLK_noedge_negedge, viol_0);
		$recovery (negedge S &&& (R == 1), negedge CLK,
			trecovery_S_CLK_noedge_negedge, viol_0);
		$recovery (posedge R &&& (S == 0), negedge CLK,
			trecovery_R_CLK_noedge_negedge, viol_0);
		$hold (posedge CLK, negedge S &&& (R == 1),
			tremoval_S_CLK_noedge_negedge, viol_0);
		$hold (negedge CLK, posedge R &&& (S == 0),
			tremoval_R_CLK_noedge_negedge, viol_0);
		$width (negedge CLK &&& cond3, tpw_CLK_cond3_negedge,
			0, viol_0);
		$width (posedge CLK &&& cond3, tpw_CLK_cond3_posedge,
			0, viol_0);
		$width (posedge S &&& (R == 1), tpw_S_R_EQ_1_posedge,
			0, viol_0);
		$width (negedge R &&& (S == 0), tpw_R_S_EQ_0_posedge,
			0, viol_0);
	endspecify
endmodule
`endcelldefine

//%END nck_sffsr

//%BEGIN tri01

`celldefine
module tri01 (A, E, Y);
	input A, E;
	output Y;

	wire int_res_0;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	// not (int_res_0, A);
	bufif1 (Y, A, E);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A_Y = 0.0;
		specparam tpd_E_Y_posedge = 0.0;

		(A => Y) = tpd_A_Y;
		(posedge E => (Y:1)) = tpd_E_Y_posedge;
	endspecify
endmodule
`endcelldefine

//%END tri01

//%BEGIN trib04

`celldefine
module trib04 (A, E, Y);
	input A, E;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	bufif1 (Y, A, E);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A_Y = 0.0;
		specparam tpd_E_Y_posedge = 0.0;

		(A => Y) = tpd_A_Y;
		(posedge E => (Y:1)) = tpd_E_Y_posedge;
	endspecify
endmodule
`endcelldefine

//%END trib04

//%BEGIN trib08

`celldefine
module trib08 (A, E, Y);
	input A, E;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	bufif1 (Y, A, E);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A_Y = 0.0;
		specparam tpd_E_Y_posedge = 0.0;

		(A => Y) = tpd_A_Y;
		(posedge E => (Y:1)) = tpd_E_Y_posedge;
	endspecify
endmodule
`endcelldefine

//%END trib08

//%BEGIN xnor2

`celldefine
module xnor2 (A0, A1, Y);
	input A0, A1;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	xnor (Y, A0, A1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
	endspecify
endmodule
`endcelldefine

//%END xnor2

//%BEGIN xnor2_2x

`celldefine
module xnor2_2x (A0, A1, Y);
	input A0, A1;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	xnor (Y, A0, A1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
	endspecify
endmodule
`endcelldefine

//%END xnor2_2x


//%BEGIN xor02

`celldefine
module xor02 (A0, A1, Y);
        input A0, A1;
        output Y;

        /////////////////////////////////////
        //          FUNCTIONALITY          //
        /////////////////////////////////////

        xor (Y, A0, A1);

        /////////////////////////////////////
        //             TIMING              //
        /////////////////////////////////////

        specify
                specparam tpd_A0_Y = 0.0;
                specparam tpd_A1_Y = 0.0;

                (A0 => Y) = tpd_A0_Y;
                (A1 => Y) = tpd_A1_Y;
        endspecify
endmodule
`endcelldefine

//%END xor02


//%BEGIN xor2_2x

`celldefine
module xor2_2x (A0, A1, Y);
	input A0, A1;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	xor (Y, A0, A1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
	endspecify
endmodule
`endcelldefine

//%END xor2_2x

/* COMMENT OUT enable LOW CLOCK GATERS below to run etlibgen */

`celldefine

module cgand0 ( GCK , FE , TE , CK ) ;
output GCK ;
input FE , TE , CK ;

wire FE ;
wire TE ;
wire CK, n0, n1 ;

 reg viol_0;
 nand ( n1 , TE , FE ) ;
 latch_n lat (n0, viol_0, CK, n1);
 and ( GCK , n0 , CK ) ;

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_CK_GCK_posedge = 0.0;
		specparam tpd_FE_GCK = 0.0;
		specparam tpd_TE_GCK = 0.0;
		specparam tpw_CK_posedge = 0.1;
		specparam tsetup_FE_CK_noedge_negedge = 0.1; //added
		specparam thold_FE_CK_noedge_negedge = 0.0;  //added
		specparam tsetup_TE_CK_noedge_negedge = 0.1; //added
		specparam thold_TE_CK_noedge_negedge = 0.0;  //added
	
		(posedge CK => (GCK+:FE)) = tpd_CK_GCK_posedge;
		(FE => GCK) = tpd_FE_GCK;

		$setup (posedge FE, negedge CK,                //begin added
			tsetup_FE_CK_noedge_negedge, viol_0);
		$setup (negedge FE, negedge CK,
			tsetup_FE_CK_noedge_negedge, viol_0);
		$hold (negedge CK, posedge FE,
			thold_FE_CK_noedge_negedge, viol_0);
		$hold (negedge CK, negedge FE,
			thold_FE_CK_noedge_negedge, viol_0);  
		$width (posedge CK, tpw_CK_posedge,
			0, viol_0);                            //end added
	
		(posedge CK => (GCK+:TE)) = tpd_CK_GCK_posedge;
		(TE => GCK) = tpd_TE_GCK;

		$setup (posedge TE, negedge CK,                //beg added
			tsetup_TE_CK_noedge_negedge, viol_0);
		$setup (negedge TE, negedge CK,
			tsetup_TE_CK_noedge_negedge, viol_0);
		$hold (negedge CK, posedge TE,
			thold_TE_CK_noedge_negedge, viol_0);
		$hold (negedge CK, negedge TE,
			thold_TE_CK_noedge_negedge, viol_0);  
		$width (posedge CK, tpw_CK_posedge,
			0, viol_0);                            //end added
	

	endspecify

endmodule //cgand

`endcelldefine

`celldefine

module cgor0 ( GCK , FE , TE , CK ) ;
output GCK ;
input FE , TE , CK ;

reg viol_0;
wire FE ;
wire TE ;
wire CK, n0, n1 ;

 and ( n1 , TE , FE ) ;
 latch_p lat (n0, viol_0, CK, n1);
 or ( GCK , n0 , CK ) ;

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_CK_GCK_negedge = 0.0;
		specparam tpd_FE_GCK = 0.0;
		specparam tpd_TE_GCK = 0.0;
		specparam tpw_CK_negedge = 0.1;
		specparam tsetup_FE_CK_noedge_posedge = 0.1; //added
		specparam thold_FE_CK_noedge_posedge = 0.0;  //added
		specparam tsetup_TE_CK_noedge_posedge = 0.1; //added
		specparam thold_TE_CK_noedge_posedge = 0.0;  //added
	
		(negedge CK => (GCK+:FE)) = tpd_CK_GCK_negedge;
		(FE => GCK) = tpd_FE_GCK;

		$setup (negedge FE, negedge CK,                //begin added
			tsetup_FE_CK_noedge_posedge, viol_0);
		$setup (posedge FE, negedge CK,
			tsetup_FE_CK_noedge_posedge, viol_0);
		$hold (posedge CK, posedge FE,
			thold_FE_CK_noedge_posedge, viol_0);
		$hold (posedge CK, posedge FE,
			thold_FE_CK_noedge_posedge, viol_0);  
		$width (negedge CK, tpw_CK_negedge,
			0, viol_0);                            //end added
	
		(negedge CK => (GCK+:TE)) = tpd_CK_GCK_negedge;
		(TE => GCK) = tpd_TE_GCK;

		$setup (posedge TE, posedge CK,                //beg added
			tsetup_TE_CK_noedge_posedge, viol_0);
		$setup (negedge TE, posedge CK,
			tsetup_TE_CK_noedge_posedge, viol_0);
		$hold (posedge CK, posedge TE,
			thold_TE_CK_noedge_posedge, viol_0);
		$hold (posedge CK, negedge TE,
			thold_TE_CK_noedge_posedge, viol_0);  
		$width (posedge CK, tpw_CK_negedge,
			0, viol_0);                            //end added
	

	endspecify

endmodule //cgor

`endcelldefine

/* END COMMENT OUT enable low clock gaters above to run etlibgen */


`celldefine

module cgand ( GCK , FE , TE , CK ) ;
output GCK ;
input FE , TE , CK ;

wire FE ;
wire TE ;
wire CK, n0, n1 ;

 reg viol_0;
 or ( n1 , TE , FE ) ;
 latch_n lat (n0, viol_0, CK, n1);
 and ( GCK , n0 , CK ) ;

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_CK_GCK_posedge = 0.0;
		specparam tpd_FE_GCK = 0.0;
		specparam tpd_TE_GCK = 0.0;
		specparam tpw_CK_posedge = 0.1;
		specparam tsetup_FE_CK_noedge_negedge = 0.1; //added
		specparam thold_FE_CK_noedge_negedge = 0.0;  //added
		specparam tsetup_TE_CK_noedge_negedge = 0.1; //added
		specparam thold_TE_CK_noedge_negedge = 0.0;  //added
	
		(posedge CK => (GCK+:FE)) = tpd_CK_GCK_posedge;
		(FE => GCK) = tpd_FE_GCK;

		$setup (posedge FE, negedge CK,                //begin added
			tsetup_FE_CK_noedge_negedge, viol_0);
		$setup (negedge FE, negedge CK,
			tsetup_FE_CK_noedge_negedge, viol_0);
		$hold (negedge CK, posedge FE,
			thold_FE_CK_noedge_negedge, viol_0);
		$hold (negedge CK, negedge FE,
			thold_FE_CK_noedge_negedge, viol_0);  
		$width (posedge CK, tpw_CK_posedge,
			0, viol_0);                            //end added
	
		(posedge CK => (GCK+:TE)) = tpd_CK_GCK_posedge;
		(TE => GCK) = tpd_TE_GCK;

		$setup (posedge TE, negedge CK,                //beg added
			tsetup_TE_CK_noedge_negedge, viol_0);
		$setup (negedge TE, negedge CK,
			tsetup_TE_CK_noedge_negedge, viol_0);
		$hold (negedge CK, posedge TE,
			thold_TE_CK_noedge_negedge, viol_0);
		$hold (negedge CK, negedge TE,
			thold_TE_CK_noedge_negedge, viol_0);  
		$width (posedge CK, tpw_CK_posedge,
			0, viol_0);                            //end added
	

	endspecify

endmodule //cgand

`endcelldefine

`celldefine

module cgor ( GCK , FE , TE , CK ) ;
output GCK ;
input FE , TE , CK ;

reg viol_0;
wire FE ;
wire TE ;
wire CK, n0, n1 ;

 nor ( n1 , TE , FE ) ;
 latch_p lat (n0, viol_0, CK, n1);
 or ( GCK , n0 , CK ) ;

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_CK_GCK_negedge = 0.0;
		specparam tpd_FE_GCK = 0.0;
		specparam tpd_TE_GCK = 0.0;
		specparam tpw_CK_negedge = 0.1;
		specparam tsetup_FE_CK_noedge_posedge = 0.1; //added
		specparam thold_FE_CK_noedge_posedge = 0.0;  //added
		specparam tsetup_TE_CK_noedge_posedge = 0.1; //added
		specparam thold_TE_CK_noedge_posedge = 0.0;  //added
	
		(negedge CK => (GCK+:FE)) = tpd_CK_GCK_negedge;
		(FE => GCK) = tpd_FE_GCK;

		$setup (negedge FE, negedge CK,                //begin added
			tsetup_FE_CK_noedge_posedge, viol_0);
		$setup (posedge FE, negedge CK,
			tsetup_FE_CK_noedge_posedge, viol_0);
		$hold (posedge CK, posedge FE,
			thold_FE_CK_noedge_posedge, viol_0);
		$hold (posedge CK, posedge FE,
			thold_FE_CK_noedge_posedge, viol_0);  
		$width (negedge CK, tpw_CK_negedge,
			0, viol_0);                            //end added
	
		(negedge CK => (GCK+:TE)) = tpd_CK_GCK_negedge;
		(TE => GCK) = tpd_TE_GCK;

		$setup (posedge TE, posedge CK,                //beg added
			tsetup_TE_CK_noedge_posedge, viol_0);
		$setup (negedge TE, posedge CK,
			tsetup_TE_CK_noedge_posedge, viol_0);
		$hold (posedge CK, posedge TE,
			thold_TE_CK_noedge_posedge, viol_0);
		$hold (posedge CK, negedge TE,
			thold_TE_CK_noedge_posedge, viol_0);  
		$width (posedge CK, tpw_CK_negedge,
			0, viol_0);                            //end added
	

	endspecify

endmodule //cgor

`endcelldefine

  
`celldefine
module VCC (Y);
output Y;
 supply1 Y;
  endmodule
`endcelldefine

`celldefine
module GND (Y);
output Y;
 supply0 Y;
  endmodule
`endcelldefine

`celldefine
/* Need to add timing */

module iopad (OEN,PAD,I,C);
input OEN,I;
output C;
inout PAD;

        ipad iopad_ipad_inst (.PAD(PAD),.C(C));
        opad iopad_opad_inst (.I(I),.PAD(PAD),.OEN(OEN));

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////
`ifndef USE_FPGA_CELLS
	specify
		specparam tpd_I_PAD = 0.0;
		specparam tpd_PAD_C = 0.0;
		specparam tpd_OEN_PAD_posedge = 0.0;
		specparam tpd_PAD_C_posedge = 0.0;

		(I => PAD) = tpd_I_PAD;
		(posedge OEN => (PAD:1)) = tpd_OEN_PAD_posedge;

		(PAD => C) = tpd_PAD_C;
		(posedge PAD => (C:1)) = tpd_PAD_C_posedge;

	endspecify
`endif
endmodule
`endcelldefine

`celldefine
/* Need to add timing */

module iopad_pull0_io (OEN,PAD,I,C);
input OEN,I;
output C;
inout PAD;
pulldown (weak0) (PAD);

        ipad iopad_ipad_inst (.PAD(PAD),.C(C));
        opad iopad_opad_inst (.I(I),.PAD(PAD),.OEN(OEN));

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////
`ifndef USE_FPGA_CELLS
	specify
		specparam tpd_I_PAD = 0.0;
		specparam tpd_PAD_C = 0.0;
		specparam tpd_OEN_PAD_posedge = 0.0;
		specparam tpd_PAD_C_posedge = 0.0;

		(I => PAD) = tpd_I_PAD;
		(posedge OEN => (PAD:1)) = tpd_OEN_PAD_posedge;

		(PAD => C) = tpd_PAD_C;
		(posedge PAD => (C:1)) = tpd_PAD_C_posedge;

	endspecify
`endif
endmodule
`endcelldefine
`celldefine
/* Need to add timing */

module ipad(PAD,C);
        input PAD;
        output C;
`ifdef USE_FPGA_CELLS
  `ifdef USE_XILINX_CELLS
IBUF #(.IBUF_LOW_PWR ("FALSE"), .IOSTANDARD ("DEFAULT")) in_buf (
  .O            ( C     ),
  .I            ( PAD     )
);
  `endif
  `ifdef USE_ALTERA_CELLS
  `endif
`else

    buf02 ipad_inst (.A(PAD),.Y(C));

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_PAD_C = 0.0;

		(PAD => C) = tpd_PAD_C;
	endspecify
`endif
endmodule
`endcelldefine

`celldefine

module opad(I,OEN,PAD);
        input I,OEN;
        output PAD;
`ifdef USE_FPGA_CELLS
  `ifdef USE_XILINX_CELLS
OBUFT #(.DRIVE (12), .IOSTANDARD ("DEFAULT"), .SLEW ("FAST")) out_buf (
  .O ( PAD ),
  .I ( I ),
  .T ( ~OEN )
);
  `endif
  `ifdef USE_ALTERA_CELLS
  `endif
`else

        tri01 opad_inst (.A(I),.E(OEN),.Y(PAD));

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_I_PAD = 0.0;
		specparam tpd__OEN_PAD_posedge = 0.0;

		(I => PAD) = tpd_I_PAD;
		(posedge OEN => (PAD:1)) = tpd__OEN_PAD_posedge;
	endspecify
`endif
endmodule
`endcelldefine

`celldefine

module opad_and(I,OEN,PAD);
        input I,OEN;
        output PAD;
        and02 opad_inst (.A0(I),.A1(OEN),.Y(PAD));

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_I_PAD = 0.0;
		specparam tpd__OEN_PAD_posedge = 0.0;

		(I => PAD) = tpd_I_PAD;
		(posedge OEN => (PAD:1)) = tpd__OEN_PAD_posedge;
	endspecify
endmodule
`endcelldefine


`celldefine

module ipad_buf(PAD,C);
        input PAD;
        output C;
        buf02 ipad_buf_inst (.A(PAD),.Y(C));

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_PAD_C = 0.0;

		(PAD => C) = tpd_PAD_C;
	endspecify
endmodule
`endcelldefine


`celldefine

module sync_cell ( CK, D, O );
  input CK, D;
  output O;

  wire n2;

  dff sync_1 (.D(D), .CLK(CK), .Q(n2), .QB());
  dff sync_2 (.D(n2), .CLK(CK), .Q(O), .QB());

endmodule

`endcelldefine

`celldefine

module scan_sync_cell ( CK, D, SI, SE, O );
  input CK, D, SI, SE;
  output O;

  wire n1, n2;

  mux21 u0 (.A0(D), .A1(SI), .S0(SE), .Y(n1));
  dff sync_1 (.D(n1), .CLK(CK), .Q(n2), .QB());
  dff sync_2 (.D(n2), .CLK(CK), .Q(O), .QB());

endmodule

`endcelldefine

`celldefine

module sync_cell_rst ( CK, D, R, O );
  input CK, D, R;
  output O;

  wire n2;

  dffr sync_1 (.D(D),  .CLK(CK), .R(R), .Q(n2), .QB());
  dffr sync_2 (.D(n2), .CLK(CK), .R(R), .Q(O),  .QB());

endmodule

`endcelldefine

`celldefine

module scan_sync_cell_rst ( CK, D, R, SI, SE, O );
  input CK, D, R, SI, SE;
  output O;

  wire n1, n2;

  mux21 u0 (.A0(D), .A1(SI), .S0(SE), .Y(n1));
  dffr sync_1 (.D(n1), .CLK(CK), .R(R), .Q(n2), .QB());
  dffr sync_2 (.D(n2), .CLK(CK), .R(R), .Q(O),  .QB());

endmodule

`endcelldefine

`celldefine

module sync_cell_set ( CK, D, S, O );
  input CK, D, S;
  output O;

  wire n2;

  dffs sync_1 (.D(D),  .CLK(CK), .S(S), .Q(n2), .QB());
  dffs sync_2 (.D(n2), .CLK(CK), .S(S), .Q(O),  .QB());

endmodule

`endcelldefine

`celldefine

module scan_sync_cell_set ( CK, D, S, SI, SE, O );
  input CK, D, S, SI, SE;
  output O;

  wire n1, n2;

  mux21 u0 (.A0(D), .A1(SI), .S0(SE), .Y(n1));
  dffs sync_1 (.D(n1), .CLK(CK), .S(S), .Q(n2), .QB());
  dffs sync_2 (.D(n2), .CLK(CK), .S(S), .Q(O),  .QB());

endmodule

`endcelldefine


`celldefine

module sync_cell_set_rst ( CK, D, S, R, O );
  input CK, D, S, R;
  output O;

  wire n2;

  dffsr sync_1 (.D(D),  .CLK(CK), .S(S), .R(R), .Q(n2), .QB());
  dffsr sync_2 (.D(n2), .CLK(CK), .S(S), .R(R), .Q(O),  .QB());

endmodule

`endcelldefine

`celldefine

module scan_sync_cell_set_rst ( CK, D, S, R, SI, SE, O );
  input CK, D, S, R, SI, SE;
  output O;

  wire n1, n2;

  mux21 u0 (.A0(D), .A1(SI), .S0(SE), .Y(n1));
  dffsr sync_1 (.D(n1), .CLK(CK), .S(S), .R(R), .Q(n2), .QB());
  dffsr sync_2 (.D(n2), .CLK(CK), .S(S), .R(R), .Q(O),  .QB());

endmodule

`endcelldefine


`celldefine

module nck_sync_cell ( CKB, D, O );
  input CKB, D;
  output O;

  wire n2;

  nck_dff sync_1 (.D(D), .CLK(CKB), .Q(n2), .QB());
  nck_dff sync_2 (.D(n2), .CLK(CKB), .Q(O), .QB());

endmodule

`endcelldefine

`celldefine

module nck_scan_sync_cell ( CKB, D, SI, SE, O );
  input CKB, D, SI, SE;
  output O;

  wire n1, n2;

  mux21 u0 (.A0(D), .A1(SI), .S0(SE), .Y(n1));
  nck_dff sync_1 (.D(n1), .CLK(CKB), .Q(n2), .QB());
  nck_dff sync_2 (.D(n2), .CLK(CKB), .Q(O), .QB());

endmodule

`endcelldefine

`celldefine

module nck_sync_cell_rst ( CKB, D, R, O );
  input CKB, D, R;
  output O;

  wire n2;

  nck_dffr sync_1 (.D(D),  .CLK(CKB), .R(R), .Q(n2), .QB());
  nck_dffr sync_2 (.D(n2), .CLK(CKB), .R(R), .Q(O),  .QB());

endmodule

`endcelldefine

`celldefine

module nck_scan_sync_cell_rst ( CKB, D, R, SI, SE, O );
  input CKB, D, R, SI, SE;
  output O;

  wire n1, n2;

  mux21 u0 (.A0(D), .A1(SI), .S0(SE), .Y(n1));
  nck_dffr sync_1 (.D(n1), .CLK(CKB), .R(R), .Q(n2), .QB());
  nck_dffr sync_2 (.D(n2), .CLK(CKB), .R(R), .Q(O),  .QB());

endmodule

`endcelldefine

`celldefine

module nck_sync_cell_set ( CKB, D, S, O );
  input CKB, D, S;
  output O;

  wire n2;

  nck_dffs sync_1 (.D(D),  .CLK(CKB), .S(S), .Q(n2), .QB());
  nck_dffs sync_2 (.D(n2), .CLK(CKB), .S(S), .Q(O),  .QB());

endmodule

`endcelldefine

`celldefine

module nck_scan_sync_cell_set ( CKB, D, S, SI, SE, O );
  input CKB, D, S, SI, SE;
  output O;

  wire n1, n2;

  mux21 u0 (.A0(D), .A1(SI), .S0(SE), .Y(n1));
  nck_dffs sync_1 (.D(n1), .CLK(CKB), .S(S), .Q(n2), .QB());
  nck_dffs sync_2 (.D(n2), .CLK(CKB), .S(S), .Q(O),  .QB());

endmodule

`endcelldefine


`celldefine

module nck_sync_cell_set_rst ( CKB, D, S, R, O );
  input CKB, D, S, R;
  output O;

  wire n2;

  nck_dffsr sync_1 (.D(D),  .CLK(CKB), .S(S), .R(R), .Q(n2), .QB());
  nck_dffsr sync_2 (.D(n2), .CLK(CKB), .S(S), .R(R), .Q(O),  .QB());

endmodule

`endcelldefine

`celldefine

module nck_scan_sync_cell_set_rst ( CKB, D, S, R, SI, SE, O );
  input CKB, D, S, R, SI, SE;
  output O;

  wire n1, n2;

  mux21 u0 (.A0(D), .A1(SI), .S0(SE), .Y(n1));
  nck_dffsr sync_1 (.D(n1), .CLK(CKB), .S(S), .R(R), .Q(n2), .QB());
  nck_dffsr sync_2 (.D(n2), .CLK(CKB), .S(S), .R(R), .Q(O),  .QB());

endmodule

`endcelldefine

//%BEGIN clock_buf02

`celldefine
module clock_buf02 (A, Y);
	input A;
	output Y;
`ifdef USE_FPGA_CELLS
  `ifdef USE_XILINX_CELLS
  BUFG clock_buf (
    .I            ( A       ),
    .O            ( Y       )
);

  `endif
  `ifdef USE_ALTERA_CELLS
  `endif
`else
	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	buf (Y, A);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A_Y = 0.0;

		(A => Y) = tpd_A_Y;
	endspecify
`endif
endmodule
`endcelldefine

//%END clock_buf02


//%BEGIN clock_inv01

`celldefine
module clock_inv01 (A, Y);
	input A;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	not (Y, A);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A_Y = 0.0;

		(A => Y) = tpd_A_Y;
	endspecify
endmodule
`endcelldefine

//%END clock_inv01


//%BEGIN clock_mux21

`celldefine
module clock_mux21 (A0, A1, S0, Y);
	input A0, A1, S0;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	mux2 mux (Y, A1, A0, S0);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_S0_Y = 0.0;
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;

		(S0 => Y) = tpd_S0_Y;
		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
	endspecify
endmodule
`endcelldefine

//%END clock_mux21


//%BEGIN clock_and02

`celldefine
module clock_and02 (A0, A1, Y);
	input A0, A1;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	and (Y, A0, A1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
	endspecify
endmodule
`endcelldefine

//%END clock_and02


//%BEGIN clock_or02

`celldefine
module clock_or02 (A0, A1, Y);
	input A0, A1;
	output Y;

	/////////////////////////////////////
	//          FUNCTIONALITY          //
	/////////////////////////////////////

	or (Y, A0, A1);

	/////////////////////////////////////
	//             TIMING              //
	/////////////////////////////////////

	specify
		specparam tpd_A0_Y = 0.0;
		specparam tpd_A1_Y = 0.0;

		(A0 => Y) = tpd_A0_Y;
		(A1 => Y) = tpd_A1_Y;
	endspecify
endmodule
`endcelldefine

//%END clock_or02

