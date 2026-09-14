module datapath (
    input clk,
    
    // Data Inputs
    input [3:0] multiplicand_in,
    input [3:0] multiplier_in,
    
    // Control Signals (from FSM)
    input load_inputs,
    input clear_prod,
    input enable_prod,
    input enable_cnt_dec,
    
    // Status Signal (to FSM)
    output loops_zero_flag,
    
    // Data Output
    output reg [7:0] accumulated_prod
);

    // Internal Registers
    reg [3:0] working_multiplicand;
    reg [3:0] loop_counter;
    
    // -----------------------------------------------------------------
    // 1. Accumulated Product Register (8-bit)
    // -----------------------------------------------------------------
    always @(posedge clk) begin
        if (clear_prod == 1'b1) begin
            accumulated_prod <= 8'd0;
        end
        else if (enable_prod == 1'b1) begin
            accumulated_prod <= accumulated_prod + working_multiplicand;
        end
    end

    // -----------------------------------------------------------------
    // 2. Working Multiplicand Register (4-bit)
    // -----------------------------------------------------------------
    always @(posedge clk) begin
        if (load_inputs == 1'b1) begin
            working_multiplicand <= multiplicand_in;
        end
    end

    // -----------------------------------------------------------------
    // 3. Loop Counter (4-bit Down-Counter)
    // -----------------------------------------------------------------
    always @(posedge clk) begin
        if (load_inputs == 1'b1) begin
            loop_counter <= multiplier_in;
        end
        else if (enable_cnt_dec == 1'b1) begin
            loop_counter <= loop_counter - 1; // Or loop_counter - 4'd1
        end
    end

    // -----------------------------------------------------------------
    // 4. Zero Detector (Combinational)
    // -----------------------------------------------------------------
    assign loops_zero_flag = (loop_counter == 4'd0);

endmodule
