module pw2dw_reorder_addr_gen(
    input                   clk_calc            ,
            
    input [25:0]            base_addr           ,
    input [ 7:0]            pic_size            ,
    input [15:0]            pic_square          ,
            
    input [ 6:0]            col_cnt             ,
    input [ 6:0]            row_cnt             ,
    input [10:0]            chan_cnt            ,
    
    output reg [25:0]       pw2dw_reorder_addr  
);

//DW计算顺序换方向，可以让PW2DW也正常顺序存放，也就是连续地址，可以burst写
//pw2dw_reorder_addr = col_cnt                                      +
//                     row_cnt*pic_size                             +
//                     chan_cnt*pic_size_square                     +
//                     base_addr

//一级
reg [12:0]                  Row_MulPic      ;
reg [25:0]                  Base_AddCol     ; 
reg [25:0]                  Chan_MulPic2    ;     

always @ (posedge clk_calc) begin 
    Row_MulPic   <= row_cnt * pic_size;
    Base_AddCol  <= base_addr + col_cnt;
    Chan_MulPic2 <= chan_cnt * pic_square;
end

//二级
reg [25:0]                  Row_MulPic_AddChan_MulPic2;
reg [25:0]                  Base_AddCol_r;

always @ (posedge clk_calc) begin 
    Row_MulPic_AddChan_MulPic2 <= Row_MulPic + Chan_MulPic2;
    Base_AddCol_r              <= Base_AddCol;
end

//三级
reg [25:0]                  pw2dw_reorder_addr_add_1;

always @ (posedge clk_calc) begin
    pw2dw_reorder_addr_add_1 <= Row_MulPic_AddChan_MulPic2 + Base_AddCol_r;
end

//四级
always @ (posedge clk_calc) begin 
    pw2dw_reorder_addr <= pw2dw_reorder_addr_add_1;
end


endmodule 
