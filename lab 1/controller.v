module controller (
    input clk,
    input reset,
    
    // Going To FSM
    input start,
    input loops_zero_flag,
    
    // Coming from FSM (Control signals for datapath)
    output reg load_inputs,
    output reg clear_prod,
    output reg enable_prod,
    output reg enable_cnt_dec,
    
    // Output to outside world
    output reg mult_complete
);

    // Encodings for the required states
    parameter IDLE    = 2'b00;
    parameter LOAD    = 2'b01;
    parameter PROG    = 2'b10;
    parameter DONE    = 2'b11;

    // State Registers
    reg [1:0] current_state, next_state;

    // State Memory
    always @(posedge clk) begin

        if (reset ==1'b1) begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end
        
    end

    // Next State & Output Logic
    // EC23I2015
    always @(*) begin
        // Default outputs
        load_inputs    = 1'b0;
        clear_prod     = 1'b0;
        enable_prod    = 1'b0;
        enable_cnt_dec = 1'b0;
        mult_complete  = 1'b0;
        next_state     = current_state;

        case (current_state)
            IDLE: begin

                if (start == 1'b1) begin
                    next_state = LOAD;
                end
            end
            
            LOAD: begin
                load_inputs = 1'b1;
                clear_prod = 1'b1;
                next_state = PROG;
                
            end
            
            PROG: begin
                if (loops_zero_flag == 1'b1) begin
                    next_state = DONE;
                    enable_prod = 1'b0;
                    enable_cnt_dec = 1'b0;
                end
                else begin
                    next_state = PROG;
                    enable_prod = 1'b1;
                    enable_cnt_dec = 1'b1;
                end
            end
            
            DONE: begin
                mult_complete = 1'b1;
                if (start==1'b1) begin
                    next_state=DONE;
                end
                else begin
                    next_state=IDLE;
                end
            end
        endcase
    end

endmodule
