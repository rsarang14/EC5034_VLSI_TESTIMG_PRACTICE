set log file multiplier_buggy_lec.log -replace
read library ../lib/LIB/slow_vdd1v0_basiccells.lib -liberty -both
read design ../rtl/controller.v ../rtl/datapath.v ../rtl/top.v -verilog -golden


read design ../work_cg/top_gates_buggy.v -verilog -revised

set flatten model -gated_clock

set system mode lec
add compared point -all
compare
report verification -verbose
