// monitor_led.v

// Generated using ACDS version 18.1 222

`timescale 1 ps / 1 ps
module monitor_led (
		input  wire        clk,        //                 clk.clk
		input  wire        reset_n,    //               reset.reset_n
		input  wire [1:0]  address,    //                  s1.address
		input  wire        write_n,    //                    .write_n
		input  wire [31:0] writedata,  //                    .writedata
		input  wire        chipselect, //                    .chipselect
		output wire [31:0] readdata,   //                    .readdata
		output wire [1:0]  out_port    // external_connection.export
	);

	monitor_led_altera_avalon_pio_181_yktquyy led (
		.clk        (clk),        //   input,   width = 1,                 clk.clk
		.reset_n    (reset_n),    //   input,   width = 1,               reset.reset_n
		.address    (address),    //   input,   width = 2,                  s1.address
		.write_n    (write_n),    //   input,   width = 1,                    .write_n
		.writedata  (writedata),  //   input,  width = 32,                    .writedata
		.chipselect (chipselect), //   input,   width = 1,                    .chipselect
		.readdata   (readdata),   //  output,  width = 32,                    .readdata
		.out_port   (out_port)    //  output,   width = 2, external_connection.export
	);

endmodule
