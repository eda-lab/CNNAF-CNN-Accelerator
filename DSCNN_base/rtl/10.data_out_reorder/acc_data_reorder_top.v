module acc_data_reorder_top
    #(parameter BANDWIDTH=512,
                BITWIDTH=32)(
    input                           clk_calc,
    input                           rst_n,
    
    //////////acc_data//////////
    input                           data_in_vld,
    input wire [BITWIDTH*16-1:0]    data_in,
    output wire                     net_map_finish,
    //////////last_slice_reorder_valid_of_each_layer//////////
    output wire                     last_slice_vld,
    
    output wire                     calc_res_vld,
    output wire [BITWIDTH*16-1:0]   calc_res,  
    
    output wire                     data_map_ins_vld,
    output wire [BITWIDTH*16+26+7+1-1:0]   data_map_ins     
);

addr_map addr_map(
    .clk_calc           (clk_calc               ),
    .rst_n              (rst_n                  ),       
    .data_in            (data_in                ),
    .data_in_vld        (data_in_vld            ),
    .net_all_finish     (net_map_finish         ),
    .last_slice_vld     (last_slice_vld         ),
    .calc_res_vld       (calc_res_vld           ),
    .calc_res           (calc_res               ), 
    .ddr_wr_ins_vld     (data_map_ins_vld       ),
    .ddr_wr_ins         (data_map_ins           )
);

endmodule

