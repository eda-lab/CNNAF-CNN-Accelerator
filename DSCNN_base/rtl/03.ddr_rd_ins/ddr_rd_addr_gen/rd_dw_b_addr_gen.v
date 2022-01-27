module rd_dw_b_addr_gen(
    input               clk        ,
    
    input [25:0]        dw_b_base     ,
    input [ 6:0]        dw_b_cnt_l1   ,
    
    output reg [25:0]   dw_b_addr
);

//dw_b_addr = dw_b_base + dw_b_base

reg [25:0]              dw_b_addr_add_1;

always @ (posedge clk) begin 
    dw_b_addr_add_1 <= dw_b_base + dw_b_cnt_l1;
end

reg [25:0]              dw_b_addr_r[1:0];

always @ (posedge clk) begin 
    dw_b_addr_r[0] <= dw_b_addr_add_1;
    dw_b_addr_r[1] <= dw_b_addr_r[0];
    dw_b_addr      <= dw_b_addr_r[1];
end

endmodule 
