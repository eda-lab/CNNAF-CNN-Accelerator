module rd_dw_f_addr_gen(
    input                   clk        ,
    
    input [25:0]            dw_f_base       ,
    input [ 7:0]            pic_size        ,
    input [15:0]            pic_size_square ,
    
    input [ 6:0]            dw_f_cnt_l1     ,
    // input [ 6:0]            dw_f_cnt_l2     ,
    input [ 6:0]            dw_f_cnt_l3     ,
    input [ 6:0]            dw_f_cnt_l4     ,
    input [ 6:0]            dw_f_cnt_l5     ,
    
    output reg [25:0]       dw_f_addr
);
/*
    type1 : dw_f_cnt_l4 == 11'd0 && dw_f_cnt_l1 == 11'd1
            type1_addr = dw_f_base + dw_f_cnt_l3*pic_size + dw_f_cnt_l5*pic_size*pic_size
    type2 : dw_f_cnt_l4 > 11'b0 && dw_f_cnt_l1 == 11'd0
            type2_addr = dw_f_base + dw_f_cnt_l3*pic_size + dw_f_cnt_l4*4 + dw_f_cnt_l5*pic_size*pic_size*16
*/ 
//一级流水线 
reg [14:0]                  Cntl3_MulPic;
reg [ 8:0]                  Cntl4_Mul2;
reg [22:0]                  Cntl5_MulPsize2;

always @ (posedge clk) begin 
    Cntl3_MulPic    <= dw_f_cnt_l3 * pic_size - pic_size;
    Cntl4_Mul2      <= {dw_f_cnt_l4, 2'b0};
    Cntl5_MulPsize2 <= dw_f_cnt_l5 * pic_size_square;
end

reg [ 6:0]                  dw_f_cnt_l1_r1;
reg [ 6:0]                  dw_f_cnt_l3_r1;
reg [ 6:0]                  dw_f_cnt_l4_r1;

always @ (posedge clk) begin 
    dw_f_cnt_l1_r1 <= dw_f_cnt_l1;
    dw_f_cnt_l3_r1 <= dw_f_cnt_l3;
    dw_f_cnt_l4_r1 <= dw_f_cnt_l4;
end

reg [25:0]                  dw_f_addr_base_r  ;
reg [6:0]                   pic_size_div_4    ;

always @ (posedge clk) begin 
    dw_f_addr_base_r <= dw_f_base;
    pic_size_div_4   <= {2'b0, pic_size[6:2]} - 1'b1;
end

//二级流水线
reg [15:0]                  dw_f_addr_type1_add1;
reg [25:0]                  dw_f_addr_type1_add2;

always @ (posedge clk) begin 
    dw_f_addr_type1_add1 <= Cntl3_MulPic + Cntl4_Mul2;
    dw_f_addr_type1_add2 <= Cntl5_MulPsize2 + dw_f_addr_base_r;
end

reg [6:0]                   dw_f_cnt_l1_r2;
reg [6:0]                   dw_f_cnt_l3_r2;
reg [6:0]                   dw_f_cnt_l4_r2;
reg [6:0]                   pic_size_div_4_r1;

always @ (posedge clk) begin 
    dw_f_cnt_l1_r2 <= dw_f_cnt_l1_r1;
    dw_f_cnt_l3_r2 <= dw_f_cnt_l3_r1;
    dw_f_cnt_l4_r2 <= dw_f_cnt_l4_r1;
    pic_size_div_4_r1 <= pic_size_div_4;
end

//三级流水线
reg [25:0]                  dw_f_addr_out1; // pic_size > 4
reg [25:0]                  dw_f_addr_out2; // pic_size = 4
reg [6:0]                   pic_size_div_4_r2;

always @ (posedge clk) begin 
    if (dw_f_cnt_l1_r2 == 11'd1 && dw_f_cnt_l4_r2 == 11'd0) begin 
        dw_f_addr_out1 <= 26'd218800;  //补零操作
    end else if (dw_f_cnt_l1_r2 == 11'd0 && dw_f_cnt_l4_r2 == pic_size_div_4_r1) begin 
        dw_f_addr_out1 <= 26'd218800;  //补零操作
    end else if (dw_f_cnt_l3_r2 == 11'd0 || dw_f_cnt_l3_r2 == pic_size+1) begin 
        dw_f_addr_out1 <= 26'd218800;  //补零操作
    end else if (dw_f_cnt_l1_r2 == 11'd0 && dw_f_cnt_l4_r2 == 11'd0) begin 
        dw_f_addr_out1 <= dw_f_addr_type1_add1 + dw_f_addr_type1_add2;
    end else if (dw_f_cnt_l1_r2 == 11'd1 && dw_f_cnt_l4_r2 > 11'd0) begin 
        dw_f_addr_out1 <= dw_f_addr_type1_add1 + dw_f_addr_type1_add2 - 1'b1;
    end else begin 
        dw_f_addr_out1 <= 26'd0;
    end
end

always @ (posedge clk) begin 
    if (dw_f_cnt_l1_r2 == 7'd2) begin 
        dw_f_addr_out2 <= 26'd218800;  //补零操作
    end else if (dw_f_cnt_l1_r2 == 7'd1 && (dw_f_cnt_l3_r2 == 11'd0 || dw_f_cnt_l3_r2 == pic_size+1)) begin 
        dw_f_addr_out2 <= 26'd218800;  //补零操作
    end else if (dw_f_cnt_l1_r2 == 7'd1) begin 
        dw_f_addr_out2 <= dw_f_addr_type1_add1 + dw_f_addr_type1_add2;
    end else if (dw_f_cnt_l1_r2 == 7'd0) begin 
        dw_f_addr_out2 <= 26'd218800;  //补零操作
    end
end

always @ (posedge clk) begin 
    pic_size_div_4_r2 <= pic_size_div_4_r1;
end

//四级流水线
always @ (posedge clk) begin 
    if (pic_size_div_4_r2 == 7'd0) begin 
        dw_f_addr <= dw_f_addr_out2; 
    end else begin 
        dw_f_addr <= dw_f_addr_out1; 
    end
end


endmodule 