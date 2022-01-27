module rd_pw_b_addr_gen(
    input                   clk        ,
    
    input [25:0]            pw_b_base       ,
    input [ 6:0]            pw_b_cnt_l1     ,
    
    output reg [25:0]       pw_b_addr
);

//pw_b_addr = pw_b_base + pw_b_cnt_l1

//一级流水线
reg [ 6:0]                  pw_b_addr_add;
reg [25:0]                  pw_b_base_r;

always @ (posedge clk) begin 
    pw_b_addr_add <= pw_b_cnt_l1;
    pw_b_base_r <= pw_b_base;
end

//二级流水
reg [25:0]                  pw_b_addr_p;

always @ (posedge clk) begin 
    pw_b_addr_p <= pw_b_addr_add + pw_b_base_r;
end

//三、四级流水
reg [25:0]                  pw_b_addr_r;

always @ (posedge clk) begin 
    pw_b_addr_r <= pw_b_addr_p;
    pw_b_addr <= pw_b_addr_r;
end

endmodule 
