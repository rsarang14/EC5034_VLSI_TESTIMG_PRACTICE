#!/bin/bash

periods="5.0 3.0 2.0 1.5 1.4 1.3 1.0"

for p in $periods; do
    sed -i "s/create_clock -period [0-9.]*/create_clock -period $p/" syn/constraints.sdc
    genus -f syn/genus_syn.tcl
    
    # Copying from work/ and saving them into work/reports/
    cp work/top_timing.rpt work/reports/timing_${p}ns.rpt
    cp work/top_qor.rpt    work/reports/qor_${p}ns.rpt
    cp work/top_area.rpt   work/reports/area_${p}ns.rpt
done

echo "Sweep complete."
