	ddr4_qsys u0 (
		.global_reset_n      (_connected_to_global_reset_n_),      //   input,    width = 1,   global_reset_n.reset_n
		.pll_ref_clk         (_connected_to_pll_ref_clk_),         //   input,    width = 1,      pll_ref_clk.clk
		.oct_rzqin           (_connected_to_oct_rzqin_),           //   input,    width = 1,              oct.oct_rzqin
		.mem_ck              (_connected_to_mem_ck_),              //  output,    width = 1,              mem.mem_ck
		.mem_ck_n            (_connected_to_mem_ck_n_),            //  output,    width = 1,                 .mem_ck_n
		.mem_a               (_connected_to_mem_a_),               //  output,   width = 17,                 .mem_a
		.mem_act_n           (_connected_to_mem_act_n_),           //  output,    width = 1,                 .mem_act_n
		.mem_ba              (_connected_to_mem_ba_),              //  output,    width = 2,                 .mem_ba
		.mem_bg              (_connected_to_mem_bg_),              //  output,    width = 1,                 .mem_bg
		.mem_cke             (_connected_to_mem_cke_),             //  output,    width = 1,                 .mem_cke
		.mem_cs_n            (_connected_to_mem_cs_n_),            //  output,    width = 1,                 .mem_cs_n
		.mem_odt             (_connected_to_mem_odt_),             //  output,    width = 1,                 .mem_odt
		.mem_reset_n         (_connected_to_mem_reset_n_),         //  output,    width = 1,                 .mem_reset_n
		.mem_par             (_connected_to_mem_par_),             //  output,    width = 1,                 .mem_par
		.mem_alert_n         (_connected_to_mem_alert_n_),         //   input,    width = 1,                 .mem_alert_n
		.mem_dqs             (_connected_to_mem_dqs_),             //   inout,    width = 8,                 .mem_dqs
		.mem_dqs_n           (_connected_to_mem_dqs_n_),           //   inout,    width = 8,                 .mem_dqs_n
		.mem_dq              (_connected_to_mem_dq_),              //   inout,   width = 64,                 .mem_dq
		.mem_dbi_n           (_connected_to_mem_dbi_n_),           //   inout,    width = 8,                 .mem_dbi_n
		.local_cal_success   (_connected_to_local_cal_success_),   //  output,    width = 1,           status.local_cal_success
		.local_cal_fail      (_connected_to_local_cal_fail_),      //  output,    width = 1,                 .local_cal_fail
		.emif_usr_reset_n    (_connected_to_emif_usr_reset_n_),    //  output,    width = 1, emif_usr_reset_n.reset_n
		.emif_usr_clk        (_connected_to_emif_usr_clk_),        //  output,    width = 1,     emif_usr_clk.clk
		.amm_ready_0         (_connected_to_amm_ready_0_),         //  output,    width = 1,       ctrl_amm_0.waitrequest_n
		.amm_read_0          (_connected_to_amm_read_0_),          //   input,    width = 1,                 .read
		.amm_write_0         (_connected_to_amm_write_0_),         //   input,    width = 1,                 .write
		.amm_address_0       (_connected_to_amm_address_0_),       //   input,   width = 26,                 .address
		.amm_readdata_0      (_connected_to_amm_readdata_0_),      //  output,  width = 512,                 .readdata
		.amm_writedata_0     (_connected_to_amm_writedata_0_),     //   input,  width = 512,                 .writedata
		.amm_burstcount_0    (_connected_to_amm_burstcount_0_),    //   input,    width = 7,                 .burstcount
		.amm_byteenable_0    (_connected_to_amm_byteenable_0_),    //   input,   width = 64,                 .byteenable
		.amm_readdatavalid_0 (_connected_to_amm_readdatavalid_0_)  //  output,    width = 1,                 .readdatavalid
	);

