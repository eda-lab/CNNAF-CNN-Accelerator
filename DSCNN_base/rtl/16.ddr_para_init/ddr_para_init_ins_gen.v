module ddr_para_init_ins_gen
    #(parameter BANDWIDTH=512,
                BITWIDTH=32)(
    input                       sys_clk                 ,
    input                       sys_rst_n               ,
    
    input                       ddr_init_ins_gen_vld    ,
    input                       ddr_init_continue       ,
    
    output reg                  ddr_init_ins_vld        ,
    output reg [BANDWIDTH-1:0]  ddr_init_data           ,
    output reg [25:0]           ddr_init_addr           ,
    output reg [6:0]            ddr_init_bl             ,
    output reg [0:0]            ddr_init_rdreq          ,
    output reg [0:0]            ddr_init_wrreq          ,
    
    output reg                  ddr_init_finish          
);

parameter WEIGHT_DEEP = 14'd15557	    ; 
parameter BIAS_DEPP   = 11'd1131        ; 
parameter FEATUE_DEEP = 14'd12287	    ; 

parameter WEIGHT_BASE_PART1  = 26'd1000	    ; //125296
parameter WEIGHT_BASE_PART2  = 26'd16558    ; //249593
parameter WEIGHT_BASE_PART3  = 26'd32116    ; //373890
parameter WEIGHT_BASE_PART4  = 26'd47674    ; //498187
parameter WEIGHT_BASE_PART5  = 26'd63232    ; //622484
parameter WEIGHT_BASE_PART6  = 26'd78790    ; //746781
parameter WEIGHT_BASE_PART7  = 26'd94348    ; //868836
parameter WEIGHT_BASE_PART8  = 26'd109906   ; //125296
parameter WEIGHT_BASE_PART9  = 26'd125464   ; //249593
parameter WEIGHT_BASE_PART10 = 26'd141022   ; //373890
parameter WEIGHT_BASE_PART11 = 26'd156580   ; //498187
parameter WEIGHT_BASE_PART12 = 26'd172138   ; //622484
parameter WEIGHT_BASE_PART13 = 26'd187696   ; //746781
parameter WEIGHT_BASE_PART14 = 26'd203254   ; //868836
parameter BIAS_BASE   = 26'd900000	    ;
parameter FEATUE_BASE = 26'd1000000	    ;  

reg [13:0]                      w_cnt   ;
reg [10:0]                      b_cnt   ;
reg [13:0]                      f_cnt   ;

reg [4:0]                       state   ; 
reg                             w_rom_chg_wait ;
wire                            gen_vld ;

reg [511:0]                     ins_data;
reg [ 25:0]                     ins_addr;
reg [ 25:0]                     ins_addr_r;

wire                            w_part_finish;
wire                            b_init_finish;
wire                            f_init_finish;

//reg [127:0]                     w_rom[217518:0];
reg [511:0]                     b_rom[1131:0];
reg [511:0]                     f_rom[12287:0];

wire [511:0]                    w_data;
reg  [511:0]                    b_data;
reg  [511:0]                    f_data;

//initial $readmemh("../rtl/16.ddr_para_init/weight_part2.mem", w_rom);
initial $readmemh("../rtl/16.ddr_para_init/parameter/bias_4.mem", b_rom);
initial $readmemh("../rtl/16.ddr_para_init/parameter/featue_cat128_9.mem", f_rom);

always @ (posedge sys_clk or negedge sys_rst_n) begin 
    if (!sys_rst_n) begin 
        w_rom_chg_wait <= 1'b0;
    end else if (w_part_finish == 1'b1 || f_init_finish == 1'b1) begin 
        w_rom_chg_wait <= 1'b1;
    end else if (ddr_init_continue == 1'b1) begin 
        w_rom_chg_wait <= 1'b0;
    end else begin 
        w_rom_chg_wait <= w_rom_chg_wait;
    end
end

assign gen_vld = ~w_rom_chg_wait & ddr_init_ins_gen_vld;

always @ (posedge sys_clk or negedge sys_rst_n) begin  
    if (!sys_rst_n) begin 
        b_cnt <= 0;
        f_cnt <= 0;
        w_cnt <= 0;
    end else begin 
        case (state)
            0 : begin 
                if (b_cnt == BIAS_DEPP && gen_vld == 1'b1) begin 
                    b_cnt <= 0;
                end else if (gen_vld == 1'b1) begin 
                    b_cnt <= b_cnt + 1'b1;
                end else ;
            end
            1 : begin 
                if (f_cnt == FEATUE_DEEP && gen_vld == 1'b1) begin 
                    f_cnt <= 0;
                end else if (gen_vld == 1'b1) begin 
                    f_cnt <= f_cnt + 1'b1;
                end else ;
            end
            2,3,4,5,6,7,8,9,10,11,12,13,14,15 : begin 
                if (w_cnt == WEIGHT_DEEP && gen_vld == 1'b1) begin 
                    w_cnt <= 0;
                end else if (gen_vld == 1'b1) begin 
                    w_cnt <= w_cnt + 1'b1;
                end else ;
            end
            default : begin 
                b_cnt <= 0;
                f_cnt <= 0;
                w_cnt <= 0;
            end
        endcase
    end
end

assign b_init_finish = b_cnt == BIAS_DEPP && gen_vld == 1'b1;
assign f_init_finish = f_cnt == FEATUE_DEEP && gen_vld == 1'b1;
assign w_part_finish = w_cnt == WEIGHT_DEEP && gen_vld == 1'b1;

always @ (posedge sys_clk or negedge sys_rst_n) begin 
    if (!sys_rst_n) begin 
        state <= 0;
    end else begin 
        case (state)
            0 : begin 
                if (b_init_finish == 1) begin 
                    state <= state + 1'b1;
                end else ;
            end
            1 : begin 
                if (f_init_finish == 1) begin 
                    state <= state + 1'b1;
                end else ;
            end
            2,3,4,5,6,7,8,9,10,11,12,13,14,15 : begin 
                if (w_part_finish == 1) begin 
                    state <= state + 1'b1;
                end else ;
            end
            default : begin 
                state <= state;
            end
        endcase
    end
end

reg [4:0]                       state_r1,state_r2;
always @ (posedge sys_clk or negedge sys_rst_n) begin 
    if (!sys_rst_n) begin 
        state_r1 <= 0;
        state_r2 <= 0;
    end else begin
        state_r1 <= state;
        state_r2 <= state_r1;
    end
end

always @ (posedge sys_clk) begin 
    b_data <= b_rom[b_cnt];
    f_data <= f_rom[f_cnt];
end

reg [511:0]                     b_data_r;
reg [511:0]                     f_data_r;

always @ (posedge sys_clk or negedge sys_rst_n) begin 
    if (!sys_rst_n) begin 
        b_data_r <= 512'b0;
        f_data_r <= 512'b0;
    end else begin 
        b_data_r <= b_data;
        f_data_r <= f_data;
    end
end

weight_rom inst0_weight_rom(
    .q       (w_data    ),       //  output,  width = 128,       q.dataout
    .address (w_cnt     ), //   input,   width = 18, address.address
    .clock   (sys_clk   )    //   input,    width = 1,   clock.clk
);

always @ (posedge sys_clk or negedge sys_rst_n) begin 
    if (!sys_rst_n) begin 
        ddr_init_data <= 0;
    end
    else begin 
        case (state_r2)
            0 : ddr_init_data <= b_data_r;
            1 : ddr_init_data <= f_data_r;
            2,3,4,5,6,7,8,9,10,11,12,13,14,15 : ddr_init_data <= w_data;
            default : ddr_init_data <= 0;
        endcase
    end 
end

always @ (posedge sys_clk or negedge sys_rst_n) begin 
    if (!sys_rst_n) begin 
        ins_addr <= 0;
        ins_addr_r <= 0;
    end else begin
        ins_addr_r <= ins_addr;
        case (state) 
            0 : ins_addr <= b_cnt + BIAS_BASE           ;
            1 : ins_addr <= f_cnt + FEATUE_BASE         ;
            2 : ins_addr <= w_cnt + WEIGHT_BASE_PART1   ;
            3 : ins_addr <= w_cnt + WEIGHT_BASE_PART2   ;
            4 : ins_addr <= w_cnt + WEIGHT_BASE_PART3   ;
            5 : ins_addr <= w_cnt + WEIGHT_BASE_PART4   ;
            6 : ins_addr <= w_cnt + WEIGHT_BASE_PART5   ;
            7 : ins_addr <= w_cnt + WEIGHT_BASE_PART6   ;
            8 : ins_addr <= w_cnt + WEIGHT_BASE_PART7   ;
            9 : ins_addr <= w_cnt + WEIGHT_BASE_PART8   ;
            10: ins_addr <= w_cnt + WEIGHT_BASE_PART9   ;
            11: ins_addr <= w_cnt + WEIGHT_BASE_PART10  ;
            12: ins_addr <= w_cnt + WEIGHT_BASE_PART11  ;
            13: ins_addr <= w_cnt + WEIGHT_BASE_PART12  ;
            14: ins_addr <= w_cnt + WEIGHT_BASE_PART13  ;
            15: ins_addr <= w_cnt + WEIGHT_BASE_PART14  ;
            default : ins_addr <= 0;
        endcase 
    end
end

reg [1:0]                         ddr_init_ins_gen_vld_r;

always @ (posedge sys_clk or negedge sys_rst_n) begin 
    if (!sys_rst_n) begin 
        ddr_init_ins_gen_vld_r <= 2'b0;
        ddr_init_ins_vld <= 1'b0;
    end else begin 
        ddr_init_ins_gen_vld_r <= {ddr_init_ins_gen_vld_r[0], gen_vld};
        ddr_init_ins_vld <= ddr_init_ins_gen_vld_r[1];
    end
end

always @ (posedge sys_clk or negedge sys_rst_n) begin 
    if (!sys_rst_n) begin 
        // ddr_init_data  <= 0;
        ddr_init_addr  <= 0;
        ddr_init_bl    <= 0;
        ddr_init_rdreq <= 0;
        ddr_init_wrreq <= 0;
    end else begin 
        // ddr_init_data  <= ins_data;
        ddr_init_addr  <= ins_addr_r;
        ddr_init_bl    <= 7'd1;
        ddr_init_rdreq <= 1'b0;
        ddr_init_wrreq <= ddr_init_ins_gen_vld_r[1];
        // ddr_init_rdreq <= state_reg >= 3 && ddr_init_ins_gen_vld_r == 1;
        // ddr_init_wrreq <= state_reg < 3 && ddr_init_ins_gen_vld_r == 1;
    end
end

always @ (posedge sys_clk or negedge sys_rst_n) begin 
    if (!sys_rst_n) begin 
        ddr_init_finish <= 1'b0;
    end else if (state > 15) begin 
        ddr_init_finish <= 1'b1;
    end else begin 
        ddr_init_finish <= 1'b0;
    end
end

endmodule 
