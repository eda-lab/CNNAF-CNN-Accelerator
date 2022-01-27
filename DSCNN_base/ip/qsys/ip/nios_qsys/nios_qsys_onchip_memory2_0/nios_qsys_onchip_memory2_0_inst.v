	nios_qsys_onchip_memory2_0 u0 (
		.clk        (_connected_to_clk_),        //   input,   width = 1,   clk1.clk
		.address    (_connected_to_address_),    //   input,  width = 14,     s1.address
		.clken      (_connected_to_clken_),      //   input,   width = 1,       .clken
		.chipselect (_connected_to_chipselect_), //   input,   width = 1,       .chipselect
		.write      (_connected_to_write_),      //   input,   width = 1,       .write
		.readdata   (_connected_to_readdata_),   //  output,  width = 32,       .readdata
		.writedata  (_connected_to_writedata_),  //   input,  width = 32,       .writedata
		.byteenable (_connected_to_byteenable_), //   input,   width = 4,       .byteenable
		.reset      (_connected_to_reset_),      //   input,   width = 1, reset1.reset
		.reset_req  (_connected_to_reset_req_)   //   input,   width = 1,       .reset_req
	);

