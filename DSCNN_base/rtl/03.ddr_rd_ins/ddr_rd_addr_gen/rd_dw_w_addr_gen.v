module rd_dw_w_addr_gen(
    input                   clk    ,
    
    input [25:0]            dw_w_base   ,
    input [ 6:0]            dw_w_cnt_l1 ,
    
    output reg [25:0]       dw_w_addr
);

//dw_w_addr = dw_w_base + dw_w_cnt_l1 * 9

//一级流水线  
reg [10:0]                  dw_w_add_1;
reg [25:0]                  dw_w_base_r1;

always @ (posedge clk) begin
    dw_w_add_1 <= {dw_w_cnt_l1, 3'b0} + dw_w_cnt_l1;
    dw_w_base_r1 <= dw_w_base;
end

//二级流水线  
reg [25:0]                  dw_w_add_12;

always @ (posedge clk) begin 
    dw_w_add_12 <= dw_w_add_1 + dw_w_base_r1;
end

//三级流水线  
reg [25:0]                  dw_w_addr_all;

always @ (posedge clk) begin 
    dw_w_addr_all <= dw_w_add_12;
end

//四级流水线  
always @ (posedge clk) begin 
    dw_w_addr <= dw_w_addr_all;
end

endmodule 