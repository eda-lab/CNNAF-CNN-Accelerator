module rd_pw_f_addr_gen(
    input                   clk             ,    
    
    input                   sc_vld          ,
    input [25:0]            pw_f_base       ,
    input [25:0]            sc_base         ,
    input [ 6:0]            bl_size         ,
    input [ 6:0]            co_div16        ,
    input [14:0]            pic_co_div16    ,
    
    input [13:0]            data_pw_en_cnt  ,
    input [ 6:0]            pw_f_cnt_l1     ,
    input [ 6:0]            pw_f_cnt_l2     ,
    input [ 6:0]            pw_f_cnt_l3     ,
    input [ 6:0]            pw_f_cnt_l4     ,
    
    output reg [25:0]       pw_f_addr       
);

//pw = data_pw_en_cnt * ci_div16
//pw_sc = 

reg                         pw_addr_type; // 0:sc_mode, 1:f_mode
reg [1:0]                   pw_addr_type_r;

always @ (posedge clk) begin 
    if (sc_vld == 1'b1 && pw_f_cnt_l1 == 11'd0) begin 
        pw_addr_type <= 1'b0;
    end else begin 
        pw_addr_type <= 1'b1;
    end
end

always @ (posedge clk) begin 
    pw_addr_type_r <= {pw_addr_type_r[0], pw_addr_type};
end

/*pw_f_addr*/
//一级流水线
reg [23:0]                  pw_f_addr_add;
reg [25:0]                  pw_f_base_r;

always @ (posedge clk) begin 
    pw_f_addr_add <= data_pw_en_cnt * bl_size;
    pw_f_base_r <= pw_f_base;
end

//二级流水线
reg [25:0]                  pw_f_addr_p;

always @ (posedge clk) begin 
    pw_f_addr_p <= pw_f_addr_add + pw_f_base_r;
end

//三级流水
reg [25:0]                  pw_f_addr_r;

always @ (posedge clk) begin 
    pw_f_addr_r <= pw_f_addr_p;
end

/*pw_sc_addr*/
//一级流水线
reg [13:0]                  pw_sc_addr_part1; //cnt_2 * co / 16
reg [21:0]                  pw_sc_addr_part2; //cnt_3 * co / 16 * pic_size
reg [10:0]                  pw_sc_addr_part3; //cnt_4 * 16
reg [25:0]                  sc_base_r;


always @ (posedge clk) begin 
    pw_sc_addr_part1 <= pw_f_cnt_l2 * co_div16;
    pw_sc_addr_part2 <= pw_f_cnt_l3 * pic_co_div16;
    pw_sc_addr_part3 <= pw_f_cnt_l4;
    sc_base_r        <= sc_base;
end

//二级流水线
reg [22:0]                  pw_sc_addr_add1;
reg [25:0]                  pw_sc_addr_add2;

always @ (posedge clk) begin 
    pw_sc_addr_add1 <= pw_sc_addr_part1 + pw_sc_addr_part2;
    pw_sc_addr_add2 <= pw_sc_addr_part3 + sc_base_r;
end

//三级流水线
reg [25:0]                   pw_sc_addr_p;

always @ (posedge clk) begin 
    pw_sc_addr_p <= pw_sc_addr_add1 + pw_sc_addr_add2;
end

/*pw_addr_out*/
always @ (posedge clk) begin 
    if (pw_addr_type_r[1] == 1'b0) begin 
        pw_f_addr <= pw_sc_addr_p;
    end else begin 
        pw_f_addr <= pw_f_addr_r;
    end
end

endmodule 
