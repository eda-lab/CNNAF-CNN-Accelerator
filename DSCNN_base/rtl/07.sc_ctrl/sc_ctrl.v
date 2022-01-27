module sc_ctrl
    #(parameter BANDWIDTH=512,
                BITWIDTH=32)(
    input                           clk_data    ,
    input                           clk_calc    ,
    input                           rst_n       ,

    input [BITWIDTH*16-1:0]         sc_in       ,
    input                           sc_in_vld   ,

    input                           sc_out_en   ,    
    output reg [BITWIDTH*16-1:0]    sc_out
);

wire [511:0]                        fifo_sc_data_part;
wire [6:0]                          fifo_sc_rdusedw;
wire                                fifo_sc_rdempty;
wire                                fifo_sc_wrfull;
reg                                 fifo_sc_rdreq;

fifo_sc fifo_sc_inst0 (
    .wrclk   (clk_data          ),  //   input,    width = 1,            .wrclk
    .wrreq   (sc_in_vld         ),  //   input,    width = 1,            .wrreq
    .data    (sc_in             ),  //   input,  width = 512,  fifo_input.datain
    .rdclk   (clk_calc          ),  //   input,    width = 1,            .rdclk
    .rdreq   (fifo_sc_rdreq     ),  //   input,    width = 1,            .rdreq
    .q       (fifo_sc_data_part ),  //  output,  width = 512, fifo_output.dataout  
    .aclr    (~rst_n            ),  //   input,    width = 1,            .aclr
    .rdusedw (fifo_sc_rdusedw   ),  //  output,    width = 7,            .rdusedw
    .rdempty (fifo_sc_rdempty   ),  //  output,    width = 1,            .rdempty
    .wrfull  (fifo_sc_wrfull    )   //  output,    width = 1,            .wrfull
);

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        fifo_sc_rdreq <= 1'b0;
        sc_out        <= 0;
    end else begin 
        fifo_sc_rdreq <= sc_out_en;
        sc_out        <= fifo_sc_data_part;
    end
end

endmodule 
