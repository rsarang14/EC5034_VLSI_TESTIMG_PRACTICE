SET FLatten Model -verification_info_strip_cdn_name_extension
REAd IMplementation Information fv/dtmf_recvr_core -revised fv_map
SET PARAllel Option -threads 1,4 -norelease_license
SET COmpare Options -threads 1,4
SET UNDEfined Cell black_box -noascend -both
ADD NOtranslate Modules -library -both sync_cell_rst ram_256x16A rom_512x16A pllclk
ADD SEarch Path ../../library/libraries/TIMING/CUSTOM ../../library/libraries/TIMING/STDCELL ../../library/standard_cells/liberty/\
   -library -both
REAd LIbrary -liberty -both /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/synth/../../library/libraries/TIMING/STDCELL/ss_g_1v08_125c.lib\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/synth/../../library/libraries/TIMING/STDCELL/ss_hvt_1v08_125c.lib\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/synth/../../library/libraries/TIMING/CUSTOM/ram_256x16A_slow_syn.lib\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/synth/../../library/libraries/TIMING/CUSTOM/rom_512x16A_slow_syn.lib\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/synth/../../library/libraries/TIMING/CUSTOM/pllclk_slow.lib\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/synth/../../library/standard_cells/liberty/adk.lib\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/synth/../../library/libraries/TIMING/STDCELL/ss_g_1v08_125c.lib\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/synth/../../library/libraries/TIMING/STDCELL/ss_hvt_1v08_125c.lib\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/synth/../../library/libraries/TIMING/CUSTOM/ram_256x16A_slow_syn.lib\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/synth/../../library/libraries/TIMING/CUSTOM/rom_512x16A_slow_syn.lib\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/synth/../../library/libraries/TIMING/CUSTOM/pllclk_slow.lib\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/synth/../../library/standard_cells/liberty/adk.lib
SET UNDRiven Signal 0 -golden
SET NAming Style genus -golden
SET NAming Rule %s[%d] -instance_array -golden
SET NAming Rule %s_reg -register -golden
SET NAming Rule %L.%s %L[%d].%s %s -instance -golden
SET NAming Rule %L.%s %L[%d].%s %s -variable -golden
SET NAming Rule -ungroup_separator _ -golden
SET HDl Options -const_port_extend
SET HDl Options -VERILOG_INCLUDE_DIR src:sep:cwd
DELete SEarch Path -all -design -golden
ADD SEarch Path /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/synth/../rtl -design -golden
REAd DEsign -define SYNTHESIS -merge bbox -golden -lastmod -noelab -verilog2k /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/accum_stat.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/alu_32.v /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/arb.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/conv_subreg.v /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/data_bus_mach.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/data_sample_mux.v /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/decode_i.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/digit_reg.v /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/dma.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/dft_inserted_designs/dtmf_recvr_core_rtl1.dft_inserted_design/modified_rtl_files/dtmf_recvr_core.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/execute_i.v /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/m16x16.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/mult_32_dp.v /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/port_bus_mach.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/power_manager.v /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/prog_bus_mach.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/dft_inserted_designs/dtmf_recvr_core_rtl1.dft_inserted_design/modified_rtl_files/ram_128x16_test.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/dft_inserted_designs/dtmf_recvr_core_rtl1.dft_inserted_design/modified_rtl_files/ram_256x16_test.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/results_conv.v /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/spi.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/tdsp_core_glue.v /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/tdsp_core_mach.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/tdsp_core.v /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/tdsp_data_mux.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/tdsp_ds_cs.v /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/test_control.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/rtl/ulaw_lin_conv.v
DELete SEarch Path -all -design -golden
ADD SEarch Path /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/synth/../rtl -design -golden
REAd DEsign -define SYNTHESIS -merge bbox -golden -lastmod -noelab -verilog2k /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_ijtag.instrument/dtmf_recvr_core_rtl1_tessent_sib_1.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_ijtag.instrument/dtmf_recvr_core_rtl1_tessent_sib_2.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_ijtag.instrument/dtmf_recvr_core_rtl1_tessent_sib_3.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_ijtag.instrument/dtmf_recvr_core_rtl1_tessent_sib_4.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_ijtag.instrument/dtmf_recvr_core_rtl1_tessent_tdr_sri_ctrl.v
DELete SEarch Path -all -design -golden
ADD SEarch Path /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/synth/../rtl -design -golden
REAd DEsign -define SYNTHESIS -merge bbox -golden -lastmod -noelab -verilog2k /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/dtmf_recvr_core_rtl1_tessent_mbist_bap.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/dtmf_recvr_core_rtl1_tessent_mbist_c1_controller.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/dtmf_recvr_core_rtl1_tessent_mbist_c1_interface_m1.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/dtmf_recvr_core_rtl1_tessent_mbist_c2_controller.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/dtmf_recvr_core_rtl1_tessent_mbist_c2_interface_m1.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/dtmf_recvr_core_rtl1_tessent_mbist_c3_controller.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/dtmf_recvr_core_rtl1_tessent_mbist_c3_interface_m1.v\
   /home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/dtmf_recvr_core_rtl1_tessent_mbist_c3_interface_m1_MISR_STRAP.v
ELAborate DEsign -golden -root dtmf_recvr_core -rootonly
REAd DEsign -verilog95 -revised -lastmod -noelab fv/dtmf_recvr_core/fv_map.v.gz
ELAborate DEsign -revised -root dtmf_recvr_core
UNIQuify -all -nolib -golden
REPort DEsign Data
REPort BLack Box
SET FLatten Model -seq_constant
SET FLatten Model -seq_constant_x_to 0
SET FLatten Model -nodff_to_dlat_zero
SET FLatten Model -nodff_to_dlat_feedback
SET FLatten Model -hier_seq_merge
SET FLatten Model -balanced_modeling
CHEck VErification Information
SET ANalyze Option -auto -report_map
WRIte HIer_compare Dofile hier_tmp2.lec.do -verbose -noexact_pin_match -constraint -usage -replace -balanced_extraction\
   -input_output_pin_equivalence -prepend_string "report_design_data; report_unmapped_points -summary; report_unmapped_points -notmapped; analyze_datapath -module -verbose; eval analyze_datapath -flowgraph -verbose"
RUN HIer_compare hier_tmp2.lec.do -dynamic_hierarchy
REPort HIer_compare Result -dynamicflattened
REPort VErification -hier -verbose
WRIte VErification Information
REPort VErification Information
REPort IMplementation Information
SET SYstem Mode lec
ANAlyze RESults -logfiles rtl2map.log
EXIt -f
