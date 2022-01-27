// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// VENDOR "Altera"
// PROGRAM "Quartus Prime"
// VERSION "Version 18.1.0 Build 222 09/21/2018 SJ Pro Edition"

// DATE "04/24/2021 16:37:24"

// 
// Device: Altera 10AX066K3F40E2SG Package FBGA1517
// 

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module iopll (
	locked,
	outclk_0,
	outclk_1,
	outclk_2,
	rst,
	refclk)/* synthesis synthesis_greybox=0 */;
output 	locked;
output 	outclk_0;
output 	outclk_1;
output 	outclk_2;
input 	rst;
input 	refclk;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \iopll_0|altera_iopll_i|twentynm_pll|block_select ;
wire \iopll_0|altera_iopll_i|twentynm_pll|lock ;
wire \iopll_0|altera_iopll_i|twentynm_pll|outclk[0] ;
wire \iopll_0|altera_iopll_i|twentynm_pll|outclk[1] ;
wire \iopll_0|altera_iopll_i|twentynm_pll|outclk[2] ;

wire [8:0] \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst_OUTCLK_bus ;

assign \iopll_0|altera_iopll_i|twentynm_pll|outclk[0]  = \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst_OUTCLK_bus [0];
assign \iopll_0|altera_iopll_i|twentynm_pll|outclk[1]  = \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst_OUTCLK_bus [1];
assign \iopll_0|altera_iopll_i|twentynm_pll|outclk[2]  = \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst_OUTCLK_bus [2];

twentynm_iopll \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst (
	.core_refclk(gnd),
	.csr_clk(vcc),
	.csr_en(vcc),
	.csr_in(vcc),
	.dprio_clk(gnd),
	.dprio_rst_n(vcc),
	.dps_rst_n(vcc),
	.extswitch(gnd),
	.fbclk_in(gnd),
	.fblvds_in(gnd),
	.mdio_dis(gnd),
	.pfden(vcc),
	.phase_en(gnd),
	.pipeline_global_en_n(vcc),
	.pll_cascade_in(gnd),
	.pma_csr_test_dis(vcc),
	.read(gnd),
	.rst_n(!rst),
	.scan_mode_n(vcc),
	.scan_shift_n(vcc),
	.up_dn(gnd),
	.user_mode(vcc),
	.write(gnd),
	.zdb_in(gnd),
	.clken({gnd,gnd}),
	.cnt_sel({gnd,gnd,gnd,gnd}),
	.dprio_address({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd}),
	.num_phase_shifts({gnd,gnd,gnd}),
	.refclk({gnd,gnd,gnd,refclk}),
	.writedata({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd}),
	.block_select(\iopll_0|altera_iopll_i|twentynm_pll|block_select ),
	.clk0_bad(),
	.clk1_bad(),
	.clksel(),
	.csr_out(),
	.dll_output(),
	.fbclk_out(),
	.fblvds_out(),
	.lf_reset(),
	.lock(\iopll_0|altera_iopll_i|twentynm_pll|lock ),
	.phase_done(),
	.pll_cascade_out(),
	.pll_pd(),
	.vcop_en(),
	.extclk_dft(),
	.extclk_output(),
	.loaden(),
	.lvds_clk(),
	.outclk(\iopll_0|altera_iopll_i|twentynm_pll|iopll_inst_OUTCLK_bus ),
	.readdata(),
	.vcoph());
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .bw_sel = "low";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .clock_name_0 = "outclk0";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .clock_name_1 = "outclk1";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .clock_name_2 = "outclk2";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .clock_name_global_0 = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .clock_name_global_1 = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .clock_name_global_2 = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .clock_name_global_3 = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .clock_name_global_4 = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .clock_name_global_5 = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .clock_name_global_6 = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .clock_name_global_7 = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .clock_name_global_8 = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .compensation_mode = "direct";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .duty_cycle_0 = 50;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .duty_cycle_1 = 50;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .duty_cycle_2 = 50;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .duty_cycle_3 = 50;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .duty_cycle_4 = 50;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .duty_cycle_5 = 50;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .duty_cycle_6 = 50;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .duty_cycle_7 = 50;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .duty_cycle_8 = 50;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .is_cascaded_pll = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .output_clock_frequency_0 = "300.0 mhz";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .output_clock_frequency_1 = "200.0 mhz";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .output_clock_frequency_2 = "120.0 mhz";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .output_clock_frequency_3 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .output_clock_frequency_4 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .output_clock_frequency_5 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .output_clock_frequency_6 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .output_clock_frequency_7 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .output_clock_frequency_8 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .phase_shift_0 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .phase_shift_1 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .phase_shift_2 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .phase_shift_3 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .phase_shift_4 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .phase_shift_5 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .phase_shift_6 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .phase_shift_7 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .phase_shift_8 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_atb = "atb_selectdisable";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_auto_clk_sw_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_bwctrl = "pll_bw_res_setting4";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c0_extclk_dllout_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c0_out_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c1_extclk_dllout_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c1_out_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c2_extclk_dllout_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c2_out_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c3_extclk_dllout_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c3_out_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c4_out_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c5_out_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c6_out_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c7_out_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c8_out_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_0_bypass_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_0_coarse_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_0_even_duty_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_0_fine_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_0_high = 1;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_0_in_src = "c_m_cnt_in_src_ph_mux_clk";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_0_low = 1;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_0_ph_mux_prst = 0;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_0_prst = 1;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_1_bypass_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_1_coarse_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_1_even_duty_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_1_fine_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_1_high = 2;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_1_in_src = "c_m_cnt_in_src_ph_mux_clk";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_1_low = 1;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_1_ph_mux_prst = 0;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_1_prst = 1;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_2_bypass_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_2_coarse_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_2_even_duty_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_2_fine_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_2_high = 3;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_2_in_src = "c_m_cnt_in_src_ph_mux_clk";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_2_low = 2;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_2_ph_mux_prst = 0;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_2_prst = 1;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_3_bypass_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_3_coarse_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_3_even_duty_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_3_fine_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_3_high = 256;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_3_in_src = "c_m_cnt_in_src_ph_mux_clk";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_3_low = 256;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_3_ph_mux_prst = 0;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_3_prst = 1;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_4_bypass_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_4_coarse_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_4_even_duty_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_4_fine_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_4_high = 256;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_4_in_src = "c_m_cnt_in_src_ph_mux_clk";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_4_low = 256;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_4_ph_mux_prst = 0;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_4_prst = 1;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_5_bypass_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_5_coarse_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_5_even_duty_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_5_fine_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_5_high = 256;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_5_in_src = "c_m_cnt_in_src_ph_mux_clk";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_5_low = 256;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_5_ph_mux_prst = 0;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_5_prst = 1;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_6_bypass_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_6_coarse_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_6_even_duty_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_6_fine_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_6_high = 256;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_6_in_src = "c_m_cnt_in_src_ph_mux_clk";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_6_low = 256;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_6_ph_mux_prst = 0;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_6_prst = 1;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_7_bypass_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_7_coarse_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_7_even_duty_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_7_fine_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_7_high = 256;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_7_in_src = "c_m_cnt_in_src_ph_mux_clk";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_7_low = 256;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_7_ph_mux_prst = 0;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_7_prst = 1;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_8_bypass_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_8_coarse_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_8_even_duty_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_8_fine_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_8_high = 256;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_8_in_src = "c_m_cnt_in_src_ph_mux_clk";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_8_low = 256;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_8_ph_mux_prst = 0;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_c_counter_8_prst = 1;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_clk_loss_edge = "pll_clk_loss_both_edges";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_clk_loss_sw_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_clk_sw_dly = 0;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_clkin_0_src = "pll_clkin_0_src_ioclkin_0";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_clkin_1_src = "pll_clkin_1_src_ioclkin_0";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_cmp_buf_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_coarse_dly_0 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_coarse_dly_1 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_coarse_dly_2 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_coarse_dly_3 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_cp_compensation = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_cp_current_setting = "pll_cp_setting14";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_ctrl_override_setting = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_dft_plniotri_override = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_dft_ppmclk = "c_cnt_out";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_dft_vco_ph0_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_dft_vco_ph1_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_dft_vco_ph2_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_dft_vco_ph3_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_dft_vco_ph4_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_dft_vco_ph5_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_dft_vco_ph6_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_dft_vco_ph7_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_dll_src = "pll_dll_src_vss";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_dly_0_enable = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_dly_1_enable = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_dly_2_enable = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_dly_3_enable = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_dprio_base_addr = 0;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_dprio_broadcast_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_dprio_cvp_inter_sel = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_dprio_force_inter_sel = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_dprio_power_iso_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_enable = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_extclk_0_cnt_src = "pll_extclk_cnt_src_vss";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_extclk_0_enable = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_extclk_0_invert = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_extclk_1_cnt_src = "pll_extclk_cnt_src_vss";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_extclk_1_enable = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_extclk_1_invert = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_fbclk_mux_1 = "pll_fbclk_mux_1_glb";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_fbclk_mux_2 = "pll_fbclk_mux_2_m_cnt";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_fine_dly_0 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_fine_dly_1 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_fine_dly_2 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_fine_dly_3 = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_lock_fltr_cfg = 25;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_lock_fltr_test = "pll_lock_fltr_nrm";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_m_counter_bypass_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_m_counter_coarse_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_m_counter_even_duty_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_m_counter_fine_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_m_counter_high = 12;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_m_counter_in_src = "c_m_cnt_in_src_ph_mux_clk";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_m_counter_low = 12;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_m_counter_ph_mux_prst = 0;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_m_counter_prst = 1;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_manu_clk_sw_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_n_counter_bypass_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_n_counter_coarse_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_n_counter_fine_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_n_counter_high = 3;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_n_counter_low = 2;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_n_counter_odd_div_duty_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_nreset_invert = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_phyfb_mux = "m_cnt_phmux_out";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_powerdown_mode = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_ref_buf_dly = "0 ps";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_ripplecap_ctrl = "pll_ripplecap_setting0";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_self_reset = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_sw_refclk_src = "pll_sw_refclk_src_clk_0";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_tclk_mux_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_tclk_sel = "pll_tclk_m_src";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_test_enable = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_testdn_enable = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_testup_enable = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_unlock_fltr_cfg = 2;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_vccr_pd_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_vco_ph0_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_vco_ph1_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_vco_ph2_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_vco_ph3_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_vco_ph4_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_vco_ph5_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_vco_ph6_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_vco_ph7_en = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_vreg_0p9v0_vccdreg_cal = "vccdreg_nominal";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_vreg_0p9v0_vreg_cal_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_vreg_0p9v1_vccdreg_cal = "vccdreg_nominal";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .pll_vreg_0p9v1_vreg_cal_en = "false";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .reference_clock_frequency = "125.0 mhz";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .silicon_rev = "reva";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .speed_grade = "2";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .use_default_base_address = "true";
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .user_base_address = 0;
defparam \iopll_0|altera_iopll_i|twentynm_pll|iopll_inst .vco_frequency = "600.0 mhz";

assign locked = \iopll_0|altera_iopll_i|twentynm_pll|lock ;

assign outclk_0 = \iopll_0|altera_iopll_i|twentynm_pll|outclk[0] ;

assign outclk_1 = \iopll_0|altera_iopll_i|twentynm_pll|outclk[1] ;

assign outclk_2 = \iopll_0|altera_iopll_i|twentynm_pll|outclk[2] ;

endmodule
