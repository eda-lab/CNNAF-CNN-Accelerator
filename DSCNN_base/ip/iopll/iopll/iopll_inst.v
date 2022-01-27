	iopll u0 (
		.rst      (_connected_to_rst_),      //   input,  width = 1,   reset.reset
		.refclk   (_connected_to_refclk_),   //   input,  width = 1,  refclk.clk
		.locked   (_connected_to_locked_),   //  output,  width = 1,  locked.export
		.outclk_0 (_connected_to_outclk_0_), //  output,  width = 1, outclk0.clk
		.outclk_1 (_connected_to_outclk_1_), //  output,  width = 1, outclk1.clk
		.outclk_2 (_connected_to_outclk_2_)  //  output,  width = 1, outclk2.clk
	);

