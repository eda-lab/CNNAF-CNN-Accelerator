module data_gen
    #(parameter BANDWIDTH=512,
                BITWIDTH=32)(
    input                           clk_data,
    input                           clk_calc,
    input                           rst_n,
    input [BANDWIDTH-1:0]           data_in,
    input                           data_in_vld,
    input                           w_reload_done,  //权重切换完成信号
    input                           bias_reload_done,
    input                           wr_ins_full,
        
    output reg                      fifo_rd_relu_vld_out,
    output reg                      fifo_vector_full,
    output reg                      data_out_vld,
    output                          data_vld_for_w,
    output reg                      data_acc_s,
    output reg [6:0]                data_acc_para,
    output reg                      calc_sc_vld,
    output reg                      calc_sc_chg_en,
    output reg                      data_acc_layer_finish,
    output reg                      data_acc_slice_finish,  //层结束，权重切换信号
    output reg                      data_bias_slice_finish, //bias层结束，bias切换
    output wire[BITWIDTH*16*16-1:0] data_out
);
//-------------------------------------------
// regs & wires & parameters
//-------------------------------------------
parameter L_CONV  = 3'd0;
parameter L_DW    = 3'd1;
parameter L_PW    = 3'd2;
parameter L_AVGPL = 3'd3;
parameter L_PW_SC = 3'd4;

reg [9:0]                       data_full_max;

wire                            fifo_wr_en;
wire [BITWIDTH*16-1+20:0]       fifo_wr_all;

data_in_reorder data_in_reorder(
    .clk_data                   (clk_data   ),
    .rst_n                      (rst_n      ),
    .data_in                    (data_in    ),
    .data_in_vld                (data_in_vld),
    .fifo_wr_en                 (fifo_wr_en ),
    .fifo_wr_all                (fifo_wr_all)   
    //assign fifo_wr_all = {fifo_wr_layer_type_cur, fifo_wr_calc_en, fifo_wr_acc_s, fifo_wr_acc_para, fifo_rd_slice_finish, fifo_wr_data};
);

wire                            fifo_rd_en;
wire                            fifo_empty;
wire                            fifo_full;
wire [8:0]                      fifo_wrusedw;
wire [8:0]                      fifo_rdusedw;
wire [BITWIDTH*16-1+20:0]       fifo_rd_data;
wire [BITWIDTH*7-1:0]           zero_part;
wire [BITWIDTH*15-1:0]          zero_part2;

assign zero_part = 0;
assign zero_part2 = 0;

fifo_data	fifo_data_inst (
    .wrclk                      ( clk_data 		),
    .wrreq                      ( fifo_wr_en 	),
    .wrfull                     ( fifo_full 	),
    .wrusedw                    ( fifo_wrusedw 	),
    .data                       ( fifo_wr_all 	),
    .rdclk                      ( clk_calc 		),
    .aclr                       ( ~rst_n        ), 
    .rdreq                      ( fifo_rd_en 	),
    .rdempty                    ( fifo_empty 	),   
    .rdusedw                    ( fifo_rdusedw	),
    .q                          ( fifo_rd_data 	)
);

always @ (posedge clk_data or negedge rst_n) begin 
	if (!rst_n) begin
		fifo_vector_full <= 1'b0;
	end else if (fifo_wrusedw > data_full_max) begin 
		fifo_vector_full <= 1'b1;
	end else begin 
		fifo_vector_full <= 1'b0;
	end
end

wire [6:0]                      fifo_rd_layer_type;
wire                            fifo_rd_calc_en;
wire                            fifo_rd_acc_s;
wire                            fifo_rd_relu_vld;
wire                            fifo_rd_layer_finish;
wire [6:0]                      fifo_rd_acc_para;
wire                            fifo_rd_slice_finish;
wire                            fifo_rd_pw_sc_vld;
wire [BITWIDTH*16-1:0]          fifo_rd_data_part;

assign {fifo_rd_layer_type, fifo_rd_calc_en, fifo_rd_acc_s, fifo_rd_relu_vld, fifo_rd_layer_finish, fifo_rd_acc_para, fifo_rd_slice_finish, fifo_rd_pw_sc_vld, fifo_rd_data_part} = fifo_rd_data;

reg [1:0]                       fifo_rd_state;  //bit0:weight load done
                                                //bit1:bias load done
 
wire                            fifo_rd_slice_finish_vld; 
reg [6:0]                       fifo_rd_layer_type_r;
reg                             fifo_rd_slice_finish_r;
reg                             fifo_rd_relu_vld_p;
reg                             fifo_rd_calc_en_r; 
reg                             fifo_rd_pw_sc_vld_r;
reg                             fifo_rd_en_r;
        
always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_rd_layer_type_r   <= 7'b0;
        fifo_rd_slice_finish_r <= 1'b0;
        fifo_rd_calc_en_r      <= 1'b0;
        fifo_rd_relu_vld_p     <= 1'b0;
        data_acc_layer_finish  <= 1'b0;
        fifo_rd_pw_sc_vld_r    <= 1'b0;
        data_acc_s             <= 1'b0;
    end else if (fifo_rd_en == 1'b1) begin 
        fifo_rd_layer_type_r   <= fifo_rd_layer_type;
        fifo_rd_slice_finish_r <= fifo_rd_slice_finish;
        fifo_rd_calc_en_r      <= fifo_rd_calc_en;
        fifo_rd_relu_vld_p     <= fifo_rd_relu_vld;
        data_acc_layer_finish  <= fifo_rd_layer_finish;
        fifo_rd_pw_sc_vld_r    <= fifo_rd_pw_sc_vld;
        data_acc_s             <= fifo_rd_acc_s;
    end else begin 
        fifo_rd_layer_type_r   <= fifo_rd_layer_type_r;
        fifo_rd_slice_finish_r <= 1'b0;
        fifo_rd_calc_en_r      <= 1'b0;
        fifo_rd_relu_vld_p     <= fifo_rd_relu_vld_p;
        data_acc_layer_finish  <= 1'b0;
        fifo_rd_pw_sc_vld_r    <= 1'b0;
        data_acc_s             <= 1'b0;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        data_full_max <= 10'b0;
    end else if (fifo_rd_layer_type_r == L_DW) begin 
        data_full_max <= 10'd256;
    end else begin 
        data_full_max <= 10'd256;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        data_acc_para <= 7'b0;
    end else if (fifo_empty == 1'b0) begin 
        data_acc_para <= fifo_rd_acc_para;
    end else begin 
        data_acc_para <= data_acc_para;
    end
end

// always @ (posedge clk_calc or negedge rst_n) begin 
    // if (!rst_n) begin 
        // data_acc_s <= 1'b0;     
    // end else begin 
        // data_acc_s <= fifo_rd_acc_s;
    // end
// end

reg [15:0]                      calc_sc_vld_r;
reg [17:0]                      fifo_rd_relu_vld_r;
reg [14:0]                      calc_sc_chg_en_r;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin   
        calc_sc_vld_r           <= 16'b0;
        calc_sc_vld             <= 1'b0;
        fifo_rd_relu_vld_r      <= 18'b0;
        fifo_rd_relu_vld_out    <= 1'b0;
        calc_sc_chg_en_r        <= 15'b0;
        calc_sc_chg_en          <= 1'b0;
    end else begin 
        calc_sc_vld_r           <= {calc_sc_vld_r[14:0], fifo_rd_layer_type_r == L_PW_SC};
        calc_sc_vld             <= calc_sc_vld_r[15];
        fifo_rd_relu_vld_r      <= {fifo_rd_relu_vld_r[16:0], fifo_rd_relu_vld_p};
        fifo_rd_relu_vld_out    <= fifo_rd_relu_vld_r[17];
        calc_sc_chg_en_r        <= {calc_sc_chg_en_r[13:0], fifo_rd_pw_sc_vld_r};
        calc_sc_chg_en          <= calc_sc_chg_en_r[13];
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_rd_state <= 2'b0;
    end else if (fifo_rd_slice_finish_vld == 1'b1) begin 
        fifo_rd_state <= 2'b0;
    end else begin 
        fifo_rd_state <= fifo_rd_state | {bias_reload_done, w_reload_done};
    end
end

reg [39:0]                      data_bias_slice_finish_reg;

always @ (posedge clk_calc or negedge rst_n) begin
    if(!rst_n) begin
        data_bias_slice_finish_reg <= 40'b0;
        data_bias_slice_finish     <= 1'b0;
    end else begin
        data_bias_slice_finish_reg <= {data_bias_slice_finish_reg[38:0], fifo_rd_slice_finish_r};
        data_bias_slice_finish     <= data_bias_slice_finish_reg[38];
    end
end

assign fifo_rd_slice_finish_vld = fifo_rd_slice_finish & ~fifo_empty & fifo_rd_en_r;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_rd_en_r <= 1'b0;
    end else if (wr_ins_full == 1'b1) begin 
        fifo_rd_en_r <= 1'b0;
    end else if (fifo_rd_slice_finish_vld == 1'b1) begin 
        fifo_rd_en_r <= 1'b0;
    end else if (fifo_empty == 1'b0 && fifo_rd_state == 2'b11) begin 
        fifo_rd_en_r <= 1'b1;
    end else begin 
        fifo_rd_en_r <= 1'b0;
    end
end

assign fifo_rd_en = fifo_rd_en_r & ~fifo_empty;

reg                             data_slice_finish_reg[2:0];
wire                            data_slice_finish_start_once;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin
        data_slice_finish_reg[0] <= 1'b0; 
        data_slice_finish_reg[1] <= 1'b0;
        data_slice_finish_reg[2] <= 1'b0;
    end else begin 
        data_slice_finish_reg[0] <= 1'b1;
        data_slice_finish_reg[1] <= data_slice_finish_reg[0];
        data_slice_finish_reg[2] <= data_slice_finish_reg[1];
    end
end

assign data_slice_finish_start_once = data_slice_finish_reg[1] ^ data_slice_finish_reg[2];

reg                             data_layer_finish;

always @ (posedge clk_calc or negedge rst_n) begin
    if (!rst_n) begin
        data_acc_slice_finish <= 1'b0;
    end else begin
        data_acc_slice_finish <= data_slice_finish_start_once == 1'b1 | fifo_rd_slice_finish_r == 1'b1;
    end
end


reg [BITWIDTH*16-1:0]           dw_data_temp[14:0];
integer j;

always @ (posedge clk_calc) begin 
    if (fifo_rd_en == 1'b1) begin 
        for (j = 1; j < 15; j = j+1) begin 
            dw_data_temp[j] <= dw_data_temp[j-1];
        end
        dw_data_temp[0] <= fifo_rd_data_part;
    end else begin 
        for (j = 0; j < 15; j = j+1) begin 
            dw_data_temp[j] <= dw_data_temp[j];
        end
    end
end

reg [BITWIDTH*16-1:0]          data_out_r[15:0]; 
wire [BITWIDTH*16-1:0]         data_out_dw[15:0];
wire [BITWIDTH*16-1:0]         data_out_avgle[15:0];

genvar i;
generate
    for(i = 0; i < 16; i = i + 1) begin : dw_data_out_gen
        assign data_out_dw[i] = {zero_part, fifo_rd_data_part[i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                  dw_data_temp[ 0][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                  dw_data_temp[ 1][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                  dw_data_temp[ 5][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                  dw_data_temp[ 6][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                  dw_data_temp[ 7][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                  dw_data_temp[11][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                  dw_data_temp[12][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                  dw_data_temp[13][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH]};
    end
endgenerate

generate
    for(i = 0; i < 16; i = i + 1) begin : avgle_data_out_gen
        assign data_out_avgle[i] = {fifo_rd_data_part[i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                    dw_data_temp[ 0][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                    dw_data_temp[ 1][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                    dw_data_temp[ 2][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                    dw_data_temp[ 3][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                    dw_data_temp[ 4][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                    dw_data_temp[ 5][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                    dw_data_temp[ 6][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                    dw_data_temp[ 7][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                    dw_data_temp[ 8][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                    dw_data_temp[ 9][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                    dw_data_temp[10][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                    dw_data_temp[11][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                    dw_data_temp[12][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                    dw_data_temp[13][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH],
                                    dw_data_temp[14][i*BITWIDTH+BITWIDTH-1:i*BITWIDTH]};
    end
endgenerate

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        for (j = 0; j < 16; j = j+1) begin 
            data_out_r[j] <= 0;
        end
    end else begin 
        case (fifo_rd_layer_type[2:0])
            L_DW : begin 
                for (j = 0; j < 16; j = j+1) begin 
                    data_out_r[j] <= data_out_dw[j];
                end
            end
            L_AVGPL : begin 
                for (j = 0; j < 16; j = j+1) begin 
                    data_out_r[j] <= data_out_avgle[j];
                end
            end
            default : begin 
                for (j = 0; j < 16; j = j+1) begin 
                    data_out_r[j] <= fifo_rd_data_part;
                end
            end
        endcase
    end
end

assign data_vld_for_w = fifo_rd_en_r & ~fifo_empty;

always @ (posedge clk_calc or negedge rst_n) begin
    if(!rst_n) begin
        data_out_vld <= 1'b0;
    end else if (fifo_rd_slice_finish_r == 1'b1) begin 
        data_out_vld <= 1'b0;
    end else begin
        data_out_vld <= fifo_rd_en & fifo_rd_calc_en; 
    end 
end

generate
    for (i = 0; i < 16; i = i + 1) begin : data_out_comb
        assign data_out[BITWIDTH*16*i+BITWIDTH*16-1:BITWIDTH*16*i] = data_out_r[i];
    end
endgenerate



endmodule