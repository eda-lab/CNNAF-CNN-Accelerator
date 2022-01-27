module pw2pw_reorder_addr_gen(
    input                   clk_calc            ,
    
    input [25:0]            base_addr           ,
    input [ 6:0]            co_div16           ,
    input [14:0]            co_div16_pic       ,
    
    input [ 6:0]            col_cnt             ,
    input [ 6:0]            row_cnt             ,
    input [ 6:0]            chan_cnt            ,
    
    output reg [25:0]       pw2pw_reorder_addr  
);

//pw2pw_reorder_addr = col_cnt*co_div16                                +
//                     row_cnt*co_div16*pic_size                       +
//                     chan_cnt                                         +
//                     base_addr

//一级
reg [13:0]                  Col_MulCoq                          ;
reg [21:0]                  Row_MulCoq_pic                      ;
reg [25:0]                  Base_AddChan                        ;

always @ (posedge clk_calc) begin 
    Col_MulCoq       <= col_cnt * co_div16                     ;
    Row_MulCoq_pic   <= row_cnt * co_div16_pic                 ;
    Base_AddChan     <= base_addr + chan_cnt                    ;
end

//二级
reg [22:0]                  Col_MulCoq_AddRow_MulCoq_pic        ;
reg [25:0]                  Base_AddChan_r                      ;

always @ (posedge clk_calc) begin 
    Col_MulCoq_AddRow_MulCoq_pic <= Col_MulCoq + Row_MulCoq_pic ;
    Base_AddChan_r               <= Base_AddChan                ;
end

//三级
reg [25:0]                  add_1                               ;       

always @ (posedge clk_calc) begin 
    add_1 <= Col_MulCoq_AddRow_MulCoq_pic + Base_AddChan_r      ;
end

//四级
always @ (posedge clk_calc) begin 
    pw2pw_reorder_addr <= add_1                                 ;
end

endmodule