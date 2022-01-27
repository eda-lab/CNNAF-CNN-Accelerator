module ddr_init_ins_gen(
    input                       clk_200M,
    input                       rst_n,

	input						ddr_init_ins_gen_vld,
    
    output reg                  data_init_ins_vld,
    output reg [160:0]          data_init_ins     
);

parameter WEIGHT_DEEP = 16'd287		; //4*3*3*32 ÷ 4 - 1
parameter BIAS_DEPP   = 16'd7		; //32 ÷ 4 - 1 
parameter FEATUE_DEEP = 16'd12383	; //128*129*3 ÷ 4 -1

parameter WEIGHT_BASE = 28'd0		; 
parameter BIAS_BASE   = 28'd550000	;
parameter FEATUE_BASE = 28'd600000	;  

reg [15:0]						weight_cnt;
reg [15:0]						bias_cnt;
reg [15:0]						featue_cnt;

reg [2:0]						state;

reg [127:0]						ins_data;
reg [ 27:0]						ins_addr;
reg [  3:0]						ins_bl;

wire							weight_init_finish;
wire							bias_init_finish;
wire							featue_init_finish;
reg 							ddr_init_finish;

reg [127:0]						weight_rom[287:0];
reg [127:0]						bias_rom[7:0];
reg [127:0]						featue_rom[12383:0];

reg [127:0]						weight_data;
reg [127:0]						bias_data;
reg [127:0]						featue_data;

initial $readmemh("weight_conv.mem", weight_rom);
initial $readmemh("bias_conv.mem", bias_rom);
initial $readmemh("featue_cat128.mem", featue_rom);

always @ (posedge clk_200M or negedge rst_n) begin 
	if (!rst_n) begin 
		weight_cnt <= 16'd0;
	end else if (weight_cnt == WEIGHT_DEEP) begin 
		weight_cnt <= 16'd0;
	end else if (state ==3'b0 && ddr_init_ins_gen_vld == 1'b1) begin 
		weight_cnt <= weight_cnt + 1'b1;
	end else;
end 

// always @ (posedge clk_200M or negedge rst_n) begin
	// if (!rst_n) begin 
		// weight_init_finish <= 1'b0;
	// end	else if (weight_cnt == WEIGHT_DEEP) begin
		// weight_init_finish <= 1'b1;
	// end else begin 
		// weight_init_finish <= 1'b0;
	// end
// end
assign weight_init_finish = weight_cnt == WEIGHT_DEEP;

always @ (posedge clk_200M or negedge rst_n) begin 
	if (!rst_n) begin 
		bias_cnt <= 16'd0;
	end else if (bias_cnt == BIAS_DEPP) begin 
		bias_cnt <= 16'd0;
	end else if (state == 3'd1 && ddr_init_ins_gen_vld == 1'b1) begin 
		bias_cnt <= bias_cnt + 1'b1;
	end else;
end 

// always @ (posedge clk_200M or negedge rst_n) begin 
	// if (!rst_n) begin 
		// bias_init_finish <= 1'b0;
	// end	else if (bias_cnt == BIAS_DEPP) begin 
		// bias_init_finish <= 1'b1;
	// end else begin 
		// bias_init_finish <= 1'b0;
	// end
// end
assign bias_init_finish = bias_cnt == BIAS_DEPP;

always @ (posedge clk_200M or negedge rst_n) begin 
	if (!rst_n) begin 
		featue_cnt <= 16'd0;
	end else if (featue_cnt == FEATUE_DEEP) begin 
		featue_cnt <= 16'd0;
	end else if (state == 3'd2 && ddr_init_ins_gen_vld == 1'b1) begin 
		featue_cnt <= featue_cnt + 1'b1;
	end else;
end

// always @ (posedge clk_200M or negedge rst_n) begin 
	// if (!rst_n) begin 
		// featue_init_finish <= 1'b0;
	// end else if (featue_cnt == FEATUE_DEEP) begin 
		// featue_init_finish <= 1'b1;
	// end else begin 
		// featue_init_finish <= 1'b0;
	// end
// end
assign featue_init_finish = featue_cnt == FEATUE_DEEP;

reg [2:0]				state_reg;
always @ (posedge clk_200M or negedge rst_n) begin
	if (!rst_n) begin 
		state <= 3'd0;
	end else if (state == 3'd3) begin 
		state <= 3'd7;
	end	else if (weight_init_finish == 1'b1 || bias_init_finish == 1'b1 || featue_init_finish == 1'b1) begin 
		state <= state + 1'b1;
	end else;
end	

always @ (posedge clk_200M or negedge rst_n) begin 
	if (!rst_n) begin 
		state_reg <= 1'b0;
	end else begin 
		state_reg <= state;
	end
end

always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        ddr_init_finish <= 1'b0;
    end else begin 
        ddr_init_finish <= featue_init_finish;
    end
end

////////////////////////////////////
//generate instructions
////////////////////////////////////

reg 					data_init_ins_vld_reg;
always @ (posedge clk_200M or negedge rst_n) begin 
	if (!rst_n) begin 
		data_init_ins_vld_reg <= 1'b0;
		data_init_ins_vld <= 1'b0;		
	end else begin 
		data_init_ins_vld_reg <= ddr_init_ins_gen_vld;
		data_init_ins_vld <= data_init_ins_vld_reg;
	end
end

always @ (posedge clk_200M) begin 
	weight_data <= weight_rom[weight_cnt];
	bias_data <= bias_rom[bias_cnt];
	featue_data <= featue_rom[featue_cnt];
end

always @ (*) begin 
	case (state_reg)
		3'd0: begin 
			ins_data = weight_data;
		end
		3'd1: begin 
			ins_data = bias_data;
		end 
		3'd2: begin 
			ins_data = featue_data;
		end
		default: begin
			ins_data = 128'd0;
		end
	endcase
end

always @ (*) begin 
	case (state)
		3'd0: begin 
			ins_addr = weight_cnt + WEIGHT_BASE;
			ins_bl   = 4'd1;
		end
		3'd1: begin 
			ins_addr = bias_cnt + BIAS_BASE;
			ins_bl   = 4'd1;
		end 
		3'd2: begin 
			ins_addr = featue_cnt + FEATUE_BASE;
			ins_bl   = 4'd1;
		end
		default: begin
			ins_addr = 28'd0;
			ins_bl   = 4'd0;
		end
	endcase
end

reg [27:0]					ins_addr_reg;
reg [3:0]					ins_bl_reg  ;
always @ (posedge clk_200M) begin 
	ins_addr_reg <= ins_addr;
	ins_bl_reg	 <= ins_bl;
end

always @ (posedge clk_200M or negedge rst_n) begin 
	if (!rst_n) begin 
		data_init_ins <= 161'd0;
	end else begin 
		data_init_ins <= {ddr_init_finish, ins_data, ins_addr_reg, ins_bl_reg};
	end
end	

// assign data_init_ins = {ddr_init_finish, ins_data, ins_addr, ins_bl};

endmodule 
