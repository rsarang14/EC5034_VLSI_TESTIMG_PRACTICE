module alu_acc_core(input clk,input rst_n,input en,input test_mode,input scan_enable,input [3:0] a,input [3:0] b,input [1:0] op,input cin,output reg [3:0] acc,output [3:0] result,output carry,output zero,output test_status);
reg [3:0] acc_reg; wire [4:0] add_ext; wire [3:0] add_r,xor_r,and_r,or_r;
assign add_ext={1'b0,a}+{1'b0,b}+cin; assign add_r=add_ext[3:0]; assign xor_r=a^b; assign and_r=a&b; assign or_r=a|b;
assign result=(op==2'b00)?add_r:(op==2'b01)?xor_r:(op==2'b10)?and_r:or_r;
assign carry=(op==2'b00)?add_ext[4]:1'b0; assign zero=(result==4'b0); assign test_status=1'b0;
always @(posedge clk or negedge rst_n) begin if(!rst_n) acc_reg<=4'b0; else if(en) acc_reg<=result; end
always @* acc=acc_reg;
endmodule
