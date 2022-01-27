module monitor (
		input  wire        clk_clk,               //            clk.clk
		input  wire        reset_reset_n,         //          reset.reset_n
		output wire [1:0]  led_export,            //            led.export
		input  wire [31:0] pio_in_export,         //         pio_in.export
		output wire [31:0] pio_out_export,        //        pio_out.export
		output wire        power_temp_scl_export, // power_temp_scl.export
		inout  wire        power_temp_sda_export  // power_temp_sda.export
	);
endmodule

