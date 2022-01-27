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
// Avalon-ST single clock FIFO.
//
// This top level selects between several implementations.
// -----------------------------------------------------------
`timescale 1 ns / 1 ns

module nios_qsys_alt_hiconnect_sc_fifo_181_cjmuh4a
#(
    // --------------------------------------------------
    // Parameters
    // --------------------------------------------------
    parameter IMPL                = "infer",
    parameter SYMBOLS_PER_BEAT    = 1,
    parameter BITS_PER_SYMBOL     = 8,
    parameter FIFO_DEPTH          = 16,
    parameter CHANNEL_WIDTH       = 0,
    parameter ERROR_WIDTH         = 0,
    parameter USE_PACKETS         = 0,
    parameter EMPTY_LATENCY       = 3,
    parameter SHOWAHEAD           = 1,  // only implemented for mlab
    parameter ALMOST_FULL_THRESHOLD = 12,  // only implemented for mlab

    // --------------------------------------------------
    // Internal Parameters
    // --------------------------------------------------
    parameter DATA_WIDTH  = SYMBOLS_PER_BEAT * BITS_PER_SYMBOL,
    parameter EMPTY_WIDTH = log2ceil(SYMBOLS_PER_BEAT)
)
(
    // --------------------------------------------------
    // Ports
    // --------------------------------------------------
    input                       clk,
    input                       reset,

    input [DATA_WIDTH-1: 0]     in_data,
    input                       in_valid,
    input                       in_startofpacket,
    input                       in_endofpacket,
    input [((EMPTY_WIDTH>0) ? (EMPTY_WIDTH-1):0) : 0]     in_empty,
    input [((ERROR_WIDTH>0) ? (ERROR_WIDTH-1):0) : 0]     in_error,
    input [((CHANNEL_WIDTH>0) ? (CHANNEL_WIDTH-1):0): 0]  in_channel,
    output                      in_ready,

    output [DATA_WIDTH-1 : 0]   out_data,
    output                      out_valid,
    output                      out_startofpacket,
    output                      out_endofpacket,
    output [((EMPTY_WIDTH>0) ? (EMPTY_WIDTH-1):0) : 0]    out_empty,
    output [((ERROR_WIDTH>0) ? (ERROR_WIDTH-1):0) : 0]    out_error,
    output [((CHANNEL_WIDTH>0) ? (CHANNEL_WIDTH-1):0): 0] out_channel,
    input                       out_ready
);

    // --------------------------------------------------
    // Local Parameters
    // --------------------------------------------------
    localparam PKT_SIGNALS_WIDTH = 2 + EMPTY_WIDTH;
    localparam PAYLOAD_WIDTH = (USE_PACKETS == 1) ? 
                   2 + EMPTY_WIDTH + DATA_WIDTH + ERROR_WIDTH + CHANNEL_WIDTH:
                   DATA_WIDTH + ERROR_WIDTH + CHANNEL_WIDTH;

    // --------------------------------------------------
    // Internal Signals
    // --------------------------------------------------
    wire [PKT_SIGNALS_WIDTH-1 : 0] in_packet_signals;
    wire [PKT_SIGNALS_WIDTH-1 : 0] out_packet_signals;
    wire [PAYLOAD_WIDTH-1 : 0] in_payload;
    wire [PAYLOAD_WIDTH-1 : 0] out_payload;

    // --------------------------------------------------
    // Define Payload
    //
    // Icky part where we decide which signals form the
    // payload to the FIFO with generate blocks.
    // --------------------------------------------------
    generate
        if (EMPTY_WIDTH > 0) begin : pkt_signals_with_empty
            assign in_packet_signals = {in_startofpacket, in_endofpacket, in_empty};
            assign {out_startofpacket, out_endofpacket, out_empty} = out_packet_signals;
        end 
        else begin : pkt_signals_without_empty
            assign out_empty = in_empty;
            assign in_packet_signals = {in_startofpacket, in_endofpacket};
            assign {out_startofpacket, out_endofpacket} = out_packet_signals;
        end
    endgenerate

    generate
        if (USE_PACKETS) begin : pkt1
            if (ERROR_WIDTH > 0) begin : pkt1_err1
                if (CHANNEL_WIDTH > 0) begin : pkt1_err1_ch1
                    assign in_payload = {in_packet_signals, in_data, in_error, in_channel};
                    assign {out_packet_signals, out_data, out_error, out_channel} = out_payload;
                end
                else begin : pkt1_err1_ch0
                    assign out_channel = in_channel;
                    assign in_payload = {in_packet_signals, in_data, in_error};
                    assign {out_packet_signals, out_data, out_error} = out_payload;
                end
            end
            else begin : pkt1_err0
                assign out_error = in_error;
                if (CHANNEL_WIDTH > 0) begin : pkt1_err0_ch1
                    assign in_payload = {in_packet_signals, in_data, in_channel};
                    assign {out_packet_signals, out_data, out_channel} = out_payload;
                end
                else begin : pkt1_err0_ch0
                    assign out_channel = in_channel;
                    assign in_payload = {in_packet_signals, in_data};
                    assign {out_packet_signals, out_data} = out_payload;
                end
            end
        end
        else begin : pkt0
            assign out_packet_signals = 0;
            if (ERROR_WIDTH > 0) begin : pkt0_err1
                if (CHANNEL_WIDTH > 0) begin : pkt0_err1_ch1
                    assign in_payload = {in_data, in_error, in_channel};
                    assign {out_data, out_error, out_channel} = out_payload;
                end
                else begin : pkt0_err1_ch0
                    assign out_channel = in_channel;
                    assign in_payload = {in_data, in_error};
                    assign {out_data, out_error} = out_payload;
                end
            end
            else begin : pkt0_err0
                assign out_error = in_error;
                if (CHANNEL_WIDTH > 0) begin : pkt0_err0_ch1
                    assign in_payload = {in_data, in_channel};
                    assign {out_data, out_channel} = out_payload;
                end
                else begin : pkt0_err0_ch0
                    assign out_channel = in_channel;
                    assign in_payload = in_data;
                    assign out_data = out_payload;
                end
            end
        end
    endgenerate

    generate if (IMPL == "mlab") begin : mlab_fifo

        if (FIFO_DEPTH <= 31) begin : a5

            alt_st_mlab_scfifo
            #(
                .PAYLOAD_WIDTH   (PAYLOAD_WIDTH),
                .SHOWAHEAD       (SHOWAHEAD),
                .READY_THRESHOLD (ALMOST_FULL_THRESHOLD)
            )
            mlab_fifo
            (
                .clk          (clk),
                .reset        (reset),

                .sink_valid   (in_valid),
                .sink_payload (in_payload),
                .sink_ready   (in_ready),

                .src_ready    (out_ready),
                .src_payload  (out_payload),
                .src_valid    (out_valid)
            );

        end else if (FIFO_DEPTH <= 62 && SHOWAHEAD) begin : a6

            alt_st_mlab_scfifo_a6
            #(
                .PAYLOAD_WIDTH   (PAYLOAD_WIDTH),
                .READY_THRESHOLD (ALMOST_FULL_THRESHOLD)
            )
            mlab_fifo
            (
                .clk          (clk),
                .reset        (reset),

                .sink_valid   (in_valid),
                .sink_payload (in_payload),
                .sink_ready   (in_ready),

                .src_ready    (out_ready),
                .src_payload  (out_payload),
                .src_valid    (out_valid)
            );

        end else if (FIFO_DEPTH <= 124 && SHOWAHEAD) begin : a7

            alt_st_mlab_scfifo_a7
            #(
                .PAYLOAD_WIDTH   (PAYLOAD_WIDTH),
                .READY_THRESHOLD (ALMOST_FULL_THRESHOLD)
            )
            mlab_fifo
            (
                .clk          (clk),
                .reset        (reset),

                .sink_valid   (in_valid),
                .sink_payload (in_payload),
                .sink_ready   (in_ready),

                .src_ready    (out_ready),
                .src_payload  (out_payload),
                .src_valid    (out_valid)
            );

        end

    end else if (IMPL == "reg") begin : reg_fifo

        // --------------------------------------------------
        // Register implementation
        // --------------------------------------------------
        wire full;
        wire empty;

        alt_st_reg_scfifo
        #(
            .PAYLOAD_WIDTH (PAYLOAD_WIDTH),
            .DEPTH         (FIFO_DEPTH),
            .EMPTY_LATENCY (EMPTY_LATENCY)
        )
        reg_fifo
        (
            .clk         (clk),
            .reset       (reset),

            .write       (in_valid),
            .in_payload  (in_payload),
            .full        (full),

            .read        (out_ready),
            .out_payload (out_payload),
            .empty       (empty)
        );

        assign in_ready = !full;
        assign out_valid = !empty;

    end else begin : infer_fifo

        alt_st_infer_scfifo
        #(
            .PAYLOAD_WIDTH (PAYLOAD_WIDTH),
            .DEPTH         (FIFO_DEPTH),
            .EMPTY_LATENCY (EMPTY_LATENCY)
        )
        infer_fifo
        (
            .clk         (clk),
            .reset       (reset),

            .in_payload  (in_payload),
            .in_valid    (in_valid),
            .in_ready    (in_ready),

            .out_payload (out_payload),
            .out_valid   (out_valid),
            .out_ready   (out_ready)
        );

    end
    endgenerate

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


