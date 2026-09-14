# Genus Synthesis Script with Clock Gating 

#1. Library
set DESIGN top
set RTL_DIR ../rtl 
set OUT_DIR ../work_cg 

# Relative paths
set LIB_PATH "../lib/LIB/"
set LIB_FILE "../lib/LIB/slow_vdd1v0_basiccells.lib"
set SDC "constraints.sdc"

file mkdir $OUT_DIR
file mkdir $OUT_DIR/reports

set_db init_lib_search_path $LIB_PATH
set_db library $LIB_FILE

#===========================
# TASK 2: Enable Clock Gating before reading RTL
set_db / .lp_insert_clock_gating true
#===========================

#2. RTL design reading
read_hdl [list \
    $RTL_DIR/controller.v \
    $RTL_DIR/datapath.v \
    $RTL_DIR/top.v \
]

elaborate $DESIGN

#===========================
#3. Constraints
read_sdc $SDC

#===============
#4. Stages
syn_generic
syn_map
syn_opt

#====================
#5 Reports
report_timing > $OUT_DIR/${DESIGN}_timing.rpt
report_area > $OUT_DIR/${DESIGN}_area.rpt
report_qor > $OUT_DIR/${DESIGN}_qor.rpt 
report_gates > $OUT_DIR/${DESIGN}_cells.rpt

# TASK 2: Generate list of flip-flops optimized by clock gating
report_sequential -deleted > $OUT_DIR/${DESIGN}_deleted_flops.rpt

#=============================
#6
write_hdl > $OUT_DIR/${DESIGN}_gates.v

exit
