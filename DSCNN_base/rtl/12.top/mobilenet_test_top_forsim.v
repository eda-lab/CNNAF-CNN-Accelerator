module mobilenet_test_top_forsim(
	input						sys_clk_100M			,
	input						sys_clk_200M			,
	input						sys_rst_n				,
    
    //////////user_interface//////////
    input                       uart_rdreq    ,
    output                      uart_start    , 
    output                      uart_out_vld  ,
    output [31:0]               uart_out      ,
	
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

wire                            ddr_ctrl_rd_en      ;
wire                            ddr_rd_fifo_half    ;
wire							ddr_rd_data_vld	    ;
wire [511:0]					ddr_rd_data		    ;	
wire [25:0] 	                ddr_address   	    ;
wire [511:0]                    ddr_write_data      ; 
wire                            ddr_rd_req  	    ;
wire                            ddr_wr_req 		    ;
wire [6:0]                      ddr_bl_size  	    ;
wire							ddr_ins_op_vld	    ;
wire                            ddr_ins_push_vld    ;

ddr_rd_data_sync ddr_rd_data_sync_u0(
	/*input				*/.ddr_clk_afi			(ddr_clk			),
	/*input             */.sys_clk_200M			(sys_clk_200M		),
    /*input             */.sys_rst_n			(sys_rst_n			),

    /*input             */.ddr_vld_afi			(ddr_avl_rd_data_vld),
    /*input [127:0]     */.ddr_data_out_afi		(ddr_avl_rd_data	),
    /*input             */.ddr_rd_en            (ddr_ctrl_rd_en     ),

    /*output reg	    */.ddr_rd_fifo_half     (ddr_rd_fifo_half   ),
	/*output reg	    */.ddr_vld				(ddr_rd_data_vld	),
    /*output reg [127:0]*/.ddr_data_out			(ddr_rd_data		)
);
	
ddr_ctrl_ins_sync ddr_ctrl_ins_sync_u0(	
	//user clock domain
	/*input wire         */.sys_clk_200M     	(sys_clk_200M       ),
    /*input wire         */.sys_rst_n			(sys_rst_n			),
        
	/*input wire         */.ddr_ins_op_vld		(ddr_ins_op_vld		),
	/*input wire [27:0]  */.ddr_address   		(ddr_address		),
    /*input wire [127:0] */.ddr_write_data  	(ddr_write_data		), 
    /*input wire         */.ddr_rd_req  		(ddr_rd_req			),
    /*input wire         */.ddr_wr_req 			(ddr_wr_req			),
    /*input wire [3:0]   */.ddr_bl_size  		(ddr_bl_size		),
    /*output reg         */.ddr_op_ins_push_vld (ddr_ins_push_vld   ),
    
	//ddr clock domain  
	/*input wire		 */.ddr_clk_afi			(ddr_clk     		),
    /*input wire         */.ddr_rst_n           (ddr_rst_n          ),
	/*input wire		 */.ddr_avl_rdy			(ddr_avl_ready		),
    
	/*output wire [25:0] */.ddr_avl_address   	(ddr_avl_address	),
	/*output wire [511:0]*/.ddr_avl_write_data  (ddr_avl_write_data	),
    /*output wire [63:0] */.ddr_avl_be      	(ddr_avl_be   		),
	/*output wire        */.ddr_avl_rd_req  	(ddr_avl_rd_req		),
	/*output wire        */.ddr_avl_wr_req 		(ddr_avl_wr_req		),
	/*output wire [6:0]  */.ddr_avl_bl_size  	(ddr_avl_bl_size	)
);
    
mobilenet_acc_top mobilenet_acc_top(
    /*input              */.clk_data                (sys_clk_200M	),
    /*input              */.clk_calc                (sys_clk_100M	),
    /*input              */.rst_n                   (sys_rst_n		),
    
    //////////user interface//////////
    /*input              */.veri_data_uart_rdreq    (uart_rdreq     ),
    /*output             */.veri_data_uart_start    (uart_start     ),
    /*output             */.veri_data_uart_out_vld  (uart_out_vld   ),
    /*output [31:0]      */.veri_data_uart_out      (uart_out       ),    
    
    //////////ddr interface//////////
    /*input              */.ddr_rd_fifo_half        (ddr_rd_fifo_half   ),     
    /*input              */.ddr_ins_push_vld        (ddr_ins_push_vld   ),
    /*input              */.ddr_rd_data_vld         (ddr_rd_data_vld    ),
    /*input   [127:0]    */.ddr_rd_data             (ddr_rd_data        ),
    /*output             */.ddr_rddata_req          (ddr_ctrl_rd_en     ),
    /*output             */.ddr_rd_req              (ddr_rd_req         ),
    /*output             */.ddr_wr_req              (ddr_wr_req         ),
    /*output  [27:0]     */.ddr_address             (ddr_address        ),
    /*output  [3:0]      */.ddr_bl_size             (ddr_bl_size        ),
    /*output  [127:0]    */.ddr_write_data          (ddr_write_data		),
	/*output  		 	 */.ddr_ins_op_vld 		    (ddr_ins_op_vld		)
);

endmodule 
