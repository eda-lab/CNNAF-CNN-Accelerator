module bias_add
    #(parameter BANDWIDTH=512,
                BITWIDTH=32)(
    input                           clk_calc        ,
    input                           rst_n           ,
    
    input                           data_in_vld     ,
    input [BITWIDTH*16-1:0]         data_in         ,
    input [BITWIDTH*16-1:0]         bias_in         ,
    input [BITWIDTH*16-1:0]         sc_in           ,
    input                           sc_vld          ,
    input                           relu_en         ,
    output reg                      data_out_vld    ,
    output reg [BITWIDTH*16-1:0]    data_out        
);

//-------------------------------------------
// regs & wires & parameters
//-------------------------------------------
wire [BITWIDTH-1:0]                 bias_in_part[15:0];
wire [BITWIDTH-1:0]                 sc_in_part[15:0];
wire [BITWIDTH-1:0]                 bias_sc_part[15:0];
wire [BITWIDTH-1:0]                 data_in_part[15:0];

wire [31:0]                         ReLU6_para;        

assign ReLU6_para = 32'h40C00000;

genvar i;

generate
    for(i = 0; i < 16; i = i + 1) begin : data_divide
        assign bias_in_part[i] = bias_in[i*BITWIDTH +: BITWIDTH];
        assign data_in_part[i] = data_in[i*BITWIDTH +: BITWIDTH];
        assign sc_in_part[i]   = sc_vld ? sc_in[i*BITWIDTH +: BITWIDTH] : 0;
    end
endgenerate

generate
    for(i = 0; i < 16; i = i + 1) begin : bais_sc_add
        fp_add fp_add_bias(
            .clk                (clk_calc),         
            .areset             (~rst_n),           
            .a                  (bias_in_part[i]),  
            .b                  (sc_in_part[i]),  
            .q                  (bias_sc_part[i])        
        );
    end
endgenerate

wire [BITWIDTH-1:0]                 add_out[15:0];
generate
    for(i = 0; i < 16; i = i + 1) begin : data_add
        fp_add fp_add_bias(
            .clk                (clk_calc),         
            .areset             (~rst_n),           
            .a                  (bias_sc_part[i]),  
            .b                  (data_in_part[i]),  
            .q                  (add_out[i])        
        );
    end
endgenerate
//-------------------------------------------
// ReLU6 
//-------------------------------------------
wire                            less_than_6[15:0];
generate
    for(i = 0; i < 16; i = i + 1) begin : less_6_gen
        fp_cmp_bias fp_cmp_bias(
            .clk                (clk_calc),    
            .areset             (~rst_n), 
            .a                  (add_out[i]),      
            .b                  (ReLU6_para),      //6
            .q                  (less_than_6[i])  
        );
    end
endgenerate

reg                             less_than_0[15:0];
generate
    for(i = 0; i < 16; i = i + 1) begin : less_0_gen
        always @ (posedge clk_calc or negedge rst_n)
        begin
            if(!rst_n) begin
                less_than_0[i] <= 1'b0;
            end
            else if (add_out[i][31] == 1'b1) begin
                less_than_0[i] <= 1'b1;
            end
            else begin
                less_than_0[i] <= 1'b0;
            end
        end
    end
endgenerate

reg [BITWIDTH-1:0]                  add_out_temp[15:0];
generate
    for(i = 0; i < 16; i = i + 1) begin : add_out_temp_gen
        always @ (posedge clk_calc or negedge rst_n)
        begin
            if(!rst_n) begin
                add_out_temp[i] <= 0;
            end
            else begin
                add_out_temp[i] <= add_out[i];
            end
        end
    end
endgenerate

wire [BITWIDTH-1:0]                 data_out_part[15:0];

generate
    for(i = 0; i < 16; i = i + 1) begin : data_out_par_gen
        assign data_out_part[i] = less_than_6[i] ? less_than_0[i] ? 0 : add_out_temp[i] : ReLU6_para;
    end
endgenerate

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        data_out <= 0;
    end else if (relu_en == 1'b1) begin 
        data_out <= {data_out_part[15], data_out_part[14], data_out_part[13], data_out_part[12], 
                     data_out_part[11], data_out_part[10], data_out_part[ 9], data_out_part[ 8], 
                     data_out_part[ 7], data_out_part[ 6], data_out_part[ 5], data_out_part[ 4], 
                     data_out_part[ 3], data_out_part[ 2], data_out_part[ 1], data_out_part[ 0]};
    end else begin 
        data_out <= {add_out_temp[15], add_out_temp[14], add_out_temp[13], add_out_temp[12], 
                     add_out_temp[11], add_out_temp[10], add_out_temp[ 9], add_out_temp[ 8], 
                     add_out_temp[ 7], add_out_temp[ 6], add_out_temp[ 5], add_out_temp[ 4], 
                     add_out_temp[ 3], add_out_temp[ 2], add_out_temp[ 1], add_out_temp[ 0]};        
    end
end

reg [3:0]                       vld_reg;
always @ (posedge clk_calc or negedge rst_n)
begin
    if(!rst_n) begin
        vld_reg <= 4'b0;
    end
    else begin
        vld_reg <= {vld_reg[2:0], data_in_vld};
    end
end

always @ (posedge clk_calc or negedge rst_n) begin 
    if (!rst_n) begin 
        data_out_vld <= 1'b0;
    end else begin 
        data_out_vld <= vld_reg[3]; 
    end
end

endmodule