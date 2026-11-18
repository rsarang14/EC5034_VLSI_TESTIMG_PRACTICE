// SYNC 1RW Memory
// Configured as 8Kx16 for hierarchical test case 
// Mentor Graphics
// =====================================
`timescale 1ns / 10ps

`celldefine
module rom_512x16A (
   Q,
   CLK,
   CEN,
   A
);
   parameter		   BITS = 16;
   parameter		   word_depth = 512;
   //parameter		   addr_width = 9;
   parameter		   wordz = {BITS{1'bz}};
   parameter		   wordx = {BITS{1'bx}};

   output [15:0] Q;
   input CLK;
   input CEN;
   input [8:0] A;

   reg [15:0]	   MEM [word_depth-1:0];
   reg [15:0]	   Q_REG;

assign Q =  Q_REG ;
initial begin $readmemh("romcontent.cfg",MEM);
$display("ROM0 %h",MEM[0]);
$display("ROM3 %h",MEM[3]);
end

always @ (posedge CLK) begin
   if (~CEN) begin
         Q_REG  <= MEM[A];
      end
end
endmodule
`endcelldefine
