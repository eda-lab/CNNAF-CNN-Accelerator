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
// Register implementation for the single clock FIFO.
//
// The read side is in showahead mode. The data is presented on the output
// after a write, and the read is an acknowledgement that the data has been
// accepted (zero ready latency, if you like Avalon-ST).
//
//           ___
// wr     __|   |______
//        ______         _______
// empty        |_______|
//                   ___
// rd     __________|   |_______
//
// -----------------------------------------------------------

`timescale 1 ns / 1 ns

// altera message_off 10036
module alt_st_reg_scfifo
#(
    // --------------------------------------------------
    // Parameters
    // --------------------------------------------------
    parameter PAYLOAD_WIDTH = 8,
    parameter DEPTH = 16,

    // --------------------------------------------------
    // Default empty latency is 1, which means a write clears
    // the empty flag on the next clock cycle.
    //           ___
    // wr     __|   |______
    //        ______        
    // empty        |______
    //
    // An empty latency of 0 means lookahead.
    // --------------------------------------------------
    parameter EMPTY_LATENCY = 1
)
(
    // --------------------------------------------------
    // Ports
    // --------------------------------------------------
    input clk,
    input reset,

    input                            write,
    input      [PAYLOAD_WIDTH-1 : 0] in_payload,
    output reg                       full,

    input                            read,
    output reg [PAYLOAD_WIDTH-1 : 0] out_payload,
    output reg                       empty
);

    // --------------------------------------------------
    // Internal Signals
    // --------------------------------------------------
    genvar i;
    reg internal_sclr;

    reg [PAYLOAD_WIDTH-1 : 0] mem [DEPTH-1 : 0];
    reg [DEPTH-1 : 0] mem_used;

    wire qualified_read;
    wire qualified_write;


    always @(posedge clk) begin
        internal_sclr <= reset;
    end

    // --------------------------------------------------
    // FIFO storage
    //
    // Uses a shift register as the storage element. Each
    // shift register slot has a bit which indicates if
    // the slot is occupied (credit to Sam H for the idea).
    // The occupancy bits are contiguous and start from the
    // lsb, so 0000, 0001, 0011, 0111, 1111 for a 4-deep
    // FIFO.
    // 
    // Each slot is enabled during a read or when it
    // is unoccupied. New data is always written to every
    // going-to-be-empty slot (we keep track of which ones
    // are actually useful with the occupancy bits). On a
    // read we shift occupied slots.
    // 
    // The exception is the last slot, which always gets 
    // new data when it is unoccupied.
    // --------------------------------------------------
    generate for (i = 0; i < DEPTH-1; i = i + 1) begin : shift_reg
        always @(posedge clk) begin
            if (qualified_read || !mem_used[i]) begin
                if (!mem_used[i+1])
                    mem[i] <= in_payload;
                else
                    mem[i] <= mem[i+1];
            end
        end
    end endgenerate

    always @(posedge clk) begin
        if (DEPTH == 1) begin
            if (qualified_write)
                mem[DEPTH-1] <= in_payload;
        end
        else if (!mem_used[DEPTH-1])
            mem[DEPTH-1] <= in_payload;    
    end

    assign qualified_read  = read && !empty;
    assign qualified_write = write && !full;

    // --------------------------------------------------
    // Shift Register Occupancy Bits
    //
    // Consider a 4-deep FIFO with 2 entries: 0011
    // On a read and write, do not modify the bits.
    // On a write, left-shift the bits to get 0111.
    // On a read, right-shift the bits to get 0001.
    //
    // Also, on a write we set bit0 (the head), while
    // clearing the tail on a read.
    // --------------------------------------------------
    always @(posedge clk) begin
        if (internal_sclr) begin
            mem_used[0] <= 0;
        end 
        else begin
            if (qualified_write ^ qualified_read) begin
                if (qualified_write)
                    mem_used[0] <= 1;
                else if (qualified_read) begin
                    if (DEPTH > 1)
                        mem_used[0] <= mem_used[1];
                    else
                        mem_used[0] <= 0;
                end
            end
        end
    end

    generate if (DEPTH > 1) begin : deep_mem_used
        always @(posedge clk) begin
            if (internal_sclr) begin
                mem_used[DEPTH-1] <= 0;
            end
            else begin 
                if (qualified_write ^ qualified_read) begin            
                    mem_used[DEPTH-1] <= 0;
                    if (qualified_write)
                        mem_used[DEPTH-1] <= mem_used[DEPTH-2];
                end
            end
        end
    
        for (i = 1; i < DEPTH-1; i = i + 1) begin : storage_logic
            always @(posedge clk) begin
                if (internal_sclr) begin
                    mem_used[i] <= 0;
                end 
                else begin
                    if (qualified_write ^ qualified_read) begin
                        if (qualified_write)
                            mem_used[i] <= mem_used[i-1];
                        else if (qualified_read)
                            mem_used[i] <= mem_used[i+1];     
                    end
                end
            end
        end
    end endgenerate
     
    // --------------------------------------------------
    // Register FIFO Status Management
    //
    // Full when the tail occupancy bit is 1. Empty when
    // the head occupancy bit is 0.
    // --------------------------------------------------
    always_comb begin
        full  = mem_used[DEPTH-1];
        empty = !mem_used[0];

        // ------------------------------------------
        // For a single slot FIFO, reading clears the
        // full status immediately.
        // ------------------------------------------
        if (DEPTH == 1)
            full = mem_used[0] && !qualified_read;

        out_payload = mem[0];

        // ------------------------------------------
        // Writes clear empty immediately for lookahead modes.
        // Note that we use write instead of qualified_write to 
        // avoid combinational loops (in lookahead mode, qualifying
        // with full is meaningless).
        //
        // In a 1-deep FIFO, a possible combinational loop runs
        // from write -> !empty -> read -> write
        // ------------------------------------------
        if (EMPTY_LATENCY == 0) begin
            empty = !mem_used[0] && !write;

            if (!mem_used[0] && write)
                out_payload = in_payload;
        end
    end

endmodule
