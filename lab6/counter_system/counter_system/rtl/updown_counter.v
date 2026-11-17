// =============================================
// File: updown_counter.v
// Description: Configurable width up/down counter
// Features:
//   - Parameterized width
//   - Synchronous load
//   - Up/down count control
//   - Count enable
// =============================================

module updown_counter #(
    parameter WIDTH = 8        // Default 8-bit width
) (
    input wire clk,            // System clock
    input wire reset_n,        // Active-low reset
    input wire load,           // Load enable
    input wire [WIDTH-1:0] load_val, // Load value
    input wire up_down,        // 1=up, 0=down
    input wire enable,         // Count enable
    output reg [WIDTH-1:0] count // Counter output
);

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            count <= {WIDTH{1'b0}}; // Reset to zero
        end else if (load) begin
            count <= load_val;      // Synchronous load
        end else if (enable) begin
            if (up_down) begin
                count <= count + 1;  // Count up
            end else begin
                count <= count - 1;  // Count down
            end
        end
    end

endmodule
