# dc_shell generic synthesis procs.

# Default setup
foreach {varName varValue} {
    compile_enable_constant_propagation_with_no_boundary_opt false
    timing_enable_multiple_clocks_per_reg true
  } {
    set_app_var $varName $varValue
    eval printvar $varName
}

proc do_set_boundary_optimization { instances_collection state } {
  if { [sizeof_collection $instances_collection] == 0 } { return }

  variable synthesis_verbose
  if { $synthesis_verbose } {
    puts "INFO: Setting boundary_optimization to '$state' for instances"
    puts "       [join [lsort [get_object_name $instances_collection]]  "\n       "]"
  }

  set_boundary_optimization $instances_collection $state

  if { !$state } {
    set_ungroup $instances_collection $state
    # DC ultra only
    redirect -variable resText {set res [set_compile_directives $instances_collection -delete_unloaded_gate $state]}
    if { $res eq "0" } {
      puts [regsub {Error} [lindex [split $resText \n] 0] "INFO"]
      puts "Consequently, unloaded gates will be deleted by 'dc_shell'."
    }
    # DC shell
    set compile_seqmap_propagate_high_effort false
    set compile_delete_unloaded_sequential_cells false
  }
  return
}

proc do_set_size_only { instances_collection } {
  if { [sizeof_collection $instances_collection] == 0 } { return }

  variable synthesis_verbose
  if { $synthesis_verbose } {
    puts "INFO: Setting size only for instances"
    set nameList [list]
    foreach_in_collection obj $instances_collection {
      lappend nameList [get_object_name $obj]
    }
    puts "       [join [lsort $nameList]  "\n       "]"
  }

  set_size_only -all_instances $instances_collection
  return
}

proc do_elaborate { design_name } {
  redirect /dev/null { set designType [get_attribute [get_designs $design_name] design_type] }
  if { $designType ne "netlist" } {
    elaborate $design_name
  }
  current_design $design_name
  global dont_touch_list
  foreach name $dont_touch_list {
    puts "Marking design '$name' as dont touch"
    set_dont_touch $name
  }
  return
}

proc do_compile { args } {
  link
  check_design
  eval compile -boundary_optimization $args
}

proc do_write_netlist { gate_file design_name } {
  global design2remove_list
  foreach name $design2remove_list {
    set_dont_touch $name false
    remove_design $name 
  }
  global change_names
  if { $change_names } { change_names -rules verilog -hier }
  write -format verilog -output $gate_file $design_name -hier
  return
}
