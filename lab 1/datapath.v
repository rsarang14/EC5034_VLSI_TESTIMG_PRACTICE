module datapath (
    input clk,
    
    // Inputs
    input [3:0] multiplicand_in,
    input [3:0] multiplier_in,
    
    // Control Signals
    input load_inputs,
    input clear_prod,
    input enable_prod,
    input enable_cnt_dec,
    
    // Status Signal
    output loops_zero_flag,
    
    // Data Output
    output reg [7:0] accumulated_prod
);

    // Internal Registers
    reg [3:0] working_multiplicand;
    reg [3:0] loop_counter;
    
    always @(posedge clk) begin
        if (clear_prod == 1'b1) begin
            accumulated_prod <= 8'd0;
        end
        else if (enable_prod == 1'b1) begin
            accumulated_prod <= accumulated_prod + working_multiplicand;
        end
    end

    always @(posedge clk) begin
        if (load_inputs == 1'b1) begin
            working_multiplicand <= multiplicand_in;
        end
    end
 
    always @(posedge clk) begin
        if (load_inputs == 1'b1) begin
            loop_counter <= multiplier_in;
        end
        else if (enable_cnt_dec == 1'b1) begin
            loop_counter <= loop_counter - 1; 
        end
    end

    
    assign loops_zero_flag = (loop_counter == 4'd0);

endmodule
