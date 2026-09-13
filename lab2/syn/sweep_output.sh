#!/bin/bash

# Reset clock to 5.0ns, input delay to 0.1, uncertainty to 0.01
sed -i "s/create_clock -period [0-9.]*/create_clock -period 5.0/" syn/constraints.sdc
sed -i "s/set_input_delay [0-9.]*/set_input_delay 0.1/" syn/constraints.sdc
sed -i "s/set_clock_uncertainty [0-9.]*/set_clock_uncertainty 0.01/" syn/constraints.sdc

delays="0.1 0.2 0.4 0.6 0.8 1.0"

for val in $delays; do
    sed -i "s/set_output_delay [0-9.]*/set_output_delay $val/" syn/constraints.sdc
    genus -f syn/genus_syn.tcl
    
    cp work/top_timing.rpt work/reports/output_timing_${val}ns.rpt
    cp work/top_qor.rpt    work/reports/output_qor_${val}ns.rpt
    cp work/top_area.rpt   work/reports/output_area_${val}ns.rpt
done
echo "Output Sweep complete."
