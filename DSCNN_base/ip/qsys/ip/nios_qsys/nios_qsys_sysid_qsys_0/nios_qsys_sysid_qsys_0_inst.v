	nios_qsys_sysid_qsys_0 u0 (
		.clock    (_connected_to_clock_),    //   input,   width = 1,           clk.clk
		.reset_n  (_connected_to_reset_n_),  //   input,   width = 1,         reset.reset_n
		.readdata (_connected_to_readdata_), //  output,  width = 32, control_slave.readdata
		.address  (_connected_to_address_)   //   input,   width = 1,              .address
	);

