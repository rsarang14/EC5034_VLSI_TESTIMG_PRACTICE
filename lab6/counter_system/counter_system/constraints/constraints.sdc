create_clock -name clk -period 10.0 [get_ports clk]

set_false_path -from [get_ports reset_n]
set_input_delay 2.0 -clock clk [remove_from_collection [all_inputs] [get_ports {clk reset_n}]]
set_output_delay 2.0 -clock clk [all_outputs]
set_clock_uncertainty 0.1 [get_clocks clk]
