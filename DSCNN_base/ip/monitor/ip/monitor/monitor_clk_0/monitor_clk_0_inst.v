	monitor_clk_0 u0 (
		.in_clk      (_connected_to_in_clk_),      //   input,  width = 1,       clk_in.clk
		.reset_n     (_connected_to_reset_n_),     //   input,  width = 1, clk_in_reset.reset_n
		.clk_out     (_connected_to_clk_out_),     //  output,  width = 1,          clk.clk
		.reset_n_out (_connected_to_reset_n_out_)  //  output,  width = 1,    clk_reset.reset_n
	);

