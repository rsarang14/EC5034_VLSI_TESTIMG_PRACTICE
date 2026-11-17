// =============================================
// File: shift_register.v
// Description: Parallel load/serial shift register
// Features:
//   - Parameterized width
//   - Parallel load
//   - Serial shift (MSB first)
//   - Serial input/output
//   - Shift position tracking
// =============================================

module shift_register #(
    parameter WIDTH = 16       // Default 16-bit width
) (
    input wire clk,            // System clock
    input wire reset_n,        // Active-low reset
    input wire load,           // Parallel load enable
    input wire [WIDTH-1:0] load_val, // Parallel load value
    input wire shift_en,       // Shift enable
    input wire shift_in,       // Serial input
    output wire [WIDTH-1:0] par_out, // Parallel output
    output wire shift_out,     // Serial output
    output wire shift_done     // Shift complete flag
);

    reg [WIDTH-1:0] data;      // Main data register
    reg [$clog2(WIDTH)-1:0] pos; // Current shift position
    
    // Continuous outputs
    assign par_out = data;
    assign shift_out = data[WIDTH-1-pos];
    assign shift_done = (pos == WIDTH-1) && shift_en;
    
    // Main register logic
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            data <= {WIDTH{1'b0}};
            pos <= 0;
        end else if (load) begin
            data <= load_val;  // Parallel load
            pos <= 0;          // Reset shift position
        end else if (shift_en) begin
            data <= {data[WIDTH-2:0], shift_in}; // Shift left
            pos <= (pos == WIDTH-1) ? 0 : pos + 1;
        end
    end

endmodule
