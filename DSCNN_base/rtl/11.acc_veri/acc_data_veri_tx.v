module acc_data_veri_tx(
    input               clk_100M,
    input               clk_200M,
    input               rst_n,
    
    input [127:0]       veri_data_in,
    input               veri_data_in_vld,
    output reg          veri_ins_push,
    
    input               rd_req,
    output reg          acc_finish,
    output reg [31:0]   acc_data,
    output reg          acc_data_vld
);

//fifo interface
//reg                     tx_finish;
wire [31:0]             tx_fifo_data                        ;
wire [32:0]             tx_fifo_in                          ;
reg                     tx_fifo_rdreq                       ;
wire                    tx_fifo_wrreq                       ;
wire [32:0]             tx_fifo_out                         ;
wire                    tx_fifo_empty                       ;
wire                    tx_fifo_full                        ;
wire [7:0]              tx_fifo_usedw                       ;        
wire [31:0]             tx_fifo_out_data                    ;
wire                    tx_fifo_out_finish                  ;
assign tx_fifo_in = {1'b0, tx_fifo_data}                    ;
assign {tx_fifo_out_finish, tx_fifo_out_data} = tx_fifo_out ;

    veri_data_tx_fifo veri_data_tx_fifo(
        .wrclk      (clk_200M       ),
        .wrreq      (tx_fifo_wrreq  ),
        .data       (tx_fifo_in     ),
        .rdclk      (clk_100M       ),
        .rdreq      (tx_fifo_rdreq  ),
        .aclr       (~rst_n         ), 
        .q          (tx_fifo_out    ),
        .rdempty    (tx_fifo_empty  ),
        .wrusedw    (tx_fifo_usedw  ),
        .wrfull     (tx_fifo_full   )
    );

//shift reg
reg [127:0]             rom_data_shift;

always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        rom_data_shift <= 128'd0;
    end else if (veri_data_in_vld == 1'b1) begin 
        rom_data_shift <= veri_data_in;
    end else begin 
        rom_data_shift <= {32'd0, rom_data_shift[127:32]};
    end
end

//tx_fifo_in_data
assign tx_fifo_data = rom_data_shift[31:0];

reg [2:0]               data2fifo_cnt;
reg                     data2fifo_trans_lock;
always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        data2fifo_cnt <= 3'd0;
    end else if (data2fifo_cnt == 3'd4) begin 
        data2fifo_cnt <= 3'd0;
    end else if (veri_data_in_vld == 1'b1) begin 
        data2fifo_cnt <= 3'd1;
    end else if (data2fifo_cnt > 3'd0) begin 
        data2fifo_cnt <= data2fifo_cnt + 1'b1;
    end else begin 
        data2fifo_cnt <= data2fifo_cnt;
    end
end

reg [7:0] 				tx_fifo_usedw_reg;

always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        tx_fifo_usedw_reg <= 8'd0; 
    end else begin 
        tx_fifo_usedw_reg <= tx_fifo_usedw;
    end
end

always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        data2fifo_trans_lock <= 1'b1;
    end else if (data2fifo_cnt == 3'd4) begin 
        data2fifo_trans_lock <= 1'b1;
    end else if (data2fifo_trans_lock == 1'b1 && tx_fifo_usedw_reg < 8'd64) begin 
        data2fifo_trans_lock <= 1'b0;
    end else begin 
        data2fifo_trans_lock <= data2fifo_trans_lock;
    end
end
 
assign tx_fifo_wrreq = data2fifo_cnt > 3'd0;

always @ (posedge clk_200M or negedge rst_n) begin 
    if (!rst_n) begin 
        veri_ins_push <= 1'b0;
    end else if (data2fifo_trans_lock == 1'b1 && tx_fifo_usedw_reg < 8'd64) begin 
        veri_ins_push <= 1'b1;
    end else begin 
        veri_ins_push <= 1'b0;
    end
end


reg                        rd_req_reg;
wire                       rd_req_pulse;

always @ (posedge clk_100M or negedge rst_n) begin 
    if (!rst_n) begin 
        rd_req_reg <= 1'b0;
    end else begin 
        rd_req_reg <= rd_req;
    end
end

assign rd_req_pulse = (rd_req_reg ^ rd_req) & rd_req;

always @ (posedge clk_100M or negedge rst_n) begin 
    if (!rst_n) begin 
        tx_fifo_rdreq <= 1'b0;
    end else if (tx_fifo_empty == 1'b0 && rd_req_pulse == 1'b1) begin 
        tx_fifo_rdreq <= 1'b1;
    end else begin 
        tx_fifo_rdreq <= 1'b0;
    end
end

always @ (posedge clk_100M or negedge rst_n) begin 
    if (!rst_n) begin 
        acc_data        <= 32'd0;
        acc_data_vld    <= 1'b0;
    end else if (tx_fifo_empty == 1'b0 && rd_req_pulse == 1'b1) begin 
        acc_data        <= tx_fifo_out_data;
        acc_data_vld    <= 1'b1;               
    end else if (rd_req == 1'b0) begin 
        acc_data        <= acc_data;
        acc_data_vld    <= 1'b0;  		
	end else begin 
        acc_data        <= acc_data;
        acc_data_vld    <= acc_data_vld;
    end
end

always @ (posedge clk_100M or negedge rst_n) begin 
    if (!rst_n) begin
        acc_finish <= 1'b0;
    end else if (tx_fifo_empty == 1'b0) begin 
        acc_finish <= 1'b1;
    end else begin 
        acc_finish <= acc_finish;
    end
end

endmodule 
