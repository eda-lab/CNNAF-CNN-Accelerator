module bias_gen
    #(parameter BANDWIDTH=512,
                BITWIDTH=32)(
    input                       clk_data,
    input                       rst_n,
    input                       clk_calc,
    
    input                       bias_in_vld,
    input [BANDWIDTH-1:0]       bias_in,
    input                       data_acc_layer_finish,
    
    output reg                  bias_load_done,
    output [BITWIDTH*16-1:0]    bias_out
);

wire                            fifo_wr_en;
wire  [BANDWIDTH-1:0]           fifo_wr_data;

bias_ctrl bias_ctrl(
    .clk_data                   (clk_data    ),
    .rst_n                      (rst_n       ),
    .bias_in_vld                (bias_in_vld ),
    .bias_in                    (bias_in     ),
    .fifo_wr_en                 (fifo_wr_en  ),
    .fifo_wr_data               (fifo_wr_data)
);

wire                            fifo_empty;
wire                            fifo_rd_en;

fifo_bias_gen	fifo_bias_gen_inst (
    .wrclk                      ( clk_data ),
    .wrreq                      ( fifo_wr_en ),
    .wrfull                     (  ),
    .data                       ( fifo_wr_data ),
    .rdclk                      ( clk_calc ),
    .aclr                       ( ~rst_n     ), 
    .rdreq                      ( fifo_rd_en ),
    .rdempty                    ( fifo_empty ),
    .q                          ( bias_out )
);

wire                            bias_first_load;
reg                             bias_first_load_reg1;
reg                             bias_first_load_reg2;
wire                            bias_load;

always @ (posedge clk_calc or negedge rst_n)
begin 
    if (!rst_n) begin 
        bias_first_load_reg1 <= 1'b0;
        bias_first_load_reg2 <= 1'b0;
    end else if (fifo_empty == 1'b0) begin
        bias_first_load_reg1 <= 1'b1;
        bias_first_load_reg2 <= bias_first_load_reg1;
    end else begin 
        bias_first_load_reg1 <= bias_first_load_reg1;
        bias_first_load_reg2 <= bias_first_load_reg2;
    end
end

assign bias_first_load = bias_first_load_reg1 ^ bias_first_load_reg2;

reg                             bias_wait_load;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        bias_wait_load <= 1'b0;
    end else if (data_acc_layer_finish == 1'b1 && fifo_empty == 1'b1) begin 
        bias_wait_load <= 1'b1;
    end else if (fifo_empty == 1'b0 && bias_load == 1'b1) begin 
        bias_wait_load <= 1'b0;
    end else begin
        bias_wait_load <= bias_wait_load;
    end
end 

assign bias_load = bias_first_load | data_acc_layer_finish | bias_wait_load;

reg                             fifo_rd_en_p;
reg [14:0]                      fifo_rd_en_r;         

always @ (posedge clk_calc or negedge rst_n)
begin
    if(!rst_n) begin
        fifo_rd_en_p   <= 1'b0;
        bias_load_done <= 1'b0;
    end
    else if (fifo_empty == 1'b0 && bias_load == 1'b1) begin
        fifo_rd_en_p   <= 1'b1;
        bias_load_done <= 1'b1;
    end
    else begin
        fifo_rd_en_p   <= 1'b0;
        bias_load_done <= 1'b0;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_rd_en_r <= 15'b0;
    end else begin 
        fifo_rd_en_r <= {fifo_rd_en_r[13:0], fifo_rd_en_p};
    end
end

assign fifo_rd_en = fifo_rd_en_r[14];

endmodule