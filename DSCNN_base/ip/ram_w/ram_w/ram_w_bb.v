module ram_w (
		input  wire [511:0] data,      //      data.datain
		output wire [511:0] q,         //         q.dataout
		input  wire [7:0]   wraddress, // wraddress.wraddress
		input  wire [7:0]   rdaddress, // rdaddress.rdaddress
		input  wire         wren,      //      wren.wren
		input  wire         wrclock,   //   wrclock.clk
		input  wire         rdclock    //   rdclock.clk
	);
endmodule

