module sig_async2sync(
    input                   sys_clk             ,
    
    input                   async_init_cont_sig ,
    output reg              sync_init_cont_sig  ,
    
    input                   async_ddr_init_done ,
    output reg              sync_ddr_init_done
);

reg                         sync_init_cont_sig_r1  ;
reg                         sync_init_cont_sig_r2  ;

always @ (posedge sys_clk) begin
    sync_init_cont_sig_r1 <= async_init_cont_sig    ;
    sync_init_cont_sig_r2 <= sync_init_cont_sig_r1  ;
    sync_init_cont_sig    <= sync_init_cont_sig_r1 & ~sync_init_cont_sig_r2;
end

reg                         sync_ddr_init_done_r   ;

always @ (posedge sys_clk) begin 
    sync_ddr_init_done_r <= async_ddr_init_done     ;
    sync_ddr_init_done   <= sync_ddr_init_done_r    ;
end

endmodule 

