# Genus Synthesis Script

#1. Library

set DESIGN top
set RTL_DIR rtl
set OUT_DIR work

set LIB_PATH "/home/l210/L210/work/EC23I2015/LAB2_Submission/lib/LIB/"
set LIB_FILE "/home/l210/L210/work/EC23I2015/LAB2_Submission/lib/LIB/slow_vdd1v0_basiccells.lib"


set OUT "/home/l210/L210/work/EC23I2015/LAB2_Submission/syn/work"
set SDC "/home/l210/L210/work/EC23I2015/LAB2_Submission/syn/constraints.sdc"

file mkdir $OUT_DIR
file mkdir $OUT_DIR/reports

set_db init_lib_search_path $LIB_PATH
set_db library $LIB_FILE

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

#=============================

#6

write_hdl > $OUT_DIR/${DESIGN}_gates.v


exit
