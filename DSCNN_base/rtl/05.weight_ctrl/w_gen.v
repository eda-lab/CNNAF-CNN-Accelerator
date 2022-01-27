module w_gen
    #(parameter BANDWIDTH=512,
                BITWIDTH=32)(
    input                       clk_data,
    input                       rst_n,
    input                       clk_calc,
    
    input                       w_in_vld,
    input [BANDWIDTH-1:0]       w_in,
    input                       data_vld_in,
    input                       data_acc_layer_finish,
    
    output                      w_load_done,
    output [BITWIDTH*256-1:0]   w_out
);

wire [15:0]                     ram_w_wr_en;
wire [7:0]                      ram_w_wr_addr;
wire [BITWIDTH*256-1:0]         ram_w_wr_data_all;
wire [10:0]                     w_chg_ctrl_ub;
wire [10:0]                     w_chg_ctrl_lb;
wire                            w_read_per_dw_slice_done;
wire [7:0]                      w_read_dw_addr;
wire                            w_read_per_slice_done;


w_rd_ctrl w_rd_ctrl(
    .clk_data                   (clk_data               ),
    .rst_n                      (rst_n                  ),
    .w_in_vld                   (w_in_vld               ),
    .w_in                       (w_in                   ),
    .w_read_per_dw_slice_done   (w_read_per_dw_slice_done),
    .w_read_dw_addr             (w_read_dw_addr         ),
    .w_read_per_slice_done      (w_read_per_slice_done  ),
    .ram_w_wr_en                (ram_w_wr_en            ),
    .ram_w_wr_addr              (ram_w_wr_addr          ),
    .ram_w_wr_data_all          (ram_w_wr_data_all      )
);

genvar i;

wire [7:0]                      ram_w_rd_addr;

generate
    for(i = 0; i < 16; i = i + 1) begin : ram_w_gen
        ram_w ram_w_gen (
            .wrclock            ( clk_data                  ),
            .wren               ( ram_w_wr_en[i]            ),
            .wraddress          ( ram_w_wr_addr             ),
            .data               ( ram_w_wr_data_all[BANDWIDTH*i+BANDWIDTH-1 : BANDWIDTH*i]),
            
            .rdclock            ( clk_calc                  ),
            .rdaddress          ( ram_w_rd_addr             ),
            .q                  ( w_out[BANDWIDTH*i+BANDWIDTH-1 : BANDWIDTH*i]  )
        );
    end
endgenerate

w_chg_ctrl w_chg_ctrl(
    .clk_calc                   ( clk_calc          ),
    .rst_n                      ( rst_n             ),
    // .w_read_per_dw_slice_done   (w_read_per_dw_slice_done),
    // .w_read_dw_addr             (w_read_dw_addr     ),
    .w_read_per_slice_done      ( w_read_per_slice_done),
    .w_chg_en                   ( data_acc_layer_finish),
    .w_chg_vld_in               ( data_vld_in       ),  
    .w_ram_rd_addr              ( ram_w_rd_addr     ),
    .w_chg_load_done            ( w_load_done       )
);

endmodule