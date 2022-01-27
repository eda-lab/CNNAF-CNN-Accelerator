module fifo_data (
		input  wire [531:0] data,    //  fifo_input.datain
		input  wire         wrreq,   //            .wrreq
		input  wire         rdreq,   //            .rdreq
		input  wire         wrclk,   //            .wrclk
		input  wire         rdclk,   //            .rdclk
		input  wire         aclr,    //            .aclr
		output wire [531:0] q,       // fifo_output.dataout
		output wire [8:0]   rdusedw, //            .rdusedw
		output wire [8:0]   wrusedw, //            .wrusedw
		output wire         rdempty, //            .rdempty
		output wire         wrfull   //            .wrfull
	);
endmodule

