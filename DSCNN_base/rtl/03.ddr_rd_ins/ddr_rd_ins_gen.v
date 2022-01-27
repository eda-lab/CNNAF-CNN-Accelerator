module ddr_rd_ins_gen(
    input                       clk_calc            ,
    input                       rst_n               ,
    
    input                       last_slice_vld      ,
    input                       layer_acc_op_done   ,  
    input                       slice_acc_op_done   ,
    input                       ins_gen_vld         ,
    input                       net_map_finish      ,
    
    output reg [20:0]           cache_size_out      ,
    output reg                  ddr_rd_ins_vld      ,
    output     [33:0]           ddr_rd_ins          
);
//-------------------------------------------
// wires & parameters for net frame
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

parameter ST_W_RD    = 2'd0;
parameter ST_SC_RD   = 2'd1;
parameter ST_BIAS_RD = 2'd2;
parameter ST_DATA_RD = 2'd3;

parameter zero_base = 26'd200_0000;

reg  [ 7:0]                     pic_size;
reg  [ 7:0]                     pic_size_next;
reg  [15:0]                     psize2;
reg  [15:0]                     pnextsize2;
reg  [ 6:0]                     co_div_16;
reg  [14:0]                     pic_co_div_16;
reg  [ 6:0]                     pic_size_all_1;
reg  [ 6:0]                     pic_size_all_dw;
reg  [ 6:0]                     pic_size_half_1;
reg  [ 6:0]                     pic_size_quarter_1;
reg  [ 6:0]                     ci_quarter_1;
reg  [ 6:0]                     ci_div_8_1;
reg  [ 6:0]                     ci_div_8_sc;
reg  [ 6:0]                     pw_cnt1_sc;
reg  [ 6:0]                     pw_cnt2_num;
reg  [ 6:0]						pw_bl_t;
reg  [ 6:0]                     ci_div_16;
reg  [ 6:0]                     ci_div_16_1;
reg  [ 6:0]                     co_div_16_1;
reg  [25:0]                     w_base_addr;
reg  [25:0]                     b_base_addr;
reg  [25:0]                     f_base_addr;
reg  [25:0]                     sc_base_addr;
reg  [10:0]                     dw_cnt1_load;
reg  [20:0]                     cache_deep_cur;
reg  [20:0]                     cache_deep_next;

wire [2:0]                      layer_type[53:0];
wire [10:0]                     c_size_i[54:0];
wire                            s_value[53:0];
wire [25:0]                     data_base[53:0];
wire [25:0]                     w_base[53:0];
wire [25:0]                     bias_base[53:0];
wire [ 6:0]						bl_size_tab[53:0];
wire [ 6:0]						cnt2_num[53:0];


//----------------------------------------------//
// wires & parameters for layer & read state    //
//----------------------------------------------//

reg [25:0]           			ddr_rd_addr_out;
reg [ 6:0]           			bl_size;
reg [ 6:0]           			bl_size_out;


reg [1:0]                       st_rd_cur;
wire                            w_op_done_each_conv;
wire                            bias_op_done_each_conv;
wire                            w_op_done_each_dw;
wire                            bias_op_done_each_dw;
wire                            w_op_done_each_pw;
wire                            bias_op_done_each_pw;
wire                            w_op_done_avgle;
wire                            bias_op_done_avgle;
wire                            data_op_done_each_conv;
wire                            data_op_done_each_dw;
wire                            data_op_done_each_pw;
wire                            conv_all_done;
wire                            dw_all_done;
wire                            pw_all_done;
wire                            avgle_all_done;
//-------------------------------------------
// layer_num_cur
//-------------------------------------------
//wire [6:0]                      layer_type_cur;
//assign layer_type_cur = layer_type[layer_num_cur];
reg [2:0]                       layer_type_cur;
reg [2:0]                       layer_type_next;
reg                             layer_sc_vld;
reg                             layer_wait_en;
reg [6:0]                       layer_num_cur;

always @ (posedge clk_calc or negedge rst_n) begin 
	if (!rst_n) begin 
		layer_type_cur  <= 3'b0;
        layer_type_next <= 3'b0;
        layer_sc_vld    <= 1'b0;
        layer_wait_en   <= 1'b0;
	end else begin 
		layer_type_cur  <= layer_type[layer_num_cur] == L_PW_SC ? L_PW : layer_type[layer_num_cur];
        layer_type_next <= layer_num_cur == 53 ? L_CONV : (layer_type[layer_num_cur] == L_PW_SC ? L_PW : layer_type[layer_num_cur]);
        layer_sc_vld    <= layer_type[layer_num_cur] == L_PW_SC ? 1'b1 : 1'b0;
        layer_wait_en   <= (layer_type[layer_num_cur] == L_DW || layer_type[layer_num_cur] == L_CONV) ? 1'b0 : 1'b1;
	end
end

always @ (posedge clk_calc or negedge rst_n) begin 
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

reg                             layer_connect_wait; 
reg                             slice_connect_wait;
reg                             acc_connect_wait;
reg [1:0]                       net_map_finish_r;
reg                             each_layer_rd_op_done;
reg                             each_layer_rd_op_done_st;
reg [63:0]                      layer_acc_op_done_r;
reg [1:0]                       layer_rd_state;
reg                             each_layer_rd_op_done_w;
reg [1:0]                       each_layer_rd_op_done_w_r;
reg [1:0]                       each_layer_rd_op_done_r;
reg                             each_slice_rd_op_done;
reg                             rd_ins_gen_wait;
wire                            layer_wait_vld_hs;

//layer read done and calculate done signals
always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin
        each_layer_rd_op_done <= 1'b0;
    end else if (conv_all_done == 1'b1 || dw_all_done == 1'b1 || pw_all_done == 1'b1 || avgle_all_done == 1'b1) begin 
        each_layer_rd_op_done <= 1'b1;
    end else begin 
        each_layer_rd_op_done <= 1'b0;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        each_layer_rd_op_done_st <= 1'b0;
    end else if (each_layer_rd_op_done == 1'b1 && layer_num_cur > 0) begin 
        each_layer_rd_op_done_st <= 1'b1;
    end else if (each_layer_rd_op_done_st == 1'b1 && (bias_op_done_each_dw == 1'b1 || bias_op_done_each_pw == 1'b1 || bias_op_done_avgle == 1'b1)) begin 
        each_layer_rd_op_done_st <= 1'b0;
    end else begin 
        each_layer_rd_op_done_st <= each_layer_rd_op_done_st;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        each_layer_rd_op_done_w <= 1'b0;
    end else begin 
        each_layer_rd_op_done_w <= each_layer_rd_op_done_st == 1'b1 && (w_op_done_each_dw == 1'b1 || w_op_done_each_pw == 1'b1 || w_op_done_avgle == 1'b1);
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        each_layer_rd_op_done_r <= 2'b0;
    end else begin 
        each_layer_rd_op_done_r <= {each_layer_rd_op_done_r[0], each_layer_rd_op_done};
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        each_layer_rd_op_done_w_r <= 2'b0;
    end else begin 
        each_layer_rd_op_done_w_r <= {each_layer_rd_op_done_w_r[0], each_layer_rd_op_done_w};
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        net_map_finish_r <= 2'b0;
    end else begin 
        net_map_finish_r <= {net_map_finish_r[0], net_map_finish};
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        each_slice_rd_op_done <= 1'b0;
    end else if (data_op_done_each_conv == 1'b1 || data_op_done_each_dw == 1'b1 || data_op_done_each_pw == 1'b1) begin 
        each_slice_rd_op_done <= 1'b1;
    end else begin 
        each_slice_rd_op_done <= 1'b0;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        layer_acc_op_done_r <= 64'b0;
    end else begin 
        layer_acc_op_done_r <= {layer_acc_op_done_r[62:0], layer_acc_op_done};
    end
end

//wait signals
reg [11:0]                      new_layer_rd_vld_num;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        new_layer_rd_vld_num <= 11'b0;
    end else if (layer_acc_op_done_r[26] == 1'b1) begin 
        new_layer_rd_vld_num <= 11'b0;
    end else begin 
        case ({last_slice_vld, layer_wait_vld_hs})
            2'b00 : new_layer_rd_vld_num <= new_layer_rd_vld_num;
            2'b01 : new_layer_rd_vld_num <= new_layer_rd_vld_num - 1'b1;
            2'b10 : new_layer_rd_vld_num <= new_layer_rd_vld_num + 1'b1;
            2'b11 : new_layer_rd_vld_num <= new_layer_rd_vld_num;
        endcase
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        acc_connect_wait <= 1'b0;
    end else if (pw_all_done == 1'b1 && layer_num_cur == 7'd53) begin 
        acc_connect_wait <= 1'b1;
    end else if (net_map_finish_r[1] == 1'b1) begin 
        acc_connect_wait <= 1'b0;
    end /* else if (acc_connect_wait == 1'b1) begin 
        acc_connect_wait <= 1'b0;
    end  */else begin 
        acc_connect_wait <= acc_connect_wait;
    end
end

always @ (posedge clk_calc or negedge layer_wait_en) begin 
    if (!layer_wait_en) begin 
        layer_rd_state <= 2'b0;
    end else if (layer_rd_state == 2'b11 || net_map_finish == 1'b1) begin 
        layer_rd_state <= 2'b0;
    end else begin 
        layer_rd_state <= layer_rd_state | {layer_acc_op_done_r[26], each_layer_rd_op_done_w};
    end
end 

always @ (posedge clk_calc or negedge layer_wait_en) begin
    if (!layer_wait_en) begin
        layer_connect_wait <= 1'b0;
    end else if (each_layer_rd_op_done_w == 1'b1 && layer_rd_state == 2'b0 && layer_connect_wait == 1'b0) begin 
        layer_connect_wait <= 1'b1;
    end else if (layer_acc_op_done_r[26] == 1'b1 && layer_connect_wait == 1'b1) begin
        layer_connect_wait <= 1'b0;
    end else begin 
        layer_connect_wait <= layer_connect_wait;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        slice_connect_wait <= 1'b0;
    end else if (each_slice_rd_op_done == 1'b1 && slice_connect_wait == 1'b0) begin 
        slice_connect_wait <= 1'b1;
    end else if (slice_acc_op_done == 1'b1 && slice_connect_wait == 1'b1) begin 
        slice_connect_wait <= 1'b0;
    end else begin 
        slice_connect_wait <= slice_connect_wait;
    end
end

// assign rd_ins_gen_wait = (layer_type_cur == L_DW && pic_size == 8'd4) ? slice_connect_wait : layer_connect_wait;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        rd_ins_gen_wait <= 1'b0;
    end /* else if (layer_type_cur == L_DW && pic_size == 8'd4) begin 
        rd_ins_gen_wait <= slice_connect_wait;
    end  */else begin 
        rd_ins_gen_wait <= layer_connect_wait | acc_connect_wait;
        // rd_ins_gen_wait <= layer_connect_wait;
    end
end
 

//-------------------------------------------
// handshake
//-------------------------------------------
reg                             ddr_handshake;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        ddr_handshake <= 1'b0;
    end else if (conv_all_done || dw_all_done || pw_all_done || avgle_all_done || each_layer_rd_op_done || 
                 each_layer_rd_op_done_w_r || each_layer_rd_op_done_w) begin 
        ddr_handshake <= 1'b0;
    // end else if (ins_gen_vld == 1'b1 && (rd_ins_gen_wait == 1'b0 || (rd_ins_gen_wait && new_layer_rd_vld_num > 0))) begin 
    end else if (ins_gen_vld == 1'b1 && rd_ins_gen_wait == 1'b0) begin 
        ddr_handshake <= 1'b1;
    end else begin 
        ddr_handshake <= 1'b0;
    end
end 

assign layer_wait_vld_hs = ins_gen_vld == 1'b1 & rd_ins_gen_wait == 1'b1 & new_layer_rd_vld_num > 0;

reg [3:0] 						ddr_rd_ins_vld_r;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        ddr_rd_ins_vld_r <= 4'b0;
		ddr_rd_ins_vld	 <= 1'b0;
	end else begin 
		ddr_rd_ins_vld_r[0]	<= ddr_handshake;
		ddr_rd_ins_vld_r[1] <= ddr_rd_ins_vld_r[0];
		ddr_rd_ins_vld_r[2] <= ddr_rd_ins_vld_r[1];
		ddr_rd_ins_vld_r[3] <= ddr_rd_ins_vld_r[2];
		ddr_rd_ins_vld		<= ddr_rd_ins_vld_r[3];
	end
end


reg [6:0]                       w_cnt_conv_l1;      //以BL=3
reg [6:0]                       w_cnt_conv_l2;
reg [6:0]                       w_cnt_conv_l3;
always @ (posedge clk_calc or negedge rst_n) begin
    if(!rst_n) begin
        w_cnt_conv_l1 <= 7'd0;
    end else if (layer_type_cur == L_CONV && st_rd_cur == ST_W_RD && ddr_handshake == 1'b1 && w_cnt_conv_l1 == 7'd15) begin
        w_cnt_conv_l1 <= 7'd0;
    end else if (layer_type_cur == L_CONV && st_rd_cur == ST_W_RD && ddr_handshake == 1'b1) begin
        w_cnt_conv_l1 <= w_cnt_conv_l1 + 1'b1;
    end else begin 
        w_cnt_conv_l1 <= w_cnt_conv_l1;
    end
end

// wire                            w_op_done_each_conv;
assign w_op_done_each_conv = layer_type_cur == L_CONV && st_rd_cur == ST_W_RD && ddr_handshake == 1'b1 && w_cnt_conv_l1 == 7'd15;

always @ (posedge clk_calc or negedge rst_n) begin
    if(!rst_n) begin
        w_cnt_conv_l2 <= 7'd0;
    end else if (layer_type_cur == L_CONV && st_rd_cur == ST_W_RD && ddr_handshake == 1'b1 && w_cnt_conv_l1 == 7'd15 && w_cnt_conv_l2 == 7'd1) begin
        w_cnt_conv_l2 <= 7'd0;
    end else if (layer_type_cur == L_CONV && st_rd_cur == ST_W_RD && ddr_handshake == 1'b1 && w_cnt_conv_l1 == 7'd15) begin
        w_cnt_conv_l2 <= w_cnt_conv_l2 + 1'b1;
    end else begin 
        w_cnt_conv_l2 <= w_cnt_conv_l2;
    end
end

reg [6:0]                      bias_cnt_conv_l1;
reg [6:0]                      bias_cnt_conv_l2;
always @ (posedge clk_calc or negedge rst_n) begin
    if(!rst_n) begin
        bias_cnt_conv_l1 <= 7'd0;
    end else if (layer_type_cur == L_CONV && st_rd_cur == ST_BIAS_RD && ddr_handshake == 1'b1 && bias_cnt_conv_l1 == 7'd1) begin
        bias_cnt_conv_l1 <= 7'd0;
    end else if (layer_type_cur == L_CONV && st_rd_cur == ST_BIAS_RD && ddr_handshake == 1'b1) begin
        bias_cnt_conv_l1 <= bias_cnt_conv_l1 + 1'b1;
    end else begin 
        bias_cnt_conv_l1 <= bias_cnt_conv_l1;
    end
end

// wire                            bias_op_done_each_conv;
assign bias_op_done_each_conv = layer_type_cur == L_CONV && st_rd_cur == ST_BIAS_RD && ddr_handshake == 1'b1;

// always @ (posedge clk_calc or negedge rst_n)
// begin
    // if(!rst_n) begin
        // bias_cnt_conv_l2 <= 11'd0;
    // end
    // else if (bias_cnt_conv_l2 == 11'd1 && bias_cnt_conv_l1 == 11'd3 && ddr_handshake == 1'b1) begin
        // bias_cnt_conv_l2 <= 11'd0;
    // end
    // else if (bias_cnt_conv_l1 == 11'd3 && ddr_handshake == 1'b1) begin
        // bias_cnt_conv_l2 <= bias_cnt_conv_l2 + 1'b1;
    // end
// end

// reg [6:0]                      data_cnt_conv_l1;
reg [6:0]                      data_cnt_conv_l2;
reg [6:0]                      data_cnt_conv_l3;
reg [6:0]                      data_cnt_conv_l4;

// always @ (posedge clk_calc or negedge rst_n) begin
    // if(!rst_n) begin
        // data_cnt_conv_l1 <= 7'd0;
    // end else if (layer_type_cur == L_CONV && 
                 // st_rd_cur == ST_DATA_RD && 
                 // ddr_handshake == 1'b1 && 
                 // data_cnt_conv_l1 == pic_size_half_1) begin
        // data_cnt_conv_l1 <= 7'd0;
    // end else if (layer_type_cur == L_CONV && 
                 // st_rd_cur == ST_DATA_RD &&
                 // ddr_handshake == 1'b1) begin
        // data_cnt_conv_l1 <= data_cnt_conv_l1 + 1'b1;
    // end else begin 
        // data_cnt_conv_l1 <= data_cnt_conv_l1;
    // end
// end

always @ (posedge clk_calc or negedge rst_n) begin
    if(!rst_n) begin
        data_cnt_conv_l2 <= 7'd0;
    end else if (layer_type_cur == L_CONV && 
                 st_rd_cur == ST_DATA_RD && 
                 ddr_handshake == 1'b1 && 
                 data_cnt_conv_l2 == pic_size_half_1) begin
        data_cnt_conv_l2 <= 7'd0;
    end else if (layer_type_cur == L_CONV && 
                 st_rd_cur == ST_DATA_RD && 
                 ddr_handshake == 1'b1) begin
        data_cnt_conv_l2 <= data_cnt_conv_l2 + 1'b1;
    end else begin 
        data_cnt_conv_l2 <= data_cnt_conv_l2;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin
    if(!rst_n) begin
        data_cnt_conv_l3 <= 7'd0;
    end else if (layer_type_cur == L_CONV && 
    st_rd_cur == ST_DATA_RD && ddr_handshake == 1'b1 && 
                 data_cnt_conv_l2 == pic_size_half_1 &&
                 data_cnt_conv_l3 == pic_size_half_1) begin
        data_cnt_conv_l3 <= 7'd0;
    end else if (layer_type_cur == L_CONV && 
                 st_rd_cur == ST_DATA_RD && 
                 ddr_handshake == 1'b1 && 
                 data_cnt_conv_l2 == pic_size_half_1) begin
        data_cnt_conv_l3 <= data_cnt_conv_l3 + 1'b1;
    end else begin 
        data_cnt_conv_l3 <= data_cnt_conv_l3;
    end
end

// wire                            data_op_done_each_conv;
assign data_op_done_each_conv = layer_type_cur == L_CONV && 
                                st_rd_cur == ST_DATA_RD && 
                                ddr_handshake == 1'b1 && 
                                data_cnt_conv_l2 == pic_size_half_1 &&
                                data_cnt_conv_l3 == pic_size_half_1;

always @ (posedge clk_calc or negedge rst_n) begin
    if(!rst_n) begin
        data_cnt_conv_l4 <= 7'd0;
    end else if (layer_type_cur == L_CONV && 
                 st_rd_cur == ST_DATA_RD && 
                 ddr_handshake == 1'b1 && 
                 data_cnt_conv_l2 == pic_size_half_1 && 
                 data_cnt_conv_l3 == pic_size_half_1 && 
                 data_cnt_conv_l4 == 7'd1) begin
        data_cnt_conv_l4 <= 7'd0;
    end else if (layer_type_cur == L_CONV && 
                 st_rd_cur == ST_DATA_RD && 
                 ddr_handshake == 1'b1 && 
                 data_cnt_conv_l2 == pic_size_half_1 && 
                 data_cnt_conv_l3 == pic_size_half_1) begin
        data_cnt_conv_l4 <= data_cnt_conv_l4 + 1'b1;
    end else begin 
        data_cnt_conv_l4 <= data_cnt_conv_l4;
    end
end

// wire                            conv_all_done;
assign conv_all_done = layer_type_cur == L_CONV && 
                       st_rd_cur == ST_DATA_RD && 
                       ddr_handshake == 1'b1 && 
                       data_cnt_conv_l2 == pic_size_half_1 && 
                       data_cnt_conv_l3 == pic_size_half_1 && 
                       data_cnt_conv_l4 == 7'd1;

reg [6:0]                      w_cnt_dw_l1;
reg [6:0]                      w_cnt_dw_l2;
reg [6:0]                      w_cnt_dw_l3;
always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        w_cnt_dw_l1 <= 7'd0;
    end else if (st_rd_cur == ST_W_RD && w_cnt_dw_l1 == ci_div_16_1 && ddr_handshake == 1'b1) begin 
        w_cnt_dw_l1 <= 7'd0;
    end else if (layer_type_cur == L_DW && st_rd_cur == ST_W_RD && ddr_handshake == 1'b1) begin 
        w_cnt_dw_l1 <= w_cnt_dw_l1 + 1'b1;
    end else begin 
        w_cnt_dw_l1 <= w_cnt_dw_l1;
    end
end

assign w_op_done_each_dw = layer_type_cur == L_DW && st_rd_cur == ST_W_RD && ddr_handshake == 1'b1;

reg [6:0]                      bias_cnt_dw_l1;
always @ (posedge clk_calc or negedge rst_n) begin
    if(!rst_n) begin
        bias_cnt_dw_l1 <= 7'd0;
    end else if (st_rd_cur == ST_BIAS_RD && bias_cnt_dw_l1 == ci_div_16_1 && ddr_handshake == 1'b1) begin
        bias_cnt_dw_l1 <= 7'd0;
    end else if (layer_type_cur == L_DW && st_rd_cur == ST_BIAS_RD && ddr_handshake == 1'b1) begin
        bias_cnt_dw_l1 <= bias_cnt_dw_l1 + 1'b1;
    end else begin 
        bias_cnt_dw_l1 <= bias_cnt_dw_l1;
    end
end


assign bias_op_done_each_dw = layer_type_cur == L_DW && st_rd_cur == ST_BIAS_RD && ddr_handshake == 1'b1;

wire                            data_cnt_dw_l1_vld;
reg [6:0]                       data_cnt_dw_l1;
reg [6:0]                       data_cnt_dw_l2;
reg [6:0]                       data_cnt_dw_l3;
reg [6:0]                       data_cnt_dw_l4;
reg [6:0]                       data_cnt_dw_l5;

always @ (posedge clk_calc) begin
    if (!rst_n) begin 
        data_cnt_dw_l1 <= 7'd1;
    end else if (layer_num_cur == 7'd42 && pw_all_done == 1'b1) begin 
        data_cnt_dw_l1 <= 7'd2;
    end else if (layer_num_cur == 7'd49 && dw_all_done == 1'b1) begin
        data_cnt_dw_l1 <= 7'd1;
    end else if (data_cnt_dw_l1 == 7'd0 && ddr_handshake == 1'b1 && pic_size == 8'd4) begin 
        data_cnt_dw_l1 <= 7'd2;
    end else if (data_cnt_dw_l1 == 7'd0 && ddr_handshake == 1'b1 && pic_size != 8'd4) begin
        data_cnt_dw_l1 <= 7'd1;
    end else if (layer_type_cur == L_DW     && 
                 st_rd_cur == ST_DATA_RD    && 
                 ddr_handshake == 1'b1      && 
                 data_cnt_dw_l4 == 7'd0) begin
        data_cnt_dw_l1 <= data_cnt_dw_l1 - 1'b1;
    end else if (layer_type_cur == L_DW     && 
                 st_rd_cur == ST_DATA_RD    && 
                 ddr_handshake == 1'b1      && 
                 data_cnt_dw_l4 == pic_size_quarter_1) begin
        data_cnt_dw_l1 <= data_cnt_dw_l1 - 1'b1;
    end else begin 
        data_cnt_dw_l1 <= data_cnt_dw_l1;
    end
end

assign data_cnt_dw_l1_vld = ~(data_cnt_dw_l4 == 7'd0 | data_cnt_dw_l4 == pic_size_quarter_1) | data_cnt_dw_l1 == 7'd0;

always @ (posedge clk_calc or negedge rst_n) begin
    if(!rst_n) begin
        data_cnt_dw_l3 <= 7'd0;
    end else if (data_cnt_dw_l3 == pic_size_all_dw && 
                 // data_cnt_dw_l2 == 11'd3              &&
                 data_cnt_dw_l1_vld == 1'b1          &&
                 ddr_handshake == 1'b1) begin
        data_cnt_dw_l3 <= 7'd0;
    end else if (//data_cnt_dw_l2 == 11'd3              && 
                 data_cnt_dw_l1_vld == 1'b1          &&
                 ddr_handshake == 1'b1) begin
        data_cnt_dw_l3 <= data_cnt_dw_l3 + 1'b1;
    end else begin 
        data_cnt_dw_l3 <= data_cnt_dw_l3;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin
    if(!rst_n) begin
        data_cnt_dw_l4 <= 7'd0;
    end else if (data_cnt_dw_l4 == pic_size_quarter_1 && 
                 data_cnt_dw_l3 == pic_size_all_dw     &&
                 //data_cnt_dw_l2 == 7'd3              && 
                 data_cnt_dw_l1_vld == 1'b1          &&
                 ddr_handshake == 1'b1) begin
        data_cnt_dw_l4 <= 7'd0;
    end else if (data_cnt_dw_l3 == pic_size_all_dw     && 
                 //data_cnt_dw_l2 == 1'b3              &&
                 data_cnt_dw_l1_vld == 7'd1          &&
                 ddr_handshake == 1'b1) begin
        data_cnt_dw_l4 <= data_cnt_dw_l4 + 1'b1;
    end else begin 
        data_cnt_dw_l4 <= data_cnt_dw_l4;
    end
end

assign data_op_done_each_dw = data_cnt_dw_l4 == pic_size_quarter_1 && 
                              data_cnt_dw_l3 == pic_size_all_dw     && 
                              //data_cnt_dw_l2 == 11'd3              && 
                              data_cnt_dw_l1_vld == 1'b1          &&
                              ddr_handshake == 1'b1;

always @ (posedge clk_calc or negedge rst_n) begin
    if(!rst_n) begin
        data_cnt_dw_l5 <= 7'd0;
    end else if (data_cnt_dw_l5 == ci_div_16_1        && 
                 data_cnt_dw_l4 == pic_size_quarter_1 && 
                 data_cnt_dw_l3 == pic_size_all_dw     &&
                 //data_cnt_dw_l2 == 11'd3              && 
                 data_cnt_dw_l1_vld == 7'd1          &&
                 ddr_handshake == 1'b1) begin
        data_cnt_dw_l5 <= 7'd0;
    end else if (data_cnt_dw_l4 == pic_size_quarter_1 && 
                 data_cnt_dw_l3 == pic_size_all_dw     && 
                 //data_cnt_dw_l2 == 11'd3              &&
                 data_cnt_dw_l1_vld == 7'd1          &&           
                 ddr_handshake == 1'b1) begin
        data_cnt_dw_l5 <= data_cnt_dw_l5 + 1'b1;
    end else begin 
        data_cnt_dw_l5 <= data_cnt_dw_l5;
    end
end 

assign dw_all_done = data_cnt_dw_l5 == ci_div_16_1        & 
                     data_cnt_dw_l4 == pic_size_quarter_1 & 
                     data_cnt_dw_l3 == pic_size_all_dw     & 
                     //data_cnt_dw_l2 == 11'd3              && 
                     data_cnt_dw_l1_vld == 7'd1          &
                     ddr_handshake == 1'b1;

reg [16:0]                     w_pw_en_cnt;
reg [6:0]                      w_cnt_pw_l1;
reg [6:0]                      w_cnt_pw_l2;
reg [6:0]                      w_cnt_pw_l3;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        w_pw_en_cnt <= 17'b0;
    end else if (pw_all_done == 1'b1) begin 
        w_pw_en_cnt <= 17'b0;
    end else if (layer_type_cur == L_PW && st_rd_cur == ST_W_RD && ddr_handshake == 1'b1) begin 
        w_pw_en_cnt <= w_pw_en_cnt + 1'b1;
    end else begin 
        w_pw_en_cnt <= w_pw_en_cnt;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        w_cnt_pw_l1 <= 7'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_W_RD &&
                 ddr_handshake == 1'b1 &&
                 w_cnt_pw_l1 == 7'd15) begin 
        w_cnt_pw_l1 <= 7'b0;            
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_W_RD &&
                 ddr_handshake == 1'b1) begin 
        w_cnt_pw_l1 <= w_cnt_pw_l1 + 1'b1;
    end else begin 
        w_cnt_pw_l1 <= w_cnt_pw_l1;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        w_cnt_pw_l2 <= 7'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_W_RD &&
                 ddr_handshake == 1'b1 &&
                 w_cnt_pw_l1 == 7'd15 &&
                 w_cnt_pw_l2 == co_div_16_1) begin 
        w_cnt_pw_l2 <= 7'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_W_RD &&
                 ddr_handshake == 1'b1 &&
                 w_cnt_pw_l1 == 7'd15) begin 
        w_cnt_pw_l2 <= w_cnt_pw_l2 + 1'b1;
    end else begin 
        w_cnt_pw_l2 <= w_cnt_pw_l2;
    end
end

// always @ (posedge clk_calc or negedge rst_n) begin 
    // if (!rst_n) begin 
        // w_cnt_pw_l3 <= 11'b0;
    // end else if (layer_type_cur == L_PW &&
                 // st_rd_cur == ST_W_RD &&
                 // ddr_handshake == 1'b1 &&
                 // w_cnt_pw_l1 == ci_div_8_1 &&
                 // w_cnt_pw_l2 == 11'd15 &&
                 // w_cnt_pw_l3 == co_div_16_1) begin 
        // w_cnt_pw_l3 <= 11'b0;
    // end else if (layer_type_cur == L_PW &&
                 // st_rd_cur == ST_W_RD &&
                 // ddr_handshake == 1'b1 &&
                 // w_cnt_pw_l1 == ci_div_8_1 &&
                 // w_cnt_pw_l2 == 11'd15) begin 
        // w_cnt_pw_l3 <= w_cnt_pw_l3 + 1'b1;
    // end else begin 
        // w_cnt_pw_l3 <= w_cnt_pw_l3;
    // end
// end

assign w_op_done_each_pw = layer_type_cur == L_PW &
                           st_rd_cur == ST_W_RD &
                           ddr_handshake == 1'b1 &
                           w_cnt_pw_l1 == 7'd15;

reg [6:0]                   bias_cnt_pw_l1;
reg [6:0]                   bias_cnt_pw_l2;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        bias_cnt_pw_l1 <= 7'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_BIAS_RD &&
                 ddr_handshake == 1'b1 && 
                 bias_cnt_pw_l1 == co_div_16_1) begin 
        bias_cnt_pw_l1 <= 7'b0;             
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_BIAS_RD &&
                 ddr_handshake == 1'b1) begin 
        bias_cnt_pw_l1 <= bias_cnt_pw_l1 + 1'b1;
    end else begin 
        bias_cnt_pw_l1 <= bias_cnt_pw_l1;
    end         
end

assign bias_op_done_each_pw = layer_type_cur == L_PW &&
                              st_rd_cur == ST_BIAS_RD && 
                              ddr_handshake == 1'b1;
                              

reg [13:0]                  data_pw_en_cnt;
reg [6:0]                   data_cnt_pw_l1;
reg [6:0]                   data_cnt_pw_l2;
reg [6:0]                   data_cnt_pw_l3;
reg [6:0]                   data_cnt_pw_l4;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        data_pw_en_cnt <= 14'd0;
    end else if (data_op_done_each_pw == 1'b1) begin 
        data_pw_en_cnt <= 14'd0;
    end else if (layer_type_cur == L_PW && 
                 layer_sc_vld == 1'b0 &&
                 st_rd_cur == ST_DATA_RD && ddr_handshake == 1'b1) begin 
        data_pw_en_cnt <= data_pw_en_cnt + 1'b1;
    end else if (layer_type_cur == L_PW && 
                 layer_sc_vld == 1'b1 &&
                 data_cnt_pw_l1 == 7'd1 &&
                 st_rd_cur == ST_DATA_RD && ddr_handshake == 1'b1)
        data_pw_en_cnt <= data_pw_en_cnt + 1'b1;
    else begin 
        data_pw_en_cnt <= data_pw_en_cnt;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        data_cnt_pw_l1 <= 7'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_DATA_RD &&
                 ddr_handshake == 1'b1 &&
                 data_cnt_pw_l1 == pw_cnt1_sc) begin 
        data_cnt_pw_l1 <= 7'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_DATA_RD &&
                 ddr_handshake == 1'b1) begin 
        data_cnt_pw_l1 <= data_cnt_pw_l1 + 1'b1;
    end else begin 
        data_cnt_pw_l1 <= data_cnt_pw_l1;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        data_cnt_pw_l2 <= 7'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_DATA_RD &&
                 ddr_handshake == 1'b1 &&
                 data_cnt_pw_l1 == pw_cnt1_sc &&
                 data_cnt_pw_l2 == pw_cnt2_num) begin 
        data_cnt_pw_l2 <= 7'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_DATA_RD &&
                 ddr_handshake == 1'b1 &&
                 data_cnt_pw_l1 == pw_cnt1_sc) begin 
        data_cnt_pw_l2 <= data_cnt_pw_l2 + 1'b1;
    end else begin 
        data_cnt_pw_l2 <= data_cnt_pw_l2;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        data_cnt_pw_l3 <= 7'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_DATA_RD &&
                 ddr_handshake == 1'b1 &&
                 data_cnt_pw_l1 == pw_cnt1_sc &&
                 data_cnt_pw_l2 == pw_cnt2_num &&
                 data_cnt_pw_l3 == pic_size_all_1) begin 
        data_cnt_pw_l3 <= 7'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_DATA_RD &&
                 ddr_handshake == 1'b1 &&
                 data_cnt_pw_l1 == pw_cnt1_sc &&
                 data_cnt_pw_l2 == pw_cnt2_num) begin 
        data_cnt_pw_l3 <= data_cnt_pw_l3 + 1'b1;
    end else begin 
        data_cnt_pw_l3 <= data_cnt_pw_l3;
    end
end

assign data_op_done_each_pw = layer_type_cur == L_PW &
                              st_rd_cur == ST_DATA_RD &
                              ddr_handshake == 1'b1 &
                              data_cnt_pw_l1 == pw_cnt1_sc &
                              data_cnt_pw_l2 == pw_cnt2_num &
                              data_cnt_pw_l3 == pic_size_all_1;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        data_cnt_pw_l4 <= 7'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_DATA_RD &&
                 ddr_handshake == 1'b1 &&
                 data_cnt_pw_l1 == pw_cnt1_sc &&
                 data_cnt_pw_l2 == pw_cnt2_num &&
                 data_cnt_pw_l3 == pic_size_all_1 &&
                 data_cnt_pw_l4 == co_div_16_1) begin
        data_cnt_pw_l4 <= 7'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_DATA_RD &&
                 ddr_handshake == 1'b1 &&
                 data_cnt_pw_l1 == pw_cnt1_sc &&
                 data_cnt_pw_l2 == pw_cnt2_num &&
                 data_cnt_pw_l3 == pic_size_all_1) begin 
        data_cnt_pw_l4 <= data_cnt_pw_l4 + 1'b1;
    end else begin 
        data_cnt_pw_l4 <= data_cnt_pw_l4;
    end
end 

assign pw_all_done = layer_type_cur == L_PW &
                     st_rd_cur == ST_DATA_RD &
                     ddr_handshake == 1'b1 &
                     data_cnt_pw_l1 == pw_cnt1_sc &
                     data_cnt_pw_l2 == pw_cnt2_num &
                     data_cnt_pw_l3 == pic_size_all_1 &
                     data_cnt_pw_l4 == co_div_16_1;

reg [6:0]                      cnt_avgle;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        cnt_avgle <= 7'b0;
    end else if (layer_type_cur == L_AVGPL &&
                 ddr_handshake == 1'b1 &&
                 cnt_avgle == 7'd81) begin 
        cnt_avgle <= 7'b0;
    end else if (layer_type_cur == L_AVGPL &&
                 ddr_handshake == 1'b1) begin 
        cnt_avgle <= cnt_avgle + 1'b1;
    end
end             

assign w_op_done_avgle = layer_type_cur == L_AVGPL   &
                         ddr_handshake == 1'b1       &
                         cnt_avgle == 7'd0           ;

assign bias_op_done_avgle = layer_type_cur == L_AVGPL   &
                            ddr_handshake == 1'b1       &
                            cnt_avgle == 7'd1           ;

assign avgle_all_done = layer_type_cur == L_AVGPL   &
                        ddr_handshake == 1'b1       &
                        cnt_avgle == 7'd81          ;

//-------------------------------------------
// read state 
//-------------------------------------------
// parameter ST_W_RD    = 2'd0;
// parameter ST_SC_RD   = 2'd1;
// parameter ST_BIAS_RD = 2'd2;
// parameter ST_DATA_RD = 2'd3;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        st_rd_cur <= 2'd0;
    end else begin 
        case (layer_type_cur)
            L_CONV : begin 
                if (w_op_done_each_conv == 1'b1) begin 
                    st_rd_cur <= ST_BIAS_RD;
                end else if (bias_op_done_each_conv == 1'b1) begin 
                    st_rd_cur <= ST_DATA_RD;
                end else if (data_op_done_each_conv == 1'b1) begin 
                    st_rd_cur <= ST_W_RD;
                end else begin 
                    st_rd_cur <= st_rd_cur;
                end
            end
            L_DW : begin 
                if (w_op_done_each_dw == 1'b1) begin 
                    st_rd_cur <= ST_BIAS_RD;
                end else if (bias_op_done_each_dw == 1'b1) begin 
                    st_rd_cur <= ST_DATA_RD;
                end else if (data_op_done_each_dw == 1'b1) begin 
                    st_rd_cur <= ST_W_RD;
                end else begin 
                    st_rd_cur <= st_rd_cur;
                end
            end
            L_PW : begin 
                if (w_op_done_each_pw == 1'b1) begin 
                    st_rd_cur <= ST_BIAS_RD;
                end else if (bias_op_done_each_pw == 1'b1) begin 
                    st_rd_cur <= ST_DATA_RD;
                end else if (data_op_done_each_pw == 1'b1) begin 
                    st_rd_cur <= ST_W_RD;
                end else begin 
                    st_rd_cur <= st_rd_cur;
                end
            end
            default : begin 
                st_rd_cur <= st_rd_cur;
            end
        endcase
    end
end

//-------------------------------------------
// ddr read addr generate
//-------------------------------------------
wire [25:0]						rd_conv_w_addr;
wire [25:0]						rd_conv_b_addr;
wire [25:0]						rd_conv_f_addr;

rd_conv_w_addr_gen rd_conv_w_addr_gen_inst0(
	/*input				*/.clk   			(clk_calc           ),
	                
	/*input [25:0]		*/.conv_w_base		(w_base_addr        ),
	/*input [6:0]		*/.conv_w_cnt_l1	(w_cnt_conv_l1      ),
	/*input [6:0]		*/.conv_w_cnt_l2	(w_cnt_conv_l2      ),
	                
	/*output reg [25:0]	*/.conv_w_addr		(rd_conv_w_addr     )
);

rd_conv_b_addr_gen rd_conv_b_addr_gen_inst0(
	/*input				*/.clk   			(clk_calc           ),
	               
	/*input [25:0]		*/.conv_b_base		(b_base_addr        ),
	/*input [6:0]		*/.conv_b_cnt_l1	(bias_cnt_conv_l1   ),
	                 
	/*output reg [25:0]	*/.conv_b_addr		(rd_conv_b_addr     )
);

rd_conv_f_addr_gen rd_conv_f_addr_gen_inst0(
	/*input				*/.clk  			(clk_calc           ),
	            
	/*input [25:0]		*/.conv_f_base		(f_base_addr        ),
	// /*input [ 6:0]		*/.conv_f_cnt_l1	(data_cnt_conv_l1   ),
	/*input [ 6:0]		*/.conv_f_cnt_l2	(data_cnt_conv_l2   ),
	/*input [ 6:0]		*/.conv_f_cnt_l3	(data_cnt_conv_l3   ),
	                
	/*output reg [25:0]	*/.conv_f_addr		(rd_conv_f_addr     )
);

wire [25:0]						rd_dw_w_addr;
wire [25:0]						rd_dw_b_addr;
wire [25:0]						rd_dw_f_addr;               

rd_dw_w_addr_gen rd_dw_w_addr_gen_inst0(
    /*input             */.clk              (clk_calc           ),

    /*input [25:0]      */.dw_w_base        (w_base_addr        ),
    /*input [ 6:0]      */.dw_w_cnt_l1      (w_cnt_dw_l1        ),

    /*output reg [25:0] */.dw_w_addr        (rd_dw_w_addr       )
);

rd_dw_b_addr_gen rd_dw_b_addr_gen_inst0(
    /*input             */.clk              (clk_calc           ),
                                            
    /*input [25:0]      */.dw_b_base        (b_base_addr        ),
    /*input [ 6:0]      */.dw_b_cnt_l1      (bias_cnt_dw_l1     ),
                                            
    /*output reg [25:0] */.dw_b_addr        (rd_dw_b_addr       )
);

rd_dw_f_addr_gen rd_dw_f_addr_gen_inst0(
    /*input             */.clk              (clk_calc           ),
        
    /*input [25:0]      */.dw_f_base        (f_base_addr        ),
    /*input [7:0]       */.pic_size         (pic_size           ),
    /*input [15:0]      */.pic_size_square  (psize2             ),
    
    /*input [ 6:0]      */.dw_f_cnt_l1      (data_cnt_dw_l1     ),
    /*input [ 6:0]        .dw_f_cnt_l2      (data_cnt_dw_l2     ),
    /*input [ 6:0]      */.dw_f_cnt_l3      (data_cnt_dw_l3     ),
    /*input [ 6:0]      */.dw_f_cnt_l4      (data_cnt_dw_l4     ),
    /*input [ 6:0]      */.dw_f_cnt_l5      (data_cnt_dw_l5     ),
    
    /*output reg [25:0] */.dw_f_addr        (rd_dw_f_addr       )
);

wire [25:0]						rd_pw_w_addr;
wire [25:0]						rd_pw_b_addr;
wire [25:0]						rd_pw_f_addr;      

rd_pw_w_addr_gen rd_pw_w_addr_gen_inst0(
    /*input             */.clk              (clk_calc           ),
                                            
    /*input [25:0]      */.pw_w_base        (w_base_addr        ),
    /*input [16:0]      */.w_pw_en_cnt      (w_pw_en_cnt        ),
    /*input [6:0]       */.pw_bl            (ci_div_16          ),
                                            
    /*output reg [25:0] */.pw_w_addr        (rd_pw_w_addr       )
);
    
rd_pw_b_addr_gen rd_pw_b_addr_gen_inst0(
    /*input             */.clk              (clk_calc           ),
                                            
    /*input [25:0]      */.pw_b_base        (b_base_addr        ),
    /*input [ 6:0]      */.pw_b_cnt_l1      (bias_cnt_pw_l1     ),
                                            
    /*output reg [25:0] */.pw_b_addr        (rd_pw_b_addr       )
);

rd_pw_f_addr_gen rd_pw_f_addr_gen_inst0(
    /*input             */.clk              (clk_calc            ),
    
    /*input             */.sc_vld           (layer_sc_vld        ),
    /*input [25:0]      */.pw_f_base        (f_base_addr         ),
    /*input [25:0]      */.sc_base          (sc_base_addr        ),
    /*input [ 6:0]      */.bl_size          (pw_bl_t             ),
    /*input [ 6:0]      */.co_div16         (co_div_16           ),
    /*input [14:0]      */.pic_co_div16     (pic_co_div_16       ),
    
    /*input [13:0]      */.data_pw_en_cnt   (data_pw_en_cnt      ),
    /*input [ 6:0]      */.pw_f_cnt_l1      (data_cnt_pw_l1      ),
    /*input [ 6:0]      */.pw_f_cnt_l2      (data_cnt_pw_l2      ),
    /*input [ 6:0]      */.pw_f_cnt_l3      (data_cnt_pw_l3      ),
    /*input [ 6:0]      */.pw_f_cnt_l4      (data_cnt_pw_l4      ),
    
    /*output reg [25:0] */.pw_f_addr        (rd_pw_f_addr        )
);

wire [25:0]                     avgle_addr;

rd_avgle_addr_gen rd_avgle_addr_gen_inst0(
    /*input             */.clk              (clk_calc            ),
                                            
    /*input [27:0]      */.w_base_addr      (w_base_addr         ),
    /*input [27:0]      */.b_base_addr      (b_base_addr         ),
    /*input [27:0]      */.f_base_addr      (f_base_addr         ),
    /*input             */.avgle_cnt        ({4'b0,cnt_avgle}    ),

    /*output reg [27:0] */.rd_avgle_addr    (avgle_addr          )
);
//-------------------------------------------
// ddr generate mode
//-------------------------------------------
reg [3:0]						addr_gen_mode;
reg [3:0]						addr_gen_mode_flow[2:0];

always @ (posedge clk_calc or negedge rst_n) begin 
	if (!rst_n) begin 
		addr_gen_mode <= 4'd0;
	end else if (ddr_handshake == 1'b1) begin
		case (layer_type_cur)
			L_CONV : begin 
				case (st_rd_cur)
					ST_W_RD    : addr_gen_mode <= 4'd1;
					ST_BIAS_RD : addr_gen_mode <= 4'd2;
					ST_DATA_RD : addr_gen_mode <= 4'd3;
				default : addr_gen_mode <= 4'd0;
				endcase
			end
			L_DW : begin 
				case (st_rd_cur)
					ST_W_RD    : addr_gen_mode <= 4'd4;
					ST_BIAS_RD : addr_gen_mode <= 4'd5;
					ST_DATA_RD : addr_gen_mode <= 4'd6;
				default : addr_gen_mode <= 4'd0;					
				endcase 
			end
			L_PW : begin 
				case (st_rd_cur)
					ST_W_RD    : addr_gen_mode <= 4'd7;
					ST_BIAS_RD : addr_gen_mode <= 4'd8;
					ST_DATA_RD : addr_gen_mode <= 4'd9;
				default : addr_gen_mode <= 4'd0;					
				endcase 
			end
			L_AVGPL : begin 
				addr_gen_mode <= 4'd10;			
			end
			default : begin 
				addr_gen_mode <= 4'd0;
			end
		endcase
	end
end

integer j;
always @ (posedge clk_calc or negedge rst_n) begin 
	if (!rst_n) begin 
		for (j = 0; j < 3; j = j + 1) begin 
			addr_gen_mode_flow[j] <= 4'd0;
		end
	end else begin 
		for (j = 0; j < 3; j = j + 1) begin 
			if (j == 0) begin 
				addr_gen_mode_flow[0] <= addr_gen_mode;
			end else begin 
				addr_gen_mode_flow[j] <= addr_gen_mode_flow[j-1];
			end
		end
	end
end

always @ (posedge clk_calc  or negedge rst_n) begin 
	if (!rst_n) begin 
		ddr_rd_addr_out <= 28'd0;
	end else begin 
		case (addr_gen_mode_flow[2])
			4'd1 : ddr_rd_addr_out <= rd_conv_w_addr;
			4'd2 : ddr_rd_addr_out <= rd_conv_b_addr;
			4'd3 : ddr_rd_addr_out <= rd_conv_f_addr;
            4'd4 : ddr_rd_addr_out <= rd_dw_w_addr;
            4'd5 : ddr_rd_addr_out <= rd_dw_b_addr;
            4'd6 : ddr_rd_addr_out <= rd_dw_f_addr;
            4'd7 : ddr_rd_addr_out <= rd_pw_w_addr;
            4'd8 : ddr_rd_addr_out <= rd_pw_b_addr;
            4'd9 : ddr_rd_addr_out <= rd_pw_f_addr;
            4'd10: ddr_rd_addr_out <= avgle_addr;
		default : ddr_rd_addr_out <= ddr_rd_addr_out;
		endcase
	end
end

//-------------------------------------------
// bl ctrl  
//-------------------------------------------
reg [6:0]                       conv_w_bl;
reg [6:0]                       conv_b_bl;
reg [6:0]                       conv_f_bl;
reg [6:0]                       dw_w_bl;
reg [6:0]                       dw_b_bl;
reg [6:0]                       dw_f_bl;
reg [6:0]                       pw_w_bl;
reg [6:0]                       pw_b_bl;
reg [6:0]                       pw_f_bl;
reg [6:0]                       avgle_bl;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        conv_w_bl <= 7'd0;
        conv_b_bl <= 7'd0;
        conv_f_bl <= 7'd0;
        dw_w_bl   <= 7'd0;
        dw_b_bl   <= 7'd0;
        pw_w_bl   <= 7'd0;
        pw_b_bl   <= 7'd0;
        avgle_bl  <= 7'd0;
    end else begin 
        conv_w_bl <= 7'd3;
        conv_b_bl <= 7'd1;
        conv_f_bl <= 7'd3;    
        dw_w_bl   <= 7'd9;
        dw_b_bl   <= 7'd1;
        pw_w_bl   <= ci_div_16;
        pw_b_bl   <= 7'd1;
        avgle_bl  <= cnt_avgle > 7'd1 ? 7'd16 : 7'd1;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        dw_f_bl <= 7'd0;
    end else if (pic_size == 8'd4 && data_cnt_dw_l1 == 7'd2) begin 
        dw_f_bl <= 7'd1;
    end else if (pic_size == 8'd4 && data_cnt_dw_l1 == 7'd1) begin 
        dw_f_bl <= 7'd4;
    end else if (pic_size == 8'd4 && data_cnt_dw_l1 == 7'd0) begin 
        dw_f_bl <= 7'd1;
    end
    else if (data_cnt_dw_l4 == 7'd0 && data_cnt_dw_l1 == 7'd1) begin
        dw_f_bl <= 7'd1;
    end else if (data_cnt_dw_l4 == pic_size_quarter_1 && data_cnt_dw_l1 == 7'd0) begin
        dw_f_bl <= 7'd1;
    end else if (data_cnt_dw_l4 == 7'd0 && data_cnt_dw_l1 == 7'd0)begin
        dw_f_bl <= 7'd5;
    end else if (data_cnt_dw_l4 == pic_size_quarter_1 && data_cnt_dw_l1 == 7'd1) begin
        dw_f_bl <= 7'd5;
    end else if (data_cnt_dw_l4 > 7'b0 && data_cnt_dw_l4 < pic_size_quarter_1) begin
        dw_f_bl <= 7'd6;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        pw_f_bl <= 7'b0;
    end else if (layer_sc_vld == 1'b1 && data_cnt_pw_l1 == 7'd0) begin 
        pw_f_bl <= 7'd1;
    end else begin 
		pw_f_bl <= pw_bl_t;
    end
end

reg [6:0]                       bl_size_p;
always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        bl_size_p <= 7'd0;
    end else begin 
        case (addr_gen_mode)
            4'd1 : bl_size_p <= conv_w_bl;
            4'd2 : bl_size_p <= conv_b_bl;
            4'd3 : bl_size_p <= conv_f_bl;
            4'd4 : bl_size_p <= dw_w_bl;
            4'd5 : bl_size_p <= dw_b_bl;
            4'd6 : bl_size_p <= dw_f_bl;
            4'd7 : bl_size_p <= pw_w_bl;
            4'd8 : bl_size_p <= pw_b_bl;
            4'd9 : bl_size_p <= pw_f_bl;
            4'd10: bl_size_p <= avgle_bl;
        default : begin 
            bl_size_p <= 7'd0;
        end
        endcase
    end
end

reg [6:0]						bl_size_r[1:0];
always @ (posedge clk_calc or negedge rst_n) begin 
	if (!rst_n) begin 
		bl_size_r[0] <= 7'd0;
		bl_size_r[1] <= 7'd0;
		bl_size_out  <= 7'd0;
	end else begin 
		bl_size_r[0] <= bl_size_p;
		bl_size_r[1] <= bl_size_r[0];
		bl_size_out  <= bl_size_r[1];
	end
end

reg [3:0]                       calc_rd_finish;
reg                             calc_rd_finish_out;
always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        calc_rd_finish      <= 4'b0;
        calc_rd_finish_out  <= 1'b0;
    end else begin 
        calc_rd_finish      <= {calc_rd_finish[2:0], 1'b0};
        calc_rd_finish_out  <= calc_rd_finish[3];
    end
end

//-------------------------------------------
// ddr read ins generate
//-------------------------------------------
assign ddr_rd_ins = {calc_rd_finish_out, ddr_rd_addr_out, bl_size_out};


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

reg [7:0]           pic_size_r;
reg [7:0]           pic_size_next_r;

always @ (posedge clk_calc or negedge rst_n) begin
    if (!rst_n) begin
        pic_size      <= 8'd128;
        pic_size_next <= 8'd128;
    end else begin
        pic_size      <= pic_size_r;
        pic_size_next <= pic_size_next_r;
    end
end

always @ (*) begin
    case (layer_num_cur)
        0 : 
        begin
            pic_size_r = 8'd128;
        end
        1,2,3,4 : 
        begin
            pic_size_r = 8'd64;
        end
        5,6,7,8,9,10 :
        begin
            pic_size_r = 8'd32;
        end
        11,12,13,14,15,16,17,18,19 :
        begin
            pic_size_r = 8'd16;
        end
        20,21,22,23,24,25,26,27,28,
        29,30,31,32,33,34,35,36,37,
        38,39,40 :
        begin
            pic_size_r = 8'd8;
        end
        41,42,43,44,45,46,47,48,49,
        50,51: 
        begin
            pic_size_r = 8'd4;
        end
        default : begin
            pic_size_r = 8'd1;
        end
    endcase
end

always @ (*) begin
    case (layer_num_cur+1)
        0 : 
        begin
            pic_size_next_r = 8'd128;
        end
        1,2,3,4 : 
        begin
            pic_size_next_r = 8'd64;
        end
        5,6,7,8,9,10 :
        begin
            pic_size_next_r = 8'd32;
        end
        11,12,13,14,15,16,17,18,19 :
        begin
            pic_size_next_r = 8'd16;
        end
        20,21,22,23,24,25,26,27,28,
        29,30,31,32,33,34,35,36,37,
        38,39,40 :
        begin
            pic_size_next_r = 8'd8;
        end
        41,42,43,44,45,46,47,48,49,
        50,51: 
        begin
            pic_size_next_r = 8'd4;
        end
        default : begin
            pic_size_next_r = 8'd1;
        end
    endcase
end

always @ (posedge clk_calc) begin
    pic_size_all_1      <= pic_size - 1'b1;
    pic_size_all_dw     <= pic_size + 1'b1;
    pic_size_quarter_1  <= {2'b0,pic_size[7:2]} - 1'b1;
    pic_size_half_1     <= {1'b0,pic_size[7:1]} - 1'b1;
end 

always @ (posedge clk_calc) begin 
    if (c_size_i[layer_num_cur+1][3:0] == 4'd0) begin 
        co_div_16   <= c_size_i[layer_num_cur+1][10:4];
        co_div_16_1 <= c_size_i[layer_num_cur+1][10:4] - 1'b1;
    end else begin 
        co_div_16   <= c_size_i[layer_num_cur+1][10:4] + 1'b1;
        co_div_16_1 <= c_size_i[layer_num_cur+1][10:4];
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        cache_deep_cur <= 0;
    end else if (layer_type_cur == L_DW) begin 
        cache_deep_cur <= psize2;    
    end else if (layer_type_cur == L_PW) begin 
        cache_deep_cur <= psize2 * ci_div_16;
    end else begin 
        cache_deep_cur <= 512;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        cache_deep_next <= 0;
    end else if (layer_type_next == L_DW) begin 
        cache_deep_next <= pnextsize2;
    end else if (layer_type_next == L_PW) begin 
        cache_deep_next <= pnextsize2 * co_div_16;
    end else begin 
        cache_deep_next <= 512;
    end
end

always @ (posedge clk_calc) begin 
    if (c_size_i[layer_num_cur][3:0] == 4'd0) begin 
        ci_div_16   <= c_size_i[layer_num_cur][10:4];
        ci_div_16_1 <= c_size_i[layer_num_cur][10:4] - 1'b1;
    end else begin 
        ci_div_16   <= c_size_i[layer_num_cur][10:4] + 1'b1;
        ci_div_16_1 <= c_size_i[layer_num_cur][10:4];
    end
end

always @ (posedge clk_calc) begin   
    pic_co_div_16        <= pic_size * co_div_16;
    psize2               <= pic_size * pic_size;
    pnextsize2           <= pic_size_next * pic_size_next;
end

always @ (posedge clk_calc) begin 
    if (layer_sc_vld == 1'b1) begin 
        pw_cnt1_sc <= 1'b1;
    end else begin 
        pw_cnt1_sc <= 1'b0;
    end
end

always @ (posedge clk_calc) begin 
    if (layer_sc_vld == 1'b1) begin 
		pw_cnt2_num <= pic_size - 1;
	end else begin 
		pw_cnt2_num <= cnt2_num[layer_num_cur];
	end
end

always @ (posedge clk_calc) begin 
    if (layer_sc_vld == 1'b1) begin 
		pw_bl_t <= ci_div_16;
	end else begin 
		pw_bl_t <= bl_size_tab[layer_num_cur];
	end
end

always @ (posedge clk_calc) begin 
    w_base_addr <= w_base[layer_num_cur];
    b_base_addr <= bias_base[layer_num_cur];
    f_base_addr <= data_base[layer_num_cur];
end

always @ (posedge clk_calc) begin 
    if (layer_num_cur > 7'd2) begin 
        sc_base_addr <= data_base[layer_num_cur-2];
    end else begin 
        sc_base_addr <= 26'd0;
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
assign c_size_i[17] = 11'd192 ; assign c_size_i[36] = 11'd96  ; assign c_size_i[54] = 11'd1008; //凑整数
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

//stride
// assign layer_wait_en[ 0] = 1'd1; assign layer_wait_en[18] = 1'd1; assign layer_wait_en[36] = 1'd1;
// assign layer_wait_en[ 1] = 1'd0; assign layer_wait_en[19] = 1'd0; assign layer_wait_en[37] = 1'd0;
// assign layer_wait_en[ 2] = 1'd1; assign layer_wait_en[20] = 1'd1; assign layer_wait_en[38] = 1'd1;
// assign layer_wait_en[ 3] = 1'd1; assign layer_wait_en[21] = 1'd1; assign layer_wait_en[39] = 1'd1;
// assign layer_wait_en[ 4] = 1'd0; assign layer_wait_en[22] = 1'd0; assign layer_wait_en[40] = 1'd0;
// assign layer_wait_en[ 5] = 1'd1; assign layer_wait_en[23] = 1'd1; assign layer_wait_en[41] = 1'd1;
// assign layer_wait_en[ 6] = 1'd1; assign layer_wait_en[24] = 1'd1; assign layer_wait_en[42] = 1'd1;
// assign layer_wait_en[ 7] = 1'd0; assign layer_wait_en[25] = 1'd0; assign layer_wait_en[43] = 1'd0;
// assign layer_wait_en[ 8] = 1'd1; assign layer_wait_en[26] = 1'd1; assign layer_wait_en[44] = 1'd1;
// assign layer_wait_en[ 9] = 1'd1; assign layer_wait_en[27] = 1'd1; assign layer_wait_en[45] = 1'd1;
// assign layer_wait_en[10] = 1'd0; assign layer_wait_en[28] = 1'd0; assign layer_wait_en[46] = 1'd0;
// assign layer_wait_en[11] = 1'd1; assign layer_wait_en[29] = 1'd1; assign layer_wait_en[47] = 1'd0;
// assign layer_wait_en[12] = 1'd1; assign layer_wait_en[30] = 1'd1; assign layer_wait_en[48] = 1'd0;
// assign layer_wait_en[13] = 1'd0; assign layer_wait_en[31] = 1'd0; assign layer_wait_en[49] = 1'd0;
// assign layer_wait_en[14] = 1'd1; assign layer_wait_en[32] = 1'd1; assign layer_wait_en[50] = 1'd0;
// assign layer_wait_en[15] = 1'd1; assign layer_wait_en[33] = 1'd1; assign layer_wait_en[51] = 1'd0;
// assign layer_wait_en[16] = 1'd0; assign layer_wait_en[34] = 1'd0; assign layer_wait_en[52] = 1'd0;
// assign layer_wait_en[17] = 1'd1; assign layer_wait_en[35] = 1'd1; assign layer_wait_en[53] = 1'd0;

//data_base
assign data_base[ 0] = 26'd1000000   ;   assign data_base[27] = 26'd1121856  ;
assign data_base[ 1] = 26'd1012288   ;   assign data_base[28] = 26'd1122112  ;
assign data_base[ 2] = 26'd1020480   ;   assign data_base[29] = 26'd1123648  ;
assign data_base[ 3] = 26'd1028672   ;   assign data_base[30] = 26'd1125184  ;
assign data_base[ 4] = 26'd1032768   ;   assign data_base[31] = 26'd1125440  ;
assign data_base[ 5] = 26'd1057344   ;   assign data_base[32] = 26'd1126976  ;
assign data_base[ 6] = 26'd1063488   ;   assign data_base[33] = 26'd1128512  ;
assign data_base[ 7] = 26'd1065536   ;   assign data_base[34] = 26'd1128896  ;
assign data_base[ 8] = 26'd1074752   ;   assign data_base[35] = 26'd1131200  ;
assign data_base[ 9] = 26'd1083968   ;   assign data_base[36] = 26'd1133504  ;
assign data_base[10] = 26'd1086016   ;   assign data_base[37] = 26'd1133888  ;
assign data_base[11] = 26'd1095232   ;   assign data_base[38] = 26'd1136192  ;
assign data_base[12] = 26'd1097536   ;   assign data_base[39] = 26'd1138496  ;
assign data_base[13] = 26'd1098048   ;   assign data_base[40] = 26'd1138880  ;
assign data_base[14] = 26'd1101120   ;   assign data_base[41] = 26'd1141184  ;
assign data_base[15] = 26'd1104192   ;   assign data_base[42] = 26'd1141760  ;
assign data_base[16] = 26'd1104704   ;   assign data_base[43] = 26'd1141920  ;
assign data_base[17] = 26'd1107776   ;   assign data_base[44] = 26'd1142880  ;
assign data_base[18] = 26'd1110848   ;   assign data_base[45] = 26'd1143840  ;
assign data_base[19] = 26'd1111360   ;   assign data_base[46] = 26'd1144000  ;
assign data_base[20] = 26'd1114432   ;   assign data_base[47] = 26'd1144960  ;
assign data_base[21] = 26'd1115200   ;   assign data_base[48] = 26'd1145920  ;
assign data_base[22] = 26'd1115456   ;   assign data_base[49] = 26'd1146080  ;
assign data_base[23] = 26'd1116992   ;   assign data_base[50] = 26'd1147040  ;
assign data_base[24] = 26'd1118528   ;   assign data_base[51] = 26'd1148000  ;
assign data_base[25] = 26'd1118784   ;   assign data_base[52] = 26'd1148320  ;
assign data_base[26] = 26'd1120320   ;   assign data_base[53] = 26'd1149600  ;
                 
//w_base
assign w_base[ 0] = 26'd1000    ;  assign w_base[27] = 26'd12390   ;
assign w_base[ 1] = 26'd1096    ;  assign w_base[28] = 26'd13926   ;
assign w_base[ 2] = 26'd1114    ;  assign w_base[29] = 26'd14142   ;
assign w_base[ 3] = 26'd1146    ;  assign w_base[30] = 26'd15678   ;
assign w_base[ 4] = 26'd1242    ;  assign w_base[31] = 26'd17214   ;
assign w_base[ 5] = 26'd1296    ;  assign w_base[32] = 26'd17430   ;
assign w_base[ 6] = 26'd1488    ;  assign w_base[33] = 26'd19734   ;
assign w_base[ 7] = 26'd1776    ;  assign w_base[34] = 26'd23190   ;
assign w_base[ 8] = 26'd1857    ;  assign w_base[35] = 26'd23514   ;
assign w_base[ 9] = 26'd2145    ;  assign w_base[36] = 26'd26970   ;
assign w_base[10] = 26'd2433    ;  assign w_base[37] = 26'd30426   ;
assign w_base[11] = 26'd2514    ;  assign w_base[38] = 26'd30750   ;
assign w_base[12] = 26'd2802    ;  assign w_base[39] = 26'd34206   ;
assign w_base[13] = 26'd3186    ;  assign w_base[40] = 26'd37662   ;
assign w_base[14] = 26'd3294    ;  assign w_base[41] = 26'd37986   ;
assign w_base[15] = 26'd3678    ;  assign w_base[42] = 26'd43746   ;
assign w_base[16] = 26'd4062    ;  assign w_base[43] = 26'd53346   ;
assign w_base[17] = 26'd4170    ;  assign w_base[44] = 26'd53886   ;
assign w_base[18] = 26'd4554    ;  assign w_base[45] = 26'd63486   ;
assign w_base[19] = 26'd4938    ;  assign w_base[46] = 26'd73086   ;
assign w_base[20] = 26'd5046    ;  assign w_base[47] = 26'd73626   ;
assign w_base[21] = 26'd5814    ;  assign w_base[48] = 26'd83226   ;
assign w_base[22] = 26'd7350    ;  assign w_base[49] = 26'd92826   ;
assign w_base[23] = 26'd7566    ;  assign w_base[50] = 26'd93366   ;
assign w_base[24] = 26'd9102    ;  assign w_base[51] = 26'd112566  ;
assign w_base[25] = 26'd10638   ;  assign w_base[52] = 26'd138166  ;
assign w_base[26] = 26'd10854   ;  assign w_base[53] = 26'd138167  ;                
                                                           
//bias_base
assign bias_base[ 0] = 26'd900000 ;  assign bias_base[27] = 26'd900243 ;
assign bias_base[ 1] = 26'd900002 ;  assign bias_base[28] = 26'd900267 ;
assign bias_base[ 2] = 26'd900004 ;  assign bias_base[29] = 26'd900291 ;
assign bias_base[ 3] = 26'd900005 ;  assign bias_base[30] = 26'd900295 ;
assign bias_base[ 4] = 26'd900011 ;  assign bias_base[31] = 26'd900319 ;
assign bias_base[ 5] = 26'd900017 ;  assign bias_base[32] = 26'd900343 ;
assign bias_base[ 6] = 26'd900019 ;  assign bias_base[33] = 26'd900349 ;
assign bias_base[ 7] = 26'd900028 ;  assign bias_base[34] = 26'd900385 ;
assign bias_base[ 8] = 26'd900037 ;  assign bias_base[35] = 26'd900421 ;
assign bias_base[ 9] = 26'd900039 ;  assign bias_base[36] = 26'd900427 ;
assign bias_base[10] = 26'd900048 ;  assign bias_base[37] = 26'd900463 ;
assign bias_base[11] = 26'd900057 ;  assign bias_base[38] = 26'd900499 ;
assign bias_base[12] = 26'd900059 ;  assign bias_base[39] = 26'd900505 ;
assign bias_base[13] = 26'd900071 ;  assign bias_base[40] = 26'd900541 ;
assign bias_base[14] = 26'd900083 ;  assign bias_base[41] = 26'd900577 ;
assign bias_base[15] = 26'd900085 ;  assign bias_base[42] = 26'd900587 ;
assign bias_base[16] = 26'd900097 ;  assign bias_base[43] = 26'd900647 ;
assign bias_base[17] = 26'd900109 ;  assign bias_base[44] = 26'd900707 ;
assign bias_base[18] = 26'd900111 ;  assign bias_base[45] = 26'd900717 ;
assign bias_base[19] = 26'd900123 ;  assign bias_base[46] = 26'd900777 ;
assign bias_base[20] = 26'd900135 ;  assign bias_base[47] = 26'd900837 ;
assign bias_base[21] = 26'd900139 ;  assign bias_base[48] = 26'd900847 ;
assign bias_base[22] = 26'd900163 ;  assign bias_base[49] = 26'd900907 ;
assign bias_base[23] = 26'd900187 ;  assign bias_base[50] = 26'd900967 ;
assign bias_base[24] = 26'd900191 ;  assign bias_base[51] = 26'd900987 ;
assign bias_base[25] = 26'd900215 ;  assign bias_base[52] = 26'd901067 ;
assign bias_base[26] = 26'd900239 ;  assign bias_base[53] = 26'd901068 ;

assign bl_size_tab[ 0] = 7'd0  ;      assign cnt2_num[ 0] = 6'd0  ;    
assign bl_size_tab[ 1] = 7'd0  ;      assign cnt2_num[ 1] = 6'd0  ;    
assign bl_size_tab[ 2] = 7'd16 ;/**/  assign cnt2_num[ 2] = 6'd7  ;/**/
assign bl_size_tab[ 3] = 7'd16 ;/**/  assign cnt2_num[ 3] = 6'd3  ;/**/
assign bl_size_tab[ 4] = 7'd0  ;      assign cnt2_num[ 4] = 6'd0  ;    
assign bl_size_tab[ 5] = 7'd12 ;/**/  assign cnt2_num[ 5] = 6'd15 ;/**/
assign bl_size_tab[ 6] = 7'd16 ;/**/  assign cnt2_num[ 6] = 6'd3  ;/**/
assign bl_size_tab[ 7] = 7'd0  ;      assign cnt2_num[ 7] = 6'd0  ;    
assign bl_size_tab[ 8] = 7'd18 ;/**/  assign cnt2_num[ 8] = 6'd15 ;/**/
assign bl_size_tab[ 9] = 7'd16 ;/**/  assign cnt2_num[ 9] = 6'd3  ;/**/
assign bl_size_tab[10] = 7'd0  ;      assign cnt2_num[10] = 6'd0  ;    
assign bl_size_tab[11] = 7'd18 ;/**/  assign cnt2_num[11] = 6'd7  ;/**/
assign bl_size_tab[12] = 7'd16 ;/**/  assign cnt2_num[12] = 6'd1  ;/**/
assign bl_size_tab[13] = 7'd0  ;      assign cnt2_num[13] = 6'd0  ;    
assign bl_size_tab[14] = 7'd12 ;/**/  assign cnt2_num[14] = 6'd15 ;/**/
assign bl_size_tab[15] = 7'd16 ;/**/  assign cnt2_num[15] = 6'd1  ;/**/
assign bl_size_tab[16] = 7'd0  ;      assign cnt2_num[16] = 6'd0  ;    
assign bl_size_tab[17] = 7'd12 ;/**/  assign cnt2_num[17] = 6'd15 ;/**/
assign bl_size_tab[18] = 7'd16 ;/**/  assign cnt2_num[18] = 6'd1  ;/**/
assign bl_size_tab[19] = 7'd0  ;      assign cnt2_num[19] = 6'd0  ;    
assign bl_size_tab[20] = 7'd12 ;/**/  assign cnt2_num[20] = 6'd7  ;/**/
assign bl_size_tab[21] = 7'd16 ;/**/  assign cnt2_num[21] = 6'd1  ;/**/
assign bl_size_tab[22] = 7'd0  ;      assign cnt2_num[22] = 6'd0  ;    
assign bl_size_tab[23] = 7'd24 ;/**/  assign cnt2_num[23] = 6'd7  ;/**/
assign bl_size_tab[24] = 7'd16 ;/**/  assign cnt2_num[24] = 6'd1  ;/**/
assign bl_size_tab[25] = 7'd0  ;      assign cnt2_num[25] = 6'd0  ;    
assign bl_size_tab[26] = 7'd24 ;/**/  assign cnt2_num[26] = 6'd7  ;/**/
assign bl_size_tab[27] = 7'd16 ;/**/  assign cnt2_num[27] = 6'd1  ;/**/
assign bl_size_tab[28] = 7'd0  ;	  assign cnt2_num[28] = 6'd0  ;
assign bl_size_tab[29] = 7'd24 ;/**/  assign cnt2_num[29] = 6'd7  ;/**/
assign bl_size_tab[30] = 7'd16 ;/**/  assign cnt2_num[30] = 6'd1  ;/**/
assign bl_size_tab[31] = 7'd0  ;      assign cnt2_num[31] = 6'd0  ;
assign bl_size_tab[32] = 7'd24 ;/**/  assign cnt2_num[32] = 6'd7  ;/**/
assign bl_size_tab[33] = 7'd24 ;/**/  assign cnt2_num[33] = 6'd1  ;/**/
assign bl_size_tab[34] = 7'd0  ;      assign cnt2_num[34] = 6'd0  ;
assign bl_size_tab[35] = 7'd36 ;/**/  assign cnt2_num[35] = 6'd7  ;/**/
assign bl_size_tab[36] = 7'd24 ;/**/  assign cnt2_num[36] = 6'd1  ;/**/
assign bl_size_tab[37] = 7'd0  ;      assign cnt2_num[37] = 6'd0  ;
assign bl_size_tab[38] = 7'd36 ;/**/  assign cnt2_num[38] = 6'd7  ;/**/
assign bl_size_tab[39] = 7'd24 ;/**/  assign cnt2_num[39] = 6'd1  ;/**/
assign bl_size_tab[40] = 7'd0  ;      assign cnt2_num[40] = 6'd0  ;
assign bl_size_tab[41] = 7'd36 ;/**/  assign cnt2_num[41] = 6'd3  ;/**/
assign bl_size_tab[42] = 7'd20 ;/**/  assign cnt2_num[42] = 6'd1  ;/**/
assign bl_size_tab[43] = 7'd0  ;      assign cnt2_num[43] = 6'd0  ;
assign bl_size_tab[44] = 7'd60 ;/**/  assign cnt2_num[44] = 6'd3  ;/**/
assign bl_size_tab[45] = 7'd20 ;/**/  assign cnt2_num[45] = 6'd1  ;/**/
assign bl_size_tab[46] = 7'd0  ;      assign cnt2_num[46] = 6'd0  ;
assign bl_size_tab[47] = 7'd60 ;/**/  assign cnt2_num[47] = 6'd3  ;/**/
assign bl_size_tab[48] = 7'd20 ;/**/  assign cnt2_num[48] = 6'd1  ;/**/
assign bl_size_tab[49] = 7'd0  ;      assign cnt2_num[49] = 6'd0  ;
assign bl_size_tab[50] = 7'd60 ;/**/  assign cnt2_num[50] = 6'd3  ;/**/ 
assign bl_size_tab[51] = 7'd20 ;/**/  assign cnt2_num[51] = 6'd3  ;/**/
assign bl_size_tab[52] = 7'd0  ;      assign cnt2_num[52] = 6'd0  ;
assign bl_size_tab[53] = 7'd80 ;/**/  assign cnt2_num[53] = 6'd0  ;/**/

endmodule
