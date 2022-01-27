module data_in_reorder
    #(parameter BANDWIDTH=512,
                BITWIDTH=32)(
    input                           clk_data,
    input                           rst_n,
                                    
    input [BANDWIDTH-1:0]           data_in,
    input                           data_in_vld,
                                    
    output reg                      fifo_wr_en,
    output [BITWIDTH*16-1+20:0]     fifo_wr_all
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

parameter ST_W_RD    = 2'd0;
parameter ST_SC_RD   = 2'd1;
parameter ST_BIAS_RD = 2'd2;
parameter ST_DATA_RD = 2'd3;

reg  [7:0]                      pic_size;
reg  [15:0]                     pic_square;
reg  [7:0]                      pic_size_1;
reg  [7:0]                      pic_size_dw;
reg  [10:0]                     pic_size_half_1;
reg  [10:0]                     pic_size_quarter_1;
reg  [10:0]                     ci_quarter_1;
reg  [10:0]                     ci_div16_1;
reg  [10:0]                     ci_div16_sc;
reg  [7:0]                      ci_div8;
reg  [7:0]                      ci_div8_1;
reg  [10:0]                     co_div16_1;
reg  [13:0]                     dw_w_chg_cnt_num;
reg  [15:0]                     pw_w_chg_cnt_num;

wire [2:0]                      layer_type[53:0];
wire                            relu_vld[53:0];

wire [10:0]                     c_size_i[54:0];
wire                            s_value[53:0];
reg                             conv_each_done;
reg                             dw_each_done;
reg                             pw_each_done;
reg                             conv_all_done;
reg                             dw_all_done;
reg                             pw_all_done;

wire                            conv_temp_vld1;
wire                            conv_temp_vld2;
wire                            conv_temp_vld3;
wire                            dw_temp_vld1;
wire                            dw_temp_vld2;
reg                             pw_temp_vld;

genvar i;

reg [2:0]                       layer_type_cur;
reg [6:0]                       layer_num_cur;
reg                             layer_sc_vld;
reg                             relu_vld_cur;
reg                             layer_stride;

always @ (posedge clk_data or negedge rst_n) begin 
	if (!rst_n) begin 
		layer_type_cur <= 3'd0;
        layer_sc_vld   <= 1'b0;
        relu_vld_cur   <= 1'b0;
        layer_stride   <= 1'b0;
	end else begin 
		layer_type_cur <= layer_type[layer_num_cur] == L_PW_SC ? L_PW : layer_type[layer_num_cur];
        layer_sc_vld   <= layer_type[layer_num_cur] == L_PW_SC ? 1'b1 : 1'b0;
        relu_vld_cur   <= relu_vld[layer_num_cur];
        layer_stride   <= s_value[layer_num_cur];
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
			default : begin 
				layer_num_cur <= layer_num_cur;
			end
		endcase
	end
end

// reg [6:0]                       layer_type_cur;
// reg [10:0]                      pic_size_quarter_1_temp;
// reg                             s_value_cur_temp;
// reg                             relu_vld_temp;

// always @ (posedge clk_data or negedge rst_n) begin
    // if(!rst_n) begin
        // layer_type_cur         <= 7'd0;
        // pic_size_quarter_1_temp     <= 7'd0;
        // s_value_cur_temp            <= 1'd0;
        // relu_vld_temp               <= 1'b1;
    // end else if (conv_temp_vld1 == 1'b1 || conv_temp_vld2 == 1'b1 || conv_temp_vld3 == 1'b1) begin
        // layer_type_cur         <= layer_type_cur;
        // pic_size_quarter_1_temp     <= pic_size_quarter_1_temp;
        // s_value_cur_temp            <= s_value_cur_temp;
        // relu_vld_temp               <= relu_vld_temp;
    // end else if (dw_temp_vld1 == 1'b1 || dw_temp_vld2 == 1'b1) begin
        // layer_type_cur         <= layer_type_cur;
        // pic_size_quarter_1_temp     <= pic_size_quarter_1_temp;
        // s_value_cur_temp            <= s_value_cur_temp;
        // relu_vld_temp               <= relu_vld_temp;
    // end else begin 
        // layer_type_cur         <= layer_type_cur;
        // pic_size_quarter_1_temp     <= pic_size_quarter_1;
        // s_value_cur_temp            <= layer_stride;
        // relu_vld_temp               <= relu_vld_cur;
    // end
// end

reg [13:0]                      dw_w_chg_cnt_num_temp;
reg [15:0]                      pw_w_chg_cnt_num_temp;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        dw_w_chg_cnt_num_temp <= 14'd0;
    end else if (dw_temp_vld1 == 1'b1 || dw_temp_vld2 == 1'b1) begin 
        dw_w_chg_cnt_num_temp <= dw_w_chg_cnt_num_temp;
    end else begin 
        dw_w_chg_cnt_num_temp <= dw_w_chg_cnt_num;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        pw_w_chg_cnt_num_temp <= 16'b0;
    end else if (pw_temp_vld == 1'b1) begin 
        pw_w_chg_cnt_num_temp <= pw_w_chg_cnt_num_temp;
    end else begin 
        pw_w_chg_cnt_num_temp <= pw_w_chg_cnt_num;
    end
end

reg [13:0]                      conv_data_cnt_ub;
reg [13:0]                      dw_data_cnt_ub;
reg [13:0]                      pw_data_cnt_ub;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        dw_data_cnt_ub <= 14'd0;
    end else if (layer_type_cur == L_DW) begin 
        dw_data_cnt_ub <= 14'd0;
    end
end

reg [10:0]                      conv_data_cnt_l1;
reg [10:0]                      conv_data_cnt_l2;
reg [10:0]                      conv_data_cnt_l3;
reg [10:0]                      conv_data_cnt_l4;

/*------------------conv_data_cnt_l1------------------*/
always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        conv_data_cnt_l1 <= 11'd0;
    end else if (layer_type_cur == L_CONV && 
                 data_in_vld == 1'b1 && 
                 conv_data_cnt_l1 == 11'd2) begin
        conv_data_cnt_l1 <= 11'd0;
    end else if (layer_type_cur == L_CONV && 
                 data_in_vld == 1'b1) begin
        conv_data_cnt_l1 <= conv_data_cnt_l1 + 1'b1;
    end else begin 
        conv_data_cnt_l1 <= conv_data_cnt_l1;
    end
end

/*------------------conv_data_cnt_l2------------------*/
always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        conv_data_cnt_l2 <= 11'd0;
    end else if (layer_type_cur == L_CONV && 
                 data_in_vld == 1'b1 && 
                 conv_data_cnt_l1 == 11'd2 && 
                 conv_data_cnt_l2 == 11'd63) begin
        conv_data_cnt_l2 <= 11'd0;
    end else if (layer_type_cur == L_CONV && 
                 data_in_vld == 1'b1 && 
                 conv_data_cnt_l1 == 11'd2) begin
        conv_data_cnt_l2 <= conv_data_cnt_l2 + 1'b1;
    end else begin 
        conv_data_cnt_l2 <= conv_data_cnt_l2;
    end
end

/*------------------conv_data_cnt_l3------------------*/
always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        conv_data_cnt_l3 <= 11'd0;
    end else if (layer_type_cur == L_CONV && 
                 data_in_vld == 1'b1 && 
                 conv_data_cnt_l1 == 11'd2 && 
                 conv_data_cnt_l2 == 11'd63 && 
                 conv_data_cnt_l3 == 11'd63) begin
        conv_data_cnt_l3 <= 11'd0;
    end else if (layer_type_cur == L_CONV && 
                 data_in_vld == 1'b1 && 
                 conv_data_cnt_l1 == 11'd2 && 
                 conv_data_cnt_l2 == 11'd63) begin
        conv_data_cnt_l3 <= conv_data_cnt_l3 + 1'b1;
    end else begin
        conv_data_cnt_l3 <= conv_data_cnt_l3;
    end
end

/*------------------conv_data_cnt_l4------------------*/
always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        conv_data_cnt_l4 <= 11'd0;
    end else if (layer_type_cur == L_CONV && 
                 data_in_vld == 1'b1 && 
                 conv_data_cnt_l1 == 11'd2 && 
                 conv_data_cnt_l2 == 11'd63 && 
                 conv_data_cnt_l3 == 11'd63 && 
                 conv_data_cnt_l4 == 11'd1) begin
        conv_data_cnt_l4 <= 11'd0;
    end else if (layer_type_cur == L_CONV && 
                 data_in_vld == 1'b1 && 
                 conv_data_cnt_l1 == 11'd2 && 
                 conv_data_cnt_l2 == 11'd63 && 
                 conv_data_cnt_l3 == 11'd63) begin
        conv_data_cnt_l4 <= conv_data_cnt_l4 + 1'b1;
    end else begin 
        conv_data_cnt_l4 <= conv_data_cnt_l4;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        conv_each_done <= 1'b0;
    end else if (layer_type_cur == L_CONV && 
                 data_in_vld == 1'b1 && 
                 conv_data_cnt_l1 == 11'd2 && 
                 conv_data_cnt_l2 == 11'd63 && 
                 conv_data_cnt_l3 == 11'd63) begin 
        conv_each_done <= 1'b1;
    end else begin 
        conv_each_done <= 1'b0;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        conv_all_done <= 1'b0;
    end else if (layer_type_cur == L_CONV && 
                 data_in_vld == 1'b1 && 
                 conv_data_cnt_l1 == 11'd2 && 
                 conv_data_cnt_l2 == 11'd63 && 
                 conv_data_cnt_l3 == 11'd63 && 
                 conv_data_cnt_l4 == 11'd1) begin 
        conv_all_done <= 1'b1;
    end else begin 
        conv_all_done <= 1'b0;
    end
end

reg [10:0]                      dw_data_cnt_l1;
reg [10:0]                      dw_data_cnt_l2;
reg [10:0]                      dw_data_cnt_l3;
reg [10:0]                      dw_data_cnt_l4;

always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        dw_data_cnt_l1 <= 11'd0;
    end else if (layer_type_cur == L_DW && 
                 data_in_vld == 1'b1 && 
                 dw_data_cnt_l1 == 11'd5) begin
        dw_data_cnt_l1 <= 11'd0;
    end else if (layer_type_cur == L_DW && 
                 data_in_vld == 1'b1) begin
        dw_data_cnt_l1 <= dw_data_cnt_l1 + 1'b1;
    end else begin 
        dw_data_cnt_l1 <= dw_data_cnt_l1;
    end
end

always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        dw_data_cnt_l2 <= 11'd0;
    end else if (layer_type_cur == L_DW && 
                 data_in_vld == 1'b1 && 
                 dw_data_cnt_l1 == 11'd5  && 
                 dw_data_cnt_l2 == pic_size_dw) begin
        dw_data_cnt_l2 <= 11'd0;
    end else if (layer_type_cur == L_DW && 
                 data_in_vld == 1'b1 && 
                 dw_data_cnt_l1 == 11'd5) begin
        dw_data_cnt_l2 <= dw_data_cnt_l2 + 1'b1;
    end else begin 
        dw_data_cnt_l2 <= dw_data_cnt_l2;
    end
end

always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        dw_data_cnt_l3 <= 11'd0;
    end else if (layer_type_cur == L_DW && 
                 data_in_vld == 1'b1 && 
                 dw_data_cnt_l1 == 11'd5 && 
                 dw_data_cnt_l2 == pic_size_dw && 
                 dw_data_cnt_l3 == pic_size_quarter_1) begin
        dw_data_cnt_l3 <= 11'd0;
    end else if (layer_type_cur == L_DW && 
                 data_in_vld == 1'b1 && 
                 dw_data_cnt_l1 == 11'd5 && 
                 dw_data_cnt_l2 == pic_size_dw) begin
        dw_data_cnt_l3 <= dw_data_cnt_l3 + 1'b1;
    end else begin 
        dw_data_cnt_l3 <= dw_data_cnt_l3;
    end
end

always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        dw_data_cnt_l4 <= 11'd0;
    end else if (layer_type_cur == L_DW && 
                 data_in_vld == 1'b1 && 
                 dw_data_cnt_l1 == 11'd5 && 
                 dw_data_cnt_l2 == pic_size_dw && 
                 dw_data_cnt_l3 == pic_size_quarter_1 &&
                 dw_data_cnt_l4 == co_div16_1) begin
        dw_data_cnt_l4 <= 11'd0;
    end else if (layer_type_cur == L_DW && 
                 data_in_vld == 1'b1 && 
                 dw_data_cnt_l1 == 11'd5 && 
                 dw_data_cnt_l2 == pic_size_dw && 
                 dw_data_cnt_l3 == pic_size_quarter_1) begin
        dw_data_cnt_l4 <= dw_data_cnt_l4 + 1'b1;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        dw_each_done <= 1'b0;
    end else if (layer_type_cur == L_DW && 
                 data_in_vld == 1'b1 && 
                 dw_data_cnt_l1 == 11'd5 && 
                 dw_data_cnt_l2 == pic_size_dw && 
                 dw_data_cnt_l3 == pic_size_quarter_1) begin 
        dw_each_done <= 1'b1;
    end else begin 
        dw_each_done <= 1'b0;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        dw_all_done <= 1'b0;
    end else if (layer_type_cur == L_DW && 
                 data_in_vld == 1'b1 && 
                 dw_data_cnt_l1 == 11'd5 && 
                 dw_data_cnt_l2 == pic_size_dw && 
                 dw_data_cnt_l3 == pic_size_quarter_1 &&
                 dw_data_cnt_l4 == co_div16_1) begin 
        dw_all_done <= 1'b1;
    end else begin 
        dw_all_done <= 1'b0;
    end
end

reg [10:0]                      pw_data_cnt_l1;
reg [10:0]                      pw_data_cnt_l2;
reg [10:0]                      pw_data_cnt_l3;
reg [10:0]                      pw_data_cnt_l4;

always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        pw_data_cnt_l1 <= 11'd0;
    end else if (layer_type_cur == L_PW && 
                 data_in_vld == 1'b1 && 
                 pw_data_cnt_l1 == ci_div16_1) begin
        pw_data_cnt_l1 <= 11'd0;
    end else if (layer_type_cur == L_PW && 
                 data_in_vld == 1'b1) begin
        pw_data_cnt_l1 <= pw_data_cnt_l1 + 1'b1;
    end
end

always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        pw_data_cnt_l2 <= 11'd0;
    end else if (layer_type_cur == L_PW && 
                 data_in_vld == 1'b1 && 
                 pw_data_cnt_l1 == ci_div16_1 && 
                 pw_data_cnt_l2 == pic_size_1) begin
        pw_data_cnt_l2 <= 11'd0;
    end else if (layer_type_cur == L_PW && 
                 data_in_vld == 1'b1 && 
                 pw_data_cnt_l1 == ci_div16_1) begin
        pw_data_cnt_l2 <= pw_data_cnt_l2 + 1'b1;
    end
end

always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        pw_data_cnt_l3 <= 11'd0;
    end else if (layer_type_cur == L_PW && 
                 data_in_vld == 1'b1 && 
                 pw_data_cnt_l1 == ci_div16_1 && 
                 pw_data_cnt_l2 == pic_size_1 && 
                 pw_data_cnt_l3 == pic_size_1) begin
        pw_data_cnt_l3 <= 11'd0;
    end else if (layer_type_cur == L_PW && 
                 data_in_vld == 1'b1 && 
                 pw_data_cnt_l1 == ci_div16_1 && 
                 pw_data_cnt_l2 == pic_size_1) begin
        pw_data_cnt_l3 <= pw_data_cnt_l3 + 1'b1;
    end
end

always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        pw_data_cnt_l4 <= 11'd0;
    end else if (layer_type_cur == L_PW && 
                 data_in_vld == 1'b1 && 
                 pw_data_cnt_l1 == ci_div16_1 && 
                 pw_data_cnt_l2 == pic_size_1 && 
                 pw_data_cnt_l3 == pic_size_1 && 
                 pw_data_cnt_l4 == co_div16_1) begin
        pw_data_cnt_l4 <= 11'd0;
    end else if (layer_type_cur == L_PW && 
                 data_in_vld == 1'b1 && 
                 pw_data_cnt_l1 == ci_div16_1 && 
                 pw_data_cnt_l2 == pic_size_1 && 
                 pw_data_cnt_l3 == pic_size_1) begin
        pw_data_cnt_l4 <= pw_data_cnt_l4 + 1'b1;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        pw_each_done <= 1'b0;
    end else if (layer_type_cur == L_PW && 
                 data_in_vld == 1'b1 && 
                 pw_data_cnt_l1 == ci_div16_1 && 
                 pw_data_cnt_l2 == pic_size_1 && 
                 pw_data_cnt_l3 == pic_size_1) begin 
        pw_each_done <= 1'b1;
    end else begin 
        pw_each_done <= 1'b0;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        pw_all_done <= 1'b0;
    end else if (layer_type_cur == L_PW && 
                 data_in_vld == 1'b1 && 
                 pw_data_cnt_l1 == ci_div16_1 && 
                 pw_data_cnt_l2 == pic_size_1 && 
                 pw_data_cnt_l3 == pic_size_1 && 
                 pw_data_cnt_l4 == co_div16_1) begin 
        pw_all_done <= 1'b1;
    end else begin 
        pw_all_done <= 1'b0;
    end
end

reg                             data_reorder_temp_vld;
reg [BITWIDTH*16-1:0]           data_reorder_temp;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        data_reorder_temp_vld <= 1'b0;
    end else if (data_in_vld == 1'b1) begin 
        data_reorder_temp_vld <= 1'b1;
    end else begin 
        data_reorder_temp_vld <= 1'b0;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        data_reorder_temp <= 0;
    end else if (data_in_vld == 1'b1) begin 
        data_reorder_temp <= data_in;
    end else begin 
        data_reorder_temp <= 0;
    end
end

reg [BITWIDTH*16-1:0]           data_reorder_temp_r;
reg [BITWIDTH*16-1:0]           fifo_wr_data;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        data_reorder_temp_r <= 0;
        fifo_wr_data        <= 0;
    end else begin 
        data_reorder_temp_r <= data_reorder_temp;
        fifo_wr_data        <= data_reorder_temp_r;
    end
end

//-------------------------------------------
// control signal for data reorder
// for this 16-Data-In Architecture 
// all data only need to register once 
//-------------------------------------------
reg                             fifo_wr_en_p;
reg [2:0]                       fifo_wr_en_p_r;

always @ (posedge clk_data or negedge rst_n) begin
    if (!rst_n) begin 
        fifo_wr_en_p <= 1'b0;
    end else if (data_in_vld == 1'b1) begin 
        fifo_wr_en_p <= 1'b1;        
    end else begin 
        fifo_wr_en_p <= 1'b0;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_wr_en_p_r <= 3'b0;
        fifo_wr_en     <= 1'b0;
    end else begin 
        fifo_wr_en_p_r <= {fifo_wr_en_p_r[1:0], fifo_wr_en_p};
        fifo_wr_en     <= fifo_wr_en_p_r[0];
    end
end

/*-------------fifo_wr_slice_finish--------------*/ 
reg                         	fifo_wr_slice_finish;
reg                         	fifo_wr_slice_finish_p;  
reg [1:0]                     	fifo_wr_slice_finish_r;  

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_wr_slice_finish <= 1'b0;
        fifo_wr_slice_finish <= 1'b0;
    end else begin 
        fifo_wr_slice_finish_p <= layer_num_cur == 52 ? pw_all_done : (conv_each_done | dw_each_done | pw_each_done);
        fifo_wr_slice_finish   <= fifo_wr_slice_finish_p;
    end
end

// always @ (posedge clk_data or negedge rst_n) begin 
    // if (!rst_n) begin 
        // fifo_wr_slice_finish_r <= 2'b0;
        // fifo_wr_slice_finish   <= 1'b0;
    // end else begin 
        // fifo_wr_slice_finish_r <= {fifo_wr_slice_finish_r[0], fifo_wr_slice_finish_p};
        // fifo_wr_slice_finish   <= fifo_wr_slice_finish_p;
    // end
// end

/*-------------fifo_wr_layer_type_cur--------------*/
reg  [6:0]                      fifo_wr_layer_type_cur;
reg  [6:0]                      fifo_wr_layer_type_cur_g;
reg  [6:0]                      fifo_wr_layer_type_cur_r[2:0];

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_wr_layer_type_cur_g <= 1'b0;
    end else if (layer_num_cur == 52) begin 
        fifo_wr_layer_type_cur_g <= L_AVGPL;
    end else begin 
        fifo_wr_layer_type_cur_g <= layer_type[layer_num_cur];
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_wr_layer_type_cur_r[0] <= 1'b0;
        fifo_wr_layer_type_cur_r[1] <= 1'b0;
        fifo_wr_layer_type_cur_r[2] <= 1'b0;
        fifo_wr_layer_type_cur      <= 1'b0;
    end else begin 
        fifo_wr_layer_type_cur_r[0] <= fifo_wr_layer_type_cur_g;
        fifo_wr_layer_type_cur_r[1] <= fifo_wr_layer_type_cur_r[0];
        fifo_wr_layer_type_cur_r[2] <= fifo_wr_layer_type_cur_r[1];
        fifo_wr_layer_type_cur      <= fifo_wr_layer_type_cur_r[0];
    end
end

/*-------------fifo_wr_calc_en--------------*/
reg                             conv_pw_calc_en;
reg                             dw_calc_en;
reg                             fifo_wr_calc_en;
reg                             fifo_wr_calc_en_p;
reg [1:0]                       fifo_wr_calc_en_r;
 
always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        conv_pw_calc_en <= 1'b0;
    end else if (layer_num_cur == 52 && pw_data_cnt_l1 == ci_div16_sc) begin 
        conv_pw_calc_en <= 1'b1;
    end else if (layer_num_cur != 52 && (layer_type_cur == L_CONV || layer_type_cur == L_PW)) begin 
        conv_pw_calc_en <= 1'b1;
    end else begin 
        conv_pw_calc_en <= 1'b0;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        dw_calc_en <= 1'b0;
    end else if (layer_stride == 1'b1 && dw_data_cnt_l1 > 11'd2 && dw_data_cnt_l1[0] == 1'b1 && dw_data_cnt_l2 > 11'd2 && dw_data_cnt_l2[0] == 1'b1) begin 
        dw_calc_en <= 1'b1;
    end else if (layer_stride == 1'b0 && dw_data_cnt_l1 > 11'd1 && dw_data_cnt_l2 > 11'd1) begin 
        dw_calc_en <= 1'b1;
    end else begin 
        dw_calc_en <= 1'b0;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_wr_calc_en_p <= 1'b0; 
    end else if (conv_pw_calc_en || dw_calc_en) begin 
        fifo_wr_calc_en_p <= 1'b1; 
    end else begin 
        fifo_wr_calc_en_p <= 1'b0; 
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_wr_calc_en_r <= 2'b0;
        fifo_wr_calc_en   <= 1'b0;
    end else begin 
        fifo_wr_calc_en_r <= {fifo_wr_calc_en_r[0], fifo_wr_calc_en_p};
        fifo_wr_calc_en   <= fifo_wr_calc_en_p;
    end
end

/*-------------fifo_wr_acc_s--------------*/
reg                             conv_acc_s_p;
reg                             dw_acc_s_p;
reg                             pw_acc_s_p;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        conv_acc_s_p <= 1'b0;
    end else if (layer_type_cur == L_CONV && conv_data_cnt_l1 == 0 && data_in_vld == 1'b1) begin 
        conv_acc_s_p <= 1'b1;
    end else begin 
        conv_acc_s_p <= 1'b0; 
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        dw_acc_s_p <= 1'b0;
    end else if (layer_type_cur == L_DW) begin 
        dw_acc_s_p <= 1'b1;
    end else begin 
        dw_acc_s_p <= 1'b0;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        pw_acc_s_p <= 1'b0;
    end else if (layer_type_cur == L_PW && pw_data_cnt_l1 == 0 && data_in_vld == 1'b1) begin 
        pw_acc_s_p <= 1'b1;
    end else begin 
        pw_acc_s_p <= 1'b0;
    end
end

reg                             fifo_wr_acc_s;
reg                             fifo_wr_acc_s_p;
reg [1:0]                       fifo_wr_acc_s_r;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_wr_acc_s_p <= 1'b0;
    end else if (conv_acc_s_p == 1'b1 || dw_acc_s_p == 1'b1 || pw_acc_s_p == 1'b1) begin 
        fifo_wr_acc_s_p <= 1'b1;
    end else begin 
        fifo_wr_acc_s_p <= 1'b0;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_wr_acc_s_r <= 2'b0;
        fifo_wr_acc_s   <= 1'b0;
    end else begin 
        fifo_wr_acc_s_r <= {fifo_wr_acc_s_r[0], fifo_wr_acc_s_p};
        fifo_wr_acc_s   <= fifo_wr_acc_s_p;
    end
end

/*-------------relu_vld--------------*/
reg [3:0]                       fifo_wr_relu_vld_r;
reg                             fifo_wr_relu_vld;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_wr_relu_vld_r <= 4'd0;
        fifo_wr_relu_vld   <= 1'b0;
    end else begin 
        fifo_wr_relu_vld_r <= {fifo_wr_relu_vld_r[2:0], relu_vld_cur};
        fifo_wr_relu_vld   <= fifo_wr_relu_vld_r[1];
    end        
end 

/*-------------fifo_wr_layer_finish--------------*/
reg                             fifo_wr_layer_finish_p;
reg                             fifo_wr_layer_finish;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_wr_layer_finish_p <= 1'b0;
    end else begin 
        fifo_wr_layer_finish_p <= conv_all_done | dw_all_done | pw_all_done;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        // fifo_wr_layer_finish_r <= 2'b0;
        fifo_wr_layer_finish   <= 1'b0;
    end else begin 
        // fifo_wr_layer_finish_r <= {fifo_wr_layer_finish_r[0], fifo_wr_layer_finish_p};
        fifo_wr_layer_finish   <= fifo_wr_layer_finish_p;
    end
end

/*-------------fifo_wr_acc_para--------------*/
reg [6:0]                       fifo_wr_acc_para;
reg [6:0]                       fifo_wr_acc_para_p;
reg [6:0]                       fifo_wr_acc_para_p_r[2:0];

always @ (posedge clk_data or negedge rst_n)
begin
    if(!rst_n) begin
        fifo_wr_acc_para_p <= 7'd0;
    end else if (layer_num_cur == 52) begin 
        fifo_wr_acc_para_p <= 7'd0;
    end else if (layer_type_cur == L_CONV) begin
        fifo_wr_acc_para_p <= 7'd2;
    end else if (layer_type_cur == L_DW) begin
        fifo_wr_acc_para_p <= 7'd0;
    end else if (layer_type_cur == L_PW) begin 
        fifo_wr_acc_para_p <= ci_div16_1[6:0];
    end else begin
        fifo_wr_acc_para_p <= 7'd0;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_wr_acc_para_p_r[0] <= 7'b0;
        fifo_wr_acc_para_p_r[1] <= 7'b0;
        fifo_wr_acc_para_p_r[2] <= 7'b0;
        fifo_wr_acc_para        <= 7'b0;
    end else begin 
        fifo_wr_acc_para_p_r[0] <= fifo_wr_acc_para_p;
        fifo_wr_acc_para_p_r[1] <= fifo_wr_acc_para_p_r[0];
        fifo_wr_acc_para_p_r[2] <= fifo_wr_acc_para_p_r[1];
        fifo_wr_acc_para        <= fifo_wr_acc_para_p_r[1];
    end
end

/*-------------fifo_wr_pw_sc--------------*/
reg                             fifo_wr_pw_sc;
reg [2:0]                       fifo_wr_pw_sc_p;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_wr_pw_sc_p <= 3'b0;
    end else begin 
        fifo_wr_pw_sc_p <= {fifo_wr_pw_sc_p[1:0], (layer_sc_vld & pw_data_cnt_l1 == ci_div16_1 & data_in_vld)};
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_wr_pw_sc <= 1'b0;
    end else begin 
        fifo_wr_pw_sc <= fifo_wr_pw_sc_p[1]; 
    end
end

assign fifo_wr_all = {fifo_wr_layer_type_cur, fifo_wr_calc_en, fifo_wr_acc_s, fifo_wr_relu_vld, 
                      fifo_wr_layer_finish, fifo_wr_acc_para, fifo_wr_slice_finish, fifo_wr_pw_sc, fifo_wr_data};


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
assign layer_type[46] = L_DW;    assign layer_type[49] = L_DW;    assign layer_type[52] = L_PW;
assign layer_type[47] = L_PW_SC; assign layer_type[50] = L_PW;    assign layer_type[53] = L_PW;

reg [7:0]           pic_size_cur;

always @ (posedge clk_data or negedge rst_n) begin
    if (!rst_n) begin
        pic_size <= 8'd128;
    end else begin
        pic_size <= pic_size_cur;
    end
end

always @ (*) begin
    case (layer_num_cur)
        0 : 
        begin
            pic_size_cur = 8'd128;
        end
        1,2,3,4 : 
        begin
            pic_size_cur = 8'd64;
        end
        5,6,7,8,9,10 :
        begin
            pic_size_cur = 8'd32;
        end
        11,12,13,14,15,16,17,18,19 :
        begin
            pic_size_cur = 8'd16;
        end
        20,21,22,23,24,25,26,27,28,
        29,30,31,32,33,34,35,36,37,
        38,39,40 :
        begin
            pic_size_cur = 8'd8;
        end
        41,42,43,44,45,46,47,48,49,
        50,51: 
        begin
            pic_size_cur = 8'd4;
        end
        default : begin
            pic_size_cur = 8'd1;
        end
    endcase
end

//dw_w_chg_cnt_num = (pic+2)*pic
always @ (posedge clk_data) begin 
    case (pic_size_cur)
        8'd64 : begin 
            dw_w_chg_cnt_num <= 14'd1024  + 14'd32 - 1'b1;
        end
        8'd32 : begin 
            dw_w_chg_cnt_num <= 14'd256 + 14'd16 - 1'b1;
        end
        8'd16 : begin 
            dw_w_chg_cnt_num <= 14'd64 + 14'd8 - 1'b1;
        end
        8'd8 : begin 
            dw_w_chg_cnt_num <= 14'd16 + 14'd4 - 1'b1;
        end
        8'd4 : begin 
            dw_w_chg_cnt_num <= 14'd4 + 14'd2 - 1'b1;
        end
        default : begin 
            dw_w_chg_cnt_num <= 14'd0;
        end
    endcase
end

reg [23:0]                  pw_w_chg_cnt_num_p;

always @ (posedge clk_data) begin 
    ci_div8 <= c_size_i[layer_num_cur][10:3];
    pic_square <= pic_size * pic_size;
    pw_w_chg_cnt_num_p <= ci_div8 * pic_square;
    pw_w_chg_cnt_num <= layer_num_cur == 52 ? 16'd2559 : pw_w_chg_cnt_num_p[15:0] - 1'b1;
end

always @ (posedge clk_data) begin
    pic_size_quarter_1  <= pic_size[7:2] - 1'b1;
    pic_size_half_1     <= pic_size[7:1] - 1'b1;
    pic_size_1          <= pic_size[7:0] - 1'b1;
    pic_size_dw         <= pic_size[7:0] + 1'b1;
    ci_quarter_1        <= {2'b0, c_size_i[layer_num_cur][10:2]} - 1'b1;
end

always @ (posedge clk_data) begin 
    if (layer_num_cur == 52) begin 
        ci_div8_1 <= 8'd1;
    end else begin 
        ci_div8_1 <= c_size_i[layer_num_cur][10:3] - 1'b1;
    end
end

always @ (posedge clk_data) begin 
    if (c_size_i[layer_num_cur+1] == 11'd24) begin 
        co_div16_1 <= 11'd1;
    end else if (layer_num_cur == 52) begin 
        co_div16_1 <= 11'd79;
    end else begin 
        co_div16_1 <= c_size_i[layer_num_cur+1][10:4] - 1'b1;
    end
end

always @ (posedge clk_data) begin 
    if (layer_num_cur == 52) begin 
        ci_div16_sc <= 11'd15;
    end else if (layer_sc_vld == 1'b1) begin 
        ci_div16_sc <= {4'b0, c_size_i[layer_num_cur][10:4]};
    end else begin 
        ci_div16_sc <= {4'b0, c_size_i[layer_num_cur][10:4]} - 1'b1;
    end
end

always @ (posedge clk_data) begin 
    if (layer_num_cur == 52) begin 
        ci_div16_1 <= 11'd15;
    end else if (c_size_i[layer_num_cur][3:0] == 4'd0) begin 
        ci_div16_1 <= c_size_i[layer_num_cur][10:4] - 1'b1;
    end else begin 
        ci_div16_1 <= c_size_i[layer_num_cur][10:4];
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

//relu_vld
assign relu_vld[0]  = 1'b1;  assign relu_vld[18] = 1'b1; assign relu_vld[36] = 1'b1;
assign relu_vld[1]  = 1'b1;  assign relu_vld[19] = 1'b1; assign relu_vld[37] = 1'b1;
assign relu_vld[2]  = 1'b0;  assign relu_vld[20] = 1'b0; assign relu_vld[38] = 1'b0;
assign relu_vld[3]  = 1'b1;  assign relu_vld[21] = 1'b1; assign relu_vld[39] = 1'b1;
assign relu_vld[4]  = 1'b1;  assign relu_vld[22] = 1'b1; assign relu_vld[40] = 1'b1;
assign relu_vld[5]  = 1'b0;  assign relu_vld[23] = 1'b0; assign relu_vld[41] = 1'b0;
assign relu_vld[6]  = 1'b1;  assign relu_vld[24] = 1'b1; assign relu_vld[42] = 1'b1;
assign relu_vld[7]  = 1'b1;  assign relu_vld[25] = 1'b1; assign relu_vld[43] = 1'b1;
assign relu_vld[8]  = 1'b0;  assign relu_vld[26] = 1'b0; assign relu_vld[44] = 1'b0;
assign relu_vld[9]  = 1'b1;  assign relu_vld[27] = 1'b1; assign relu_vld[45] = 1'b1;
assign relu_vld[10] = 1'b1;  assign relu_vld[28] = 1'b1; assign relu_vld[46] = 1'b1;
assign relu_vld[11] = 1'b0;  assign relu_vld[29] = 1'b0; assign relu_vld[47] = 1'b0;
assign relu_vld[12] = 1'b1;  assign relu_vld[30] = 1'b1; assign relu_vld[48] = 1'b1;
assign relu_vld[13] = 1'b1;  assign relu_vld[31] = 1'b1; assign relu_vld[49] = 1'b1;
assign relu_vld[14] = 1'b0;  assign relu_vld[32] = 1'b0; assign relu_vld[50] = 1'b0;
assign relu_vld[15] = 1'b1;  assign relu_vld[33] = 1'b1; assign relu_vld[51] = 1'b1;
assign relu_vld[16] = 1'b1;  assign relu_vld[34] = 1'b1; assign relu_vld[52] = 1'b0;
assign relu_vld[17] = 1'b0;  assign relu_vld[35] = 1'b0; assign relu_vld[53] = 1'b0;



endmodule