// =============================================
// File: lfsr.v
// Description: Standalone Linear Feedback Shift Register
// Width: 8-bit (configurable)
// Polynomial: x^8 + x^6 + x^5 + x^4 + 1
// Features:
//   - Configurable seed value
//   - Pseudo-random output sequence
//   - Trigger output at specific pattern
// =============================================

module lfsr (
    input wire clk,            // System clock
    input wire reset_n,        // Active-low reset
    input wire enable,         // Enable advancement
    input wire [7:0] seed,     // Initial seed value
    output reg [7:0] value,    // Current LFSR value
    output wire trigger        // Trigger when pattern matches
);

    // Feedback polynomial: x^8 + x^6 + x^5 + x^4 + 1
    wire feedback = value[7] ^ value[5] ^ value[4] ^ value[3];
    
    // LFSR update logic
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            value <= seed; // Initialize with seed
        end else if (enable) begin
            value <= {value[6:0], feedback};
        end
    end
    
    // Trigger when LFSR reaches specific pattern (0x55)
    assign trigger = (value == 8'h55);

endmodule
