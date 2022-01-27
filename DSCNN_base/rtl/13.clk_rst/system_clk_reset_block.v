module system_clk_reset_block(
	input				sys_clk			,
	input				hard_resetn		,
	
	output				hard_reset_n	,
	output				hard_reset_p	,
	output				sys_pll_clk_calc,
	output				sys_pll_clk_data,
    output              sys_pll_nios_clk,
	output				sys_pll_reset_n	,
	
	output				sys_pll_locked	
);

wire 					hard_reset_in_sync	;
wire 					sig_hard_reset_n	;	
wire 					sig_hard_reset_p	;	
wire 					pll_locked			;	
wire 					sig_sys_pll_clkout0	;
wire 					sig_sys_pll_clkout1	;
wire 					sig_sys_pll_clkout2	;

	reset_block reset_block_inst0(
		.clk			(sys_clk			),
		.en				(hard_reset_in_sync	),
		.rst_n			(sig_hard_reset_n	),
		.rst_p			(sig_hard_reset_p)
	);

	reset_sync_block reset_sync_block_inst0(
		.clk 			(sys_clk			),
		.rst_n_in 		(hard_resetn		),
		.rst_n_out		(hard_reset_in_sync	)
	);
	
	
    iopll inst0_iopll (
        .rst      		(sig_hard_reset_p	),  //   reset.reset
        .refclk   		(sys_clk			),  //  refclk.clk     
        .locked   		(pll_locked			),  //  locked.export  
        .outclk_0 		(sig_sys_pll_clkout0),  // outclk0.clk       
        .outclk_1 		(sig_sys_pll_clkout1),  // outclk1.clk    
        .outclk_2 		(sig_sys_pll_clkout2)   // outclk1.clk           
    );

	reset_sync_block reset_sync_block_inst1(
		.clk 			(sig_sys_pll_clkout0),
		.rst_n_in 		(pll_locked			),
		.rst_n_out		(sys_pll_reset_n)
	);	
	
//	reset_sync_block reset_sync_block_inst2(
//		.clk 			(sig_sys_pll_clkout1),
//		.rst_n_in 		(pll_locked			),
//		.rst_n_out		()
//	);	

assign hard_reset_n		= sig_hard_reset_n;
assign hard_reset_p     = sig_hard_reset_p;
assign sys_pll_locked	= pll_locked;
assign sys_pll_clk_data = sig_sys_pll_clkout0;
assign sys_pll_clk_calc = sig_sys_pll_clkout1;
assign sys_pll_nios_clk = sig_sys_pll_clkout2;

	

	
endmodule 