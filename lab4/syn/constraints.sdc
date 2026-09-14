# Constraints Required

create_clock -period 5.0 [get_ports clk]

set_input_delay 0.1 -clock clk [all_inputs]
set_output_delay 0.1 -clock clk [all_outputs]

set_clock_uncertainty 0.30 [get_clocks clk]