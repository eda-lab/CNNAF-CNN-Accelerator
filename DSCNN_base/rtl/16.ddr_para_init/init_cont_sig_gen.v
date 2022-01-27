module init_cont_sig_gen (
    input                   sys_clk_200M        ,       
    input                   async_init_cont_sig ,   
    output reg              sync_init_cont_sig
);

reg                         sync_init_cont_sig_r1  ;
reg                         sync_init_cont_sig_r2  ;

always @ (posedge sys_clk_200M) begin
    sync_init_cont_sig_r1 <= async_init_cont_sig    ;
    sync_init_cont_sig_r2 <= sync_init_cont_sig_r1  ;
    sync_init_cont_sig    <= sync_init_cont_sig_r1 & ~sync_init_cont_sig_r2;
end

endmodule 
