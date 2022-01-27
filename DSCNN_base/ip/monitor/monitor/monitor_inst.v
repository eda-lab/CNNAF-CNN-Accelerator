	monitor u0 (
		.clk_clk               (_connected_to_clk_clk_),               //   input,   width = 1,            clk.clk
		.reset_reset_n         (_connected_to_reset_reset_n_),         //   input,   width = 1,          reset.reset_n
		.led_export            (_connected_to_led_export_),            //  output,   width = 2,            led.export
		.pio_in_export         (_connected_to_pio_in_export_),         //   input,  width = 32,         pio_in.export
		.pio_out_export        (_connected_to_pio_out_export_),        //  output,  width = 32,        pio_out.export
		.power_temp_scl_export (_connected_to_power_temp_scl_export_), //  output,   width = 1, power_temp_scl.export
		.power_temp_sda_export (_connected_to_power_temp_sda_export_)  //   inout,   width = 1, power_temp_sda.export
	);

