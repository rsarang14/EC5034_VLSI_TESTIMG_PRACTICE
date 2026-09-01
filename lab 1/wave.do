# wave.do - Simulation Waveform Configuration

add wave -label clk /tb_top/clk
add wave -label reset /tb_top/reset
add wave -label start /tb_top/start
add wave -label A -radix unsigned /tb_top/multiplicand_in
add wave -label B -radix unsigned /tb_top/multiplier_in
add wave -label "FSM state" /tb_top/uut/u_controller/current_state
add wave -label counter -radix unsigned /tb_top/uut/u_datapath/loop_counter
add wave -label product -radix unsigned /tb_top/accumulated_prod
add wave -label cnt_zero /tb_top/uut/loops_zero_flag
add wave -label done /tb_top/mult_complete

run -all;
