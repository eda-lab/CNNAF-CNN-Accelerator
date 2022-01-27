module rd_pw_w_addr_gen(
    input                   clk             ,
    
    input [25:0]            pw_w_base       ,
    input [16:0]            w_pw_en_cnt     ,
    input [ 6:0]            pw_bl           ,
    
    output reg [25:0]       pw_w_addr
);

//pw_w_addr = pw_w_base + w_pw_en_cnt * pw_bl

//一级流水
reg [23:0]                  pw_w_addr_add;
reg [25:0]                  pw_w_base_r;

always @ (posedge clk) begin 
    pw_w_addr_add <= w_pw_en_cnt * pw_bl;
    pw_w_base_r <= pw_w_base;
end

//二级流水
reg [25:0]                  pw_w_addr_p;

always @ (posedge clk) begin 
    pw_w_addr_p <= pw_w_addr_add + pw_w_base_r;
end

//三、四级流水
reg [25:0]                  pw_w_addr_r;

always @ (posedge clk) begin 
    pw_w_addr_r <= pw_w_addr_p;
    pw_w_addr <= pw_w_addr_r;
end

endmodule 
