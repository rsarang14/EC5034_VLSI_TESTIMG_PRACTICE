module pllclk(refclk, vcop, vcom, clk1x, clk2x,reset,ibias);
    input  refclk;
    output vcop;
    output vcom;
    output clk1x;
    output clk2x;
   input reset,ibias;
reg clk2x;

initial clk2x = 0;

always @(posedge refclk)
  clk2x <= ~clk2x;
assign clk1x = refclk;
//assign clk2x = refclk;
endmodule

