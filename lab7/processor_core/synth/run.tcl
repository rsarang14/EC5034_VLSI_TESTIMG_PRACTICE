source setup.tcl
# Prerequisite: Functional Synthesis Script
# <load your functional design and constraints here, including all
# clock definitions and functional timing exceptions>
set design_name processor_core
set design_id rtl1
source ../mbist/${design_name}.dc_design_load_script
read_hdl ../library/memories/SYNC_1RW_8Kx16.v_interface
elaborate
current_design ${design_name}
check_design -unresolved
# Apply the SDC constraints here
source ./${design_name}.sdc_functional

# Apply the tessent SDC contraints
#source ./${design_name}.timing_options
# mbist specific 
source ./mbist_postelab.tcl 
# Synthesis Step 3: Synthesizing Your Design
syn_generic
syn_map
write_do_lec -golden rtl -revised fv_map \
 -logfile rtl2map.log > rtl2fvmap.tcl
syn_opt
# Synthesis Step 4: Writing Out Your Final SDC
write_sdc $design_name > ${design_name}.merged_sdc
# Synthesis Step 5: Writing Out Your Final Netlist
write_netlist  > $design_name.vg
write_do_lec -golden fv_map \
 -revised $design_name.vg -logfile fvmap2final.log > fvmap2final.tcl
