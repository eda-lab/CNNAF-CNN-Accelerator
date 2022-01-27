	in_system_source_probe u0 (
		.source     (_connected_to_source_),     //  output,  width = 5,    sources.source
		.source_clk (_connected_to_source_clk_), //   input,  width = 1, source_clk.clk
		.probe      (_connected_to_probe_)       //   input,  width = 3,     probes.probe
	);

