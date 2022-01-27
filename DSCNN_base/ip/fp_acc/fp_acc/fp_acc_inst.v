	fp_acc u0 (
		.clk    (_connected_to_clk_),    //   input,   width = 1,    clk.clk
		.areset (_connected_to_areset_), //   input,   width = 1, areset.reset
		.x      (_connected_to_x_),      //   input,  width = 32,      x.x
		.n      (_connected_to_n_),      //   input,   width = 1,      n.n
		.r      (_connected_to_r_),      //  output,  width = 32,      r.r
		.xo     (_connected_to_xo_),     //  output,   width = 1,     xo.xo
		.xu     (_connected_to_xu_),     //  output,   width = 1,     xu.xu
		.ao     (_connected_to_ao_),     //  output,   width = 1,     ao.ao
		.en     (_connected_to_en_)      //   input,   width = 1,     en.en
	);

