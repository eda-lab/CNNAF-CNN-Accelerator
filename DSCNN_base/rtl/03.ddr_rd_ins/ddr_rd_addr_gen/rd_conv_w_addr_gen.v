module rd_conv_w_addr_gen(
	input					clk		,
		
	input [25:0]			conv_w_base		,
	input [6:0]			    conv_w_cnt_l1	,
	input [6:0]			    conv_w_cnt_l2	,
	
	output reg [25:0]		conv_w_addr
);

//conv_w_addr = conv_w_base + conv_w_cnt_l1 * 3 + conv_w_cnt_l2 * 48

//一级流水线
reg [9:0]					conv_w_add_1		;
reg [12:0]					conv_w_add_2		;
reg [25:0]                  conv_w_base_r1      ;

always @ (posedge clk) begin
	conv_w_add_1 <= {conv_w_cnt_l1, 1'b0} + conv_w_cnt_l1;
	conv_w_add_2 <= {conv_w_cnt_l2, 5'b0} + {conv_w_cnt_l2, 4'b0};
    conv_w_base_r1 <= conv_w_base;
end

//二级流水线
reg [13:0]					conv_w_add_12		;
reg [25:0]                  conv_w_base_r2      ;

always @ (posedge clk) begin 
	conv_w_add_12 <= conv_w_add_1 + conv_w_add_2;
    conv_w_base_r2 <= conv_w_base_r1;
end

//三级流水线
reg [26:0]					conv_w_add_all;

always @ (posedge clk) begin 
	conv_w_add_all <= conv_w_base_r2 + conv_w_add_12;
end

//四级流水线

always @ (posedge clk) begin 
	conv_w_addr <= conv_w_add_all[25:0];
end

endmodule 