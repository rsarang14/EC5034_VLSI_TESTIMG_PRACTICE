# Preparation Step 1: Sourcing SDC File
set tsdb ../mbist/tsdb_outdir
source ${tsdb}/dft_inserted_designs/${design_name}_${design_id}.dft_inserted_design/${design_name}.sdc
# Preparation Step 2: Setting and Redefining Tessent Tcl Variables
tessent_set_default_variables
set_ijtag_retargeting_options -tck_period 80.0
# Uncomment the following line to skip the memoryBIST constraints
#    of clock muxing for multi-clock memories:
#set tessent_apply_mbist_mux_constraints 0
# Preparation Step 3: Verifying the Declaration of Functional Clocks
# Set clock names in mapping array.
# The array keys are the names Tessent Shell knew of the clocks.
# The array values are the names of those clocks in your current SDC.
#array set tessent_clock_mapping {
#  CLK25 pCLK25
#  CLK_PLL_REF pCLK100
#}
# Preparation Step 4: Redefining Other Tessent Tcl Variables
# set tessent_input_delay_factor 0.3
# set tessent_hierarchy_separator "_"
# Synthesis Step 1: Applying the SDC Constraints
tessent_set_non_modal
# Synthesis Step 2: Preparing the DFT Logic for Synthesis
proc do_set_boundary_optimization { instances_collection state } {
  if { [sizeof_collection $instances_collection] == 0 } { return }
  puts "Modules of the instances"
  set modules_collection [get_db $instances_collection .module]
  puts "  [join [get_db $instances_collection .module] "\n  "]"
  # Preserve all instances, even those on which boundary optimization
  #  is requested.
  set_db $instances_collection .ungroup_ok false
  # Boundary optimization is avoided by preserving the footprint (pins).
  if { !$state } {
    # Boundary optimization is avoided for all modules of the instances.
    #  - Preserve the footprint of all the pins
    #  - Do not propagate constant inputs while optimizing internal logic
    #  - Do not consider any input of opposite polarity
    set_db $modules_collection .boundary_opto strict_no
  }
}
proc do_set_size_only { instances_collection } {
 
if { [sizeof_collection $instances_collection] == 0 } { return }
  foreach {preserveValue isSequential} [list map_size_ok \
   true size_ok false] {
    set instancesFiltered [filter_collection \
     $instances_collection "is_sequential==$isSequential"]
    if { [llength $instancesFiltered] == 0 } { continue }
    puts "\nSetting preserve attribute '$preserveValue' to \
     '$isSequential' on:"
    set_db $instancesFiltered .preserve $preserveValue
  }
}

set preserveInstances [tessent_get_preserve_instances icl_extract]
do_set_boundary_optimization $preserveInstances false
set optimizeInstances [tessent_get_optimize_instances]
do_set_boundary_optimization $optimizeInstances true
set set_size_only_collection [tessent_get_size_only_instances]
do_set_size_only $set_size_only_collection

# Ungroup shared bus assemblies if any are present
set sb_mods [vfind . -subdesign *_tessent_mbist_*_shared_bus_assembly]
set sb_insts [get_db $sb_mods .instance]
foreach sb_inst $sb_insts {
  # ungroup everything in the assembly but the controller
  ungroup [get_db $sb_inst -depth {1 1} -invert -if \
   {.module =~ *_tessent_mbist_*_controller}]
}
