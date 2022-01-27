	fp_cmp_bias u0 (
		.clk    (_connected_to_clk_),    //   input,   width = 1,    clk.clk
		.areset (_connected_to_areset_), //   input,   width = 1, areset.reset
		.a      (_connected_to_a_),      //   input,  width = 32,      a.a
		.b      (_connected_to_b_),      //   input,  width = 32,      b.b
		.q      (_connected_to_q_)       //  output,   width = 1,      q.q
	);

