`include "../c_ddr_intf.sv"
`include "../c_ddr_model.sv"
`timescale 1ns/1ps
module ddr_module_tb();

reg                             ddr_clk         ;
reg                             ddr_rst_n       ;

wire                            ddr_ready       ;
wire                            ddr_rd_req      ;
wire                            ddr_wr_req      ;
wire [25:0]                     ddr_address     ;
wire [6:0]                      ddr_bl_size     ;
wire                            ddr_rd_data_vld ;
wire [511:0]                    ddr_rd_data     ;
wire [511:0]					ddr_wr_data     ;
wire [63:0]                     ddr_be          ;

ddr4_test_driver ddr4_test_driver_tb(
    /*input              */.sync_clk            (ddr_clk            ),
    /*input              */.reset_n             (ddr_rst_n          ),
    
    /*input              */.avl_ready           (ddr_ready          ), 
    /*input              */.avl_rdata_valid     (ddr_rd_data_vld    ),
    /*input      [511:0] */.avl_rdata           (ddr_rd_data        ),
    
    /*output reg [25:0]  */.avl_addr            (ddr_address        ),
    /*output reg [511:0] */.avl_wdata           (ddr_wr_data        ),
    /*output reg [63:0]  */.avl_be              (ddr_be             ),
    /*output reg         */.avl_read_req        (ddr_rd_req         ),
    /*output reg         */.avl_write_req       (ddr_wr_req         ),
    /*output reg [6:0]   */.avl_size            (ddr_bl_size        )
);

c_ddr_intf  ddr_intf(ddr_clk, ddr_rst_n);
c_ddr_model ddr_model;

assign ddr_intf.wr_req      = ddr_wr_req	;
assign ddr_intf.rd_req      = ddr_rd_req    ;
assign ddr_intf.cmd_addr    = ddr_address   ;
assign ddr_intf.data_in     = ddr_wr_data   ;
assign ddr_intf.bst_len     = ddr_bl_size   ;
assign ddr_intf.avl_be      = ddr_be        ;

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

initial
begin 
    $fsdbDumpfile("mobilenet_sim.fsdb");
    $fsdbDumpvars("+all");
end

initial begin 
#0
    ddr_clk = 1'b0;
    ddr_rst_n = 1'b0;
#100
    ddr_rst_n = 1'b1;
#10000
    $finish;
end

initial begin 
	#1
		ddr_clk = 1'b0;
	forever begin 
		#3
			ddr_clk = ~ddr_clk;
	end
end

endmodule 