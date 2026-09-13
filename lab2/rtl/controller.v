module controller (
    input clk,
    input reset,
    
    // Inputs to FSM
    input start,
    input loops_zero_flag,
    
    // Outputs from FSM (Control signals for datapath)
    output reg load_inputs,
    output reg clear_prod,
    output reg enable_prod,
    output reg enable_cnt_dec,
    
    // Output to outside world
    output reg mult_complete
);

    // State Encoding
    parameter IDLE    = 2'b00;
    parameter LOAD    = 2'b01;
    parameter PROG    = 2'b10;
    parameter DONE    = 2'b11;

    // State Registers
    reg [1:0] current_state, next_state;

    // -----------------------------------------------------------------
    // 1. State Memory (Sequential)
    // -----------------------------------------------------------------
    always @(posedge clk) begin
        // TODO: If reset is 1, current_state becomes IDLE.
        // Otherwise, current_state becomes next_state.

        if (reset ==1'b1) begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end
        
    end

    // -----------------------------------------------------------------
    // 2. Next State & Output Logic (Combinational)
    // -----------------------------------------------------------------
    always @(*) begin
        // Default outputs (to prevent latches)
        load_inputs    = 1'b0;
        clear_prod     = 1'b0;
        enable_prod    = 1'b0;
        enable_cnt_dec = 1'b0;
        mult_complete  = 1'b0;
        next_state     = current_state;

        case (current_state)
            IDLE: begin
                // TODO: Logic for IDLE state

                if (start == 1'b1) begin
                    next_state = LOAD;
                end
            end
            
            LOAD: begin
                // TODO: Logic for LOAD state
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
                // TODO: Logic for DONE state
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
