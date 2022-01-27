module bias_ctrl
    #(parameter BANDWIDTH=512,
                BITWIDTH=32)(
    input                        clk_data,
    input                        rst_n,

    input                        bias_in_vld,
    input [BANDWIDTH-1:0]        bias_in,

    output reg                   fifo_wr_en,
    output reg [BITWIDTH*16-1:0] fifo_wr_data
);
//-------------------------------------------
// regs & wires & parameters
//-------------------------------------------
parameter CONV_MODE  = 2'd0;
parameter DW_MODE    = 2'd1;
parameter PW_MODE    = 2'd2;
parameter AVGPL_MODE = 2'd3;

parameter L_CONV  = 3'd0;
parameter L_DW    = 3'd1;
parameter L_PW    = 3'd2;
parameter L_AVGPL = 3'd3;
parameter L_PW_SC = 3'd4;

reg  [10:0]                     c_size_o_quarter_1;
reg  [10:0]                     c_size_i_quarter_1;
reg  [10:0]                     ci_div_16_1;
reg  [10:0]                     co_div_16_1;
wire [2:0]                      layer_type[53:0];

wire [10:0]                     c_size_i[54:0];

wire                            s_value[53:0];
wire                            conv_all_done;
wire                            dw_all_done;
wire                            pw_all_done;
wire                            avgle_all_done;
reg [7:0]                       pic_size;

reg [2:0]                       layer_type_cur;
reg [6:0]                       layer_num_cur;

always @ (posedge clk_data or negedge rst_n) begin 
	if (!rst_n) begin 
		layer_type_cur <= 3'd0;
	end else begin 
		layer_type_cur <= layer_type[layer_num_cur] == L_PW_SC ? L_PW : layer_type[layer_num_cur];
	end
end

always @ (posedge clk_data or negedge rst_n) begin 
	if (!rst_n) begin 
		layer_num_cur <= 7'd0;
	end else begin 
		case (layer_type_cur) 
			L_CONV : begin 
				if (conv_all_done == 1'b1) begin 
					layer_num_cur <= layer_num_cur + 1'b1;
				end	else begin 
					layer_num_cur <= layer_num_cur;
				end
			end 
			L_DW : begin 
				if (dw_all_done == 1'b1) begin 
					layer_num_cur <= layer_num_cur + 1'b1;
				end	else begin 
					layer_num_cur <= layer_num_cur;
				end
			end 
            L_PW : begin 
                if (pw_all_done == 1'b1 && layer_num_cur == 7'd53) begin 
                    layer_num_cur <= 7'd0;
                end else if (pw_all_done == 1'b1) begin
                    layer_num_cur <= layer_num_cur + 1'b1;
                end else begin 
                    layer_num_cur <= layer_num_cur;
                end
            end
            L_AVGPL : begin 
                if (avgle_all_done == 1'b1) begin 
                    layer_num_cur <= layer_num_cur + 1'b1;
                end else begin 
                    layer_num_cur <= layer_num_cur;
                end
            end
			default : begin 
				layer_num_cur <= layer_num_cur;
			end
		endcase
	end
end

reg [6:0]                       conv_bias_cnt_l1;
reg [6:0]                       conv_bias_cnt_l2;

always @ (posedge clk_data or negedge rst_n)
begin
    if(!rst_n) begin
        conv_bias_cnt_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && bias_in_vld == 1'b1 && conv_bias_cnt_l1 == 11'd1) begin
        conv_bias_cnt_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && bias_in_vld == 1'b1) begin
        conv_bias_cnt_l1 <= conv_bias_cnt_l1 + 1'b1;
    end
end

wire                            conv_temp_rd_vld;
assign conv_temp_rd_vld = layer_type_cur == L_CONV && bias_in_vld == 1'b1;

// always @ (posedge clk_data or negedge rst_n)
// begin
    // if(!rst_n) begin
        // conv_bias_cnt_l2 <= 11'd0;
    // end
    // else if (layer_type_cur == L_CONV && bias_in_vld == 1'b1 && conv_bias_cnt_l1 == 11'd3 && conv_bias_cnt_l2 == 11'd1) begin
        // conv_bias_cnt_l2 <= 11'd0;
    // end
    // else if (layer_type_cur == L_CONV && bias_in_vld == 1'b1 && conv_bias_cnt_l1 == 11'd3) begin
        // conv_bias_cnt_l2 <= conv_bias_cnt_l2 + 1'b1;
    // end
// end

assign conv_all_done = layer_type_cur == L_CONV && bias_in_vld == 1'b1 && conv_bias_cnt_l1 == 11'd1;

reg [6:0]                      dw_bias_cnt_l1;
reg [6:0]                      dw_bias_cnt_l2;

always @ (posedge clk_data or negedge rst_n)
begin
    if(!rst_n) begin
        dw_bias_cnt_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_DW && bias_in_vld == 1'b1 && dw_bias_cnt_l1 == co_div_16_1) begin
        dw_bias_cnt_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_DW && bias_in_vld == 1'b1) begin
        dw_bias_cnt_l1 <= dw_bias_cnt_l1 + 1'b1;
    end
end

wire                            dw_temp_rd_vld;
assign dw_temp_rd_vld = layer_type_cur == L_DW && bias_in_vld == 1'b1;

assign dw_all_done = layer_type_cur == L_DW && bias_in_vld == 1'b1 && dw_bias_cnt_l1 == co_div_16_1;

reg [10:0]                      pw_bias_cnt_l1;
reg [10:0]                      pw_bias_cnt_l2;
always @ (posedge clk_data or negedge rst_n)
begin
    if(!rst_n) begin
        pw_bias_cnt_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_PW && bias_in_vld == 1'b1 && pw_bias_cnt_l1 == co_div_16_1) begin
        pw_bias_cnt_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_PW && bias_in_vld == 1'b1) begin
        pw_bias_cnt_l1 <= pw_bias_cnt_l1 + 1'b1;
    end
end

wire                            pw_temp_rd_vld;
assign pw_temp_rd_vld = layer_type_cur == L_PW && bias_in_vld == 1'b1;
assign pw_all_done = layer_type_cur == L_PW && bias_in_vld == 1'b1 && pw_bias_cnt_l1 == co_div_16_1;

reg [10:0]                      avgle_bias_cnt;
reg                             avgle_temp_rd_vld;

assign avgle_all_done = layer_type_cur == L_AVGPL && bias_in_vld == 1'b1;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        avgle_temp_rd_vld <= 1'b0;
    end else if (layer_type_cur == L_AVGPL && bias_in_vld == 1'b1) begin 
        avgle_temp_rd_vld <= 1'b1;
    end else begin 
        avgle_temp_rd_vld <= 1'b0;
    end
end

// reg [BITWIDTH*16-1:0]                     bias_temp;
// integer j;

// always @ (posedge clk_data or negedge rst_n) begin 
    // if (!rst_n) begin 
        // bias_temp <= 0; 
    // end else if (layer_type_cur == L_CONV && bias_in_vld == 1'b1) begin 
        // bias_temp <= {bias_in, bias_temp[383:128]};
    // end else if (layer_type_cur == L_PW && bias_in_vld == 1'b1) begin 
        // bias_temp <= {bias_in, bias_temp[383:128]};
    // end else begin 
        // bias_temp <= bias_temp;
    // end
// end

reg                             fifo_wr_en_p;
reg [BITWIDTH*16-1:0]           w_wr_data_p;
reg [2:0]                       w_wr_type;
    
always @ (posedge clk_data or negedge rst_n)
begin
    if(!rst_n) begin
        w_wr_type <= 3'd0;
    end else if (conv_temp_rd_vld == 1'b1) begin
        w_wr_type <= 3'd1;
    end else if (dw_temp_rd_vld == 1'b1) begin
        w_wr_type <= 3'd2;
    end else if (pw_temp_rd_vld == 1'b1) begin
        w_wr_type <= 3'd3;
    end else if (avgle_temp_rd_vld == 1'b1) begin 
        w_wr_type <= 3'd4;
    end else begin
        w_wr_type <= 3'd0;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_wr_en_p <= 1'b0;
    end else begin 
        fifo_wr_en_p <= conv_temp_rd_vld | dw_temp_rd_vld | pw_temp_rd_vld | avgle_temp_rd_vld;
    end
end

always @ (posedge clk_data or negedge rst_n) begin
    if (!rst_n) begin 
        w_wr_data_p <= 0;
    end else if (conv_temp_rd_vld | dw_temp_rd_vld | pw_temp_rd_vld) begin 
        w_wr_data_p <= bias_in;
    end else begin 
        w_wr_data_p <= w_wr_data_p;
    end
end

always @ (posedge clk_data or negedge rst_n)
begin
    if(!rst_n) begin
        fifo_wr_data <= 512'b0;
    end else begin 
        case (w_wr_type)
            3'd0 : fifo_wr_data <= fifo_wr_data;
            3'd1 : fifo_wr_data <= w_wr_data_p;
            3'd2 : fifo_wr_data <= w_wr_data_p;
            3'd3 : fifo_wr_data <= w_wr_data_p; 
            3'd4 : fifo_wr_data <= 512'd0;
        default : begin 
            fifo_wr_data <= fifo_wr_data;
        end
        endcase
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_wr_en <= 1'b0;
    end else begin 
        fifo_wr_en <= fifo_wr_en_p;
    end
end

//layer type
assign layer_type[0]  = L_CONV;  assign layer_type[3] = L_PW;     assign layer_type[6] = L_PW;
assign layer_type[1]  = L_DW;    assign layer_type[4] = L_DW;     assign layer_type[7] = L_DW;
assign layer_type[2]  = L_PW;    assign layer_type[5] = L_PW;     assign layer_type[8] = L_PW_SC;

assign layer_type[9 ] = L_PW;    assign layer_type[12] = L_PW;    assign layer_type[15] = L_PW;
assign layer_type[10] = L_DW;    assign layer_type[13] = L_DW;    assign layer_type[16] = L_DW;
assign layer_type[11] = L_PW;    assign layer_type[14] = L_PW_SC; assign layer_type[17] = L_PW_SC;

assign layer_type[18] = L_PW;    assign layer_type[21] = L_PW;    assign layer_type[24] = L_PW;
assign layer_type[19] = L_DW;    assign layer_type[22] = L_DW;    assign layer_type[25] = L_DW;
assign layer_type[20] = L_PW;    assign layer_type[23] = L_PW_SC; assign layer_type[26] = L_PW_SC;

assign layer_type[27] = L_PW;    assign layer_type[30] = L_PW;    assign layer_type[33] = L_PW;
assign layer_type[28] = L_DW;    assign layer_type[31] = L_DW;    assign layer_type[34] = L_DW;
assign layer_type[29] = L_PW_SC; assign layer_type[32] = L_PW;    assign layer_type[35] = L_PW_SC;

assign layer_type[36] = L_PW;    assign layer_type[39] = L_PW;    assign layer_type[42] = L_PW;
assign layer_type[37] = L_DW;    assign layer_type[40] = L_DW;    assign layer_type[43] = L_DW;
assign layer_type[38] = L_PW_SC; assign layer_type[41] = L_PW;    assign layer_type[44] = L_PW_SC;

assign layer_type[45] = L_PW;    assign layer_type[48] = L_PW;    assign layer_type[51] = L_PW;
assign layer_type[46] = L_DW;    assign layer_type[49] = L_DW;    assign layer_type[52] = L_AVGPL;
assign layer_type[47] = L_PW_SC; assign layer_type[50] = L_PW;    assign layer_type[53] = L_PW;

reg [7:0]           pic_size_next;

always @ (posedge clk_data or negedge rst_n) begin
    if (!rst_n) begin
        pic_size <= 8'd128;
    end else begin
        pic_size <= pic_size_next;
    end
end

always @ (*) begin
    case (layer_num_cur)
        0 : 
        begin
            pic_size_next = 8'd128;
        end
        1,2,3,4 : 
        begin
            pic_size_next = 8'd64;
        end
        5,6,7,8,9,10 :
        begin
            pic_size_next = 8'd32;
        end
        11,12,13,14,15,16,17,18,19 :
        begin
            pic_size_next = 8'd16;
        end
        20,21,22,23,24,25,26,27,28,
        29,30,31,32,33,34,35,36,37,
        38,39,40 :
        begin
            pic_size_next = 8'd8;
        end
        41,42,43,44,45,46,47,48,49,
        50,51,52 : 
        begin
            pic_size_next = 8'd4;
        end
        default : begin
            pic_size_next = 8'd1;
        end
    endcase
end

always @ (posedge clk_data or negedge rst_n) begin
    if (!rst_n) begin
        c_size_i_quarter_1 <= 11'd0;
        c_size_o_quarter_1 <= 11'd0; 
    end else begin
        c_size_i_quarter_1 <= c_size_i[layer_num_cur][10:2] - 1'b1;
        c_size_o_quarter_1 <= c_size_i[layer_num_cur + 1][10:2] - 1'b1;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        co_div_16_1 <= 11'b0;
    end else if (c_size_i[layer_num_cur+1][3:0] == 4'd0) begin 
        co_div_16_1 <= {4'b0, c_size_i[layer_num_cur+1][10:4]} - 1'b1;
    end else begin 
        co_div_16_1 <= {4'b0, c_size_i[layer_num_cur+1][10:4]};
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        ci_div_16_1 <= 11'b0;
    end else if (c_size_i[layer_num_cur][3:0] == 4'd0) begin 
        ci_div_16_1 <= {4'b0, c_size_i[layer_num_cur][10:4]} - 1'b1;
    end else begin 
        ci_div_16_1 <= {4'b0, c_size_i[layer_num_cur][10:4]};
    end
end

//c_size_i
assign c_size_i[ 0] = 11'd3   ; assign c_size_i[ 1] = 11'd32  ; assign c_size_i[ 2] = 11'd32  ;
assign c_size_i[ 3] = 11'd16  ; assign c_size_i[ 4] = 11'd96  ; assign c_size_i[ 5] = 11'd96  ;
assign c_size_i[ 6] = 11'd24  ; assign c_size_i[ 7] = 11'd144 ; assign c_size_i[ 8] = 11'd144 ;
assign c_size_i[ 9] = 11'd24  ; assign c_size_i[10] = 11'd144 ; assign c_size_i[11] = 11'd144 ;
assign c_size_i[12] = 11'd32  ; assign c_size_i[13] = 11'd192 ; assign c_size_i[14] = 11'd192 ;
assign c_size_i[15] = 11'd32  ; assign c_size_i[16] = 11'd192 ; assign c_size_i[17] = 11'd192 ;
assign c_size_i[18] = 11'd32  ; assign c_size_i[19] = 11'd192 ; assign c_size_i[20] = 11'd192 ;
assign c_size_i[21] = 11'd64  ; assign c_size_i[22] = 11'd384 ; assign c_size_i[23] = 11'd384 ;
assign c_size_i[24] = 11'd64  ; assign c_size_i[25] = 11'd384 ; assign c_size_i[26] = 11'd384 ;
assign c_size_i[27] = 11'd64  ; assign c_size_i[28] = 11'd384 ; assign c_size_i[29] = 11'd384 ;
assign c_size_i[30] = 11'd64  ; assign c_size_i[31] = 11'd384 ; assign c_size_i[32] = 11'd384 ;
assign c_size_i[33] = 11'd96  ; assign c_size_i[34] = 11'd576 ; assign c_size_i[35] = 11'd576 ;
assign c_size_i[36] = 11'd96  ; assign c_size_i[37] = 11'd576 ; assign c_size_i[38] = 11'd576 ;
assign c_size_i[39] = 11'd96  ; assign c_size_i[40] = 11'd576 ; assign c_size_i[41] = 11'd576 ;
assign c_size_i[42] = 11'd160 ; assign c_size_i[43] = 11'd960 ; assign c_size_i[44] = 11'd960 ;
assign c_size_i[45] = 11'd160 ; assign c_size_i[46] = 11'd960 ; assign c_size_i[47] = 11'd960 ;
assign c_size_i[48] = 11'd160 ; assign c_size_i[49] = 11'd960 ; assign c_size_i[50] = 11'd960 ;
assign c_size_i[51] = 11'd320 ; assign c_size_i[52] = 11'd1280; assign c_size_i[53] = 11'd1280;
assign c_size_i[54] = 11'd1008;

//stride
assign s_value[ 0] = 1'd1; assign s_value[ 1] = 1'd0; assign s_value[ 2] = 1'd0;
assign s_value[ 3] = 1'd0; assign s_value[ 4] = 1'd1; assign s_value[ 5] = 1'd0;
assign s_value[ 6] = 1'd0; assign s_value[ 7] = 1'd0; assign s_value[ 8] = 1'd0;
assign s_value[ 9] = 1'd0; assign s_value[10] = 1'd1; assign s_value[11] = 1'd0;
assign s_value[12] = 1'd0; assign s_value[13] = 1'd0; assign s_value[14] = 1'd0;
assign s_value[15] = 1'd0; assign s_value[16] = 1'd0; assign s_value[17] = 1'd0;
assign s_value[18] = 1'd0; assign s_value[19] = 1'd1; assign s_value[20] = 1'd0;
assign s_value[21] = 1'd0; assign s_value[22] = 1'd0; assign s_value[23] = 1'd0;
assign s_value[24] = 1'd0; assign s_value[25] = 1'd0; assign s_value[26] = 1'd0;
assign s_value[27] = 1'd0; assign s_value[28] = 1'd0; assign s_value[29] = 1'd0;
assign s_value[30] = 1'd0; assign s_value[31] = 1'd0; assign s_value[32] = 1'd0;
assign s_value[33] = 1'd0; assign s_value[34] = 1'd0; assign s_value[35] = 1'd0;
assign s_value[36] = 1'd0; assign s_value[37] = 1'd0; assign s_value[38] = 1'd0;
assign s_value[39] = 1'd0; assign s_value[40] = 1'd1; assign s_value[41] = 1'd0;
assign s_value[42] = 1'd0; assign s_value[43] = 1'd0; assign s_value[44] = 1'd0;
assign s_value[45] = 1'd0; assign s_value[46] = 1'd0; assign s_value[47] = 1'd0;
assign s_value[48] = 1'd0; assign s_value[49] = 1'd0; assign s_value[50] = 1'd0;
assign s_value[51] = 1'd0; assign s_value[52] = 1'd0; assign s_value[53] = 1'd0;


endmodule