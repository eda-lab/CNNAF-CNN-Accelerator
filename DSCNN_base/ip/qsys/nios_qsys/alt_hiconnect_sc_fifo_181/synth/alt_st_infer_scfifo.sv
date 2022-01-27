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
// Single clock Avalon-ST FIFO with inferred memory storage.
// -----------------------------------------------------------

`timescale 1 ns / 1 ns

module alt_st_infer_scfifo
#(
    // --------------------------------------------------
    // Parameters
    // --------------------------------------------------
    parameter PAYLOAD_WIDTH = 1,
    parameter DEPTH         = 16,

    // --------------------------------------------------
    // Empty latency is defined as the number of cycles
    // required for a write to deassert the empty flag.
    // For example, a latency of 1 means that the empty
    // flag is deasserted on the cycle after a write.
    //
    // Another way to think of it is the latency for a
    // write to propagate to the output. 
    // 
    // An empty latency of 0 implies lookahead, which is
    // only implemented for the register-based FIFO.
    // --------------------------------------------------
    parameter EMPTY_LATENCY = 3
)
(
    // --------------------------------------------------
    // Ports
    // --------------------------------------------------
    input                             clk,
    input                             reset,
                                      
    input [PAYLOAD_WIDTH-1 : 0]       in_payload,
    input                             in_valid,
    output                            in_ready,

    output reg [PAYLOAD_WIDTH-1 : 0]  out_payload,
    output reg                        out_valid,
    input                             out_ready
);

    // --------------------------------------------------
    // Local Parameters
    // --------------------------------------------------
    localparam ADDR_WIDTH = log2ceil(DEPTH);

    // --------------------------------------------------
    // Internal Signals
    // --------------------------------------------------
    genvar i;

    reg internal_sclr;

    reg [PAYLOAD_WIDTH-1 : 0] mem [DEPTH-1 : 0];
    reg [ADDR_WIDTH-1 : 0]  wr_ptr;
    reg [ADDR_WIDTH-1 : 0]  rd_ptr;

    wire [ADDR_WIDTH-1 : 0] next_wr_ptr;
    wire [ADDR_WIDTH-1 : 0] next_rd_ptr;
    wire [ADDR_WIDTH-1 : 0] incremented_wr_ptr;
    wire [ADDR_WIDTH-1 : 0] incremented_rd_ptr;

    wire [ADDR_WIDTH-1 : 0] mem_rd_ptr;

    wire read;
    wire write;

    reg empty;
    reg next_empty;
    reg full;
    reg next_full;

    reg  [PAYLOAD_WIDTH-1 : 0] internal_out_payload;

    reg  internal_out_valid;
    wire internal_out_ready;

    always @(posedge clk) begin
        internal_sclr <= reset;
    end

    // --------------------------------------------------
    // Memory-based FIFO storage
    //
    // To allow a ready latency of 0, the read index is 
    // obtained from the next read pointer and memory 
    // outputs are unregistered.
    //
    // If the empty latency is 1, we infer bypass logic
    // around the memory so writes propagate to the
    // outputs on the next cycle.
    //
    // Do not change the way this is coded: Quartus needs
    // a perfect match to the template, and any attempt to 
    // refactor the two always blocks into one will break
    // memory inference.
    // --------------------------------------------------
    generate if (EMPTY_LATENCY == 1) begin : mem_with_bypass

        always @(posedge clk) begin
            if (in_valid && in_ready)
                mem[wr_ptr] = in_payload;

            internal_out_payload = mem[mem_rd_ptr];
        end

    end else begin : mem_storage

        always @(posedge clk) begin
            if (in_valid && in_ready)
                mem[wr_ptr] <= in_payload;

            internal_out_payload <= mem[mem_rd_ptr];
        end

    end
    endgenerate

    assign mem_rd_ptr = next_rd_ptr;

    assign read  = internal_out_ready && internal_out_valid;
    assign write = in_ready && in_valid;

    // --------------------------------------------------
    // Pointer Management
    // --------------------------------------------------
    assign incremented_wr_ptr = wr_ptr + 1'b1;
    assign incremented_rd_ptr = rd_ptr + 1'b1;
    assign next_wr_ptr = (write) ? incremented_wr_ptr : wr_ptr;
    assign next_rd_ptr = (read) ? incremented_rd_ptr : rd_ptr;

    always @(posedge clk) begin
        if (internal_sclr) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
        end
        else begin
            wr_ptr <= next_wr_ptr;
            rd_ptr <= next_rd_ptr;
        end
    end

    // --------------------------------------------------
    // Memory FIFO Status Management
    //
    // Generates the full and empty signals from the
    // pointers. The FIFO is full when the next write 
    // pointer will be equal to the read pointer after
    // a write. Reading from a FIFO clears full.
    //
    // The FIFO is empty when the next read pointer will
    // be equal to the write pointer after a read. Writing
    // to a FIFO clears empty.
    //
    // A simultaneous read and write must not change any of 
    // the empty or full flags unless there is a drop on error event.
    // --------------------------------------------------
    always @* begin
        next_full = full;
        next_empty = empty;
    
        if (read && !write) begin
            next_full = 1'b0;
    
            if (incremented_rd_ptr == wr_ptr)
                next_empty = 1'b1;
        end
        
        if (write && !read) begin
            next_empty = 1'b0;
    
            if (incremented_wr_ptr == rd_ptr)
                next_full = 1'b1;
        end
    end
    
    always @(posedge clk) begin
        if (internal_sclr) begin
            empty <= 1;
            full  <= 0;
        end
        else begin 
            empty <= next_empty;
            full  <= next_full;
        end
    end

    // --------------------------------------------------
    // Avalon-ST Signals
    //
    // The in_ready signal is straightforward. 
    //
    // To match memory latency when empty latency > 1, 
    // out_valid assertions must be delayed by one clock
    // cycle.
    //
    // Note: out_valid deassertions must not be delayed or 
    // the FIFO will underflow.
    // --------------------------------------------------
    assign in_ready = !full;
    assign internal_out_ready = out_ready || !out_valid;

    generate if (EMPTY_LATENCY > 1) begin : delayed_valid
        always @(posedge clk) begin
            if (internal_sclr)
                internal_out_valid <= 0;
            else begin
                internal_out_valid <= !empty;

                if (read) begin
                    if (incremented_rd_ptr == wr_ptr)
                        internal_out_valid <= 1'b0;
                end
            end
        end
    end else begin : undelayed_valid
        always @* begin
            internal_out_valid = !empty;
        end
    end
    endgenerate

    // --------------------------------------------------
    // Single Output Pipeline Stage
    //
    // This output pipeline stage is enabled if the FIFO's 
    // empty latency is set to 3 (default). It is disabled
    // for all other allowed latencies.
    //
    // Reason: The memory outputs are unregistered, so we have to
    // register the output or fmax will drop if combinatorial
    // logic is present on the output datapath.
    // 
    // Q: The Avalon-ST spec says that I have to register my outputs
    //    But isn't the memory counted as a register?
    // A: The path from the address lookup to the memory output is
    //    slow. Registering the memory outputs is a good idea. 
    //
    // The registers get packed into the memory by the fitter
    // which means minimal resources are consumed (the result
    // is a altsyncram with registered outputs, available on 
    // all modern Altera devices). 
    //
    // This output stage acts as an extra slot in the FIFO, 
    // and complicates the fill level.
    // --------------------------------------------------
    generate if (EMPTY_LATENCY == 3) begin : registered_out

        always @(posedge clk) begin
            if (internal_sclr) begin
                out_valid <= 0;
            end
            else if (internal_out_ready) begin
                out_valid <= internal_out_valid;
            end
        end

        always @(posedge clk) begin
            if (internal_out_ready) begin
                out_payload <= internal_out_payload;
            end
        end

    end
    else begin : unregistered_out
        always @* begin
            out_valid   = internal_out_valid;
            out_payload = internal_out_payload;
        end
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
