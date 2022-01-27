module ddr4_test_driver(
    input                   sync_clk        ,
    input                   reset_n         ,
    
    //ddr user interface
    input                   avl_ready       , 
    input                   avl_rdata_valid ,
    input      [511:0]      avl_rdata       ,
    
    output reg [25:0]       avl_addr        ,
    output reg [511:0]      avl_wdata       ,
    output reg [63:0]       avl_be          ,
    output reg              avl_read_req    ,
    output reg              avl_write_req   ,
    output reg [6:0]        avl_size        
);

reg [7:0]                   cur_st;

always @ (posedge sync_clk or negedge reset_n) begin 
    if (!reset_n) begin 
        avl_write_req <= 1'b0;
        avl_wdata     <= 512'b0;
        avl_be        <= 64'b0;
        avl_read_req  <= 1'b0;
        avl_size      <= 7'b0;
        cur_st        <= 8'b0;
    end else if (cur_st == 0 && avl_ready == 1'b1) begin 
        avl_write_req <= 1'b1;
        avl_read_req  <= 1'b0;
        avl_addr      <= 26'd0;
        avl_be        <= 64'hffff_ffff_ffff_ffff;
        avl_size      <= 7'd5;
        avl_wdata     <= 512'd1111;
        cur_st        <= cur_st + 1'b1;        
    end else if (cur_st == 1 && avl_ready == 1'b1) begin 
        avl_write_req <= 1'b1;
        avl_read_req  <= 1'b0;
        avl_addr      <= 26'd1;
        avl_be        <= 64'hffff_ffff_ffff_ffff;
        avl_size      <= 7'd5;
        avl_wdata     <= 512'd2222;
        cur_st        <= cur_st + 1'b1;        
    end else if (cur_st == 2 && avl_ready == 1'b1) begin 
        avl_write_req <= 1'b1;
        avl_read_req  <= 1'b0;
        avl_addr      <= 26'd2;
        avl_be        <= 64'hffff_ffff_ffff_ffff;
        avl_size      <= 7'd5;
        avl_wdata     <= 512'd3333;
        cur_st        <= cur_st + 1'b1;        
    end else if (cur_st == 3 && avl_ready == 1'b1) begin 
        avl_write_req <= 1'b0;
        avl_read_req  <= 1'b0;
        avl_addr      <= 26'd0;
        avl_be        <= 64'hffff_ffff_ffff_ffff;
        avl_size      <= 7'd5;
        avl_wdata     <= 512'd4444;
        cur_st        <= cur_st + 1'b1;        
    end else if (cur_st == 4 && avl_ready == 1'b1) begin 
        avl_write_req <= 1'b1;
        avl_read_req  <= 1'b0;
        avl_addr      <= 26'd3;
        avl_be        <= 64'hffff_ffff_ffff_ffff;
        avl_size      <= 7'd5;
        avl_wdata     <= 512'd4444;
        cur_st        <= cur_st + 2'd1;        
    end else if (cur_st == 5 && avl_ready == 1'b1) begin 
        avl_write_req <= 1'b1;
        avl_read_req  <= 1'b0;
        avl_addr      <= 26'd4;
        avl_be        <= 64'hffff_ffff_ffff_ffff;
        avl_size      <= 7'd5;
        avl_wdata     <= 512'd5555;
        cur_st        <= cur_st + 1'b1;        
    end else if (cur_st == 6 && avl_ready == 1'b1) begin 
        avl_write_req <= 1'b1;
        avl_read_req  <= 1'b0;
        avl_addr      <= 26'd3;
        avl_be        <= 64'hffff_ffff_ffff_ffff;
        avl_size      <= 7'd3;
        avl_wdata     <= 512'd6666;
        cur_st        <= cur_st + 1'b1;        
    end else if (cur_st == 7 && avl_ready == 1'b1) begin 
        avl_write_req <= 1'b1;
        avl_read_req  <= 1'b0;
        avl_addr      <= 26'd4;
        avl_be        <= 64'hffff_ffff_ffff_ffff;
        avl_size      <= 7'd3;
        avl_wdata     <= 512'd7777;
        cur_st        <= cur_st + 1'b1;        
    end else if (cur_st == 8 && avl_ready == 1'b1) begin 
        avl_write_req <= 1'b1;
        avl_read_req  <= 1'b0;
        avl_addr      <= 26'd5;
        avl_be        <= 64'hffff_ffff_ffff_ffff;
        avl_size      <= 7'd3;
        avl_wdata     <= 512'd8888;
        cur_st        <= cur_st + 1'b1;        
    end else if (cur_st == 9 && avl_ready == 1'b1) begin 
        avl_write_req <= 1'b0;
        avl_read_req  <= 1'b1;
        avl_addr      <= 26'd0;
        avl_be        <= 64'hffff_ffff_ffff_ffff;
        avl_size      <= 7'd6;
        avl_wdata     <= 512'h0;
        cur_st        <= 7'd10;        
    end else begin 
        avl_write_req <= avl_write_req;
        avl_wdata     <= avl_wdata;
        avl_be        <= avl_be;
        avl_read_req  <= avl_read_req;
        avl_size      <= avl_size;
        cur_st        <= cur_st;           
    end
end

endmodule