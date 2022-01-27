module ddr_rd_data_sync
    #(parameter BANDWIDTH=512,
                BITWIDTH=32)(
	input						ddr_clk_afi		    ,
	input                       sys_clk_200M	    ,
    input                       sys_rst_n		    ,
        
    input                       ddr_vld_afi		    ,
    input [BANDWIDTH-1:0]       ddr_data_out_afi    ,
    input                       ddr_rd_en           ,
        
    output reg                  ddr_rd_fifo_half    ,
	output reg	                ddr_vld			    ,
    output reg [BANDWIDTH-1:0]  ddr_data_out	    
);

wire 					fifo_ddr_data_rd_req;
wire					fifo_ddr_data_rd_empty;
wire					fifo_ddr_data_wrfull;
wire [BANDWIDTH-1:0]    fifo_ddr_data_out;
wire [10:0]             fifo_ddr_data_rdusedw;

reg [511:0]             fifo_ddr_data_in;
reg [511:0]             fifo_ddr_data_in_r;
reg                     fifo_ddr_data_in_vld;
reg                     fifo_ddr_data_in_vld_r;

always @ (posedge ddr_clk_afi or negedge sys_rst_n) begin 
    if (!sys_rst_n) begin 
        fifo_ddr_data_in <= 0;
        fifo_ddr_data_in_r <= 0;
        fifo_ddr_data_in_vld <= 1'b0;
        fifo_ddr_data_in_vld_r <= 1'b0;
    end else begin 
        fifo_ddr_data_in <= ddr_data_out_afi;
        fifo_ddr_data_in_r <= fifo_ddr_data_in;
        fifo_ddr_data_in_vld <= ddr_vld_afi;
        fifo_ddr_data_in_vld_r <= fifo_ddr_data_in_vld;
    end
end

fifo_ddr_data_rev fifo_ddr_data_rev(
	.wrclk				(ddr_clk_afi			),
	.wrreq				(fifo_ddr_data_in_vld	),
	.data				(fifo_ddr_data_in		),
	.rdclk				(sys_clk_200M			),
	.rdreq				(fifo_ddr_data_rd_req	),
	.q					(fifo_ddr_data_out		),
    .aclr               (~sys_rst_n             ),
    .rdusedw            (fifo_ddr_data_rdusedw  ), 
	.rdempty			(fifo_ddr_data_rd_empty ),
	.wrfull				(fifo_ddr_data_wrfull	)	
);

always @ (posedge sys_clk_200M or negedge sys_rst_n) begin 
    if (!sys_rst_n) begin 
        ddr_rd_fifo_half <= 1'b0;
    end else if (fifo_ddr_data_rdusedw > 11'd256) begin 
        ddr_rd_fifo_half <= 1'b1;
    end else begin 
        ddr_rd_fifo_half <= 1'b0;
    end
end

assign fifo_ddr_data_rd_req = ~fifo_ddr_data_rd_empty & ddr_rd_en;

always @ (posedge sys_clk_200M or negedge sys_rst_n) begin 
	if (!sys_rst_n) begin 
		ddr_vld			<= 0;
		ddr_data_out	<= 0;
	end else begin 
		ddr_vld			<= fifo_ddr_data_rd_req;
        ddr_data_out    <= fifo_ddr_data_out;
		// ddr_data_out    <= {fifo_ddr_data_out[ 31:  0], fifo_ddr_data_out[ 63: 32], 
                            // fifo_ddr_data_out[ 95: 64], fifo_ddr_data_out[127: 96],
                            // fifo_ddr_data_out[159:128], fifo_ddr_data_out[191:160],
                            // fifo_ddr_data_out[223:192], fifo_ddr_data_out[255:224],
                            // fifo_ddr_data_out[287:256], fifo_ddr_data_out[319:288],
                            // fifo_ddr_data_out[351:320], fifo_ddr_data_out[383:352],
                            // fifo_ddr_data_out[415:384], fifo_ddr_data_out[447:416],
                            // fifo_ddr_data_out[479:448], fifo_ddr_data_out[511:480]};
	end
end

endmodule 

