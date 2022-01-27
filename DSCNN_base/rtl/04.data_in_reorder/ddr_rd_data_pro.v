module ddr_rd_data_pro
    #(parameter BANDWIDTH=512,
                BITWIDTH=32)(
    input                       clk_data,
    input                       rst_n,
    
    input                       ddr_vld,
    input [BANDWIDTH-1:0]       ddr_data_out,
    
    output reg                  data_out_vld,
    output reg                  w_out_vld,
    output reg                  sc_out_vld,
    output reg                  bias_out_vld,
    output reg [BANDWIDTH-1:0]  data_out,
	output reg [BANDWIDTH-1:0]	w_out,
	output reg [BANDWIDTH-1:0]	sc_out,
	output reg [BANDWIDTH-1:0]	bias_out,
    
    
    
    // output reg                  mode_change,
    // output reg [1:0]            op_mode,
    output reg                  rd_data_mode_en,
    output reg [7:0]            pic_size,
    output  [10:0]              channel_size,
    output                      stride
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
parameter L_VERI  = 3'd5;

parameter ST_W_RD    = 2'd0;
parameter ST_SC_RD   = 2'd1;
parameter ST_BIAS_RD = 2'd2;
parameter ST_DATA_RD = 2'd3;

reg  [10:0]                     pic_size_1;
reg  [10:0]                     pic_size_dw;
reg  [10:0]                     pic_size_half_1;
reg  [10:0]                     pic_size_quarter_1;
reg  [10:0]                     ci_quarter_1;
reg  [10:0]                     ci_div_16_1;
reg  [10:0]                     co_div_16_1;
reg  [10:0]                     ci_1;  //w_cnt_pw_l1_num
reg  [24:0]                     pw_data_cnt_num;
reg  [15:0]                     pic2;
reg  [15:0]                     pic2_1;
reg  [ 6:0]                     ci_div16;
reg  [ 6:0]                     ci_div16_sc; 
reg  [22:0]                     pic2_ci_div4_sc;  

wire [2:0]                      layer_type[53:0];

wire [10:0]                     c_size_i[54:0];
wire                            s_value[53:0];

reg [6:0]                       layer_num_cur;
reg [2:0]                       layer_type_cur;
reg                             layer_sc_vld;
reg [1:0]                       st_rd_cur;

wire                            conv_all_done;
wire                            dw_all_done;
wire                            pw_all_done;
wire                            avgle_all_done;

assign channel_size = c_size_i[layer_num_cur];
assign stride = s_value[layer_num_cur];   

always @ (posedge clk_data or negedge rst_n) begin 
	if (!rst_n) begin 
		layer_num_cur <= 7'd0;
	end else begin 
		case (layer_type_cur) 
			L_CONV : begin 
				if (ddr_vld == 1'b1 && conv_all_done == 1'b1) begin 
					layer_num_cur <= layer_num_cur + 1'b1;
				end	else begin 
					layer_num_cur <= layer_num_cur;
				end
			end 
			L_DW : begin 
				if (ddr_vld == 1'b1 && dw_all_done == 1'b1) begin 
					layer_num_cur <= layer_num_cur + 1'b1;
				end	else begin 
					layer_num_cur <= layer_num_cur;
				end
			end 
            L_PW : begin 
                if (ddr_vld == 1'b1 && pw_all_done == 1'b1 && layer_num_cur == 7'd53) begin 
                    layer_num_cur <= 7'd0;
                end else if (ddr_vld == 1'b1 && pw_all_done == 1'b1) begin
                    layer_num_cur <= layer_num_cur + 1'b1;
                end else begin 
                    layer_num_cur <= layer_num_cur;
                end
            end
            L_AVGPL : begin 
                if (ddr_vld == 1'b1 && avgle_all_done == 1'b1) begin 
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

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        layer_type_cur <= 3'b0;
        layer_sc_vld   <= 1'b0;
    end else if (layer_num_cur == 7'd53 && pw_all_done == 1'b1) begin 
        layer_type_cur <= L_CONV;
        layer_sc_vld   <= 1'b0;
    end else if (conv_all_done == 1'b1 || dw_all_done == 1'b1 || pw_all_done == 1'b1 || avgle_all_done == 1'b1) begin
        layer_type_cur <= layer_type[layer_num_cur+1] == L_PW_SC ? L_PW : layer_type[layer_num_cur+1];
        layer_sc_vld   <= layer_type[layer_num_cur+1] == L_PW_SC ? 1'b1 : 1'b0;
    end else begin
        layer_type_cur <= layer_type[layer_num_cur] == L_PW_SC ? L_PW : layer_type[layer_num_cur];
        layer_sc_vld   <= layer_type[layer_num_cur] == L_PW_SC ? 1'b1 : 1'b0;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        rd_data_mode_en <= 1'b0;
    end else if (st_rd_cur == ST_DATA_RD) begin 
        rd_data_mode_en <= 1'b1;
    end else begin 
        rd_data_mode_en <= 1'b0;
    end
end

reg [10:0]                      w_cnt_conv_l1;
reg [10:0]                      w_cnt_conv_l2;
reg [10:0]                      w_cnt_conv_l3;

/*-------------------w_cnt_conv_l1--------------------*/
always @ (posedge clk_data or negedge rst_n) begin
    if (!rst_n) begin
        w_cnt_conv_l1 <= 11'd0;
    end else if (layer_type_cur == L_CONV && 
                 st_rd_cur == ST_W_RD && 
                 ddr_vld == 1'b1 && 
                 w_cnt_conv_l1 == 11'd2) begin
        w_cnt_conv_l1 <= 11'd0;
    end else if (layer_type_cur == L_CONV && st_rd_cur == ST_W_RD && ddr_vld == 1'b1) begin
        w_cnt_conv_l1 <= w_cnt_conv_l1 + 1'b1;
    end else begin 
        w_cnt_conv_l1 <= w_cnt_conv_l1;
    end
end

/*-------------------w_cnt_conv_l2--------------------*/
always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin
        w_cnt_conv_l2 <= 11'd0;
    end else if (layer_type_cur == L_CONV && 
                 st_rd_cur == ST_W_RD && 
                 ddr_vld == 1'b1 && 
                 w_cnt_conv_l1 == 11'd2 && 
                 w_cnt_conv_l2 == 11'd15) begin
        w_cnt_conv_l2 <= 11'd0;
    end else if (layer_type_cur == L_CONV && 
                 st_rd_cur == ST_W_RD && 
                 ddr_vld == 1'b1 && 
                 w_cnt_conv_l1 == 11'd2) begin
        w_cnt_conv_l2 <= w_cnt_conv_l2 + 1'b1;
    end else begin 
        w_cnt_conv_l2 <= w_cnt_conv_l2;
    end 
end

/*-------------------w_cnt_conv_l3--------------------*/
always @ (posedge clk_data or negedge rst_n) begin
    if (!rst_n) begin
        w_cnt_conv_l3 <= 11'd0;
    end else if (layer_type_cur == L_CONV && 
                 st_rd_cur == ST_W_RD && 
                 ddr_vld == 1'b1 && 
                 w_cnt_conv_l1 == 11'd2 && 
                 w_cnt_conv_l2 == 11'd15 &&
                 w_cnt_conv_l3 == 11'd1) begin
        w_cnt_conv_l3 <= 11'd0;
    end else if (layer_type_cur == L_CONV && 
                 st_rd_cur == ST_W_RD && 
                 ddr_vld == 1'b1 && 
                 w_cnt_conv_l1 == 11'd2 && 
                 w_cnt_conv_l2 == 11'd15) begin
        w_cnt_conv_l3 <= w_cnt_conv_l3 + 1'b1;
    end else begin 
        w_cnt_conv_l3 <= w_cnt_conv_l3;
    end
end

wire                            w_op_done_each_conv;
assign w_op_done_each_conv = layer_type_cur == L_CONV && 
                             st_rd_cur == ST_W_RD && 
                             ddr_vld == 1'b1 && 
                             w_cnt_conv_l1 == 11'd2 && 
                             w_cnt_conv_l2 == 11'd15;

reg [10:0]                      bias_cnt_conv_l1;
reg [10:0]                      bias_cnt_conv_l2;

/*-------------------bias_cnt_conv_l1--------------------*/
always @ (posedge clk_data or negedge rst_n) begin
    if (!rst_n) begin
        bias_cnt_conv_l1 <= 11'd0;
    end else if (layer_type_cur == L_CONV && st_rd_cur == ST_BIAS_RD && ddr_vld == 1'b1 && bias_cnt_conv_l1 == 11'd0) begin
        bias_cnt_conv_l1 <= 11'd0;
    end else if (layer_type_cur == L_CONV && st_rd_cur == ST_BIAS_RD && ddr_vld == 1'b1) begin
        bias_cnt_conv_l1 <= bias_cnt_conv_l1 + 1'b1;
    end else begin 
        bias_cnt_conv_l1 <= bias_cnt_conv_l1;
    end
end

/*-------------------bias_cnt_conv_l2--------------------*/
always @ (posedge clk_data or negedge rst_n) begin
    if (!rst_n) begin
        bias_cnt_conv_l2 <= 11'd0;
    end else if (layer_type_cur == L_CONV && st_rd_cur == ST_BIAS_RD && ddr_vld == 1'b1 && bias_cnt_conv_l1 == 11'd3 && bias_cnt_conv_l2 == 11'd1) begin
        bias_cnt_conv_l2 <= 11'd0;
    end else if (layer_type_cur == L_CONV && st_rd_cur == ST_BIAS_RD && ddr_vld == 1'b1 && bias_cnt_conv_l1 == 11'd3) begin
        bias_cnt_conv_l2 <= bias_cnt_conv_l2 + 1'b1;
    end else begin 
        bias_cnt_conv_l2 <= bias_cnt_conv_l2;
    end
end

wire                            bias_op_done_each_conv;
assign bias_op_done_each_conv = layer_type_cur == L_CONV && st_rd_cur == ST_BIAS_RD && ddr_vld == 1'b1;

reg [10:0]                      data_cnt_conv_l1;
reg [10:0]                      data_cnt_conv_l2;
reg [10:0]                      data_cnt_conv_l3;
reg [10:0]                      data_cnt_conv_l4;
reg [10:0]                      data_cnt_conv_l5;
/*-------------------data_cnt_conv_l1--------------------*/
always @ (posedge clk_data or negedge rst_n) begin
    if (!rst_n) begin
        data_cnt_conv_l1 <= 11'd0;
    end else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_vld == 1'b1 && data_cnt_conv_l1 == 11'd2) begin
        data_cnt_conv_l1 <= 11'd0;
    end else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_vld == 1'b1) begin
        data_cnt_conv_l1 <= data_cnt_conv_l1 + 1'b1;
    end else begin 
        data_cnt_conv_l1 <= data_cnt_conv_l1;
    end
end

/*-------------------data_cnt_conv_l2--------------------*/
// always @ (posedge clk_data or negedge rst_n) begin
    // if (!rst_n) begin
        // data_cnt_conv_l2 <= 11'd0;
    // end else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_vld == 1'b1 && data_cnt_conv_l1 == 11'd2 && data_cnt_conv_l2 == 11'd2) begin
        // data_cnt_conv_l2 <= 11'd0;
    // end else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_vld == 1'b1 && data_cnt_conv_l1 == 11'd2) begin
        // data_cnt_conv_l2 <= data_cnt_conv_l2 + 1'b1;
    // end else begin
        // data_cnt_conv_l2 <= data_cnt_conv_l2;
    // end
// end

/*-------------------data_cnt_conv_l3--------------------*/
always @ (posedge clk_data or negedge rst_n) begin
    if (!rst_n) begin
        data_cnt_conv_l3 <= 11'd0;
    end else if (layer_type_cur == L_CONV && 
                 st_rd_cur == ST_DATA_RD && 
                 ddr_vld == 1'b1 && 
                 data_cnt_conv_l1 == 11'd2 && 
                 data_cnt_conv_l3 == pic_size_half_1) begin
        data_cnt_conv_l3 <= 11'd0;
    end else if (layer_type_cur == L_CONV && 
                 st_rd_cur == ST_DATA_RD && 
                 ddr_vld == 1'b1 && 
                 data_cnt_conv_l1 == 11'd2) begin
        data_cnt_conv_l3 <= data_cnt_conv_l3 + 1'b1;
    end else begin 
        data_cnt_conv_l3 <= data_cnt_conv_l3;
    end
end

/*-------------------data_cnt_conv_l4--------------------*/
always @ (posedge clk_data or negedge rst_n) begin
    if (!rst_n) begin
        data_cnt_conv_l4 <= 11'd0;
    end else if (layer_type_cur == L_CONV && 
                 st_rd_cur == ST_DATA_RD && 
                 ddr_vld == 1'b1 && 
                 data_cnt_conv_l1 == 11'd2 && 
                 data_cnt_conv_l3 == pic_size_half_1 && 
                 data_cnt_conv_l4 == pic_size_half_1) begin
        data_cnt_conv_l4 <= 11'd0;
    end else if (layer_type_cur == L_CONV && 
                 st_rd_cur == ST_DATA_RD && 
                 ddr_vld == 1'b1 && 
                 data_cnt_conv_l1 == 11'd2 && 
                 data_cnt_conv_l3 == pic_size_half_1) begin
        data_cnt_conv_l4 <= data_cnt_conv_l4 + 1'b1;
    end else begin 
        data_cnt_conv_l4 <= data_cnt_conv_l4;
    end
end

/*-------------------data_cnt_conv_l5--------------------*/
always @ (posedge clk_data or negedge rst_n) begin
    if (!rst_n) begin
        data_cnt_conv_l5 <= 11'd0;
    end else if (layer_type_cur == L_CONV && 
                 st_rd_cur == ST_DATA_RD && 
                 ddr_vld == 1'b1 && 
                 data_cnt_conv_l1 == 11'd2 && 
                 data_cnt_conv_l3 == pic_size_half_1 && 
                 data_cnt_conv_l4 == pic_size_half_1 && 
                 data_cnt_conv_l5 == 11'd1) begin
        data_cnt_conv_l5 <= 11'd0;
    end else if (layer_type_cur == L_CONV && 
                 st_rd_cur == ST_DATA_RD && 
                 ddr_vld == 1'b1 && 
                 data_cnt_conv_l1 == 11'd2 && 
                 data_cnt_conv_l3 == pic_size_half_1 && 
                 data_cnt_conv_l4 == pic_size_half_1) begin
        data_cnt_conv_l5 <= data_cnt_conv_l5 + 1'b1;
    end else begin 
        data_cnt_conv_l5 <= data_cnt_conv_l5;
    end
end

wire                            data_op_done_each_conv;

assign data_op_done_each_conv = layer_type_cur == L_CONV && 
                                st_rd_cur == ST_DATA_RD && 
                                ddr_vld == 1'b1 && 
                                data_cnt_conv_l1 == 11'd2 && 
                                data_cnt_conv_l3 == pic_size_half_1 && 
                                data_cnt_conv_l4 == pic_size_half_1;
assign conv_all_done = layer_type_cur == L_CONV && 
                       st_rd_cur == ST_DATA_RD && 
                       ddr_vld == 1'b1 && 
                       data_cnt_conv_l1 == 11'd2 && 
                       data_cnt_conv_l3 == pic_size_half_1 && 
                       data_cnt_conv_l4 == pic_size_half_1 && 
                       data_cnt_conv_l5 == 11'd1;

reg [10:0]                      w_cnt_dw_l1;
reg [10:0]                      w_cnt_dw_l2;

/*-------------------w_cnt_dw_l1--------------------*/
always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        w_cnt_dw_l1 <= 11'd0;
    end else if (w_cnt_dw_l1 == 11'd8 && ddr_vld == 1'b1) begin 
        w_cnt_dw_l1 <= 11'd0;
    end else if (layer_type_cur == L_DW && st_rd_cur == ST_W_RD && ddr_vld == 1'b1) begin 
        w_cnt_dw_l1 <= w_cnt_dw_l1 + 1'b1;
    end else begin
        w_cnt_dw_l1 <= w_cnt_dw_l1;
    end
end

/*-------------------w_cnt_dw_l2--------------------*/
always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        w_cnt_dw_l2 <= 11'd0;
    end else if (w_cnt_dw_l2 == co_div_16_1 && w_cnt_dw_l1 == 11'd8 && ddr_vld == 1'b1) begin 
        w_cnt_dw_l2 <= 11'd0;
    end else if (layer_type_cur == L_DW && st_rd_cur == ST_W_RD && w_cnt_dw_l1 == 11'd8 && ddr_vld == 1'b1) begin 
        w_cnt_dw_l2 <= w_cnt_dw_l2 + 1'b1;
    end else begin
        w_cnt_dw_l2 <= w_cnt_dw_l2;
    end
end

wire                            w_op_done_each_dw;
assign w_op_done_each_dw = layer_type_cur == L_DW && st_rd_cur == ST_W_RD && ddr_vld == 1'b1 && w_cnt_dw_l1 == 11'd8;


//-------------------------------------------
reg [10:0]                      bias_cnt_dw_l1;                                                  
reg [10:0]                      bias_cnt_dw_l2;
/*-------------------bias_cnt_dw_l2--------------------*/
always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        bias_cnt_dw_l2 <= 11'd0;
    end else if (ddr_vld == 1'b1 && bias_cnt_dw_l2 == co_div_16_1) begin 
        bias_cnt_dw_l2 <= 11'd0;
    end else if (layer_type_cur == L_DW && st_rd_cur == ST_BIAS_RD && ddr_vld == 1'b1) begin 
        bias_cnt_dw_l2 <= bias_cnt_dw_l2 + 1'b1;
    end else begin 
        bias_cnt_dw_l2 <= bias_cnt_dw_l2;
    end
end

wire                            bias_op_done_each_dw;
assign bias_op_done_each_dw = layer_type_cur == L_DW && st_rd_cur == ST_BIAS_RD && ddr_vld == 1'b1;

reg [10:0]                      data_cnt_dw_l1;
reg [10:0]                      data_cnt_dw_l2;
reg [10:0]                      data_cnt_dw_l3;
reg [10:0]                      data_cnt_dw_l4;

/*-------------------data_cnt_dw_l1--------------------*/
always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        data_cnt_dw_l1 <= 11'd0;
    end else if (data_cnt_dw_l1 == 11'd5   && 
                 ddr_vld == 1'b1) begin 
        data_cnt_dw_l1 <= 11'd0;
    end else if (layer_type_cur == L_DW     && 
                 st_rd_cur == ST_DATA_RD    && 
                 ddr_vld == 1'b1) begin 
        data_cnt_dw_l1 <= data_cnt_dw_l1 + 1'b1;
    end else begin 
        data_cnt_dw_l1 <= data_cnt_dw_l1;
    end
end

/*-------------------data_cnt_dw_l2--------------------*/
always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        data_cnt_dw_l2 <= 11'd0;
    end else if (data_cnt_dw_l1 == 11'd5               && 
                 data_cnt_dw_l2 == pic_size_dw         && 
                 ddr_vld == 1'b1) begin
        data_cnt_dw_l2 <= 11'd0;
    end else if (layer_type_cur == L_DW                && 
                 st_rd_cur == ST_DATA_RD               && 
                 data_cnt_dw_l1 == 11'd5               && 
                 ddr_vld == 1'b1) begin 
        data_cnt_dw_l2 <= data_cnt_dw_l2 + 1'b1;
    end else begin
        data_cnt_dw_l2 <= data_cnt_dw_l2;
    end
end


/*-------------------data_cnt_dw_l3--------------------*/
always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        data_cnt_dw_l3 <= 11'd0;
    end else if (data_cnt_dw_l1 == 11'd5               && 
                 data_cnt_dw_l2 == pic_size_dw         && 
                 data_cnt_dw_l3 == pic_size_quarter_1  &&
                 ddr_vld == 1'b1) begin 
        data_cnt_dw_l3 <= 11'd0;
    end else if (layer_type_cur == L_DW                && 
                 st_rd_cur == ST_DATA_RD               && 
                 data_cnt_dw_l1 == 11'd5               && 
                 data_cnt_dw_l2 == pic_size_dw         && 
                 ddr_vld == 1'b1 ) begin 
        data_cnt_dw_l3 <= data_cnt_dw_l3 + 1'b1;
    end else begin 
        data_cnt_dw_l3 <= data_cnt_dw_l3;
    end
end

wire                            data_op_done_each_dw;
assign data_op_done_each_dw = layer_type_cur == L_DW                &
                              st_rd_cur == ST_DATA_RD               &
                              ddr_vld == 1'b1                       &
                              data_cnt_dw_l1 == 11'd5             &
                              data_cnt_dw_l2 == pic_size_dw          &
                              data_cnt_dw_l3 == pic_size_quarter_1;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        data_cnt_dw_l4 <= 11'd0;
    end else if (ddr_vld == 1'b1                        && 
                 data_cnt_dw_l1 == 11'd5                && 
                 data_cnt_dw_l2 == pic_size_dw          && 
                 data_cnt_dw_l3 == pic_size_quarter_1   && 
                 data_cnt_dw_l4 == ci_div_16_1) begin 
        data_cnt_dw_l4 <= 11'd0;                
    end else if (layer_type_cur == L_DW                 && 
                 st_rd_cur == ST_DATA_RD                && 
                 ddr_vld == 1'b1                        && 
                 data_cnt_dw_l1 == 11'd5                && 
                 data_cnt_dw_l2 == pic_size_dw          && 
                 data_cnt_dw_l3 == pic_size_quarter_1) begin 
        data_cnt_dw_l4 <= data_cnt_dw_l4 + 1'b1;
    end else begin 
        data_cnt_dw_l4 <= data_cnt_dw_l4;
    end
end

assign dw_all_done = layer_type_cur == L_DW                 &
                     st_rd_cur == ST_DATA_RD                &
                     ddr_vld == 1'b1                        &
                     data_cnt_dw_l1 == 11'd5                &
                     data_cnt_dw_l2 == pic_size_dw          &
                     data_cnt_dw_l3 == pic_size_quarter_1   &
                     data_cnt_dw_l4 == ci_div_16_1;

reg [10:0]                      w_cnt_pw_l1;
reg [10:0]                      w_cnt_pw_l2;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        w_cnt_pw_l1 <= 11'b0;
    end else if (/* layer_type_cur == L_PW &&
                 st_rd_cur == ST_W_RD && */
                 ddr_vld == 1'b1 &&
                 w_cnt_pw_l1 == ci_1) begin 
        w_cnt_pw_l1 <= 11'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_W_RD &&
                 ddr_vld == 1'b1) begin 
        w_cnt_pw_l1 <= w_cnt_pw_l1 + 1'b1;
    end else begin 
        w_cnt_pw_l1 <= w_cnt_pw_l1;
    end
end

wire                            w_op_done_each_pw;
assign w_op_done_each_pw = layer_type_cur == L_PW                & 
                           st_rd_cur == ST_W_RD                  & 
                           ddr_vld == 1'b1                       & 
                           w_cnt_pw_l1 == ci_1;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        w_cnt_pw_l2 <= 11'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_W_RD &&
                 ddr_vld == 1'b1 &&
                 w_cnt_pw_l1 == ci_1 &&
                 w_cnt_pw_l2 == co_div_16_1) begin 
        w_cnt_pw_l2 <= 11'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_W_RD &&
                 ddr_vld == 1'b1 &&
                 w_cnt_pw_l1 == ci_1) begin 
        w_cnt_pw_l2 <= w_cnt_pw_l2 + 1'b1;
    end else begin 
        w_cnt_pw_l2 <= w_cnt_pw_l2;
    end
end

reg [10:0]                      bias_cnt_pw_l1;
reg [10:0]                      bias_cnt_pw_l2;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        bias_cnt_pw_l1 <= 11'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_BIAS_RD &&
                 ddr_vld == 1'b1 &&
                 bias_cnt_pw_l1 == 11'd0) begin 
        bias_cnt_pw_l1 <= 11'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_BIAS_RD &&
                 ddr_vld == 1'b1) begin 
        bias_cnt_pw_l1 <= bias_cnt_pw_l1 + 1'b1;
    end else begin 
        bias_cnt_pw_l1 <= bias_cnt_pw_l1;
    end
end

wire                            bias_op_done_each_pw;
assign bias_op_done_each_pw = layer_type_cur == L_PW                & 
                              st_rd_cur == ST_BIAS_RD               & 
                              ddr_vld == 1'b1                       ;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        bias_cnt_pw_l2 <= 11'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_BIAS_RD &&
                 ddr_vld == 1'b1 &&
                 bias_cnt_pw_l1 == 11'd0 &&
                 bias_cnt_pw_l2 == co_div_16_1) begin 
        bias_cnt_pw_l2 <= 11'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_BIAS_RD &&
                 ddr_vld == 1'b1 &&
                 bias_cnt_pw_l1 == 11'd0) begin 
        bias_cnt_pw_l2 <= bias_cnt_pw_l2 + 1'b1;
    end else begin 
        bias_cnt_pw_l2 <= bias_cnt_pw_l2;
    end
end 

reg [ 6:0]                      data_cnt_pw_l1;
reg [15:0]                      data_cnt_pw_l2;
reg [10:0]                      data_cnt_pw_l3;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        data_cnt_pw_l1 <= 7'b0;        
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_DATA_RD &&
                 ddr_vld == 1'b1 &&
                 data_cnt_pw_l1 == ci_div16_sc) begin 
        data_cnt_pw_l1 <= 7'b0;         
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_DATA_RD &&
                 ddr_vld == 1'b1) begin 
        data_cnt_pw_l1 <= data_cnt_pw_l1 + 1'b1;
    end else begin 
        data_cnt_pw_l1 <= data_cnt_pw_l1;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        data_cnt_pw_l2 <= 16'b0;        
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_DATA_RD &&
                 ddr_vld == 1'b1 &&
                 data_cnt_pw_l1 == ci_div16_sc &&
                 data_cnt_pw_l2 == pic2_1) begin 
        data_cnt_pw_l2 <= 16'b0;         
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_DATA_RD &&
                 ddr_vld == 1'b1 && 
                 data_cnt_pw_l1 == ci_div16_sc) begin 
        data_cnt_pw_l2 <= data_cnt_pw_l2 + 1'b1;
    end else begin 
        data_cnt_pw_l2 <= data_cnt_pw_l2;
    end
end

wire                            data_op_done_each_pw;
assign data_op_done_each_pw = layer_type_cur == L_PW                &
                              st_rd_cur == ST_DATA_RD               &
                              ddr_vld == 1'b1                       &
                              data_cnt_pw_l1 == ci_div16_sc         &
                              data_cnt_pw_l2 == pic2_1              ;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        data_cnt_pw_l3 <= 11'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_DATA_RD &&
                 ddr_vld == 1'b1 &&
                 data_cnt_pw_l1 == ci_div16_sc &&
                 data_cnt_pw_l2 == pic2_1      &&
                 data_cnt_pw_l3 == co_div_16_1) begin 
        data_cnt_pw_l3 <= 11'b0;
    end else if (layer_type_cur == L_PW &&
                 st_rd_cur == ST_DATA_RD &&
                 ddr_vld == 1'b1 &&
                 data_cnt_pw_l1 == ci_div16_sc &&
                 data_cnt_pw_l2 == pic2_1) begin 
        data_cnt_pw_l3 <= data_cnt_pw_l3 + 1'b1;
    end else begin 
        data_cnt_pw_l3 <= data_cnt_pw_l3;
    end
end

assign pw_all_done = layer_type_cur == L_PW                &
                     st_rd_cur == ST_DATA_RD               &
                     ddr_vld == 1'b1                       &
                     data_cnt_pw_l1 == ci_div16_sc         &
                     data_cnt_pw_l2 == pic2_1              &
                     data_cnt_pw_l3 == co_div_16_1          ;

wire                            w_op_done_each_avgle;
wire                            b_op_done_each_avgle;
wire                            data_op_done_each_avgle;
reg [10:0]                      w_cnt_avgle;
reg [10:0]                      bias_cnt_avgle;
reg [12:0]                      data_cnt_avgle;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        w_cnt_avgle <= 11'b0;
    end else if (layer_type_cur == L_AVGPL &&
                 st_rd_cur == ST_W_RD      &&
                 ddr_vld == 1'b1           &&
                 w_cnt_avgle == 11'd0) begin 
        w_cnt_avgle <= 11'b0;
    end else if (layer_type_cur == L_AVGPL &&
                 st_rd_cur == ST_W_RD      &&
                 ddr_vld == 1'b1) begin 
        w_cnt_avgle <= w_cnt_avgle + 1'b1;
    end else begin 
        w_cnt_avgle <= w_cnt_avgle;
    end
end

assign w_op_done_each_avgle = layer_type_cur == L_AVGPL &
                              st_rd_cur == ST_W_RD      &
                              ddr_vld == 1'b1           &
                              w_cnt_avgle == 11'd0;
                              
always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        bias_cnt_avgle <= 11'b0;
    end else if (layer_type_cur == L_AVGPL &&
                 st_rd_cur == ST_BIAS_RD   &&
                 ddr_vld == 1'b1           &&
                 bias_cnt_avgle == 11'd0) begin 
        bias_cnt_avgle <= 11'b0;
    end else if (layer_type_cur == L_AVGPL &&
                 st_rd_cur == ST_BIAS_RD   &&
                 ddr_vld == 1'b1) begin 
        bias_cnt_avgle <= bias_cnt_avgle + 1'b1;
    end else begin 
        bias_cnt_avgle <= bias_cnt_avgle;
    end
end

assign b_op_done_each_avgle = layer_type_cur == L_AVGPL &
                              st_rd_cur == ST_BIAS_RD   &
                              ddr_vld == 1'b1           &
                              bias_cnt_avgle == 11'd0;                                

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        data_cnt_avgle <= 11'b0;
    end else if (layer_type_cur == L_AVGPL &&
                 st_rd_cur == ST_DATA_RD   &&
                 ddr_vld == 1'b1           &&
                 data_cnt_avgle == 13'd1279) begin 
        data_cnt_avgle <= 11'b0;
    end else if (layer_type_cur == L_AVGPL &&
                 st_rd_cur == ST_DATA_RD   &&
                 ddr_vld == 1'b1           ) begin 
        data_cnt_avgle <= data_cnt_avgle + 1'b1;
    end else begin 
        data_cnt_avgle <= data_cnt_avgle;
    end
end

assign avgle_all_done = layer_type_cur == L_AVGPL &
                        st_rd_cur == ST_DATA_RD   &
                        ddr_vld == 1'b1           &
                        data_cnt_avgle == 13'd1279;

// reg [1:0]                       st_rd_cur;
/*-------------------st_rd_cur--------------------*/
always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        st_rd_cur <= 2'd0;
    end else if (w_op_done_each_conv || w_op_done_each_dw || w_op_done_each_pw || w_op_done_each_avgle) begin
        st_rd_cur <= ST_BIAS_RD;
    end else if (bias_op_done_each_conv || bias_op_done_each_dw || bias_op_done_each_pw || b_op_done_each_avgle) begin
        st_rd_cur <= ST_DATA_RD;
    end else if (data_op_done_each_conv || data_op_done_each_dw || data_op_done_each_pw || avgle_all_done) begin
        st_rd_cur <= ST_W_RD;
    end 
        
    else begin 
        st_rd_cur <= st_rd_cur;
    end
end

//-------------------------------------------
// 输出vld 控制
//-------------------------------------------
// reg                  data_out_vld,
// reg                  w_out_vld,
// reg                  sc_out_vld,
// reg                  bias_out_vld,
// reg [127:0]          data_out,
/*-------------------w_out_vld--------------------*/
always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        w_out_vld <= 1'b0;
    end else if (st_rd_cur == ST_W_RD && ddr_vld == 1'b1) begin
        w_out_vld <= 1'b1;
    end else begin
        w_out_vld <= 1'b0;
    end
end

/*-------------------sc_out_vld--------------------*/
always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        sc_out_vld <= 1'b0;
    end else if (layer_sc_vld == 1'b1 && st_rd_cur == ST_DATA_RD && 
                 ddr_vld == 1'b1 && data_cnt_pw_l1 == 0) begin
        sc_out_vld <= 1'b1;
    end else begin
        sc_out_vld <= 1'b0;
    end
end

/*-------------------bias_out_vld--------------------*/
always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        bias_out_vld <= 1'b0;
    end else if (st_rd_cur == ST_BIAS_RD && ddr_vld == 1'b1) begin
        bias_out_vld <= 1'b1;
    end else begin
        bias_out_vld <= 1'b0;
    end
end

/*-------------------data_out_vld--------------------*/
always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        data_out_vld <= 1'b0;
    end else if (layer_sc_vld == 1'b1 && st_rd_cur == ST_DATA_RD && 
                 ddr_vld == 1'b1 && data_cnt_pw_l1 > 0) begin 
        data_out_vld <= 1'b1;
    end else if (layer_sc_vld == 1'b0 && st_rd_cur == ST_DATA_RD && 
                 ddr_vld == 1'b1) begin
        data_out_vld <= 1'b1;
    end else begin
        data_out_vld <= 1'b0;
    end
end


/*-------------------data_out--------------------*/
always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        data_out 	  <= 0;
		w_out		  <= 0;
		sc_out		  <= 0;
		bias_out	  <= 0;
    end else if (ddr_vld == 1'b1) begin
        data_out      <= ddr_data_out;
		w_out 	      <= ddr_data_out;
		sc_out 	      <= ddr_data_out;
		bias_out      <= ddr_data_out;
    end else begin
        data_out 	  <= 0;
		w_out		  <= 0;
		sc_out		  <= 0;
		bias_out	  <= 0;
    end
end



//-------------------------------------------
// reg                             flag_initial;
// always @ (posedge clk_data or negedge rst_n)
// begin
    // if(!rst_n) begin
        // flag_initial <= 1'b0;
    // end
    // else if (ddr_vld == 1'b1 && layer_type_cur == L_CONV && w_cnt_conv_l1 == 11'd0 && w_cnt_conv_l2 == 11'd0 && w_cnt_conv_l3 == 11'd0) begin
        // flag_initial <= 1'b1;
    // end
// end

// always @ (posedge clk_data or negedge rst_n)
// begin
    // if(!rst_n) begin
        // mode_change <= 1'b0;
    // end
    // else if (ddr_vld == 1'b1 && layer_type_cur == L_CONV && w_cnt_conv_l1 == 11'd0 && w_cnt_conv_l2 == 11'd0 && w_cnt_conv_l3 == 11'd0 && flag_initial == 1'b0) begin
        // mode_change <= 1'b1;
    // end
    // else if (ddr_vld == 1'b1 && layer_type_cur == L_CONV && conv_all_done == 1'b1) begin
        // mode_change <= 1'b1;
    // end
    // else begin
        // mode_change <= 1'b0;
    // end
// end

// always @ (posedge clk_data or negedge rst_n)
// begin
    // if(!rst_n) begin
        // op_mode <= 2'b0;
    // end
    // else if (layer_type_cur == L_PW_SC) begin
        // op_mode <= L_PW[1:0];
    // end
    // else begin
        // op_mode <= layer_type_cur[1:0];
    // end
// end

// always @ (posedge clk_data or negedge rst_n)
// begin
    // if(!rst_n) begin
        // channel_size <= 11'd0;
    // end
    // else begin
        // channel_size <= c_size_i[layer_num_cur];
    // end
// end


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
             
always @ (posedge clk_data) begin 
    pic2 <= pic_size * pic_size;
    pic2_1 <= pic2 - 1'b1;
    ci_div16 <= c_size_i[layer_num_cur][3:0] ? c_size_i[layer_num_cur][10:4]+1'b1 : c_size_i[layer_num_cur][10:4];
    ci_div16_sc <= ci_div_16_1[6:0] + layer_sc_vld;
    pic2_ci_div4_sc <= pic2 * ci_div16_sc;
    pw_data_cnt_num <= pic2_ci_div4_sc - 1'b1;
end

always @ (posedge clk_data or negedge rst_n) begin
    if (!rst_n) begin
        pic_size_1          <= 11'd0;
        pic_size_dw         <= 11'd0;
        pic_size_quarter_1  <= 11'd0;
        pic_size_half_1     <= 11'd0;
        ci_quarter_1        <= 11'd0;
    end else begin
        pic_size_1          <= pic_size - 1'b1;
        pic_size_dw         <= pic_size + 1'b1;
        pic_size_quarter_1  <= pic_size[7:2] - 1'b1;
        pic_size_half_1     <= pic_size[7:1] - 1'b1;
        ci_quarter_1        <= {2'b0, c_size_i[layer_num_cur][10:2]} - 1'b1;
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
        ci_1        <= 11'b0;
    end else if (c_size_i[layer_num_cur][3:0] == 4'd0) begin 
        ci_div_16_1 <= {4'b0, c_size_i[layer_num_cur][10:4]} - 1'b1;
        ci_1        <= c_size_i[layer_num_cur] - 1'b1;
    end else begin 
        ci_div_16_1 <= {4'b0, c_size_i[layer_num_cur][10:4]};
        ci_1        <= {c_size_i[layer_num_cur][10:4]+1'b1, 4'b0} - 1'b1;
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
assign s_value[ 0] = 1'd0; assign s_value[18] = 1'd0; assign s_value[36] = 1'd0;
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
