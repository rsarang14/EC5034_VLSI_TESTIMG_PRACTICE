module alu_acc_core(input clk,input rst_n,input en,input test_mode,input scan_enable,input [3:0] a,input [3:0] b,input [1:0] op,input cin,output [3:0] acc,output [3:0] result,output carry,output zero,output test_status);
wire [4:0] add_ext; wire [3:0] add_r,xor_r,and_r,or_r; wire [3:0] acc_reg;
assign add_ext={1'b0,a}+{1'b0,b}+cin; assign add_r=add_ext[3:0]; assign xor_r=a^b; assign and_r=a&b; assign or_r=a|b;
assign result=(op==2'b00)?add_r:(op==2'b01)?xor_r:(op==2'b10)?or_r:and_r;
assign carry=(op==2'b00)?add_ext[4]:1'b0; assign zero=(result==4'b0); assign test_status=1'b0;
DFFRX1 acc0(.D(en?result[0]:acc_reg[0]),.RN(rst_n),.CK(clk),.Q(acc_reg[0]));
DFFRX1 acc1(.D(en?result[1]:acc_reg[1]),.RN(rst_n),.CK(clk),.Q(acc_reg[1]));
DFFRX1 acc2(.D(en?result[2]:acc_reg[2]),.RN(rst_n),.CK(clk),.Q(acc_reg[2]));
DFFRX1 acc3(.D(en?result[3]:acc_reg[3]),.RN(rst_n),.CK(clk),.Q(acc_reg[3]));
assign acc=acc_reg;
endmodule
