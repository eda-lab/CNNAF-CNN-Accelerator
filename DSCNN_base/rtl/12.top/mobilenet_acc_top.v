module mobilenet_acc_top
    #(parameter BANDWIDTH=512,
                BITWIDTH=32)(
    input                           clk_data                ,
    input                           clk_calc                ,
    input                           rst_n                   ,
    
    //////////user_interface//////////
    input                           veri_data_uart_rdreq    ,
    output                          veri_data_uart_start    ,
    output                          veri_data_uart_out_vld  ,
    output [31:0]                   veri_data_uart_out      ,
    output wire                     net_map_finish          ,
    output wire                     calc_res_vld            ,
    output wire [BITWIDTH*16-1:0]   calc_res                ,  
    output wire                     data_gen_vld            ,
    //////////ddr_interface//////////
    // input                        ddr_local_init_done     ,
    // input                        ddr_ready               ,
    input                           ddr_rd_fifo_half        ,
    input                           ddr_ins_push_vld        ,
    input                           ddr_rd_data_vld         ,
    input   [BITWIDTH*16-1:0]       ddr_rd_data             ,
    output                          ddr_rddata_req          ,
    output                          ddr_rd_req              ,
    output                          ddr_wr_req              ,
    output  [25:0]                  ddr_address             ,
    output  [6:0]                   ddr_bl_size             ,
    output  [BITWIDTH*16-1:0]       ddr_write_data			,
	output  					    ddr_ins_op_vld			
);

genvar i;
wire								fifo_full;
wire                                layer_acc_done;                     

//data_gen
wire                                data_vld_for_w;
wire                                data_acc_s;
wire [6:0]                          data_acc_para;
wire                                calc_sc_vld;
wire                                calc_sc_chg_en;
wire                                w_reload_done;
wire                                bias_reload_done;
wire                                acc_relu_en;
wire                                slice_acc_done;
wire                                bias_chg_en;
wire                                rd_data_mode_en;
wire                                data_gen_data_vld;

wire                                last_slice_vld;

assign ddr_rddata_req = ~(fifo_full & rd_data_mode_en);
assign data_gen_vld = data_gen_data_vld;

//-------------------------------------------
// ddr_ctrl
//-------------------------------------------
wire                                ddr_rd_ins_gen_vld;
wire                                ddr_rd_ins_vld;
wire [33:0]                         ddr_rd_ins;
// wire                                net_map_finish;

ddr_rd_ins_gen ddr_rd_ins_gen(
    /*input              */.clk_calc            (clk_calc          ),
    /*input              */.rst_n               (rst_n             ),
    /*                   */    
    /*input              */.last_slice_vld      (last_slice_vld    ),
    /*input              */.layer_acc_op_done   (layer_acc_done    ),  
    /*input              */.slice_acc_op_done   (slice_acc_done    ),
    /*input              */.ins_gen_vld         (ddr_rd_ins_gen_vld),
    /*input              */.net_map_finish      (net_map_finish    ),
    /*                   */                   
    /*output             */.ddr_rd_ins_vld      (ddr_rd_ins_vld    ),
    /*output     [32:0]  */.ddr_rd_ins          (ddr_rd_ins        )
);

// wire								ddr_init_ins_gen_vld;
// wire								ddr_init_ins_vld;
// wire [160:0]						ddr_init_ins;

// ddr_init_ins_gen ddr_init_ins_gen(
    // /*input               */.clk_200M				(clk_200M),
    // /*input               */.rst_n					(rst_n),
    // /*                    */                       
	// /*input				  */.ddr_init_ins_gen_vld	(ddr_init_ins_gen_vld),
    // /*                    */                       
    // /*output reg          */.data_init_ins_vld		(ddr_init_ins_vld),
    // /*output reg [160:0]  */.data_init_ins 		    (ddr_init_ins)    
// );

wire                                ddr_veri_ins_gen_vld;
wire                                ddr_veri_ins_vld;
wire [31:0]                         ddr_veri_ins;

// ddr_veri_ins_gen ddr_veri_ins_gen(
    // /*input               */ .clk_200M              (clk_200M),
    // /*input               */ .rst_n                 (rst_n),
                          
	// /*input			      */ .ddr_veri_ins_gen_vld  (ddr_veri_ins_gen_vld),

    // /*output reg          */ .ddr_veri_ins_vld      (ddr_veri_ins_vld),
    // /*output reg [31:0]   */ .ddr_veri_ins          (ddr_veri_ins)   
// );

wire                                ddr_wr_ins_vld;
wire [BITWIDTH*16+26+7+1-1:0]       ddr_wr_ins;
wire                                wr_ins_full;

ddr_ctrl ddr_ctrl(
    /*input              */ .clk_data            (clk_data          ),
	/*input              */ .clk_calc            (clk_calc          ),
    /*input              */ .rst_n               (rst_n             ),
                                                 
    ///////ddr_read_ins_interface//////          
    /*input              */ .ddr_rd_ins_vld      (ddr_rd_ins_vld    ),
    /*input [32:0]       */ .ddr_rd_ins          (ddr_rd_ins        ),
    /*output reg         */ .ddr_rd_ins_gen_vld  (ddr_rd_ins_gen_vld),
                                                 
    //////////data_fifo_usedw//////////          
    /*input              */ .data_fifo_full_n    (ddr_rd_fifo_half  ),
                                                 
    //////ddr_write_ins_interface//////          
    /*input              */ .ddr_wr_ins_vld      (ddr_wr_ins_vld    ),
    /*input [159:0]      */ .ddr_wr_ins          (ddr_wr_ins        ),
    /*output reg         */ .wr_ins_full         (wr_ins_full       ),
	
	//////ddr_init_ins_interface//////
    // /*input              */ .ddr_init_ins_vld	 (1'b0),
    // /*input [160:0]      */ .ddr_init_ins		 (161'b0),
	// /*output reg 		 */	.ddr_init_ins_gen_vld(),    
	////ddr_veri_rd_ins_interface//////
	// /*input				 */	.ddr_veri_ins_vld	 (ddr_veri_ins_vld),
	// /*input [31:0]		 */	.ddr_veri_ins		 (ddr_veri_ins),
    // /*input              */ .ddr_veri_ins_push   (ddr_veri_ins_push_vld),
	// /*output reg 		 */	.ddr_veri_ins_gen_vld(ddr_veri_ins_gen_vld),
    ////////ddr_user_interface////////           
    // /*input              */ .local_init_done     (ddr_local_init_done),
    // /*input              */ .ddr_rdy      		 (ddr_ready         ),
    /*input              */ .ddr_ins_push_vld    (ddr_ins_push_vld  ),
    /*output reg [25:0]  */ .ddr_ctrl_addr       (ddr_address       ),
    /*output reg [511:0] */ .ddr_ctrl_data       (ddr_write_data    ),
    /*output reg         */ .ddr_ctrl_rd_req     (ddr_rd_req        ),
    /*output reg         */ .ddr_ctrl_wr_req     (ddr_wr_req        ),
    /*output reg [6:0]   */ .ddr_ctrl_bl_size    (ddr_bl_size       ),
	/*output reg		 */ .ddr_ctrl_ins_vld	 (ddr_ins_op_vld	)	
); 

//-------------------------------------------
// ddr_rd_data_pro
//-------------------------------------------
wire                                data_out_vld;
wire                                w_out_vld;
wire                                sc_out_vld;
wire                                bias_out_vld;
wire [BANDWIDTH-1:0]                data_pro_data_out;
wire [BANDWIDTH-1:0]                data_pro_w_out;
wire [BANDWIDTH-1:0]                data_pro_sc_out;
wire [BANDWIDTH-1:0]                data_pro_bias_out;

ddr_rd_data_pro ddr_rd_data_pro(
    .clk_data                       (clk_data       ),
    .rst_n                          (rst_n          ),
    .ddr_vld                        (ddr_rd_data_vld),
    .ddr_data_out                   (ddr_rd_data    ),
    .data_out_vld                   (data_out_vld   ),
    .w_out_vld                      (w_out_vld      ),
    .sc_out_vld                     (sc_out_vld     ),
    .bias_out_vld                   (bias_out_vld   ),
    .data_out                       (data_pro_data_out),
	.w_out                       	(data_pro_w_out),
	.sc_out                       	(data_pro_sc_out),
	.bias_out                       (data_pro_bias_out),
    .rd_data_mode_en                (rd_data_mode_en),       
    .pic_size                       ( ),
    .channel_size                   ( ),
    .stride                         ( )
);

//-------------------------------------------
// acc_data_veri_tx
//-------------------------------------------
// acc_data_veri_tx acc_data_veri_tx(
    // /*input            */ .clk_100M         (clk_calc),
    // /*input            */ .clk_200M         (clk_data),
    // /*input            */ .rst_n            (rst_n),
                          
    // /*input [127:0]    */ .veri_data_in     (veri_data_out),
    // /*input            */ .veri_data_in_vld (veri_data_out_vld),
    // /*output reg       */ .veri_ins_push    (ddr_veri_ins_push_vld),
                          
    // /*input            */ .rd_req           (veri_data_uart_rdreq),
    // /*output reg       */ .acc_finish       (veri_data_uart_start),
    // /*output reg [31:0]*/ .acc_data         (veri_data_uart_out),
    // /*output reg       */ .acc_data_vld     (veri_data_uart_out_vld)
// ); 
//-------------------------------------------
// data_gen
//-------------------------------------------
wire [BITWIDTH*16*16-1:0]           data_gen_data_out;
wire [31:0]                         data_gen_view[15:0][15:0];
generate
    for(i = 0; i < 16; i = i + 1) begin : divide_data
        assign data_gen_view[i][ 0] = data_gen_data_out[i*BITWIDTH*16+BITWIDTH*1  - 1 : i*BITWIDTH*16 + BITWIDTH* 0];
        assign data_gen_view[i][ 1] = data_gen_data_out[i*BITWIDTH*16+BITWIDTH*2  - 1 : i*BITWIDTH*16 + BITWIDTH* 1];
        assign data_gen_view[i][ 2] = data_gen_data_out[i*BITWIDTH*16+BITWIDTH*3  - 1 : i*BITWIDTH*16 + BITWIDTH* 2];
        assign data_gen_view[i][ 3] = data_gen_data_out[i*BITWIDTH*16+BITWIDTH*4  - 1 : i*BITWIDTH*16 + BITWIDTH* 3];
        assign data_gen_view[i][ 4] = data_gen_data_out[i*BITWIDTH*16+BITWIDTH*5  - 1 : i*BITWIDTH*16 + BITWIDTH* 4];
        assign data_gen_view[i][ 5] = data_gen_data_out[i*BITWIDTH*16+BITWIDTH*6  - 1 : i*BITWIDTH*16 + BITWIDTH* 5];
        assign data_gen_view[i][ 6] = data_gen_data_out[i*BITWIDTH*16+BITWIDTH*7  - 1 : i*BITWIDTH*16 + BITWIDTH* 6];
        assign data_gen_view[i][ 7] = data_gen_data_out[i*BITWIDTH*16+BITWIDTH*8  - 1 : i*BITWIDTH*16 + BITWIDTH* 7];
        assign data_gen_view[i][ 8] = data_gen_data_out[i*BITWIDTH*16+BITWIDTH*9  - 1 : i*BITWIDTH*16 + BITWIDTH* 8];
        assign data_gen_view[i][ 9] = data_gen_data_out[i*BITWIDTH*16+BITWIDTH*10 - 1 : i*BITWIDTH*16 + BITWIDTH* 9];
        assign data_gen_view[i][10] = data_gen_data_out[i*BITWIDTH*16+BITWIDTH*11 - 1 : i*BITWIDTH*16 + BITWIDTH*10];
        assign data_gen_view[i][11] = data_gen_data_out[i*BITWIDTH*16+BITWIDTH*12 - 1 : i*BITWIDTH*16 + BITWIDTH*11];
        assign data_gen_view[i][12] = data_gen_data_out[i*BITWIDTH*16+BITWIDTH*13 - 1 : i*BITWIDTH*16 + BITWIDTH*12];
        assign data_gen_view[i][13] = data_gen_data_out[i*BITWIDTH*16+BITWIDTH*14 - 1 : i*BITWIDTH*16 + BITWIDTH*13];
        assign data_gen_view[i][14] = data_gen_data_out[i*BITWIDTH*16+BITWIDTH*15 - 1 : i*BITWIDTH*16 + BITWIDTH*14];
        assign data_gen_view[i][15] = data_gen_data_out[i*BITWIDTH*16+BITWIDTH*16 - 1 : i*BITWIDTH*16 + BITWIDTH*15];
    end
endgenerate

data_gen data_gen(
    /*input               */.clk_data                       (clk_data         ),
    /*input               */.clk_calc                       (clk_calc         ),
    /*input               */.rst_n                          (rst_n            ),
    /*input [127:0]       */.data_in                        (data_pro_data_out),
    /*input               */.data_in_vld                    (data_out_vld     ),
    /*input               */.w_reload_done                  (w_reload_done    ),
    /*input               */.bias_reload_done               (bias_reload_done ),
    /*input               */.wr_ins_full                    (wr_ins_full      ),
    
    /*output reg          */.fifo_rd_relu_vld_out           (acc_relu_en      ),
	/*output reg          */.fifo_vector_full			    (fifo_full		  ), 
    /*output reg          */.data_out_vld                   (data_gen_data_vld),
    /*output              */.data_vld_for_w                 (data_vld_for_w   ),
    /*output reg          */.data_acc_s                     (data_acc_s       ),
    /*output reg [7:0]    */.data_acc_para                  (data_acc_para    ),
    /*output reg          */.calc_sc_vld                    (calc_sc_vld      ),
    /*output reg          */.calc_sc_chg_en                 (calc_sc_chg_en   ),
    /*output reg          */.data_acc_layer_finish          (layer_acc_done   ),
    /*output reg          */.data_acc_slice_finish          (slice_acc_done   ),
    /*output reg          */.data_bias_slice_finish         (      ),
    /*output [32*9*16-1:0]*/.data_out                       (data_gen_data_out)
); 
//-------------------------------------------
// w_gen
//-------------------------------------------
wire [32*16*16-1:0]                 w_gen_w_out;
wire [31:0]                         w_gen_view[15:0][15:0];

generate
    for(i = 0; i < 16; i = i + 1) begin : divide_w
        assign w_gen_view[i][0]  = w_gen_w_out[i*512+32*1 - 1  : i*512 + 32*0];
        assign w_gen_view[i][1]  = w_gen_w_out[i*512+32*2 - 1  : i*512 + 32*1];
        assign w_gen_view[i][2]  = w_gen_w_out[i*512+32*3 - 1  : i*512 + 32*2];
        assign w_gen_view[i][3]  = w_gen_w_out[i*512+32*4 - 1  : i*512 + 32*3];
        assign w_gen_view[i][4]  = w_gen_w_out[i*512+32*5 - 1  : i*512 + 32*4];
        assign w_gen_view[i][5]  = w_gen_w_out[i*512+32*6 - 1  : i*512 + 32*5];
        assign w_gen_view[i][6]  = w_gen_w_out[i*512+32*7 - 1  : i*512 + 32*6];
        assign w_gen_view[i][7]  = w_gen_w_out[i*512+32*8 - 1  : i*512 + 32*7];
        assign w_gen_view[i][8]  = w_gen_w_out[i*512+32*9 - 1  : i*512 + 32*8];
        assign w_gen_view[i][9]  = w_gen_w_out[i*512+32*10 - 1 : i*512 + 32*9];
        assign w_gen_view[i][10] = w_gen_w_out[i*512+32*11 - 1 : i*512 + 32*10];
        assign w_gen_view[i][11] = w_gen_w_out[i*512+32*12 - 1 : i*512 + 32*11];
        assign w_gen_view[i][12] = w_gen_w_out[i*512+32*13 - 1 : i*512 + 32*12];
        assign w_gen_view[i][13] = w_gen_w_out[i*512+32*14 - 1 : i*512 + 32*13];
        assign w_gen_view[i][14] = w_gen_w_out[i*512+32*15 - 1 : i*512 + 32*14];
        assign w_gen_view[i][15] = w_gen_w_out[i*512+32*16 - 1 : i*512 + 32*15];
    end                                                                     
endgenerate

w_gen w_gen(
    .clk_data                       (clk_data             ),
    .clk_calc                       (clk_calc             ),
    .rst_n                          (rst_n                ),
    .w_in_vld                       (w_out_vld            ),
    .w_in                           (data_pro_w_out    	  ),
    .data_vld_in                    (data_vld_for_w       ),
    .data_acc_layer_finish          (slice_acc_done       ),
    .w_load_done                    (w_reload_done        ),
    .w_out                          (w_gen_w_out          )
);
//-------------------------------------------
// bias_gen
//-------------------------------------------
wire [BITWIDTH*16-1:0]              bias_gen_bias_out;

bias_gen bias_gen(
    .clk_data                       (clk_data           ),
    .rst_n                          (rst_n              ),
    .clk_calc                       (clk_calc           ),
    .bias_in_vld                    (bias_out_vld       ),
    .bias_in                        (data_pro_bias_out  ),
    .data_acc_layer_finish          (slice_acc_done     ),
    .bias_load_done                 (bias_reload_done   ),
    .bias_out                       (bias_gen_bias_out  )
);

wire [BITWIDTH-1:0]                 bias_gen_bias_out_view[15:0];
generate
    for(i = 0; i < 16; i = i + 1) begin : divide_bias_gen
        assign bias_gen_bias_out_view[i] = bias_gen_bias_out[i*32+31: i*32];
    end
endgenerate

//-------------------------------------------
// sc_ctrl
//-------------------------------------------
wire [BITWIDTH*16-1:0]              sc_data_out;
sc_ctrl sc_ctrl(
    .clk_data                       (clk_data       ),
    .clk_calc                       (clk_calc       ),
    .rst_n                          (rst_n          ),
    .sc_in                          (data_pro_sc_out),
    .sc_in_vld                      (sc_out_vld     ),
    .sc_out_en                      (calc_sc_chg_en ),    
    .sc_out                         (sc_data_out    )
);

//-------------------------------------------
// calc_unit_x16
//-------------------------------------------
wire                                calc_data_out_vld;
wire [BITWIDTH*16-1:0]              calc_data_out;

calc_unit_x16 calc_unit_x16(
    .clk_calc                       (clk_calc),
    .rst_n                          (rst_n),
    .w_in                           (w_gen_w_out),
    .data_in_vld                    (data_gen_data_vld),
    .data_in                        (data_gen_data_out),
    .acc_para                       (data_acc_para),
    .new_start                      (data_acc_s),
    .data_out_vld                   (calc_data_out_vld),
    .data_out                       (calc_data_out)
);

// calc_unit_x16 calc_unit_x16(
    // .clk_100M                       (clk_100M),
    // .rst_n                          (rst_n),
    // .w_in                           (w_gen_w_out),
    // .data_in_vld                    (data_gen_data_vld),
    // .data_in                        (4608'b0),
    // .acc_para                       (data_acc_para),
    // .new_start                      (data_acc_s),
    // .data_out_vld                   (calc_data_out_vld),
    // .data_out                       (calc_data_out)
// );

wire [31:0]                         calc_data_out_view[15:0];
generate
    for(i = 0; i < 16; i = i + 1) begin : divide_calc_data
        assign calc_data_out_view[i] = calc_data_out[i*32+31: i*32];
    end
endgenerate

reg [31:0]							data_acc_out_vld_cnt;

always @ (posedge clk_calc or negedge rst_n) begin
	if(!rst_n) begin
       data_acc_out_vld_cnt <= 16'd0;
   end
   else if (calc_data_out_vld == 1'b1) begin
       data_acc_out_vld_cnt <= data_acc_out_vld_cnt + 1'b1;
   end
end

// -------------------------------------------
// bias_add
// -------------------------------------------
wire                                bias_add_out_vld;
wire [BITWIDTH*16-1:0]              bias_add_data_out;
    
bias_add bias_add(
    .clk_calc                       (clk_calc),
    .rst_n                          (rst_n),
    .data_in_vld                    (calc_data_out_vld),
    .data_in                        (calc_data_out),
    .bias_in                        (bias_gen_bias_out),
    .sc_in                          (sc_data_out),
    .sc_vld                         (calc_sc_vld),
    .relu_en                        (acc_relu_en),
    .data_out_vld                   (bias_add_out_vld),
    .data_out                       (bias_add_data_out)
);

// bias_add bias_add(
    // .clk_100M                       (clk_100M),
    // .rst_n                          (rst_n),
    // .data_in_vld                    (calc_data_out_vld),
    // .data_in                        (512'b0),
    // .bias_in                        (bias_gen_bias_out),
    // .data_out_vld                   (bias_add_out_vld),
    // .data_out                       (bias_add_data_out)
// );

wire [31:0]                         bias_add_data_out_view[15:0];
generate
    for(i = 0; i < 16; i = i + 1) begin : divide_bias_add_data
        assign bias_add_data_out_view[i] = bias_add_data_out[i*32+31: i*32];
    end
endgenerate

reg [31:0]							data_bias_out_vld_cnt;

always @ (posedge clk_calc or negedge rst_n) begin
	if(!rst_n) begin
        data_bias_out_vld_cnt <= 16'd0;
    end
    else if (bias_add_out_vld == 1'b1) begin
        data_bias_out_vld_cnt <= data_bias_out_vld_cnt + 1'b1;
    end
end

acc_data_reorder_top acc_data_reorder_top(
    /*input              */ .clk_calc         (clk_calc           ),
    /*input              */ .rst_n            (rst_n              ),                  
    //////////acc_data//////////            
    /*input              */ .data_in_vld      (bias_add_out_vld   ), //bias_add_out_vld
    /*input [511:0]      */ .data_in          (bias_add_data_out  ),
    /*output wire        */ .last_slice_vld   (last_slice_vld     ),
    /*output wire        */ .net_map_finish   (net_map_finish     ),
    /*output             */ .calc_res_vld     (calc_res_vld       ),
    /*output[511:0]      */ .calc_res         (calc_res           ),                 
    /*output             */ .data_map_ins_vld (ddr_wr_ins_vld     ),
    /*output [159:0]     */ .data_map_ins     (ddr_wr_ins         )
);


endmodule
