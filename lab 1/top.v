module top (
    input clk,
    input reset,
    input start,
    input [3:0] multiplicand_in,
    input [3:0] multiplier_in,
    
    output mult_complete,
    output [7:0] accumulated_prod
);

    // Internal Wires connecting Controller and Datapath
    wire load_inputs;
    wire clear_prod;
    wire enable_prod;
    wire enable_cnt_dec;
    wire loops_zero_flag;

    // Instantiation for the controller
    // EC23I2015
    controller u_controller (
        .clk             (clk),
        .reset           (reset),
        .start           (start),
        .loops_zero_flag (loops_zero_flag),
        .load_inputs     (load_inputs),
        .clear_prod      (clear_prod),
        .enable_prod     (enable_prod),
        .enable_cnt_dec  (enable_cnt_dec),
        .mult_complete   (mult_complete)
    );

    // Instantiation for the datapath
    datapath u_datapath (
        .clk              (clk),
        .multiplicand_in   (multiplicand_in),
        .multiplier_in     (multiplier_in),
        .load_inputs      (load_inputs),
        .clear_prod       (clear_prod),
        .enable_prod      (enable_prod),
        .enable_cnt_dec   (enable_cnt_dec),
        .loops_zero_flag  (loops_zero_flag),
        .accumulated_prod (accumulated_prod)
    );

endmodule
