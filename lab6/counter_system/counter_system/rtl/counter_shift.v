// =============================================
// File: counter_shift.v
// Description: Counter with parallel/serial interface
// Combines updown_counter and shift_register
// =============================================

module counter_shift #(
    parameter COUNTER_WIDTH = 16
) (
    input wire clk,
    input wire reset_n,
    input wire load,
    input wire [COUNTER_WIDTH-1:0] load_val,
    input wire up_down,
    input wire enable,
    input wire shift_en,
    input wire shift_in,
    output wire [COUNTER_WIDTH-1:0] count,
    output wire shift_out,
    output wire shift_done
);

    wire [COUNTER_WIDTH-1:0] counter_val;
    
    // Instantiate the up/down counter
    updown_counter #(
        .WIDTH(COUNTER_WIDTH)
    ) u_counter (
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .load_val(load_val),
        .up_down(up_down),
        .enable(enable && !shift_en), // Disable counting during shifts
        .count(counter_val)
    );
    
    // Instantiate the shift register
    shift_register #(
        .WIDTH(COUNTER_WIDTH)
    ) u_shift_reg (
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .load_val(load ? load_val : counter_val),
        .shift_en(shift_en),
        .shift_in(shift_in),
        .par_out(count),
        .shift_out(shift_out),
        .shift_done(shift_done)
    );

endmodule// =============================================
// File: counter_shift.v
// Description: Counter with parallel/serial interface
// Combines updown_counter and shift_register
// =============================================

module counter_shift #(
    parameter COUNTER_WIDTH = 16
) (
    input wire clk,
    input wire reset_n,
    input wire load,
    input wire [COUNTER_WIDTH-1:0] load_val,
    input wire up_down,
    input wire enable,
    input wire shift_en,
    input wire shift_in,
    output wire [COUNTER_WIDTH-1:0] count,
    output wire shift_out,
    output wire shift_done
);

    wire [COUNTER_WIDTH-1:0] counter_val;
    
    // Instantiate the up/down counter
    updown_counter #(
        .WIDTH(COUNTER_WIDTH)
    ) u_counter (
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .load_val(load_val),
        .up_down(up_down),
        .enable(enable && !shift_en), // Disable counting during shifts
        .count(counter_val)
    );
    
    // Instantiate the shift register
    shift_register #(
        .WIDTH(COUNTER_WIDTH)
    ) u_shift_reg (
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .load_val(load ? load_val : counter_val),
        .shift_en(shift_en),
        .shift_in(shift_in),
        .par_out(count),
        .shift_out(shift_out),
        .shift_done(shift_done)
    );

endmodule
