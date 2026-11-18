// Library - dtmf_recvr, Cell - dtmf_recvr_core, // View - schematic,
// Version - 0.16 

module dtmf_recvr_core ( 
    tdigit, 
    tdigit_flag, 
    reset, 
    int,
    port_pad_data_out,
    port_pad_data_in,
    scan_clk,
    p_clk,
    p_rst,
    test_mode,
    scan_en,
    scan_in,
    scan_out,
    spi_data,
    spi_fs, 
    refclk, 
    vcop, 
    vcom, 
    pllrst, 
    ibias,
    switch_en_out,
    Avdd,
    Avss,
    VSS,
    VDD_TDSPCore_R,
    VDD_AO
    , ijtag_tck, ijtag_reset, ijtag_ce, ijtag_se, ijtag_ue, ijtag_sel, ijtag_si, 
    ijtag_so);

inout Avdd, Avss, VSS, VDD_TDSPCore_R, VDD_AO;
output [15:0] 
    port_pad_data_out ;

output [2:0]
    scan_out ;

output  
        vcop		, 
        vcom		, 
        switch_en_out ,
	tdigit_flag ;

input [15:0] 
        port_pad_data_in ;

/* # Added one more bit for power manager */
/* # CC */
input [2:0]
        scan_in;

input  
        reset		, 
        int		,
        scan_clk	, 
        p_clk	, 
        p_rst	, 
        scan_en	, 
        test_mode	,
        spi_data	, 
        spi_fs		, 
        refclk		, 
        pllrst		, 
        ibias ;

output [7:0]  
	tdigit ;
  input ijtag_tck, ijtag_reset, ijtag_ce, ijtag_se, ijtag_ue, ijtag_sel, 
        ijtag_si;
  wire ijtag_tck, ijtag_reset, ijtag_ce, ijtag_se, ijtag_ue, ijtag_sel, 
       ijtag_si;
  output ijtag_so;
  wire ijtag_so;


// Buses in the design

wire  [7:0]  	upcm;
wire  [8:0]  	p_addrs;
wire  [7:0]  	t_addrs_ds;
wire  [7:0]  	ds_addrs;
wire  [7:0]  	digit;
wire  [2:0]  	port_address;
wire  [15:0]  	lpcm;
wire  [7:0]  	d_addrs;
wire  [15:0]  	ds_datain;
wire  [15:0]  	rom_data;
wire  [15:0]  	mem_data;
wire  [15:0]  	ds_data;
wire  [15:0]  	tdsp_data_in;
wire  [15:0]  	tdsp_data_out;
wire  [7:0]  	t_addrs;
wire  [2:0]     t_sdi, t_sdo;


wire clk, spi_clk, rcc_clk, digit_clk, m_rcc_clk, m_digit_clk, m_spi_clk;
  wire [2:0] BIST_SETUP;
  wire [3:0] toBist, bistEn, BIST_COL_ADD, BIST_COL_ADD_ts1;
  wire [4:0] BIST_ROW_ADD;
  wire [3:0] BIST_ROW_ADD_ts1;
  wire [1:0] BIST_WRITE_DATA, BIST_EXPECT_DATA;
  wire [8:0] ROM_512x16_0_INST_interface_inst_A;
  wire dtmf_recvr_core_rtl1_tessent_sib_mbist_inst_so, 
       dtmf_recvr_core_rtl1_tessent_sib_sti_inst_so, 
       dtmf_recvr_core_rtl1_tessent_sib_sri_ctrl_inst_so, 
       dtmf_recvr_core_rtl1_tessent_tdr_sri_ctrl_inst_so, 
       dtmf_recvr_core_rtl1_tessent_sib_sri_inst_to_select, 
       dtmf_recvr_core_rtl1_tessent_sib_sti_inst_so_ts1, 
       dtmf_recvr_core_rtl1_tessent_sib_sti_inst_to_select, 
       dtmf_recvr_core_rtl1_tessent_sib_sri_ctrl_inst_to_select, ijtag_to_tck, 
       ijtag_to_ue, ijtag_to_reset, ijtag_to_se, ijtag_to_ce, all_test, 
       test_mode_ts1, dft_ctrl_test_mode_mux2_Y, ijtag_to_sel, ltest_to_en, 
       ltest_to_mem_bypass_en, ltest_to_scan_en, ltest_to_mcp_bounding_en, 
       BIST_HOLD, BIST_SETUP_ts1, BIST_SETUP_ts2, BIST_SETUP_ts3, 
       BIST_SELECT_TEST_DATA, to_controllers_tck, mcp_bounding_to_en, 
       scan_to_en, memory_bypass_to_en, ltest_to_en_ts1, BIST_ALGO_MODE0, 
       BIST_ALGO_MODE1, ENABLE_MEM_RESET, REDUCED_ADDRESS_COUNT, 
       BIST_ASYNC_RESET, MEM0_BIST_COLLAR_SI, MEM0_BIST_COLLAR_SI_ts1, 
       MEM1_BIST_COLLAR_SI, BIST_SO, BIST_SO_ts1, BIST_SO_ts2, MBISTPG_SO, 
       MBISTPG_SO_ts1, MBISTPG_SO_ts2, MBISTPG_SO_ts3, MBISTPG_DONE, 
       MBISTPG_DONE_ts1, MBISTPG_DONE_ts2, MBISTPG_DONE_ts3, BIST_GO, 
       BIST_GO_ts1, BIST_GO_ts2, MBISTPG_GO, MBISTPG_GO_ts1, MBISTPG_GO_ts2, 
       MBISTPG_GO_ts3, BIST_DIAG_EN, BIST_COLLAR_DIAG_EN, FL_CNT_MODE0, 
       FL_CNT_MODE1, BIST_SELECT, BIST_WRITEENABLE, BIST_SELECT_ts1, BIST_CMP, 
       BIST_CMP_ts1, INCLUDE_MEM_RESULTS_REG, BIST_COLLAR_EN0, 
       BIST_COLLAR_EN0_ts1, BIST_COLLAR_EN1, BIST_RUN_TO_COLLAR0, 
       BIST_RUN_TO_COLLAR0_ts1, BIST_RUN_TO_COLLAR1, to_interfaces_tck, 
       BIST_TESTDATA_SELECT_TO_COLLAR, BIST_TESTDATA_SELECT_TO_COLLAR_ts1, 
       BIST_ON_TO_COLLAR, BIST_ON_TO_COLLAR_ts1, CHKBCI_PHASE, 
       BIST_SHIFT_COLLAR, BIST_SHIFT_COLLAR_ts1, BIST_COLLAR_SETUP, 
       BIST_COLLAR_SETUP_ts1, BIST_CLEAR_DEFAULT, BIST_CLEAR_DEFAULT_ts1, 
       BIST_CLEAR, BIST_CLEAR_ts1, BIST_COLLAR_HOLD, BIST_COLLAR_HOLD_ts1, 
       FREEZE_STOP_ERROR, ERROR_CNT_ZERO, MBISTPG_RESET_REG_SETUP2, CEN, 
       MBISTPG_COMPARE_MISR, dtmf_recvr_core_rtl1_tessent_mbist_bap_inst_so;
  wire [15:0] ROM_512x16_0_INST_Q;


power_manager PM_INST (
	.clk(p_clk), 
	.p_reset(p_rst), 
	.power_switch_enable(power_switch_enable), 
	.isolation_enable(isolation_enable), 
	.state_retention_enable(state_retention_enable)
	);

pllclk PLLCLK_INST(
	.refclk(refclk),
	.vcop(vcop),
	.vcom(vcom),
	.clk1x(spi_clk),
	.clk2x(clk),
	.reset(pllrst),
	.ibias(ibias)
	);

test_control TEST_CONTROL_INST(
       .m_clk(m_clk),
       .clk(clk),
       .m_rcc_clk(m_rcc_clk),
       .m_digit_clk(m_digit_clk),
       .m_spi_clk(m_spi_clk),
       .m_ram_clk(m_ram_clk),
       .m_dsram_clk(m_dsram_clk),
       .rcc_clk(rcc_clk),
       .digit_clk(digit_clk),
       .spi_clk(spi_clk),
       .ram_clk(t_write_d),
       .dsram_clk(ds_write),
       .test_mode(dft_ctrl_test_mode_mux2_Y),
       //.test_mode(1'b0),
       .scan_clk(scan_clk)
);


rom_512x16A ROM_512x16_0_INST(
       .A(ROM_512x16_0_INST_interface_inst_A),
       .Q(ROM_512x16_0_INST_Q),
       .CLK(m_clk),
       .CEN(CEN)
);

ram_128x16_test RAM_128x16_TEST_INST(
       .a(t_addrs[6:0]),
       .din(tdsp_data_out[15:0]),
       .dout(mem_data[15:0]),
       .oe(t_read_d),
       .wr(m_ram_clk),
       .test_mode(test_mode), .BIST_HOLD(BIST_HOLD), 
                                     .BIST_SETUP(BIST_SETUP[0]), 
                                     .BIST_SETUP_ts1(BIST_SETUP[1]), 
                                     .BIST_SETUP_ts2(BIST_SETUP[2]), 
                                     .BIST_SELECT_TEST_DATA(BIST_SELECT_TEST_DATA), 
                                     .to_controllers_tck(to_controllers_tck), 
                                     .mcp_bounding_to_en(mcp_bounding_to_en), 
                                     .scan_to_en(scan_to_en), 
                                     .memory_bypass_to_en(memory_bypass_to_en), 
                                     .ltest_to_en(ltest_to_en_ts1), 
                                     .BIST_ALGO_MODE0({BIST_ALGO_MODE1, 
                                     BIST_ALGO_MODE0}), .ENABLE_MEM_RESET(ENABLE_MEM_RESET), 
                                     .REDUCED_ADDRESS_COUNT(REDUCED_ADDRESS_COUNT), 
                                     .BIST_ASYNC_RESET(BIST_ASYNC_RESET), 
                                     .toBist(toBist[0]), .MBISTPG_SO(MBISTPG_SO), 
                                     .bistEn(bistEn[0]), .MBISTPG_DONE(MBISTPG_DONE), 
                                     .MBISTPG_GO(MBISTPG_GO), .BIST_DIAG_EN(BIST_DIAG_EN), 
                                     .FL_CNT_MODE0({FL_CNT_MODE1, 
                                     FL_CNT_MODE0}), .INCLUDE_MEM_RESULTS_REG(INCLUDE_MEM_RESULTS_REG), 
                                     .to_interfaces_tck(to_interfaces_tck)
);

`ifdef orig
ram_256x16_test RAM_256x16_TEST_INST(
       .a(ds_addrs[7:0]),
       .din(ds_datain[15:0]),
       .dout(ds_data[15:0]),
       .oe(t_read_ds),
       .wr(m_dsram_clk),
       .test_mode(test_mode)
);
`endif
wire [15:0] ds_data_tmp;
wire [15:0] ds_data_tmp1;
ram_256x16_test RAM_256x16_TEST_INST_1(
       .a(ds_addrs[7:0]),
       .din(ds_datain[15:0]),
       .dout(ds_data_tmp[15:0]),
       .oe(t_read_ds),
       .wr(m_dsram_clk),
       .test_mode(test_mode), .BIST_HOLD(BIST_HOLD), 
                                       .BIST_SETUP(BIST_SETUP[0]), 
                                       .BIST_SETUP_ts1(BIST_SETUP[1]), 
                                       .BIST_SETUP_ts2(BIST_SETUP[2]), 
                                       .BIST_SELECT_TEST_DATA(BIST_SELECT_TEST_DATA), 
                                       .to_controllers_tck(to_controllers_tck), 
                                       .mcp_bounding_to_en(mcp_bounding_to_en), 
                                       .scan_to_en(scan_to_en), 
                                       .memory_bypass_to_en(memory_bypass_to_en), 
                                       .ltest_to_en(ltest_to_en_ts1), 
                                       .BIST_ALGO_MODE0({BIST_ALGO_MODE1, 
                                       BIST_ALGO_MODE0}), .ENABLE_MEM_RESET(ENABLE_MEM_RESET), 
                                       .REDUCED_ADDRESS_COUNT(REDUCED_ADDRESS_COUNT), 
                                       .BIST_ASYNC_RESET(BIST_ASYNC_RESET), 
                                       .toBist(toBist[1]), .MBISTPG_SO(MBISTPG_SO_ts1), 
                                       .bistEn(bistEn[1]), .MBISTPG_DONE(MBISTPG_DONE_ts1), 
                                       .MBISTPG_GO(MBISTPG_GO_ts1), 
                                       .BIST_DIAG_EN(BIST_DIAG_EN), 
                                       .FL_CNT_MODE0({FL_CNT_MODE1, 
                                       FL_CNT_MODE0}), 
                                       .INCLUDE_MEM_RESULTS_REG(INCLUDE_MEM_RESULTS_REG), 
                                       .to_interfaces_tck(to_interfaces_tck)
);
ram_256x16_test_2 RAM_256x16_TEST_INST_2(
       .a(ds_addrs[7:0]),
       .din(ds_data_tmp[15:0]),
       .dout(ds_data_tmp1[15:0]),
       .oe(t_read_ds),
       .wr(m_dsram_clk),
       .test_mode(test_mode), .BIST_SETUP(BIST_SETUP[0]), 
                                         .mcp_bounding_to_en(mcp_bounding_to_en), 
                                         .scan_to_en(scan_to_en), 
                                         .memory_bypass_to_en(memory_bypass_to_en), 
                                         .MEM0_BIST_COLLAR_SI(MEM0_BIST_COLLAR_SI_ts1), 
                                         .BIST_SO(BIST_SO), .BIST_GO(BIST_GO), 
                                         .BIST_COLLAR_DIAG_EN(BIST_COLLAR_DIAG_EN), 
                                         .ltest_to_en(ltest_to_en_ts1), 
                                         .BIST_WRITEENABLE(BIST_WRITEENABLE), 
                                         .BIST_SELECT(BIST_SELECT_ts1), 
                                         .BIST_CMP(BIST_CMP_ts1), 
                                         .INCLUDE_MEM_RESULTS_REG(INCLUDE_MEM_RESULTS_REG), 
                                         .BIST_COL_ADD(BIST_COL_ADD_ts1[3:0]), 
                                         .BIST_ROW_ADD(BIST_ROW_ADD_ts1[3:0]), 
                                         .BIST_COLLAR_EN0(BIST_COLLAR_EN0_ts1), 
                                         .BIST_RUN_TO_COLLAR0(BIST_RUN_TO_COLLAR0_ts1), 
                                         .BIST_ASYNC_RESET(BIST_ASYNC_RESET), 
                                         .to_interfaces_tck(to_interfaces_tck), 
                                         .BIST_TESTDATA_SELECT_TO_COLLAR(BIST_TESTDATA_SELECT_TO_COLLAR_ts1), 
                                         .BIST_ON_TO_COLLAR(BIST_ON_TO_COLLAR_ts1), 
                                         .BIST_WRITE_DATA(BIST_WRITE_DATA[1:0]), 
                                         .BIST_EXPECT_DATA(BIST_EXPECT_DATA[1:0]), 
                                         .CHKBCI_PHASE(CHKBCI_PHASE), 
                                         .BIST_SHIFT_COLLAR(BIST_SHIFT_COLLAR_ts1), 
                                         .BIST_COLLAR_SETUP(BIST_COLLAR_SETUP_ts1), 
                                         .BIST_CLEAR_DEFAULT(BIST_CLEAR_DEFAULT_ts1), 
                                         .BIST_CLEAR(BIST_CLEAR_ts1), 
                                         .BIST_COLLAR_HOLD(BIST_COLLAR_HOLD_ts1), 
                                         .FREEZE_STOP_ERROR(FREEZE_STOP_ERROR), 
                                         .ERROR_CNT_ZERO(ERROR_CNT_ZERO), 
                                         .MBISTPG_RESET_REG_SETUP2(MBISTPG_RESET_REG_SETUP2)
);

ram_256x16_test_1 RAM_256x16_TEST_INST_3(
       .a(ds_addrs[7:0]),
       .din(ds_data_tmp1[15:0]),
       .dout(ds_data[15:0]),
       .oe(t_read_ds),
       .wr(m_dsram_clk),
       .test_mode(test_mode), .BIST_SETUP(BIST_SETUP[0]), 
                                         .mcp_bounding_to_en(mcp_bounding_to_en), 
                                         .scan_to_en(scan_to_en), 
                                         .memory_bypass_to_en(memory_bypass_to_en), 
                                         .MEM1_BIST_COLLAR_SI(MEM1_BIST_COLLAR_SI), 
                                         .BIST_SO(BIST_SO_ts1), .BIST_GO(BIST_GO_ts1), 
                                         .BIST_COLLAR_DIAG_EN(BIST_COLLAR_DIAG_EN), 
                                         .ltest_to_en(ltest_to_en_ts1), 
                                         .BIST_WRITEENABLE(BIST_WRITEENABLE), 
                                         .BIST_SELECT(BIST_SELECT_ts1), 
                                         .BIST_CMP(BIST_CMP_ts1), 
                                         .INCLUDE_MEM_RESULTS_REG(INCLUDE_MEM_RESULTS_REG), 
                                         .BIST_COL_ADD(BIST_COL_ADD_ts1[3:0]), 
                                         .BIST_ROW_ADD(BIST_ROW_ADD_ts1[3:0]), 
                                         .BIST_COLLAR_EN1(BIST_COLLAR_EN1), 
                                         .BIST_RUN_TO_COLLAR1(BIST_RUN_TO_COLLAR1), 
                                         .BIST_ASYNC_RESET(BIST_ASYNC_RESET), 
                                         .to_interfaces_tck(to_interfaces_tck), 
                                         .BIST_TESTDATA_SELECT_TO_COLLAR(BIST_TESTDATA_SELECT_TO_COLLAR_ts1), 
                                         .BIST_ON_TO_COLLAR(BIST_ON_TO_COLLAR_ts1), 
                                         .BIST_WRITE_DATA(BIST_WRITE_DATA[1:0]), 
                                         .BIST_EXPECT_DATA(BIST_EXPECT_DATA[1:0]), 
                                         .CHKBCI_PHASE(CHKBCI_PHASE), 
                                         .BIST_SHIFT_COLLAR(BIST_SHIFT_COLLAR_ts1), 
                                         .BIST_COLLAR_SETUP(BIST_COLLAR_SETUP_ts1), 
                                         .BIST_CLEAR_DEFAULT(BIST_CLEAR_DEFAULT_ts1), 
                                         .BIST_CLEAR(BIST_CLEAR_ts1), 
                                         .BIST_COLLAR_HOLD(BIST_COLLAR_HOLD_ts1), 
                                         .FREEZE_STOP_ERROR(FREEZE_STOP_ERROR), 
                                         .ERROR_CNT_ZERO(ERROR_CNT_ZERO), 
                                         .MBISTPG_RESET_REG_SETUP2(MBISTPG_RESET_REG_SETUP2)
);

tdsp_ds_cs TDSP_DS_CS_INST(
    .clk(m_clk),
    .test_mode(test_mode),
	.address(t_addrs[7:0]),
	.write(t_write),
	.read(t_read),
	.reset(reset),
	.as(t_as),
	.port_as(port_as),
	.port_address(port_address[2:0]),
	.port_write(port_write),
	.port_read(port_write),
	.top_buf_flag(top_buf_flag),
	.t_write_ds(t_write_ds),
	.t_read_ds(t_read_ds),
	.t_write_d(t_write_d),
	.t_read_d(t_read_d),
	.t_write_rcc(rcc_clk),
	.t_address_ds(t_addrs_ds[7:0]),
	.bus_request_in(t_breq),
	.bus_grant_in(t_grant),
	.bus_request_out(t_breq_st),
	.bus_grant_out(t_grant_st)
);

data_sample_mux DATA_SAMPLE_MUX_INST(
	.d_addrs(d_addrs[7:0]),
	.d_datain(lpcm[15:0]),
	.d_wr(d_write),
	.t_addrs(t_addrs_ds[7:0]),
	.t_datain(tdsp_data_out[15:0]),
	.t_wr(t_write_ds),
	.write(ds_write),
	.addrs(ds_addrs[7:0]),
	.datain(ds_datain[15:0]),
	.t_grant(t_grant)
);

digit_reg DIGIT_REG_INST(
       .reset(reset),
       .clk(m_digit_clk),
       .digit_in(digit[7:0]),
       .digit_out(tdigit[7:0]),
       .flag_in(flag_out),
       .flag_out(tdigit_flag)
);

results_conv RESULTS_CONV_INST(
       .clk(m_clk),
       .reset(reset),
       .rcc_clk(m_rcc_clk),
       .address(t_addrs[3:0]),
       .din(tdsp_data_out[15:0]),
       .digit_clk(digit_clk),
       .dout(digit[7:0]),
       .dout_flag(flag_out),
       .test_mode(test_mode)
);

tdsp_data_mux TDSP_MUX (
       .mem_data (mem_data),
       .ds_data (ds_data),
       .t_data (tdsp_data_in),
       .t_read (t_read_d),
       .ds_read (t_read_ds)
);

tdsp_core TDSP_CORE_INST(
       .clk(m_clk),
       .reset(reset),
       .as(t_as),
       .read(t_read),
       .write(t_write),
       .write_h(t_write_h),
       .address(t_addrs[7:0]),
       .t_data_out(tdsp_data_out[15:0]),
       .t_data_in(tdsp_data_in[15:0]),
       .rom_data_in(rom_data[15:0]),
       .p_as(p_as),
       .p_read(p_read),
       .p_write(p_write),
       .p_write_h(o_p_write_h),
       .p_address(p_addrs[8:0]),
       .port_pad_data_out(port_pad_data_out[15:0]),
       .port_pad_data_in(port_pad_data_in[15:0]),
       .port_address(port_address[2:0]),
       .port_as(port_as),
       .port_read(port_read),
       .port_write(port_write),
       .port_write_h(port_write_h),
       .bus_request(t_breq),
       .bus_grant(t_grant_st),
       .bio(top_buf_flag),
       .t_sdi(t_sdi),
       .t_sdo(t_sdo),
       .int(int)
    );

ulaw_lin_conv ULAW_LIN_CONV_INST(
	.upcm(upcm[7:0]),
	.lpcm(lpcm[15:0])
);

arb ARB_INST(
	.reset(reset),
	.clk(m_clk),
	.dma_breq(dma_breq),
	.dma_grant(dma_grant),
	.tdsp_breq(t_breq_st),
	.tdsp_grant(t_grant)
);

dma DMA_INST(
	.clk(m_clk),
	.reset(reset),
	.dflag(dflag),
	.bgrant(dma_grant),
	.read_spi(read_spi),
	.breq(dma_breq),
	.a(d_addrs[7:0]),
	.as(d_as),
	.write(d_write),
	.top_buf_flag(top_buf_flag)
);

spi SPI_INST(
	.spi_clk(spi_clk),
	.m_spi_clk(m_spi_clk),
	.spi_fs(spi_fs),
	.spi_data(spi_data),
	.clk(m_clk),
	.reset(reset),
	.read(read_spi),
	.dflag(dflag),
	.dout(upcm[7:0]),
	.test_mode(test_mode)
);


  dtmf_recvr_core_rtl1_tessent_sib_1 dtmf_recvr_core_rtl1_tessent_sib_sti_inst(
      .ijtag_reset(ijtag_reset), .ijtag_sel(ijtag_sel), .ijtag_si(ijtag_si), .ijtag_ce(ijtag_ce), 
      .ijtag_se(ijtag_se), .ijtag_ue(ijtag_ue), .ijtag_tck(ijtag_tck), .ijtag_so(dtmf_recvr_core_rtl1_tessent_sib_sti_inst_so), 
      .ijtag_from_so(dtmf_recvr_core_rtl1_tessent_sib_mbist_inst_so), .ltest_si(1'b0), 
      .ltest_scan_en(1'b0), .ltest_en(1'b0), .ltest_clk(1'b0), .ltest_mem_bypass_en(1'b1), 
      .ltest_mcp_bounding_en(1'b0), .ltest_occ_en(1'b0), .ltest_async_set_reset_static_disable(1'b0), 
      .ltest_static_clock_control_mode(1'b0), .ltest_clock_sequence({1'b0, 
      1'b0}), .ijtag_to_tck(ijtag_to_tck), .ijtag_to_reset(ijtag_to_reset), .ijtag_to_si(dtmf_recvr_core_rtl1_tessent_sib_sti_inst_so_ts1), 
      .ijtag_to_ce(ijtag_to_ce), .ijtag_to_se(ijtag_to_se), .ijtag_to_ue(ijtag_to_ue), 
      .ltest_so(), .ltest_to_en(ltest_to_en), .ltest_to_mem_bypass_en(ltest_to_mem_bypass_en), 
      .ltest_to_mcp_bounding_en(ltest_to_mcp_bounding_en), .ltest_to_scan_en(ltest_to_scan_en), 
      .ijtag_to_sel(dtmf_recvr_core_rtl1_tessent_sib_sti_inst_to_select)
  );

  dtmf_recvr_core_rtl1_tessent_sib_2 dtmf_recvr_core_rtl1_tessent_sib_sri_inst(
      .ijtag_reset(ijtag_reset), .ijtag_sel(ijtag_sel), .ijtag_si(dtmf_recvr_core_rtl1_tessent_sib_sti_inst_so), 
      .ijtag_ce(ijtag_ce), .ijtag_se(ijtag_se), .ijtag_ue(ijtag_ue), .ijtag_tck(ijtag_tck), 
      .ijtag_so(ijtag_so), .ijtag_from_so(dtmf_recvr_core_rtl1_tessent_sib_sri_ctrl_inst_so), 
      .ijtag_to_sel(dtmf_recvr_core_rtl1_tessent_sib_sri_inst_to_select)
  );

  dtmf_recvr_core_rtl1_tessent_sib_3 dtmf_recvr_core_rtl1_tessent_sib_sri_ctrl_inst(
      .ijtag_reset(ijtag_reset), .ijtag_sel(dtmf_recvr_core_rtl1_tessent_sib_sri_inst_to_select), 
      .ijtag_si(dtmf_recvr_core_rtl1_tessent_sib_sti_inst_so), .ijtag_ce(ijtag_ce), 
      .ijtag_se(ijtag_se), .ijtag_ue(ijtag_ue), .ijtag_tck(ijtag_tck), .ijtag_so(dtmf_recvr_core_rtl1_tessent_sib_sri_ctrl_inst_so), 
      .ijtag_from_so(dtmf_recvr_core_rtl1_tessent_tdr_sri_ctrl_inst_so), .ijtag_to_sel(dtmf_recvr_core_rtl1_tessent_sib_sri_ctrl_inst_to_select)
  );

  dtmf_recvr_core_rtl1_tessent_tdr_sri_ctrl dtmf_recvr_core_rtl1_tessent_tdr_sri_ctrl_inst(
      .ijtag_reset(ijtag_reset), .ijtag_sel(dtmf_recvr_core_rtl1_tessent_sib_sri_ctrl_inst_to_select), 
      .ijtag_si(dtmf_recvr_core_rtl1_tessent_sib_sti_inst_so), .ijtag_ce(ijtag_ce), 
      .ijtag_se(ijtag_se), .ijtag_ue(ijtag_ue), .ijtag_tck(ijtag_tck), .all_test(all_test), 
      .test_mode(test_mode_ts1), .ijtag_so(dtmf_recvr_core_rtl1_tessent_tdr_sri_ctrl_inst_so)
  );

  dtmf_recvr_core_rtl1_tessent_sib_4 dtmf_recvr_core_rtl1_tessent_sib_mbist_inst(
      .ijtag_reset(ijtag_to_reset), .ijtag_sel(dtmf_recvr_core_rtl1_tessent_sib_sti_inst_to_select), 
      .ijtag_si(dtmf_recvr_core_rtl1_tessent_sib_sti_inst_so_ts1), .ijtag_ce(ijtag_to_ce), 
      .ijtag_se(ijtag_to_se), .ijtag_ue(ijtag_to_ue), .ijtag_tck(ijtag_to_tck), 
      .ijtag_so(dtmf_recvr_core_rtl1_tessent_sib_mbist_inst_so), .ijtag_from_so(dtmf_recvr_core_rtl1_tessent_mbist_bap_inst_so), 
      .ijtag_to_sel(ijtag_to_sel)
  );

  mux21 dft_ctrl_test_mode_mux2(
      .A0(test_mode), .A1(test_mode_ts1), .S0(all_test), .Y(dft_ctrl_test_mode_mux2_Y)
  );

  dtmf_recvr_core_rtl1_tessent_mbist_bap dtmf_recvr_core_rtl1_tessent_mbist_bap_inst(
      .reset(ijtag_to_reset), .ijtag_select(ijtag_to_sel), .si(dtmf_recvr_core_rtl1_tessent_sib_sti_inst_so_ts1), 
      .capture_en(ijtag_to_ce), .shift_en(ijtag_to_se), .shift_en_R(), .update_en(ijtag_to_ue), 
      .tck(ijtag_to_tck), .to_interfaces_tck(to_interfaces_tck), .to_controllers_tck(to_controllers_tck), 
      .mcp_bounding_en(ltest_to_mcp_bounding_en), .mcp_bounding_to_en(mcp_bounding_to_en), 
      .scan_en(ltest_to_scan_en), .scan_to_en(scan_to_en), .memory_bypass_en(ltest_to_mem_bypass_en), 
      .memory_bypass_to_en(memory_bypass_to_en), .ltest_en(ltest_to_en), .ltest_to_en(ltest_to_en_ts1), 
      .BIST_HOLD(BIST_HOLD), .ENABLE_MEM_RESET(ENABLE_MEM_RESET), .REDUCED_ADDRESS_COUNT(REDUCED_ADDRESS_COUNT), 
      .BIST_SELECT_TEST_DATA(BIST_SELECT_TEST_DATA), .BIST_ALGO_MODE0(BIST_ALGO_MODE0), 
      .BIST_ALGO_MODE1(BIST_ALGO_MODE1), .BIST_DIAG_EN(BIST_DIAG_EN), .BIST_ASYNC_RESET(BIST_ASYNC_RESET), 
      .FL_CNT_MODE0(FL_CNT_MODE0), .FL_CNT_MODE1(FL_CNT_MODE1), .INCLUDE_MEM_RESULTS_REG(INCLUDE_MEM_RESULTS_REG), 
      .CHAIN_BYPASS_EN(), .TCK_MODE(), .BIST_SETUP(BIST_SETUP[2:0]), .MBISTPG_GO({
      MBISTPG_GO_ts3, MBISTPG_GO_ts2, MBISTPG_GO_ts1, MBISTPG_GO}), .MBISTPG_DONE({
      MBISTPG_DONE_ts3, MBISTPG_DONE_ts2, MBISTPG_DONE_ts1, MBISTPG_DONE}), .bistEn(bistEn[3:0]), 
      .toBist(toBist[3:0]), .fromBist({MBISTPG_SO_ts3, MBISTPG_SO_ts2, 
      MBISTPG_SO_ts1, MBISTPG_SO}), .so(dtmf_recvr_core_rtl1_tessent_mbist_bap_inst_so)
  );

  dtmf_recvr_core_rtl1_tessent_mbist_c3_controller dtmf_recvr_core_rtl1_tessent_mbist_c3_controller_inst(
      .MBISTPG_MEM_RST(ENABLE_MEM_RESET), .MBISTPG_REDUCED_ADDR_CNT_EN(REDUCED_ADDRESS_COUNT), 
      .MEM_BYPASS_EN(memory_bypass_to_en), .MCP_BOUNDING_EN(mcp_bounding_to_en), 
      .MEM0_BIST_COLLAR_SO(BIST_SO_ts2), .BIST_COLLAR_GO(BIST_GO_ts2), .BIST_CLK(m_clk), 
      .BIST_SI(toBist[2]), .BIST_HOLD(BIST_HOLD), .BIST_SETUP2(BIST_SETUP_ts3), 
      .BIST_SETUP({BIST_SETUP_ts2, BIST_SETUP_ts1}), .MBISTPG_TESTDATA_SELECT(BIST_SELECT_TEST_DATA), 
      .TCK(to_controllers_tck), .MBISTPG_EN(bistEn[2]), .MBISTPG_ASYNC_RESETN(BIST_ASYNC_RESET), 
      .LV_TM(ltest_to_en_ts1), .BIST_COL_ADD(BIST_COL_ADD), .BIST_ROW_ADD(BIST_ROW_ADD), 
      .BIST_SHIFT_COLLAR(BIST_SHIFT_COLLAR), .BIST_TESTDATA_SELECT_TO_COLLAR(BIST_TESTDATA_SELECT_TO_COLLAR), 
      .MEM0_BIST_COLLAR_SI(MEM0_BIST_COLLAR_SI), .BIST_COLLAR_SETUP(BIST_COLLAR_SETUP), 
      .BIST_COLLAR_HOLD(BIST_COLLAR_HOLD), .BIST_CLEAR_DEFAULT(BIST_CLEAR_DEFAULT), 
      .BIST_CLEAR(BIST_CLEAR), .MBISTPG_COMPARE_MISR(MBISTPG_COMPARE_MISR), .MBISTPG_SO(MBISTPG_SO_ts2), 
      .BIST_SELECT(BIST_SELECT), .BIST_CMP(BIST_CMP), .BIST_COLLAR_EN0(BIST_COLLAR_EN0), 
      .BIST_RUN_TO_COLLAR0(BIST_RUN_TO_COLLAR0), .MBISTPG_GO(MBISTPG_GO_ts2), .MBISTPG_DONE(MBISTPG_DONE_ts2), 
      .BIST_ON_TO_COLLAR(BIST_ON_TO_COLLAR)
  );

  dtmf_recvr_core_rtl1_tessent_mbist_c3_interface_m1 ROM_512x16_0_INST_interface_inst(
      .MBISTPG_COMPARE_MISR(MBISTPG_COMPARE_MISR), .CEN_IN(1'b0), .A_IN(p_addrs[8:0]), 
      .Q_IN(ROM_512x16_0_INST_Q), .TCK(to_interfaces_tck), .BIST_CMP(BIST_CMP), 
      .INCLUDE_MEM_RESULTS_REG(INCLUDE_MEM_RESULTS_REG), .BIST_SELECT(BIST_SELECT), 
      .BIST_COL_ADD(BIST_COL_ADD), .BIST_ROW_ADD(BIST_ROW_ADD), .BIST_TESTDATA_SELECT_TO_COLLAR(BIST_TESTDATA_SELECT_TO_COLLAR), 
      .MEM_BYPASS_EN(memory_bypass_to_en), .SCAN_SHIFT_EN(scan_to_en), .MCP_BOUNDING_EN(mcp_bounding_to_en), 
      .BIST_ON(BIST_ON_TO_COLLAR), .BIST_RUN(BIST_RUN_TO_COLLAR0), .BIST_ASYNC_RESETN(BIST_ASYNC_RESET), 
      .BIST_CLK(m_clk), .BIST_SHIFT_COLLAR(BIST_SHIFT_COLLAR), .BIST_SI(MEM0_BIST_COLLAR_SI), 
      .BIST_COLLAR_SETUP(BIST_COLLAR_SETUP), .BIST_COLLAR_HOLD(BIST_COLLAR_HOLD), 
      .BIST_CLEAR_DEFAULT(BIST_CLEAR_DEFAULT), .BIST_CLEAR(BIST_CLEAR), .BIST_SETUP0(BIST_SETUP_ts1), 
      .LV_TM(ltest_to_en_ts1), .BIST_COLLAR_EN(BIST_COLLAR_EN0), .CEN(CEN), .A(ROM_512x16_0_INST_interface_inst_A), 
      .Q(rom_data[15:0]), .SCAN_OBS_FLOPS(), .BIST_SO(BIST_SO_ts2), .BIST_GO(BIST_GO_ts2)
  );

  dtmf_recvr_core_rtl1_tessent_mbist_c4_controller dtmf_recvr_core_rtl1_tessent_mbist_c4_controller_inst(
      .MBISTPG_ALGO_SEL(1'b0), .MBISTPG_ALGO_MODE({BIST_ALGO_MODE1, 
      BIST_ALGO_MODE0}), .MBISTPG_MEM_RST(ENABLE_MEM_RESET), .MBISTPG_REDUCED_ADDR_CNT_EN(REDUCED_ADDRESS_COUNT), 
      .MEM_BYPASS_EN(memory_bypass_to_en), .MCP_BOUNDING_EN(mcp_bounding_to_en), 
      .MEM0_BIST_COLLAR_SO(BIST_SO), .MEM1_BIST_COLLAR_SO(BIST_SO_ts1), .FL_CNT_MODE({
      FL_CNT_MODE1, FL_CNT_MODE0}), .BIST_COLLAR_GO({BIST_GO_ts1, BIST_GO}), .MBISTPG_DIAG_EN(BIST_DIAG_EN), 
      .BIST_CLK(m_dsram_clk), .BIST_SI(toBist[3]), .BIST_HOLD(BIST_HOLD), .BIST_SETUP2(BIST_SETUP_ts3), 
      .BIST_SETUP({BIST_SETUP_ts2, BIST_SETUP_ts1}), .MBISTPG_TESTDATA_SELECT(BIST_SELECT_TEST_DATA), 
      .TCK(to_controllers_tck), .MBISTPG_EN(bistEn[3]), .MBISTPG_ASYNC_RESETN(BIST_ASYNC_RESET), 
      .LV_TM(ltest_to_en_ts1), .MBISTPG_RESET_REG_SETUP2(MBISTPG_RESET_REG_SETUP2), 
      .BIST_COL_ADD(BIST_COL_ADD_ts1[3:0]), .BIST_ROW_ADD(BIST_ROW_ADD_ts1[3:0]), 
      .BIST_WRITE_DATA(BIST_WRITE_DATA[1:0]), .BIST_EXPECT_DATA(BIST_EXPECT_DATA[1:0]), 
      .BIST_SHIFT_COLLAR(BIST_SHIFT_COLLAR_ts1), .BIST_TESTDATA_SELECT_TO_COLLAR(BIST_TESTDATA_SELECT_TO_COLLAR_ts1), 
      .MEM0_BIST_COLLAR_SI(MEM0_BIST_COLLAR_SI_ts1), .MEM1_BIST_COLLAR_SI(MEM1_BIST_COLLAR_SI), 
      .BIST_COLLAR_SETUP(BIST_COLLAR_SETUP_ts1), .BIST_COLLAR_HOLD(BIST_COLLAR_HOLD_ts1), 
      .FREEZE_STOP_ERROR(FREEZE_STOP_ERROR), .ERROR_CNT_ZERO(ERROR_CNT_ZERO), .BIST_COLLAR_DIAG_EN(BIST_COLLAR_DIAG_EN), 
      .BIST_CLEAR_DEFAULT(BIST_CLEAR_DEFAULT_ts1), .BIST_CLEAR(BIST_CLEAR_ts1), 
      .MBISTPG_SO(MBISTPG_SO_ts3), .BIST_WRITEENABLE(BIST_WRITEENABLE), .BIST_SELECT(BIST_SELECT_ts1), 
      .BIST_CMP(BIST_CMP_ts1), .BIST_COLLAR_EN0(BIST_COLLAR_EN0_ts1), .BIST_RUN_TO_COLLAR0(BIST_RUN_TO_COLLAR0_ts1), 
      .BIST_COLLAR_EN1(BIST_COLLAR_EN1), .BIST_RUN_TO_COLLAR1(BIST_RUN_TO_COLLAR1), 
      .CHKBCI_PHASE(CHKBCI_PHASE), .MBISTPG_GO(MBISTPG_GO_ts3), .MBISTPG_DONE(MBISTPG_DONE_ts3), 
      .BIST_ON_TO_COLLAR(BIST_ON_TO_COLLAR_ts1)
  );

  assign BIST_SETUP_ts1 = BIST_SETUP[0];

  assign BIST_SETUP_ts2 = BIST_SETUP[1];

  assign BIST_SETUP_ts3 = BIST_SETUP[2];
endmodule