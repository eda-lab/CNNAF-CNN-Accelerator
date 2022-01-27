// nios_qsys_pio_5.v

// Generated using ACDS version 18.1 222

`timescale 1 ps / 1 ps
module nios_qsys_pio_5 (
		input  wire        clk,      //                 clk.clk
		input  wire        reset_n,  //               reset.reset_n
		input  wire [1:0]  address,  //                  s1.address
		output wire [31:0] readdata, //                    .readdata
		input  wire [31:0] in_port   // external_connection.export
	);

	nios_qsys_pio_5_altera_avalon_pio_181_tsdoepa pio_5 (
		.clk      (clk),      //   input,   width = 1,                 clk.clk
		.reset_n  (reset_n),  //   input,   width = 1,               reset.reset_n
		.address  (address),  //   input,   width = 2,                  s1.address
		.readdata (readdata), //  output,  width = 32,                    .readdata
		.in_port  (in_port)   //   input,  width = 32, external_connection.export
	);

endmodule
