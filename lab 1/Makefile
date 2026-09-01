# Makefile for Sequential Multiplier (EC23I2015)

VLIB = vlib
VMAP = vmap
VLOG = vlog
VSIM = vsim

RTL_SRCS = datapath.v controller.v top.v
TB_SRC   = tb_top.v
TOP_TB   = tb_top

all: compile sim

lib:
	$(VLIB) work
	$(VMAP) work work

compile: lib
	$(VLOG) +acc $(RTL_SRCS) $(TB_SRC)

sim: compile
	$(VSIM) -c -do "run -all; exit" $(TOP_TB)

gui: compile
	$(VSIM) -gui -do "add wave -r /*; run -all;" $(TOP_TB) &

clean:
	rm -rf work transcript vsim.wlf *.log

.PHONY: all lib compile sim gui clean
