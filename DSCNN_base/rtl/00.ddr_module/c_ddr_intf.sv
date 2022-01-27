`ifndef C_DDR_INTF__SV
`define C_DDR_INTF__SV

`define SET_T  #0.01ns
`define HLD_T  #0.01ns
`timescale 1ps/1ps

interface c_ddr_intf(input bit clk, input bit rst_n);
    logic               wr_req  ;
    logic               rd_req  ;
    logic   [ 25:0]     cmd_addr;
    logic   [511:0]     data_in ;
    logic   [511:0]     data_out;
    logic   [  6:0]     bst_len ;
    logic   [ 63:0]     avl_be  ;
    logic               ddr_rdy ;
    logic               ddr_vld ;

    clocking drv_cb @ (posedge clk);
        default input `SET_T output `HLD_T;
        
        output  data_out;
        output  ddr_rdy ;
        output  ddr_vld ;
    endclocking: drv_cb

    clocking mon_cb @ (posedge clk);
        default input `SET_T output `HLD_T;

        input   wr_req  ;
        input   rd_req  ;
        input   cmd_addr;
        input   data_in ;
        input   data_out;
        input   bst_len ;
        input   avl_be  ;
        input   ddr_rdy ;
    endclocking: mon_cb

endinterface: c_ddr_intf

`endif
