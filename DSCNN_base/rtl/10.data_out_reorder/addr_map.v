module addr_map
    #(parameter BANDWIDTH=512,
                BITWIDTH=32)(
    input                               clk_calc,
    input                               rst_n,

    input [BITWIDTH*16-1:0]             data_in,
    input                               data_in_vld,
    output reg                          last_slice_vld,
    
    output reg                          net_all_finish,
    output reg                          calc_res_vld,
    output reg [BITWIDTH*16-1:0]        calc_res,      
    output reg                          ddr_wr_ins_vld,
    output reg [BITWIDTH*16+26+7+1-1:0] ddr_wr_ins
);

//-------------------------------------------
// regs & wires & parameters
//-------------------------------------------
parameter PW2DW    = 3'd0;
parameter DW2PW    = 3'd1;
parameter PW2PW    = 3'd2;
parameter AVG2PW   = 3'd3;
parameter PW2OUT   = 3'd4;

reg [7:0]                       pic_size;
reg [10:0]                      c_size;

reg [7:0]                       pic_size_1;
reg [10:0]                      pic_size_quarter_1;
reg [10:0]                      pic_size_quarter_S;
reg [10:0]                      co_div_16_1;
reg [10:0]                      co_quarter_1;
reg [10:0]                      dw2pw_reorder_cnt_1_num;
reg [10:0]                      dw2pw_reorder_cnt_row_num;

wire [2:0]                      layer_type[53:0];
wire                            s_value[53:0];
wire [10:0]                     c_size_i[54:0];
wire [25:0]                     data_base[54:0];

wire                            reorder_en;

//-------------------------------------------
// layer_num_cur
//-------------------------------------------
reg [2:0]                       layer_type_cur;
reg [6:0]                       layer_num_cur;  
reg                             layer_avgle_en; 
reg                             layer_wait_en;  
reg                             pw2pw_last_slice_vld;
reg                             dw2pw_last_slice_vld;
reg                             avg2pw_last_slice_vld;

always @ (posedge clk_calc or negedge rst_n) begin 
	if (!rst_n) begin 
		layer_type_cur <= 3'd0;
        layer_avgle_en <= 1'b0;
	end else begin 
        layer_type_cur <= layer_type[layer_num_cur];
        layer_avgle_en <= layer_type[layer_num_cur] == AVG2PW;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        layer_wait_en <= 1'b0;
    end else if (layer_num_cur == 53) begin 
        layer_wait_en <= 1'b0;
    end else begin 
        layer_wait_en <= layer_type[layer_num_cur] == PW2DW ? 1'b0 : 1'b1;
    end
end

reg                             pw2dw_reorder_finish;
reg                             dw2pw_reorder_finish;
reg                             pw2pw_reorder_finish;
reg                             avg2pw_reorder_finish;
reg                             net_all_finish_r1;
reg                             net_all_finish_r2;
reg                             net_all_finish_r3;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        layer_num_cur <= 7'd0;
    end else begin 
        case (layer_type_cur)
            PW2DW : begin 
                if (pw2dw_reorder_finish == 1'b1) begin 
                    layer_num_cur <= layer_num_cur + 1'b1;
                end else begin 
                    layer_num_cur <= layer_num_cur;
                end
            end
            DW2PW : begin 
                if (dw2pw_reorder_finish == 1'b1) begin 
                    layer_num_cur <= layer_num_cur + 1'b1;
                end else begin 
                    layer_num_cur <= layer_num_cur;
                end
            end
            PW2PW : begin 
                if (pw2pw_reorder_finish == 1'b1 && layer_num_cur == 53) begin 
                    layer_num_cur <= 7'd0;
                end else if (pw2pw_reorder_finish == 1'b1) begin 
                    layer_num_cur <= layer_num_cur + 1'b1;
                end else begin 
                    layer_num_cur <= layer_num_cur;
                end
            end
            AVG2PW : begin 
                if (avg2pw_reorder_finish == 1'b1) begin 
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

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        net_all_finish_r1 <= 1'b0;
    end else if (pw2pw_reorder_finish == 1'b1 && layer_num_cur == 53) begin 
        net_all_finish_r1 <= 1'b1;
    end else begin 
        net_all_finish_r1 <= 1'b0;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        net_all_finish_r2 <= 1'b0;
        net_all_finish_r3 <= 1'b0;
    end else begin 
        net_all_finish_r2 <= net_all_finish_r1;
        net_all_finish_r3 <= net_all_finish_r2;
    end
end 

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        net_all_finish <= 1'b0; 
    end else if (net_all_finish_r1 == 1'b1) begin 
        net_all_finish <= 1'b1;
    end else begin 
        net_all_finish <= 1'b0;
    end
end 

//-------------------------------------------
// handshake signal for ddr control
//-------------------------------------------
wire                            fifo_rd_hs;
assign fifo_rd_hs = data_in_vld;


//-------------------------------------------
// PW2dW 
//-------------------------------------------
reg [10:0]                      pw2dw_reorder_cnt_col;
reg [10:0]                      pw2dw_reorder_cnt_row;
reg [10:0]                      pw2dw_reorder_cnt_chan;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        pw2dw_reorder_cnt_col <= 11'b0;
    end else if (layer_type_cur == PW2DW &&  
                 fifo_rd_hs == 1'b1 && 
                 pw2dw_reorder_cnt_col == pic_size_1) begin 
        pw2dw_reorder_cnt_col <= 11'b0;
    end else if (layer_type_cur == PW2DW && 
                 fifo_rd_hs == 1'b1) begin 
        pw2dw_reorder_cnt_col <= pw2dw_reorder_cnt_col + 1'b1;
    end else begin 
        pw2dw_reorder_cnt_col <= pw2dw_reorder_cnt_col;
    end
end 

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        pw2dw_reorder_cnt_row <= 11'b0;
    end else if (layer_type_cur == PW2DW && 
                 fifo_rd_hs == 1'b1 && 
                 pw2dw_reorder_cnt_col == pic_size_1 && 
                 pw2dw_reorder_cnt_row == pic_size_1) begin 
        pw2dw_reorder_cnt_row <= 11'b0;
    end else if (layer_type_cur == PW2DW && 
                 fifo_rd_hs == 1'b1 && 
                 pw2dw_reorder_cnt_col == pic_size_1) begin 
        pw2dw_reorder_cnt_row <= pw2dw_reorder_cnt_row + 1'b1;
    end else begin 
        pw2dw_reorder_cnt_row <= pw2dw_reorder_cnt_row;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        pw2dw_reorder_cnt_chan <= 11'b0;
    end else if (layer_type_cur == PW2DW && 
                 fifo_rd_hs == 1'b1 && 
                 pw2dw_reorder_cnt_col == pic_size_1 && 
                 pw2dw_reorder_cnt_row == pic_size_1 && 
                 pw2dw_reorder_cnt_chan == co_div_16_1) begin 
        pw2dw_reorder_cnt_chan <= 11'b0;       
    end else if (layer_type_cur == PW2DW && 
                 fifo_rd_hs == 1'b1 && 
                 pw2dw_reorder_cnt_col == pic_size_1 && 
                 pw2dw_reorder_cnt_row == pic_size_1) begin 
        pw2dw_reorder_cnt_chan <= pw2dw_reorder_cnt_chan + 1'b1;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        pw2dw_reorder_finish <= 1'b0;
    end else begin 
        pw2dw_reorder_finish <= layer_type_cur == PW2DW & 
                                fifo_rd_hs == 1'b1 & 
                                pw2dw_reorder_cnt_col == pic_size_1 & 
                                pw2dw_reorder_cnt_row == pic_size_1 & 
                                pw2dw_reorder_cnt_chan == co_div_16_1;
    end
end

//-------------------------------------------
// DW2PW 
//-------------------------------------------
reg [ 2:0]                      dw2pw_reorder_cnt_1;
reg [10:0]                      dw2pw_reorder_cnt_col;
reg [10:0]                      dw2pw_reorder_cnt_row;
reg [10:0]                      dw2pw_reorder_cnt_chan;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        dw2pw_reorder_cnt_1 <= 11'b0;
    end else if (layer_type_cur == DW2PW &&
                 fifo_rd_hs == 1'b1 &&
                 dw2pw_reorder_cnt_1 == dw2pw_reorder_cnt_1_num) begin 
        dw2pw_reorder_cnt_1 <= 11'b0;
    end else if (layer_type_cur == DW2PW &&
                 fifo_rd_hs == 1'b1) begin 
        dw2pw_reorder_cnt_1 <= dw2pw_reorder_cnt_1 + 1'b1;            
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        dw2pw_reorder_cnt_col <= 11'b0;
    end else if (layer_type_cur == DW2PW && 
                 fifo_rd_hs == 1'b1 &&
                 dw2pw_reorder_cnt_1 == dw2pw_reorder_cnt_1_num && 
                 dw2pw_reorder_cnt_col == pic_size_1) begin 
        dw2pw_reorder_cnt_col <= 11'b0;
    end else if (layer_type_cur == DW2PW && 
                 fifo_rd_hs == 1'b1 &&
                 dw2pw_reorder_cnt_1 == dw2pw_reorder_cnt_1_num) begin 
        dw2pw_reorder_cnt_col <= dw2pw_reorder_cnt_col + 1'b1;     
    end else begin 
        dw2pw_reorder_cnt_col <= dw2pw_reorder_cnt_col;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        dw2pw_reorder_cnt_row <= 11'b0;
    end else if (layer_type_cur == DW2PW && 
                 fifo_rd_hs == 1'b1 &&
                 dw2pw_reorder_cnt_1 == dw2pw_reorder_cnt_1_num && 
                 dw2pw_reorder_cnt_col == pic_size_1 &&
                 dw2pw_reorder_cnt_row == pic_size_quarter_S) begin 
        dw2pw_reorder_cnt_row <= 11'b0;
    end else if (layer_type_cur == DW2PW && 
                 fifo_rd_hs == 1'b1 &&
                 dw2pw_reorder_cnt_1 == dw2pw_reorder_cnt_1_num && 
                 dw2pw_reorder_cnt_col == pic_size_1) begin 
        dw2pw_reorder_cnt_row <= dw2pw_reorder_cnt_row + 1'b1;     
    end else begin 
        dw2pw_reorder_cnt_row <= dw2pw_reorder_cnt_row;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        dw2pw_reorder_cnt_chan <= 11'b0;
    end else if (layer_type_cur == DW2PW &&  
                 fifo_rd_hs == 1'b1 &&
                 dw2pw_reorder_cnt_1 == dw2pw_reorder_cnt_1_num && 
                 dw2pw_reorder_cnt_col == pic_size_1 &&
                 dw2pw_reorder_cnt_row == pic_size_quarter_S &&
                 dw2pw_reorder_cnt_chan == co_div_16_1) begin 
        dw2pw_reorder_cnt_chan <= 11'b0;
    end else if (layer_type_cur == DW2PW && 
                 fifo_rd_hs == 1'b1 &&
                 dw2pw_reorder_cnt_1 == dw2pw_reorder_cnt_1_num && 
                 dw2pw_reorder_cnt_col == pic_size_1 &&
                 dw2pw_reorder_cnt_row == pic_size_quarter_S) begin 
        dw2pw_reorder_cnt_chan <= dw2pw_reorder_cnt_chan + 1'b1;
    end else begin 
        dw2pw_reorder_cnt_chan <= dw2pw_reorder_cnt_chan;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        dw2pw_reorder_finish <= 1'b0;
    end else begin 
        dw2pw_reorder_finish <= layer_type_cur == DW2PW & 
                                fifo_rd_hs == 1'b1 & 
                                dw2pw_reorder_cnt_1 == dw2pw_reorder_cnt_1_num && 
                                dw2pw_reorder_cnt_col == pic_size_1 & 
                                dw2pw_reorder_cnt_row == pic_size_quarter_S & 
                                dw2pw_reorder_cnt_chan == co_div_16_1;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        dw2pw_last_slice_vld <= 1'b0;
    end else if (fifo_rd_hs == 1'b1 && dw2pw_reorder_cnt_chan == co_div_16_1 && dw2pw_reorder_cnt_col == 0) begin 
        dw2pw_last_slice_vld <= 1'b1;
    end else begin 
        dw2pw_last_slice_vld <= 1'b0;
    end
end

//-------------------------------------------
// PW2PW 
//-------------------------------------------
reg [10:0]                      pw2pw_reorder_cnt_col;
reg [10:0]                      pw2pw_reorder_cnt_row;
reg [10:0]                      pw2pw_reorder_cnt_chan;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        pw2pw_reorder_cnt_col <= 11'b0;
    end else if (layer_type_cur == PW2PW &&
                 fifo_rd_hs == 1'b1 &&
                 pw2pw_reorder_cnt_col == pic_size_1) begin 
        pw2pw_reorder_cnt_col <= 11'b0;
    end else if (layer_type_cur == PW2PW && 
                 fifo_rd_hs == 1'b1) begin 
        pw2pw_reorder_cnt_col <= pw2pw_reorder_cnt_col + 1'b1;
    end else begin 
        pw2pw_reorder_cnt_col <= pw2pw_reorder_cnt_col;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        pw2pw_reorder_cnt_row <= 11'b0;
    end else if (layer_type_cur == PW2PW &&
                 fifo_rd_hs == 1'b1 &&
                 pw2pw_reorder_cnt_col == pic_size_1 &&
                 pw2pw_reorder_cnt_row == pic_size_1) begin 
        pw2pw_reorder_cnt_row <= 11'b0;
    end else if (layer_type_cur == PW2PW &&
                 fifo_rd_hs == 1'b1 &&
                 pw2pw_reorder_cnt_col == pic_size_1) begin 
        pw2pw_reorder_cnt_row <= pw2pw_reorder_cnt_row + 1'b1;
    end else begin 
        pw2pw_reorder_cnt_row <= pw2pw_reorder_cnt_row;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        pw2pw_reorder_cnt_chan <= 11'b0;
    end else if (layer_type_cur == PW2PW &&
                 fifo_rd_hs == 1'b1 &&
                 pw2pw_reorder_cnt_col == pic_size_1 &&
                 pw2pw_reorder_cnt_row == pic_size_1 &&
                 pw2pw_reorder_cnt_chan == co_div_16_1) begin 
        pw2pw_reorder_cnt_chan <= 11'b0;
    end else if (layer_type_cur == PW2PW &&
                 fifo_rd_hs == 1'b1 &&
                 pw2pw_reorder_cnt_col == pic_size_1 &&
                 pw2pw_reorder_cnt_row == pic_size_1) begin 
        pw2pw_reorder_cnt_chan <= pw2pw_reorder_cnt_chan + 1'b1;
    end else begin 
        pw2pw_reorder_cnt_chan <= pw2pw_reorder_cnt_chan;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        pw2pw_reorder_finish <= 1'b0;
    end else begin 
        pw2pw_reorder_finish <= layer_type_cur == PW2PW &
                                fifo_rd_hs == 1'b1 &
                                pw2pw_reorder_cnt_col == pic_size_1 &
                                pw2pw_reorder_cnt_row == pic_size_1 &
                                pw2pw_reorder_cnt_chan == co_div_16_1;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        pw2pw_last_slice_vld <= 1'b0;
    end else if (layer_num_cur != 53 &&
                 fifo_rd_hs == 1'b1 &&
                 pw2pw_reorder_cnt_chan == co_div_16_1) begin 
        pw2pw_last_slice_vld <= 1'b1;
    end else begin 
        pw2pw_last_slice_vld <= 1'b0;
    end
end

//-------------------------------------------
// AVG2PW 
//-------------------------------------------
reg [10:0]                      avg2pw_reorder_cnt;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        avg2pw_reorder_cnt <= 11'd0;
    end else if (layer_type_cur == AVG2PW &&
                 fifo_rd_hs == 1'b1 &&
                 avg2pw_reorder_cnt == co_div_16_1) begin 
        avg2pw_reorder_cnt <= 11'd0;
    end else if (layer_type_cur == AVG2PW &&
                 fifo_rd_hs == 1'b1) begin 
        avg2pw_reorder_cnt <= avg2pw_reorder_cnt + 1'b1;
    end else begin 
        avg2pw_reorder_cnt <= avg2pw_reorder_cnt;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        avg2pw_reorder_finish <= 1'b0;
    end else if (layer_type_cur == AVG2PW &&
                 fifo_rd_hs == 1'b1 &&
                 avg2pw_reorder_cnt == co_div_16_1) begin 
        avg2pw_reorder_finish <= 1'b1;
    end else begin 
        avg2pw_reorder_finish <= 1'b0;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        avg2pw_last_slice_vld <= 1'b0;
    end else if (layer_type_cur == AVG2PW &&
                 fifo_rd_hs == 1'b1 &&
                 avg2pw_reorder_cnt == co_div_16_1) begin 
        avg2pw_last_slice_vld <= 1'b1;
    end else begin 
        avg2pw_last_slice_vld <= 1'b0;
    end
end

reg [3:0]                       last_slice_vld_r;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        last_slice_vld_r <= 4'b0;
        last_slice_vld <= 1'b0;
    end else begin 
        last_slice_vld_r <= {last_slice_vld_r[2:0], (pw2pw_last_slice_vld | dw2pw_last_slice_vld | avg2pw_last_slice_vld)};
        last_slice_vld <= last_slice_vld_r[3];
    end
end

reg [2:0]                       layer_type_cur_L         ;
reg                             reorder_half_en_L        ;
reg                             reorder_stride2_en_L     ;  
reg                             layer_avgle_en_L         ;                    
reg [25:0]                      base_addr_L              ;

reg [7:0]                       pic_size_L               ;
reg [15:0]                      pic_square_L             ;
reg [19:0]                      pic2_16_L                ;
reg [ 6:0]                      co_div16_L               ;
reg [14:0]                      co_div16_pic_L           ;
// reg [16:0]                      co_pic_L                 ;


always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        layer_type_cur_L        <= 3'b0;
        reorder_half_en_L       <= 1'b0;
        reorder_stride2_en_L    <= 1'b0;
        layer_avgle_en_L        <= 1'b0;
        base_addr_L             <= 26'b0;
        pic_size_L              <= 8'b0;
        pic_square_L            <= 16'b0;
        pic2_16_L               <= 20'b0;
        co_div16_L              <= 7'b0;
        // co_L                    <= 11'b0;
        co_div16_pic_L          <= 15'b0;
        // co_pic_L                <= 19'b0;
    end else begin 
        layer_type_cur_L        <= layer_type_cur;
        reorder_half_en_L       <= c_size == 11'd24 & pw2pw_reorder_cnt_chan == 11'd1;
        reorder_stride2_en_L    <= s_value[layer_num_cur];
        layer_avgle_en_L        <= layer_avgle_en;
        base_addr_L             <= data_base[layer_num_cur+1];
        pic_size_L              <= pic_size;
        pic_square_L            <= pic_size*pic_size;
        pic2_16_L               <= {pic_square_L,4'b0};
        co_div16_L              <= c_size[3:0] ? c_size[10:4]+1'b1 : c_size[10:4];
        // co_L                    <= c_size;
        co_div16_pic_L          <= co_div16_L*pic_size;
        // co_pic_L                <= c_size*pic_size;
    end
end


reg [ 6:0]                      pw2dw_reorder_cnt_col_L  ;
reg [ 6:0]                      pw2dw_reorder_cnt_row_L  ;
reg [10:0]                      pw2dw_reorder_cnt_chan_L ;
reg [ 2:0]                      dw2pw_reorder_cnt_1_L    ;
reg [ 6:0]                      dw2pw_reorder_cnt_col_L  ;
reg [ 5:0]                      dw2pw_reorder_cnt_row_L  ;
reg [10:0]                      dw2pw_reorder_cnt_chan_L ;
reg [ 6:0]                      pw2pw_reorder_cnt_col_L  ;
reg [ 6:0]                      pw2pw_reorder_cnt_row_L  ;
reg [ 6:0]                      pw2pw_reorder_cnt_chan_L ;
reg [10:0]                      avg2pw_reorder_cnt_L     ;

always @ (posedge clk_calc) begin 
    pw2dw_reorder_cnt_col_L  <= pw2dw_reorder_cnt_col[6:0]  ;
    pw2dw_reorder_cnt_row_L  <= pw2dw_reorder_cnt_row[6:0]  ;
    pw2dw_reorder_cnt_chan_L <= pw2dw_reorder_cnt_chan      ;
    dw2pw_reorder_cnt_1_L    <= dw2pw_reorder_cnt_1         ;
    dw2pw_reorder_cnt_col_L  <= dw2pw_reorder_cnt_col[6:0]  ;
    dw2pw_reorder_cnt_row_L  <= dw2pw_reorder_cnt_row[5:0]  ;
    dw2pw_reorder_cnt_chan_L <= dw2pw_reorder_cnt_chan      ;  
    pw2pw_reorder_cnt_col_L  <= pw2pw_reorder_cnt_col[6:0]  ;
    pw2pw_reorder_cnt_row_L  <= pw2pw_reorder_cnt_row[6:0]  ;
    pw2pw_reorder_cnt_chan_L <= pw2pw_reorder_cnt_chan[6:0] ;    
    avg2pw_reorder_cnt_L     <= avg2pw_reorder_cnt          ;
end

wire [25:0]                     pw2dw_reorder_addr;
wire [25:0]                     dw2pw_reorder_addr;
wire [25:0]                     pw2pw_reorder_addr;
wire [25:0]                     avg2pw_reorder_addr;

pw2dw_reorder_addr_gen pw2dw_reorder_addr_gen(
    /*input             */.clk_calc            (clk_calc                    ),
                            
    /*input [27:0]      */.base_addr           (base_addr_L                 ),
    /*input [ 7:0]      */.pic_size            (pic_size_L                  ),
    /*input [15:0]      */.pic_square          (pic_square_L                ),
                        
    /*input [ 4:0]      */.col_cnt             (pw2dw_reorder_cnt_col[6:0]  ),
    /*input [ 5:0]      */.row_cnt             (pw2dw_reorder_cnt_row[6:0]  ),
    /*input [10:0]      */.chan_cnt            (pw2dw_reorder_cnt_chan      ),
                        
    /*output reg [27:0] */.pw2dw_reorder_addr  (pw2dw_reorder_addr          )
);

dw2pw_reorder_addr_gen dw2pw_reorder_addr_gen(
    /*input             */.clk_calc            (clk_calc                    ),
    
    /*input             */.dw_stride           (reorder_stride2_en_L        ),
    /*input [27:0]      */.base_addr           (base_addr_L                 ),
    // /*input [10:0]      */.su_cnt              (su_cnt                      ),
    // /*input [10:0]      */.channel             (co_L                        ),
    /*input [ 8:0]      */.co_div16            (co_div16_L                  ),
    /*input [16:0]      */.co_div16_pic        (co_div16_pic_L              ),
    // /*input [18:0]      */.channel_pic         (co_pic_L                     ),

    /*input [ 2:0]      */.cnt_1               (dw2pw_reorder_cnt_1         ),
    /*input [ 4:0]      */.col_cnt             (dw2pw_reorder_cnt_col[6:0]  ),
    /*input [ 4:0]      */.row_cnt             (dw2pw_reorder_cnt_row[5:0]  ),
    /*input [10:0]      */.chan_cnt            (dw2pw_reorder_cnt_chan      ),

    /*output reg [25:0] */.dw2pw_reorder_addr  (dw2pw_reorder_addr          )
);

pw2pw_reorder_addr_gen pw2pw_reorder_addr_gen(
    /*input             */.clk_calc            (clk_calc                    ),
        
    /*input [27:0]      */.base_addr           (base_addr_L                 ),
    /*input [ 8:0]      */.co_div16            (co_div16_L                      ),
    /*input [16:0]      */.co_div16_pic        (co_div16_pic_L                  ),

    /*input [ 4:0]      */.col_cnt             (pw2pw_reorder_cnt_col[6:0]  ),
    /*input [ 5:0]      */.row_cnt             (pw2pw_reorder_cnt_row[6:0]  ),
    /*input [10:0]      */.chan_cnt            (pw2pw_reorder_cnt_chan[6:0] ),

    /*output reg [27:0] */.pw2pw_reorder_addr  (pw2pw_reorder_addr          )
);

avg2pw_reorder_addr_gen avg2pw_reorder_addr_gen(
    /*input             */.clk_calc            (clk_calc                ),

    /*input [27:0]      */.base_addr           (base_addr_L             ),
    /*input [10:0]      */.avg2pw_cnt          (avg2pw_reorder_cnt      ),

    /*output reg [27:0] */.avg2pw_reorder_addr (avg2pw_reorder_addr     )
);

//-------------------------------------------
//-------------------------------------------
reg                             fifo_wr_per_layer_finish; //not used because hard to use
reg [BITWIDTH*16-1:0]           fifo_wr_data_part;
reg [25:0]                      fifo_wr_addr_part;
reg [6:0]                       fifo_wr_bl_part;

//layer finish delay
reg                             fifo_wr_per_layer_finish_p;
reg [2:0]                       fifo_wr_per_layer_finish_r;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_wr_per_layer_finish_p <= 1'b0;
    end else if (pw2dw_reorder_finish || dw2pw_reorder_finish || pw2pw_reorder_finish || avg2pw_reorder_finish) begin 
        fifo_wr_per_layer_finish_p <= 1'b1;
    end else begin 
        fifo_wr_per_layer_finish_p <= 1'b0;
    end
end

always @ (posedge clk_calc) begin 
    fifo_wr_per_layer_finish_r <= {fifo_wr_per_layer_finish_r[1:0], fifo_wr_per_layer_finish_p};
    fifo_wr_per_layer_finish <= fifo_wr_per_layer_finish_r[1];
end

reg [BITWIDTH*16-1:0]           reorder_data_part_p;

//data
always @ (posedge clk_calc) begin 
    reorder_data_part_p <= data_in;
end

reg [BITWIDTH*16-1:0]           reorder_data_part_r1;
reg [BITWIDTH*16-1:0]           reorder_data_part_r2;
reg [BITWIDTH*16-1:0]           reorder_data_part_r3;
always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        reorder_data_part_r1 <= 0;
        reorder_data_part_r2 <= 0;
        reorder_data_part_r3 <= 0;
        fifo_wr_data_part    <= 0;
    end else begin 
        reorder_data_part_r1 <= reorder_data_part_p ;
        reorder_data_part_r2 <= reorder_data_part_r1;
        reorder_data_part_r3 <= reorder_data_part_r2;
        fifo_wr_data_part    <= reorder_data_part_r3;
    end
end

reg [2:0]                       layer_type_cur_l_r1      ;
reg [2:0]                       layer_type_cur_l_r2      ;
reg [2:0]                       layer_type_cur_l_r3      ;
always @ (posedge clk_calc) begin 
    layer_type_cur_l_r1 <= layer_type_cur_L     ;
    layer_type_cur_l_r2 <= layer_type_cur_l_r1  ;
    layer_type_cur_l_r3 <= layer_type_cur_l_r2  ;
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_wr_addr_part <= 0;
    end else begin 
        case (layer_type_cur_l_r3)
            PW2DW :  begin 
                fifo_wr_addr_part <= pw2dw_reorder_addr;
            end
            DW2PW : begin 
                fifo_wr_addr_part <= dw2pw_reorder_addr;
            end
            PW2PW : begin 
                fifo_wr_addr_part <= pw2pw_reorder_addr;
            end
            AVG2PW : begin 
                fifo_wr_addr_part <= avg2pw_reorder_addr;
            end
            default : begin 
                fifo_wr_addr_part <= 0;
            end
        endcase
    end
end

reg [6:0]                       fifo_wr_bl_part_p;
reg [6:0]                       fifo_wr_bl_part_r1;
reg [6:0]                       fifo_wr_bl_part_r2;
reg [6:0]                       fifo_wr_bl_part_r3;

always @ (posedge clk_calc or negedge rst_n) begin
    if(!rst_n) begin
        fifo_wr_bl_part_p <= 7'b0;
    end else if (data_in_vld == 1'b1 && layer_type_cur == PW2DW && layer_num_cur != 51) begin 
        fifo_wr_bl_part_p <= 7'd32;
    end else if (data_in_vld == 1'b1) begin 
        fifo_wr_bl_part_p <= 7'd1;
    end else begin
        fifo_wr_bl_part_p <= 7'b0;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_wr_bl_part_r1 <= 0;
        fifo_wr_bl_part_r2 <= 0;
        fifo_wr_bl_part_r3 <= 0;
        fifo_wr_bl_part    <= 0;
    end else begin 
        fifo_wr_bl_part_r1 <= fifo_wr_bl_part_p ;
        fifo_wr_bl_part_r2 <= fifo_wr_bl_part_r1;
        fifo_wr_bl_part_r3 <= fifo_wr_bl_part_r2;
        fifo_wr_bl_part    <= fifo_wr_bl_part_r3;        
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        ddr_wr_ins_vld <= 0;
        ddr_wr_ins     <= 0;
    end else if (fifo_wr_bl_part > 7'd0) begin 
        ddr_wr_ins_vld <= 1'b1;
        ddr_wr_ins     <= {fifo_wr_per_layer_finish, fifo_wr_data_part, fifo_wr_addr_part, fifo_wr_bl_part};
    end else begin 
        ddr_wr_ins_vld <= 0;
        ddr_wr_ins     <= 0;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        calc_res_vld <= 0;
        calc_res <= 0;        
    end else if (layer_num_cur == 7'd53) begin 
        calc_res_vld <= fifo_rd_hs;
        calc_res <= data_in;
    end
end


//layer type
assign layer_type[0]  = PW2DW;    assign layer_type[18] = PW2DW;     assign layer_type[36] = PW2DW;
assign layer_type[1]  = DW2PW;    assign layer_type[19] = DW2PW;     assign layer_type[37] = DW2PW;
assign layer_type[2]  = PW2PW;    assign layer_type[20] = PW2PW;     assign layer_type[38] = PW2PW;

assign layer_type[3] = PW2DW;     assign layer_type[21] = PW2DW;     assign layer_type[39] = PW2DW;
assign layer_type[4] = DW2PW;     assign layer_type[22] = DW2PW;     assign layer_type[40] = DW2PW;
assign layer_type[5] = PW2PW;     assign layer_type[23] = PW2PW;     assign layer_type[41] = PW2PW;

assign layer_type[6] = PW2DW;     assign layer_type[24] = PW2DW;     assign layer_type[42] = PW2DW;
assign layer_type[7] = DW2PW;     assign layer_type[25] = DW2PW;     assign layer_type[43] = DW2PW;
assign layer_type[8] = PW2PW;     assign layer_type[26] = PW2PW;     assign layer_type[44] = PW2PW;

assign layer_type[9 ] = PW2DW;    assign layer_type[27] = PW2DW;     assign layer_type[45] = PW2DW;
assign layer_type[10] = DW2PW;    assign layer_type[28] = DW2PW;     assign layer_type[46] = DW2PW;
assign layer_type[11] = PW2PW;    assign layer_type[29] = PW2PW;     assign layer_type[47] = PW2PW;

assign layer_type[12] = PW2DW;    assign layer_type[30] = PW2DW;     assign layer_type[48] = PW2DW;
assign layer_type[13] = DW2PW;    assign layer_type[31] = DW2PW;     assign layer_type[49] = DW2PW;
assign layer_type[14] = PW2PW;    assign layer_type[32] = PW2PW;     assign layer_type[50] = PW2PW;

assign layer_type[15] = PW2DW;    assign layer_type[33] = PW2DW;     assign layer_type[51] = PW2DW;
assign layer_type[16] = DW2PW;    assign layer_type[34] = DW2PW;     assign layer_type[52] = AVG2PW;
assign layer_type[17] = PW2PW;    assign layer_type[35] = PW2PW;     assign layer_type[53] = PW2PW;

//stride
assign s_value[ 0] = 1'd0; assign s_value[ 1] = 1'd0; assign s_value[ 2] = 1'd0;
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

reg [7:0]           pic_size_next;

always @ (posedge clk_calc or negedge rst_n) begin
    if (!rst_n) begin
        pic_size <= 8'd128;
    end else begin
        pic_size <= pic_size_next;
    end
end

always @ (*) begin
    case (layer_num_cur+1)
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
    c_size <= c_size_i[layer_num_cur+1];
end

always @ (posedge clk_calc) begin 
    pic_size_1 <= pic_size - 1'b1;
    co_quarter_1 <= {2'b0, c_size[10:2]} - 1'b1;
    pic_size_quarter_S <= reorder_stride2_en_L ? {5'b0, pic_size[6:1]}-1'b1 : {6'b0, pic_size[6:2]}-1'b1;
end

always @ (posedge clk_calc) begin 
    if (pic_size[6:2] == 5'b0) begin 
        pic_size_quarter_1 <= 11'b0; 
        
    end else begin 
        pic_size_quarter_1 <= {6'b0 ,pic_size[6:2]} - 1'b1; 
    end 
end 
 
always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        co_div_16_1 <= 11'b0;
    end /* else if (layer_num_cur == 11'd53) begin 
        co_div_16_1 <= 11'd15;
    end  */else if (c_size_i[layer_num_cur+1][3:0] == 4'd0) begin 
        co_div_16_1 <= {4'b0, c_size_i[layer_num_cur+1][10:4]} - 1'b1;
    end else begin 
        co_div_16_1 <= {4'b0, c_size_i[layer_num_cur+1][10:4]};
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        dw2pw_reorder_cnt_1_num <= 11'b0; 
        dw2pw_reorder_cnt_row_num <= 11'b0;
    end else if (reorder_stride2_en_L) begin 
        dw2pw_reorder_cnt_1_num <= 11'd1; 
        dw2pw_reorder_cnt_row_num <= {6'b0 ,pic_size[5:1]} - 1'b1; 
    end else begin 
        dw2pw_reorder_cnt_1_num <= 11'd3; 
        dw2pw_reorder_cnt_row_num <= {5'b0 ,pic_size[6:2]} - 1'b1; 
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

//data_base
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
                                         assign data_base[54] = 26'd1149680  ;                                   


endmodule

