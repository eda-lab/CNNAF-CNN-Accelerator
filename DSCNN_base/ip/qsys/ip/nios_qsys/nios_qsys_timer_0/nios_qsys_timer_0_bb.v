module nios_qsys_timer_0 (
		input  wire        clk,        //   clk.clk
		input  wire        reset_n,    // reset.reset_n
		input  wire [2:0]  address,    //    s1.address
		input  wire [15:0] writedata,  //      .writedata
		output wire [15:0] readdata,   //      .readdata
		input  wire        chipselect, //      .chipselect
		input  wire        write_n,    //      .write_n
		output wire        irq         //   irq.irq
	);
endmodule

