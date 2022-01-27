module w_rd_ctrl
    #(parameter BANDWIDTH=512,
                BITWIDTH=32)(
    
    input                       clk_data,
    input                       rst_n,
    
    input                       w_in_vld,
    input [BANDWIDTH-1:0]       w_in,
    
    output reg                  w_read_per_dw_slice_done,
    output reg [7:0]            w_read_dw_addr,
    
    output reg                  w_read_per_slice_done,
    output reg [15:0]           ram_w_wr_en,
    output reg [7:0]            ram_w_wr_addr,
    output [BITWIDTH*16*16-1:0] ram_w_wr_data_all
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

wire [2:0]                      layer_type[53:0];
wire [6:0]                      pic_size_thre_128;
wire [6:0]                      pic_size_thre_64;
wire [6:0]                      pic_size_thre_32;
wire [6:0]                      pic_size_thre_16;
wire [6:0]                      pic_size_thre_8 ;
wire [6:0]                      pic_size_thre_4 ; 

reg  [6:0]                      ci_div_16_1;
reg  [10:0]                     c_size_i_quarter_1;
wire [10:0]                     c_size_i[54:0];
wire                            s_value[53:0];
reg 							conv_per_done;
reg                             conv_all_done;
reg 							dw_per_done;
reg                             dw_all_done;
reg 							pw_per_done;
reg                             pw_all_done;
reg                             avgle_all_done;
reg [7:0]                       pic_size;
reg [10:0]                      ci_div_8_1;
reg [10:0]                      co_div_16_1;

reg                             w_read_per_slice_done_reg[1:0];
reg                             w_read_per_slice_done_p;
reg [2:0]                       w_read_per_slice_done_r;

wire [BITWIDTH*7-1:0]           dw_data_zero;
wire [BITWIDTH-1:0]             weight_1;
assign dw_data_zero = 0;
assign weight_1 = 32'h3F800000;

reg                             w_in_vld_r  /*synthesis preserve*/;
reg [BANDWIDTH-1:0]             w_in_r1     /*synthesis preserve*/;
reg [BANDWIDTH-1:0]             w_in_r2     /*synthesis preserve*/;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        w_in_vld_r <= 0;
        w_in_r1    <= 0;
        w_in_r2    <= 0;
    end else begin 
        w_in_vld_r <= w_in_vld;
        w_in_r1    <= w_in;
        w_in_r2    <= w_in;
    end
end


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

reg [6:0]                       conv_w_cnt_l1;
reg [6:0]                       conv_w_cnt_l2;
reg [6:0]                       conv_w_cnt_l3;
reg [6:0]                       conv_w_cnt_l4;

always @ (posedge clk_data or negedge rst_n)
begin
    if(!rst_n) begin
        conv_w_cnt_l1 <= 7'd0;
    end else if (layer_type_cur == L_CONV && w_in_vld_r == 1'b1 && conv_w_cnt_l1 == 7'd2) begin
        conv_w_cnt_l1 <= 7'd0;
    end else if (layer_type_cur == L_CONV && w_in_vld_r == 1'b1) begin
        conv_w_cnt_l1 <= conv_w_cnt_l1 + 1'b1;
    end else begin 
        conv_w_cnt_l1 <= conv_w_cnt_l1;
    end
end

reg                             conv_temp_rd_vld;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        conv_temp_rd_vld <= 1'b0;
    end else if (layer_type_cur == L_CONV && w_in_vld_r == 1'b1) begin 
        conv_temp_rd_vld <= 1'b1;
    end else begin 
        conv_temp_rd_vld <= 1'b0;
    end
end

// always @ (posedge clk_data or negedge rst_n)
// begin
    // if(!rst_n) begin
        // conv_w_cnt_l2 <= 7'd0;
    // end else if (layer_type_cur == L_CONV && w_in_vld_r == 1'b1 && conv_w_cnt_l1 == 7'd2 && conv_w_cnt_l2 == 7'd2) begin
        // conv_w_cnt_l2 <= 7'd0;
    // end else if (layer_type_cur == L_CONV && w_in_vld_r == 1'b1 && conv_w_cnt_l1 == 7'd2) begin
        // conv_w_cnt_l2 <= conv_w_cnt_l2 + 1'b1;
    // end else begin 
        // conv_w_cnt_l2 <= conv_w_cnt_l2;
    // end
// end

always @ (posedge clk_data or negedge rst_n)
begin
    if(!rst_n) begin
        conv_w_cnt_l3 <= 7'd0;
    end else if (layer_type_cur == L_CONV && 
                 w_in_vld_r == 1'b1 && 
                 conv_w_cnt_l1 == 7'd2 && 
                 conv_w_cnt_l3 == 7'd15) begin
        conv_w_cnt_l3 <= 7'd0;
    end else if (layer_type_cur == L_CONV && 
                 w_in_vld_r == 1'b1 && 
                 conv_w_cnt_l1 == 7'd2) begin
        conv_w_cnt_l3 <= conv_w_cnt_l3 + 1'b1;
    end else begin 
        conv_w_cnt_l3 <= conv_w_cnt_l3;
    end
end

always @ (posedge clk_data or negedge rst_n)
begin
    if(!rst_n) begin
        conv_w_cnt_l4 <= 7'd0;
    end else if (layer_type_cur == L_CONV && 
                 w_in_vld_r == 1'b1 && 
                 conv_w_cnt_l1 == 7'd2 && 
                 conv_w_cnt_l3 == 7'd15 && 
                 conv_w_cnt_l4 == 7'd1) begin
        conv_w_cnt_l4 <= 7'd0;
    end else if (layer_type_cur == L_CONV && 
                 w_in_vld_r == 1'b1 && 
                 conv_w_cnt_l1 == 7'd2 && 
                 conv_w_cnt_l3 == 7'd15) begin
        conv_w_cnt_l4 <= conv_w_cnt_l4 + 1'b1;
    end else begin 
        conv_w_cnt_l4 <= conv_w_cnt_l4;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        conv_per_done <= 1'b0;
    end else if (layer_type_cur == L_CONV && 
                 w_in_vld_r == 1'b1 && 
                 conv_w_cnt_l1 == 7'd2 && 
                 conv_w_cnt_l3 == 7'd15) begin 
        conv_per_done <= 1'b1;
    end else begin 
        conv_per_done <= 1'b0;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        conv_all_done <= 1'b0;
    end else if (layer_type_cur == L_CONV && 
                 w_in_vld_r == 1'b1 && 
                 conv_w_cnt_l1 == 7'd2 && 
                 conv_w_cnt_l3 == 7'd15 && 
                 conv_w_cnt_l4 == 11'd1) begin 
        conv_all_done <= 1'b1;
    end else begin 
        conv_all_done <= 1'b0;
    end
end

reg [BITWIDTH*9-1:0]                conv_temp_all;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        conv_temp_all <= 0;
    end else begin 
        conv_temp_all <= w_in_r1[BITWIDTH*9-1:0];
    end
end

reg [6:0]                       dw_w_cnt_l1;
reg [6:0]                       dw_w_cnt_l2;
always @ (posedge clk_data or negedge rst_n)
begin
    if(!rst_n) begin
        dw_w_cnt_l1 <= 7'd0;
    end else if (layer_type_cur == L_DW && w_in_vld_r == 1'b1 && dw_w_cnt_l1 == 7'd8) begin
        dw_w_cnt_l1 <= 7'd0;
    end else if (layer_type_cur == L_DW && w_in_vld_r == 1'b1) begin
        dw_w_cnt_l1 <= dw_w_cnt_l1 + 1'b1;
    end else begin 
        dw_w_cnt_l1 <= dw_w_cnt_l1;
    end
end

reg                             dw_temp_rd_vld;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        dw_temp_rd_vld <= 1'b0;
    end else if (layer_type_cur == L_DW && w_in_vld_r == 1'b1 && dw_w_cnt_l1 == 7'd8) begin 
        dw_temp_rd_vld <= 1'b1;
    end else begin 
        dw_temp_rd_vld <= 1'b0;
    end
end

always @ (posedge clk_data or negedge rst_n)
begin
    if(!rst_n) begin
        dw_w_cnt_l2 <= 11'd0;
    end
    else if (layer_type_cur == L_DW && w_in_vld_r == 1'b1 && dw_w_cnt_l1 == 7'd8 && dw_w_cnt_l2 == ci_div_16_1) begin
        dw_w_cnt_l2 <= 11'd0;
    end
    else if (layer_type_cur == L_DW && w_in_vld_r == 1'b1 && dw_w_cnt_l1 == 7'd8) begin
        dw_w_cnt_l2 <= dw_w_cnt_l2 + 1'b1;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        dw_per_done <= 1'b0;
    end else if (layer_type_cur == L_DW && w_in_vld_r == 1'b1 && dw_w_cnt_l1 == 11'd8) begin 
        dw_per_done <= 1'b1;
    end else begin 
        dw_per_done <= 1'b0;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        dw_all_done <= 1'b0;
    end else if (layer_type_cur == L_DW && w_in_vld_r == 1'b1 && dw_w_cnt_l1 == 11'd8 && dw_w_cnt_l2 == ci_div_16_1) begin 
        dw_all_done <= 1'b1;
    end else begin 
        dw_all_done <= 1'b0;
    end
end

reg [BANDWIDTH*8-1:0]                 dw_temp;
always @ (posedge clk_data or negedge rst_n)
begin
    if(!rst_n) begin
        dw_temp <= 0;
    end
    else if (layer_type_cur == L_DW && w_in_vld_r == 1'b1) begin
        dw_temp <= {w_in_r1, dw_temp[BANDWIDTH*8-1:BANDWIDTH]};
    end
end

reg [BANDWIDTH*9-1:0]                 dw_temp_all;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        dw_temp_all <= 0;
    end else begin 
        dw_temp_all <= {w_in_r2, dw_temp};
    end
end

// reg [6:0]                      pw_w_cnt_l1;
reg [6:0]                      pw_w_cnt_l2;
reg [6:0]                      pw_w_cnt_l3;
reg [6:0]                      pw_w_cnt_l4;
// always @ (posedge clk_data or negedge rst_n)
// begin
    // if(!rst_n) begin
        // pw_w_cnt_l1 <= 7'd0;
    // end else if (layer_type_cur == L_PW && w_in_vld_r == 1'b1 && pw_w_cnt_l1 == 7'd1) begin
        // pw_w_cnt_l1 <= 7'd0;
    // end else if (layer_type_cur == L_PW && w_in_vld_r == 1'b1) begin
        // pw_w_cnt_l1 <= pw_w_cnt_l1 + 1'b1;
    // end
// end

reg                             pw_temp_rd_vld;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        pw_temp_rd_vld <= 1'b0;
    end else if (layer_type_cur == L_PW && w_in_vld_r == 1'b1) begin 
        pw_temp_rd_vld <= 1'b1;
    end else begin 
        pw_temp_rd_vld <= 1'b0;
    end
end

always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        pw_w_cnt_l2 <= 11'd0;
    end else if (layer_type_cur == L_PW && 
                 w_in_vld_r == 1'b1 && 
                 pw_w_cnt_l2 == ci_div_16_1) begin
        pw_w_cnt_l2 <= 11'd0;
    end else if (layer_type_cur == L_PW && 
                 w_in_vld_r == 1'b1) begin
        pw_w_cnt_l2 <= pw_w_cnt_l2 + 1'b1;
    end
end

always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        pw_w_cnt_l3 <= 11'd0;
    end else if (layer_type_cur == L_PW && 
                 w_in_vld_r == 1'b1 && 
                 pw_w_cnt_l2 == ci_div_16_1 && 
                 pw_w_cnt_l3 == 11'd15) begin
        pw_w_cnt_l3 <= 11'd0;
    end else if (layer_type_cur == L_PW && 
                 w_in_vld_r == 1'b1 && 
                 pw_w_cnt_l2 == ci_div_16_1) begin
        pw_w_cnt_l3 <= pw_w_cnt_l3 + 1'b1;
    end else begin 
        pw_w_cnt_l3 <= pw_w_cnt_l3;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        pw_w_cnt_l4 <= 11'b0;
    end else if (layer_type_cur == L_PW && 
                 w_in_vld_r == 1'b1 && 
                 //pw_w_cnt_l1 == 11'd1 && 
                 pw_w_cnt_l2 == ci_div_16_1 && 
                 pw_w_cnt_l3 == 11'd15 && 
                 pw_w_cnt_l4 == co_div_16_1) begin 
        pw_w_cnt_l4 <= 11'b0;
    end else if (layer_type_cur == L_PW && 
                 w_in_vld_r == 1'b1 && 
                 //pw_w_cnt_l1 == 11'd1 && 
                 pw_w_cnt_l2 == ci_div_16_1 && 
                 pw_w_cnt_l3 == 11'd15) begin 
        pw_w_cnt_l4 <= pw_w_cnt_l4 + 1'b1;
    end else begin 
        pw_w_cnt_l4 <= pw_w_cnt_l4;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        pw_per_done <= 1'b0;
    end else if (layer_type_cur == L_PW &&
                 w_in_vld_r == 1'b1 && 
                 //pw_w_cnt_l1 == 11'd1 && 
                 pw_w_cnt_l2 == ci_div_16_1 && 
                 pw_w_cnt_l3 == 11'd15) begin 
        pw_per_done <= 1'b1;
    end else begin 
        pw_per_done <= 1'b0;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        pw_all_done <= 1'b0;
    end else if (layer_type_cur == L_PW && 
                 w_in_vld_r == 1'b1 && 
                 //pw_w_cnt_l1 == 11'd1 && 
                 pw_w_cnt_l2 == ci_div_16_1 && 
                 pw_w_cnt_l3 == 11'd15 && 
                 pw_w_cnt_l4 == co_div_16_1) begin 
        pw_all_done <= 1'b1;
    end else begin 
        pw_all_done <= 1'b0;
    end
end

reg [BANDWIDTH-1:0]                   pw_temp_all;
always @ (posedge clk_data or negedge rst_n) begin
    if(!rst_n) begin
        pw_temp_all <= 0;
    end else if (layer_type_cur == L_PW && w_in_vld_r == 1'b1) begin
        pw_temp_all <= w_in_r1;
    end 
end

// reg [128*2-1:0]                pw_temp_all;
// always @ (posedge clk_data or negedge rst_n) begin 
    // if (!rst_n) begin 
        // pw_temp_all <= 256'b0;
    // end else begin 
        // pw_temp_all <= {w_in_r2, pw_temp};
    // end
// end

reg [10:0]                      avgle_w_cnt;
reg                             avgle_temp_rd_vld;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        avgle_w_cnt <= 11'b0;
    end else if (layer_type_cur == L_AVGPL && w_in_vld_r == 1'b1 && avgle_w_cnt == 11'd0) begin 
        avgle_w_cnt <= 11'b0;
    end else if (layer_type_cur == L_AVGPL && w_in_vld_r == 1'b1) begin 
        avgle_w_cnt <= avgle_w_cnt + 1'b1;
    end else begin 
        avgle_w_cnt <= avgle_w_cnt;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        avgle_all_done <= 1'b0;
    end else if (layer_type_cur == L_AVGPL && w_in_vld_r == 1'b1) begin 
        avgle_all_done <= 1'b1;
    end else begin 
        avgle_all_done <= 1'b0;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        avgle_temp_rd_vld <= 1'b0;
    end else if (layer_type_cur == L_AVGPL && w_in_vld_r == 1'b1) begin 
        avgle_temp_rd_vld <= 1'b1;
    end else begin 
        avgle_temp_rd_vld <= 1'b0;
    end
end

reg						conv_ram_w_selec; 
reg                     pw_ram_w_selec;

always @ (posedge clk_data or negedge rst_n)
begin
	if(!rst_n) begin
		conv_ram_w_selec <= 1'b0;
	end
	else if (conv_per_done == 1'b1) begin
		conv_ram_w_selec <= ~conv_ram_w_selec;
	end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        pw_ram_w_selec <= 1'b0;
    end else if (pw_per_done == 1'b1) begin 
        pw_ram_w_selec <= ~pw_ram_w_selec;
    end
end

reg [7:0]                       conv_w_ram_cache_addr;
reg [7:0]                       dw_w_ram_cache_addr;
reg [7:0]                       pw_w_ram_cache_addr;

always @ (posedge clk_data) begin 
    if (conv_ram_w_selec == 1'b0) begin 
        conv_w_ram_cache_addr <= {1'b0, conv_w_cnt_l1[6:0]};
    end else begin 
        conv_w_ram_cache_addr <= {1'b0, conv_w_cnt_l1[6:0]} + 8'd3;
    end
end

always @ (posedge clk_data) begin 
    //避免dw和pw起冲突，将dw的权重存放在96,97
    dw_w_ram_cache_addr <= 8'd160 + dw_w_cnt_l2; 
end

always @ (posedge clk_data) begin 
    pw_w_ram_cache_addr <= pw_ram_w_selec ? 8'd80 + pw_w_cnt_l2 : pw_w_cnt_l2;
end

reg [10:0]                      conv_w_cnt_l3_r;
reg [10:0]                      pw_w_cnt_l3_r;
always @ (posedge clk_data) begin 
    conv_w_cnt_l3_r <= conv_w_cnt_l3;
    pw_w_cnt_l3_r <= pw_w_cnt_l3;
end
   
//reg [287:0]                     ram_w_wr_data[15:0];
reg [32*16*16-1:0]               ram_w_wr_data;
genvar i;

generate
    for(i = 0; i < 16; i = i + 1) begin : ram_wr_en_gen

        always @ (posedge clk_data or negedge rst_n)
        begin
            if(!rst_n) begin
                ram_w_wr_en[i] <= 1'b0;
            end
            else if (conv_temp_rd_vld == 1'b1 && conv_w_cnt_l3_r == i[10:0]) begin
                ram_w_wr_en[i] <= 1'b1;
            end
            else if (dw_temp_rd_vld == 1'b1) begin
                ram_w_wr_en[i] <= 1'b1;
            end
            else if (pw_temp_rd_vld == 1'b1 && pw_w_cnt_l3_r == i[10:0]) begin
                ram_w_wr_en[i] <= 1'b1;
            end
            else if (avgle_temp_rd_vld == 1'b1) begin
                ram_w_wr_en[i] <= 1'b1;
            end
            else begin
                ram_w_wr_en[i] <= 1'b0;
            end
        end   
    end
endgenerate

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        ram_w_wr_data <= 0;
    end else begin 
        case ({conv_temp_rd_vld, dw_temp_rd_vld, pw_temp_rd_vld, avgle_temp_rd_vld})
            4'b1000 : begin 
                ram_w_wr_data <= {16{dw_data_zero, conv_temp_all}};
            end
            4'b0100 : begin 
                ram_w_wr_data <= {{dw_data_zero, dw_temp_all[BITWIDTH*9*16-1:BITWIDTH*9*15]},
                                  {dw_data_zero, dw_temp_all[BITWIDTH*9*15-1:BITWIDTH*9*14]}, 
                                  {dw_data_zero, dw_temp_all[BITWIDTH*9*14-1:BITWIDTH*9*13]}, 
                                  {dw_data_zero, dw_temp_all[BITWIDTH*9*13-1:BITWIDTH*9*12]}, 
                                  {dw_data_zero, dw_temp_all[BITWIDTH*9*12-1:BITWIDTH*9*11]}, 
                                  {dw_data_zero, dw_temp_all[BITWIDTH*9*11-1:BITWIDTH*9*10]}, 
                                  {dw_data_zero, dw_temp_all[BITWIDTH*9*10-1:BITWIDTH*9*9 ]}, 
                                  {dw_data_zero, dw_temp_all[BITWIDTH*9*9 -1:BITWIDTH*9*8 ]}, 
                                  {dw_data_zero, dw_temp_all[BITWIDTH*9*8 -1:BITWIDTH*9*7 ]}, 
                                  {dw_data_zero, dw_temp_all[BITWIDTH*9*7 -1:BITWIDTH*9*6 ]}, 
                                  {dw_data_zero, dw_temp_all[BITWIDTH*9*6 -1:BITWIDTH*9*5 ]}, 
                                  {dw_data_zero, dw_temp_all[BITWIDTH*9*5 -1:BITWIDTH*9*4 ]}, 
                                  {dw_data_zero, dw_temp_all[BITWIDTH*9*4 -1:BITWIDTH*9*3 ]}, 
                                  {dw_data_zero, dw_temp_all[BITWIDTH*9*3 -1:BITWIDTH*9*2 ]}, 
                                  {dw_data_zero, dw_temp_all[BITWIDTH*9*2 -1:BITWIDTH*9*1 ]}, 
                                  {dw_data_zero, dw_temp_all[BITWIDTH*9*1 -1:BITWIDTH*9*0 ]}};
            end
            4'b0010 : begin 
                ram_w_wr_data <= {16{pw_temp_all}};
            end
            4'b0001 : begin 
                ram_w_wr_data <= {256{32'h3D7FFFFF}};
            end
            default : begin 
                ram_w_wr_data <= 0;
            end
        endcase
    end
end 

assign ram_w_wr_data_all = ram_w_wr_data;

always @ (posedge clk_data or negedge rst_n)
begin
    if(!rst_n) begin
        ram_w_wr_addr <= 8'b0;
    end else begin 
        case ({conv_temp_rd_vld, dw_temp_rd_vld, pw_temp_rd_vld, avgle_temp_rd_vld})
            4'b1000 : begin 
                ram_w_wr_addr <= conv_w_ram_cache_addr;
            end
            4'b0100 : begin 
                ram_w_wr_addr <= dw_w_ram_cache_addr;
            end
            4'b0010 : begin 
                ram_w_wr_addr <= pw_w_ram_cache_addr;
            end
            4'b0001 : begin 
                ram_w_wr_addr <= 8'd200;
            end
            default : begin 
                ram_w_wr_addr <= 8'd0;
            end
        endcase
    end
end 

reg                             w_read_per_dw_slice_done_p;
reg [7:0]                       w_read_dw_addr_p;

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        w_read_per_dw_slice_done_p <= 1'b0;
    end else if (layer_type_cur == L_DW && ram_w_wr_en[0] == 1'b1) begin 
        w_read_per_dw_slice_done_p <= 1'b1;
    end else begin 
        w_read_per_dw_slice_done_p <= 1'b0;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        w_read_per_dw_slice_done <= 1'b0;
    end else begin 
        w_read_per_dw_slice_done <= w_read_per_dw_slice_done_p | (layer_type_cur == L_DW && ram_w_wr_en[0] == 1'b1);
    end
end

always @ (posedge clk_data) begin 
    if (layer_type_cur == L_DW &&  ram_w_wr_en[0] == 1'b1) begin 
        w_read_dw_addr_p <= ram_w_wr_addr;
    end else begin 
        w_read_dw_addr_p <= 0;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        w_read_dw_addr <= 0;
    end else if (layer_type_cur == L_DW && ram_w_wr_en[0] == 1'b1) begin 
        w_read_dw_addr <= ram_w_wr_addr;
    end else begin 
        w_read_dw_addr <= w_read_dw_addr_p;
    end
end
 

// generate
    // for(i = 0; i < 16; i = i + 1) begin : w_data_wr_comb
        // assign ram_w_wr_data_all[288*i+287 : 288*i] = ram_w_wr_data[i];
    // end
// endgenerate

// w_read_per_slice_done

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        w_read_per_slice_done_reg[0] <= 1'b0;
        w_read_per_slice_done_reg[1] <= 1'b0;
    end else begin 
        w_read_per_slice_done_reg[0] <= conv_per_done | dw_per_done | pw_per_done | avgle_all_done;
        w_read_per_slice_done_reg[1] <= w_read_per_slice_done_reg[0];
    end 
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        w_read_per_slice_done_p <= 1'b0;
    end else if (w_read_per_slice_done_reg[0] == 1'b1 || w_read_per_slice_done_reg[1] == 1'b1) begin 
        w_read_per_slice_done_p <= 1'b1;
    end else begin 
        w_read_per_slice_done_p <= 1'b0;
    end
end

always @ (posedge clk_data or negedge rst_n) begin 
    if (!rst_n) begin 
        w_read_per_slice_done_r <= 3'b0;
        w_read_per_slice_done   <= 1'b0;
    end else begin 
        w_read_per_slice_done_r <= {w_read_per_slice_done_r[1:0], w_read_per_slice_done_p};
        w_read_per_slice_done   <= w_read_per_slice_done_r[0];
    end
end
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


assign pic_size_thre_128 = 7'd0;
assign pic_size_thre_64  = 7'd4;
assign pic_size_thre_32  = 7'd10;
assign pic_size_thre_16  = 7'd19;
assign pic_size_thre_8   = 7'd40;
assign pic_size_thre_4   = 7'd52; 

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
        c_size_i_quarter_1 <= 11'b0;
        ci_div_8_1         <= 11'd0; 
    end else begin 
        c_size_i_quarter_1 <= c_size_i[layer_num_cur][10:2] - 1'b1;
        ci_div_8_1         <= {3'b0, c_size_i[layer_num_cur][10:3]} - 1'b1;
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
        ci_div_16_1 <= 7'b0;
    end else if (c_size_i[layer_num_cur][3:0] == 4'd0) begin 
        ci_div_16_1 <= c_size_i[layer_num_cur][10:4] - 1'b1;
    end else begin 
        ci_div_16_1 <= c_size_i[layer_num_cur][10:4];
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