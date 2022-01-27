module calc_unit_x16
    #(parameter BANDWIDTH=512,
                BITWIDTH=32)(
    input                        clk_calc,
    input                        rst_n,

    input [BITWIDTH*16*16-1:0]   w_in,
    input                        data_in_vld,
    input [BITWIDTH*16*16-1:0]   data_in,

    input [6:0]                  acc_para,
    input                        new_start,

    output reg                   data_out_vld,
    output reg [BITWIDTH*16-1:0] data_out
);

wire [BITWIDTH*16-1:0]           acc_data_out;

genvar i;
generate
    for(i = 0; i < 16; i = i + 1) begin : calc_unit_gen
        calc_unit_single calc_unit_single_gen(
            .clk_calc           (clk_calc),
            .rst_n              (rst_n),
            .w_in               (w_in[i*BITWIDTH*16 +: BITWIDTH*16]),
            .data_in_vld        (data_in_vld),
            .data_in            (data_in[i*BITWIDTH*16 +: BITWIDTH*16]),
            .new_start          (new_start),
            .data_out           (acc_data_out[i*BITWIDTH +: BITWIDTH])
        );
    end
endgenerate

reg [7:0]                      acc_para_l;

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        acc_para_l <= 8'b0;
    end else if (new_start == 1'b1) begin 
        acc_para_l <= acc_para;
    end else begin 
        acc_para_l <= acc_para_l;
    end
end 

reg [6:0]                      acc_cnt_cur;
always @ (posedge clk_calc or negedge rst_n)
begin
    if(!rst_n) begin
        acc_cnt_cur <= 7'b0;
    end else if (data_in_vld == 1'b1 && acc_cnt_cur == acc_para) begin
        acc_cnt_cur <= 7'b0;
    end else if (new_start == 1'b1 && acc_para == 1'b0) begin 
        acc_cnt_cur <= 7'b0;
    end else if (new_start == 1'b1 && data_in_vld == 1'b1 && acc_para != 1'b0) begin
        acc_cnt_cur <= acc_cnt_cur + 1'b1;
    end else if (data_in_vld == 1'b1) begin
        acc_cnt_cur <= acc_cnt_cur + 1'b1;
    end else begin 
        acc_cnt_cur <= acc_cnt_cur;
    end
end

wire                            data_out_vld_cur;
assign data_out_vld_cur = ((new_start == 1'b1 && acc_para == 1'b0) || acc_cnt_cur == acc_para) && (data_in_vld == 1'b1);

wire                            data_out_vld_p;
reg  [18:0]                     data_out_vld_reg;

always @ (posedge clk_calc or negedge rst_n) begin
    if(!rst_n) begin
        data_out_vld_reg <= 19'b0;
    end else begin
        data_out_vld_reg <= {data_out_vld_reg[17:0], data_out_vld_cur};
    end
end

assign data_out_vld_p = data_out_vld_reg[18];

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        data_out_vld <= 1'b0;
    end else begin 
        data_out_vld <= data_out_vld_p;
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        data_out <= 0;
    end else begin 
        data_out <= acc_data_out;
    end
end

endmodule