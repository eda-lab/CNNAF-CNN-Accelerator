	nios_qsys_pio_4 u0 (
		.clk      (_connected_to_clk_),      //   input,   width = 1,                 clk.clk
		.reset_n  (_connected_to_reset_n_),  //   input,   width = 1,               reset.reset_n
		.address  (_connected_to_address_),  //   input,   width = 2,                  s1.address
		.readdata (_connected_to_readdata_), //  output,  width = 32,                    .readdata
		.in_port  (_connected_to_in_port_)   //   input,  width = 32, external_connection.export
	);

