	nios_qsys_timer_0 u0 (
		.clk        (_connected_to_clk_),        //   input,   width = 1,   clk.clk
		.reset_n    (_connected_to_reset_n_),    //   input,   width = 1, reset.reset_n
		.address    (_connected_to_address_),    //   input,   width = 3,    s1.address
		.writedata  (_connected_to_writedata_),  //   input,  width = 16,      .writedata
		.readdata   (_connected_to_readdata_),   //  output,  width = 16,      .readdata
		.chipselect (_connected_to_chipselect_), //   input,   width = 1,      .chipselect
		.write_n    (_connected_to_write_n_),    //   input,   width = 1,      .write_n
		.irq        (_connected_to_irq_)         //  output,   width = 1,   irq.irq
	);

