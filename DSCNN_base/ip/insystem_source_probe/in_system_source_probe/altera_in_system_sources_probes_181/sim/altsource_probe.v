// (C) 2001-2018 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// synthesis VERILOG_INPUT_VERSION VERILOG_2001

////////////////////////////////////////////////////////////////////
//
//  ALTSOURCE_PROBE Parameterized Megafunction Body
//
//	(c) Altera Corporation, 2006
//
//	Version 1.0

//************************************************************
// Description:
//
// This module contains altsource_probe megafunction body
//************************************************************

///////////////////////////////////////////////////////////////////////////////
// Description    : IP for Interactive Probe. Capture internal signals using the
//          probe input, drive internal signals using the source output.
//          The captured value and the input source value generated are 
//          transmitted through the JTAG interface.
///////////////////////////////////////////////////////////////////////////////

module altsource_probe
(
    probe,
    source,
    source_clk,
    source_ena,

	raw_tck,
    tdi,
    usr1,
    jtag_state_cdr,
    jtag_state_sdr,
    jtag_state_e1dr,
    jtag_state_udr,
    jtag_state_cir,
    jtag_state_uir,
    jtag_state_tlr,
    clr,
    ena,
    ir_in,
    
    ir_out,
    tdo
);

    parameter lpm_type = "altsource_probe"; 	// required by the coding standard
    parameter lpm_hint = "UNUSED"; 				// required by the coding standard 

    parameter sld_auto_instance_index = "YES";	// Yes, if the instance index should be automatically assigned.
    parameter sld_instance_index = 0; 			// unique identifier for the altsource_probe instance.
    parameter SLD_NODE_INFO = 4746752 + sld_instance_index;   // The NODE ID to uniquely identify this node on the hub.  Type ID: 9 Version: 0 Inst: 0 MFG ID 110	@no_decl
	parameter sld_ir_width = 4; 				// @no_decl
										
    parameter instance_id = "UNUSED";  			// optional name for the instance.        
    parameter probe_width = 1;  				// probe port width
    parameter source_width= 1;  				// source port width
    parameter source_initial_value = "0";  		// initial source port value
    parameter enable_metastability = "NO";  	// yes to add two registe

    input	[probe_width - 1 : 0] probe;	// probe inputs
    output	[source_width - 1 : 0] source;	// source outputs
    input	source_clk;						// clock of the registers used to metastabilize the source output
    input tri1	source_ena;						// enable of the registers used to metastabilize the source output
    
    input	raw_tck;			// Real TCK from the JTAG HUB.	@no_decl
    input	tdi;				// TDI from the JTAG HUB.  It gets the data from JTAG TDI.	@no_decl
    input	usr1;				// USR1 from the JTAG HUB.  Indicate whether it is in USER1 or USER0	@no_decl
    input	jtag_state_cdr;		// CDR from the JTAG HUB.  Indicate whether it is in Capture_DR state.	@no_decl
    input	jtag_state_sdr;		// SDR from the JTAG HUB.  Indicate whether it is in Shift_DR state.	@no_decl
    input	jtag_state_e1dr;	// EDR from the JTAG HUB.  Indicate whether it is in Exit1_DR state.	@no_decl
    input	jtag_state_udr;		// UDR from the JTAG HUB.  Indicate whether it is in Update_DR state.	@no_decl
    input	jtag_state_cir;		// CIR from the JTAG HUB.  Indicate whether it is in Capture_IR state.	@no_decl
    input	jtag_state_uir;		// UIR from the JTAG HUB.  Indicate whether it is in Update_IR state.	@no_decl
    input	jtag_state_tlr;		// UIR from the JTAG HUB.  Indicate whether it is in Test_Logic_Reset state.	@no_decl
    input	clr;				// CLR from the JTAG HUB.  Indicate whether hub requests global reset.	@no_decl
    input	ena;				// ENA from the JTAG HUB.  Indicate whether this node should establish JTAG chain.	@no_decl
    input	[sld_ir_width - 1 : 0] ir_in;	// IR_OUT from the JTAG HUB.  It hold the current instruction for the node.		@no_decl
    
    output	[sld_ir_width - 1 : 0] ir_out;	// IR_IN to the JTAG HUB.  It supplies the updated value for IR_IN.	@no_decl
    output	tdo;				//TDO to the JTAG HUB.  It supplies the data to JTAG TDO.	@no_decl

	assign tdo = 1'b0;
	assign ir_out = 1'b0;
	assign source = 1'b0;
    
endmodule
