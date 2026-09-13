#!/bin/bash

# Reset clock to 5.0ns, input delay to 0.1, output delay to 0.1
sed -i "s/create_clock -period [0-9.]*/create_clock -period 5.0/" syn/constraints.sdc
sed -i "s/set_input_delay [0-9.]*/set_input_delay 0.1/" syn/constraints.sdc
sed -i "s/set_output_delay [0-9.]*/set_output_delay 0.1/" syn/constraints.sdc

uncertainties="0 0.05 0.10 0.20 0.30"

for val in $uncertainties; do
    sed -i "s/set_clock_uncertainty [0-9.]*/set_clock_uncertainty $val/" syn/constraints.sdc
    genus -f syn/genus_syn.tcl
    
    cp work/top_timing.rpt work/reports/uncert_timing_${val}ns.rpt
    cp work/top_qor.rpt    work/reports/uncert_qor_${val}ns.rpt
    cp work/top_area.rpt   work/reports/uncert_area_${val}ns.rpt
done
echo "Uncertainty Sweep complete."
