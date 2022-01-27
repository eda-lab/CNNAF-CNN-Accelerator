module ddr_veri_ins_gen(
    input                       clk_200M,
    input                       rst_n,

	input						ddr_veri_ins_gen_vld,
    
    output reg                  ddr_veri_ins_vld,
    output reg [31:0]           ddr_veri_ins   
);

reg [15:0]                      conv_data_veri_cnt      ;
reg                             conv_data_veri_finish   ;

always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        conv_data_veri_cnt <= 16'd0;
    end else if (ddr_veri_ins_gen_vld == 1'b1 && conv_data_veri_finish == 1'b0) begin 
        conv_data_veri_cnt <= conv_data_veri_cnt + 1'b1;
    end else begin 
        conv_data_veri_cnt <= conv_data_veri_cnt;
    end
end

always @ (posedge clk_200M) begin 
    conv_data_veri_finish <= conv_data_veri_cnt >= 16'd288;
end

reg [27:0]                      ddr_veri_ins_addr_part;

always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        ddr_veri_ins_addr_part <= 28'd0;
    end else begin 
        ddr_veri_ins_addr_part <= {12'd0, conv_data_veri_cnt};
    end
end

reg [1:0]                       ddr_veri_ins_gen_vld_r;

always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        ddr_veri_ins_gen_vld_r <= 2'd0;
    end else begin 
        ddr_veri_ins_gen_vld_r <= {ddr_veri_ins_gen_vld_r[0], ddr_veri_ins_gen_vld};
    end
end

always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        ddr_veri_ins     <= 32'd0;
        ddr_veri_ins_vld <= 1'b0;
    end else if (conv_data_veri_finish == 1'b0) begin 
        ddr_veri_ins     <= {ddr_veri_ins_addr_part, 4'd1};
        ddr_veri_ins_vld <= ddr_veri_ins_gen_vld_r[0];
    end else begin 
        ddr_veri_ins     <= 32'd0;
        ddr_veri_ins_vld <= 1'b0;
    end
end

endmodule 