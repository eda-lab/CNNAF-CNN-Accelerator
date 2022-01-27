module nios_qsys (
		input  wire [31:0] calc_data_export,       //       calc_data.export
		input  wire        calc_finish_export,     //     calc_finish.export
		input  wire [31:0] calc_fps_export,        //        calc_fps.export
		input  wire [31:0] calc_unit_total_export, // calc_unit_total.export
		input  wire [31:0] calc_unit_used_export,  //  calc_unit_used.export
		input  wire        clk_clk,                //             clk.clk
		output wire [31:0] data_addr_export,       //       data_addr.export
		output wire        power_temp_scl_export,  //  power_temp_scl.export
		inout  wire        power_temp_sda_export,  //  power_temp_sda.export
		input  wire        reset_reset,            //           reset.reset
		input  wire [31:0] unused_ddrvld_export,   //   unused_ddrvld.export
		input  wire [31:0] used_ddrvld_export,     //     used_ddrvld.export
		input  wire [31:0] wr_ddrvld_export        //       wr_ddrvld.export
	);
endmodule

