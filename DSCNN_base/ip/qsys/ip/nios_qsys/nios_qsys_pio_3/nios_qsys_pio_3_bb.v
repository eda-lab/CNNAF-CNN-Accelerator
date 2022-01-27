module nios_qsys_pio_3 (
		input  wire        clk,      //                 clk.clk
		input  wire        reset_n,  //               reset.reset_n
		input  wire [1:0]  address,  //                  s1.address
		output wire [31:0] readdata, //                    .readdata
		input  wire [31:0] in_port   // external_connection.export
	);
endmodule

