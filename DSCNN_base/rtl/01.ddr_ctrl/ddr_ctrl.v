module ddr_ctrl
    #(parameter WRBL=32, WRBL_CNT=31)(
    input                   clk_data			,
	input					clk_calc			,
    input                   rst_n				,
    
    ///////ddr_read_ins_interface//////
    input                   ddr_rd_ins_vld		,
    input [33:0]            ddr_rd_ins			,
    output reg              ddr_rd_ins_gen_vld	,
    // input [27:0]            ddr_rd_addr,
    // input [3:0]             ddr_rd_bl, 
    //////////data_fifo_usedw//////////
    input                   data_fifo_full_n	,  
    //////ddr_write_ins_interface//////
    input                   ddr_wr_ins_vld		,
    input [545:0]           ddr_wr_ins			,
    output reg              wr_ins_full         ,
	//////ddr_init_ins_interface//////
    // input                   ddr_init_ins_vld	,
    // input [544:0]           ddr_init_ins		,
	// output reg 				ddr_init_ins_gen_vld,
	//////ddr_veri_rd_ins_interface//////
	// input					ddr_veri_ins_vld	,
	// input [31:0]			ddr_veri_ins		,
    // input                   ddr_veri_ins_push   ,
	// output reg  			ddr_veri_ins_gen_vld,
    ////////ddr_user_interface//////// 
    // input                   local_init_done		,
    // input                   ddr_rdy				,
    input                   ddr_ins_push_vld    ,
    output reg [25:0] 		ddr_ctrl_addr		,
    output reg [511:0] 		ddr_ctrl_data		,
    output reg              ddr_ctrl_rd_req		,
    output reg              ddr_ctrl_wr_req		,
    output reg [6:0]        ddr_ctrl_bl_size	,
	output reg 				ddr_ctrl_ins_vld
);                          
   
//-------------------------------------------
// parameters
//------------------------------------------- 
parameter MODE_RST       = 4'd0;  //ddr rst
parameter MODE_FREE      = 4'd1;  //ddr free
parameter MODE_READ      = 4'd2;  //ddr work in read mode
parameter MODE_WRITE     = 4'd3;  //ddr work in write mode
parameter MODE_VERI      = 4'd4;  //calc verify mode
parameter MODE_WAIT_FIFO = 4'd5;  //wait for FIFO free
parameter MODE_DDR_INIT  = 4'd6;  //ddr init for loading featue & weight & bias
  
reg 	[25:0] 					ddr_addr	;
reg 	[511:0] 				ddr_data	;
wire	            			ddr_rd_req	;
reg              				ddr_wr_req	;
reg 	[6:0]        			ddr_bl_size	;

//-------------------------------------------
// ddr_read_ins_fifo_ctrl
//-------------------------------------------
wire [33:0]                 ddr_rd_ins_fifo_in      ;
reg                         ddr_rd_ins_fifo_rdreq   ;
wire                        ddr_rd_ins_fifo_wrreq   ;
wire [33:0]                 ddr_rd_ins_fifo_out     ;
wire                        ddr_rd_ins_fifo_empty   ;
wire                        ddr_rd_ins_fifo_full    ;
wire [7:0]                  ddr_rd_ins_fifo_usedw   ;
wire                        ddr_rd_ins_finish       ;
wire [25:0]                 ddr_rd_ins_addr         ;
wire [6:0]                  ddr_rd_ins_bl           ;
assign ddr_rd_ins_fifo_in               = ddr_rd_ins;
assign ddr_rd_ins_fifo_wrreq            = ddr_rd_ins_vld;
assign {ddr_rd_ins_finish, ddr_rd_ins_addr, ddr_rd_ins_bl} = ddr_rd_ins_fifo_out;

fifo_ddr_rd_ins fifo_ddr_rd_ins(
	.wrclk                  (clk_calc               ),
	.wrreq                  (ddr_rd_ins_fifo_wrreq  ),
	.data                   (ddr_rd_ins_fifo_in     ),
	.wrusedw                (ddr_rd_ins_fifo_usedw  ),
	.rdclk                  (clk_data               ),
	.rdreq                  (ddr_rd_ins_fifo_rdreq  ),
    .aclr                   (~rst_n                 ),   
	.q                      (ddr_rd_ins_fifo_out    ),
	.rdempty                (ddr_rd_ins_fifo_empty  ),
	.wrfull                 (ddr_rd_ins_fifo_full   )
);

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin
        ddr_rd_ins_gen_vld <= 1'b0;
    end else if (ddr_rd_ins_fifo_usedw < 8'd64) begin
        ddr_rd_ins_gen_vld <= 1'b1;
    end else begin
        ddr_rd_ins_gen_vld <= 1'b0;
    end
end


//-------------------------------------------
// ddr_write_ins_fifo_ctrl
//-------------------------------------------
wire [545:0]                ddr_wr_ins_fifo_in      ;
wire                        ddr_wr_ins_fifo_rdreq   ;
wire                        ddr_wr_ins_fifo_wrreq   ;
wire [545:0]                ddr_wr_ins_fifo_out     ;
wire                        ddr_wr_ins_fifo_empty   ;
wire                        ddr_wr_ins_fifo_full    ;
wire [7:0]                  ddr_wr_ins_fifo_usedw   ;
wire						ddr_wr_layer_finish     ;
wire [511:0]                ddr_wr_ins_data         ;
wire [25:0]                 ddr_wr_ins_addr         ;
wire [6:0]                  ddr_wr_ins_bl           ;
assign ddr_wr_ins_fifo_in               = ddr_wr_ins    ;
assign ddr_wr_ins_fifo_wrreq            = ddr_wr_ins_vld;
assign {ddr_wr_layer_finish, ddr_wr_ins_data, ddr_wr_ins_addr, ddr_wr_ins_bl} = ddr_wr_ins_fifo_out;

fifo_ddr_wr_ins fifo_ddr_wr_ins(
	.wrclk                  (clk_calc               ),
	.wrreq                  (ddr_wr_ins_fifo_wrreq  ),
	.data                   (ddr_wr_ins_fifo_in     ),
	.rdclk                  (clk_data               ),
	.rdreq                  (ddr_wr_ins_fifo_rdreq  ),
    .aclr                   (~rst_n                 ), 
	.q                      (ddr_wr_ins_fifo_out    ),
	.rdempty                (ddr_wr_ins_fifo_empty  ),
	.wrusedw                (ddr_wr_ins_fifo_usedw  ),
	.wrfull                 (ddr_wr_ins_fifo_full   )
);

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        wr_ins_full <= 1'b0;
    end else begin 
        wr_ins_full <= ddr_wr_ins_fifo_usedw > 200 ? 1'b1 : 1'b0;
    end
end


//-------------------------------------------
// handshake
//-------------------------------------------
wire                            handshake;
wire [1:0]                      wr_layer_finish_delay;
reg                             wr_layer_finish_delay_r;
assign wr_layer_finish_delay[0] = ddr_wr_layer_finish == 1'b1 & ddr_wr_ins_fifo_empty == 1'b0;
assign wr_layer_finish_delay[1] = wr_layer_finish_delay[0] & ~wr_layer_finish_delay_r;
always @ (posedge clk_data) begin 
    wr_layer_finish_delay_r <= wr_layer_finish_delay[0];
end

assign handshake = ddr_ins_push_vld & ~wr_layer_finish_delay[1];

//pw2dw 
wire                            pw2dw_wr_lock;

assign pw2dw_wr_lock = ddr_wr_ins_bl == WRBL & ddr_wr_ins_fifo_empty == 1'b0;

reg [6:0]                       pw2dw_wr_ins_cnt;
reg [6:0]                       pw2dw_wr_ins_rdy_cnt;
reg [6:0]                       pw2dw_wr_load_ins_cnt;
wire                            pw2dw_wr_ins_full;
reg [1:0]                       pw2dw_wr_ins_full_r;
wire                            pw2dw_wr_ins_full_sync;
wire                            wr_ins_send_start;
wire                            wr_ins_load_vld;

//calc clk domain
always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        pw2dw_wr_ins_cnt <= 0;
    end else if (ddr_wr_ins_vld == 1'b1 && ddr_wr_ins[6:0] == WRBL && pw2dw_wr_ins_cnt == WRBL_CNT) begin 
        pw2dw_wr_ins_cnt <= 0;
    end else if (ddr_wr_ins_vld == 1'b1 && ddr_wr_ins[6:0] == WRBL)  begin 
        pw2dw_wr_ins_cnt <= pw2dw_wr_ins_cnt + 1'b1;
    end else begin 
        pw2dw_wr_ins_cnt <= pw2dw_wr_ins_cnt;
    end
end

assign pw2dw_wr_ins_full = ddr_wr_ins_vld == 1'b1 && ddr_wr_ins[6:0] == WRBL && pw2dw_wr_ins_cnt == WRBL_CNT;

//data clk domain
always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        pw2dw_wr_ins_full_r <= 2'b0;
    end else begin 
        pw2dw_wr_ins_full_r <= {pw2dw_wr_ins_full_r[0], pw2dw_wr_ins_full};
    end
end

assign pw2dw_wr_ins_full_sync = pw2dw_wr_ins_full_r[0] & ~pw2dw_wr_ins_full_r[1];

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        pw2dw_wr_ins_rdy_cnt <= 0;
    end else begin 
        case ({pw2dw_wr_ins_full_sync, wr_ins_send_start}) 
            2'b00 : pw2dw_wr_ins_rdy_cnt <= pw2dw_wr_ins_rdy_cnt;
            2'b01 : pw2dw_wr_ins_rdy_cnt <= pw2dw_wr_ins_rdy_cnt - 1'b1;
            2'b10 : pw2dw_wr_ins_rdy_cnt <= pw2dw_wr_ins_rdy_cnt + 1'b1;
            2'b11 : pw2dw_wr_ins_rdy_cnt <= pw2dw_wr_ins_rdy_cnt;
        endcase 
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        pw2dw_wr_load_ins_cnt <= 0;
    end else if (wr_ins_send_start == 1'b1) begin 
        pw2dw_wr_load_ins_cnt <= 1;
    end else if (pw2dw_wr_load_ins_cnt == WRBL && handshake == 1'b1) begin 
        pw2dw_wr_load_ins_cnt <= 0;
    end else if (pw2dw_wr_load_ins_cnt > 0 && handshake == 1'b1) begin 
        pw2dw_wr_load_ins_cnt <= pw2dw_wr_load_ins_cnt + 1'b1;
    end else begin 
        pw2dw_wr_load_ins_cnt <= pw2dw_wr_load_ins_cnt;
    end
end

reg                             pw2dw_wr_bl_vld;
 
always @ (posedge clk_data) begin 
    pw2dw_wr_bl_vld <= pw2dw_wr_load_ins_cnt == 1 & handshake == 1'b1;
end

assign wr_ins_send_start = pw2dw_wr_load_ins_cnt == 0 & pw2dw_wr_ins_rdy_cnt > 0 & pw2dw_wr_lock == 1'b1;
assign wr_ins_load_vld = ~pw2dw_wr_lock | pw2dw_wr_load_ins_cnt > 0;


//-------------------------------------------
// ddr_init_ins_fifo_ctrl
//-------------------------------------------
// wire [160:0]                ddr_init_ins_fifo_in    ;
// reg                         ddr_init_ins_fifo_rdreq ;
// wire                        ddr_init_ins_fifo_wrreq ;
// wire [160:0]                ddr_init_ins_fifo_out   ;
// wire                        ddr_init_ins_fifo_empty ;
// wire                        ddr_init_ins_fifo_full  ;
// wire [7:0]                  ddr_init_ins_fifo_usedw ;
// wire						ddr_init_finish         ;
// wire [127:0]                ddr_init_ins_data       ;
// wire [27:0]                 ddr_init_ins_addr       ;
// wire [3:0]                  ddr_init_ins_bl         ;
// assign ddr_init_ins_fifo_in             = ddr_init_ins    ;
// assign ddr_init_ins_fifo_wrreq          = ddr_init_ins_vld;
// assign {ddr_init_finish, ddr_init_ins_data, ddr_init_ins_addr, ddr_init_ins_bl} = ddr_init_ins_fifo_out;
// fifo_ddr_init_ins fifo_ddr_init_ins(
	// .wrclk                  (clk_data               ),
	// .data                   (ddr_init_ins_fifo_in   ),
	// .wrreq                  (ddr_init_ins_fifo_wrreq),
	// .rdclk                  (clk_data               ),
	// .rdreq                  (ddr_init_ins_fifo_rdreq),
    // .aclr                   (~rst_n                 ), 
	// .q                      (ddr_init_ins_fifo_out  ),
	// .rdempty                (ddr_init_ins_fifo_empty),
	// .rdusedw                (ddr_init_ins_fifo_usedw),
	// .wrfull                 (ddr_init_ins_fifo_full )
// );

// always @ (posedge clk_data or negedge rst_n) begin 
	// if (!rst_n) begin 
		// ddr_init_ins_gen_vld <= 1'b0;
	// end else if (ddr_init_ins_fifo_usedw < 8'd64) begin 
		// ddr_init_ins_gen_vld <= 1'b1;
	// end else begin 
		// ddr_init_ins_gen_vld <= 1'b0;
	// end
// end

reg [3:0]                     ddr_rd_wr_arbi;
reg 						  ddr_wr_ins_fifo_rdreq_p;
assign ddr_wr_ins_fifo_rdreq = ddr_wr_ins_fifo_rdreq_p & ~ddr_wr_ins_fifo_empty;

//-------------------------------------------
// ddr_read_write_mode_arbitration
//-------------------------------------------
// ddr_rd_wr_arbi 0: ddr read mode
// ddr_rd_wr_arbi 1: ddr write mode
//-------------------------------------------
reg [1:0]					  ddr_state_cur;
reg [1:0]					  ddr_state_next;

parameter INIT_STATE = 2'd0;
parameter CALC_STATE = 2'd1;
parameter VERI_STATE = 2'd2;
parameter FREE_STATE = 2'd3;

always @ (posedge clk_data or negedge rst_n) begin
	if (!rst_n) begin 
		// ddr_state_cur <= INIT_STATE;
        ddr_state_cur <= CALC_STATE;
	end else begin 
		ddr_state_cur <= ddr_state_next;
	end
end

//test
wire ddr_conv_test_read_finish;
assign ddr_conv_test_read_finish = 1'b0;

always @ (*) begin 
	// ddr_state_next = INIT_STATE;
    ddr_state_next = CALC_STATE;
	case (ddr_state_cur)
		// INIT_STATE : begin 
			// if (handshake == 1'b1 && ddr_init_finish == 1'b1) begin 
				// ddr_state_next = CALC_STATE;
			// end else begin 
				// ddr_state_next = INIT_STATE;
			// end
		// end
		CALC_STATE : begin
            // add signal ddr_rd_ins_fifo_empty to prevent
            // the occurrence of empty FIFO random output
			if (handshake == 1'b1 && ddr_rd_ins_finish == 1'b1 && ddr_rd_ins_fifo_empty == 1'b0) begin
				ddr_state_next = CALC_STATE;
			end else begin 
				ddr_state_next = CALC_STATE;
			end
		end
		FREE_STATE : begin 
			ddr_state_next = FREE_STATE;
		end
		default begin 
			ddr_state_next = FREE_STATE;
		end
	endcase 
end

// reg                        ddr_veri_ins_push_lock;

// always @ (posedge clk_data or negedge rst_n) begin 
    // if (!rst_n) begin
        // ddr_veri_ins_push_lock <= 1'b0;
    // end else if (ddr_veri_ins_push == 1'b1) begin 
        // ddr_veri_ins_push_lock <= 1'b1;
    // end else if (ddr_state_cur == VERI_STATE && ddr_veri_ins_push_lock == 1'b1 && handshake == 1'b1 && ddr_veri_ins_fifo_empty == 1'b0) begin 
        // ddr_veri_ins_push_lock <= 1'b0;
    // end else begin 
        // ddr_veri_ins_push_lock <= ddr_veri_ins_push_lock;
    // end
// end

always @ (posedge clk_data or negedge rst_n) begin 
	if (!rst_n) begin 
        ddr_rd_wr_arbi            <= MODE_RST;
        ddr_rd_ins_fifo_rdreq     <= 1'b0;
        ddr_wr_ins_fifo_rdreq_p   <= 1'b0;	
	end else begin 
		case (ddr_state_cur)
			// INIT_STATE : begin 
				// if (handshake == 1'b1 && ddr_init_ins_fifo_empty == 1'b0) begin 
					// ddr_rd_wr_arbi 			  <= MODE_DDR_INIT;
					// ddr_init_ins_fifo_rdreq   <= 1'b1;
					// ddr_rd_ins_fifo_rdreq     <= 1'b0;
					// ddr_wr_ins_fifo_rdreq_p   <= 1'b0;
				// end else begin 
					// ddr_rd_wr_arbi 			  <= MODE_FREE;
					// ddr_init_ins_fifo_rdreq   <= 1'b0;
					// ddr_rd_ins_fifo_rdreq     <= 1'b0;
					// ddr_wr_ins_fifo_rdreq_p   <= 1'b0;	
				// end
			// end
			CALC_STATE : begin 
				if (handshake == 1'b1 && ddr_wr_ins_fifo_empty == 1'b0 && wr_ins_load_vld == 1'b1) begin 
					ddr_rd_wr_arbi            <= MODE_WRITE;
					ddr_rd_ins_fifo_rdreq     <= 1'b0;
					ddr_wr_ins_fifo_rdreq_p   <= 1'b1;
				end else if (handshake == 1'b1 && ddr_rd_ins_fifo_empty == 1'b0 && data_fifo_full_n == 1'b0) begin 
					ddr_rd_wr_arbi            <= MODE_READ;
					ddr_rd_ins_fifo_rdreq     <= 1'b1;
					ddr_wr_ins_fifo_rdreq_p   <= 1'b0;
				end else if (handshake == 1'b1 && ddr_rd_ins_fifo_empty == 1'b0 && data_fifo_full_n == 1'b1) begin 
					ddr_rd_wr_arbi            <= MODE_WAIT_FIFO;
					ddr_rd_ins_fifo_rdreq     <= 1'b0;
					ddr_wr_ins_fifo_rdreq_p   <= 1'b0;                   
				end else begin  
					ddr_rd_wr_arbi            <= MODE_FREE;
					ddr_rd_ins_fifo_rdreq     <= 1'b0;
					ddr_wr_ins_fifo_rdreq_p   <= 1'b0;
				end
			end      
			FREE_STATE : begin       
				ddr_rd_wr_arbi                <= MODE_FREE;
				ddr_rd_ins_fifo_rdreq         <= 1'b0;
				ddr_wr_ins_fifo_rdreq_p       <= 1'b0;
			end    
			default : begin     
				ddr_rd_wr_arbi                <= MODE_RST;
				ddr_rd_ins_fifo_rdreq         <= 1'b0;
				ddr_wr_ins_fifo_rdreq_p       <= 1'b0;				
			end
		endcase
	end
end

reg							  ddr_op_fifo_vld;

always @ (posedge clk_data) begin 
    ddr_op_fifo_vld <= ((ddr_rd_ins_fifo_rdreq == 1'b1   & ddr_rd_ins_fifo_empty == 1'b0  ) | 
                        (ddr_wr_ins_fifo_rdreq == 1'b1   & ddr_wr_ins_fifo_empty == 1'b0  ) );
end

//-------------------------------------------
// ddr_read_write_interface
//-------------------------------------------
reg                           ddr_rd_req_r; 
// assign ddr_rd_req = ddr_rd_req_r & (~data_fifo_full_n);
assign ddr_rd_req = ddr_rd_req_r;

always @ (posedge clk_data or negedge rst_n) begin 
	if (!rst_n) begin 
        ddr_rd_req_r    <= 1'b0;
        ddr_wr_req      <= 1'b0;
        ddr_addr        <= 28'd0;
        ddr_data        <= 512'd0;
        ddr_bl_size     <= 4'd0; 		
	end else begin 
		case(ddr_rd_wr_arbi)
			MODE_RST : begin
				ddr_rd_req_r    <= 1'b0;
				ddr_wr_req      <= 1'b0;
				ddr_addr        <= 28'd0;
				ddr_data        <= 512'd0;
				ddr_bl_size     <= 4'd0;    
			end
			MODE_FREE : begin 
				ddr_rd_req_r    <= ddr_rd_req_r;
				ddr_wr_req      <= ddr_wr_req;
				ddr_addr        <= ddr_addr;
				ddr_data        <= ddr_data;
				ddr_bl_size     <= ddr_bl_size;
			end
			MODE_READ :begin 
				ddr_rd_req_r    <= 1'b1;
				ddr_wr_req      <= 1'b0;
				ddr_addr        <= ddr_rd_ins_addr;
				ddr_data        <= ddr_data;
				ddr_bl_size     <= ddr_rd_ins_bl;
			end
			MODE_WRITE : begin 
				ddr_rd_req_r    <= 1'b0;
				ddr_wr_req      <= 1'b1;
				ddr_addr        <= ddr_wr_ins_addr;
				ddr_data        <= ddr_wr_ins_data;
				// ddr_bl_size     <= ddr_wr_ins_bl == 7'd16 ? (pw2dw_wr_bl_vld ? 7'd16 : 7'd0) : ddr_wr_ins_bl;
                ddr_bl_size     <= ddr_wr_ins_bl;
			end
			MODE_WAIT_FIFO : begin
				ddr_rd_req_r    <= 1'b0;
				ddr_wr_req      <= 1'b0;
				ddr_addr        <= ddr_addr;
				ddr_data        <= ddr_data;
				ddr_bl_size     <= ddr_bl_size;
			end
			// MODE_DDR_INIT : begin 
				// ddr_rd_req_r	<= 1'b0;
				// ddr_wr_req      <= 1'b1;
				// ddr_addr        <= ddr_init_ins_addr;
				// ddr_data        <= ddr_init_ins_data;
				// ddr_bl_size     <= ddr_init_ins_bl;
			// end
			default : begin 
				ddr_rd_req_r    <= 1'b0;
				ddr_wr_req      <= 1'b0;
				ddr_addr        <= 28'd0;
				ddr_data        <= 512'd0;
				ddr_bl_size     <= 4'd0;   
			end
		endcase
	end
end

always @ (posedge clk_data) begin 
	ddr_ctrl_addr		<= ddr_addr			;
	ddr_ctrl_data		<= ddr_data			;
	ddr_ctrl_rd_req		<= ddr_rd_req		;
	ddr_ctrl_wr_req		<= ddr_wr_req		;
	ddr_ctrl_bl_size	<= ddr_bl_size		;
	ddr_ctrl_ins_vld	<= ddr_op_fifo_vld	;
end

////-------------------------------------------
//// ddr_init_ins_fifo_ctrl
////-------------------------------------------
//wire [161:0]                ddr_op_ins_fifo_in;
//wire                        ddr_op_ins_fifo_rdreq;
//wire                        ddr_op_ins_fifo_wrreq;
//wire [161:0]                ddr_op_ins_fifo_out;
//wire                        ddr_op_ins_fifo_empty;
//wire                        ddr_op_ins_fifo_full;
//wire [7:0]                  ddr_op_ins_fifo_usedw;
//wire						ddr_op_ins_ddr_rd_req;
//wire						ddr_op_ins_ddr_wr_req;
//wire [127:0]                ddr_op_ins_data;
//wire [27:0]                 ddr_op_ins_addr;
//wire [3:0]                  ddr_op_ins_bl;
//assign ddr_op_ins_fifo_wrreq           = ddr_op_fifo_vld;
//assign ddr_op_ins_fifo_rdreq = handshake == 1'b1 & ddr_op_ins_fifo_empty == 1'b0;
//assign ddr_op_ins_fifo_in			   = {ddr_rd_req, ddr_wr_req, ddr_data, ddr_addr, ddr_bl_size};
//assign {ddr_op_ins_ddr_rd_req, ddr_op_ins_ddr_wr_req, ddr_op_ins_data, ddr_op_ins_addr, ddr_op_ins_bl}
//		= ddr_op_ins_fifo_out;
//
//fifo_ddr_op_ins fifo_ddr_op_ins(
//	.clock					(clk_data),
//	.wrreq					(ddr_op_ins_fifo_wrreq),
//	.data					(ddr_op_ins_fifo_in),
//	.rdreq					(ddr_op_ins_fifo_rdreq),
//	.q						(ddr_op_ins_fifo_out),
//	.empty					(ddr_op_ins_fifo_empty),
//	.full					(ddr_op_ins_fifo_full),
//	.usedw					(ddr_op_ins_fifo_usedw)
//);
//
//
//always @ (posedge clk_data or negedge rst_n) begin 
//	if (!rst_n) begin 
//		ddr_ctrl_rd_req		<= 1'b0;
//		ddr_ctrl_wr_req		<= 1'b0;
//		ddr_ctrl_data		<= 128'd0;
//		ddr_ctrl_addr		<= 28'd0;
//		ddr_ctrl_bl_size	<= 4'd0;
//	end else begin 
//		case ({handshake, ddr_op_ins_fifo_empty})
//			2'b00, 2'b01 : begin 
//				ddr_ctrl_rd_req		<= ddr_ctrl_rd_req		;
//		        ddr_ctrl_wr_req		<= ddr_ctrl_wr_req		;
//		        ddr_ctrl_data		<= ddr_ctrl_data		;
//		        ddr_ctrl_addr		<= ddr_ctrl_addr		;
//		        ddr_ctrl_bl_size	<= ddr_ctrl_bl_size		;
//			end
//			2'b10 : begin 
//				ddr_ctrl_rd_req		<= ddr_op_ins_ddr_rd_req;
//				ddr_ctrl_wr_req		<= ddr_op_ins_ddr_wr_req;
//				ddr_ctrl_data		<= ddr_op_ins_data		;
//				ddr_ctrl_addr		<= ddr_op_ins_addr		;		
//				ddr_ctrl_bl_size	<= ddr_op_ins_bl		;							
//			end
//			2'b11 : begin 
//				ddr_ctrl_rd_req		<= 1'b0;
//				ddr_ctrl_wr_req		<= 1'b0;
//				ddr_ctrl_data		<= ddr_op_ins_data		;
//				ddr_ctrl_addr		<= ddr_op_ins_addr		;		
//				ddr_ctrl_bl_size	<= ddr_op_ins_bl		;						
//			end
//		endcase 
//	end
//end

endmodule 

