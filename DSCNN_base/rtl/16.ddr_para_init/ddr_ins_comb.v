module ddr_ins_comb
    #(parameter BANDWIDTH=512,
                BITWIDTH=32)(
    input                       clk                     ,
    input                       rst_n                   ,
    
    //ddr init ins
    input wire			        ddr_init_ins_vld        ,
    input wire [25:0]           ddr_init_addr           ,
    input wire [BANDWIDTH-1:0] 	ddr_init_data           , 
    input wire                  ddr_init_rdreq          ,
    input wire                  ddr_init_wrreq          ,
    input wire [6:0]            ddr_init_bl             ,
    
    //mobile run ins
	input wire					ddr_calc_ins_op_vld		,
	input wire [25:0] 	        ddr_calc_address   		,
    input wire [BANDWIDTH-1:0]  ddr_calc_write_data  	, 
    input wire                  ddr_calc_rd_req  		,
    input wire                  ddr_calc_wr_req 		,
    input wire [6:0]            ddr_calc_bl_size  		,
    
    output reg			        ddr_ins_op_vld		    ,
    output reg [25:0]           ddr_address   		    ,
    output reg [BANDWIDTH-1:0]  ddr_write_data  	    ,
    output reg                  ddr_rd_req  		    ,
    output reg                  ddr_wr_req 			    ,
    output reg [6:0]            ddr_bl_size  		
);

// mobilenet run ins will be valid after init done
// the Initialization valid signal and the running valid
// sig will not be enabled at the same time
always @ (posedge clk or negedge rst_n) begin 
    if (!rst_n) begin 
        ddr_ins_op_vld	<= 1'b0;
        ddr_address   	<= 26'b0;
        ddr_write_data  <= 0;
        ddr_rd_req  	<= 1'b0;
        ddr_wr_req 		<= 1'b0;
        ddr_bl_size  	<= 7'b0;
    end else if (ddr_init_ins_vld == 1'b1) begin 
        ddr_ins_op_vld  <= 1'b1;
        ddr_address     <= ddr_init_addr;
        ddr_write_data  <= ddr_init_data;
        ddr_rd_req  	<= ddr_init_rdreq;
        ddr_wr_req 		<= ddr_init_wrreq;
        ddr_bl_size  	<= ddr_init_bl;
    end else if (ddr_calc_ins_op_vld == 1'b1) begin 
        ddr_ins_op_vld  <= 1'b1;
        ddr_address     <= ddr_calc_address;   	
        ddr_write_data  <= ddr_calc_write_data; 
        ddr_rd_req  	<= ddr_calc_rd_req;  	
        ddr_wr_req 		<= ddr_calc_wr_req; 	
        ddr_bl_size  	<= ddr_calc_bl_size;  	  
    end else begin 
        ddr_ins_op_vld	<= 1'b0;
        ddr_address   	<= 26'b0;
        ddr_write_data  <= 0;
        ddr_rd_req  	<= 1'b0;
        ddr_wr_req 		<= 1'b0;
        ddr_bl_size  	<= 7'b0;      
    end
end

endmodule 
