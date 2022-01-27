`include "../rtl/00.ddr_module/c_ddr_intf.sv"
`include "../rtl/00.ddr_module/c_ddr_model.sv"
`timescale 1ns/1ps

module mobilenet_acc_tb;

reg                             clk_250M        ;
reg                             clk_200M        ;
reg                             rst_n           ;
reg 							ddr_clk			;
reg								ddr_rst_n		;

reg                             uart_rdreq      ;
wire                            uart_out_vld    ;
wire [31:0]                     uart_out        ;

reg								ddr_local_init_done;

wire                            ddr_ready       ;
wire                            ddr_rd_req      ;
wire                            ddr_wr_req      ;
wire [25:0]                     ddr_address     ;
wire [6:0]                      ddr_bl_size     ;
wire                            ddr_rd_data_vld;
wire [511:0]                    ddr_rd_data;
wire [511:0]					ddr_wr_data;


mobilenet_test_top_forsim mobilenet_test_top(
	/*input				*/.sys_clk_100M				(clk_200M),
	/*input				*/.sys_clk_200M				(clk_250M),
	/*input				*/.sys_rst_n				(rst_n),
	
	/*input				*/.ddr_clk					(ddr_clk),
	/*input				*/.ddr_rst_n				(ddr_rst_n),	
	
    /*input             */.uart_rdreq               (uart_rdreq),
    /*output            */.uart_out_vld             (uart_out_vld),
    /*output [31:0]     */.uart_out                 (uart_out),
    
	/*input             */.ddr_avl_local_init_done	(ddr_local_init_done),
    /*input             */.ddr_avl_ready           	(ddr_ready),
    /*input             */.ddr_avl_rd_data_vld     	(ddr_rd_data_vld),
    /*input   [511:0]   */.ddr_avl_rd_data         	(ddr_rd_data),
    /*output            */.ddr_avl_rd_req          	(ddr_rd_req),
    /*output            */.ddr_avl_wr_req          	(ddr_wr_req),
    /*output  [27:0]    */.ddr_avl_address         	(ddr_address),
    /*output  [3:0]     */.ddr_avl_bl_size         	(ddr_bl_size),
    /*output  [511:0]   */.ddr_avl_write_data		(ddr_wr_data)	
);


c_ddr_intf  ddr_intf(ddr_clk, ddr_rst_n);
c_ddr_model ddr_model;
assign ddr_intf.wr_req      = ddr_wr_req	;
assign ddr_intf.rd_req      = ddr_rd_req    ;
assign ddr_intf.cmd_addr    = ddr_address   ;
assign ddr_intf.data_in     = ddr_wr_data   ;
assign ddr_intf.bst_len     = ddr_bl_size   ;
assign ddr_intf.avl_be      = 64'hffffffffffffffff;

assign ddr_rd_data = ddr_intf.data_out      ;
assign ddr_ready  = ddr_intf.ddr_rdy      	;
assign ddr_rd_data_vld  = ddr_intf.ddr_vld  ;

initial begin
    ddr_model = new();
end

initial begin
    ddr_model.ddr_intf = ddr_intf;
end

initial begin
    ddr_model.main();
end

integer layer0_bias;
integer layer1_bias;
integer layer2_bias;
integer layer3_bias;
integer layer4_bias;
integer layer5_bias;
integer layer6_bias;
integer layer7_bias;
integer layer8_bias;
integer layer9_bias;
integer layer10_bias;
integer layer11_bias;
integer layer12_bias;
integer layer13_bias;
integer layer14_bias;
integer layer15_bias;
integer layer16_bias;
integer layer17_bias;
integer layer18_bias;
integer layer19_bias;
integer layer20_bias;
integer layer21_bias;
integer layer22_bias;
integer layer23_bias;
integer layer24_bias;
integer layer25_bias;
integer layer26_bias;
integer layer27_bias;
integer layer28_bias;
integer layer29_bias;
integer layer30_bias;
integer layer31_bias;
integer layer32_bias;
integer layer33_bias;
integer layer34_bias;
integer layer35_bias;
integer layer36_bias;
integer layer37_bias;
integer layer38_bias;
integer layer39_bias;
integer layer40_bias;
integer layer41_bias;
integer layer42_bias;
integer layer43_bias;
integer layer44_bias;
integer layer45_bias;
integer layer46_bias;
integer layer47_bias;
integer layer48_bias;
integer layer49_bias;
integer layer50_bias;
integer layer51_bias;
integer layer52_bias;
integer layer53_bias;


initial
begin
    layer0_bias = $fopen("./sim_res_file/layer0_bias_tb.txt", "w");
    layer1_bias = $fopen("./sim_res_file/layer1_bias_tb.txt", "w");
    layer2_bias = $fopen("./sim_res_file/layer2_bias_tb.txt", "w");
    layer3_bias = $fopen("./sim_res_file/layer3_bias_tb.txt", "w");
    layer4_bias = $fopen("./sim_res_file/layer4_bias_tb.txt", "w");
    layer5_bias = $fopen("./sim_res_file/layer5_bias_tb.txt", "w");
    layer6_bias = $fopen("./sim_res_file/layer6_bias_tb.txt", "w");
    layer7_bias = $fopen("./sim_res_file/layer7_bias_tb.txt", "w");
    layer8_bias = $fopen("./sim_res_file/layer8_bias_tb.txt", "w");
    layer9_bias = $fopen("./sim_res_file/layer9_bias_tb.txt", "w");
    layer10_bias = $fopen("./sim_res_file/layer10_bias_tb.txt", "w");
    layer11_bias = $fopen("./sim_res_file/layer11_bias_tb.txt", "w");
    layer12_bias = $fopen("./sim_res_file/layer12_bias_tb.txt", "w");
    layer13_bias = $fopen("./sim_res_file/layer13_bias_tb.txt", "w");
    layer14_bias = $fopen("./sim_res_file/layer14_bias_tb.txt", "w");
    layer15_bias = $fopen("./sim_res_file/layer15_bias_tb.txt", "w");
    layer16_bias = $fopen("./sim_res_file/layer16_bias_tb.txt", "w");
    layer17_bias = $fopen("./sim_res_file/layer17_bias_tb.txt", "w");
    layer18_bias = $fopen("./sim_res_file/layer18_bias_tb.txt", "w");
    layer19_bias = $fopen("./sim_res_file/layer19_bias_tb.txt", "w");
    layer20_bias = $fopen("./sim_res_file/layer20_bias_tb.txt", "w");
    layer21_bias = $fopen("./sim_res_file/layer21_bias_tb.txt", "w");
    layer22_bias = $fopen("./sim_res_file/layer22_bias_tb.txt", "w");
    layer23_bias = $fopen("./sim_res_file/layer23_bias_tb.txt", "w");
    layer24_bias = $fopen("./sim_res_file/layer24_bias_tb.txt", "w");
    layer25_bias = $fopen("./sim_res_file/layer25_bias_tb.txt", "w");
    layer26_bias = $fopen("./sim_res_file/layer26_bias_tb.txt", "w");
    layer27_bias = $fopen("./sim_res_file/layer27_bias_tb.txt", "w");
    layer28_bias = $fopen("./sim_res_file/layer28_bias_tb.txt", "w");
    layer29_bias = $fopen("./sim_res_file/layer29_bias_tb.txt", "w");
    layer30_bias = $fopen("./sim_res_file/layer30_bias_tb.txt", "w");   
    layer31_bias = $fopen("./sim_res_file/layer31_bias_tb.txt", "w");
    layer32_bias = $fopen("./sim_res_file/layer32_bias_tb.txt", "w");
    layer33_bias = $fopen("./sim_res_file/layer33_bias_tb.txt", "w");
    layer34_bias = $fopen("./sim_res_file/layer34_bias_tb.txt", "w");
    layer35_bias = $fopen("./sim_res_file/layer35_bias_tb.txt", "w");
    layer36_bias = $fopen("./sim_res_file/layer36_bias_tb.txt", "w");
    layer37_bias = $fopen("./sim_res_file/layer37_bias_tb.txt", "w");
    layer38_bias = $fopen("./sim_res_file/layer38_bias_tb.txt", "w");
    layer39_bias = $fopen("./sim_res_file/layer39_bias_tb.txt", "w");
    layer40_bias = $fopen("./sim_res_file/layer40_bias_tb.txt", "w");
    layer41_bias = $fopen("./sim_res_file/layer41_bias_tb.txt", "w");
    layer42_bias = $fopen("./sim_res_file/layer42_bias_tb.txt", "w");
    layer43_bias = $fopen("./sim_res_file/layer43_bias_tb.txt", "w");
    layer44_bias = $fopen("./sim_res_file/layer44_bias_tb.txt", "w");
    layer45_bias = $fopen("./sim_res_file/layer45_bias_tb.txt", "w");
    layer46_bias = $fopen("./sim_res_file/layer46_bias_tb.txt", "w");
    layer47_bias = $fopen("./sim_res_file/layer47_bias_tb.txt", "w");
    layer48_bias = $fopen("./sim_res_file/layer48_bias_tb.txt", "w");
    layer49_bias = $fopen("./sim_res_file/layer49_bias_tb.txt", "w");
    layer50_bias = $fopen("./sim_res_file/layer50_bias_tb.txt", "w");
    layer51_bias = $fopen("./sim_res_file/layer51_bias_tb.txt", "w");
    layer52_bias = $fopen("./sim_res_file/layer52_bias_tb.txt", "w");
    layer53_bias = $fopen("./sim_res_file/layer53_bias_tb.txt", "w");
end

initial
begin 
    // $fsdbDumpfile("mobilenet_sim.fsdb");
    $fsdbAutoSwitchDumpfile(1024, "mobilenet_sim.fsdb", 10);
    $fsdbDumpvars("+all");
    // $fsdbDumpoff();
    $fsdbDumpon();
end

integer fsdb_on = 0;
always @ (posedge clk_200M) begin 
    if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.layer_num_cur == 45 && fsdb_on == 0) begin 
        $fsdbDumpon();
        fsdb_on = 1;
    end
end

always @ (posedge clk_250M) begin 
    if (mobilenet_acc_tb.mobilenet_test_top.ddr_rd_data_sync_u0.fifo_ddr_data_rev.wrfull == 1'b1) begin 
        $display("Error! Recieve fifo is full");
    end else if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.ddr_ctrl.ddr_wr_ins_fifo_full == 1'b1) begin 
        $display("Error! WR fifo is full");
    end
end

initial
begin
#0
    clk_250M = 1'b0;           
    clk_200M = 1'b0;
    rst_n = 1'b0;
	ddr_rst_n = 1'b0;
	ddr_clk = 1'b0;
	ddr_local_init_done = 1'b0;
    uart_rdreq = 1'b0;
#20
    rst_n = 1'b1;
	ddr_rst_n = 1'b1;
	ddr_local_init_done = 1'b1;
end

integer finish_cnt = 0;

always @ (posedge clk_200M) begin 
    if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.layer_num_cur == 53 &&
        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.pw2pw_reorder_finish == 1'b1) begin 
        finish_cnt = finish_cnt + 1;
    end
end

always @ (posedge clk_200M)
begin
    if ((mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.layer_num_cur == 53 &&
        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.pw2pw_reorder_finish == 1'b1 &&
        finish_cnt == 0)  
        /*    ||
        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.layer_num_cur == 50   */) begin 
        $fclose( layer0_bias);
        $fclose( layer1_bias);
        $fclose( layer2_bias);
        $fclose( layer3_bias);
        $fclose( layer4_bias);
        $fclose( layer5_bias);
        $fclose( layer6_bias);
        $fclose( layer7_bias);
        $fclose( layer8_bias);
        $fclose( layer9_bias);
        $fclose(layer10_bias);
        $fclose(layer11_bias);
        $fclose(layer12_bias);
        $fclose(layer13_bias);
        $fclose(layer14_bias);
        $fclose(layer15_bias);
        $fclose(layer16_bias);
        $fclose(layer17_bias);
        $fclose(layer18_bias);
        $fclose(layer19_bias);
        $fclose(layer20_bias);
        $fclose(layer21_bias);
        $fclose(layer22_bias);
        $fclose(layer23_bias);
        $fclose(layer24_bias);
        $fclose(layer25_bias);
        $fclose(layer26_bias);
        $fclose(layer27_bias);
        $fclose(layer28_bias);
        $fclose(layer29_bias);
        $fclose(layer30_bias);
        $fclose(layer31_bias);
        $fclose(layer32_bias);
        $fclose(layer33_bias);
        $fclose(layer34_bias);
        $fclose(layer35_bias);
        $fclose(layer36_bias);
        $fclose(layer37_bias);
        $fclose(layer38_bias);
        $fclose(layer39_bias);
        $fclose(layer40_bias);
        $fclose(layer41_bias);
        $fclose(layer42_bias);
        $fclose(layer43_bias);
        $fclose(layer44_bias);
        $fclose(layer45_bias);
        $fclose(layer46_bias);
        $fclose(layer47_bias);
        $fclose(layer48_bias);
        $fclose(layer49_bias);
        $fclose(layer50_bias);
        $fclose(layer51_bias);
        $fclose(layer52_bias);
        $fclose(layer53_bias);
        $finish;  
    end
end


int sim_time = 0;
int layer_cnt = 0;
int pw24_cnt = 0;
int sim_time_last = 0;

always begin
#2000
    sim_time = mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.data_bias_out_vld_cnt;
    layer_cnt = mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.layer_num_cur;
    $display("------------sim: %d------------layer: %d------------//", sim_time, layer_cnt);
end

always begin 
#20000
    if (sim_time == sim_time_last) begin 
        $fclose(layer0_bias );
        $fclose(layer1_bias );
        $fclose(layer2_bias );
        $fclose(layer3_bias );
        $fclose(layer4_bias );
        $fclose(layer5_bias );
        $fclose(layer6_bias );
        $fclose(layer7_bias );
        $fclose(layer8_bias );
        $fclose(layer9_bias );
        $fclose(layer10_bias);
        $fclose(layer11_bias);
        $fclose(layer12_bias);
        $fclose(layer13_bias);
        $fclose(layer14_bias);
        $fclose(layer15_bias);
        $fclose(layer16_bias);
        $fclose(layer17_bias);
        $fclose(layer18_bias);
        $fclose(layer19_bias);
        $fclose(layer20_bias);
        $fclose(layer21_bias);
        $fclose(layer22_bias);
        $fclose(layer23_bias);
        $fclose(layer24_bias);
        $fclose(layer25_bias);
        $fclose(layer26_bias);
        $fclose(layer27_bias);
        $fclose(layer28_bias);
        $fclose(layer29_bias);
        $fclose(layer30_bias);
        $fclose(layer31_bias);
        $fclose(layer32_bias);
        $fclose(layer33_bias);
        $fclose(layer34_bias);
        $fclose(layer35_bias);
        $fclose(layer36_bias);
        $fclose(layer37_bias);
        $fclose(layer38_bias);
        $fclose(layer39_bias);
        $fclose(layer40_bias);
        $fclose(layer41_bias);
        $fclose(layer42_bias);
        $fclose(layer43_bias);
        $fclose(layer44_bias);
        $fclose(layer45_bias);
        $fclose(layer46_bias);
        $fclose(layer47_bias);
        $fclose(layer48_bias);
        $fclose(layer49_bias);
        $fclose(layer50_bias);
        $fclose(layer51_bias);
        $fclose(layer52_bias);
        $fclose(layer53_bias);
        $finish;
    end else begin 
        sim_time_last = sim_time;
    end
end

always @ (posedge clk_200M)
begin
    case (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.layer_num_cur)
        0 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer0_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        1 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer1_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        2 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer2_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        3 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer3_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        4 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer4_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        5 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                pw24_cnt = pw24_cnt + 1;
                if (pw24_cnt <= 1024) begin 
                    $fdisplay(layer5_bias , "%x %x %x %x %x %x %x %x", 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224]);
                    $fdisplay(layer5_bias , "%x %x %x %x %x %x %x %x", 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
                end else begin 
                    $fdisplay(layer5_bias , "%x %x %x %x %x %x %x %x", 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224]);
                end
            end
        end
        6 : begin 
            pw24_cnt = 0;
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer6_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        7 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer7_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        8 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                pw24_cnt = pw24_cnt + 1;
                if (pw24_cnt <= 1024) begin 
                    $fdisplay(layer8_bias , "%x %x %x %x %x %x %x %x", 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224]);
                    $fdisplay(layer8_bias , "%x %x %x %x %x %x %x %x", 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
                end else begin 
                    $fdisplay(layer8_bias , "%x %x %x %x %x %x %x %x", 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                        mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224]);
                end
            end
        end
        9 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer9_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        10 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer10_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x",  
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        11 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer11_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        12 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer12_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        13 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer13_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        14 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer14_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        15 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer15_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        16 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer16_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        17 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer17_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        18 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer18_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        19 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer19_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x",
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        20 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer20_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        21 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer21_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        22 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer22_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        23 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer23_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        24 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer24_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        25 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer25_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        26 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer26_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        27 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer27_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        28 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer28_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        29 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer29_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        30 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer30_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        31 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer31_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        32 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer32_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        33 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer33_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        34 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer34_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        35 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer35_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        36 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer36_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        37 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer37_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        38 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer38_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        39 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer39_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        40 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer40_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        41 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer41_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        42 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer42_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        43 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer43_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        44 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer44_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        45 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer45_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        46 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer46_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        47 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer47_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        48 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer48_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        49 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer49_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        50 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer50_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        51 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer51_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
        52 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer52_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end        
        53 : begin 
            if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                $fdisplay(layer53_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            end
        end
    endcase
end


always begin
#2ns
    clk_250M = ~clk_250M;
end

always begin
#2500ps
    clk_200M = ~clk_200M;
end

always begin 
#180
    uart_rdreq = 1'b1;
#20
    uart_rdreq = 1'b0;
end

initial begin 
	#1ns
		ddr_clk = 1'b0;
	forever begin 
		#1666ps
			ddr_clk = ~ddr_clk;
	end
end


endmodule


        // 0 : begin 
            // if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.fifo_rd_hs == 1'b1) begin 
                // $fdisplay(layer4_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
                    // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 31:  0], 
                    // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 63: 32],
                    // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[ 95: 64], 
                    // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[127: 96],
                    // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[159:128], 
                    // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[191:160],
                    // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[223:192], 
                    // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[255:224],
                    // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[287:256], 
                    // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[319:288],
                    // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[351:320], 
                    // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[383:352],
                    // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[415:384], 
                    // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[447:416],
                    // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[479:448], 
                    // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.acc_data_reorder_top.addr_map.data_in[511:480]);
            // end
        // end


    // if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_out_vld == 1'b1 && 
                 // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.data_bias_out_vld_cnt >= 0 &&
                 // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.data_bias_out_vld_cnt < 1024) begin 
        // $fdisplay(layer8_bias , "%x %x %x %x %x %x %x %x", 
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[ 31:  0], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[ 63: 32],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[ 95: 64], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[127: 96],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[159:128], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[191:160],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[223:192], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[255:224]); 
        // $fdisplay(layer8_bias , "%x %x %x %x %x %x %x %x",    
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[287:256], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[319:288],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[351:320], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[383:352],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[415:384], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[447:416],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[479:448], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[511:480]);       
    // end else if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_out_vld == 1'b1 && 
                 // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.data_bias_out_vld_cnt >= 1024 &&
                 // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.data_bias_out_vld_cnt < 2048) begin 
        // $fdisplay(layer8_bias , "%x %x %x %x %x %x %x %x", 
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[ 31:  0], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[ 63: 32],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[ 95: 64], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[127: 96],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[159:128], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[191:160],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[223:192], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[255:224]);      
    // end else if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_out_vld == 1'b1 && 
                 // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.data_bias_out_vld_cnt >= 2048 &&
                 // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.data_bias_out_vld_cnt < 11264) begin
        // $fdisplay(layer9_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[ 31:  0], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[ 63: 32],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[ 95: 64], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[127: 96],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[159:128], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[191:160],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[223:192], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[255:224],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[287:256], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[319:288],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[351:320], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[383:352],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[415:384], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[447:416],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[479:448], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[511:480]);
	// end else if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_out_vld == 1'b1 && 
                 // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.data_bias_out_vld_cnt >= 11264 &&
                 // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.data_bias_out_vld_cnt < 15872) begin
        // $fdisplay(layer10_bias , "%x %x %x %x %x %x %x %x", 
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[ 63: 32],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[127: 96],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[191:160],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[255:224],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[319:288],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[383:352],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[447:416],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[511:480]);
	// end else if (mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_out_vld == 1'b1 && 
                 // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.data_bias_out_vld_cnt >= 15872 &&
                 // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.data_bias_out_vld_cnt < 16384) begin
        // $fdisplay(layer11_bias , "%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x", 
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[ 31:  0], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[ 63: 32],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[ 95: 64], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[127: 96],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[159:128], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[191:160],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[223:192], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[255:224],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[287:256], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[319:288],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[351:320], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[383:352],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[415:384], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[447:416],
            // mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[479:448], mobilenet_acc_tb.mobilenet_test_top.mobilenet_acc_top.bias_add_data_out[511:480]);
	// end

