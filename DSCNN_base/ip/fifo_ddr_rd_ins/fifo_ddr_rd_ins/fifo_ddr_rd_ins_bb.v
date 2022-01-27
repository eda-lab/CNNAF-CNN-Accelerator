module fifo_ddr_rd_ins (
		input  wire [33:0] data,    //  fifo_input.datain
		input  wire        wrreq,   //            .wrreq
		input  wire        rdreq,   //            .rdreq
		input  wire        wrclk,   //            .wrclk
		input  wire        rdclk,   //            .rdclk
		input  wire        aclr,    //            .aclr
		output wire [33:0] q,       // fifo_output.dataout
		output wire [7:0]  wrusedw, //            .wrusedw
		output wire        rdempty, //            .rdempty
		output wire        wrfull   //            .wrfull
	);
endmodule
