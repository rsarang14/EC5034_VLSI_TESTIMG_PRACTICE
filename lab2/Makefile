# Makefile for Sequential Multiplier (EC23I2015)

VLIB = vlib
VMAP = vmap
VLOG = vlog
VSIM = vsim

RTL_SRCS = rtl/datapath.v rtl/controller.v rtl/top.v
GATE_SRC = lib/LIB/slow_vdd1v0_basiccells.v work/top_gates.v
TB_SRC   = rtl/tb_top.v

TOP_TB   = tb_top


all: compile sim

lib:
	$(VLIB) work
	$(VMAP) work work

compile: lib
	$(VLOG) +acc $(RTL_SRCS) $(TB_SRC)

sim: compile
	$(VSIM) -c -do "run -all; exit" $(TOP_TB)

# --- NEW COMMAND FOR FAULT SIMULATION ---
compile_fault: lib
	$(VLOG) +acc $(GATE_SRC) $(TB_SRC)

fault_sim: compile_fault
	$(VSIM) -c -do "run -all; exit" $(TOP_TB)


clean:
	rm -rf work transcript vsim.wlf *.log

.PHONY: all lib compile sim compile_fault fault_sim clean
