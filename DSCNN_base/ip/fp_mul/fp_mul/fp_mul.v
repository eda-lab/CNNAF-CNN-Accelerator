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

// DATE "11/18/2020 11:20:07"

// 
// Device: Altera 10AX066K3F40E2SG Package FBGA1517
// 

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module fp_mul (
	q,
	areset,
	b,
	a,
	clk)/* synthesis synthesis_greybox=0 */;
output 	[31:0] q;
input 	areset;
input 	[31:0] b;
input 	[31:0] a;
input 	clk;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \fp_functions_0|q[0] ;
wire \fp_functions_0|q[1] ;
wire \fp_functions_0|q[2] ;
wire \fp_functions_0|q[3] ;
wire \fp_functions_0|q[4] ;
wire \fp_functions_0|q[5] ;
wire \fp_functions_0|q[6] ;
wire \fp_functions_0|q[7] ;
wire \fp_functions_0|q[8] ;
wire \fp_functions_0|q[9] ;
wire \fp_functions_0|q[10] ;
wire \fp_functions_0|q[11] ;
wire \fp_functions_0|q[12] ;
wire \fp_functions_0|q[13] ;
wire \fp_functions_0|q[14] ;
wire \fp_functions_0|q[15] ;
wire \fp_functions_0|q[16] ;
wire \fp_functions_0|q[17] ;
wire \fp_functions_0|q[18] ;
wire \fp_functions_0|q[19] ;
wire \fp_functions_0|q[20] ;
wire \fp_functions_0|q[21] ;
wire \fp_functions_0|q[22] ;
wire \fp_functions_0|q[23] ;
wire \fp_functions_0|q[24] ;
wire \fp_functions_0|q[25] ;
wire \fp_functions_0|q[26] ;
wire \fp_functions_0|q[27] ;
wire \fp_functions_0|q[28] ;
wire \fp_functions_0|q[29] ;
wire \fp_functions_0|q[30] ;
wire \fp_functions_0|q[31] ;
wire \~GND~combout ;

wire [31:0] \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus ;

assign \fp_functions_0|q[0]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [0];
assign \fp_functions_0|q[1]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [1];
assign \fp_functions_0|q[2]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [2];
assign \fp_functions_0|q[3]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [3];
assign \fp_functions_0|q[4]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [4];
assign \fp_functions_0|q[5]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [5];
assign \fp_functions_0|q[6]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [6];
assign \fp_functions_0|q[7]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [7];
assign \fp_functions_0|q[8]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [8];
assign \fp_functions_0|q[9]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [9];
assign \fp_functions_0|q[10]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [10];
assign \fp_functions_0|q[11]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [11];
assign \fp_functions_0|q[12]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [12];
assign \fp_functions_0|q[13]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [13];
assign \fp_functions_0|q[14]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [14];
assign \fp_functions_0|q[15]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [15];
assign \fp_functions_0|q[16]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [16];
assign \fp_functions_0|q[17]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [17];
assign \fp_functions_0|q[18]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [18];
assign \fp_functions_0|q[19]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [19];
assign \fp_functions_0|q[20]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [20];
assign \fp_functions_0|q[21]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [21];
assign \fp_functions_0|q[22]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [22];
assign \fp_functions_0|q[23]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [23];
assign \fp_functions_0|q[24]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [24];
assign \fp_functions_0|q[25]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [25];
assign \fp_functions_0|q[26]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [26];
assign \fp_functions_0|q[27]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [27];
assign \fp_functions_0|q[28]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [28];
assign \fp_functions_0|q[29]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [29];
assign \fp_functions_0|q[30]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [30];
assign \fp_functions_0|q[31]  = \fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus [31];

twentynm_fp_mac \fp_functions_0|fpMulTest_impl_DSP0 (
	.accumulate(gnd),
	.chainin_overflow(gnd),
	.chainin_invalid(gnd),
	.chainin_underflow(gnd),
	.chainin_inexact(gnd),
	.ax(32'b00000000000000000000000000000000),
	.ay({b[31],b[30],b[29],b[28],b[27],b[26],b[25],b[24],b[23],b[22],b[21],b[20],b[19],b[18],b[17],b[16],b[15],b[14],b[13],b[12],b[11],b[10],b[9],b[8],b[7],b[6],b[5],b[4],b[3],b[2],b[1],b[0]}),
	.az({a[31],a[30],a[29],a[28],a[27],a[26],a[25],a[24],a[23],a[22],a[21],a[20],a[19],a[18],a[17],a[16],a[15],a[14],a[13],a[12],a[11],a[10],a[9],a[8],a[7],a[6],a[5],a[4],a[3],a[2],a[1],a[0]}),
	.clk({gnd,gnd,clk}),
	.aclr({areset,areset}),
	.ena({\~GND~combout ,\~GND~combout ,vcc}),
	.chainin(1'b0),
	.overflow(),
	.invalid(),
	.underflow(),
	.inexact(),
	.chainout_overflow(),
	.chainout_invalid(),
	.chainout_underflow(),
	.chainout_inexact(),
	.dftout(),
	.resulta(\fp_functions_0|fpMulTest_impl_DSP0_RESULTA_bus ),
	.chainout());
defparam \fp_functions_0|fpMulTest_impl_DSP0 .accum_adder_clock = "none";
defparam \fp_functions_0|fpMulTest_impl_DSP0 .accum_pipeline_clock = "none";
defparam \fp_functions_0|fpMulTest_impl_DSP0 .accumulate_clock = "none";
defparam \fp_functions_0|fpMulTest_impl_DSP0 .adder_input_clock = "none";
defparam \fp_functions_0|fpMulTest_impl_DSP0 .adder_subtract = "false";
defparam \fp_functions_0|fpMulTest_impl_DSP0 .ax_chainin_pl_clock = "none";
defparam \fp_functions_0|fpMulTest_impl_DSP0 .ax_clock = "none";
defparam \fp_functions_0|fpMulTest_impl_DSP0 .ay_clock = "0";
defparam \fp_functions_0|fpMulTest_impl_DSP0 .az_clock = "0";
defparam \fp_functions_0|fpMulTest_impl_DSP0 .mult_pipeline_clock = "0";
defparam \fp_functions_0|fpMulTest_impl_DSP0 .operation_mode = "sp_mult";
defparam \fp_functions_0|fpMulTest_impl_DSP0 .output_clock = "0";
defparam \fp_functions_0|fpMulTest_impl_DSP0 .use_chainin = "false";

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

assign q[0] = \fp_functions_0|q[0] ;

assign q[1] = \fp_functions_0|q[1] ;

assign q[2] = \fp_functions_0|q[2] ;

assign q[3] = \fp_functions_0|q[3] ;

assign q[4] = \fp_functions_0|q[4] ;

assign q[5] = \fp_functions_0|q[5] ;

assign q[6] = \fp_functions_0|q[6] ;

assign q[7] = \fp_functions_0|q[7] ;

assign q[8] = \fp_functions_0|q[8] ;

assign q[9] = \fp_functions_0|q[9] ;

assign q[10] = \fp_functions_0|q[10] ;

assign q[11] = \fp_functions_0|q[11] ;

assign q[12] = \fp_functions_0|q[12] ;

assign q[13] = \fp_functions_0|q[13] ;

assign q[14] = \fp_functions_0|q[14] ;

assign q[15] = \fp_functions_0|q[15] ;

assign q[16] = \fp_functions_0|q[16] ;

assign q[17] = \fp_functions_0|q[17] ;

assign q[18] = \fp_functions_0|q[18] ;

assign q[19] = \fp_functions_0|q[19] ;

assign q[20] = \fp_functions_0|q[20] ;

assign q[21] = \fp_functions_0|q[21] ;

assign q[22] = \fp_functions_0|q[22] ;

assign q[23] = \fp_functions_0|q[23] ;

assign q[24] = \fp_functions_0|q[24] ;

assign q[25] = \fp_functions_0|q[25] ;

assign q[26] = \fp_functions_0|q[26] ;

assign q[27] = \fp_functions_0|q[27] ;

assign q[28] = \fp_functions_0|q[28] ;

assign q[29] = \fp_functions_0|q[29] ;

assign q[30] = \fp_functions_0|q[30] ;

assign q[31] = \fp_functions_0|q[31] ;

endmodule
