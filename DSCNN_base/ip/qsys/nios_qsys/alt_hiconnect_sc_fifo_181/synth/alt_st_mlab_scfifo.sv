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
// MLAB implementation for the single clock FIFO.
//
// The sink_valid to empty deassertion takes two clock cycles. The read
// side is in showahead mode (ready latency 0) by default. In this mode,
// it will hold the valid signal until acknowledged with the ready signal.
//           ___
// wr     __|   |_______________
//        __________         ____
// empty            |_______|
//                       ___
// rd     ______________|   |____
//
// The read side can also be placed in non-showahead mode. In this mode,
// the valid signal is pulsed for one cycle after a read request (ready
// latency 1).
//
// The ready signal on the sink is an almost-full indicator. 
// There is no overflow protection. Underflow protection is enabled
// for now.
//
// The threshold at which the ready signal is deasserted can be controlled
// with a parameter. Legal values are from 1 to 12. Note that the ready
// calculation is pipelined twice, so ready will be deasserted two cycles
// after the threshold is hit.
//
// The natural depth of an MLAB is 32, but we'll always keep one slot
// free because this saves one bit in the fill level calculations, and
// allows us to always write to the next slot. So the FIFO maxes out
// at 31 entries (we'll ignore the output register as a slot).
// -----------------------------------------------------------

`timescale 1 ns / 1 ns

module alt_st_mlab_scfifo
#(
    // --------------------------------------------------
    // Parameters
    // --------------------------------------------------
    parameter PAYLOAD_WIDTH   = 8,
              SHOWAHEAD       = 1,
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
    localparam DEPTH = 31;
    localparam ADDR_WIDTH = log2ceil(DEPTH);
    localparam RAM_WIDTH = 20;
    localparam MEM_WIDTH = (PAYLOAD_WIDTH % RAM_WIDTH == 0) ? 
                                            PAYLOAD_WIDTH : 
                                            (PAYLOAD_WIDTH/RAM_WIDTH + 1) * RAM_WIDTH;
    localparam RAM_BLOCKS = MEM_WIDTH / RAM_WIDTH;

    // --------------------------------------------------
    // Internal Signals
    // --------------------------------------------------
    reg internal_sclr;

    reg [RAM_BLOCKS*ADDR_WIDTH-1 : 0]  wr_ptr /* synthesis dont_merge */;
    reg [RAM_BLOCKS*ADDR_WIDTH-1 : 0]  rd_ptr /* synthesis dont_merge */;
    reg [ADDR_WIDTH-1 : 0]             lookahead_wr_ptr;
    reg [ADDR_WIDTH-1 : 0]             lookahead_rd_ptr;

    wire [RAM_BLOCKS*ADDR_WIDTH-1 : 0] next_wr_ptr;
    wire [RAM_BLOCKS*ADDR_WIDTH-1 : 0] next_rd_ptr;

    wire qualified_read;
    wire qualified_write;

    wire empty;

    wire [MEM_WIDTH-1 : 0] mem_writedata;
    reg  [MEM_WIDTH-1 : 0] mem_readdata;

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

    generate for (i = 0; i < RAM_BLOCKS; i=i+1) begin : ram_block

        altdpram mem
        (
            .data           (mem_writedata[(i+1)*RAM_WIDTH-1 : i*RAM_WIDTH]),
            .inclock        (clk),
            .outclock       (clk),
            .rdaddress      (rd_ptr[(i+1)*ADDR_WIDTH-1 : i*ADDR_WIDTH]),
            .wraddress      (wr_ptr[(i+1)*ADDR_WIDTH-1 : i*ADDR_WIDTH]),
            .wren           (1'b1),
            .q              (mem_readdata[(i+1)*RAM_WIDTH-1 : i*RAM_WIDTH]),
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

            // Apparently, constrained_dont_care and dont_care
            // are the same ever since we dropped negedge 
            // writes
            mem.read_during_write_mode_mixed_ports = "DONT_CARE",
            mem.width           = RAM_WIDTH,
            mem.widthad         = log2ceil(DEPTH),
            mem.width_byteena   = 1,
            mem.wraddress_aclr  = "OFF",
            mem.wraddress_reg   = "INCLOCK",
            mem.wrcontrol_aclr  = "OFF",
            mem.wrcontrol_reg   = "INCLOCK";

    end endgenerate

    assign qualified_write = sink_valid;
    assign qualified_read = !empty && load_output_reg;

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
            wr_ptr <= {RAM_BLOCKS*ADDR_WIDTH{1'b0}};
            rd_ptr <= {RAM_BLOCKS*ADDR_WIDTH{1'b0}};
        end
        else begin
            wr_ptr <= next_wr_ptr;
            rd_ptr <= next_rd_ptr;
        end
    end

    assign next_wr_ptr = qualified_write ? {RAM_BLOCKS{lookahead_wr_ptr}} : wr_ptr;
    assign next_rd_ptr = qualified_read ? {RAM_BLOCKS{lookahead_rd_ptr}} : rd_ptr;

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
    alt_st_fifo_empty up_down_empty
    (
        .clk    (clk),
        .reset  (reset),
        .inc    (qualified_write),
        .dec    (load_output_reg),
        .zero   (empty)
    );

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
    assign load_output_reg = SHOWAHEAD ? 
                                !src_valid || src_ready : 
                                src_ready;

    generate if (SHOWAHEAD) begin : showahead_valid

        always @(posedge clk) begin
            if (internal_sclr) begin
                src_valid <= 0;
            end else if (load_output_reg) begin
                src_valid <= !empty;
            end
        end

    end else begin : non_showahead_valid

        always @(posedge clk) begin
            src_valid <= !empty && load_output_reg;
        end

    end 
    endgenerate

    always @(posedge clk) begin
        if (load_output_reg)
            src_payload <= mem_readdata[PAYLOAD_WIDTH-1 : 0];
    end

    // --------------------------------------------------
    // Calculates the log2ceil of the input value
    // --------------------------------------------------
    function integer log2ceil;
        input integer val;
        reg[31:0] i;

        begin
            i = 1;
            log2ceil = 0;

            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i[30:0] << 1;
            end
        end
    endfunction

endmodule
