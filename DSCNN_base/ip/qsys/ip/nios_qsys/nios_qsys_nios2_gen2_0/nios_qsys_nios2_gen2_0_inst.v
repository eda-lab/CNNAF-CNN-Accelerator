	nios_qsys_nios2_gen2_0 u0 (
		.clk                                 (_connected_to_clk_),                                 //   input,   width = 1,                       clk.clk
		.reset_n                             (_connected_to_reset_n_),                             //   input,   width = 1,                     reset.reset_n
		.reset_req                           (_connected_to_reset_req_),                           //   input,   width = 1,                          .reset_req
		.d_address                           (_connected_to_d_address_),                           //  output,  width = 17,               data_master.address
		.d_byteenable                        (_connected_to_d_byteenable_),                        //  output,   width = 4,                          .byteenable
		.d_read                              (_connected_to_d_read_),                              //  output,   width = 1,                          .read
		.d_readdata                          (_connected_to_d_readdata_),                          //   input,  width = 32,                          .readdata
		.d_waitrequest                       (_connected_to_d_waitrequest_),                       //   input,   width = 1,                          .waitrequest
		.d_write                             (_connected_to_d_write_),                             //  output,   width = 1,                          .write
		.d_writedata                         (_connected_to_d_writedata_),                         //  output,  width = 32,                          .writedata
		.d_readdatavalid                     (_connected_to_d_readdatavalid_),                     //   input,   width = 1,                          .readdatavalid
		.debug_mem_slave_debugaccess_to_roms (_connected_to_debug_mem_slave_debugaccess_to_roms_), //  output,   width = 1,                          .debugaccess
		.i_address                           (_connected_to_i_address_),                           //  output,  width = 17,        instruction_master.address
		.i_read                              (_connected_to_i_read_),                              //  output,   width = 1,                          .read
		.i_readdata                          (_connected_to_i_readdata_),                          //   input,  width = 32,                          .readdata
		.i_waitrequest                       (_connected_to_i_waitrequest_),                       //   input,   width = 1,                          .waitrequest
		.i_readdatavalid                     (_connected_to_i_readdatavalid_),                     //   input,   width = 1,                          .readdatavalid
		.irq                                 (_connected_to_irq_),                                 //   input,  width = 32,                       irq.irq
		.debug_reset_request                 (_connected_to_debug_reset_request_),                 //  output,   width = 1,       debug_reset_request.reset
		.debug_mem_slave_address             (_connected_to_debug_mem_slave_address_),             //   input,   width = 9,           debug_mem_slave.address
		.debug_mem_slave_byteenable          (_connected_to_debug_mem_slave_byteenable_),          //   input,   width = 4,                          .byteenable
		.debug_mem_slave_debugaccess         (_connected_to_debug_mem_slave_debugaccess_),         //   input,   width = 1,                          .debugaccess
		.debug_mem_slave_read                (_connected_to_debug_mem_slave_read_),                //   input,   width = 1,                          .read
		.debug_mem_slave_readdata            (_connected_to_debug_mem_slave_readdata_),            //  output,  width = 32,                          .readdata
		.debug_mem_slave_waitrequest         (_connected_to_debug_mem_slave_waitrequest_),         //  output,   width = 1,                          .waitrequest
		.debug_mem_slave_write               (_connected_to_debug_mem_slave_write_),               //   input,   width = 1,                          .write
		.debug_mem_slave_writedata           (_connected_to_debug_mem_slave_writedata_),           //   input,  width = 32,                          .writedata
		.dummy_ci_port                       (_connected_to_dummy_ci_port_)                        //  output,   width = 1, custom_instruction_master.readra
	);

