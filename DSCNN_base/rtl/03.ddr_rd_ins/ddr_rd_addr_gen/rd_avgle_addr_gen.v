module rd_avgle_addr_gen(
    input                       clk        ,
    
    input [25:0]                w_base_addr     ,
    input [25:0]                b_base_addr     ,
    input [25:0]                f_base_addr     ,
    input [10:0]                avgle_cnt       ,
    
    output reg [25:0]           rd_avgle_addr
);

//一级
reg [1:0]                       avgle_rd_mode;

always @ (posedge clk) begin 
    if (avgle_cnt == 11'd0) begin 
        avgle_rd_mode <= 2'd0;
    end else if (avgle_cnt == 11'd1) begin 
        avgle_rd_mode <= 2'd1;
    end else begin 
        avgle_rd_mode <= 2'd2;
    end
end

reg [10:0]                      avgle_data_cnt;
reg [25:0]                      f_base_addr_r;
always @ (posedge clk) begin 
    avgle_data_cnt <= avgle_cnt - 2'd2;
    f_base_addr_r <= f_base_addr;
end

//二级
reg [14:0]                      avgle_data_cntx4;
reg [1:0]                       avgle_rd_mode_r;
reg [25:0]                      f_base_addr_r1;
always @ (posedge clk) begin 
    avgle_data_cntx4 <= {avgle_data_cnt, 4'b0};
    f_base_addr_r1   <= f_base_addr_r;
    avgle_rd_mode_r  <= avgle_rd_mode;
end

//三级
reg [25:0]                      rd_avgle_addr_p;
always @ (posedge clk) begin 
    case (avgle_rd_mode_r)
        2'd0 : begin 
            rd_avgle_addr_p <= w_base_addr;
        end
        2'd1 : begin 
            rd_avgle_addr_p <= b_base_addr;
        end
        2'd2 : begin 
            rd_avgle_addr_p <= avgle_data_cntx4 + f_base_addr_r1;
        end
        default : begin 
            rd_avgle_addr_p <= 26'd0;
        end
    endcase 
end

//四级
always @ (posedge clk) begin 
    rd_avgle_addr <= rd_avgle_addr_p;
end

endmodule 
