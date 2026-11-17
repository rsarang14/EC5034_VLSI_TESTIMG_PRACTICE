set tsdb ../mbist/tsdb_outdir
source ${tsdb}/dft_inserted_designs/${design_name}_${design_id}.dft_inserted_design/${design_name}.sdc

tessent_set_default_variables
set_ijtag_retargeting_options -tck_period 80.0
tessent_set_non_modal

proc do_set_boundary_optimization { instances_collection state } {
  if { [sizeof_collection $instances_collection] == 0 } { return }
  set modules_collection [get_db $instances_collection .module]
  set_db $instances_collection .ungroup_ok false
  if { !$state } {
    set_db $modules_collection .boundary_opto strict_no
  }
}

proc do_set_size_only { instances_collection } {
  if { [sizeof_collection $instances_collection] == 0 } { return }
  foreach {preserveValue isSequential} [list map_size_ok true size_ok false] {
    set instancesFiltered [filter_collection $instances_collection "is_sequential==$isSequential"]
    if { [llength $instancesFiltered] == 0 } { continue }
    set_db $instancesFiltered .preserve $preserveValue
  }
}

do_set_boundary_optimization [tessent_get_preserve_instances icl_extract] false
do_set_boundary_optimization [tessent_get_optimize_instances] true
do_set_size_only [tessent_get_size_only_instances]
