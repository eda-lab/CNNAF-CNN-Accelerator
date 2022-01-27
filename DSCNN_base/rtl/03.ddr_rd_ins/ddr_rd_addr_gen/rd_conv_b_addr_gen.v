module rd_conv_b_addr_gen(
	input					clk		,
		
	input [25:0]			conv_b_base		,
	input [6:0]			    conv_b_cnt_l1	,
	
	output reg [25:0]		conv_b_addr
);

//conv_b_addr = conv_b_base + conv_b_cnt_l1

//一级流水线
reg [25:0]					conv_b_addr_add_1;

always @ (posedge clk) begin
	conv_b_addr_add_1 <= conv_b_base + conv_b_cnt_l1;
end

//二、三、四级流水线
reg [25:0]					conv_b_addr_r[1:0];

always @ (posedge clk) begin 
	conv_b_addr_r[0] <= conv_b_addr_add_1;
	conv_b_addr_r[1] <= conv_b_addr_r[0];	
	conv_b_addr		 <= conv_b_addr_r[1];
end

endmodule 