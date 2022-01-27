module ddr4_ctrl_with_test_top(
    input                   sys_clk                 ,
    input                   global_reset_n          ,
    input                   ddr_init_continue       ,
    //ddr4 interface
    input                   pll_ref_clk             ,
    input                   oct_rzqin               ,
    
    output                  mem_ck                  ,
    output                  mem_ck_n                ,
    output [16:0]           mem_a                   ,
    output                  mem_act_n               ,
    output [ 1:0]           mem_ba                  ,
    output                  mem_bg                  ,
    output                  mem_cke                 ,
    output                  mem_cs_n                ,
    output                  mem_odt                 ,
    output                  mem_reset_n             ,
    output                  mem_par                 ,
    input                   mem_alert_n             ,
    inout  [ 7:0]           mem_dqs                 ,
    inout  [ 7:0]           mem_dqs_n               ,
    inout  [63:0]           mem_dq                  ,
    inout  [ 7:0]           mem_dbi_n               
);

wire                        ddr4_user_clk           ;
wire                        ddr4_user_reset_n       ;
wire                        avl_ready               ;
wire                        avl_rdata_valid         ;
wire [511:0]                avl_rdata               ;
wire [25:0]                 avl_addr                ;
wire [511:0]                avl_wdata               ;
wire [63:0]                 avl_be                  ;
wire                        avl_read_req            ;
wire                        avl_write_req           ;
wire [6:0]                  avl_size                ;     
wire                        local_cal_fail          ;
wire                        local_cal_success       ;       


ddr4_qsys ins0_ddr4_ctrl(
    .global_reset_n         (global_reset_n),      //   input,    width = 1,   global_reset_n.reset_n
    .pll_ref_clk            (pll_ref_clk),         //   input,    width = 1,      pll_ref_clk.clk
    .oct_rzqin              (oct_rzqin),           //   input,    width = 1,              oct.oct_rzqin
    .mem_ck                 (mem_ck),              //  output,    width = 1,              mem.mem_ck
    .mem_ck_n               (mem_ck_n),            //  output,    width = 1,                 .mem_ck_n
    .mem_a                  (mem_a),               //  output,   width = 17,                 .mem_a
    .mem_act_n              (mem_act_n),           //  output,    width = 1,                 .mem_act_n
    .mem_ba                 (mem_ba),              //  output,    width = 2,                 .mem_ba
    .mem_bg                 (mem_bg),              //  output,    width = 1,                 .mem_bg
    .mem_cke                (mem_cke),             //  output,    width = 1,                 .mem_cke
    .mem_cs_n               (mem_cs_n),            //  output,    width = 1,                 .mem_cs_n
    .mem_odt                (mem_odt),             //  output,    width = 1,                 .mem_odt
    .mem_reset_n            (mem_reset_n),         //  output,    width = 1,                 .mem_reset_n
    .mem_par                (mem_par),             //  output,    width = 1,                 .mem_par
    .mem_alert_n            (mem_alert_n),         //   input,    width = 1,                 .mem_alert_n
    .mem_dqs                (mem_dqs),             //   inout,    width = 8,                 .mem_dqs
    .mem_dqs_n              (mem_dqs_n),           //   inout,    width = 8,                 .mem_dqs_n
    .mem_dq                 (mem_dq),              //   inout,   width = 64,                 .mem_dq
    .mem_dbi_n              (mem_dbi_n),           //   inout,    width = 8,                 .mem_dbi_n
    .local_cal_success      (local_cal_success),   //  output,    width = 1,           status.local_cal_success
    .local_cal_fail         (local_cal_fail),      //  output,    width = 1,                 .local_cal_fail
    .emif_usr_reset_n       (ddr4_user_reset_n),    //  output,    width = 1, emif_usr_reset_n.reset_n
    .emif_usr_clk           (ddr4_user_clk),        //  output,    width = 1,     emif_usr_clk.clk
    .amm_ready_0            (avl_ready),            //  output,    width = 1,       ctrl_amm_0.waitrequest_n
    .amm_read_0             (avl_read_req),         //   input,    width = 1,                 .read
    .amm_write_0            (avl_write_req),        //   input,    width = 1,                 .write
    .amm_address_0          (avl_addr),             //   input,   width = 26,                 .address
    .amm_readdata_0         (avl_rdata),            //  output,  width = 512,                 .readdata
    .amm_writedata_0        (avl_wdata),            //   input,  width = 512,                 .writedata
    .amm_burstcount_0       (avl_size),             //   input,    width = 7,                 .burstcount
    .amm_byteenable_0       (avl_be),               //   input,   width = 64,                 .byteenable
    .amm_readdatavalid_0    (avl_rdata_valid)       //  output,    width = 1,                 .readdatavalid
);

ddr4_test_driver inst0_ddr4_test_driver(
    .sync_clk               (ddr4_user_clk      ), //  input                   
    .reset_n                (ddr4_user_reset_n  ), //  input                   
    .avl_ready              (avl_ready          ), //  input                   
    .avl_rdata_valid        (avl_rdata_valid    ), //  input                   
    .avl_rdata              (avl_rdata          ), //  input [511:0]            
    .avl_addr               (avl_addr           ), //  output reg [25:0]       
    .avl_wdata              (avl_wdata          ), //  output reg [511:0]      
    .avl_be                 (avl_be             ), //  output reg [63:0]       
    .avl_read_req           (avl_read_req       ), //  output reg              
    .avl_write_req          (avl_write_req      ), //  output reg              
    .avl_size               (avl_size           )  //  output reg [6:0]        
);

endmodule 
