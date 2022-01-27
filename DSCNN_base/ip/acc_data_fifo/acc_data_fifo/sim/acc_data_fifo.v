// acc_data_fifo.v

// Generated using ACDS version 18.1 222

`timescale 1 ps / 1 ps
module acc_data_fifo (
		input  wire [511:0] data,    //  fifo_input.datain
		input  wire         wrreq,   //            .wrreq
		input  wire         rdreq,   //            .rdreq
		input  wire         wrclk,   //            .wrclk
		input  wire         rdclk,   //            .rdclk
		input  wire         aclr,    //            .aclr
		output wire [511:0] q,       // fifo_output.dataout
		output wire [8:0]   wrusedw, //            .wrusedw
		output wire         rdempty, //            .rdempty
		output wire         wrfull   //            .wrfull
	);

	acc_data_fifo_fifo_181_itqewuq fifo_0 (
		.data    (data),    //   input,  width = 512,  fifo_input.datain
		.wrreq   (wrreq),   //   input,    width = 1,            .wrreq
		.rdreq   (rdreq),   //   input,    width = 1,            .rdreq
		.wrclk   (wrclk),   //   input,    width = 1,            .wrclk
		.rdclk   (rdclk),   //   input,    width = 1,            .rdclk
		.aclr    (aclr),    //   input,    width = 1,            .aclr
		.q       (q),       //  output,  width = 512, fifo_output.dataout
		.wrusedw (wrusedw), //  output,    width = 9,            .wrusedw
		.rdempty (rdempty), //  output,    width = 1,            .rdempty
		.wrfull  (wrfull)   //  output,    width = 1,            .wrfull
	);

endmodule
