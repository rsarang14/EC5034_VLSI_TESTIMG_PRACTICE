// =============================================
// File: counter_system.v
// Description: Top level connecting all components
// =============================================

module counter_system (
    input wire clk,
    input wire reset_n,
    // Counter 1 (LFSR) interface
    input wire load1,
    input wire [7:0] load_val1,
    input wire up_down1,
    input wire enable1,
    output wire [7:0] count1,
    // Counter 2 (Shift) interface
    input wire load2,
    input wire [15:0] load_val2,
    input wire up_down2,
    input wire enable2,
    input wire shift_en,
    input wire shift_in,
    output wire [15:0] count2,
    output wire shift_out,
    output wire shift_done,
    output [15:0] count2out,
    output [7:0] count1out,
    // Interconnect
    output wire lfsr_trigger
);

    // Instantiate LFSR counter (8-bit)
    counter_lfsr #(
        .COUNTER_WIDTH(8)
    ) u_counter_lfsr (
        .clk(clk),
        .reset_n(reset_n),
        .load(load1),
        .load_val(load_val1),
        .up_down(up_down1),
        .enable(enable1),
        .count(count1),
        .trigger(lfsr_trigger)
    );
 SYNC_1RW_256x16 u1(
   .Q(count2out),
   .CLK(clk),
   .CEN(1'b0),
   .WEN(load1),
   .A(count1),
   .D(count2),
   .OEN(1'b0)
);
    
    // Instantiate Shift counter (16-bit)
    counter_shift #(
        .COUNTER_WIDTH(16)
    ) u_counter_shift (
        .clk(clk),
        .reset_n(reset_n),
        .load(load2),
        .load_val(load_val2),
        .up_down(up_down2),
        .enable(enable2 || lfsr_trigger), // Can be triggered by LFSR
        .shift_en(shift_en),
        .shift_in(shift_in),
        .count(count2),
        .shift_out(shift_out),
        .shift_done(shift_done)
    );
 SYNC_1RW_64Kx8 u2(
   .Q(count1out),
   .CLK(clk),
   .CEN(1'b0),
   .WEN(load2),
   .A(count2),
   .D(count1),
   .OEN(1'b0) 
); 

endmodule
