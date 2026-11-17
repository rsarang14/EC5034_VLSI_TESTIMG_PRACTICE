// =============================================
// File: counter_lfsr.v
// Description: Up/down counter with LFSR trigger
// Combines updown_counter and lfsr modules
// =============================================

module counter_lfsr #(
    parameter COUNTER_WIDTH = 8
) (
    input wire clk,
    input wire reset_n,
    input wire load,
    input wire [COUNTER_WIDTH-1:0] load_val,
    input wire up_down,
    input wire enable,
    output wire [COUNTER_WIDTH-1:0] count,
    output wire trigger
);

    // Instantiate the up/down counter
    updown_counter #(
        .WIDTH(COUNTER_WIDTH)
    ) u_counter (
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .load_val(load_val),
        .up_down(up_down),
        .enable(enable),
        .count(count)
    );
    
    // Instantiate the LFSR
    lfsr u_lfsr (
        .clk(clk),
        .reset_n(reset_n),
        .enable(enable),
        .seed(8'hF1),         // Fixed seed value
        .value(),             // Internal signal
        .trigger(trigger)
    );

endmodule
