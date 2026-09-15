`timescale 1ns / 1ps

module tb_top;

    // Inputs
    reg clk;
    reg reset;
    reg start;
    reg [3:0] multiplicand_in;
    reg [3:0] multiplier_in;

    // Out
    wire mult_complete;
    wire [7:0] accumulated_prod;

    // Instantiation
    top uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .multiplicand_in(multiplicand_in),
        .multiplier_in(multiplier_in),
        .mult_complete(mult_complete),
        .accumulated_prod(accumulated_prod)
    );

    // Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns Clock Period
    end

    // Test variables
    integer cycle_count;
    integer expected_product;
    integer expected_cycles;

    // Synchronous
    task run_test(input [3:0] A, input [3:0] B);
        begin
            // Set inputs on falling edge of clock
            @(negedge clk);
            multiplicand_in = A;
            multiplier_in   = B;
            expected_product = A * B;
            expected_cycles  = B + 2;
            cycle_count      = 0;
            start = 1'b1;

            @(negedge clk);
            start = 1'b0;

            while (!mult_complete) begin
                @(negedge clk);
                cycle_count = cycle_count + 1;
            end

            $write("Test: %2d x %2d | Exp Prod: %3d, Act Prod: %3d | Exp Cycles: %2d, Act Cycles: %2d | ",
                   A, B, expected_product, accumulated_prod, expected_cycles, cycle_count);

            if (accumulated_prod == expected_product && cycle_count == expected_cycles) begin
                $display("[ PASS ]");
            end else begin
                $display("[ FAIL ]");
            end

            repeat (2) @(negedge clk);
        end
    endtask

    initial begin
        reset = 1'b1;
        start = 1'b0;
        multiplicand_in = 4'd0;
        multiplier_in   = 4'd0;

        repeat (2) @(negedge clk);
        reset = 1'b0;
        repeat (2) @(negedge clk);

        run_test(4'd0, 4'd0);
        run_test(4'd0, 4'd5);
        run_test(4'd5, 4'd0);
        run_test(4'd1, 4'd1);
        run_test(4'd1, 4'd15);
        run_test(4'd15, 4'd1);
        
        run_test(4'd3, 4'd4);
        run_test(4'd15, 4'd15);
        
        run_test(4'd3, 4'd12);
        run_test(4'd12, 4'd3);

        repeat (2) @(negedge clk);
        $finish;
    end

endmodule
