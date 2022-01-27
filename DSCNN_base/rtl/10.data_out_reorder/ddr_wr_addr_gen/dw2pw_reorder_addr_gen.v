module dw2pw_reorder_addr_gen(
    input                   clk_calc            ,
    
    input                   dw_stride           ,
    input [25:0]            base_addr           ,
    // input [10:0]            channel             ,
    input [ 6:0]            co_div16           ,
    input [14:0]            co_div16_pic       ,
    // input [18:0]            channel_pic         ,
    
    input [ 2:0]            cnt_1               ,        
    input [ 6:0]            col_cnt             ,
    input [ 5:0]            row_cnt             ,
    input [10:0]            chan_cnt            ,
    
    output reg [25:0]       dw2pw_reorder_addr  
);

//stride = 1
//dw2pw_reorder_addr = cnt_1*co_div16                                  +
//                     col_cnt*co_div16*pic_size                       +
//                     row_cnt*co_div16*pic_size*4                     +
//                     chan_cnt                                         +
//                     base_addr
//stride = 2
//dw2pw_reorder_addr = cnt_1*co_div16                         +
//                     col_cnt*co_div16*pic_size                               +
//                     row_cnt*co_div16*pic_size*2                     +
//                     chan_cnt                                         +
//                     base_addr

//一级
reg [ 9:0]                  Cnt1_MulCoq         ;
reg [21:0]                  Col_MulCoq_pic      ;
reg [12:0]                  Row_MulCoq          ;
reg [25:0]                  Chan_AddBase        ;
reg                         dw_stride_r         ;

always @ (posedge clk_calc) begin 
    Cnt1_MulCoq     <= cnt_1 * co_div16        ;
    Col_MulCoq_pic  <= col_cnt * co_div16_pic  ;
    Row_MulCoq      <= row_cnt * co_div16      ;
    Chan_AddBase    <= chan_cnt + base_addr    ;
    dw_stride_r     <= dw_stride;
end

//二级
reg [22:0]                  Cnt1_MulCoq_AddCol_MulCoq_pic;
reg [25:0]                  Chan_AddBase_r;
reg [14:0]                  Row_MulCoq_r;

always @ (posedge clk_calc) begin 
    Cnt1_MulCoq_AddCol_MulCoq_pic  <= Cnt1_MulCoq + Col_MulCoq_pic;
    Chan_AddBase_r                 <= Chan_AddBase;
    Row_MulCoq_r                   <= dw_stride_r == 1'b1 ? {Row_MulCoq, 1'b0} : {Row_MulCoq, 2'b0};
end

//三级
reg [25:0]                  dw2pw_reorder_addr_add1;
reg [14:0]                  Row_MulCo_pic_r1;

always @ (posedge clk_calc) begin 
    dw2pw_reorder_addr_add1 <= Cnt1_MulCoq_AddCol_MulCoq_pic + Chan_AddBase_r;
    Row_MulCo_pic_r1 <= Row_MulCoq_r;
end

//四级
always @ (posedge clk_calc) begin 
    dw2pw_reorder_addr <= dw2pw_reorder_addr_add1 + Row_MulCo_pic_r1;
end


endmodule 
