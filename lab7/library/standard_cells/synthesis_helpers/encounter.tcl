# encounter generic synthesis procs.
proc do_set_boundary_optimization { instances_collection state } {
  variable synthesis_verbose
  set C {}
  # Find sub-instances because 'boundary_opto' attribute is not inherited downward (unlike 'dc_shell')
  set instancesCollection {}
  foreach_in_collection inst $instances_collection {
    if { [sizeof_collection [set subInstancesCollection [find . -instance [vname $inst]]]] > 0 } {
      append_to_collection instancesCollection $subInstancesCollection
    }
  }
  # In 'encounter', a collection is really just a list...
  set instancesCollection [lsort -unique $instancesCollection]
  if { $synthesis_verbose } {
    puts "INFO: Setting boundary_optimization to '$state' for instances"
    set nameList [vname $instancesCollection]
    puts "       [join [lsort [vname $instances_collection]]  "\n       "]"
  }

  # Boundary optimization can only be applied to subdesign.
  # Build a list of the subdesign names for each instance.
  foreach_in_collection inst $instancesCollection {
    if { [set moduleName [get_attribute module $inst]] eq "" } { continue }
    lappend C $moduleName
  }
  if { [llength $C] == 0 } { return }

  # Apply boundary optimization
  set C [lsort -unique $C]
  puts "Setting boundary optimization '$state' on modules:\n  "
  puts [join $C "\n  "]
  set_attribute boundary_opto -quiet $state $C

  # Preserve the footprint of DFT objects
  # when boundary optimization is not set.
  if { !$state } {
    puts "Preserve footprint on pins of:\n  "
    set_attribute preserve true [get_pins -of_objects $instancesCollection]
  }
  return $C
}

proc do_set_size_only { instances_collection } {
  if { [sizeof_collection $instances_collection] == 0 } { return }
  foreach {preserveValue isSequential} [list map_size_ok true size_ok false] {
    set instancesListFiltered [filter sequential $isSequential $instances_collection]
    if { [llength $instancesListFiltered] == 0 } { continue }
    puts "Setting preserve attribute '$preserveValue' to '$isSequential' on:\n  "
    puts [join [lsort $instancesListFiltered] "\n  "]
    set_attribute preserve $preserveValue $instancesListFiltered
  }
}

proc do_elaborate { design_name } {
  if { [info exists wdis_lib_path_list] } {
    elaborate $design_name -libpath $wdis_lib_path_list -libext $wdis_lib_extension_list
  } else {
    elaborate $design_name
  }
  cd designs/$design_name
}

proc do_compile { args } {
 eval synthesize -to_mapped $args
}

proc do_write_netlist { gate_file design_name } {
  redirect $gate_file { write_hdl $design_name }
}

