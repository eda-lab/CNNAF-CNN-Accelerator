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


module alt_st_fifo_empty
(
    input clk,
    input reset,

    input inc,
    input dec,
    
    output reg zero
);
    reg [1:0] ctr_low;
    reg [2:0] ctr_high;
    reg       ctr_low_overflow;
    reg       ctr_low_underflow;
    reg       sclr;
    reg       ctr_high_is_0;

    always @(posedge clk) begin
        sclr <= reset;
    end

    always @(posedge clk) begin
        if (sclr) begin
            ctr_low <= 2'h0;
        end else begin
            if (inc & (~dec | zero))
                ctr_low <= ctr_low + 1'b1;
            else if (dec & ~zero & ~inc)
                ctr_low <= ctr_low - 1'b1; 
        end
    end

    always @(posedge clk) begin
        ctr_low_overflow <= (ctr_low == 2'h3) & inc & ~dec;
        ctr_low_underflow <= (ctr_low == 2'h0) & dec & ~inc & ~zero;
    end

    always @(posedge clk) begin
        if (sclr)
            ctr_high_is_0 <= 1'b1;
        else if (ctr_low_overflow)
            ctr_high_is_0 <= 1'b0;
        else if (ctr_low_underflow & (ctr_high == 3'h1))
            ctr_high_is_0 <= 1'b1;
    end

    always @(posedge clk) begin
        if (sclr) begin
            ctr_high <= 3'h0;
        end else begin
            if (ctr_low_overflow) begin
                ctr_high <= ctr_high + 1'b1;
            end else if (ctr_low_underflow) begin
                ctr_high <= ctr_high - 1'b1;
            end
        end
    end

    always @(posedge clk) begin
        if (sclr)
            zero <= 1'b1;
        else if (inc)
            zero <= 1'b0;
        else if (ctr_high_is_0 & (ctr_low == 2'h1) & dec & ~inc)
            zero <= 1'b1;
    end

endmodule
