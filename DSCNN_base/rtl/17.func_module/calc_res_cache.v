module calc_res_cache(
    input                   clk_200M            ,
    input                   rst_n               ,
        
    input                   net_calc_finish     ,
    input                   calc_res_vld        ,
    input [511:0]           calc_res            ,
    input                   data_gen_vld        ,
    
    input [9:0]             calc_res_ram_addr   ,
    output wire             calc_finish_pulse   ,              
    output reg [31:0]       calc_res_out        ,
    output reg [31:0]       calc_fps            ,
    output reg [31:0]       calc_use_part       ,
    output reg [31:0]       calc_total_part     
);

reg                         calc_res_vld_r;
wire [31:0]                 res_cache_wire[15:0];
reg [31:0]                  res_cache[15:0];
reg [31:0]                  res_ram1[1023:0];
reg [31:0]                  res_ram2[1023:0];
wire [31:0]                 res_ram_wire[1023:0];
reg [31:0]                  calc_use_part_r;
reg [31:0]                  calc_use_part_r1;
reg [31:0]                  calc_total_part_r;
reg [31:0]                  calc_total_part_r1;
reg                         res_rd_finish_sig;
reg                         res_rd_finish;
reg                         res_ram_sec;

assign calc_finish_pulse = res_rd_finish;

genvar w;
generate
    for(w = 0; w < 16; w = w + 1) begin : divide_calc_res
        assign res_cache_wire[w] = calc_res[32*w+31:32*w];
    end
endgenerate

integer i;
integer j;
always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        for (i=0; i<16; i=i+1) begin 
            res_cache[i] <= 32'b0;
        end
    end else if (calc_res_vld == 1'b1) begin 
        for (i=0; i<16; i=i+1) begin 
            res_cache[i] <= res_cache_wire[i];
        end
    end else begin 
        for (i=0; i<16; i=i+1) begin 
            res_cache[i] <= res_cache[i];
        end
    end
end 

always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        calc_res_vld_r <= 1'b0;
    end else begin 
        calc_res_vld_r <= calc_res_vld;
    end
end

always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        res_rd_finish_sig <= 1'b0;
    end else if (calc_res_ram_addr == 10'd1000) begin 
        res_rd_finish_sig <= 1'b1;
    end else if (net_calc_finish == 1'b1) begin 
        res_rd_finish_sig <= 1'b0;
    end else begin 
        res_rd_finish_sig <= res_rd_finish_sig;
    end
end 

always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        res_rd_finish <= 1'b0;
    end else begin 
        res_rd_finish <= res_rd_finish_sig & net_calc_finish;
    end
end

always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        res_ram_sec <= 1'b0;
    end else if (res_rd_finish == 1'b1) begin 
        res_ram_sec <= ~res_ram_sec;
    end
end

always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        for (i=0; i<1024; i=i+1) begin 
            res_ram1[i] <= 32'b0;
        end
    end else if (calc_res_vld_r == 1'b1 && res_ram_sec == 1'b0) begin 
        for (i=0; i<992; i=i+1) begin 
            res_ram1[i] <= res_ram1[i+16];
        end
        for (j=0; j<16; j=j+1) begin 
            res_ram1[j+992] <= res_cache[j];
        end
    end else begin 
        for (i=0; i<1024; i=i+1) begin 
            res_ram1[i] <= res_ram1[i];
        end
    end
end

always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        for (i=0; i<1024; i=i+1) begin 
            res_ram2[i] <= 32'b0;
        end
    end else if (calc_res_vld_r == 1'b1 && res_ram_sec == 1'b1) begin 
        for (i=0; i<1008; i=i+1) begin 
            res_ram2[i] <= res_ram2[i+16];
        end
        for (j=0; j<16; j=j+1) begin 
            res_ram2[j+1008] <= res_cache[j];
        end
    end else begin 
        for (i=0; i<1024; i=i+1) begin 
            res_ram2[i] <= res_ram2[i];
        end
    end
end

reg [31:0]                      res_ram1_out;
reg [31:0]                      res_ram2_out;

always @ (posedge clk_200M) begin 
    res_ram1_out <= res_ram1[calc_res_ram_addr];
    res_ram2_out <= res_ram2[calc_res_ram_addr];
end

always @ (posedge clk_200M) begin 
    calc_res_out <= res_ram_sec ? res_ram1_out : res_ram2_out;
end

always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        calc_fps <= 32'b0;
    end else if (net_calc_finish == 1'b1) begin 
        calc_fps <= calc_fps + 1'b1;
    end else begin 
        calc_fps <= calc_fps;
    end
end

always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        calc_total_part_r <= 32'b0;
    end else if (net_calc_finish == 1'b1) begin 
        calc_total_part_r <= 32'b0;
    end else begin 
        calc_total_part_r <= calc_total_part_r + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        calc_use_part_r <= 32'b0;
    end else if (net_calc_finish == 1'b1) begin 
        calc_use_part_r <= 32'b0;
    end else if (data_gen_vld == 1'b1) begin 
        calc_use_part_r <= calc_use_part_r + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        calc_use_part <= 32'b0;
        calc_total_part <= 32'b0;
    end else if (net_calc_finish == 1'b1) begin 
        calc_use_part <= calc_use_part_r;
        calc_total_part <= calc_total_part_r;
    end else begin 
        calc_use_part <= calc_use_part;
        calc_total_part <= calc_total_part;
    end
end

endmodule 
