set log file alu_lec.log -replace
read library ../lib/LIB/slow_vdd1v0_basiccells.lib -liberty -both
read design alu_acc_core.v -verilog -golden
read design revised_netlist.v -verilog -revised
set system mode lec
add compared points -all
compare
report verification -verbose
