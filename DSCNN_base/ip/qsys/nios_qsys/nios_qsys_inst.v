	nios_qsys u0 (
		.calc_data_export       (_connected_to_calc_data_export_),       //   input,  width = 32,       calc_data.export
		.calc_finish_export     (_connected_to_calc_finish_export_),     //   input,   width = 1,     calc_finish.export
		.calc_fps_export        (_connected_to_calc_fps_export_),        //   input,  width = 32,        calc_fps.export
		.calc_unit_total_export (_connected_to_calc_unit_total_export_), //   input,  width = 32, calc_unit_total.export
		.calc_unit_used_export  (_connected_to_calc_unit_used_export_),  //   input,  width = 32,  calc_unit_used.export
		.clk_clk                (_connected_to_clk_clk_),                //   input,   width = 1,             clk.clk
		.data_addr_export       (_connected_to_data_addr_export_),       //  output,  width = 32,       data_addr.export
		.power_temp_scl_export  (_connected_to_power_temp_scl_export_),  //  output,   width = 1,  power_temp_scl.export
		.power_temp_sda_export  (_connected_to_power_temp_sda_export_),  //   inout,   width = 1,  power_temp_sda.export
		.reset_reset            (_connected_to_reset_reset_),            //   input,   width = 1,           reset.reset
		.unused_ddrvld_export   (_connected_to_unused_ddrvld_export_),   //   input,  width = 32,   unused_ddrvld.export
		.used_ddrvld_export     (_connected_to_used_ddrvld_export_),     //   input,  width = 32,     used_ddrvld.export
		.wr_ddrvld_export       (_connected_to_wr_ddrvld_export_)        //   input,  width = 32,       wr_ddrvld.export
	);

