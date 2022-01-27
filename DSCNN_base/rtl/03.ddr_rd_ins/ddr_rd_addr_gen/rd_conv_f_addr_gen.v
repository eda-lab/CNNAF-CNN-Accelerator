module rd_conv_f_addr_gen(
	input					clk		,
		
	input [25:0]			conv_f_base		,
    // input [ 6:0]			conv_f_cnt_l1	,
	input [ 6:0]			conv_f_cnt_l2	,
	input [ 6:0]			conv_f_cnt_l3	,
	
	output reg [25:0]		conv_f_addr
);

//conv_f_addr = conv_f_base + conv_f_cnt_l2 * 

//一级流水线
reg [25:0]					conv_f_addr_add_2;
reg [25:0]					conv_f_addr_add_3;
reg [25:0]                  conv_f_base_r    ;

always @ (posedge clk) begin
    conv_f_addr_add_2 <= {conv_f_cnt_l2, 1'b0}+conv_f_cnt_l2;
	conv_f_addr_add_3 <= {conv_f_cnt_l3, 7'b0}+{conv_f_cnt_l3, 6'b0};	
    conv_f_base_r     <= conv_f_base;
end

//二级流水线
reg [25:0]					conv_f_addr_add_12;
reg [25:0]					conv_f_addr_add_3b;

always @ (posedge clk) begin 
	conv_f_addr_add_12 <= conv_f_addr_add_2;
	conv_f_addr_add_3b <= conv_f_addr_add_3 + conv_f_base_r;
end

//三级流水线
reg [25:0]					conv_f_addr_add_all;

always @ (posedge clk) begin 
	conv_f_addr_add_all <= conv_f_addr_add_12 + conv_f_addr_add_3b;
end

//四级流水线
always @ (posedge clk) begin 
    conv_f_addr			<= conv_f_addr_add_all;
end

endmodule 