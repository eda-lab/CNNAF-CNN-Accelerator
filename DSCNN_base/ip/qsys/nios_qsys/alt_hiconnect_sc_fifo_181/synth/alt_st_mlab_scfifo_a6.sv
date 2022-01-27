// (C) 2001-2018 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// -----------------------------------------------------------
// Variant of the MLAB FIFO that stitches MLABs together for depth.
//
// Maximum depth is 62. Could probably go to 64 because
// of the output registers, but that's not verified.
//
// Meant for narrow widths, going above 40 would be sketchy.
// -----------------------------------------------------------

`timescale 1 ns / 1 ns

module alt_st_mlab_scfifo_a6
#(
    // --------------------------------------------------
    // Parameters
    // --------------------------------------------------
    parameter PAYLOAD_WIDTH   = 8,
              READY_THRESHOLD = 12
)
(
    // --------------------------------------------------
    // Ports
    // --------------------------------------------------
    input clk,
    input reset,

    input                            sink_valid,
    output reg                       sink_ready,
    input      [PAYLOAD_WIDTH-1 : 0] sink_payload,

    output reg                       src_valid,
    input                            src_ready,
    output reg [PAYLOAD_WIDTH-1 : 0] src_payload
);

    // --------------------------------------------------
    // Local Parameters
    // --------------------------------------------------
    localparam ADDR_WIDTH = 6;
    localparam RAM_WIDTH = 20;
    localparam MEM_WIDTH = (PAYLOAD_WIDTH % RAM_WIDTH == 0) ? 
                                            PAYLOAD_WIDTH : 
                                            (PAYLOAD_WIDTH/RAM_WIDTH + 1) * RAM_WIDTH;
    localparam RAM_BLOCKS_W = MEM_WIDTH / RAM_WIDTH;
    localparam RAM_BLOCKS_D = 2;

    // --------------------------------------------------
    // Internal Signals
    // --------------------------------------------------
    reg internal_sclr;

    // flattened by width, then depth
    reg [RAM_BLOCKS_D*RAM_BLOCKS_W*ADDR_WIDTH-1 : 0]  wr_ptr /* synthesis dont_merge */;
    reg [RAM_BLOCKS_D*RAM_BLOCKS_W*ADDR_WIDTH-1 : 0]  rd_ptr /* synthesis dont_merge */;
    reg [ADDR_WIDTH-1 : 0]             lookahead_wr_ptr;
    reg [ADDR_WIDTH-1 : 0]             lookahead_rd_ptr;

    wire [RAM_BLOCKS_D*RAM_BLOCKS_W*ADDR_WIDTH-1 : 0] next_wr_ptr;
    wire [RAM_BLOCKS_D*RAM_BLOCKS_W*ADDR_WIDTH-1 : 0] next_rd_ptr;

    wire qualified_read;
    wire qualified_write;

    reg empty;
    reg next_empty;

    wire [MEM_WIDTH-1 : 0] mem_writedata;
    reg  [MEM_WIDTH-1 : 0] mem_readdata_low;
    reg  [MEM_WIDTH-1 : 0] mem_readdata_high;

    reg  [PAYLOAD_WIDTH-1 : 0] mem_payload_low;
    reg  [PAYLOAD_WIDTH-1 : 0] mem_payload_high;
    reg mem_valid;
    reg mem_select;

    wire load_mem_reg;
    wire load_output_reg;

    reg [ADDR_WIDTH-1 : 0] fill_level;

    genvar i;

    // --------------------------------------------------
    // Pipelined synchronous reset
    // --------------------------------------------------
    always @(posedge clk) begin
        internal_sclr <= reset;
    end

    // --------------------------------------------------
    // Memory-based FIFO storage
    // --------------------------------------------------
    assign mem_writedata = sink_payload;

    generate for (i = 0; i < RAM_BLOCKS_W; i=i+1) begin : ram_block_low

        altdpram mem
        (
            .data           (mem_writedata[(i+1)*RAM_WIDTH-1 : i*RAM_WIDTH]),
            .inclock        (clk),
            .outclock       (clk),
            .rdaddress      (rd_ptr[(i+1)*ADDR_WIDTH-2 : i*ADDR_WIDTH]),
            .wraddress      (wr_ptr[(i+1)*ADDR_WIDTH-2 : i*ADDR_WIDTH]),
            .wren           (~wr_ptr[(i+1)*ADDR_WIDTH-1]),
            .q              (mem_readdata_low[(i+1)*RAM_WIDTH-1 : i*RAM_WIDTH]),
            .aclr           (1'b0),
            .byteena        (1'b1),
            .inclocken      (1'b1),
            .outclocken     (1'b1),
            .rdaddressstall (1'b0),
            .rden           (1'b1),
            .wraddressstall (1'b0)
        );
        defparam
            mem.indata_aclr     = "OFF",
            mem.indata_reg      = "INCLOCK",
            mem.intended_device_family = "Stratix 10",
            mem.lpm_type        = "altdpram",
            mem.outdata_aclr    = "OFF",
            mem.outdata_reg     = "UNREGISTERED",
            mem.ram_block_type  = "MLAB",
            mem.rdaddress_aclr  = "OFF",
            mem.rdaddress_reg   = "UNREGISTERED",
            mem.rdcontrol_aclr  = "OFF",
            mem.rdcontrol_reg   = "UNREGISTERED",
            mem.read_during_write_mode_mixed_ports = "DONT_CARE",
            mem.width           = RAM_WIDTH,
            mem.widthad         = 5,
            mem.width_byteena   = 1,
            mem.wraddress_aclr  = "OFF",
            mem.wraddress_reg   = "INCLOCK",
            mem.wrcontrol_aclr  = "OFF",
            mem.wrcontrol_reg   = "INCLOCK";

    end endgenerate

    localparam OFFSET = RAM_BLOCKS_W*ADDR_WIDTH;

    generate for (i = 0; i < RAM_BLOCKS_W; i=i+1) begin : ram_block_high

        altdpram mem
        (
            .data           (mem_writedata[(i+1)*RAM_WIDTH-1 : i*RAM_WIDTH]),
            .inclock        (clk),
            .outclock       (clk),
            .rdaddress      (rd_ptr[OFFSET+(i+1)*ADDR_WIDTH-2 : OFFSET+i*ADDR_WIDTH]),
            .wraddress      (wr_ptr[OFFSET+(i+1)*ADDR_WIDTH-2 : OFFSET+i*ADDR_WIDTH]),
            .wren           (wr_ptr[OFFSET+(i+1)*ADDR_WIDTH-1]),
            .q              (mem_readdata_high[(i+1)*RAM_WIDTH-1 : i*RAM_WIDTH]),
            .aclr           (1'b0),
            .byteena        (1'b1),
            .inclocken      (1'b1),
            .outclocken     (1'b1),
            .rdaddressstall (1'b0),
            .rden           (1'b1),
            .wraddressstall (1'b0)
        );
        defparam
            mem.indata_aclr     = "OFF",
            mem.indata_reg      = "INCLOCK",
            mem.intended_device_family = "Stratix 10",
            mem.lpm_type        = "altdpram",
            mem.outdata_aclr    = "OFF",
            mem.outdata_reg     = "UNREGISTERED",
            mem.ram_block_type  = "MLAB",
            mem.rdaddress_aclr  = "OFF",
            mem.rdaddress_reg   = "UNREGISTERED",
            mem.rdcontrol_aclr  = "OFF",
            mem.rdcontrol_reg   = "UNREGISTERED",
            mem.read_during_write_mode_mixed_ports = "DONT_CARE",
            mem.width           = RAM_WIDTH,
            mem.widthad         = 5,
            mem.width_byteena   = 1,
            mem.wraddress_aclr  = "OFF",
            mem.wraddress_reg   = "INCLOCK",
            mem.wrcontrol_aclr  = "OFF",
            mem.wrcontrol_reg   = "INCLOCK";

    end endgenerate

    assign qualified_write = sink_valid;
    assign qualified_read = !empty && load_mem_reg;

    // --------------------------------------------------
    // Pointers
    //
    // We have a set of pointers for each MLAB block. This is 
    // necessary for high-speed operation.
    //
    // We also calculate the next pointer values ahead of time.
    // --------------------------------------------------
    always @(posedge clk) begin
        if (internal_sclr) begin
            wr_ptr <= {RAM_BLOCKS_D*RAM_BLOCKS_W*ADDR_WIDTH{1'b0}};
            rd_ptr <= {RAM_BLOCKS_D*RAM_BLOCKS_W*ADDR_WIDTH{1'b0}};
        end
        else begin
            wr_ptr <= next_wr_ptr;
            rd_ptr <= next_rd_ptr;
        end
    end

    assign next_wr_ptr = qualified_write ? {RAM_BLOCKS_D{{RAM_BLOCKS_W{lookahead_wr_ptr}}}} : wr_ptr;
    assign next_rd_ptr = qualified_read ? {RAM_BLOCKS_D{{RAM_BLOCKS_W{lookahead_rd_ptr}}}} : rd_ptr;

    always @(posedge clk) begin
        if (internal_sclr) begin
            lookahead_wr_ptr <= 1;
        end
        else if (qualified_write) begin
            lookahead_wr_ptr <= lookahead_wr_ptr + 1'b1;
        end
    end

    always @(posedge clk) begin
        if (internal_sclr) begin
            lookahead_rd_ptr <= 1;
        end
        else if (qualified_read) begin
            lookahead_rd_ptr <= lookahead_rd_ptr + 1'b1;
        end
    end

    // --------------------------------------------------
    // Empty
    // --------------------------------------------------
    always_comb begin
        next_empty = empty;
    
        if (qualified_read && !qualified_write) begin
            if (lookahead_rd_ptr == wr_ptr[ADDR_WIDTH-1:0])
                next_empty = 1'b1;
        end
        
        if (qualified_write) begin
            next_empty = 1'b0;
        end
    end
    
    always @(posedge clk) begin
        if (internal_sclr) begin
            empty <= 1;
        end
        else begin 
            empty <= next_empty;
        end
    end

    // --------------------------------------------------
    // Almost full
    //
    // The fill level is one cycle delayed from the actual fill level.
    // The comparison to generate the almost full signal is another
    // cycle.
    // --------------------------------------------------
    always @(posedge clk) begin
        fill_level <= (wr_ptr[ADDR_WIDTH-1:0] - rd_ptr[ADDR_WIDTH-1:0]);
    end

    always @(posedge clk) begin
        sink_ready <= (fill_level < READY_THRESHOLD);
    end

    // --------------------------------------------------
    // This is the showahead part: if the output is free, keep trying
    // to load the output registers (underflow protection will save us).
    // --------------------------------------------------
    assign load_mem_reg = !mem_valid || load_output_reg;
    assign load_output_reg = !src_valid || src_ready;

    always @(posedge clk) begin
        if (internal_sclr) begin
            mem_valid <= 0;
        end else if (load_mem_reg) begin
            mem_valid <= !empty;
        end
    end

    always @(posedge clk) begin
        if (load_mem_reg) begin
            mem_payload_low <= mem_readdata_low[PAYLOAD_WIDTH-1 : 0];
            mem_payload_high <= mem_readdata_high[PAYLOAD_WIDTH-1 : 0];
        end
    end

    always @(posedge clk) begin
        if (internal_sclr) begin
            src_valid <= 0;
        end else if (load_output_reg) begin
            src_valid <= mem_valid;
        end
    end

    always @(posedge clk) begin
        if (load_output_reg)
            src_payload <= mem_select ? mem_payload_high : mem_payload_low;
    end

    // The enable can be optimized to load_output_reg if necessary
    always @(posedge clk) begin
        if (load_mem_reg)
            mem_select <= rd_ptr[ADDR_WIDTH-1];
    end

endmodule
