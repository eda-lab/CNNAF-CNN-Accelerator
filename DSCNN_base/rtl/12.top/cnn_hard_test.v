module cnn_hard_test(
    input                   A10_SYSCLK_125MHZ         ,
    
    input                   pll0_ref_clk              ,
    input                   oct0_rzqin                ,
  
    //system monitor
    output                  power_temp_scl            ,
    inout                   power_temp_sda            ,

    //////// LED /////////////
    output                  panel_green_led           ,
    output                  panel_red_led             ,  
    output [3:0]            leds                      ,   
  
    //ddr4 0 interface
    output [ 0:0]           mem0_ck                   ,
    output [ 0:0]           mem0_ck_n                 ,
    output [16:0]           mem0_a                    ,
    output [ 0:0]           mem0_act_n                ,
    output [ 1:0]           mem0_ba                   ,
    output [ 0:0]           mem0_bg                   ,
    output [ 0:0]           mem0_cke                  ,
    output [ 0:0]           mem0_cs_n                 ,
    output [ 0:0]           mem0_odt                  ,
    output [ 0:0]           mem0_reset_n              ,
    output [ 0:0]           mem0_par                  ,
    input  [ 0:0]           mem0_alert_n              ,
    inout  [ 7:0]           mem0_dqs                  ,
    inout  [ 7:0]           mem0_dqs_n                ,
    inout  [63:0]           mem0_dq                   ,
    inout  [ 7:0]           mem0_dbi_n                      
);

//system signal
reg                         source_sig_r            ;
wire                        sys_pll_clk_calc        ; //200M
wire                        sys_pll_clk_data        ; //250M
wire                        sys_pll_nios_clk        ; //100M
wire                        sys_pll_clk_resetn      ;
wire                        sys_rst_n               ;
wire                        sys_pll_locked          ;
wire [2:0]                  probe_sig               ;
wire [4:0]                  source_sig              ;
wire                        test_global_reset_n     ;
wire                        hard_reset_n            ;
wire                        hard_reset_p            ;
wire                        ddr_reset_n             ;
wire                        mobilenet_reset_n       ;
wire                        nios_reset_n            ;
wire                        sync_init_cont_sig      ;
wire                        sync_ddr_init_done      ;
//ddr4 - 0 interface
wire                        u0_local_cal_success    ; 
wire                        u0_local_cal_fail       ;
wire                        u0_ddr4_user_reset_n    ;
wire                        u0_ddr4_user_clk        ;
wire                        u0_avl_ready            ;
wire                        u0_avl_read_req         ;
wire                        u0_avl_write_req        ;
wire [25:0]                 u0_avl_addr             ;
wire [511:0]                u0_avl_rdata            ;
wire [511:0]                u0_avl_wdata            ;
wire [6:0]                  u0_avl_size             ;  
wire [63:0]                 u0_avl_be               ;
wire                        u0_avl_rdata_valid      ;   
//niosii interface
wire [31:0]                 nios_calc_data          ;
wire                        nios_calc_finish        ;
wire [31:0]                 nios_calc_fps           ;
wire [31:0]                 nios_data_addr          ;
wire [31:0]                 nios_used_wr_ddrvld     ;
wire [31:0]                 nios_unused_ddrvld      ;
wire [31:0]                 nios_used_ddrvld        ;
wire [31:0]                 nios_calc_total         ;
wire [31:0]                 nios_calc_used          ;

//monitor
wire [ 1:0]                 monitor_led;
wire [31:0]                 pin_in;
wire [31:0]                 pin_out; 

assign panel_green_led = monitor_led[0];
assign panel_red_led = monitor_led[1];


in_system_source_probe inst0_in_system_source_probe (
    .source                     (source_sig             ),     //  output,  width = 2,    sources.source
    .source_clk                 (A10_SYSCLK_125MHZ      ),     //  input,   width = 1, source_clk.clk
    .probe                      (probe_sig              )      //  input,   width = 2,     probes.probe
);

assign test_global_reset_n = source_sig[0];
assign ddr_reset_n = hard_reset_n & source_sig[1];
assign mobilenet_reset_n = source_sig[2];
assign nios_reset_n = source_sig[3];

system_clk_reset_block inst0_system_clk_reset_block(
    .sys_clk			        (A10_SYSCLK_125MHZ	    ),      //input		
    .hard_resetn		        (test_global_reset_n    ),      //input		                                                        
    .hard_reset_n		        (hard_reset_n           ),      //output	
    .hard_reset_p		        (hard_reset_p           ),      //output	
    .sys_pll_clk_calc	        (sys_pll_clk_calc	    ),      //output	
    .sys_pll_clk_data	        (sys_pll_clk_data	    ),      //output	
    .sys_pll_nios_clk           (sys_pll_nios_clk       ),
    .sys_pll_reset_n	        (sys_pll_clk_resetn	    ),      //output	                                                          
    .sys_pll_locked	            (sys_pll_locked		    )       //output	
);
     
ddr4_qsys ins0_ddr4_ctrl(
    .global_reset_n             (ddr_reset_n            ),      //   input,    width = 1,   global_reset_n.reset_n
    .pll_ref_clk                (pll0_ref_clk           ),      //   input,    width = 1,      pll_ref_clk.clk
    .oct_rzqin                  (oct0_rzqin             ),      //   input,    width = 1,              oct.oct_rzqin
    .mem_ck                     (mem0_ck                ),      //  output,    width = 1,              mem.mem_ck
    .mem_ck_n                   (mem0_ck_n              ),      //  output,    width = 1,                 .mem_ck_n
    .mem_a                      (mem0_a                 ),      //  output,   width = 17,                 .mem_a
    .mem_act_n                  (mem0_act_n             ),      //  output,    width = 1,                 .mem_act_n
    .mem_ba                     (mem0_ba                ),      //  output,    width = 2,                 .mem_ba
    .mem_bg                     (mem0_bg                ),      //  output,    width = 1,                 .mem_bg
    .mem_cke                    (mem0_cke               ),      //  output,    width = 1,                 .mem_cke
    .mem_cs_n                   (mem0_cs_n              ),      //  output,    width = 1,                 .mem_cs_n
    .mem_odt                    (mem0_odt               ),      //  output,    width = 1,                 .mem_odt
    .mem_reset_n                (mem0_reset_n           ),      //  output,    width = 1,                 .mem_reset_n
    .mem_par                    (mem0_par               ),      //  output,    width = 1,                 .mem_par
    .mem_alert_n                (mem0_alert_n           ),      //   input,    width = 1,                 .mem_alert_n
    .mem_dqs                    (mem0_dqs               ),      //   inout,    width = 8,                 .mem_dqs
    .mem_dqs_n                  (mem0_dqs_n             ),      //   inout,    width = 8,                 .mem_dqs_n
    .mem_dq                     (mem0_dq                ),      //   inout,   width = 64,                 .mem_dq
    .mem_dbi_n                  (mem0_dbi_n             ),      //   inout,    width = 8,                 .mem_dbi_n
    .local_cal_success          (u0_local_cal_success   ),      //  output,    width = 1,           status.local_cal_success
    .local_cal_fail             (u0_local_cal_fail      ),      //  output,    width = 1,                 .local_cal_fail
    .emif_usr_reset_n           (u0_ddr4_user_reset_n   ),      //  output,    width = 1, emif_usr_reset_n.reset_n
    .emif_usr_clk               (u0_ddr4_user_clk       ),      //  output,    width = 1,     emif_usr_clk.clk
    .amm_ready_0                (u0_avl_ready           ),      //  output,    width = 1,       ctrl_amm_0.waitrequest_n
    .amm_read_0                 (u0_avl_read_req        ),      //   input,    width = 1,                 .read
    .amm_write_0                (u0_avl_write_req       ),      //   input,    width = 1,                 .write
    .amm_address_0              (u0_avl_addr            ),      //   input,   width = 26,                 .address
    .amm_readdata_0             (u0_avl_rdata           ),      //  output,  width = 512,                 .readdata
    .amm_writedata_0            (u0_avl_wdata           ),      //   input,  width = 512,                 .writedata
    .amm_burstcount_0           (u0_avl_size            ),      //   input,    width = 7,                 .burstcount
    .amm_byteenable_0           (u0_avl_be              ),      //   input,   width = 64,                 .byteenable
    .amm_readdatavalid_0        (u0_avl_rdata_valid     )       //  output,    width = 1,                 .readdatavalid
);

sig_async2sync sig_async2sync(
    .sys_clk                    (sys_pll_clk_data       ),   
    .async_init_cont_sig        (source_sig[4]          ),   
    .sync_init_cont_sig         (sync_init_cont_sig     ),
    .async_ddr_init_done        (u0_local_cal_success   ),
    .sync_ddr_init_done         (sync_ddr_init_done     )
);

assign sys_rst_n = sync_ddr_init_done & sys_pll_clk_resetn;

mobilenet_test_top mobilenet_test_top(
	.sys_clk_calc				(sys_pll_clk_calc		),      /*input			*/
	.sys_clk_data				(sys_pll_clk_data		),      /*input			*/
	.sys_rst_n				    (sys_rst_n          	),      /*input			*/
    .mobilenet_reset_n          (mobilenet_reset_n      ),      /*input         */
    .ddr_init_cont              (sync_init_cont_sig     ),      /*input         */
    .uart_rdreq                 (                       ),      /*input         */
    .uart_start                 (                       ),      /*output        */
    .uart_out_vld               (                       ),      /*output        */
    .uart_out                   (                       ),      /*output [31:0] */
    .calc_finish                (nios_calc_finish       ),       /*output        */
    .rd_res_addr                (nios_data_addr         ),      /*input [31:0]  */
    .rd_res_data                (nios_calc_data         ),      /*output [31:0] */
    .rd_calc_fps                (nios_calc_fps          ),      /*output [31:0] */
    .ddr_used_rdy_num           (nios_used_ddrvld       ),      /*output [31:0] */
    .ddr_used_wr_num            (nios_used_wr_ddrvld    ),      /*output [31:0] */
    .ddr_unused_rdy_num         (nios_unused_ddrvld     ),      /*output [31:0] */
    .calc_use_part              (nios_calc_used         ),
    .calc_total_part            (nios_calc_total        ),  
	.ddr_avl_local_init_done    (sync_ddr_init_done     ),      /*input         */              
	.ddr_rst_n				    (u0_ddr4_user_reset_n   ),      /*input			*/			
	.ddr_clk					(u0_ddr4_user_clk       ),      /*input			*/			
    .ddr_avl_ready              (u0_avl_ready           ),      /*input         */              
    .ddr_avl_rd_req             (u0_avl_read_req        ),      /*output        */              
    .ddr_avl_wr_req             (u0_avl_write_req       ),      /*output        */              
    .ddr_avl_address            (u0_avl_addr            ),      /*output [25:0] */             
    .ddr_avl_rd_data            (u0_avl_rdata           ),      /*input  [511:0]*/             
    .ddr_avl_write_data		    (u0_avl_wdata           ),      /*output [511:0]*/             
    .ddr_avl_bl_size            (u0_avl_size            ),      /*output [6:0]  */             
    .ddr_avl_be                 (u0_avl_be              ),      /*output [63:0] */              
    .ddr_avl_rd_data_vld        (u0_avl_rdata_valid     )       /*input         */              
);                               

nios_qsys nios_qsys_u0 (
    .clk_clk                    (sys_pll_nios_clk       ),      //   input,  width = 1,           clk.clk
    .reset_reset                (~nios_reset_n          ),      //   input,  width = 1,         reset.reset
    .power_temp_scl_export      (         ),      //  output,   width = 1,  power_temp_scl.export
    .power_temp_sda_export      (         ),      //   inout,   width = 1,  power_temp_sda.export
    .calc_data_export           (nios_calc_data         ),      //   input,  width = 32,     calc_data.export
    .calc_finish_export         (nios_calc_finish       ),      //   input,  width = 1,   calc_finish.export
    .calc_fps_export            (nios_calc_fps          ),      //   input,  width = 32,      calc_fps.export   
    .data_addr_export           (nios_data_addr         ),      //   output, width = 32,     data_addr.export
    .wr_ddrvld_export           (nios_used_wr_ddrvld    ),       //   input,  width = 32,       wr_ddrvld.export
    .unused_ddrvld_export       (nios_unused_ddrvld     ),      //   input,  width = 32, unused_ddrvld.export
    .used_ddrvld_export         (nios_used_ddrvld       ),      //   input,  width = 32,   used_ddrvld.export
    .calc_unit_total_export     (nios_calc_total        ),      //   input,  width = 32, calc_unit_total.export
    .calc_unit_used_export      (nios_calc_used         )       //   input,  width = 32,  calc_unit_used.export
);

//monitor u0 (
//    .clk_clk                    (sys_pll_nios_clk       ),               //   input,   width = 1,            clk.clk
//    .led_export                 (monitor_led            ),            //  output,   width = 2,            led.export
//    .pio_in_export              (pin_in                 ),         //   input,  width = 32,         pio_in.export
//    .pio_out_export             (pin_out                ),        //  output,  width = 32,        pio_out.export
//    .power_temp_scl_export      (power_temp_scl         ), //  output,   width = 1, power_temp_scl.export
//    .power_temp_sda_export      (power_temp_sda         ), //   inout,   width = 1, power_temp_sda.export
//    .reset_reset                (~nios_reset_n          )            //   input,   width = 1,          reset.reset
//);


monitor u0 (
    .clk_clk               (sys_pll_nios_clk),               //   input,   width = 1,            clk.clk
    .reset_reset_n         (nios_reset_n),         //   input,   width = 1,          reset.reset_n
    .led_export            (monitor_led),            //  output,   width = 2,            led.export
    .pio_in_export         (pin_in),         //   input,  width = 32,         pio_in.export
    .pio_out_export        (pin_out),        //  output,  width = 32,        pio_out.export
    .power_temp_scl_export (power_temp_scl), //  output,   width = 1, power_temp_scl.export
    .power_temp_sda_export (power_temp_sda)  //   inout,   width = 1, power_temp_sda.export
);


assign pin_in[0] = sys_pll_locked;
assign pin_in[31:1] = 31'h0;

wire [511:0]                    probe_sig_all;
assign probe_sig_all = {{10{32'b0}}, nios_used_ddrvld, nios_unused_ddrvld, nios_used_wr_ddrvld, 
                        nios_calc_used, nios_calc_total ,nios_calc_fps};

test_probe test_probe_inst0 (
    .source                     (                       ),     //  output,  width = 2,    sources.source
    .probe                      (probe_sig_all          )      //  input,   width = 2,     probes.probe
);

endmodule 
