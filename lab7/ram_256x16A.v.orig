// SYNC 1RW Memory
// Configured as 8Kx16 for hierarchical test case 
// Mentor Graphics
// =====================================
`timescale 1ns / 10ps

`celldefine
module ram_256x16A (
   Q,
   CLK,
   CEN,
   WEN,
   A,
   D
);
   parameter		   BITS = 16;
   parameter		   word_depth = 256;
   //parameter		   addr_width = 8;
   parameter		   wordz = {BITS{1'bz}};
   parameter		   wordx = {BITS{1'bx}};

   output [15:0] Q;
   input CLK;
   input CEN;
   input WEN;
   input [7:0] A;
   input [15:0] D;

   reg [15:0]	   MEM [word_depth-1:0];
   reg [15:0]	   Q_REG;

assign Q =  Q_REG ;

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
