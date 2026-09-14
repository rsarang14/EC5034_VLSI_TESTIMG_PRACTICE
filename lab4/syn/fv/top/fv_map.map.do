
//input ports
add mapped point clk clk -type PI PI
add mapped point reset reset -type PI PI
add mapped point start start -type PI PI
add mapped point multiplicand_in[3] multiplicand_in[3] -type PI PI
add mapped point multiplicand_in[2] multiplicand_in[2] -type PI PI
add mapped point multiplicand_in[1] multiplicand_in[1] -type PI PI
add mapped point multiplicand_in[0] multiplicand_in[0] -type PI PI
add mapped point multiplier_in[3] multiplier_in[3] -type PI PI
add mapped point multiplier_in[2] multiplier_in[2] -type PI PI
add mapped point multiplier_in[1] multiplier_in[1] -type PI PI
add mapped point multiplier_in[0] multiplier_in[0] -type PI PI

//output ports
add mapped point mult_complete mult_complete -type PO PO
add mapped point accumulated_prod[7] accumulated_prod[7] -type PO PO
add mapped point accumulated_prod[6] accumulated_prod[6] -type PO PO
add mapped point accumulated_prod[5] accumulated_prod[5] -type PO PO
add mapped point accumulated_prod[4] accumulated_prod[4] -type PO PO
add mapped point accumulated_prod[3] accumulated_prod[3] -type PO PO
add mapped point accumulated_prod[2] accumulated_prod[2] -type PO PO
add mapped point accumulated_prod[1] accumulated_prod[1] -type PO PO
add mapped point accumulated_prod[0] accumulated_prod[0] -type PO PO

//inout ports




//Sequential Pins
add mapped point u_datapath/working_multiplicand[1]/q u_datapath_working_multiplicand_reg[1]/Q  -type DFF DFF
add mapped point u_datapath/working_multiplicand[2]/q u_datapath_working_multiplicand_reg[2]/Q  -type DFF DFF
add mapped point u_datapath/working_multiplicand[3]/q u_datapath_working_multiplicand_reg[3]/Q  -type DFF DFF
add mapped point u_datapath/working_multiplicand[0]/q u_datapath_working_multiplicand_reg[0]/Q  -type DFF DFF
add mapped point u_datapath/accumulated_prod[7]/q u_datapath_accumulated_prod_reg[7]/Q  -type DFF DFF
add mapped point u_datapath/accumulated_prod[6]/q u_datapath_accumulated_prod_reg[6]/Q  -type DFF DFF
add mapped point u_datapath/accumulated_prod[5]/q u_datapath_accumulated_prod_reg[5]/Q  -type DFF DFF
add mapped point u_datapath/accumulated_prod[4]/q u_datapath_accumulated_prod_reg[4]/Q  -type DFF DFF
add mapped point u_datapath/accumulated_prod[3]/q u_datapath_accumulated_prod_reg[3]/Q  -type DFF DFF
add mapped point u_datapath/accumulated_prod[2]/q u_datapath_accumulated_prod_reg[2]/Q  -type DFF DFF
add mapped point u_datapath/accumulated_prod[1]/q u_datapath_accumulated_prod_reg[1]/Q  -type DFF DFF
add mapped point u_controller/current_state[1]/q u_controller_current_state_reg[1]/Q  -type DFF DFF
add mapped point u_controller/current_state[0]/q u_controller_current_state_reg[0]/Q  -type DFF DFF
add mapped point u_datapath/accumulated_prod[0]/q u_datapath_accumulated_prod_reg[0]/Q  -type DFF DFF
add mapped point u_datapath/loop_counter[1]/q u_datapath_loop_counter_reg[1]/Q  -type DFF DFF
add mapped point u_datapath/loop_counter[2]/q u_datapath_loop_counter_reg[2]/Q  -type DFF DFF
add mapped point u_datapath/loop_counter[3]/q u_datapath_loop_counter_reg[3]/Q  -type DFF DFF
add mapped point u_datapath/loop_counter[0]/q u_datapath_loop_counter_reg[0]/Q  -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
