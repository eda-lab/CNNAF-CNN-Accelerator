module ddr_utilization(
    input                   ddr_usr_clk     ,
    input                   sys_rst_n       ,
        
    input                   net_finish      ,
    input                   ddr_rdy         ,
    input                   ddr_rdreq       ,
    input                   ddr_wrreq       ,
        
    output reg [31:0]       use_part        ,
    output reg [31:0]       use_wr_part     ,
    output reg [31:0]       unuse_part      
);

reg [31:0]                  use_part_r;
reg [31:0]                  unuse_part_r;
reg [31:0]                  use_part_l;
reg [31:0]                  unuse_part_l;
reg [31:0]                  use_wr_part_r;
reg                         net_finish_r;
reg                         net_finish_r1;
wire                        net_finish_s;

always @ (posedge ddr_usr_clk or negedge sys_rst_n) begin 
    if (!sys_rst_n) begin 
        net_finish_r <= 1'b0;
        net_finish_r1 <= 1'b0;
    end else begin 
        net_finish_r <= net_finish;
        net_finish_r1 <= net_finish_r;
    end
end

assign net_finish_s = ~net_finish_r & net_finish;                

always @ (posedge ddr_usr_clk or negedge sys_rst_n) begin 
    if (!sys_rst_n) begin 
        use_part_r   <= 32'b0;
        unuse_part_r <= 32'b0;
        use_wr_part_r  <= 32'b0;
    end else if (net_finish_r1 == 1'b1) begin 
        use_part_r   <= 32'b0;
        unuse_part_r <= 32'b0;
        use_wr_part_r  <= 32'b0;
    end else if (ddr_rdy == 1'b1) begin 
        use_part_r   <= (ddr_rdreq || ddr_wrreq) ? use_part_r + 1'b1 : use_part_r;
        unuse_part_r <= (ddr_rdreq || ddr_wrreq) ? unuse_part_r : unuse_part_r + 1'b1;
        use_wr_part_r  <= ddr_rdreq ? use_wr_part_r + 1'b1 : use_wr_part_r;
    end
end

always @ (posedge ddr_usr_clk or negedge sys_rst_n) begin 
    if (!sys_rst_n) begin 
        use_part   <= 32'b0;
        use_wr_part <= 32'b0;
        unuse_part <= 32'b0;
    end else if (net_finish_r1 == 1'b1) begin 
        use_part   <= use_part_r;
        use_wr_part <= use_wr_part_r;
        unuse_part <= unuse_part_r;
    end else begin 
        use_part   <= use_part;
        use_wr_part <= use_wr_part;
        unuse_part <= unuse_part;
    end
end

endmodule 
