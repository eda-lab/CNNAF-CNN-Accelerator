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



// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module  weight_rom_rom_1port_181_n23siri  (
    address,
    clock,
    q);

    input  [13:0]  address;
    input    clock;
    output [511:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
    tri1     clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

    wire [511:0] sub_wire0;
    wire [511:0] q = sub_wire0[511:0];

    altera_syncram  altera_syncram_component (
                .address_a (address),
                .clock0 (clock),
                .q_a (sub_wire0),
                .aclr0 (1'b0),
                .aclr1 (1'b0),
                .address2_a (1'b1),
                .address2_b (1'b1),
                .address_b (1'b1),
                .addressstall_a (1'b0),
                .addressstall_b (1'b0),
                .byteena_a (1'b1),
                .byteena_b (1'b1),
                .clock1 (1'b1),
                .clocken0 (1'b1),
                .clocken1 (1'b1),
                .clocken2 (1'b1),
                .clocken3 (1'b1),
                .data_a ({512{1'b1}}),
                .data_b (1'b1),
                .eccencbypass (1'b0),
                .eccencparity (8'b0),
                .eccstatus ( ),
                .q_b ( ),
                .rden_a (1'b1),
                .rden_b (1'b1),
                .sclr (1'b0),
                .wren_a (1'b0),
                .wren_b (1'b0));
    defparam
        altera_syncram_component.address_aclr_a  = "NONE",
        altera_syncram_component.clock_enable_input_a  = "BYPASS",
        altera_syncram_component.clock_enable_output_a  = "BYPASS",
        altera_syncram_component.init_file = "/home/gtd/workspace/qts_prj/cnn/Mobilenet_FPGA_Accelarator_nios_ddr4/rtl/16.ddr_para_init/parameter/weight_part1.mif",
        altera_syncram_component.intended_device_family  = "Arria 10",
        altera_syncram_component.lpm_hint  = "ENABLE_RUNTIME_MOD=YES,INSTANCE_NAME=NONE",
        altera_syncram_component.lpm_type  = "altera_syncram",
        altera_syncram_component.numwords_a  = 16384,
        altera_syncram_component.operation_mode  = "ROM",
        altera_syncram_component.outdata_aclr_a  = "NONE",
        altera_syncram_component.outdata_sclr_a  = "NONE",
        altera_syncram_component.outdata_reg_a  = "UNREGISTERED",
        altera_syncram_component.enable_force_to_zero  = "FALSE",
        altera_syncram_component.widthad_a  = 14,
        altera_syncram_component.width_a  = 512,
        altera_syncram_component.width_byteena_a  = 1;


endmodule


