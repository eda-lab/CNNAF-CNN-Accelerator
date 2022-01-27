module ddr_ctrl_ins_sync (	
	//user clock domain
	input wire                  sys_clk_200M		,
    input wire                  sys_rst_n			,
	
	input wire					ddr_ins_op_vld		,
	input wire [25:0] 	        ddr_address   		,
    input wire [511:0]          ddr_write_data  	, 
    input wire                  ddr_rd_req  		,
    input wire                  ddr_wr_req 			,
    input wire [6:0]            ddr_bl_size  		,
    output reg                  ddr_op_ins_push_vld ,
	
	//ddr clock domain
	input wire					ddr_clk_afi			,
    input wire                  ddr_rst_n           ,
	input wire					ddr_avl_rdy			,
	
	output reg [25:0] 			ddr_avl_address   	,
	output reg [511:0]			ddr_avl_write_data  ,
    output reg [63:0]           ddr_avl_be          ,
	output reg        			ddr_avl_rd_req  	,
	output reg        			ddr_avl_wr_req 		,
	output reg [6:0]  			ddr_avl_bl_size  	
);

//-------------------------------------------
// ddr_init_ins_fifo_ctrl
//-------------------------------------------
wire [546:0]                ddr_op_ins_fifo_in;
wire                        ddr_op_ins_fifo_rdreq;
wire                        ddr_op_ins_fifo_wrreq;
wire [546:0]                ddr_op_ins_fifo_out;
wire                        ddr_op_ins_fifo_empty;
wire                        ddr_op_ins_fifo_full;
wire [5:0]                  ddr_op_ins_fifo_usedw;
wire						ddr_op_ins_ddr_rd_req;
wire						ddr_op_ins_ddr_wr_req;
wire [511:0]                ddr_op_ins_data;
wire [25:0]                 ddr_op_ins_addr;
wire [6:0]                  ddr_op_ins_bl;

assign ddr_op_ins_fifo_wrreq           = ddr_ins_op_vld;
assign ddr_op_ins_fifo_in			   = {ddr_rd_req, ddr_wr_req, ddr_write_data, ddr_address, ddr_bl_size};
assign {ddr_op_ins_ddr_rd_req, ddr_op_ins_ddr_wr_req, ddr_op_ins_data, ddr_op_ins_addr, ddr_op_ins_bl}
		= ddr_op_ins_fifo_out;

assign ddr_op_ins_fifo_rdreq = ddr_avl_rdy == 1'b1 & ~ddr_op_ins_fifo_empty;
		
always @ (posedge sys_clk_200M or negedge sys_rst_n) begin 
    if (!sys_rst_n) begin 
        ddr_op_ins_push_vld <= 1'b0;
    end else if (ddr_op_ins_fifo_usedw < 6'd20) begin 
        ddr_op_ins_push_vld <= 1'b1;
    end else begin 
        ddr_op_ins_push_vld <= 1'b0;
    end
end

fifo_ddr_op_ins inst0_op_ins_fifo (
    .wrclk                  (sys_clk_200M),   //   input,    width = 1,            .wrclk
    .wrreq                  (ddr_op_ins_fifo_wrreq),   //   input,    width = 1,            .wrreq
    .data                   (ddr_op_ins_fifo_in),    //   input,  width = 161,  fifo_input.datain
    .rdclk                  (ddr_clk_afi),   //   input,    width = 1,            .rdclk
    .rdreq                  (ddr_op_ins_fifo_rdreq),   //   input,    width = 1,            .rdreq
    .aclr                   (~sys_rst_n),    //   input,    width = 1,            .aclr
    .q                      (ddr_op_ins_fifo_out),       //  output,  width = 161, fifo_output.dataout
    .wrusedw                (ddr_op_ins_fifo_usedw  ), //  output,    width = 8,            .rdusedw
    .rdempty                (ddr_op_ins_fifo_empty  ), //  output,    width = 1,            .rdempty
    .wrfull                 (ddr_op_ins_fifo_full   )   //  output,    width = 1,            .wrfull
);

always @ (posedge ddr_clk_afi or negedge ddr_rst_n) begin 
    if (!ddr_rst_n) begin 
        ddr_avl_address   	<= 26'b0   ;		
        ddr_avl_write_data  <= 512'b0;  
        ddr_avl_rd_req  	<= 1'b0  ;	
        ddr_avl_wr_req 		<= 1'b0 ;
        ddr_avl_bl_size  	<= 7'b0  ;        
    end else begin
        case ({ddr_avl_rdy, ddr_op_ins_fifo_empty})
            2'b00, 2'b01 : begin 
                ddr_avl_address   	<= ddr_avl_address   	;		
                ddr_avl_write_data  <= ddr_avl_write_data	;  
                ddr_avl_rd_req  	<= ddr_avl_rd_req  		;	
                ddr_avl_wr_req 		<= ddr_avl_wr_req 		;
                ddr_avl_bl_size  	<= ddr_avl_bl_size  	;
            end
            2'b10 : begin 
                ddr_avl_address   	<= ddr_op_ins_addr      ;	
                ddr_avl_write_data  <= ddr_op_ins_data      ;
                ddr_avl_rd_req  	<= ddr_op_ins_ddr_rd_req;
                ddr_avl_wr_req 		<= ddr_op_ins_ddr_wr_req;
                ddr_avl_bl_size  	<= ddr_op_ins_bl        ;						
            end
            2'b11 : begin 
                ddr_avl_address   	<= ddr_op_ins_addr      ;
                ddr_avl_write_data  <= ddr_op_ins_data      ;
                ddr_avl_rd_req  	<= 1'b0					;
                ddr_avl_wr_req 		<= 1'b0					;		
                ddr_avl_bl_size  	<= ddr_op_ins_bl        ;						
            end
        endcase 
    end
end         

always @ (posedge ddr_clk_afi or negedge ddr_rst_n) begin 
    if (!ddr_rst_n) begin 
        ddr_avl_be <= 64'h0;
    end else begin 
        ddr_avl_be <= 64'hffff_ffff_ffff_ffff;
    end
end

endmodule 

