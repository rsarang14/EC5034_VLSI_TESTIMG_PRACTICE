//-------------------------------------------------
//  File created by: Tessent Shell
//          Version: 2022.4
//       Created on: Sat Oct 24 02:53:42 IST 2026
//-------------------------------------------------


Module dtmf_recvr_core {
   // Created by ICL extraction
   CaptureEnPort ijtag_ce;
   ResetPort ijtag_reset {
      ActivePolarity 0;
   }
   ShiftEnPort ijtag_se;
   SelectPort ijtag_sel;
   ScanInPort ijtag_si;
   ScanOutPort ijtag_so {
      Source dtmf_recvr_core_rtl1_tessent_sib_sri_inst.ijtag_so;
   }
   TCKPort ijtag_tck;
   UpdateEnPort ijtag_ue;
   ClockPort refclk {
      Attribute tessent_clock_domain_labels = "refclk refclk";
      Attribute tessent_clock_periods = "all 8.00ns";
   }
   ScanInterface ijtag {
      Port ijtag_ce;
      Port ijtag_reset;
      Port ijtag_se;
      Port ijtag_sel;
      Port ijtag_si;
      Port ijtag_so;
      Port ijtag_tck;
      Port ijtag_ue;
   }
   Attribute tessent_design_format = "verilog_2001";
   Attribute test_setup_procfile = "";
   Attribute icl_extraction_date = "Sat Oct 24 02:53:42 IST 2026";
   Attribute created_by_tessent_icl_extract = "true";
   Attribute tessent_design_id = "rtl1";
   Attribute tessent_design_level = "physical_block";
   Attribute tessent_is_physical_module = "true";
   Instance RAM_128x16_TEST_INST_RAM_128x16_INST Of ram_256x16A {
      InputPort A[7] = RAM_128x16_TEST_INST_RAM_128x16_INST_interface_inst.A[7];
      InputPort A[6] = RAM_128x16_TEST_INST_RAM_128x16_INST_interface_inst.A[6];
      InputPort A[5] = RAM_128x16_TEST_INST_RAM_128x16_INST_interface_inst.A[5];
      InputPort A[4] = RAM_128x16_TEST_INST_RAM_128x16_INST_interface_inst.A[4];
      InputPort A[3] = RAM_128x16_TEST_INST_RAM_128x16_INST_interface_inst.A[3];
      InputPort A[2] = RAM_128x16_TEST_INST_RAM_128x16_INST_interface_inst.A[2];
      InputPort A[1] = RAM_128x16_TEST_INST_RAM_128x16_INST_interface_inst.A[1];
      InputPort A[0] = RAM_128x16_TEST_INST_RAM_128x16_INST_interface_inst.A[0];
      InputPort CLK = add_clock_inst_1.ClockOut;
      Attribute tessent_design_instance = "RAM_128x16_TEST_INST/RAM_128x16_INST";

   }
   Instance RAM_128x16_TEST_INST_RAM_128x16_INST_interface_inst Of 
       dtmf_recvr_core_rtl1_tessent_mbist_c1_interface_m1 {
      InputPort BIST_CLK = add_clock_inst_1.ClockOut;
      InputPort BIST_COLLAR_EN = 
          RAM_128x16_TEST_INST_dtmf_recvr_core_rtl1_tessent_mbist_c1_controller_inst.BIST_COLLAR_EN0;

      InputPort BIST_ASYNC_RESETN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_ASYNC_RESET;
      InputPort BIST_SI = 
          RAM_128x16_TEST_INST_dtmf_recvr_core_rtl1_tessent_mbist_c1_controller_inst.MEM0_BIST_COLLAR_SI;

      InputPort BIST_SHIFT_COLLAR = 
          RAM_128x16_TEST_INST_dtmf_recvr_core_rtl1_tessent_mbist_c1_controller_inst.BIST_SHIFT_COLLAR;

      InputPort BIST_SETUP0 = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SETUP[0];
      InputPort MEM_BYPASS_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.memory_bypass_to_en;
      InputPort MCP_BOUNDING_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.mcp_bounding_to_en;
      InputPort INCLUDE_MEM_RESULTS_REG = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.INCLUDE_MEM_RESULTS_REG;
      Attribute tessent_design_instance = 
          "RAM_128x16_TEST_INST/RAM_128x16_INST_interface_inst";
   }
   Instance 
       RAM_128x16_TEST_INST_dtmf_recvr_core_rtl1_tessent_mbist_c1_controller_inst 
       Of dtmf_recvr_core_rtl1_tessent_mbist_c1_controller {
      InputPort BIST_CLK = add_clock_inst_1.ClockOut;
      InputPort MBISTPG_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.bistEn[0];
      InputPort LV_TM = dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.ltest_to_en;
      InputPort MEM_BYPASS_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.memory_bypass_to_en;
      InputPort MCP_BOUNDING_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.mcp_bounding_to_en;
      InputPort MBISTPG_ASYNC_RESETN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_ASYNC_RESET;
      InputPort MBISTPG_DIAG_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_DIAG_EN;
      InputPort BIST_SETUP2 = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SETUP[2];
      InputPort BIST_SETUP[1] = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SETUP[1];
      InputPort BIST_SETUP[0] = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SETUP[0];
      InputPort MBISTPG_REDUCED_ADDR_CNT_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.REDUCED_ADDRESS_COUNT;
      InputPort MBISTPG_MEM_RST = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.ENABLE_MEM_RESET;
      InputPort MBISTPG_TESTDATA_SELECT = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SELECT_TEST_DATA;
      InputPort FL_CNT_MODE[1] = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.FL_CNT_MODE1;
      InputPort FL_CNT_MODE[0] = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.FL_CNT_MODE0;
      InputPort MBISTPG_ALGO_MODE[1] = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_ALGO_MODE1;
      InputPort MBISTPG_ALGO_MODE[0] = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_ALGO_MODE0;
      InputPort TCK = dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ijtag_to_tck;
      InputPort BIST_SI = dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.toBist[0];
      InputPort BIST_HOLD = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_HOLD;
      InputPort MEM0_BIST_COLLAR_SO = 
          RAM_128x16_TEST_INST_RAM_128x16_INST_interface_inst.BIST_SO;
      Attribute tessent_design_instance = 
          "RAM_128x16_TEST_INST/dtmf_recvr_core_rtl1_tessent_mbist_c1_controller_inst"
          ;
   }
   Instance RAM_256x16_TEST_INST_1_RAM_256x16_INST Of ram_256x16A {
      InputPort A[7] = 
          RAM_256x16_TEST_INST_1_RAM_256x16_INST_interface_inst.A[7];
      InputPort A[6] = 
          RAM_256x16_TEST_INST_1_RAM_256x16_INST_interface_inst.A[6];
      InputPort A[5] = 
          RAM_256x16_TEST_INST_1_RAM_256x16_INST_interface_inst.A[5];
      InputPort A[4] = 
          RAM_256x16_TEST_INST_1_RAM_256x16_INST_interface_inst.A[4];
      InputPort A[3] = 
          RAM_256x16_TEST_INST_1_RAM_256x16_INST_interface_inst.A[3];
      InputPort A[2] = 
          RAM_256x16_TEST_INST_1_RAM_256x16_INST_interface_inst.A[2];
      InputPort A[1] = 
          RAM_256x16_TEST_INST_1_RAM_256x16_INST_interface_inst.A[1];
      InputPort A[0] = 
          RAM_256x16_TEST_INST_1_RAM_256x16_INST_interface_inst.A[0];
      InputPort CLK = add_clock_inst_0.ClockOut;
      Attribute tessent_design_instance = 
          "RAM_256x16_TEST_INST_1/RAM_256x16_INST";
   }
   Instance RAM_256x16_TEST_INST_1_RAM_256x16_INST_interface_inst Of 
       dtmf_recvr_core_rtl1_tessent_mbist_c2_interface_m1 {
      InputPort BIST_CLK = add_clock_inst_0.ClockOut;
      InputPort BIST_COLLAR_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst.BIST_COLLAR_EN0;
      InputPort BIST_ASYNC_RESETN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_ASYNC_RESET;
      InputPort BIST_SI = 
          dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst.MEM0_BIST_COLLAR_SI;

      InputPort BIST_SHIFT_COLLAR = 
          dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst.BIST_SHIFT_COLLAR;

      InputPort BIST_SETUP0 = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SETUP[0];
      InputPort MEM_BYPASS_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.memory_bypass_to_en;
      InputPort MCP_BOUNDING_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.mcp_bounding_to_en;
      InputPort INCLUDE_MEM_RESULTS_REG = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.INCLUDE_MEM_RESULTS_REG;
      Attribute tessent_design_instance = 
          "RAM_256x16_TEST_INST_1/RAM_256x16_INST_interface_inst";
   }
   Instance RAM_256x16_TEST_INST_2_RAM_256x16_INST Of ram_256x16A {
      InputPort A[7] = 
          RAM_256x16_TEST_INST_2_RAM_256x16_INST_interface_inst.A[7];
      InputPort A[6] = 
          RAM_256x16_TEST_INST_2_RAM_256x16_INST_interface_inst.A[6];
      InputPort A[5] = 
          RAM_256x16_TEST_INST_2_RAM_256x16_INST_interface_inst.A[5];
      InputPort A[4] = 
          RAM_256x16_TEST_INST_2_RAM_256x16_INST_interface_inst.A[4];
      InputPort A[3] = 
          RAM_256x16_TEST_INST_2_RAM_256x16_INST_interface_inst.A[3];
      InputPort A[2] = 
          RAM_256x16_TEST_INST_2_RAM_256x16_INST_interface_inst.A[2];
      InputPort A[1] = 
          RAM_256x16_TEST_INST_2_RAM_256x16_INST_interface_inst.A[1];
      InputPort A[0] = 
          RAM_256x16_TEST_INST_2_RAM_256x16_INST_interface_inst.A[0];
      InputPort CLK = add_clock_inst_0.ClockOut;
      Attribute tessent_design_instance = 
          "RAM_256x16_TEST_INST_2/RAM_256x16_INST";
   }
   Instance RAM_256x16_TEST_INST_2_RAM_256x16_INST_interface_inst Of 
       dtmf_recvr_core_rtl1_tessent_mbist_c2_interface_m1 {
      InputPort BIST_CLK = add_clock_inst_0.ClockOut;
      InputPort BIST_COLLAR_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst.BIST_COLLAR_EN1;
      InputPort BIST_ASYNC_RESETN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_ASYNC_RESET;
      InputPort BIST_SI = 
          dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst.MEM1_BIST_COLLAR_SI;

      InputPort BIST_SHIFT_COLLAR = 
          dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst.BIST_SHIFT_COLLAR;

      InputPort BIST_SETUP0 = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SETUP[0];
      InputPort MEM_BYPASS_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.memory_bypass_to_en;
      InputPort MCP_BOUNDING_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.mcp_bounding_to_en;
      InputPort INCLUDE_MEM_RESULTS_REG = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.INCLUDE_MEM_RESULTS_REG;
      Attribute tessent_design_instance = 
          "RAM_256x16_TEST_INST_2/RAM_256x16_INST_interface_inst";
   }
   Instance RAM_256x16_TEST_INST_3_RAM_256x16_INST Of ram_256x16A {
      InputPort A[7] = 
          RAM_256x16_TEST_INST_3_RAM_256x16_INST_interface_inst.A[7];
      InputPort A[6] = 
          RAM_256x16_TEST_INST_3_RAM_256x16_INST_interface_inst.A[6];
      InputPort A[5] = 
          RAM_256x16_TEST_INST_3_RAM_256x16_INST_interface_inst.A[5];
      InputPort A[4] = 
          RAM_256x16_TEST_INST_3_RAM_256x16_INST_interface_inst.A[4];
      InputPort A[3] = 
          RAM_256x16_TEST_INST_3_RAM_256x16_INST_interface_inst.A[3];
      InputPort A[2] = 
          RAM_256x16_TEST_INST_3_RAM_256x16_INST_interface_inst.A[2];
      InputPort A[1] = 
          RAM_256x16_TEST_INST_3_RAM_256x16_INST_interface_inst.A[1];
      InputPort A[0] = 
          RAM_256x16_TEST_INST_3_RAM_256x16_INST_interface_inst.A[0];
      InputPort CLK = add_clock_inst_0.ClockOut;
      Attribute tessent_design_instance = 
          "RAM_256x16_TEST_INST_3/RAM_256x16_INST";
   }
   Instance RAM_256x16_TEST_INST_3_RAM_256x16_INST_interface_inst Of 
       dtmf_recvr_core_rtl1_tessent_mbist_c2_interface_m1 {
      InputPort BIST_CLK = add_clock_inst_0.ClockOut;
      InputPort BIST_COLLAR_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst.BIST_COLLAR_EN2;
      InputPort BIST_ASYNC_RESETN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_ASYNC_RESET;
      InputPort BIST_SI = 
          dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst.MEM2_BIST_COLLAR_SI;

      InputPort BIST_SHIFT_COLLAR = 
          dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst.BIST_SHIFT_COLLAR;

      InputPort BIST_SETUP0 = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SETUP[0];
      InputPort MEM_BYPASS_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.memory_bypass_to_en;
      InputPort MCP_BOUNDING_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.mcp_bounding_to_en;
      InputPort INCLUDE_MEM_RESULTS_REG = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.INCLUDE_MEM_RESULTS_REG;
      Attribute tessent_design_instance = 
          "RAM_256x16_TEST_INST_3/RAM_256x16_INST_interface_inst";
   }
   Instance ROM_512x16_0_INST Of rom_512x16A {
      InputPort A[8] = ROM_512x16_0_INST_interface_inst.A[8];
      InputPort A[7] = ROM_512x16_0_INST_interface_inst.A[7];
      InputPort A[6] = ROM_512x16_0_INST_interface_inst.A[6];
      InputPort A[5] = ROM_512x16_0_INST_interface_inst.A[5];
      InputPort A[4] = ROM_512x16_0_INST_interface_inst.A[4];
      InputPort A[3] = ROM_512x16_0_INST_interface_inst.A[3];
      InputPort A[2] = ROM_512x16_0_INST_interface_inst.A[2];
      InputPort A[1] = ROM_512x16_0_INST_interface_inst.A[1];
      InputPort A[0] = ROM_512x16_0_INST_interface_inst.A[0];
      InputPort CLK = add_clock_inst_2.ClockOut;
      Attribute tessent_design_instance = "ROM_512x16_0_INST";
   }
   Instance ROM_512x16_0_INST_interface_inst Of 
       dtmf_recvr_core_rtl1_tessent_mbist_c3_interface_m1 {
      InputPort BIST_CLK = add_clock_inst_2.ClockOut;
      InputPort BIST_COLLAR_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_c3_controller_inst.BIST_COLLAR_EN0;
      InputPort BIST_ASYNC_RESETN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_ASYNC_RESET;
      InputPort BIST_SI = 
          dtmf_recvr_core_rtl1_tessent_mbist_c3_controller_inst.MEM0_BIST_COLLAR_SI;

      InputPort BIST_SHIFT_COLLAR = 
          dtmf_recvr_core_rtl1_tessent_mbist_c3_controller_inst.BIST_SHIFT_COLLAR;

      InputPort BIST_SETUP0 = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SETUP[0];
      InputPort MEM_BYPASS_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.memory_bypass_to_en;
      InputPort MCP_BOUNDING_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.mcp_bounding_to_en;
      InputPort INCLUDE_MEM_RESULTS_REG = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.INCLUDE_MEM_RESULTS_REG;
      Attribute tessent_design_instance = "ROM_512x16_0_INST_interface_inst";
   }
   Instance add_clock_inst_0 Of dtmf_recvr_core_add_clock_0 {
      InputPort ClockIn = refclk;
      Attribute tessent_clock_domain_labels = 
          "m_dsram_clk {TEST_CONTROL_INST/m_dsram_clk}";
   }
   Instance add_clock_inst_1 Of dtmf_recvr_core_add_clock_1 {
      InputPort ClockIn = refclk;
      Attribute tessent_clock_domain_labels = 
          "m_ram_clk {TEST_CONTROL_INST/m_ram_clk}";
   }
   Instance add_clock_inst_2 Of dtmf_recvr_core_add_clock_2 {
      InputPort ClockIn = refclk;
      Attribute tessent_clock_domain_labels = "m_clk {TEST_CONTROL_INST/m_clk}";
   }
   Instance dtmf_recvr_core_rtl1_tessent_mbist_bap_inst Of 
       dtmf_recvr_core_rtl1_tessent_mbist_bap {
      InputPort reset = dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ijtag_to_reset;

      InputPort ijtag_select = 
          dtmf_recvr_core_rtl1_tessent_sib_mbist_inst.ijtag_to_sel;
      InputPort si = dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ijtag_to_si;
      InputPort capture_en = 
          dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ijtag_to_ce;
      InputPort shift_en = dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ijtag_to_se;

      InputPort update_en = 
          dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ijtag_to_ue;
      InputPort tck = dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ijtag_to_tck;
      InputPort memory_bypass_en = 
          dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ltest_to_mem_bypass_en;
      InputPort mcp_bounding_en = 
          dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ltest_to_mcp_bounding_en;
      InputPort ltest_en = dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ltest_to_en;

      InputPort fromBist[2] = 
          dtmf_recvr_core_rtl1_tessent_mbist_c3_controller_inst.MBISTPG_SO;
      InputPort fromBist[1] = 
          dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst.MBISTPG_SO;
      InputPort fromBist[0] = 
          RAM_128x16_TEST_INST_dtmf_recvr_core_rtl1_tessent_mbist_c1_controller_inst.MBISTPG_SO;

      InputPort MBISTPG_GO[2] = 
          dtmf_recvr_core_rtl1_tessent_mbist_c3_controller_inst.MBISTPG_GO;
      InputPort MBISTPG_GO[1] = 
          dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst.MBISTPG_GO;
      InputPort MBISTPG_GO[0] = 
          RAM_128x16_TEST_INST_dtmf_recvr_core_rtl1_tessent_mbist_c1_controller_inst.MBISTPG_GO;

      InputPort MBISTPG_DONE[2] = 
          dtmf_recvr_core_rtl1_tessent_mbist_c3_controller_inst.MBISTPG_DONE;
      InputPort MBISTPG_DONE[1] = 
          dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst.MBISTPG_DONE;
      InputPort MBISTPG_DONE[0] = 
          RAM_128x16_TEST_INST_dtmf_recvr_core_rtl1_tessent_mbist_c1_controller_inst.MBISTPG_DONE;

      Attribute tessent_design_instance = 
          "dtmf_recvr_core_rtl1_tessent_mbist_bap_inst";
   }
   Instance dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst Of 
       dtmf_recvr_core_rtl1_tessent_mbist_c2_controller {
      InputPort BIST_CLK = add_clock_inst_0.ClockOut;
      InputPort MBISTPG_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.bistEn[1];
      InputPort LV_TM = dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.ltest_to_en;
      InputPort MEM_BYPASS_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.memory_bypass_to_en;
      InputPort MCP_BOUNDING_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.mcp_bounding_to_en;
      InputPort MBISTPG_ASYNC_RESETN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_ASYNC_RESET;
      InputPort MBISTPG_DIAG_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_DIAG_EN;
      InputPort BIST_SETUP2 = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SETUP[2];
      InputPort BIST_SETUP[1] = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SETUP[1];
      InputPort BIST_SETUP[0] = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SETUP[0];
      InputPort MBISTPG_REDUCED_ADDR_CNT_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.REDUCED_ADDRESS_COUNT;
      InputPort MBISTPG_MEM_RST = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.ENABLE_MEM_RESET;
      InputPort MBISTPG_TESTDATA_SELECT = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SELECT_TEST_DATA;
      InputPort FL_CNT_MODE[1] = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.FL_CNT_MODE1;
      InputPort FL_CNT_MODE[0] = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.FL_CNT_MODE0;
      InputPort MBISTPG_ALGO_MODE[1] = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_ALGO_MODE1;
      InputPort MBISTPG_ALGO_MODE[0] = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_ALGO_MODE0;
      InputPort TCK = dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ijtag_to_tck;
      InputPort BIST_SI = dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.toBist[1];
      InputPort BIST_HOLD = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_HOLD;
      InputPort MEM0_BIST_COLLAR_SO = 
          RAM_256x16_TEST_INST_1_RAM_256x16_INST_interface_inst.BIST_SO;
      InputPort MEM1_BIST_COLLAR_SO = 
          RAM_256x16_TEST_INST_2_RAM_256x16_INST_interface_inst.BIST_SO;
      InputPort MEM2_BIST_COLLAR_SO = 
          RAM_256x16_TEST_INST_3_RAM_256x16_INST_interface_inst.BIST_SO;
      Attribute tessent_design_instance = 
          "dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst";
   }
   Instance dtmf_recvr_core_rtl1_tessent_mbist_c3_controller_inst Of 
       dtmf_recvr_core_rtl1_tessent_mbist_c3_controller {
      InputPort BIST_CLK = add_clock_inst_2.ClockOut;
      InputPort MBISTPG_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.bistEn[2];
      InputPort LV_TM = dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.ltest_to_en;
      InputPort MEM_BYPASS_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.memory_bypass_to_en;
      InputPort MCP_BOUNDING_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.mcp_bounding_to_en;
      InputPort MBISTPG_ASYNC_RESETN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_ASYNC_RESET;
      InputPort BIST_SETUP2 = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SETUP[2];
      InputPort BIST_SETUP[1] = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SETUP[1];
      InputPort BIST_SETUP[0] = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SETUP[0];
      InputPort MBISTPG_REDUCED_ADDR_CNT_EN = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.REDUCED_ADDRESS_COUNT;
      InputPort MBISTPG_MEM_RST = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.ENABLE_MEM_RESET;
      InputPort MBISTPG_TESTDATA_SELECT = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_SELECT_TEST_DATA;
      InputPort TCK = dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ijtag_to_tck;
      InputPort BIST_SI = dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.toBist[2];
      InputPort BIST_HOLD = 
          dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.BIST_HOLD;
      InputPort MEM0_BIST_COLLAR_SO = ROM_512x16_0_INST_interface_inst.BIST_SO;
      Attribute tessent_design_instance = 
          "dtmf_recvr_core_rtl1_tessent_mbist_c3_controller_inst";
   }
   Instance dtmf_recvr_core_rtl1_tessent_sib_mbist_inst Of 
       dtmf_recvr_core_rtl1_tessent_sib_4 {
      InputPort ijtag_reset = 
          dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ijtag_to_reset;
      InputPort ijtag_sel = 
          dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ijtag_to_sel;
      InputPort ijtag_si = dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ijtag_to_si;

      InputPort ijtag_ce = dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ijtag_to_ce;

      InputPort ijtag_se = dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ijtag_to_se;

      InputPort ijtag_ue = dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ijtag_to_ue;

      InputPort ijtag_tck = 
          dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ijtag_to_tck;
      InputPort ijtag_from_so = dtmf_recvr_core_rtl1_tessent_mbist_bap_inst.so;
      Attribute tessent_design_instance = 
          "dtmf_recvr_core_rtl1_tessent_sib_mbist_inst";
   }
   Instance dtmf_recvr_core_rtl1_tessent_sib_sri_ctrl_inst Of 
       dtmf_recvr_core_rtl1_tessent_sib_3 {
      InputPort ijtag_reset = ijtag_reset;
      InputPort ijtag_sel = 
          dtmf_recvr_core_rtl1_tessent_sib_sri_inst.ijtag_to_sel;
      InputPort ijtag_si = dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ijtag_so;
      InputPort ijtag_ce = ijtag_ce;
      InputPort ijtag_se = ijtag_se;
      InputPort ijtag_ue = ijtag_ue;
      InputPort ijtag_tck = ijtag_tck;
      InputPort ijtag_from_so = 
          dtmf_recvr_core_rtl1_tessent_tdr_sri_ctrl_inst.ijtag_so;
      Attribute tessent_design_instance = 
          "dtmf_recvr_core_rtl1_tessent_sib_sri_ctrl_inst";
   }
   Instance dtmf_recvr_core_rtl1_tessent_sib_sri_inst Of 
       dtmf_recvr_core_rtl1_tessent_sib_2 {
      InputPort ijtag_reset = ijtag_reset;
      InputPort ijtag_sel = ijtag_sel;
      InputPort ijtag_si = dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ijtag_so;
      InputPort ijtag_ce = ijtag_ce;
      InputPort ijtag_se = ijtag_se;
      InputPort ijtag_ue = ijtag_ue;
      InputPort ijtag_tck = ijtag_tck;
      InputPort ijtag_from_so = 
          dtmf_recvr_core_rtl1_tessent_sib_sri_ctrl_inst.ijtag_so;
      Attribute tessent_design_instance = 
          "dtmf_recvr_core_rtl1_tessent_sib_sri_inst";
   }
   Instance dtmf_recvr_core_rtl1_tessent_sib_sti_inst Of 
       dtmf_recvr_core_rtl1_tessent_sib_1 {
      InputPort ijtag_reset = ijtag_reset;
      InputPort ijtag_sel = ijtag_sel;
      InputPort ijtag_si = ijtag_si;
      InputPort ijtag_ce = ijtag_ce;
      InputPort ijtag_se = ijtag_se;
      InputPort ijtag_ue = ijtag_ue;
      InputPort ijtag_tck = ijtag_tck;
      InputPort ijtag_from_so = 
          dtmf_recvr_core_rtl1_tessent_sib_mbist_inst.ijtag_so;
      InputPort ltest_en = 'b0;
      InputPort ltest_occ_en = 'b0;
      InputPort ltest_static_clock_control_mode = 'b0;
      InputPort ltest_clock_sequence[1] = 'b0;
      InputPort ltest_clock_sequence[0] = 'b0;
      InputPort ltest_mem_bypass_en = 'b1;
      InputPort ltest_mcp_bounding_en = 'b0;
      Attribute tessent_design_instance = 
          "dtmf_recvr_core_rtl1_tessent_sib_sti_inst";
   }
   Instance dtmf_recvr_core_rtl1_tessent_tdr_sri_ctrl_inst Of 
       dtmf_recvr_core_rtl1_tessent_tdr_sri_ctrl {
      InputPort ijtag_reset = ijtag_reset;
      InputPort ijtag_sel = 
          dtmf_recvr_core_rtl1_tessent_sib_sri_ctrl_inst.ijtag_to_sel;
      InputPort ijtag_si = dtmf_recvr_core_rtl1_tessent_sib_sti_inst.ijtag_so;
      InputPort ijtag_ce = ijtag_ce;
      InputPort ijtag_se = ijtag_se;
      InputPort ijtag_ue = ijtag_ue;
      InputPort ijtag_tck = ijtag_tck;
      Attribute tessent_design_instance = 
          "dtmf_recvr_core_rtl1_tessent_tdr_sri_ctrl_inst";
   }
}

// instanced as dtmf_recvr_core.RAM_128x16_TEST_INST_RAM_128x16_INST
// instanced as dtmf_recvr_core.RAM_256x16_TEST_INST_1_RAM_256x16_INST
// instanced as dtmf_recvr_core.RAM_256x16_TEST_INST_2_RAM_256x16_INST
// instanced as dtmf_recvr_core.RAM_256x16_TEST_INST_3_RAM_256x16_INST
Module ram_256x16A {
   // ICL module read from source on or near line 17 of file '/home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/ram_256x16A.icl'
   DataInPort A[7:0] {
      Attribute connection_rule_option = "allowed_no_source";
      Attribute tessent_memory_bist_function = "address";
   }
   ClockPort CLK;
   Attribute tessent_use_in_dft_specification = "false";
   Attribute keep_active_during_scan_test = "false";
   Attribute tessent_memory_module = "without_internal_scan_logic";
}

// instanced as dtmf_recvr_core.RAM_128x16_TEST_INST_RAM_128x16_INST_interface_inst
Module dtmf_recvr_core_rtl1_tessent_mbist_c1_interface_m1 {
   // ICL module read from source on or near line 25 of file '/home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/dtmf_recvr_core_rtl1_tessent_mbist_c1_interface_m1.icl'
   ClockPort BIST_CLK;
   DataInPort BIST_COLLAR_EN;
   DataInPort BIST_ASYNC_RESETN;
   ScanInPort BIST_SI;
   ScanOutPort BIST_SO {
      Source BIST_SO_INT;
   }
   ShiftEnPort BIST_SHIFT_COLLAR;
   DataInPort BIST_SETUP0;
   DataInPort MEM_BYPASS_EN {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort MCP_BOUNDING_EN {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort INCLUDE_MEM_RESULTS_REG;
   DataOutPort A[7:0] {
      Attribute connection_rule_option = "allowed_no_destination";
      Attribute tessent_memory_bist_function = "address";
   }
   Attribute tessent_instrument_type = "mentor::memory_bist";
   Attribute tessent_instrument_subtype = "memory_interface";
   Attribute tessent_signature = "2b77fca56ac79e72614846ff14ee3cc6";
   Attribute tessent_ignore_during_icl_verification = "on";
   Attribute keep_active_during_scan_test = "false";
   Attribute tessent_use_in_dft_specification = "false";
   Attribute tessent_bist_input_select_persistent_cell_output_list = 
       "tessent_persistent_cell_BIST_INPUT_SELECT_INT/Y";
   Attribute tessent_async_bypass_persistent_cell_input_list = "";
   Attribute tessent_bist_clk_persistent_cell_output_list = 
       "tessent_persistent_cell_GATING_BIST_CLK/GCK";
   Attribute tessent_memory_output_is_tristate = "false";
   Attribute tessent_memory_control_inputs_list = "CEN SELECT ACTIVELOW";
   Attribute tessent_memory_test_inputs_list = "";
   Attribute tessent_memory_test_outputs_list = "";
   Attribute tessent_memory_control_inputs_di_coverage_list = "partial";
   Alias GO_ID_REG_BYPASS_SOURCE = BIST_SI {
   }
   Alias BIST_SO_INT = FREEZE_STOP_ERROR_REG[0] {
   }
   ScanRegister GO_ID_REG[15:0] {
      ScanInSource BIST_SI;
   }
   ScanRegister FREEZE_STOP_ERROR_REG[0:0] {
      ScanInSource GO_ID_REG_BYPASS_MUX;
   }
   ScanMux GO_ID_REG_BYPASS_MUX SelectedBy INCLUDE_MEM_RESULTS_REG {
      1'b0 : GO_ID_REG_BYPASS_SOURCE;
      1'b1 : GO_ID_REG[0];
   }
}

// instanced as dtmf_recvr_core.RAM_128x16_TEST_INST_dtmf_recvr_core_rtl1_tessent_mbist_c1_controller_inst
Module dtmf_recvr_core_rtl1_tessent_mbist_c1_controller {
   // ICL module read from source on or near line 26 of file '/home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/dtmf_recvr_core_rtl1_tessent_mbist_c1_controller.icl'
   ClockPort BIST_CLK;
   DataInPort MBISTPG_EN;
   DataInPort LV_TM {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort MEM_BYPASS_EN {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort MCP_BOUNDING_EN {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort MBISTPG_ASYNC_RESETN {
      RefEnum AsyncResetN;
   }
   DataInPort MBISTPG_DIAG_EN;
   DataInPort BIST_SETUP2;
   DataInPort BIST_SETUP[1:0];
   DataInPort MBISTPG_REDUCED_ADDR_CNT_EN {
      RefEnum OnOff;
   }
   DataInPort MBISTPG_MEM_RST {
      RefEnum OnOff;
   }
   DataInPort MBISTPG_TESTDATA_SELECT {
      RefEnum OnOff;
   }
   DataInPort FL_CNT_MODE[1:0];
   DataInPort MBISTPG_ALGO_MODE[1:0];
   DataOutPort MBISTPG_GO {
      RefEnum PassFail;
   }
   DataOutPort MBISTPG_DONE {
      RefEnum PassFail;
   }
   TCKPort TCK;
   ScanInPort BIST_SI;
   ScanOutPort MBISTPG_SO {
      Source BIST_SO_INT;
   }
   ShiftEnPort BIST_HOLD;
   ToShiftEnPort BIST_SHIFT_COLLAR {
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort BIST_COLLAR_EN0 {
      Attribute tessent_memory_alias = "m1";
   }
   ScanOutPort MEM0_BIST_COLLAR_SI {
      Source MEM0_BIST_COLLAR_SI_INT;
   }
   ScanInPort MEM0_BIST_COLLAR_SO;
   ScanInterface Client {
      Port BIST_SI;
      Port MBISTPG_SO;
      Port BIST_HOLD;
   }
   ScanInterface MEM0_INTERFACE {
      Port BIST_SHIFT_COLLAR;
      Port MEM0_BIST_COLLAR_SI;
      Port MEM0_BIST_COLLAR_SO;
   }
   Attribute tessent_instrument_container = "dtmf_recvr_core_rtl1_mbist";
   Attribute tessent_instrument_type = "mentor::memory_bist";
   Attribute tessent_instrument_subtype = "controller";
   Attribute tessent_signature = "0d7945d4970a7ac320e8fbeb77f2083b";
   Attribute tessent_ignore_during_icl_verification = "on";
   Attribute keep_active_during_scan_test = "false";
   Attribute tessent_use_in_dft_specification = "false";
   Attribute tessent_bist_clk_persistent_cell_output_list = 
       "tessent_persistent_cell_GATING_BIST_CLK/GCK";
   Alias SETUP_MODE[2:0] = BIST_SETUP2, BIST_SETUP[1:0] {
      RefEnum SetupModes;
   }
   Alias RUN_MODE[2:0] = BIST_SETUP2, BIST_SETUP[1:0] {
      RefEnum RunModes;
   }
   Alias INST_POINTER_REG[5:0] = INST_POINTER_REG_HW[5:0] {
   }
   Alias A_ADD_REG_Y[3:0] = A_ADD_REG_Y_HW[3:0] {
   }
   Alias A_ADD_REG_X[3:0] = A_ADD_REG_X_HW[3:0] {
   }
   Alias B_ADD_REG_Y[3:0] = B_ADD_REG_Y_HW[3:0] {
   }
   Alias B_ADD_REG_X[3:0] = B_ADD_REG_X_HW[3:0] {
   }
   Alias JCNT[2:0] = JCNT_HW[2:0] {
   }
   Alias WDATA_REG[1:0] = WDATA_REG_HW[1:0] {
   }
   Alias EDATA_REG[1:0] = EDATA_REG_HW[1:0] {
   }
   Alias REPEATLOOP_A_CNTR_REG[1:0] = REPEATLOOP_A_CNTR_REG_HW[1:0] {
   }
   Alias REPEATLOOP_B_CNTR_REG[1:0] = REPEATLOOP_B_CNTR_REG_HW[1:0] {
   }
   Alias MEM0_BIST_COLLAR_SI_INT = REPEATLOOP_B_CNTR_REG_HW[1] {
   }
   Alias STOP_ERROR_CNT_REG[11:0] = STOP_ERROR_CNT_REG_HW[11:0] {
   }
   Alias BIST_SO_INT = BIST_SO_Pipeline {
   }
   Enum PassFail {
      Pass = 1'b1;
      Fail = 1'b0;
      Ignore = 1'bx;
   }
   Enum AsyncResetN {
      On = 1'b0;
      Off = 1'b1;
   }
   Enum SetupModes {
      Short = 3'b000;
      Long = 3'b001;
   }
   Enum OnOff {
      On = 1'b1;
      Off = 1'b0;
   }
   Enum RunModes {
      HWDefault = 3'b010;
      RunTimeProg = 3'b011;
      Idle = 3'bx0x;
      Off = 3'bxxx;
   }
   ScanRegister BIST_SI_Pipeline {
      ScanInSource BIST_SI;
      ResetValue 1'b0;
   }
   ScanRegister DIAG_EN_REG[0:0] {
      ScanInSource BIST_SI_Pipeline;
   }
   ScanRegister CMP_EN_MASK_EN[0:0] {
      ScanInSource DIAG_EN_REG[0];
   }
   ScanRegister CMP_EN_PARITY[0:0] {
      ScanInSource CMP_EN_MASK_EN[0];
      CaptureSource 1'bx;
   }
   ScanRegister MEM_SELECT_REG0[0:0] {
      ScanInSource CMP_EN_PARITY[0];
      ResetValue 1'd1;
   }
   ScanRegister REDUCED_ADDR_CNT_EN_REG[0:0] {
      ScanInSource MEM_SELECT_REG0[0];
      RefEnum OnOff;
   }
   ScanRegister ALGO_SEL_CNT_REG[0:0] {
      ScanInSource REDUCED_ADDR_CNT_EN_REG[0];
      RefEnum OnOff;
   }
   ScanRegister SELECT_COMMON_OPSET_REG[0:0] {
      ScanInSource ALGO_SEL_CNT_REG[0];
      RefEnum OnOff;
   }
   ScanRegister SELECT_COMMON_DATA_PAT_REG[0:0] {
      ScanInSource SELECT_COMMON_OPSET_REG[0];
      RefEnum OnOff;
   }
   ScanRegister MICROCODE_EN_REG[0:0] {
      ScanInSource SELECT_COMMON_DATA_PAT_REG[0];
   }
   ScanRegister INST_POINTER_REG_HW[0:5] {
      ScanInSource MICROCODE_EN_REG[0];
   }
   ScanRegister A_ADD_REG_Y_HW[0:3] {
      ScanInSource INST_POINTER_REG_HW[5];
   }
   ScanRegister A_ADD_REG_X_HW[0:3] {
      ScanInSource A_ADD_REG_Y_HW[3];
   }
   ScanRegister B_ADD_REG_Y_HW[0:3] {
      ScanInSource A_ADD_REG_X_HW[3];
   }
   ScanRegister B_ADD_REG_X_HW[0:3] {
      ScanInSource B_ADD_REG_Y_HW[3];
   }
   ScanRegister JCNT_HW[0:2] {
      ScanInSource B_ADD_REG_X_HW[3];
   }
   ScanRegister OPSET_SELECT_REG[0:0] {
      ScanInSource JCNT_HW[2];
   }
   ScanRegister WDATA_REG_HW[0:1] {
      ScanInSource OPSET_SELECT_REG[0];
   }
   ScanRegister EDATA_REG_HW[0:1] {
      ScanInSource WDATA_REG_HW[1];
   }
   ScanRegister X_ADDR_BIT_SEL_REG[0:0] {
      ScanInSource EDATA_REG_HW[1];
   }
   ScanRegister Y_ADDR_BIT_SEL_REG[0:0] {
      ScanInSource X_ADDR_BIT_SEL_REG[0];
   }
   ScanRegister REPEATLOOP_A_CNTR_REG_HW[0:1] {
      ScanInSource Y_ADDR_BIT_SEL_REG[0];
   }
   ScanRegister REPEATLOOP_B_CNTR_REG_HW[0:1] {
      ScanInSource REPEATLOOP_A_CNTR_REG_HW[1];
   }
   ScanRegister STOP_ON_ERROR_REG[0:0] {
      ScanInSource MEM0_BIST_COLLAR_SO;
   }
   ScanRegister FREEZE_STOP_ERROR_REG[0:0] {
      ScanInSource STOP_ON_ERROR_REG[0];
   }
   ScanRegister STOP_ERROR_CNT_REG_HW[0:11] {
      ScanInSource FREEZE_STOP_ERROR_REG[0];
   }
   ScanRegister BIST_SO_Pipeline {
      ScanInSource BIST_SO_OUT;
      ResetValue 1'b0;
   }
   ScanMux CONTROLLER_SETUP_CHAIN SelectedBy MBISTPG_EN, SETUP_MODE[2:0] {
      1'b1, 3'b00x : STOP_ERROR_CNT_REG_HW[11];
   }
   ScanMux BIST_SO_OUT SelectedBy LV_TM, MBISTPG_ASYNC_RESETN {
      2'b01 : CONTROLLER_SETUP_CHAIN;
   }
   LogicSignal LONG_SETUP {
      MBISTPG_EN, SETUP_MODE[2:0] == 1'b1, 3'b001;
   }
   LogicSignal SHORT_SETUP {
      MBISTPG_EN, SETUP_MODE[2:0] == 1'b1, 3'b000;
   }
}

// instanced as dtmf_recvr_core.RAM_256x16_TEST_INST_1_RAM_256x16_INST_interface_inst
// instanced as dtmf_recvr_core.RAM_256x16_TEST_INST_2_RAM_256x16_INST_interface_inst
// instanced as dtmf_recvr_core.RAM_256x16_TEST_INST_3_RAM_256x16_INST_interface_inst
Module dtmf_recvr_core_rtl1_tessent_mbist_c2_interface_m1 {
   // ICL module read from source on or near line 25 of file '/home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/dtmf_recvr_core_rtl1_tessent_mbist_c2_interface_m1.icl'
   ClockPort BIST_CLK;
   DataInPort BIST_COLLAR_EN;
   DataInPort BIST_ASYNC_RESETN;
   ScanInPort BIST_SI;
   ScanOutPort BIST_SO {
      Source BIST_SO_INT;
   }
   ShiftEnPort BIST_SHIFT_COLLAR;
   DataInPort BIST_SETUP0;
   DataInPort MEM_BYPASS_EN {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort MCP_BOUNDING_EN {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort INCLUDE_MEM_RESULTS_REG;
   DataOutPort A[7:0] {
      Attribute connection_rule_option = "allowed_no_destination";
      Attribute tessent_memory_bist_function = "address";
   }
   Attribute tessent_instrument_type = "mentor::memory_bist";
   Attribute tessent_instrument_subtype = "memory_interface";
   Attribute tessent_signature = "b4eb696b18dd307427dfa255f2bd97a0";
   Attribute tessent_ignore_during_icl_verification = "on";
   Attribute keep_active_during_scan_test = "false";
   Attribute tessent_use_in_dft_specification = "false";
   Attribute tessent_bist_input_select_persistent_cell_output_list = 
       "tessent_persistent_cell_BIST_INPUT_SELECT_INT/Y";
   Attribute tessent_async_bypass_persistent_cell_input_list = "";
   Attribute tessent_bist_clk_persistent_cell_output_list = 
       "tessent_persistent_cell_GATING_BIST_CLK/GCK";
   Attribute tessent_memory_output_is_tristate = "false";
   Attribute tessent_memory_control_inputs_list = "CEN SELECT ACTIVELOW";
   Attribute tessent_memory_test_inputs_list = "";
   Attribute tessent_memory_test_outputs_list = "";
   Attribute tessent_memory_control_inputs_di_coverage_list = "partial";
   Alias GO_ID_REG_BYPASS_SOURCE = BIST_SI {
   }
   Alias BIST_SO_INT = FREEZE_STOP_ERROR_REG[0] {
   }
   ScanRegister GO_ID_REG[15:0] {
      ScanInSource BIST_SI;
   }
   ScanRegister FREEZE_STOP_ERROR_REG[0:0] {
      ScanInSource GO_ID_REG_BYPASS_MUX;
   }
   ScanMux GO_ID_REG_BYPASS_MUX SelectedBy INCLUDE_MEM_RESULTS_REG {
      1'b0 : GO_ID_REG_BYPASS_SOURCE;
      1'b1 : GO_ID_REG[0];
   }
}

// instanced as dtmf_recvr_core.ROM_512x16_0_INST
Module rom_512x16A {
   // ICL module read from source on or near line 17 of file '/home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/rom_512x16A.icl'
   DataInPort A[8:0] {
      Attribute connection_rule_option = "allowed_no_source";
      Attribute tessent_memory_bist_function = "address";
   }
   ClockPort CLK;
   Attribute tessent_use_in_dft_specification = "false";
   Attribute keep_active_during_scan_test = "false";
   Attribute tessent_memory_module = "without_internal_scan_logic";
}

// instanced as dtmf_recvr_core.ROM_512x16_0_INST_interface_inst
Module dtmf_recvr_core_rtl1_tessent_mbist_c3_interface_m1 {
   // ICL module read from source on or near line 25 of file '/home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/dtmf_recvr_core_rtl1_tessent_mbist_c3_interface_m1.icl'
   ClockPort BIST_CLK;
   DataInPort BIST_COLLAR_EN;
   DataInPort BIST_ASYNC_RESETN;
   ScanInPort BIST_SI;
   ScanOutPort BIST_SO {
      Source BIST_SO_INT;
   }
   ShiftEnPort BIST_SHIFT_COLLAR;
   DataInPort BIST_SETUP0;
   DataInPort MEM_BYPASS_EN {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort MCP_BOUNDING_EN {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort INCLUDE_MEM_RESULTS_REG;
   DataOutPort A[8:0] {
      Attribute connection_rule_option = "allowed_no_destination";
      Attribute tessent_memory_bist_function = "address";
   }
   Attribute tessent_instrument_type = "mentor::memory_bist";
   Attribute tessent_instrument_subtype = "memory_interface";
   Attribute tessent_signature = "3b6863a67c9d2f2969dcab0b5ca18a21";
   Attribute tessent_ignore_during_icl_verification = "on";
   Attribute keep_active_during_scan_test = "false";
   Attribute tessent_use_in_dft_specification = "false";
   Attribute tessent_bist_input_select_persistent_cell_output_list = 
       "tessent_persistent_cell_BIST_INPUT_SELECT_INT/Y";
   Attribute tessent_async_bypass_persistent_cell_input_list = "";
   Attribute tessent_bist_clk_persistent_cell_output_list = 
       "tessent_persistent_cell_GATING_BIST_CLK/GCK";
   Attribute tessent_memory_output_is_tristate = "false";
   Attribute tessent_memory_control_inputs_list = "CEN SELECT ACTIVELOW";
   Attribute tessent_memory_test_inputs_list = "";
   Attribute tessent_memory_test_outputs_list = "";
   Attribute tessent_memory_control_inputs_di_coverage_list = "partial";
   Alias MISR_BYPASS_SOURCE = BIST_SI {
   }
   Alias BIST_SO_INT = MISR_GO_R[0] {
   }
   ScanRegister PORT0_MISR_REG[23:0] {
      ScanInSource BIST_SI;
   }
   ScanRegister MISR_GO_R[0:0] {
      ScanInSource MISR_REG_BYPASS_MUX;
   }
   ScanMux MISR_REG_BYPASS_MUX SelectedBy INCLUDE_MEM_RESULTS_REG {
      1'b0 : MISR_BYPASS_SOURCE;
      1'b1 : PORT0_MISR_REG[0];
   }
}

// instanced as dtmf_recvr_core.add_clock_inst_0
Module dtmf_recvr_core_add_clock_0 {
   // Created by ICL extraction
   ClockPort ClockIn;
   ToClockPort ClockOut {
      FreqDivider 2;
      Source ClockIn;
   }
   Attribute tessent_clock_type = "generated";
}

// instanced as dtmf_recvr_core.add_clock_inst_1
Module dtmf_recvr_core_add_clock_1 {
   // Created by ICL extraction
   ClockPort ClockIn;
   ToClockPort ClockOut {
      FreqDivider 2;
      Source ClockIn;
   }
   Attribute tessent_clock_type = "generated";
}

// instanced as dtmf_recvr_core.add_clock_inst_2
Module dtmf_recvr_core_add_clock_2 {
   // Created by ICL extraction
   ClockPort ClockIn;
   ToClockPort ClockOut {
      FreqDivider 2;
      Source ClockIn;
   }
   Attribute tessent_clock_type = "generated";
}

// instanced as dtmf_recvr_core.dtmf_recvr_core_rtl1_tessent_mbist_bap_inst
Module dtmf_recvr_core_rtl1_tessent_mbist_bap {
   // ICL module read from source on or near line 17 of file '/home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/dtmf_recvr_core_rtl1_tessent_mbist_bap.icl'
   ResetPort reset {
      ActivePolarity 0;
   }
   SelectPort ijtag_select;
   ScanInPort si;
   CaptureEnPort capture_en;
   ShiftEnPort shift_en;
   ToShiftEnPort BIST_HOLD {
      Attribute connection_rule_option = "allowed_no_destination";
   }
   UpdateEnPort update_en;
   TCKPort tck;
   DataInPort memory_bypass_en {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataOutPort memory_bypass_to_en {
      Source memory_bypass_en;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataInPort mcp_bounding_en {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataOutPort mcp_bounding_to_en {
      Source mcp_bounding_en;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataInPort ltest_en {
      DefaultLoadValue 1'b0;
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataOutPort ltest_to_en {
      Source ltest_en;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   ScanOutPort so {
      Source ctl_group_sib;
   }
   ScanOutPort toBist[2:0] {
      Source toBist_int;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   ScanInPort fromBist[2:0] {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort MBISTPG_GO[2:0] {
      Attribute connection_rule_option = "allowed_no_source";
   }
   DataInPort MBISTPG_DONE[2:0] {
      Attribute connection_rule_option = "allowed_no_source";
   }
   DataOutPort bistEn[2:0] {
      Source bistEn_int[2:0];
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort ENABLE_MEM_RESET {
      Source ENABLE_MEM_RESET_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort REDUCED_ADDRESS_COUNT {
      Source REDUCED_ADDRESS_COUNT_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort BIST_SELECT_TEST_DATA {
      Source BIST_SELECT_TEST_DATA_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort BIST_ALGO_MODE0 {
      Source BIST_ALGO_MODE0_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort BIST_ALGO_MODE1 {
      Source BIST_ALGO_MODE1_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort BIST_DIAG_EN {
      Source BIST_DIAG_EN_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort BIST_ASYNC_RESET {
      Source BIST_ASYNC_RESET_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort FL_CNT_MODE0 {
      Source FL_CNT_MODE0_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort FL_CNT_MODE1 {
      Source FL_CNT_MODE1_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort INCLUDE_MEM_RESULTS_REG {
      Source INCLUDE_MEM_RESULTS_REG_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort CHAIN_BYPASS_EN {
      Source CHAIN_BYPASS_EN_tdr;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort TCK_MODE {
      Source TCK_MODE_tdr;
      RefEnum OnOff;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort BIST_SETUP[2:0] {
      Source BIST_SETUP_tdr[2:0];
      Attribute connection_rule_option = "allowed_no_destination";
   }
   ScanInterface client {
      Port si;
      Port so;
      Port ijtag_select;
   }
   ScanInterface host_2 {
      Port toBist[2];
      Port fromBist[2];
      Port BIST_HOLD;
   }
   ScanInterface host_1 {
      Port toBist[1];
      Port fromBist[1];
      Port BIST_HOLD;
   }
   ScanInterface host_0 {
      Port toBist[0];
      Port fromBist[0];
      Port BIST_HOLD;
   }
   Attribute ijtag_logical_connection = 
       "{tck to_interfaces_tck} {tck to_controllers_tck}";
   Attribute keep_active_during_scan_test = "false";
   Attribute tessent_use_in_dft_specification = "false";
   Attribute tessent_instrument_type = "mentor::memory_bist";
   Attribute tessent_instrument_subtype = "bist_access_port";
   Attribute tessent_signature = "e86ba787ccca70ba9c18a1458b01fec0";
   Alias tdr[14:0] = BIST_SETUP_tdr[2:0], TCK_MODE_tdr, CHAIN_BYPASS_EN_tdr, 
       INCLUDE_MEM_RESULTS_REG_tdr, FL_CNT_MODE1_tdr, FL_CNT_MODE0_tdr, 
       BIST_ASYNC_RESET_tdr, BIST_DIAG_EN_tdr, BIST_ALGO_MODE1_tdr, 
       BIST_ALGO_MODE0_tdr, BIST_SELECT_TEST_DATA_tdr, REDUCED_ADDRESS_COUNT_tdr,
       ENABLE_MEM_RESET_tdr {
      RefEnum tdr_symbols;
   }
   Alias ChainBypassMode = CHAIN_BYPASS_EN_tdr {
   }
   Alias bistEn_int[2:0] = mbist_go_2, mbist_go_1, mbist_go_0 {
   }
   Alias toBist_int[2:0] = tdr_bypass_sib_inst, mbist_go_2, mbist_go_1 {
   }
   Enum OnOff {
      ON = 1'b1;
      OFF = 1'b0;
   }
   Enum tdr_symbols {
      idle = 15'b000010001000100;
      ignore = 15'bxxxxxxxxxxxxxxx;
      mbist_async_reset = 15'b000010000000000;
   }
   ScanRegister BIST_SETUP_tdr[2:0] {
      ScanInSource si;
      CaptureSource BIST_SETUP_tdr[2], BIST_SETUP_tdr[1], BIST_SETUP_tdr[0];
      DefaultLoadValue 3'b000;
      ResetValue 3'b000;
   }
   ScanRegister TCK_MODE_tdr {
      ScanInSource BIST_SETUP_tdr[0];
      CaptureSource TCK_MODE_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister CHAIN_BYPASS_EN_tdr {
      ScanInSource TCK_MODE_tdr;
      CaptureSource CHAIN_BYPASS_EN_tdr;
      DefaultLoadValue 1'b1;
      ResetValue 1'b1;
   }
   ScanRegister INCLUDE_MEM_RESULTS_REG_tdr {
      ScanInSource CHAIN_BYPASS_EN_tdr;
      CaptureSource INCLUDE_MEM_RESULTS_REG_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister FL_CNT_MODE1_tdr {
      ScanInSource INCLUDE_MEM_RESULTS_REG_tdr;
      CaptureSource FL_CNT_MODE1_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister FL_CNT_MODE0_tdr {
      ScanInSource FL_CNT_MODE1_tdr;
      CaptureSource FL_CNT_MODE0_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister BIST_ASYNC_RESET_tdr {
      ScanInSource FL_CNT_MODE0_tdr;
      CaptureSource BIST_ASYNC_RESET_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister BIST_DIAG_EN_tdr {
      ScanInSource BIST_ASYNC_RESET_tdr;
      CaptureSource BIST_DIAG_EN_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister BIST_ALGO_MODE1_tdr {
      ScanInSource BIST_DIAG_EN_tdr;
      CaptureSource BIST_ALGO_MODE1_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister BIST_ALGO_MODE0_tdr {
      ScanInSource BIST_ALGO_MODE1_tdr;
      CaptureSource BIST_ALGO_MODE0_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister BIST_SELECT_TEST_DATA_tdr {
      ScanInSource BIST_ALGO_MODE0_tdr;
      CaptureSource BIST_SELECT_TEST_DATA_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister REDUCED_ADDRESS_COUNT_tdr {
      ScanInSource BIST_SELECT_TEST_DATA_tdr;
      CaptureSource REDUCED_ADDRESS_COUNT_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister ENABLE_MEM_RESET_tdr {
      ScanInSource REDUCED_ADDRESS_COUNT_tdr;
      CaptureSource ENABLE_MEM_RESET_tdr;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister tdr_bypass_sib_inst {
      ScanInSource tdr_bypass_sib_mux_inst;
      CaptureSource 1'b0;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister mbist_done_2 {
      ScanInSource fromBistMux_2;
      CaptureSource MBISTPG_DONE[2];
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister mbist_go_2 {
      ScanInSource mbist_done_2;
      CaptureSource MBISTPG_GO[2];
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister mbist_done_1 {
      ScanInSource fromBistMux_1;
      CaptureSource MBISTPG_DONE[1];
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister mbist_go_1 {
      ScanInSource mbist_done_1;
      CaptureSource MBISTPG_GO[1];
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister mbist_done_0 {
      ScanInSource fromBistMux_0;
      CaptureSource MBISTPG_DONE[0];
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister mbist_go_0 {
      ScanInSource mbist_done_0;
      CaptureSource MBISTPG_GO[0];
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanRegister ctl_group_sib {
      ScanInSource ctl_sib_mux_inst;
      CaptureSource 1'b0;
      DefaultLoadValue 1'b0;
      ResetValue 1'b0;
   }
   ScanMux tdr_bypass_sib_mux_inst SelectedBy tdr_bypass_sib_inst {
      1'b0 : si;
      1'b1 : ENABLE_MEM_RESET_tdr;
   }
   ScanMux fromBistMux_2 SelectedBy bistEn_int[2], BIST_SETUP_tdr[1], 
       ChainBypassMode {
      3'b100 : fromBist[2];
      3'bxxx : tdr_bypass_sib_inst;
   }
   ScanMux fromBistMux_1 SelectedBy bistEn_int[1], BIST_SETUP_tdr[1], 
       ChainBypassMode {
      3'b100 : fromBist[1];
      3'bxxx : mbist_go_2;
   }
   ScanMux fromBistMux_0 SelectedBy bistEn_int[0], BIST_SETUP_tdr[1], 
       ChainBypassMode {
      3'b100 : fromBist[0];
      3'bxxx : mbist_go_1;
   }
   ScanMux ctl_sib_mux_inst SelectedBy ctl_group_sib {
      1'b0 : tdr_bypass_sib_inst;
      1'b1 : mbist_go_0;
   }
}

// instanced as dtmf_recvr_core.dtmf_recvr_core_rtl1_tessent_mbist_c2_controller_inst
Module dtmf_recvr_core_rtl1_tessent_mbist_c2_controller {
   // ICL module read from source on or near line 26 of file '/home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/dtmf_recvr_core_rtl1_tessent_mbist_c2_controller.icl'
   ClockPort BIST_CLK;
   DataInPort MBISTPG_EN;
   DataInPort LV_TM {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort MEM_BYPASS_EN {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort MCP_BOUNDING_EN {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort MBISTPG_ASYNC_RESETN {
      RefEnum AsyncResetN;
   }
   DataInPort MBISTPG_DIAG_EN;
   DataInPort BIST_SETUP2;
   DataInPort BIST_SETUP[1:0];
   DataInPort MBISTPG_REDUCED_ADDR_CNT_EN {
      RefEnum OnOff;
   }
   DataInPort MBISTPG_MEM_RST {
      RefEnum OnOff;
   }
   DataInPort MBISTPG_TESTDATA_SELECT {
      RefEnum OnOff;
   }
   DataInPort FL_CNT_MODE[1:0];
   DataInPort MBISTPG_ALGO_MODE[1:0];
   DataOutPort MBISTPG_GO {
      RefEnum PassFail;
   }
   DataOutPort MBISTPG_DONE {
      RefEnum PassFail;
   }
   TCKPort TCK;
   ScanInPort BIST_SI;
   ScanOutPort MBISTPG_SO {
      Source BIST_SO_INT;
   }
   ShiftEnPort BIST_HOLD;
   ToShiftEnPort BIST_SHIFT_COLLAR {
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort BIST_COLLAR_EN0 {
      Attribute tessent_memory_alias = "m1";
   }
   ScanOutPort MEM0_BIST_COLLAR_SI {
      Source MEM0_BIST_COLLAR_SI_INT;
   }
   ScanInPort MEM0_BIST_COLLAR_SO;
   DataOutPort BIST_COLLAR_EN1 {
      Attribute tessent_memory_alias = "m2";
   }
   ScanOutPort MEM1_BIST_COLLAR_SI {
      Source MEM1_BIST_COLLAR_SI_INT;
   }
   ScanInPort MEM1_BIST_COLLAR_SO;
   DataOutPort BIST_COLLAR_EN2 {
      Attribute tessent_memory_alias = "m3";
   }
   ScanOutPort MEM2_BIST_COLLAR_SI {
      Source MEM2_BIST_COLLAR_SI_INT;
   }
   ScanInPort MEM2_BIST_COLLAR_SO;
   ScanInterface Client {
      Port BIST_SI;
      Port MBISTPG_SO;
      Port BIST_HOLD;
   }
   ScanInterface MEM0_INTERFACE {
      Port BIST_SHIFT_COLLAR;
      Port MEM0_BIST_COLLAR_SI;
      Port MEM0_BIST_COLLAR_SO;
   }
   ScanInterface MEM1_INTERFACE {
      Port BIST_SHIFT_COLLAR;
      Port MEM1_BIST_COLLAR_SI;
      Port MEM1_BIST_COLLAR_SO;
   }
   ScanInterface MEM2_INTERFACE {
      Port BIST_SHIFT_COLLAR;
      Port MEM2_BIST_COLLAR_SI;
      Port MEM2_BIST_COLLAR_SO;
   }
   Attribute tessent_instrument_container = "dtmf_recvr_core_rtl1_mbist";
   Attribute tessent_instrument_type = "mentor::memory_bist";
   Attribute tessent_instrument_subtype = "controller";
   Attribute tessent_signature = "cea6a9a3c212b42b588356c9794686e9";
   Attribute tessent_ignore_during_icl_verification = "on";
   Attribute keep_active_during_scan_test = "false";
   Attribute tessent_use_in_dft_specification = "false";
   Attribute tessent_bist_clk_persistent_cell_output_list = 
       "tessent_persistent_cell_GATING_BIST_CLK/GCK";
   Alias SETUP_MODE[2:0] = BIST_SETUP2, BIST_SETUP[1:0] {
      RefEnum SetupModes;
   }
   Alias RUN_MODE[2:0] = BIST_SETUP2, BIST_SETUP[1:0] {
      RefEnum RunModes;
   }
   Alias INST_POINTER_REG[5:0] = INST_POINTER_REG_HW[5:0] {
   }
   Alias A_ADD_REG_Y[3:0] = A_ADD_REG_Y_HW[3:0] {
   }
   Alias A_ADD_REG_X[3:0] = A_ADD_REG_X_HW[3:0] {
   }
   Alias B_ADD_REG_Y[3:0] = B_ADD_REG_Y_HW[3:0] {
   }
   Alias B_ADD_REG_X[3:0] = B_ADD_REG_X_HW[3:0] {
   }
   Alias JCNT[2:0] = JCNT_HW[2:0] {
   }
   Alias WDATA_REG[1:0] = WDATA_REG_HW[1:0] {
   }
   Alias EDATA_REG[1:0] = EDATA_REG_HW[1:0] {
   }
   Alias REPEATLOOP_A_CNTR_REG[1:0] = REPEATLOOP_A_CNTR_REG_HW[1:0] {
   }
   Alias REPEATLOOP_B_CNTR_REG[1:0] = REPEATLOOP_B_CNTR_REG_HW[1:0] {
   }
   Alias MEM2_BIST_COLLAR_SI_INT = REPEATLOOP_B_CNTR_REG_HW[1] {
   }
   Alias MEM1_BIST_COLLAR_SI_INT = MEM2_BIST_COLLAR_SO {
   }
   Alias MEM0_BIST_COLLAR_SI_INT = MEM1_BIST_COLLAR_SO {
   }
   Alias STOP_ERROR_CNT_REG[11:0] = STOP_ERROR_CNT_REG_HW[11:0] {
   }
   Alias BIST_SO_INT = BIST_SO_Pipeline {
   }
   Enum PassFail {
      Pass = 1'b1;
      Fail = 1'b0;
      Ignore = 1'bx;
   }
   Enum AsyncResetN {
      On = 1'b0;
      Off = 1'b1;
   }
   Enum SetupModes {
      Short = 3'b000;
      Long = 3'b001;
   }
   Enum OnOff {
      On = 1'b1;
      Off = 1'b0;
   }
   Enum RunModes {
      HWDefault = 3'b010;
      RunTimeProg = 3'b011;
      Idle = 3'bx0x;
      Off = 3'bxxx;
   }
   ScanRegister BIST_SI_Pipeline {
      ScanInSource BIST_SI;
      ResetValue 1'b0;
   }
   ScanRegister DIAG_EN_REG[0:0] {
      ScanInSource BIST_SI_Pipeline;
   }
   ScanRegister CMP_EN_MASK_EN[0:0] {
      ScanInSource DIAG_EN_REG[0];
   }
   ScanRegister CMP_EN_PARITY[0:0] {
      ScanInSource CMP_EN_MASK_EN[0];
      CaptureSource 1'bx;
   }
   ScanRegister MEM_SELECT_REG0[0:0] {
      ScanInSource CMP_EN_PARITY[0];
      ResetValue 1'd1;
   }
   ScanRegister MEM_SELECT_REG1[0:0] {
      ScanInSource MEM_SELECT_REG0[0];
      ResetValue 1'd1;
   }
   ScanRegister MEM_SELECT_REG2[0:0] {
      ScanInSource MEM_SELECT_REG1[0];
      ResetValue 1'd1;
   }
   ScanRegister REDUCED_ADDR_CNT_EN_REG[0:0] {
      ScanInSource MEM_SELECT_REG2[0];
      RefEnum OnOff;
   }
   ScanRegister ALGO_SEL_CNT_REG[0:0] {
      ScanInSource REDUCED_ADDR_CNT_EN_REG[0];
      RefEnum OnOff;
   }
   ScanRegister SELECT_COMMON_OPSET_REG[0:0] {
      ScanInSource ALGO_SEL_CNT_REG[0];
      RefEnum OnOff;
   }
   ScanRegister SELECT_COMMON_DATA_PAT_REG[0:0] {
      ScanInSource SELECT_COMMON_OPSET_REG[0];
      RefEnum OnOff;
   }
   ScanRegister MICROCODE_EN_REG[0:0] {
      ScanInSource SELECT_COMMON_DATA_PAT_REG[0];
   }
   ScanRegister INST_POINTER_REG_HW[0:5] {
      ScanInSource MICROCODE_EN_REG[0];
   }
   ScanRegister A_ADD_REG_Y_HW[0:3] {
      ScanInSource INST_POINTER_REG_HW[5];
   }
   ScanRegister A_ADD_REG_X_HW[0:3] {
      ScanInSource A_ADD_REG_Y_HW[3];
   }
   ScanRegister B_ADD_REG_Y_HW[0:3] {
      ScanInSource A_ADD_REG_X_HW[3];
   }
   ScanRegister B_ADD_REG_X_HW[0:3] {
      ScanInSource B_ADD_REG_Y_HW[3];
   }
   ScanRegister JCNT_HW[0:2] {
      ScanInSource B_ADD_REG_X_HW[3];
   }
   ScanRegister OPSET_SELECT_REG[0:0] {
      ScanInSource JCNT_HW[2];
   }
   ScanRegister WDATA_REG_HW[0:1] {
      ScanInSource OPSET_SELECT_REG[0];
   }
   ScanRegister EDATA_REG_HW[0:1] {
      ScanInSource WDATA_REG_HW[1];
   }
   ScanRegister X_ADDR_BIT_SEL_REG[0:0] {
      ScanInSource EDATA_REG_HW[1];
   }
   ScanRegister Y_ADDR_BIT_SEL_REG[0:0] {
      ScanInSource X_ADDR_BIT_SEL_REG[0];
   }
   ScanRegister REPEATLOOP_A_CNTR_REG_HW[0:1] {
      ScanInSource Y_ADDR_BIT_SEL_REG[0];
   }
   ScanRegister REPEATLOOP_B_CNTR_REG_HW[0:1] {
      ScanInSource REPEATLOOP_A_CNTR_REG_HW[1];
   }
   ScanRegister STOP_ON_ERROR_REG[0:0] {
      ScanInSource MEM0_BIST_COLLAR_SO;
   }
   ScanRegister FREEZE_STOP_ERROR_REG[0:0] {
      ScanInSource STOP_ON_ERROR_REG[0];
   }
   ScanRegister STOP_ERROR_CNT_REG_HW[0:11] {
      ScanInSource FREEZE_STOP_ERROR_REG[0];
   }
   ScanRegister BIST_SO_Pipeline {
      ScanInSource BIST_SO_OUT;
      ResetValue 1'b0;
   }
   ScanMux CONTROLLER_SETUP_CHAIN SelectedBy MBISTPG_EN, SETUP_MODE[2:0] {
      1'b1, 3'b00x : STOP_ERROR_CNT_REG_HW[11];
   }
   ScanMux BIST_SO_OUT SelectedBy LV_TM, MBISTPG_ASYNC_RESETN {
      2'b01 : CONTROLLER_SETUP_CHAIN;
   }
   LogicSignal LONG_SETUP {
      MBISTPG_EN, SETUP_MODE[2:0] == 1'b1, 3'b001;
   }
   LogicSignal SHORT_SETUP {
      MBISTPG_EN, SETUP_MODE[2:0] == 1'b1, 3'b000;
   }
}

// instanced as dtmf_recvr_core.dtmf_recvr_core_rtl1_tessent_mbist_c3_controller_inst
Module dtmf_recvr_core_rtl1_tessent_mbist_c3_controller {
   // ICL module read from source on or near line 26 of file '/home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_mbist.instrument/dtmf_recvr_core_rtl1_tessent_mbist_c3_controller.icl'
   ClockPort BIST_CLK;
   DataInPort MBISTPG_EN;
   DataInPort LV_TM {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort MEM_BYPASS_EN {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort MCP_BOUNDING_EN {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort MBISTPG_ASYNC_RESETN {
      RefEnum AsyncResetN;
   }
   DataInPort BIST_SETUP2;
   DataInPort BIST_SETUP[1:0];
   DataInPort MBISTPG_REDUCED_ADDR_CNT_EN {
      RefEnum OnOff;
   }
   DataInPort MBISTPG_MEM_RST {
      RefEnum OnOff;
   }
   DataInPort MBISTPG_TESTDATA_SELECT {
      RefEnum OnOff;
   }
   DataOutPort MBISTPG_GO {
      RefEnum PassFail;
   }
   DataOutPort MBISTPG_DONE {
      RefEnum PassFail;
   }
   TCKPort TCK;
   ScanInPort BIST_SI;
   ScanOutPort MBISTPG_SO {
      Source BIST_SO_INT;
   }
   ShiftEnPort BIST_HOLD;
   ToShiftEnPort BIST_SHIFT_COLLAR {
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataOutPort BIST_COLLAR_EN0 {
      Attribute tessent_memory_alias = "m1";
   }
   ScanOutPort MEM0_BIST_COLLAR_SI {
      Source MEM0_BIST_COLLAR_SI_INT;
   }
   ScanInPort MEM0_BIST_COLLAR_SO;
   ScanInterface Client {
      Port BIST_SI;
      Port MBISTPG_SO;
      Port BIST_HOLD;
   }
   ScanInterface MEM0_INTERFACE {
      Port BIST_SHIFT_COLLAR;
      Port MEM0_BIST_COLLAR_SI;
      Port MEM0_BIST_COLLAR_SO;
   }
   Attribute tessent_instrument_container = "dtmf_recvr_core_rtl1_mbist";
   Attribute tessent_instrument_type = "mentor::memory_bist";
   Attribute tessent_instrument_subtype = "controller";
   Attribute tessent_signature = "33baa75085e0ab110c3748a4a5c508e5";
   Attribute tessent_ignore_during_icl_verification = "on";
   Attribute keep_active_during_scan_test = "false";
   Attribute tessent_use_in_dft_specification = "false";
   Attribute tessent_bist_clk_persistent_cell_output_list = 
       "tessent_persistent_cell_GATING_BIST_CLK/GCK";
   Alias SETUP_MODE[2:0] = BIST_SETUP2, BIST_SETUP[1:0] {
      RefEnum SetupModes;
   }
   Alias RUN_MODE[2:0] = BIST_SETUP2, BIST_SETUP[1:0] {
      RefEnum RunModes;
   }
   Alias INST_POINTER_REG[1:0] = INST_POINTER_REG_HW[1:0] {
   }
   Alias A_ADD_REG_Y[3:0] = A_ADD_REG_Y_HW[3:0] {
   }
   Alias A_ADD_REG_X[4:0] = A_ADD_REG_X_HW[4:0] {
   }
   Alias B_ADD_REG_Y[3:0] = B_ADD_REG_Y_HW[3:0] {
   }
   Alias B_ADD_REG_X[4:0] = B_ADD_REG_X_HW[4:0] {
   }
   Alias JCNT[2:0] = JCNT_HW[2:0] {
   }
   Alias REPEATLOOP_A_CNTR_REG[1:0] = REPEATLOOP_A_CNTR_REG_HW[1:0] {
   }
   Alias REPEATLOOP_B_CNTR_REG[1:0] = REPEATLOOP_B_CNTR_REG_HW[1:0] {
   }
   Alias MEM0_BIST_COLLAR_SI_INT = REPEATLOOP_B_CNTR_REG_HW[1] {
   }
   Alias BIST_SO_INT = BIST_SO_Pipeline {
   }
   Enum PassFail {
      Pass = 1'b1;
      Fail = 1'b0;
      Ignore = 1'bx;
   }
   Enum AsyncResetN {
      On = 1'b0;
      Off = 1'b1;
   }
   Enum SetupModes {
      Short = 3'b000;
      Long = 3'b001;
   }
   Enum OnOff {
      On = 1'b1;
      Off = 1'b0;
   }
   Enum RunModes {
      HWDefault = 3'b010;
      RunTimeProg = 3'b011;
      Idle = 3'bx0x;
      Off = 3'bxxx;
   }
   ScanRegister BIST_SI_Pipeline {
      ScanInSource BIST_SI;
      ResetValue 1'b0;
   }
   ScanRegister MEM_SELECT_REG0[0:0] {
      ScanInSource BIST_SI_Pipeline;
      ResetValue 1'd1;
   }
   ScanRegister REDUCED_ADDR_CNT_EN_REG[0:0] {
      ScanInSource MEM_SELECT_REG0[0];
      RefEnum OnOff;
   }
   ScanRegister ALGO_SEL_CNT_REG[0:0] {
      ScanInSource REDUCED_ADDR_CNT_EN_REG[0];
      RefEnum OnOff;
   }
   ScanRegister SELECT_COMMON_OPSET_REG[0:0] {
      ScanInSource ALGO_SEL_CNT_REG[0];
      RefEnum OnOff;
   }
   ScanRegister MICROCODE_EN_REG[0:0] {
      ScanInSource SELECT_COMMON_OPSET_REG[0];
   }
   ScanRegister INST_POINTER_REG_HW[0:1] {
      ScanInSource MICROCODE_EN_REG[0];
   }
   ScanRegister A_ADD_REG_Y_HW[0:3] {
      ScanInSource INST_POINTER_REG_HW[1];
   }
   ScanRegister A_ADD_REG_X_HW[0:4] {
      ScanInSource A_ADD_REG_Y_HW[3];
   }
   ScanRegister B_ADD_REG_Y_HW[0:3] {
      ScanInSource A_ADD_REG_X_HW[4];
   }
   ScanRegister B_ADD_REG_X_HW[0:4] {
      ScanInSource B_ADD_REG_Y_HW[3];
   }
   ScanRegister JCNT_HW[0:2] {
      ScanInSource B_ADD_REG_X_HW[4];
   }
   ScanRegister OPSET_SELECT_REG[0:0] {
      ScanInSource JCNT_HW[2];
   }
   ScanRegister REPEATLOOP_A_CNTR_REG_HW[0:1] {
      ScanInSource OPSET_SELECT_REG[0];
   }
   ScanRegister REPEATLOOP_B_CNTR_REG_HW[0:1] {
      ScanInSource REPEATLOOP_A_CNTR_REG_HW[1];
   }
   ScanRegister BIST_SO_Pipeline {
      ScanInSource BIST_SO_OUT;
      ResetValue 1'b0;
   }
   ScanMux CONTROLLER_SETUP_CHAIN SelectedBy MBISTPG_EN, SETUP_MODE[2:0] {
      1'b1, 3'b00x : MEM0_BIST_COLLAR_SO;
   }
   ScanMux BIST_SO_OUT SelectedBy LV_TM, MBISTPG_ASYNC_RESETN {
      2'b01 : CONTROLLER_SETUP_CHAIN;
   }
   LogicSignal LONG_SETUP {
      MBISTPG_EN, SETUP_MODE[2:0] == 1'b1, 3'b001;
   }
   LogicSignal SHORT_SETUP {
      MBISTPG_EN, SETUP_MODE[2:0] == 1'b1, 3'b000;
   }
}

// instanced as dtmf_recvr_core.dtmf_recvr_core_rtl1_tessent_sib_mbist_inst
Module dtmf_recvr_core_rtl1_tessent_sib_4 {
   // ICL module read from source on or near line 17 of file '/home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_ijtag.instrument/dtmf_recvr_core_rtl1_tessent_sib_4.icl'
   ResetPort ijtag_reset {
      ActivePolarity 0;
   }
   SelectPort ijtag_sel;
   ScanInPort ijtag_si;
   CaptureEnPort ijtag_ce;
   ShiftEnPort ijtag_se;
   UpdateEnPort ijtag_ue;
   TCKPort ijtag_tck;
   ScanOutPort ijtag_so {
      Source sib;
   }
   ToSelectPort ijtag_to_sel {
      Attribute connection_rule_option = "allowed_no_destination";
   }
   ScanInPort ijtag_from_so {
      Attribute connection_rule_option = "allowed_no_source";
   }
   ScanInterface client {
      Port ijtag_si;
      Port ijtag_so;
      Port ijtag_sel;
   }
   ScanInterface host {
      Port ijtag_from_so;
      Port ijtag_to_sel;
   }
   Attribute keep_active_during_scan_test = "false";
   Attribute tessent_use_in_dft_specification = "false";
   Attribute tessent_instrument_type = "mentor::ijtag_node";
   Attribute tessent_signature = "6416d4de0d9c21ee3bb7614742691259";
   ScanRegister sib {
      ScanInSource scan_in_mux;
      CaptureSource 1'b0;
      ResetValue 1'b0;
   }
   ScanMux scan_in_mux SelectedBy sib {
      1'b0 : ijtag_si;
      1'b1 : ijtag_from_so;
   }
}

// instanced as dtmf_recvr_core.dtmf_recvr_core_rtl1_tessent_sib_sri_ctrl_inst
Module dtmf_recvr_core_rtl1_tessent_sib_3 {
   // ICL module read from source on or near line 17 of file '/home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_ijtag.instrument/dtmf_recvr_core_rtl1_tessent_sib_3.icl'
   ResetPort ijtag_reset {
      ActivePolarity 0;
   }
   SelectPort ijtag_sel;
   ScanInPort ijtag_si;
   CaptureEnPort ijtag_ce;
   ShiftEnPort ijtag_se;
   UpdateEnPort ijtag_ue;
   TCKPort ijtag_tck;
   ScanOutPort ijtag_so {
      Source sib;
   }
   ToSelectPort ijtag_to_sel {
      Attribute connection_rule_option = "allowed_no_destination";
   }
   ScanInPort ijtag_from_so {
      Attribute connection_rule_option = "allowed_no_source";
   }
   ScanInterface client {
      Port ijtag_si;
      Port ijtag_so;
      Port ijtag_sel;
   }
   ScanInterface host {
      Port ijtag_from_so;
      Port ijtag_to_sel;
   }
   Attribute keep_active_during_scan_test = "true";
   Attribute tessent_use_in_dft_specification = "false";
   Attribute tessent_instrument_type = "mentor::ijtag_node";
   Attribute tessent_signature = "ef948505b0ec5a93d1a9eeea1ec5e4ad";
   ScanRegister sib {
      ScanInSource scan_in_mux;
      CaptureSource 1'b0;
      ResetValue 1'b0;
   }
   ScanMux scan_in_mux SelectedBy sib {
      1'b0 : ijtag_si;
      1'b1 : ijtag_from_so;
   }
}

// instanced as dtmf_recvr_core.dtmf_recvr_core_rtl1_tessent_sib_sri_inst
Module dtmf_recvr_core_rtl1_tessent_sib_2 {
   // ICL module read from source on or near line 17 of file '/home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_ijtag.instrument/dtmf_recvr_core_rtl1_tessent_sib_2.icl'
   ResetPort ijtag_reset {
      ActivePolarity 0;
   }
   SelectPort ijtag_sel;
   ScanInPort ijtag_si;
   CaptureEnPort ijtag_ce;
   ShiftEnPort ijtag_se;
   UpdateEnPort ijtag_ue;
   TCKPort ijtag_tck;
   ScanOutPort ijtag_so {
      Source sib;
   }
   ToSelectPort ijtag_to_sel {
      Attribute connection_rule_option = "allowed_no_destination";
   }
   ScanInPort ijtag_from_so {
      Attribute connection_rule_option = "allowed_no_source";
   }
   ScanInterface client {
      Port ijtag_si;
      Port ijtag_so;
      Port ijtag_sel;
   }
   ScanInterface host {
      Port ijtag_from_so;
      Port ijtag_to_sel;
   }
   Attribute keep_active_during_scan_test = "true";
   Attribute tessent_dft_function = "scan_resource_instrument_host";
   Attribute tessent_use_in_dft_specification = "false";
   Attribute tessent_instrument_type = "mentor::ijtag_node";
   Attribute tessent_signature = "50fc8f5ccf9ae8ad4b863818294257fe";
   ScanRegister sib {
      ScanInSource scan_in_mux;
      CaptureSource 1'b0;
      ResetValue 1'b0;
   }
   ScanMux scan_in_mux SelectedBy sib {
      1'b0 : ijtag_si;
      1'b1 : ijtag_from_so;
   }
}

// instanced as dtmf_recvr_core.dtmf_recvr_core_rtl1_tessent_sib_sti_inst
Module dtmf_recvr_core_rtl1_tessent_sib_1 {
   // ICL module read from source on or near line 17 of file '/home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_ijtag.instrument/dtmf_recvr_core_rtl1_tessent_sib_1.icl'
   ResetPort ijtag_reset {
      ActivePolarity 0;
   }
   SelectPort ijtag_sel;
   ScanInPort ijtag_si;
   CaptureEnPort ijtag_ce;
   ShiftEnPort ijtag_se;
   UpdateEnPort ijtag_ue;
   TCKPort ijtag_tck;
   ScanOutPort ijtag_so {
      Source sib;
   }
   ToSelectPort ijtag_to_sel {
      Attribute connection_rule_option = "allowed_no_destination";
   }
   ScanInPort ijtag_from_so {
      Attribute connection_rule_option = "allowed_no_source";
   }
   ToResetPort ijtag_to_reset {
      ActivePolarity 0;
      Source ijtag_reset;
   }
   ScanOutPort ijtag_to_si {
      Source ijtag_si;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   ToCaptureEnPort ijtag_to_ce {
      Source ijtag_ce;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   ToShiftEnPort ijtag_to_se {
      Source ijtag_se;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   ToUpdateEnPort ijtag_to_ue {
      Source ijtag_ue;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   ToTCKPort ijtag_to_tck {
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataInPort ltest_en {
      Attribute explicit_iwrite_only = 1'b1;
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort ltest_occ_en {
      Attribute explicit_iwrite_only = 1'b1;
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort ltest_static_clock_control_mode {
      Attribute connection_rule_option = "allowed_tied_low";
   }
   DataInPort ltest_clock_sequence[1:0] {
      Attribute connection_rule_option = "allowed_no_source";
      Attribute tessent_use_in_dft_specification = "false";
      Attribute function_modifier = "tessent_clock_sequence";
   }
   DataOutPort ltest_to_en {
      Source ltest_en;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataInPort ltest_mem_bypass_en {
      Attribute connection_rule_option = "allowed_tied";
   }
   DataOutPort ltest_to_mem_bypass_en {
      Source ltest_to_mem_bypass_en_int;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   DataInPort ltest_mcp_bounding_en {
      Attribute explicit_iwrite_only = 1'b1;
      Attribute connection_rule_option = "allowed_tied";
      Attribute forced_low_dft_signal_list = "ltest_en";
   }
   DataOutPort ltest_to_mcp_bounding_en {
      Source ltest_to_mcp_bounding_en_int;
      Attribute connection_rule_option = "allowed_no_destination";
   }
   ScanInterface client {
      Port ijtag_si;
      Port ijtag_so;
      Port ijtag_sel;
   }
   ScanInterface host {
      Port ijtag_from_so;
      Port ijtag_to_sel;
      Port ijtag_to_si;
   }
   Attribute keep_active_during_scan_test = "true";
   Attribute tessent_dft_function = "scan_tested_instrument_host";
   Attribute tessent_use_in_dft_specification = "false";
   Attribute tessent_instrument_type = "mentor::ijtag_node";
   Attribute tessent_signature = "f6000ef40f2940b80879457755e1ce02";
   ScanRegister sib {
      ScanInSource scan_in_mux;
      CaptureSource 1'b0;
      ResetValue 1'b0;
   }
   ScanMux scan_in_mux SelectedBy sib, ltest_en {
      2'b10 : ijtag_from_so;
      2'bxx : ijtag_si;
   }
   LogicSignal ltest_to_mem_bypass_en_int {
      ltest_mem_bypass_en & ltest_en;
   }
   LogicSignal ltest_to_mcp_bounding_en_int {
      ltest_mcp_bounding_en & ltest_en;
   }
}

// instanced as dtmf_recvr_core.dtmf_recvr_core_rtl1_tessent_tdr_sri_ctrl_inst
Module dtmf_recvr_core_rtl1_tessent_tdr_sri_ctrl {
   // ICL module read from source on or near line 17 of file '/home/l210/L210/work/EC23I2015/LAB7/dtmf_recvr_core/mbist/tsdb_outdir/instruments/dtmf_recvr_core_rtl1_ijtag.instrument/dtmf_recvr_core_rtl1_tessent_tdr_sri_ctrl.icl'
   ResetPort ijtag_reset {
      ActivePolarity 0;
   }
   SelectPort ijtag_sel;
   ScanInPort ijtag_si;
   CaptureEnPort ijtag_ce;
   ShiftEnPort ijtag_se;
   UpdateEnPort ijtag_ue;
   TCKPort ijtag_tck;
   ScanOutPort ijtag_so {
      Source tdr[0];
   }
   DataOutPort all_test {
      Source tdr[1];
      Attribute connection_rule_option = "allowed_no_destination";
      Attribute tessent_dft_signal_name = "all_test";
      Attribute tessent_dft_signal_usage = "global_dft_control";
      Attribute tessent_dft_signal_default_value_in_all_test = 1;
      Attribute tessent_dft_signal_reset_value = 0;
      Attribute tessent_persistent_design_pin = 
          "{tessent_persistent_cell_all_test/Y}";
   }
   DataOutPort test_mode {
      Source tdr[0];
      Attribute connection_rule_option = "allowed_no_destination";
      Attribute tessent_dft_signal_name = "test_mode";
      Attribute tessent_dft_signal_usage = "global_dft_control";
      Attribute tessent_dft_signal_default_value_in_all_test = 0;
      Attribute tessent_dft_signal_reset_value = 0;
      Attribute tessent_persistent_design_pin = 
          "{tessent_persistent_cell_test_mode/Y}";
   }
   ScanInterface client {
      Port ijtag_si;
      Port ijtag_so;
      Port ijtag_sel;
   }
   Attribute keep_active_during_scan_test = "true";
   Attribute tessent_dft_function = "scan_resource_instrument_dft_control";
   Attribute forced_high_output_port_list = "all_test";
   Attribute tessent_use_in_dft_specification = "false";
   Attribute tessent_instrument_type = "mentor::ijtag_node";
   Attribute tessent_instrument_subtype = "tessent_tdr";
   Attribute tessent_signature = "308c0a1ccd8a1a18b5e7236f13c6a70d";
   ScanRegister tdr[1:0] {
      ScanInSource ijtag_si;
      CaptureSource 2'b00;
      DefaultLoadValue 2'b00;
      ResetValue 2'b00;
   }
}
