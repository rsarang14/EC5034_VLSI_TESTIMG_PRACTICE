// SYNC 1RW Memory
// Configured as 8Kx16 for hierarchical test case 
// Mentor Graphics
// =====================================
`timescale 1ns / 10ps

`celldefine
module SYNC_1RW_64Kx8 (
   Q,
   CLK,
   CEN,
   WEN,
   A,
   D,
   OEN
);
   parameter		   BITS = 8;
   parameter		   word_depth = 65536;
   //parameter		   addr_width = 16;
   parameter		   wordz = {BITS{1'bz}};
   parameter		   wordx = {BITS{1'bx}};

   output [7:0] Q;
   input CLK;
   input CEN;
   input WEN;
   input [15:0] A;
   input [7:0] D;
   input OEN;

   reg [7:0]	   MEM [word_depth-1:0];
   reg [7:0]	   Q_REG;

assign Q = (~OEN) ? Q_REG : wordz ;

always @ (posedge CLK) begin
   if (~CEN) begin
      if (~WEN) begin
         MEM[A] <= D;
         Q_REG  <= D;
      end else begin
         Q_REG  <= MEM[A];
      end
   end
end
endmodule
`endcelldefine
