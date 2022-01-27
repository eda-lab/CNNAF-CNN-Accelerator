module mobilenet_test_top(
	input						sys_clk_calc			,
	input						sys_clk_data			,
	input						sys_rst_n				,
    input                       mobilenet_reset_n       ,
    
    //////////ddr_init_interface//////
    input                       ddr_init_cont           , 
    //////////user_interface//////////
    input                       uart_rdreq              ,
    output                      uart_start              , 
    output                      uart_out_vld            ,
    output [31:0]               uart_out                ,
    //////////nios_interface//////////
    output                      calc_finish             ,
    input [31:0]                rd_res_addr             ,
    output [31:0]               rd_res_data             ,
    output [31:0]               rd_calc_fps             ,
    output [31:0]               ddr_used_rdy_num        ,
    output [31:0]               ddr_used_wr_num         ,
    output [31:0]               ddr_unused_rdy_num      ,
    output [31:0]               calc_use_part           ,
    output [31:0]               calc_total_part         ,
    //////////ddr_interface//////////
    input                       ddr_avl_local_init_done ,
    input						ddr_rst_n				,	
	input						ddr_clk					,
    input                       ddr_avl_ready           ,
    output  [25:0]              ddr_avl_address         , 
    output  [511:0]             ddr_avl_write_data		,
    output  [63:0]              ddr_avl_be              ,
    output                      ddr_avl_rd_req          ,
    output                      ddr_avl_wr_req          ,
    output  [6:0]               ddr_avl_bl_size         ,
    input                       ddr_avl_rd_data_vld     ,
    input   [511:0]             ddr_avl_rd_data         	
);

wire [0:0]                      ddr_init_ins_vld        ;
wire [0:0]                      ddr_init_ins_vld_l      ;
wire [511:0]                    ddr_init_data           ;
wire [25:0]                     ddr_init_addr           ;
wire [0:0]                      ddr_init_rdreq          ;
wire [0:0]                      ddr_init_wrreq          ;
wire [6:0]                      ddr_init_bl             ;  
wire                            ddr_init_finish         ;                                                   

wire [0:0]                      ddr_calc_ins_vld        ;
wire [511:0]                    ddr_calc_data           ;
wire [25:0]                     ddr_calc_addr           ;
wire [0:0]                      ddr_calc_rdreq          ;
wire [0:0]                      ddr_calc_wrreq          ;
wire [6:0]                      ddr_calc_bl             ;

wire                            ddr_ctrl_rd_en          ;
wire                            ddr_rd_fifo_half        ;
wire							ddr_rd_data_vld	        ;
wire [511:0]					ddr_rd_data		        ;	
wire [25:0] 	                ddr_address   	        ;
wire [511:0]                    ddr_write_data          ; 
wire                            ddr_rd_req  	        ;
wire                            ddr_wr_req 		        ;
wire [6:0]                      ddr_bl_size  	        ;
wire							ddr_ins_op_vld	        ;
wire                            ddr_ins_push_vld        ;

reg                             mobilenet_rst_n         ;

wire                            net_map_finish          ;
wire                            calc_res_vld            ;
wire [511:0]                    calc_res                ;
wire                            data_gen_vld            ;

assign calc_finish = net_map_finish;

ddr_rd_data_sync ddr_rd_data_sync_u0(
	/*input				*/.ddr_clk_afi			    (ddr_clk			),
	/*input             */.sys_clk_200M			    (sys_clk_data		),
    /*input             */.sys_rst_n			    (sys_rst_n			),
    
    /*input             */.ddr_vld_afi			    (ddr_avl_rd_data_vld),
    /*input [511:0]     */.ddr_data_out_afi		    (ddr_avl_rd_data	),
    /*input             */.ddr_rd_en                (ddr_ctrl_rd_en     ),
    
    /*output reg	    */.ddr_rd_fifo_half         (ddr_rd_fifo_half   ),
	/*output reg	    */.ddr_vld				    (ddr_rd_data_vld	),
    /*output reg [511:0]*/.ddr_data_out			    (ddr_rd_data		)
);

ddr_ctrl_ins_sync ddr_ctrl_ins_sync_u0(	
	//user clock domain
	/*input wire         */.sys_clk_200M     	    (sys_clk_data       ),
    /*input wire         */.sys_rst_n			    (sys_rst_n			),
        
    //ddr op ins    
	/*input wire         */.ddr_ins_op_vld		    (ddr_ins_op_vld		),
	/*input wire [25:0]  */.ddr_address   		    (ddr_address		),
    /*input wire [511:0] */.ddr_write_data  	    (ddr_write_data		), 
    /*input wire         */.ddr_rd_req  		    (ddr_rd_req			),
    /*input wire         */.ddr_wr_req 			    (ddr_wr_req			),
    /*input wire [6:0]   */.ddr_bl_size  		    (ddr_bl_size		),
    /*output reg         */.ddr_op_ins_push_vld     (ddr_ins_push_vld   ),
        
	//ddr clock domain      
	/*input wire		 */.ddr_clk_afi			    (ddr_clk     		),
    /*input wire         */.ddr_rst_n               (ddr_rst_n          ),
	/*input wire		 */.ddr_avl_rdy			    (ddr_avl_ready		),
        
	/*output wire [25:0] */.ddr_avl_address   	    (ddr_avl_address	),
	/*output wire [511:0]*/.ddr_avl_write_data      (ddr_avl_write_data	),
    /*output wire [63:0] */.ddr_avl_be      	    (ddr_avl_be   		),
	/*output wire        */.ddr_avl_rd_req  	    (ddr_avl_rd_req		),
	/*output wire        */.ddr_avl_wr_req 		    (ddr_avl_wr_req		),
	/*output wire [6:0]  */.ddr_avl_bl_size  	    (ddr_avl_bl_size	)
);

ddr_ins_comb ddr_ins_comb(
    /*input              */.clk                     (sys_clk_data       ),
    /*input              */.rst_n                   (sys_rst_n          ),
                                                    
    //ddr init ins                                  
    /*input wire		 */.ddr_init_ins_vld        (ddr_init_ins_vld   ),
    /*input wire [25:0]  */.ddr_init_addr           (ddr_init_addr      ),
    /*input wire [511:0] */.ddr_init_data           (ddr_init_data      ), 
    /*input wire         */.ddr_init_rdreq          (ddr_init_rdreq     ),
    /*input wire         */.ddr_init_wrreq          (ddr_init_wrreq     ),
    /*input wire [6:0]   */.ddr_init_bl             (ddr_init_bl        ),
                                                    
    //mobile run ins     */                         
	/*input wire		 */.ddr_calc_ins_op_vld		(ddr_calc_ins_vld   ),
	/*input wire [25:0]  */.ddr_calc_address   		(ddr_calc_addr      ),
    /*input wire [511:0] */.ddr_calc_write_data  	(ddr_calc_data      ), 
    /*input wire         */.ddr_calc_rd_req  		(ddr_calc_rdreq     ),
    /*input wire         */.ddr_calc_wr_req 		(ddr_calc_wrreq     ),
    /*input wire [6:0]   */.ddr_calc_bl_size  		(ddr_calc_bl        ),
                                                    
    /*output reg		 */.ddr_ins_op_vld		    (ddr_ins_op_vld     ),
    /*output reg [25:0]  */.ddr_address   		    (ddr_address        ),
    /*output reg [511:0] */.ddr_write_data  	    (ddr_write_data     ),
    /*output reg         */.ddr_rd_req  		    (ddr_rd_req         ),
    /*output reg         */.ddr_wr_req 			    (ddr_wr_req         ),
    /*output reg [6:0]   */.ddr_bl_size  		    (ddr_bl_size        )
);

ddr_para_init_ins_gen ddr_para_init_ins_gen(
    /*input              */.sys_clk                 (sys_clk_data       ),
    /*input              */.sys_rst_n               (sys_rst_n          ),

    /*input              */.ddr_init_ins_gen_vld    (ddr_ins_push_vld   ),
    /*input              */.ddr_init_continue       (ddr_init_cont      ),

    /*output reg         */.ddr_init_ins_vld        (ddr_init_ins_vld   ),
    /*output reg [127:0] */.ddr_init_data           (ddr_init_data      ),
    /*output reg [27:0]  */.ddr_init_addr           (ddr_init_addr      ),
    /*output reg [3:0]   */.ddr_init_bl             (ddr_init_bl        ),
    /*output reg [0:0]   */.ddr_init_rdreq          (ddr_init_rdreq     ),
    /*output reg [0:0]   */.ddr_init_wrreq          (ddr_init_wrreq     ),

    /*output reg         */.ddr_init_finish         (ddr_init_finish    ) 
);                                                  

// assign mobilenet_rst_n = ddr_init_finish & mobilenet_reset_n;

always @ (posedge sys_clk_data) begin 
    mobilenet_rst_n <= ddr_init_finish & mobilenet_reset_n;
end

mobilenet_acc_top mobilenet_acc_top(
    /*input              */.clk_data                (sys_clk_data	    ),
    /*input              */.clk_calc                (sys_clk_calc	    ),
    /*input              */.rst_n                   (mobilenet_rst_n    ),
    
    //////////user interface//////////
    /*input              */.veri_data_uart_rdreq    (uart_rdreq         ),
    /*output             */.veri_data_uart_start    (uart_start         ),
    /*output             */.veri_data_uart_out_vld  (uart_out_vld       ),
    /*output [31:0]      */.veri_data_uart_out      (uart_out           ),    
    /*output wire        */.net_map_finish          (net_map_finish     ),
    /*output wire        */.calc_res_vld            (calc_res_vld       ),
    /*output wire [511:0]*/.calc_res                (calc_res           ),
    /*output wire        */.data_gen_vld            (data_gen_vld       ),    
    //////////ddr interface//////////
    /*input              */.ddr_rd_fifo_half        (ddr_rd_fifo_half   ),     
    /*input              */.ddr_ins_push_vld        (ddr_ins_push_vld   ),
    /*input              */.ddr_rd_data_vld         (ddr_rd_data_vld    ),
    /*input   [127:0]    */.ddr_rd_data             (ddr_rd_data        ),
    /*output             */.ddr_rddata_req          (ddr_ctrl_rd_en     ),
    /*output             */.ddr_rd_req              (ddr_calc_rdreq     ),
    /*output             */.ddr_wr_req              (ddr_calc_wrreq     ),
    /*output  [27:0]     */.ddr_address             (ddr_calc_addr      ),
    /*output  [3:0]      */.ddr_bl_size             (ddr_calc_bl        ),
    /*output  [127:0]    */.ddr_write_data          (ddr_calc_data		),
	/*output  		 	 */.ddr_ins_op_vld 		    (ddr_calc_ins_vld	)
);

calc_res_cache calc_res_cache(
    /*input              */.clk_200M                (sys_clk_calc       ),
    /*input              */.rst_n                   (sys_rst_n          ),

    /*input              */.net_calc_finish         (net_map_finish     ),
    /*input              */.calc_res_vld            (calc_res_vld       ),
    /*input [511:0]      */.calc_res                (calc_res           ),
    /*input              */.data_gen_vld            (data_gen_vld       ),

    /*input [9:0]        */.calc_res_ram_addr       (rd_res_addr[9:0]   ),
    /*output wire        */.calc_finish_pulse       (        ), 
    /*output reg [31:0]  */.calc_res_out            (rd_res_data        ),
    /*output reg [31:0]  */.calc_fps                (rd_calc_fps        ),
    /*output reg [31:0]  */.calc_use_part           (calc_use_part      ),
    /*output reg [31:0]  */.calc_total_part         (calc_total_part    )
);

ddr_utilization ddr_utilization(
    /*input              */.ddr_usr_clk             (ddr_clk            ),
    /*input              */.sys_rst_n               (ddr_rst_n          ),

    /*input              */.net_finish              (net_map_finish     ),
    /*input              */.ddr_rdy                 (ddr_avl_ready      ),
    /*input              */.ddr_rdreq               (ddr_avl_rd_req     ),
    /*input              */.ddr_wrreq               (ddr_avl_wr_req     ),

    /*output reg [31:0]  */.use_part                (ddr_used_rdy_num   ),
    /*output reg [31:0]  */.use_wr_part             (ddr_used_wr_num    ),
    /*output reg [31:0]  */.unuse_part              (ddr_unused_rdy_num ) 
);

endmodule 
