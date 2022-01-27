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

// DATE "10/28/2020 10:45:47"

// 
// Device: Altera 10AX066K3F40E2SG Package FBGA1517
// 

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module in_system_source_probe (
	source,
	altera_reserved_tdo,
	altera_reserved_tck,
	altera_reserved_tdi,
	altera_reserved_tms,
	source_clk,
	probe)/* synthesis synthesis_greybox=1 */;
output 	[4:0] source;
output 	altera_reserved_tdo;
input 	altera_reserved_tck;
input 	altera_reserved_tdi;
input 	altera_reserved_tms;
input 	source_clk;
input 	[2:0] probe;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|tdo~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|ext_tdo ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tdi ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[2]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[1]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[11]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[13]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[1]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[6]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_reg[1]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[5]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][1]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|int_tdo_reg~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[2]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i336~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[4]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i347~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[15]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i345~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i347~1_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[1]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[6]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[7]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[8]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[9]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[2]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[0]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[3]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[4]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[5]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_0~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_1~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[12]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[14]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i80~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[9]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i14~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i26~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[7]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i28~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i32~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i38~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Decoder_0~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[1]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i93~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|prev_irsr_sel_reg[0]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i368~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_3~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~1_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~2_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[0]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[0]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~3_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~4_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i24~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_0~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i96~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[10]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i47~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i51~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[0]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i9~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i36~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~1_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[0]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~2_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~3_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~4_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[1]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[0]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i202~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~1_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~1_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[1]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[1]~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[1]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i19~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reset_ena_reg~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~1_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~2_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i43~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i41~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i48~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i5~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i6~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i33~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i141~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[1]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~2_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~3_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[3]~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i212~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_8~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~1_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~2_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~3_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[2]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[4]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[2]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~1_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~2_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[2]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~1_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[3]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[2]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~4_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~5_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[1]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3]~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[3]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[3]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~3_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~4_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|reduce_nor_0~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~1_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~2_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[3]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~2_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[3]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~6_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~7_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[2]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~5_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~6_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~3_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~3_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3]~q ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~4_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~4_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[2]~0_combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[0]~1_combout ;
wire \auto_fab_0|~VCC~combout ;
wire \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~_wirecell_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[0]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[1]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[2]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[3]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[4]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[0]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|bypass_reg~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[0]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[0]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[1]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[2]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[3]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[4]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[1]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~0_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[3]~0_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[1]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|vjtag_sdr_i~0_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~0_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[0]~0_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[1]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[2]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[3]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[4]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[2]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[1]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[0]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[2]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|vjtag_uir_i~combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~1_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[2]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~1_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~0_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~1_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[1]~2_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[2]~3_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[3]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[3]~4_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[4]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[4]~5_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[3]~q ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~2_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~0_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[0]~0_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~1_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~2_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~2_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~3_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[4]~1_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~4_combout ;
wire \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~3_combout ;
wire \~GND~combout ;


twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|tdo~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]~q ),
	.datac(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[0]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][1]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]~q ),
	.dataf(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[0]~q ),
	.datag(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|bypass_reg~q ),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|tdo~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|tdo~0 .extended_lut = "on";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|tdo~0 .lut_mask = 64'hF9F6F9F6F9F6F9F6;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|tdo~0 .shared_arith = "off";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[0] (
	.clk(source_clk),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[0]~q ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[0]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[0] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[0] .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[1] (
	.clk(source_clk),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[1]~q ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[1]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[1] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[1] .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[2] (
	.clk(source_clk),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[2]~q ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[2]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[2] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[2] .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[3] (
	.clk(source_clk),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[3]~q ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[3]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[3] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[3] .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[4] (
	.clk(source_clk),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[4]~q ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[4]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[4] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[4] .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[0] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~0_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[3]~0_combout ),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[0]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[0] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[0] .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|bypass_reg (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tdi ),
	.asdata(vcc),
	.clrn(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~_wirecell_combout ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|bypass_reg~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|bypass_reg .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|bypass_reg .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[0] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~0_combout ),
	.asdata(vcc),
	.clrn(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~_wirecell_combout ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[0]~0_combout ),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[0]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[0] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[0] .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[0] (
	.clk(source_clk),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~q ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[0]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[0] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[0] .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[1] (
	.clk(source_clk),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[1]~q ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[1]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[1] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[1] .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[2] (
	.clk(source_clk),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[2]~q ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[2]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[2] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[2] .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[3] (
	.clk(source_clk),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[3]~q ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[3]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[3] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[3] .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[4] (
	.clk(source_clk),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[4]~q ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[4]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[4] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l1_reg[4] .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[1] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~1_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[3]~0_combout ),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[1]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[1] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[1] .power_up = "low";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datac(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[1]~q ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~0 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~0 .lut_mask = 64'hBFBFBFBFBFBFBFBF;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~0 .shared_arith = "off";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[3]~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_reg[1]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8]~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[3]~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[3]~0 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[3]~0 .lut_mask = 64'hFFFFFFB8FFFFFFB8;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[3]~0 .shared_arith = "off";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[1] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~1_combout ),
	.asdata(vcc),
	.clrn(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~_wirecell_combout ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[0]~0_combout ),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[1]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[1] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[1] .power_up = "low";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|vjtag_sdr_i~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_reg[1]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|vjtag_sdr_i~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|vjtag_sdr_i~0 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|vjtag_sdr_i~0 .lut_mask = 64'hDFDFDFDFDFDFDFDF;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|vjtag_sdr_i~0 .shared_arith = "off";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]~q ),
	.datab(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[0]~q ),
	.datac(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[1]~q ),
	.datad(!probe[0]),
	.datae(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|vjtag_sdr_i~0_combout ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~0 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~0 .lut_mask = 64'h7FFFBFFF7FFFBFFF;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~0 .shared_arith = "off";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[0]~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_reg[1]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][1]~q ),
	.dataf(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]~q ),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[0]~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[0]~0 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[0]~0 .lut_mask = 64'hFFFFFFFFFFFFFFFB;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[0]~0 .shared_arith = "off";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~1_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0] .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[1] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[1]~2_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[1]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[1] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[1] .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[2] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[2]~3_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[2]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[2] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[2] .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[3] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[3]~4_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[3]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[3] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[3] .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[4] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[4]~5_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[4]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[4] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[4] .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[2] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~2_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[3]~0_combout ),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[2]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[2] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[2] .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[1] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~0_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[0]~0_combout ),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[1]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[1] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[1] .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[0] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~1_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[0]~0_combout ),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[0]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[0] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[0] .power_up = "low";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[2] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~2_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[0]~0_combout ),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[2]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[2] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[2] .power_up = "low";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|vjtag_uir_i (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_reg[1]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8]~q ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|vjtag_uir_i~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|vjtag_uir_i .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|vjtag_uir_i .lut_mask = 64'h7F7F7F7F7F7F7F7F;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|vjtag_uir_i .shared_arith = "off";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~1 (
	.dataa(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[2]~q ),
	.datab(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[1]~q ),
	.datac(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[0]~q ),
	.datad(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[2]~q ),
	.datae(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|vjtag_sdr_i~0_combout ),
	.dataf(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|vjtag_uir_i~combout ),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~1_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~1 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~1 .lut_mask = 64'hFFFFFFFFDFDFFF5F;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~1 .shared_arith = "off";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[2] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~2_combout ),
	.asdata(vcc),
	.clrn(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~_wirecell_combout ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[0]~0_combout ),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[2]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[2] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[2] .power_up = "low";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~1 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]~q ),
	.datab(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[1]~q ),
	.datac(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[2]~q ),
	.datad(!probe[1]),
	.datae(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|vjtag_sdr_i~0_combout ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~1_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~1 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~1 .lut_mask = 64'h7FFFBFFF7FFFBFFF;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~1 .shared_arith = "off";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_reg[1]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~_wirecell_combout ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[5]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~0 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~0 .lut_mask = 64'hFDFFFFFFFDFFFFFF;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~0 .shared_arith = "off";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~1 (
	.dataa(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[0]~q ),
	.datab(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~q ),
	.datac(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~0_combout ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~1_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~1 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~1 .lut_mask = 64'h5353535353535353;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~1 .shared_arith = "off";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[1]~2 (
	.dataa(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[1]~q ),
	.datab(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[1]~q ),
	.datac(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~0_combout ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[1]~2_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[1]~2 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[1]~2 .lut_mask = 64'h5353535353535353;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[1]~2 .shared_arith = "off";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[2]~3 (
	.dataa(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[2]~q ),
	.datab(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[2]~q ),
	.datac(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~0_combout ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[2]~3_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[2]~3 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[2]~3 .lut_mask = 64'h5353535353535353;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[2]~3 .shared_arith = "off";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[3] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~3_combout ),
	.asdata(vcc),
	.clrn(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~_wirecell_combout ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[4]~1_combout ),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[3]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[3] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[3] .power_up = "low";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[3]~4 (
	.dataa(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[3]~q ),
	.datab(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[3]~q ),
	.datac(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~0_combout ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[3]~4_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[3]~4 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[3]~4 .lut_mask = 64'h5353535353535353;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[3]~4 .shared_arith = "off";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[4] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~4_combout ),
	.asdata(vcc),
	.clrn(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~_wirecell_combout ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[4]~1_combout ),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[4]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[4] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[4] .power_up = "low";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[4]~5 (
	.dataa(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[4]~q ),
	.datab(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[4]~q ),
	.datac(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[0]~0_combout ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[4]~5_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[4]~5 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[4]~5 .lut_mask = 64'h5353535353535353;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|hold_reg[4]~5 .shared_arith = "off";

dffeas \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[3] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~3_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[3]~0_combout ),
	.q(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[3]~q ),
	.prn(vcc));
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[3] .is_wysiwyg = "true";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[3] .power_up = "low";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~2 (
	.dataa(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[1]~q ),
	.datab(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[0]~q ),
	.datac(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[2]~q ),
	.datad(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|WORD_SR[3]~q ),
	.datae(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|vjtag_sdr_i~0_combout ),
	.dataf(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|vjtag_uir_i~combout ),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~2_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~2 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~2 .lut_mask = 64'hF7FFFFFFF7FF77FF;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~2 .shared_arith = "off";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_reg[1]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8]~q ),
	.datad(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[1]~q ),
	.datae(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[0]~q ),
	.dataf(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[2]~q ),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~0 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~0 .lut_mask = 64'hFFFFFFFFFEFFFFFE;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~0 .shared_arith = "off";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[0]~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_reg[1]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8]~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[0]~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[0]~0 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[0]~0 .lut_mask = 64'hFFFFB8FFFFFFB8FF;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[0]~0 .shared_arith = "off";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~1 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_reg[1]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8]~q ),
	.datad(gnd),
	.datae(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[0]~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~1_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~1 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~1 .lut_mask = 64'hFFFFFEFEFFFFFEFE;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~1 .shared_arith = "off";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~2 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_reg[1]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8]~q ),
	.datad(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[1]~q ),
	.datae(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[0]~q ),
	.dataf(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|word_counter[2]~q ),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~2_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~2 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~2 .lut_mask = 64'hFEFFFFFFFFFFFEFF;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i47~2 .shared_arith = "off";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~2 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]~q ),
	.datab(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[2]~q ),
	.datac(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[3]~q ),
	.datad(!probe[2]),
	.datae(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|vjtag_sdr_i~0_combout ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~2_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~2 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~2 .lut_mask = 64'h7FFFBFFF7FFFBFFF;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~2 .shared_arith = "off";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~3 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_reg[1]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datad(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[3]~q ),
	.datae(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[4]~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~3_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~3 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~3 .lut_mask = 64'h96FFFFFF96FFFFFF;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~3 .shared_arith = "off";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[4]~1 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_reg[1]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[4]~1_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[4]~1 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[4]~1 .lut_mask = 64'hFFFFFFFBFFFFFFFB;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|shift_reg[4]~1 .shared_arith = "off";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~4 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tdi ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_reg[1]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datae(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[4]~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~4_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~4 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~4 .lut_mask = 64'hD77DFFFFD77DFFFF;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|i68~4 .shared_arith = "off";

twentynm_lcell_comb \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~3 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tdi ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_reg[1]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~3_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~3 .extended_lut = "off";
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~3 .lut_mask = 64'hF7FFF7FFF7FFF7FF;
defparam \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|no_instance_id_gen:rom_info_inst|i55~3 .shared_arith = "off";

twentynm_lcell_comb \~GND (
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\~GND~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \~GND .extended_lut = "off";
defparam \~GND .lut_mask = 64'h0000000000000000;
defparam \~GND .shared_arith = "off";

twentynm_jtag \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|atom (
	.tms(altera_reserved_tms),
	.tck(altera_reserved_tck),
	.tdi(altera_reserved_tdi),
	.ntrst(gnd),
	.tdoutap(gnd),
	.tdouser(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|int_tdo_reg~q ),
	.tmscore(gnd),
	.tckcore(gnd),
	.tdicore(gnd),
	.ntrstcore(gnd),
	.tmscorehps(gnd),
	.tckcorehps(gnd),
	.tdicorehps(gnd),
	.ntrstcorehps(gnd),
	.tdocorefrwl(gnd),
	.corectl(vcc),
	.ntdopinena(vcc),
	.tdo(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|ext_tdo ),
	.tmsutap(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.tckutap(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.tdiutap(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tdi ),
	.ntrstutap(),
	.tmsuhps(),
	.tckuhps(),
	.tdiuhps(),
	.ntrstuhps(),
	.tmscoreout(),
	.tckcoreout(),
	.tdocorehps(),
	.ntrstcoreout(),
	.tdocore(),
	.shiftuser(),
	.clkdruser(),
	.updateuser(),
	.runidleuser(),
	.usr1user());

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i28~combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[2] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i9~combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[2]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[2] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[2] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[1] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i19~combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[1]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[1] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[1] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[11] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i43~combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[11]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[11] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[11] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[13] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i48~combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[13]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[13] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[13] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[1] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i6~combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[1]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[1] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[1] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[6] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i33~combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[6]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[6] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[6] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_reg[1] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i347~1_combout ),
	.asdata(vcc),
	.clrn(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_reg[1]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_reg[1] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_reg[1] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_1~combout ),
	.asdata(vcc),
	.clrn(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i80~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i14~0_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i26~combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[5] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i32~combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[5]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[5] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[5] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i38~0_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]~q ),
	.asdata(vcc),
	.clrn(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Decoder_0~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][0] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][1] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[1]~q ),
	.asdata(vcc),
	.clrn(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Decoder_0~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][1]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][1] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][1] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]~q ),
	.asdata(vcc),
	.clrn(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Decoder_0~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][2] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~q ),
	.asdata(vcc),
	.clrn(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Decoder_0~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|int_tdo_reg (
	.clk(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~4_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|int_tdo_reg~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|int_tdo_reg .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|int_tdo_reg .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~0_combout ),
	.asdata(vcc),
	.clrn(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[2] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i24~0_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[2]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[2] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[2] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i336 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[2]~q ),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i336~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i336 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i336 .lut_mask = 64'h7777777777777777;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i336 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[4] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~0_combout ),
	.asdata(vcc),
	.clrn(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[4]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[4] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[4] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i347~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tdi ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[4]~q ),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i347~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i347~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i347~0 .lut_mask = 64'h7BFF7BFF7BFF7BFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i347~0 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_0~combout ),
	.asdata(vcc),
	.clrn(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i80~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[15] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i80~0_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[15]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[15] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[15] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i345~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[15]~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i345~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i345~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i345~0 .lut_mask = 64'h7BFFFFFF7BFFFFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i345~0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i347~1 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|node_ena_reg[1]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i336~combout ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i347~0_combout ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i345~0_combout ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i347~1_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i347~1 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i347~1 .lut_mask = 64'hDDFFF5FFDDFFF5FF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i347~1 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i96~combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[1] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[2]~q ),
	.asdata(vcc),
	.clrn(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[11]~q ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[1]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[1] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[1] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[6] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[7]~q ),
	.asdata(vcc),
	.clrn(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[11]~q ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[6]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[6] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[6] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[7] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[8]~q ),
	.asdata(vcc),
	.clrn(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[11]~q ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[7]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[7] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[7] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[8] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[9]~q ),
	.asdata(vcc),
	.clrn(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[11]~q ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[8]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[8] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[8] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[9] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tdi ),
	.asdata(vcc),
	.clrn(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[11]~q ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[9]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[9] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[9] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[2] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[2]~0_combout ),
	.asdata(vcc),
	.clrn(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[11]~q ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[2]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[2] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[2] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[0] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[0]~1_combout ),
	.asdata(vcc),
	.clrn(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[11]~q ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[0]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[0] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[0] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[3] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[4]~q ),
	.asdata(vcc),
	.clrn(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[11]~q ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[3]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[3] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[3] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[4] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[5]~q ),
	.asdata(vcc),
	.clrn(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[11]~q ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[4]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[4] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[4] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[5] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[6]~q ),
	.asdata(vcc),
	.clrn(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[11]~q ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[5]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[5] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[5] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_0~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[2]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[0]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[3]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[4]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[5]~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_0~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_0~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_0~0 .lut_mask = 64'hFFFFFFEFFFFFFFEF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_0~0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_1 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[1]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[6]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[7]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[8]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[9]~q ),
	.dataf(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_0~0_combout ),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_1~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_1 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_1 .lut_mask = 64'hFFFFFFFEFFFFFFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_1 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[12] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i47~0_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[12]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[12] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[12] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[14] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i51~combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[14]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[14] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[14] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i80~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[12]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[14]~q ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i80~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i80~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i80~0 .lut_mask = 64'h7F7F7F7F7F7F7F7F;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i80~0 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[9] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i336~combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[9]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[9] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[9] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i14~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[9]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[2]~q ),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i14~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i14~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i14~0 .lut_mask = 64'hFFFBFFFBFFFBFFFB;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i14~0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i26 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[2]~q ),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i26~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i26 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i26 .lut_mask = 64'hBBBBBBBBBBBBBBBB;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i26 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[7] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i36~combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[7]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[7] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[7] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i28 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[7]~q ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i28~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i28 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i28 .lut_mask = 64'h7F7F7F7F7F7F7F7F;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i28 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i32 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i32~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i32 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i32 .lut_mask = 64'h7F7F7F7F7F7F7F7F;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i32 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i38~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[5]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[7]~q ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i38~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i38~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i38~0 .lut_mask = 64'h7F7F7F7F7F7F7F7F;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i38~0 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~1_combout ),
	.asdata(vcc),
	.clrn(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Decoder_0~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[5]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[4]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[7]~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Decoder_0~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Decoder_0~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Decoder_0~0 .lut_mask = 64'h7FFFFFFF7FFFFFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|Decoder_0~0 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[1] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~2_combout ),
	.asdata(vcc),
	.clrn(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[1]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[1] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[1] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~3_combout ),
	.asdata(vcc),
	.clrn(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~4_combout ),
	.asdata(vcc),
	.clrn(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i93 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i93~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i93 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i93 .lut_mask = 64'h7777777777777777;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i93 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|prev_irsr_sel_reg[0] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[4]~q ),
	.asdata(vcc),
	.clrn(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|prev_irsr_sel_reg[0]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|prev_irsr_sel_reg[0] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|prev_irsr_sel_reg[0] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i368~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[4]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|prev_irsr_sel_reg[0]~q ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i368~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i368~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i368~0 .lut_mask = 64'h2727272727272727;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i368~0 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~0_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~q ),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~0 .lut_mask = 64'hFFF7FFF7FFF7FFF7;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~0 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~1_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~1_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_3~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[1]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]~q ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_3~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_3~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_3~0 .lut_mask = 64'hDFDFDFDFDFDFDFDF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_3~0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~1 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[4]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[1]~q ),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~1_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~1 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~1 .lut_mask = 64'hEFFFEFFFEFFFEFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~1 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~2 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[0]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_3~0_combout ),
	.dataf(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~1_combout ),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~2_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~2 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~2 .lut_mask = 64'h5FFF3FFFFFFFFFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~2 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[0] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~0_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[1]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[0]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[0] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[0] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[0] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~0_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i93~combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[0]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[0] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[0] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~3 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[1]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[0]~q ),
	.dataf(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[0]~q ),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~3_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~3 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~3 .lut_mask = 64'hF9F6FFFFFFFFFFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~3 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~4 (
	.dataa(!\in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|tdo~0_combout ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i93~combout ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i368~0_combout ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~0_combout ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~2_combout ),
	.dataf(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~3_combout ),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~4_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~4 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~4 .lut_mask = 64'hF737FFFFFFFFFFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo~4 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[5]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[7]~q ),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~0 .lut_mask = 64'h7FFF7FFF7FFF7FFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[4]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[1]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]~q ),
	.dataf(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~0_combout ),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~0 .lut_mask = 64'hFFFFDF7FFFFF7FDF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i24~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[15]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[1]~q ),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i24~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i24~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i24~0 .lut_mask = 64'h7FFF7FFF7FFF7FFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i24~0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tdi ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[4]~q ),
	.datae(!\~GND~combout ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~0 .lut_mask = 64'h7DFFFFFF7DFFFFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[1]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[6]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[7]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[8]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[9]~q ),
	.dataf(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_0~0_combout ),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_0~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_0 .lut_mask = 64'hFFFFFFFDFFFFFFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_0 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~2_combout ),
	.asdata(vcc),
	.clrn(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i96 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[1]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~q ),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i96~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i96 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i96 .lut_mask = 64'h7777777777777777;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i96 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[10] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i41~combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[10]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[10] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[10] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i47~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[11]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[10]~q ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i47~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i47~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i47~0 .lut_mask = 64'h7F7F7F7F7F7F7F7F;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i47~0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i51 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[13]~q ),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i51~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i51 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i51 .lut_mask = 64'h7777777777777777;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i51 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[0] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i5~combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[0]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[0] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[0] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i9 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[2]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[0]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[1]~q ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i9~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i9 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i9 .lut_mask = 64'h9696969696969696;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i9 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i36 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[6]~q ),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i36~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i36 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i36 .lut_mask = 64'h7777777777777777;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i36 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~1 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[1]~q ),
	.datac(!\~GND~combout ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~1_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~1 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~1 .lut_mask = 64'h2727272727272727;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~1 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[0] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i141~0_combout ),
	.asdata(vcc),
	.clrn(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|clr_reg~q ),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[0]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[0] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[0] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[4]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~q ),
	.dataf(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[0]~q ),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]~0 .lut_mask = 64'h7FFFFFFFDFFFFFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]~0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~2 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]~q ),
	.datac(!\~GND~combout ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~2_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~2 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~2 .lut_mask = 64'h2727272727272727;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~2 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~3 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~q ),
	.datac(!\~GND~combout ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~3_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~3 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~3 .lut_mask = 64'h2727272727272727;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~3 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~4 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[4]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[3]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[0]~q ),
	.dataf(!\~GND~combout ),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~4_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~4 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~4 .lut_mask = 64'hFFFF96FFFFFFFFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i170~4 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tdi ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~q ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~0 .lut_mask = 64'h4747474747474747;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|tdo_bypass_reg~0 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[1] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~3_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~1_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[1]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[1] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[1] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[0] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0]~q ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[3]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[0]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[0] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[0] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i202 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg~q ),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i202~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i202 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i202 .lut_mask = 64'h7777777777777777;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i202 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~4_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~0_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~1_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~2_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~3_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1]~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~0 .lut_mask = 64'h7FFFFFFF7FFFFFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1]~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~0 .lut_mask = 64'h9669699696696996;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~1 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[1]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[0]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i202~combout ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~0_combout ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~0_combout ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~1_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~1 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~1 .lut_mask = 64'h7FF7FFFF7FF7FFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~1 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~1 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg~q ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~1_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~1 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~1 .lut_mask = 64'h7F7F7F7F7F7F7F7F;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~1 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[1] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~2_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[1]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[1]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[1] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[1] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[1]~q ),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~0 .lut_mask = 64'hFBFFFBFFFBFFFBFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[1]~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[1]~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[1]~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[1]~0 .lut_mask = 64'h7FFFFFFF7FFFFFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[1]~0 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[1] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~1_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i93~combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[1]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[1] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[1] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[1]~q ),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~0 .lut_mask = 64'h7777777777777777;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i19 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[15]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[1]~q ),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i19~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i19 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i19 .lut_mask = 64'hBFFFBFFFBFFFBFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i19 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reset_ena_reg (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irf_reg[1][3]~0_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(vcc),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reset_ena_reg~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reset_ena_reg .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reset_ena_reg .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~1 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[4]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[1]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]~q ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~1_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~1 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~1 .lut_mask = 64'hBFBFBFBFBFBFBFBF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~1 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~2 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[1]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reset_ena_reg~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~1_combout ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~2_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~2 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~2 .lut_mask = 64'hAF3FFFFFAF3FFFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~2 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i43 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[14]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[11]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[10]~q ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i43~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i43 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i43 .lut_mask = 64'h7F7F7F7F7F7F7F7F;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i43 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i41 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[9]~q ),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i41~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i41 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i41 .lut_mask = 64'hBBBBBBBBBBBBBBBB;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i41 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i48 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[12]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[13]~q ),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i48~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i48 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i48 .lut_mask = 64'h7777777777777777;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i48 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i5 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tms ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[0]~q ),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i5~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i5 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i5 .lut_mask = 64'hDDDDDDDDDDDDDDDD;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i5 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i6 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[0]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|tms_cnt[1]~q ),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i6~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i6 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i6 .lut_mask = 64'h6666666666666666;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i6 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i33 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[5]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[6]~q ),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i33~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i33 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i33 .lut_mask = 64'h7777777777777777;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|i33 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i141~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[4]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[1]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]~q ),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i141~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i141~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i141~0 .lut_mask = 64'hFFBFFFBFFFBFFFBF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i141~0 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~5_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~1_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[1] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[1]~q ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[3]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[1]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[1] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[1] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~2 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1]~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~2_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~2 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~2 .lut_mask = 64'h9669699696696996;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~2 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~3 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[1]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i202~combout ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~0_combout ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~2_combout ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~3_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~3 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~3 .lut_mask = 64'h7FF7FFFF7FF7FFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~3 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[1]~q ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[0] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[3]~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_mode_reg[2]~1_combout ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[3]~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[3]~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[3]~0 .lut_mask = 64'hFFBFFFFFFFBFFFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[3]~0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i212 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8]~q ),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i212~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i212 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i212 .lut_mask = 64'h7777777777777777;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i212 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_8 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1]~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_8~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_8 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_8 .lut_mask = 64'hFFFFFFFEFFFFFFFE;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_8 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg~q ),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~0 .lut_mask = 64'h7FFF7FFF7FFF7FFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3]~q ),
	.datac(gnd),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1]~q ),
	.dataf(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i212~combout ),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~0 .lut_mask = 64'h66999966FFFFFFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~1 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1]~q ),
	.dataf(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i212~combout ),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~1_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~1 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~1 .lut_mask = 64'h96696996FFFFFFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~1 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~2 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i212~combout ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_8~combout ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~2_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~2 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~2 .lut_mask = 64'hBFBFBFBFBFBFBFBF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~2 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~3 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i212~combout ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|reduce_nor_8~combout ),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~3_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~3 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~3 .lut_mask = 64'h6FFF6FFF6FFF6FFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~3 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[2] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~4_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[1]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[2]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[2] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[2] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~0_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[4] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~1_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[4]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[4] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[4] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~2_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[2] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~4_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[2]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[2] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[2] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~1 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[4]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[2]~q ),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~1_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~1 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~1 .lut_mask = 64'hFFDFFFDFFFDFFFDF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~1 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~2 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[2]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i212~combout ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~1_combout ),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~2_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~2 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~2 .lut_mask = 64'hB1FFB1FFB1FFB1FF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~2 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[2] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~2_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i93~combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[2]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[2] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[2] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~1 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[2]~q ),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~1_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~1 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~1 .lut_mask = 64'hBBBBBBBBBBBBBBBB;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~1 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[3] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~7_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~1_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[3]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[3] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[3] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[2] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[2]~q ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[3]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[2]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[2] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[2] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~4 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1]~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~4_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~4 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~4 .lut_mask = 64'hF6F9F9F6F6F9F9F6;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~4 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~5 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[3]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[2]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i202~combout ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~0_combout ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~4_combout ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~5_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~5 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~5 .lut_mask = 64'h7FF7FFFF7FF7FFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~5 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[1] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[2]~q ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[1]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[1] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[1] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3]~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[4]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[0]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[1]~q ),
	.dataf(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|irsr_reg[2]~q ),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3]~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3]~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3]~0 .lut_mask = 64'hFFF7FFFFFFFFFFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3]~0 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[3] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~6_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[1]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[3]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[3] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[3] .power_up = "low";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[3] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~3_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[3]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[3] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[3] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~3 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[4]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[2]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[3]~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~3_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~3 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~3 .lut_mask = 64'hDEEDEDDEDEEDEDDE;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~3 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~4 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|WORD_SR[3]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i212~combout ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~3_combout ),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~4_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~4 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~4 .lut_mask = 64'hB1FFB1FFB1FFB1FF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~4 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|reduce_nor_0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[4]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[2]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[3]~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|reduce_nor_0~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|reduce_nor_0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|reduce_nor_0 .lut_mask = 64'hFFFFFFFBFFFFFFFB;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|reduce_nor_0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i212~combout ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|reduce_nor_0~combout ),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~0 .lut_mask = 64'hFEFEFEFEFEFEFEFE;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_ir_scan_reg~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[8]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|virtual_dr_scan_reg~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~0 .lut_mask = 64'hF7FFFFFFF7FFFFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~1 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[4]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[2]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[3]~q ),
	.dataf(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i212~combout ),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~1_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~1 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~1 .lut_mask = 64'hFFFFFFFF96696996;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~1 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~2 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i212~combout ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|reduce_nor_0~combout ),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~2_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~2 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~2 .lut_mask = 64'hFFF6FFF6FFF6FFF6;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~2 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[3] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~3_combout ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i93~combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[3]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[3] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[3] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~2 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_minor_ver_reg[3]~q ),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~2_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~2 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~2 .lut_mask = 64'h7777777777777777;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~2 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[3] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3]~q ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[3]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[3]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[3] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[3] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~6 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[3]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[4]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1]~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~6_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~6 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~6 .lut_mask = 64'hF6F9F9F6F6F9F9F6;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~6 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~7 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tdi ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mix_writedata[3]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i202~combout ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|design_hash_reg[2]~0_combout ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~6_combout ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~7_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~7 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~7 .lut_mask = 64'h7FF7FFFF7FF7FFFF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i211~7 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[2] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3]~q ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[2]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[2] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[2] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~5 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~q ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[4]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[2]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[3]~q ),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~5_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~5 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~5 .lut_mask = 64'hFFFFEFFEFFFFEFFE;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~5 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~6 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tdi ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[4]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i212~combout ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~5_combout ),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~6_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~6 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~6 .lut_mask = 64'hD1FFD1FFD1FFD1FF;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i106~6 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~3 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~q ),
	.datab(gnd),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[2]~q ),
	.datae(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[3]~q ),
	.dataf(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i212~combout ),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~3_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~3 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~3 .lut_mask = 64'hFFFFFFFF5AA5A55A;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~3 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~3 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tdi ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[3]~q ),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~3_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~3 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~3 .lut_mask = 64'hDDDDDDDDDDDDDDDD;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i193~3 .shared_arith = "off";

dffeas \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3] (
	.clk(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tck ),
	.d(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|core_tdi ),
	.asdata(vcc),
	.clrn(vcc),
	.aload(gnd),
	.sclr(gnd),
	.sload(gnd),
	.ena(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3]~0_combout ),
	.q(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3]~q ),
	.prn(vcc));
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3] .is_wysiwyg = "true";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|identity_contrib_shift_reg[3] .power_up = "low";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~4 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i212~combout ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[2]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[1]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|word_counter[0]~q ),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~4_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~4 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~4 .lut_mask = 64'hEBBEEBBEEBBEEBBE;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|hub_info_reg|i98~4 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~4 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i212~combout ),
	.datab(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[1]~q ),
	.datac(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[0]~q ),
	.datad(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|mixer_addr_reg_internal[2]~q ),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~4_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~4 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~4 .lut_mask = 64'hD77DD77DD77DD77D;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|i230~4 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[2]~0 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[3]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[2]~0_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[2]~0 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[2]~0 .lut_mask = 64'hAAAAAAAAAAAAAAAA;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[2]~0 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[0]~1 (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[1]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[0]~1_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[0]~1 .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[0]~1 .lut_mask = 64'hAAAAAAAAAAAAAAAA;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|jtag_ir_reg[0]~1 .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~_wirecell (
	.dataa(!\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~q ),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~_wirecell_combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~_wirecell .extended_lut = "off";
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~_wirecell .lut_mask = 64'hAAAAAAAAAAAAAAAA;
defparam \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|sldfabric|jtag_hub_gen:real_sld_jtag_hub|shadow_jsm|state[0]~_wirecell .shared_arith = "off";

twentynm_lcell_comb \auto_fab_0|~VCC (
	.dataa(gnd),
	.datab(gnd),
	.datac(gnd),
	.datad(gnd),
	.datae(gnd),
	.dataf(gnd),
	.datag(gnd),
	.cin(gnd),
	.sharein(gnd),
	.combout(\auto_fab_0|~VCC~combout ),
	.sumout(),
	.cout(),
	.shareout());
defparam \auto_fab_0|~VCC .extended_lut = "off";
defparam \auto_fab_0|~VCC .lut_mask = 64'h0000000000000000;
defparam \auto_fab_0|~VCC .shared_arith = "off";

assign source[0] = \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[0]~q ;

assign source[1] = \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[1]~q ;

assign source[2] = \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[2]~q ;

assign source[3] = \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[3]~q ;

assign source[4] = \in_system_sources_probes_0|issp_impl|altsource_probe_body_inst|wider_source_gen:wider_source_inst|metastable_l2_reg[4]~q ;

assign altera_reserved_tdo = \auto_fab_0|alt_sld_fab_0|alt_sld_fab_0|jtagpins|atom_inst|ext_tdo ;

endmodule
