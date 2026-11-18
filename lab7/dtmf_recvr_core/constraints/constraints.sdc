# ####################################################################

#  Created by RTL Compiler (RC) 05.20-p002 on Wed Feb 22 10:43:54 AM CST 2006

# ####################################################################

set sdc_version 1.4


# Set the current design
current_design dtmf_recvr_core

create_clock -name "refclk" -add -period 8.0 -waveform {0.0 4.0} [get_ports refclk]
set_clock_transition 0.0 [get_clocks refclk]
create_clock -name "m_clk" -add -period 8.0 -waveform {0.0 4.0} [get_pins TEST_CONTROL_INST/m_clk]
set_clock_transition 0.0 [get_clocks m_clk]
create_clock -name "m_rcc_clk" -add -period 16.0 -waveform {0.0 8.0} [get_pins TEST_CONTROL_INST/m_rcc_clk]
set_clock_transition 0.0 [get_clocks m_rcc_clk]
create_clock -name "m_spi_clk" -add -period 16.0 -waveform {0.0 8.0} [get_pins TEST_CONTROL_INST/m_spi_clk]
set_clock_transition 0.0 [get_clocks m_spi_clk]
create_clock -name "m_dsram_clk" -add -period 16.0 -waveform {0.0 8.0} [get_pins TEST_CONTROL_INST/m_dsram_clk]
set_clock_transition 0.0 [get_clocks m_dsram_clk]
create_clock -name "m_ram_clk" -add -period 16.0 -waveform {0.0 8.0} [get_pins TEST_CONTROL_INST/m_ram_clk]
set_clock_transition 0.0 [get_clocks m_ram_clk]
 create_clock -name "m_digit_clk" -add -period 16.0 -waveform {0.0 8.0} [get_pins TEST_CONTROL_INST/m_digit_clk]
set_clock_transition 0.0 [get_clocks m_digit_clk]

