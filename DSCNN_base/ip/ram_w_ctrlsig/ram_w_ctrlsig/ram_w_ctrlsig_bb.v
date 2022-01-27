module ram_w_ctrlsig (
		input  wire [10:0] data,      //      data.datain
		output wire [10:0] q,         //         q.dataout
		input  wire [3:0]  wraddress, // wraddress.wraddress
		input  wire [3:0]  rdaddress, // rdaddress.rdaddress
		input  wire        wren,      //      wren.wren
		input  wire        wrclock,   //   wrclock.clk
		input  wire        rdclock    //   rdclock.clk
	);
endmodule

