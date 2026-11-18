SET FLatten Model -verification_info_strip_cdn_name_extension
REAd IMplementation Information fv/dtmf_recvr_core -golden fv_map -revised dtmf_recvr_corevg
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
REAd DEsign -verilog95 -golden -lastmod -noelab fv/dtmf_recvr_core/fv_map.v.gz
ELAborate DEsign -golden -root dtmf_recvr_core
REAd DEsign -verilog95 -revised -lastmod -noelab dtmf_recvr_core.vg
ELAborate DEsign -revised -root dtmf_recvr_core
REPort DEsign Data
REPort BLack Box
SET FLatten Model -seq_constant
SET FLatten Model -seq_constant_x_to 0
SET FLatten Model -nodff_to_dlat_zero
SET FLatten Model -nodff_to_dlat_feedback
SET FLatten Model -hier_seq_merge
CHEck VErification Information
SET ANalyze Option -auto -report_map
SET SYstem Mode lec
REPort UNmapped Points -summary
REPort UNmapped Points -notmapped
ADD COmpared Points -all
COMpare
REPort COmpare Data -class nonequivalent -class abort -class notcompared
REPort VErification -verbose
REPort STatistics
WRIte VErification Information
REPort VErification Information
REPort IMplementation Information
ANAlyze RESults -logfiles fvmap2final.log
EXIt -f
