set log file multiplier_lec.log -replace

read library ../lib/LIB/slow_vdd1v0_basiccells.lib -liberty -both
read design ../rtl/controller.v ../rtl/datapath.v ../rtl/top.v -verilog -golden
read design ../work/top_gates.v -verilog -revised

set system mode lec
add compared point -all
compare
report verification -verbose