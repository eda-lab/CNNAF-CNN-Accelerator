module avg2pw_reorder_addr_gen(
    input                       clk_calc            ,
        
    input [25:0]                base_addr           ,
    input [10:0]                avg2pw_cnt          ,
        
    output reg [25:0]           avg2pw_reorder_addr
);

//一级
reg [25:0]                      avg2pw_reorder_addr_p;
always @ (posedge clk_calc) begin 
    avg2pw_reorder_addr_p <= base_addr + avg2pw_cnt;
end

//二、三、四级
reg [25:0]                      avg2pw_reorder_addr_r1;
reg [25:0]                      avg2pw_reorder_addr_r2;

always @ (posedge clk_calc) begin 
    avg2pw_reorder_addr_r1 <= avg2pw_reorder_addr_p;
    avg2pw_reorder_addr_r2 <= avg2pw_reorder_addr_r1;
    avg2pw_reorder_addr    <= avg2pw_reorder_addr_r2;
end

endmodule
