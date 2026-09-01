`timescale 1ns / 1ps

module tb_top;

    // Testbench Inputs
    reg clk;
    reg reset;
    reg start;
    reg [3:0] multiplicand_in;
    reg [3:0] multiplier_in;

    // Testbench Outputs
    wire mult_complete;
    wire [7:0] accumulated_prod;

    // Instantiate Unit Under Test (UUT)
    top uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .multiplicand_in(multiplicand_in),
        .multiplier_in(multiplier_in),
        .mult_complete(mult_complete),
        .accumulated_prod(accumulated_prod)
    );

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns Clock Period
    end

    // Test variables
    integer cycle_count;
    integer expected_product;
    integer expected_cycles;

    // Synchronous Test Task
    // EC23I2015
    task run_test(input [3:0] A, input [3:0] B);
        begin
            // Set inputs on falling edge of clock
            @(negedge clk);
            multiplicand_in = A;
            multiplier_in   = B;
            expected_product = A * B;
            expected_cycles  = B + 2; // B COMPUTE cycles + 1 LOAD + 1 DONE
            cycle_count      = 0;

            // Assert start signal
            start = 1'b1;

            // Wait 1 clock cycle for LOAD phase
            @(negedge clk);
            start = 1'b0; // De-assert start

            // Count cycles while waiting for completion
            while (!mult_complete) begin
                @(negedge clk);
                cycle_count = cycle_count + 1;
            end

            // Display self-checking results
            $write("Test: %2d x %2d | Exp Prod: %3d, Act Prod: %3d | Exp Cycles: %2d, Act Cycles: %2d | ", 
                   A, B, expected_product, accumulated_prod, expected_cycles, cycle_count);

            if (accumulated_prod == expected_product && cycle_count == expected_cycles) begin
                $display("[ PASS ]");
            end else begin
                $display("[ FAIL ]");
            end

            // Wait 2 clock cycles before starting next test (Synchronous delay)
            repeat (2) @(negedge clk);
        end
    endtask

    // Test Execution Sequence
    initial begin
        // Initialize Inputs
        reset = 1'b1;
        start = 1'b0;
        multiplicand_in = 4'd0;
        multiplier_in   = 4'd0;

        // Hold reset for 2 clock cycles
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

        // Wait 2 clock cycles then finish simulation
        repeat (2) @(negedge clk);
        $finish;
    end

endmodule
