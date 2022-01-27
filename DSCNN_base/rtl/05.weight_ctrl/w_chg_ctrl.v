module w_chg_ctrl(
    input                   clk_calc,
    input                   rst_n,
    
    input                   w_read_per_slice_done,
    input                   w_read_per_dw_slice_done,
    input [7:0]             w_read_dw_addr,
    
    input                   w_chg_en,
    input                   w_chg_vld_in,
    
    output [7:0]            w_ram_rd_addr,
    output reg              w_chg_load_done
);

parameter CONV_MODE  = 2'd0;
parameter DW_MODE    = 2'd1;
parameter PW_MODE    = 2'd2;
parameter AVGPL_MODE = 2'd3;

parameter L_CONV  = 3'd0;
parameter L_DW    = 3'd1;
parameter L_PW    = 3'd2;
parameter L_AVGPL = 3'd3;
parameter L_PW_SC = 3'd4;

reg  [7:0]                      pic_size;
reg  [10:0]                     c_size;
reg  [10:0]                     c_size_quarter;
reg  [10:0]                     ci_div_16_1;
reg  [10:0]                     co_div_16_1;
wire [2:0]                      layer_type[53:0];
wire                            w_chg_conv_done;
wire                            w_chg_dw_done;
wire                            w_chg_pw_done;
wire                            w_chg_avgle_done;
wire [10:0]                     c_size_i[54:0];
wire                            s_value[53:0];


reg [7:0]                       w_chg_ctrl_ub; //weight change control upper bound  
reg [7:0]                       w_chg_ctrl_lb; //weight change control lower bound
reg                             w_ram_chg_vld; //weight change control load vld

reg [2:0]                       layer_type_cur;
reg [6:0]                       layer_num_cur;

always @ (posedge clk_calc or negedge rst_n) begin 
	if (!rst_n) begin 
		layer_type_cur <= 7'd0;
	end else begin 
		layer_type_cur <= layer_type[layer_num_cur] == L_PW_SC ? L_PW : layer_type[layer_num_cur];
	end
end

always @ (posedge clk_calc or negedge rst_n) begin 
	if (!rst_n) begin 
		layer_num_cur <= 7'd0;
	end else begin 
		case (layer_type_cur) 
			L_CONV : begin 
				if (w_chg_conv_done == 1'b1) begin 
					layer_num_cur <= layer_num_cur + 1'b1;
				end	else begin 
					layer_num_cur <= layer_num_cur;
				end
			end 
			L_DW : begin 
				if (w_chg_dw_done == 1'b1) begin 
					layer_num_cur <= layer_num_cur + 1'b1;
				end	else begin 
					layer_num_cur <= layer_num_cur;
				end
			end 
            L_PW : begin 
                if (w_chg_pw_done == 1'b1 && layer_num_cur == 7'd53) begin 
                    layer_num_cur <= 7'd0;
                end else if (w_chg_pw_done == 1'b1) begin
                    layer_num_cur <= layer_num_cur + 1'b1;
                end else begin 
                    layer_num_cur <= layer_num_cur;
                end
            end
            L_AVGPL : begin 
                if (w_chg_avgle_done == 1'b1) begin 
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

/*Weight change control for conv2d layer*/
reg [10:0]                      w_chg_conv_cnt;

always @ (posedge clk_calc or negedge rst_n) begin
    if (!rst_n) begin 
        w_chg_conv_cnt <= 11'd0;
    end 
    else if (layer_type_cur == L_CONV && w_chg_conv_cnt == 11'd1 && w_chg_en == 1'b1) begin
        w_chg_conv_cnt <= 11'd0;
    end 
    else if (layer_type_cur == L_CONV && w_chg_en == 1'b1) begin
        w_chg_conv_cnt <= w_chg_conv_cnt + 1'b1;
    end
end

assign w_chg_conv_done = layer_type_cur == L_CONV && w_chg_conv_cnt == 11'd1 && w_chg_en == 1'b1;

/*Weight change control for dw layer*/
reg [10:0]                     w_chg_dw_cnt;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        w_chg_dw_cnt <= 1'b0;
    end else if (layer_type_cur == L_DW && w_chg_dw_cnt == co_div_16_1 && w_chg_en == 1'b1) begin 
        w_chg_dw_cnt <= 1'b0;
    end else if (layer_type_cur == L_DW && w_chg_en == 1'b1) begin
        w_chg_dw_cnt <= w_chg_dw_cnt + 1'b1;
    end else begin 
        w_chg_dw_cnt <= w_chg_dw_cnt;
    end
end

assign w_chg_dw_done = layer_type_cur == L_DW && w_chg_dw_cnt == co_div_16_1 && w_chg_en == 1'b1;

/*Weight change control for pw layer*/
reg [10:0]                      w_chg_pw_cnt;
reg                             pw_ram_w_selec;
always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        w_chg_pw_cnt <= 1'b0;
    end else if (layer_type_cur == L_PW && w_chg_en == 1'b1 && w_chg_pw_cnt == co_div_16_1) begin 
        w_chg_pw_cnt <= 1'b0;
    end else if (layer_type_cur == L_PW && w_chg_en == 1'b1) begin 
        w_chg_pw_cnt <= w_chg_pw_cnt + 1'b1;
    end else begin 
        w_chg_pw_cnt <= w_chg_pw_cnt;
    end
end

assign w_chg_pw_done = layer_type_cur == L_PW && w_chg_pw_cnt == co_div_16_1 && w_chg_en == 1'b1;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        pw_ram_w_selec <= 1'b0;
    end else if (layer_type_cur == L_PW && w_chg_en == 1'b1) begin 
        pw_ram_w_selec <= ~pw_ram_w_selec;
    end
end

assign w_chg_avgle_done = layer_type_cur == L_AVGPL && w_chg_en == 1'b1;

/*Ram read addr selection control for weight change*/
//assign  c_size_i_d8_1 = c_size_i[layer_rd_num_cur][10:3] - 1'b1;

always @ (posedge clk_calc or negedge rst_n) begin
    if (!rst_n) begin
        w_chg_ctrl_ub <= 8'd0;
        w_chg_ctrl_lb <= 8'd0;
    end else if (w_chg_en == 1'b1) begin 
        case (layer_type_cur)
            L_CONV : begin 
                w_chg_ctrl_ub <= w_chg_conv_cnt[0] == 1'b0 ? 8'd2 : 9'd5;
                w_chg_ctrl_lb <= w_chg_conv_cnt[0] == 1'b0 ? 8'd0 : 9'd3;
            end
            L_DW : begin 
                w_chg_ctrl_ub <= 8'd160 + w_chg_dw_cnt[7:0];
                w_chg_ctrl_lb <= 8'd160 + w_chg_dw_cnt[7:0];
            end
            L_PW : begin 
                w_chg_ctrl_ub <= pw_ram_w_selec ? 8'd80 + ci_div_16_1[6:0] : 8'd0 + ci_div_16_1[6:0];
                w_chg_ctrl_lb <= pw_ram_w_selec ? 8'd80 : 8'd0;
            end
            L_AVGPL : begin 
                w_chg_ctrl_ub <= 8'd200;
                w_chg_ctrl_lb <= 8'd200;
            end
            default : begin 
                w_chg_ctrl_ub <= 8'd0;
                w_chg_ctrl_lb <= 8'd0;
            end
        endcase
    end else begin 
        w_chg_ctrl_ub <= w_chg_ctrl_ub;
        w_chg_ctrl_lb <= w_chg_ctrl_lb;
    end
end

/*Load signal for w_chg_ctrl_ub&w_chg_ctrl_lb*/

/*Load signal for w_chg_ctrl_ub&w_chg_ctrl_lb*/
reg [1:0]                       w_ram_chg_vld_state;
reg						        w_ram_chg_vld_reg;

reg [1:0]                       w_read_per_slice_done_r;
wire                            w_read_per_slice_done_s;

reg [4:0]                       w_ram_num;
reg                             w_ram_read_swait;
reg                             w_ram_chg_vld_p;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        w_read_per_slice_done_r <= 2'b0;
    end else begin 
        w_read_per_slice_done_r <= {w_read_per_slice_done_r[0], w_read_per_slice_done};
    end
end

assign w_read_per_slice_done_s = w_read_per_slice_done_r[0] & ~w_read_per_slice_done_r[1];

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        w_ram_num <= 0;
        w_ram_read_swait <= 0;
        w_ram_chg_vld <= 0;
    end else begin 
        case ({w_read_per_slice_done_s, w_chg_en})
            2'b00 : begin 
                w_ram_num <= w_ram_num;
                w_ram_read_swait <= w_ram_read_swait;
                w_ram_chg_vld <= 1'b0;
            end 
            2'b01 : begin 
                w_ram_num <= w_ram_num == 0 ? 0 : w_ram_num - 1'b1;
                w_ram_read_swait <= w_ram_num == 0 ? 1'b1 : 1'b0;
                w_ram_chg_vld <= w_ram_num == 0 ? 1'b0 : 1'b1;
            end 
            2'b10 : begin 
                w_ram_num <= w_ram_read_swait == 1'b1 ? w_ram_num : w_ram_num + 1'b1;
                w_ram_read_swait <= 1'b0;
                w_ram_chg_vld <= w_ram_read_swait == 1'b1 ? 1'b1 : 1'b0;
            end
            2'b11 : begin 
                w_ram_num <= w_ram_num;
                w_ram_read_swait <= 1'b0;
                w_ram_chg_vld <= 1'b1;
            end
        endcase
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        w_ram_chg_vld_state <= 2'd0;
    end else /* if (w_chg_en == 1'b1) begin 
        w_ram_chg_vld_state <= w_ram_chg_vld_state | 2'b01;
    end else if (w_read_per_slice_done == 1'b1) begin 
        w_ram_chg_vld_state <= w_ram_chg_vld_state | 2'b10;
    end else */if (w_ram_chg_vld_reg == 1'b1) begin 
        w_ram_chg_vld_state <= 2'd0;
    end else begin 
        w_ram_chg_vld_state <= w_ram_chg_vld_state | {w_read_per_slice_done, w_chg_en};
    end
end

always @ (*) begin 
    w_ram_chg_vld_reg = w_ram_chg_vld_state == 2'b11;
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin
        // w_ram_chg_vld <= 1'b0;
        w_chg_load_done <= 1'b0;
    end else begin
        // w_ram_chg_vld <= w_ram_chg_vld_p;
        w_chg_load_done <= w_ram_chg_vld;
    end
end

/*Load w_chg_ctrl_ub&w_chg_ctrl_lb*/
reg [7:0]                       w_chg_ctrl_ub_load;                      
reg [7:0]                       w_chg_ctrl_lb_load;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        w_chg_ctrl_ub_load <= 8'd0;
        w_chg_ctrl_lb_load <= 8'd0;
    end else if (w_ram_chg_vld == 1'b1) begin 
        w_chg_ctrl_ub_load <= w_chg_ctrl_ub;
        w_chg_ctrl_lb_load <= w_chg_ctrl_lb;
    end
end

reg [7:0]                      rd_cnt_cur;
always @ (posedge clk_calc or negedge rst_n) begin
    if(!rst_n) begin
        rd_cnt_cur <= 8'd0;
    end else if (w_ram_chg_vld == 1'b1) begin 
        rd_cnt_cur <= w_chg_ctrl_lb;
    end else if (rd_cnt_cur == w_chg_ctrl_ub_load && w_chg_vld_in == 1'b1) begin
        rd_cnt_cur <= w_chg_ctrl_lb_load;
    end else if (w_chg_vld_in == 1'b1) begin
        rd_cnt_cur <= rd_cnt_cur + 1'b1;
    end
end

assign w_ram_rd_addr = rd_cnt_cur;


//layer type
assign layer_type[0]  = L_CONV;  assign layer_type[18] = L_PW;     assign layer_type[36] = L_PW;   
assign layer_type[1]  = L_DW;    assign layer_type[19] = L_DW;     assign layer_type[37] = L_DW;   
assign layer_type[2]  = L_PW;    assign layer_type[20] = L_PW;     assign layer_type[38] = L_PW_SC;

assign layer_type[3] = L_PW;     assign layer_type[21] = L_PW;     assign layer_type[39] = L_PW;
assign layer_type[4] = L_DW;     assign layer_type[22] = L_DW;     assign layer_type[40] = L_DW;
assign layer_type[5] = L_PW;     assign layer_type[23] = L_PW_SC;  assign layer_type[41] = L_PW;

assign layer_type[6] = L_PW;     assign layer_type[24] = L_PW;     assign layer_type[42] = L_PW;
assign layer_type[7] = L_DW;     assign layer_type[25] = L_DW;     assign layer_type[43] = L_DW;
assign layer_type[8] = L_PW_SC;  assign layer_type[26] = L_PW_SC;  assign layer_type[44] = L_PW_SC;

assign layer_type[9 ] = L_PW;    assign layer_type[27] = L_PW;     assign layer_type[45] = L_PW;   
assign layer_type[10] = L_DW;    assign layer_type[28] = L_DW;     assign layer_type[46] = L_DW;   
assign layer_type[11] = L_PW;    assign layer_type[29] = L_PW_SC;  assign layer_type[47] = L_PW_SC;

assign layer_type[12] = L_PW;    assign layer_type[30] = L_PW;     assign layer_type[48] = L_PW;
assign layer_type[13] = L_DW;    assign layer_type[31] = L_DW;     assign layer_type[49] = L_DW;
assign layer_type[14] = L_PW_SC; assign layer_type[32] = L_PW;     assign layer_type[50] = L_PW;

assign layer_type[15] = L_PW;    assign layer_type[33] = L_PW;     assign layer_type[51] = L_PW;
assign layer_type[16] = L_DW;    assign layer_type[34] = L_DW;     assign layer_type[52] = L_AVGPL;
assign layer_type[17] = L_PW_SC; assign layer_type[35] = L_PW_SC;  assign layer_type[53] = L_PW;

reg [7:0]           pic_size_next;

always @ (posedge clk_calc or negedge rst_n) begin
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

always @ (posedge clk_calc) begin 
    c_size <= c_size_i[layer_num_cur];
    c_size_quarter <= c_size_i[layer_num_cur][10:2] - 1'b1;
end

always @ (posedge clk_calc) begin 
    if (c_size_i[layer_num_cur+1][3:0] == 4'd0) begin 
        co_div_16_1 <= {4'b0, c_size_i[layer_num_cur+1][10:4]} - 1'b1;
    end else begin 
        co_div_16_1 <= {4'b0, c_size_i[layer_num_cur+1][10:4]};
    end
end

always @ (posedge clk_calc) begin 
    if (c_size_i[layer_num_cur][3:0] == 4'd0) begin 
        ci_div_16_1 <= {4'b0, c_size_i[layer_num_cur][10:4]} - 1'b1;
    end else begin 
        ci_div_16_1 <= {4'b0, c_size_i[layer_num_cur][10:4]};
    end
end

//c_size_i
assign c_size_i[ 0] = 11'd3   ; assign c_size_i[19] = 11'd192 ; assign c_size_i[37] = 11'd576 ; 
assign c_size_i[ 1] = 11'd32  ; assign c_size_i[20] = 11'd192 ; assign c_size_i[38] = 11'd576 ;
assign c_size_i[ 2] = 11'd32  ; assign c_size_i[21] = 11'd64  ; assign c_size_i[39] = 11'd96  ; 
assign c_size_i[ 3] = 11'd16  ; assign c_size_i[22] = 11'd384 ; assign c_size_i[40] = 11'd576 ; 
assign c_size_i[ 4] = 11'd96  ; assign c_size_i[23] = 11'd384 ; assign c_size_i[41] = 11'd576 ;
assign c_size_i[ 5] = 11'd96  ; assign c_size_i[24] = 11'd64  ; assign c_size_i[42] = 11'd160 ; 
assign c_size_i[ 6] = 11'd24  ; assign c_size_i[25] = 11'd384 ; assign c_size_i[43] = 11'd960 ; 
assign c_size_i[ 7] = 11'd144 ; assign c_size_i[26] = 11'd384 ; assign c_size_i[44] = 11'd960 ;
assign c_size_i[ 8] = 11'd144 ; assign c_size_i[27] = 11'd64  ; assign c_size_i[45] = 11'd160 ; 
assign c_size_i[ 9] = 11'd24  ; assign c_size_i[28] = 11'd384 ; assign c_size_i[46] = 11'd960 ; 
assign c_size_i[10] = 11'd144 ; assign c_size_i[29] = 11'd384 ; assign c_size_i[47] = 11'd960 ;
assign c_size_i[11] = 11'd144 ; assign c_size_i[30] = 11'd64  ; assign c_size_i[48] = 11'd160 ; 
assign c_size_i[12] = 11'd32  ; assign c_size_i[31] = 11'd384 ; assign c_size_i[49] = 11'd960 ; 
assign c_size_i[13] = 11'd192 ; assign c_size_i[32] = 11'd384 ; assign c_size_i[50] = 11'd960 ;
assign c_size_i[14] = 11'd192 ; assign c_size_i[33] = 11'd96  ; assign c_size_i[51] = 11'd320 ; 
assign c_size_i[15] = 11'd32  ; assign c_size_i[34] = 11'd576 ; assign c_size_i[52] = 11'd1280; 
assign c_size_i[16] = 11'd192 ; assign c_size_i[35] = 11'd576 ; assign c_size_i[53] = 11'd1280;
assign c_size_i[17] = 11'd192 ; assign c_size_i[36] = 11'd96  ; assign c_size_i[54] = 11'd1008;
assign c_size_i[18] = 11'd32  ; 

//stride
assign s_value[ 0] = 1'd1; assign s_value[18] = 1'd0; assign s_value[36] = 1'd0;
assign s_value[ 1] = 1'd0; assign s_value[19] = 1'd1; assign s_value[37] = 1'd0;
assign s_value[ 2] = 1'd0; assign s_value[20] = 1'd0; assign s_value[38] = 1'd0;
assign s_value[ 3] = 1'd0; assign s_value[21] = 1'd0; assign s_value[39] = 1'd0;
assign s_value[ 4] = 1'd1; assign s_value[22] = 1'd0; assign s_value[40] = 1'd1;
assign s_value[ 5] = 1'd0; assign s_value[23] = 1'd0; assign s_value[41] = 1'd0;
assign s_value[ 6] = 1'd0; assign s_value[24] = 1'd0; assign s_value[42] = 1'd0;
assign s_value[ 7] = 1'd0; assign s_value[25] = 1'd0; assign s_value[43] = 1'd0;
assign s_value[ 8] = 1'd0; assign s_value[26] = 1'd0; assign s_value[44] = 1'd0;
assign s_value[ 9] = 1'd0; assign s_value[27] = 1'd0; assign s_value[45] = 1'd0;
assign s_value[10] = 1'd1; assign s_value[28] = 1'd0; assign s_value[46] = 1'd0;
assign s_value[11] = 1'd0; assign s_value[29] = 1'd0; assign s_value[47] = 1'd0;
assign s_value[12] = 1'd0; assign s_value[30] = 1'd0; assign s_value[48] = 1'd0;
assign s_value[13] = 1'd0; assign s_value[31] = 1'd0; assign s_value[49] = 1'd0;
assign s_value[14] = 1'd0; assign s_value[32] = 1'd0; assign s_value[50] = 1'd0;
assign s_value[15] = 1'd0; assign s_value[33] = 1'd0; assign s_value[51] = 1'd0;
assign s_value[16] = 1'd0; assign s_value[34] = 1'd0; assign s_value[52] = 1'd0;
assign s_value[17] = 1'd0; assign s_value[35] = 1'd0; assign s_value[53] = 1'd0;

endmodule 
