set local_error_status 0
foreach {globVarName globVarDescription} {
    tsdb_dir    "Location of the top of the tsdb relative to the synthesis directory."
    design_name "Design to be synthesized."
    design_id   "Design id to find '<tsdb_dir>/dft_inserted_designs/<design_name>_<design_id>.dft_inserted_design'"
    gate_file   "Path and file name of the gate netlist to write when synthesis completes."
    preserve_type "Selects what to preserve based on the flow. Allowed values are { add_core_instances scan_insertion icl_extract }"
    tessent_timing_tool "For synthesis, the following are supported { dc_shell encounter }"
 } {
  if { ![info exists $globVarName] } {
    puts "Error: The '$globVarName' variable must be set."
    puts "       $globVarName - $globVarDescription"
    incr local_error_status
  }
}
if { $local_error_status > 0 } { exit 1 }

foreach {globVarName defaultValue} {
  synthesis_verbose   0
  dont_touch_list    {}
  design2remove_list {}
  change_names        0
  skip_sdc            0
  do_not_run          0
  do_not_exit         0
} {
  if { ![info exists $globVarName] } { 
    set envVarName [string toupper $globVarName]
    if { [info exists ::env($envVarName)] } {
      set $globVarName $::env([string toupper $globVarName])
      puts ">>> Variable '$globVarName' set from environment variable '$envVarName' = '[set $globVarName]'"
    } else {
      set $globVarName $defaultValue 
    }
  }
}

# The global variable 'tessent_timing_tool' can be set prior
# to sourcing this file - this overrides the following that tries
# to figure-out the synthesis tool from the following code.
# NOTE: must still find a way to have this work with synthesis caching...
# for now, 'tessent_timing_tool' must be set prior to the sourcing of this file.
if { ![info exists tessent_timing_tool] } {
  variable tessent_timing_tool \
    [switch -glob [file tail [info nameofexecutable]] {
      common_shell_exec {list dc_shell}
      oasys*            {list oasys}
      rc                {list encounter}
      genus             {list genus}
      default           {list pt_shell}
    }]
}
puts "tessent_timing_tool = $tessent_timing_tool"

if {[info exists sdc_file_name]} {
  set effective_sdc_file_name $sdc_file_name
} else {
  set effective_sdc_file_name ${tsdb_dir}/dft_inserted_designs/${design_name}_${design_id}.dft_inserted_design/${design_name}.sdc
}

set supported_synthesis_tools [list dc_shell encounter genus]
if { [lsearch -exact $supported_synthesis_tools $tessent_timing_tool] < 0 } {
  puts "The tool '$tessent_timing_tool' is not supported for synthesis."
  puts "Supported tools are { $supported_synthesis_tools }."
  exit 1
}

variable synthesis_tool $tessent_timing_tool

set scriptDir [file dirname [info script]]
set toolSupportFile [file join $scriptDir ${synthesis_tool}.tcl]
if { [file exists $toolSupportFile] } {
  puts "Sourcing support for synthesis tool '$synthesis_tool'"
  source $toolSupportFile
} else {
  puts "***** NO support yet for synthesis tool '$synthesis_tool'"
}

set synthesis_text {
  # Generic synthesis flow
  file delete -force $gate_file
  
  source ${design_name}.${synthesis_tool}_import_script
  do_elaborate $design_name
  
  if { [info procs synthesis.post_elaborate] eq "synthesis.post_elaborate" } {
    synthesis.post_elaborate
  }
  if { [file exists ${design_name}_${design_id}.${synthesis_tool}_setup] } {
    source ${design_name}_${design_id}.${synthesis_tool}_setup
  }

  if { !$skip_sdc } {
  puts "========== Apply SDC constraints"
  } else {
  puts "========== Sourcing SDC file (don't apply)"
  }
  set tessent_timing_tool $synthesis_tool
  source $effective_sdc_file_name
  tessent_set_default_variables
  if { !$skip_sdc } {
    if {[info procs tessent_create_functional_clocks] ne ""} {
      tessent_create_functional_clocks
    }
    tessent_constrain_${design_name}_non_modal
  }
  
  puts "========== Prevent boundary optimization on some DFT objects"
  set preserveInstances [tessent_get_preserve_instances $preserve_type]
  do_set_boundary_optimization $preserveInstances false
  
  puts "========== Allow boundary optimization on children of DFT objects"
  set optimizeInstances [tessent_get_optimize_instances]
  do_set_boundary_optimization $optimizeInstances true
  
  puts "========== Allow resizing of some library cells"
  set sizeOnlyInstances [tessent_get_size_only_instances]
  do_set_size_only $sizeOnlyInstances
  
  do_compile
  
  do_write_netlist $gate_file $design_name

  if { $do_not_exit == 0 } {
    exit
  }
}

if { $do_not_run == 0 } { eval $synthesis_text }

