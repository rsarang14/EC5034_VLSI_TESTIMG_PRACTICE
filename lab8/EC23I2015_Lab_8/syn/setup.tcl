
# *********************************************************
# * Script Name  : Genus initialization script
# *********************************************************
date

set LOCAL_DIR "[exec pwd]/.."
set SYNTH_DIR ${LOCAL_DIR}/work
set TCL_PATH		"${LOCAL_DIR}/tcl $LOCAL_DIR/constraints"
set REPORTS_PATH        "${LOCAL_DIR}/work/reports" 
set LIB_PATH "../library/gsclib045_all_v4.8/gsclib045_hvt/timing"
set RTL_PATH		"$LOCAL_DIR/rtl"
set DESIGN 		"counter_system"

set MSGS_TO_BE_SUPRESSED {LBR-58 LBR-40 LBR-41 VLOGPT-35}


# Baseline Libraries

set LIB_LIST { \
slow_vdd1v0_basicCells_hvt.lib \
}





suppress_messages {LBR-30 LBR-31 LBR-40 LBR-41 LBR-72 LBR-77 LBR-162}
set_db hdl_track_filename_row_col true 
set_db lp_power_unit mW 
set_db init_lib_search_path $LIB_PATH 
set_db script_search_path $TCL_PATH 
set_db init_hdl_search_path $RTL_PATH 
set_db error_on_lib_lef_pin_inconsistency true

# set_db library $LIB_LIST
read_libs $LIB_LIST

