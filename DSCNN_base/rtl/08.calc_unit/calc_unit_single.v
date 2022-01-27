module calc_unit_single
    #(parameter BANDWIDTH=512,
                BITWIDTH=32)(
    input                       clk_calc,
    input                       rst_n,
    
    input [BITWIDTH*16-1:0]     w_in,
    input                       data_in_vld,
    input [BITWIDTH*16-1:0]     data_in,
    
    // input [7:0]                 acc_para,
    input                       new_start,
    
    // output                      data_out_vld,
    output [31:0]               data_out
);

//-------------------------------------------
// mul of input
//-------------------------------------------
wire [BITWIDTH-1:0]             mul_a[15:0];
wire [BITWIDTH-1:0]             mul_b[15:0];
wire [BITWIDTH-1:0]             mul_o[15:0];
genvar i;
integer j;

generate 
	for (i = 0; i < 16; i = i + 1) begin : mul_data
		assign	mul_a[i] = data_in[BITWIDTH*i+BITWIDTH-1:BITWIDTH*i];
		assign	mul_b[i] =    w_in[BITWIDTH*i+BITWIDTH-1:BITWIDTH*i];
	end
endgenerate

generate 
    for (i = 0; i < 16; i = i + 1) begin : mul_gen
        fp_mul mul
        (
            .clk                (clk_calc),    //    clk.clk
            .areset             (~rst_n), // areset.reset
            .a                  (mul_a[i]),      //      a.a
            .b                  (mul_b[i]),      //      b.b
            .q                  (mul_o[i])       //      q.q
        );
    end
endgenerate

//-------------------------------------------
// add of mul
//-------------------------------------------
wire [BITWIDTH-1:0]             add_of2[7:0];
generate 
    for (i = 0; i < 8; i = i + 1) begin : add_of_2_gen
        fp_add fp_add_2
		(
            .clk                (clk_calc),    //    clk.clk
            .areset             (~rst_n), // areset.reset
            .a                  (mul_o[2 * i]),      //      a.a
            .b                  (mul_o[2 * i + 1]),      //      b.b
            .q                  (add_of2[i])       //      q.q
        );
    end
endgenerate

wire [BITWIDTH-1:0]             add_of4[3:0];
generate 
    for (i = 0; i < 4; i = i + 1) begin : add_of_4_gen
        fp_add fp_add_4
        (
            .clk                (clk_calc),    //    clk.clk
            .areset             (~rst_n), // areset.reset
            .a                  (add_of2[2 * i]),      //      a.a
            .b                  (add_of2[2 * i + 1]),      //      b.b
            .q                  (add_of4[i])       //      q.q
        );
    end
endgenerate

wire [BITWIDTH-1:0]             add_of8[1:0];
generate 
    for (i = 0; i < 2; i = i + 1) begin : add_of_8_gen
        fp_add fp_add_8
        (
            .clk                (clk_calc),    //    clk.clk
            .areset             (~rst_n), // areset.reset
            .a                  (add_of4[2 * i]),      //      a.a
            .b                  (add_of4[2 * i + 1]),      //      b.b
            .q                  (add_of8[i])       //      q.q
        );
    end
endgenerate

wire [BITWIDTH-1:0]             add_ofall;

fp_add add_all(
    .clk                        (clk_calc),    //    clk.clk
    .areset                     (~rst_n), // areset.reset
    .a                          (add_of8[0]),      //      a.a
    .b                          (add_of8[1]),      //      b.b
    .q                          (add_ofall)       //      q.q
);

//-------------------------------------------
// acc of add
//-------------------------------------------
reg [14:0]                      n_s_reg;
reg [14:0]                      data_in_vld_reg;
always @ (posedge clk_calc or negedge rst_n)
begin
    if(!rst_n) begin
        n_s_reg         <= 15'b0;
        data_in_vld_reg <= 15'b0;
    end
    else begin
        n_s_reg         <= {n_s_reg[13:0], new_start};
        data_in_vld_reg <= {data_in_vld_reg[13:0], data_in_vld};
    end
end

wire [BITWIDTH-1:0]             acc_in;
wire [BITWIDTH-1:0]             acc_out;
assign acc_in = data_in_vld_reg[14] ? add_ofall : 0;

fp_acc acc(
    .clk                        (clk_calc),    //    clk.clk
    .areset                     (~rst_n), // areset.reset
    .x                          (acc_in),      //      x.x
    .n                          (n_s_reg[14]),      //      n.n
    .r                          (acc_out),      //      r.r
    .xo                         (),     //     xo.xo
    .xu                         (),     //     xu.xu
    .ao                         (),     //     ao.ao
    .en                         (1'b1)      //     en.en
);

assign data_out = acc_out;

endmodule