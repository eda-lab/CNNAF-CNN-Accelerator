`ifndef C_DDR_MODEL__SV
`define C_DDR_MODEL__SV

`define EXQ_CYC 20

class c_ddr_model;
    bit [511:0] mem[bit[25:0]];

    virtual c_ddr_intf  ddr_intf;

    bit         cmd_q[$];           // 0-read; 1-write
    bit [ 63:0] avl_be_q[$];
    bit [511:0] wr_data_q[$];
    bit [  6:0] bst_len_q[$];
    bit [ 25:0] cmd_addr_q[$];
    
    bit [ 25:0] cmd_addr_l = 0;
    bit [ 63:0] avl_be_l = 0;
    bit [  6:0] bst_len_l = 0;
    bit         wr_lock = 0;
    bit [  6:0] wr_cnt = 0;  

    bit         cmd_exct_q[$];      // 0-read; 1-write
    bit         cmd_tmp_q[$];
    
    bit [`EXQ_CYC-1 :0] cmd_vld_q;
    
    bit         wr_burst_wait;
    
    function new();

    endfunction: new

    extern task main();
    extern task intf_init();
    extern task recv_cmd();
    extern task dly_cmd();
    extern task exct_cmd();
    extern task handle_read();
    extern task handle_write();
    extern task ready_ctrl();

    extern task read_file();

endclass: c_ddr_model

task c_ddr_model::intf_init();
    ddr_intf.drv_cb.data_out    <=  'b0;
    ddr_intf.drv_cb.ddr_rdy     <= 1'b0;
    ddr_intf.drv_cb.ddr_vld     <= 1'b0;
endtask: intf_init

task c_ddr_model::main();
    read_file();
    intf_init();
    fork
        recv_cmd();
        dly_cmd();
        exct_cmd();
        ready_ctrl();
    join
endtask: main

task c_ddr_model::recv_cmd();
    while(1) begin
        //check rd_req and wr_req rules
        if ((ddr_intf.mon_cb.rd_req == 1'b1) && (ddr_intf.mon_cb.wr_req == 1'b1)) begin
            $display("ERROR :: rd_req and wr_req CAN NOT be active at the same time");
        end
        //receive command info
        if (ddr_intf.mon_cb.ddr_rdy == 1'b1) begin
            if (ddr_intf.mon_cb.rd_req == 1'b1) begin
                cmd_q.push_back(1'b0);
                bst_len_q.push_back(ddr_intf.mon_cb.bst_len);
                cmd_addr_q.push_back(ddr_intf.mon_cb.cmd_addr);
            end else if (ddr_intf.mon_cb.wr_req == 1'b1) begin
                cmd_q.push_back(1'b1);
                bst_len_q.push_back(ddr_intf.mon_cb.bst_len);
                // if (ddr_intf.mon_cb.cmd_addr == 1114443) begin 
                    // $display("load 1114443 bl = %d", ddr_intf.mon_cb.bst_len);
                // end
                cmd_addr_q.push_back(ddr_intf.mon_cb.cmd_addr);
                avl_be_q.push_back(ddr_intf.mon_cb.avl_be);
                wr_data_q.push_back(ddr_intf.mon_cb.data_in);
            end
        end
        @(ddr_intf.drv_cb);
    end
endtask: recv_cmd

task c_ddr_model::dly_cmd();
    bit                 cmd_tmp;

    while(1) begin 
        cmd_vld_q[`EXQ_CYC-1:1] = cmd_vld_q[`EXQ_CYC-2:0];
        if (cmd_q.size() > 0) begin
            cmd_vld_q[0] = 1'b1;
            cmd_tmp = cmd_q.pop_front();
            cmd_tmp_q.push_back(cmd_tmp);
            // $display("emmm cmd_tmp_q.size = %d", cmd_tmp_q.size());
        end else begin
            cmd_vld_q[0] = 1'b0;
        end
        // $display("cmd_vld_q :: %b", cmd_vld_q);
        if (cmd_vld_q[`EXQ_CYC-1] == 1'b1) begin
            if (cmd_tmp_q.size() > 0 && wr_burst_wait == 0) begin
                cmd_tmp = cmd_tmp_q.pop_front();
                cmd_exct_q.push_back(cmd_tmp);
                // $display("cmd_exct_q.size = %d", cmd_exct_q.size());
            end else begin
                $display("ENV ERROR :: cmd_tmp_q empty");
            end
        end
        // if (cmd_q.size() > 20) begin 
            // cmd_tmp = cmd_tmp_q.pop_front();
            // cmd_exct_q.push_back(cmd_tmp);
        // end
        @(ddr_intf.drv_cb);
    end
endtask: dly_cmd

task c_ddr_model::exct_cmd();
    bit         cmd_tmp;
    
    while(1) begin
        ddr_intf.drv_cb.ddr_vld <= 1'b0;
        wait(cmd_exct_q.size() > 0);
        cmd_tmp = cmd_exct_q.pop_front();

        if (cmd_tmp == 1'b0) begin
        //read
            handle_read();
        end else begin
        //write
            handle_write();
        end
    end
endtask: exct_cmd

task c_ddr_model::handle_read();
    bit [ 25:0] addr_tmp;
    bit [511:0] data_tmp;
    bit [  6:0] bst_len_tmp;

    // $display("calling handle_read");
    if (cmd_addr_q.size() > 0) begin
        addr_tmp = cmd_addr_q.pop_front();
    end else begin
        $display("ENV ERROR :: cmd_addr_q empty while cmd_excp_q still have data");
    end

    if (bst_len_q.size() > 0) begin
        bst_len_tmp = bst_len_q.pop_front();
        if (bst_len_tmp == 7'b0) begin
            $display("ERROR :: bst_len CAN NOT be 0");
        end
    end else begin
        $display("ENV ERROR :: bst_len_q empty while cmd_excp_q still have data");
    end

    for (int i=0; i<bst_len_tmp; i++) begin
        if (mem.exists(addr_tmp+i)) begin
            data_tmp = mem[addr_tmp+i];
        end else begin
            data_tmp = 512'b0;
            $display("ENV ERROR :: mem does not exists");
            $display("addr_tmp+i: %d + %d", addr_tmp, i);
            //data_tmp = {16{8'ha}};
        end
        ddr_intf.drv_cb.ddr_vld     <= 1'b1;
        ddr_intf.drv_cb.data_out    <= data_tmp;

        //$display("data_tmp == %h", data_tmp);
        
        @(ddr_intf.drv_cb);
    end
endtask: handle_read

task c_ddr_model::handle_write();
    bit [ 25:0] addr_tmp;
    bit [ 25:0] addr_w;
    bit [511:0] data_tmp;
    bit [  7:0] data_w[63:0];
    bit [511:0] data_m;
    bit [  6:0] bst_len_tmp;
    bit [ 63:0] avl_be_tmp;
    
    if (bst_len_q.size() > 0) begin
        //the bst_len_q still have number of bst_len_tmp-1 useless bst_len corresponding to one WRITE command
        //needs to be discard during processing
        bst_len_tmp = bst_len_q.pop_front();
        if (bst_len_tmp > 0 && wr_lock == 0) begin 
            bst_len_l = bst_len_tmp;
            wr_lock = 1;
            wr_cnt = 0;
        end else if (bst_len_tmp > 0 && wr_lock == 1) begin 
            wr_cnt = wr_cnt + 1;
        end
        // $display("bst_len_q pop, bst_len == %d", bst_len_tmp);
    end else begin
        $display("ENV ERROR :: bst_len_q empty while cmd_excp_q still have data");
    end
    
    if (cmd_addr_q.size() > 0 && wr_cnt == 0) begin
        //the cmd_addr_q still have number of bst_len_tmp-1 useless bst_len corresponding to one WRITE command
        //needs to be discard during processing
        addr_tmp = cmd_addr_q.pop_front();
        cmd_addr_l = addr_tmp;
        // $display("write cmd q pop, addr == %d", addr_tmp);
    end else if (cmd_addr_q.size() > 0 && wr_lock == 1) begin 
        addr_tmp = cmd_addr_l;
        cmd_addr_q.pop_front();
    end else begin
        $display("ENV ERROR :: cmd_addr_q empty while cmd_excp_q still have data");
    end
    
    if (avl_be_q.size() > 0 && wr_cnt == 0) begin 
        avl_be_tmp = avl_be_q.pop_front();
        avl_be_l = avl_be_tmp;
    end else if (avl_be_q.size() > 0 && wr_lock == 1) begin 
        avl_be_tmp = avl_be_l;
        avl_be_q.pop_front();
    end else begin 
        $display("ENV ERROR :: avl_be_q empty while cmd_excp_q still have data");
    end
    
    if (wr_data_q.size() > 0) begin
        data_tmp = wr_data_q.pop_front();
    end
    addr_w = addr_tmp + wr_cnt;
    data_m = mem[addr_w];
    for (int j=0; j<64; j++) begin 
        data_w[j] = avl_be_tmp[j] ? data_tmp[7:0] : data_m[7:0];
        data_tmp = data_tmp >> 8;
        data_m = data_m >> 8;
    end
    mem[addr_w] = {data_w[63],data_w[62],data_w[61],data_w[60],data_w[59],data_w[58],data_w[57],data_w[56],
                   data_w[55],data_w[54],data_w[53],data_w[52],data_w[51],data_w[50],data_w[49],data_w[48],
                   data_w[47],data_w[46],data_w[45],data_w[44],data_w[43],data_w[42],data_w[41],data_w[40],
                   data_w[39],data_w[38],data_w[37],data_w[36],data_w[35],data_w[34],data_w[33],data_w[32],
                   data_w[31],data_w[30],data_w[29],data_w[28],data_w[27],data_w[26],data_w[25],data_w[24],
                   data_w[23],data_w[22],data_w[21],data_w[20],data_w[19],data_w[18],data_w[17],data_w[16],
                   data_w[15],data_w[14],data_w[13],data_w[12],data_w[11],data_w[10],data_w[ 9],data_w[ 8],
                   data_w[ 7],data_w[ 6],data_w[ 5],data_w[ 4],data_w[ 3],data_w[ 2],data_w[ 1],data_w[ 0]};
    
    if (wr_cnt == bst_len_l-1) begin 
        wr_cnt = 0;
        wr_lock = 0;
    end
    
    // $display("bst_len_l == %d", bst_len_l);
    // $display("wr_cnt == %d", wr_cnt); 
    // $display("addr_w == %d", addr_w);
    // $display("avl_be_tmp == %h", avl_be_tmp);
    // $display("data_w == %d", mem[addr_w]);
    // $display("wr_lock == %d", wr_lock);
    
    @(ddr_intf.drv_cb);    
endtask: handle_write


task c_ddr_model::ready_ctrl();
    while(1) begin
        if ((cmd_exct_q.size + cmd_tmp_q.size) < 40) begin
            ddr_intf.drv_cb.ddr_rdy <= 1'b1;
            @(ddr_intf.drv_cb);
            // repeat($urandom_range(8,5)) begin
                // @(ddr_intf.drv_cb);
            // end
            // if (ddr_intf.mon_cb.bst_len > 0) begin 
                // for (int i=0; i<ddr_intf.mon_cb.bst_len; i=i+1) begin 
                    // ddr_intf.drv_cb.ddr_rdy <= 1'b0;
                    // @(ddr_intf.drv_cb);
                // end
            // end else begin
			ddr_intf.drv_cb.ddr_rdy <= 1'b0;
			repeat($urandom_range(1,0)) begin
				@(ddr_intf.drv_cb);
			end 
			// end
        end else begin
            ddr_intf.drv_cb.ddr_rdy <= 1'b0;
            @(ddr_intf.drv_cb);
        end
    end
endtask: ready_ctrl

task c_ddr_model::read_file();
    integer fd;
    reg [511:0] value;
    
    
    int i = 1000;
    int fetch_ptr = 0;
    fd = $fopen("../rtl/00.ddr_module/weight_4.txt", "r");
    while (!$feof(fd)) begin
        $fscanf(fd, "%h", value);
        if (fetch_ptr == 0) begin 
            mem[i][ 31:  0] = value; fetch_ptr++;
        end else if (fetch_ptr == 1) begin
            mem[i][ 63: 32] = value; fetch_ptr++;
        end else if (fetch_ptr == 2) begin
            mem[i][ 95: 64] = value; fetch_ptr++;
        end else if (fetch_ptr == 3) begin
            mem[i][127: 96] = value; fetch_ptr++;
        end else if (fetch_ptr == 4) begin
            mem[i][159:128] = value; fetch_ptr++;
        end else if (fetch_ptr == 5) begin
            mem[i][191:160] = value; fetch_ptr++;
        end else if (fetch_ptr == 6) begin
            mem[i][223:192] = value; fetch_ptr++;
        end else if (fetch_ptr == 7) begin
            mem[i][255:224] = value; fetch_ptr++;
        end else if (fetch_ptr == 8) begin
            mem[i][287:256] = value; fetch_ptr++;
        end else if (fetch_ptr == 9) begin
            mem[i][319:288] = value; fetch_ptr++;
        end else if (fetch_ptr == 10) begin
            mem[i][351:320] = value; fetch_ptr++;
        end else if (fetch_ptr == 11) begin
            mem[i][383:352] = value; fetch_ptr++;
        end else if (fetch_ptr == 12) begin
            mem[i][415:384] = value; fetch_ptr++;
        end else if (fetch_ptr == 13) begin
            mem[i][447:416] = value; fetch_ptr++;
        end else if (fetch_ptr == 14) begin
            mem[i][479:448] = value; fetch_ptr++;
        end else if (fetch_ptr == 15) begin
            mem[i][511:480] = value; fetch_ptr = 0;
            i++;
        end
        // $display("mem[%d] = %h", i, mem[i]);
    end
    mem[i][(fetch_ptr)*32-1 -: 32] = 32'b0;
    $fclose(fd);
    
    
    i = 900000;
    fetch_ptr = 0;
    fd = $fopen("../rtl/00.ddr_module/bias_4.txt", "r");
    while (!$feof(fd)) begin
        $fscanf(fd, "%h", value);
        if (fetch_ptr == 0) begin 
            mem[i][ 31:  0] = value; fetch_ptr++;
        end else if (fetch_ptr == 1) begin
            mem[i][ 63: 32] = value; fetch_ptr++;
        end else if (fetch_ptr == 2) begin
            mem[i][ 95: 64] = value; fetch_ptr++;
        end else if (fetch_ptr == 3) begin
            mem[i][127: 96] = value; fetch_ptr++;
        end else if (fetch_ptr == 4) begin
            mem[i][159:128] = value; fetch_ptr++;
        end else if (fetch_ptr == 5) begin
            mem[i][191:160] = value; fetch_ptr++;
        end else if (fetch_ptr == 6) begin
            mem[i][223:192] = value; fetch_ptr++;
        end else if (fetch_ptr == 7) begin
            mem[i][255:224] = value; fetch_ptr++;
        end else if (fetch_ptr == 8) begin
            mem[i][287:256] = value; fetch_ptr++;
        end else if (fetch_ptr == 9) begin
            mem[i][319:288] = value; fetch_ptr++;
        end else if (fetch_ptr == 10) begin
            mem[i][351:320] = value; fetch_ptr++;
        end else if (fetch_ptr == 11) begin
            mem[i][383:352] = value; fetch_ptr++;
        end else if (fetch_ptr == 12) begin
            mem[i][415:384] = value; fetch_ptr++;
        end else if (fetch_ptr == 13) begin
            mem[i][447:416] = value; fetch_ptr++;
        end else if (fetch_ptr == 14) begin
            mem[i][479:448] = value; fetch_ptr++;
        end else if (fetch_ptr == 15) begin
            mem[i][511:480] = value; fetch_ptr = 0;
            i++;
        end
    end
    mem[i][(fetch_ptr)*32-1 -: 32] = 32'b0;
    $fclose(fd);
    
    i = 1000000;
    fetch_ptr = 0;
    fd = $fopen("../rtl/00.ddr_module/cat128_9.txt", "r");
    while (!$feof(fd)) begin
        $fscanf(fd, "%h", value);
        if (fetch_ptr == 0) begin 
            mem[i][ 31:  0] = value; fetch_ptr++;
        end else if (fetch_ptr == 1) begin
            mem[i][ 63: 32] = value; fetch_ptr++;
        end else if (fetch_ptr == 2) begin
            mem[i][ 95: 64] = value; fetch_ptr++;
        end else if (fetch_ptr == 3) begin
            mem[i][127: 96] = value; fetch_ptr++;
        end else if (fetch_ptr == 4) begin
            mem[i][159:128] = value; fetch_ptr++;
        end else if (fetch_ptr == 5) begin
            mem[i][191:160] = value; fetch_ptr++;
        end else if (fetch_ptr == 6) begin
            mem[i][223:192] = value; fetch_ptr++;
        end else if (fetch_ptr == 7) begin
            mem[i][255:224] = value; fetch_ptr++;
        end else if (fetch_ptr == 8) begin
            mem[i][287:256] = value; fetch_ptr++;
        end else if (fetch_ptr == 9) begin
            mem[i][319:288] = value; fetch_ptr++;
        end else if (fetch_ptr == 10) begin
            mem[i][351:320] = value; fetch_ptr++;
        end else if (fetch_ptr == 11) begin
            mem[i][383:352] = value; fetch_ptr++;
        end else if (fetch_ptr == 12) begin
            mem[i][415:384] = value; fetch_ptr++;
        end else if (fetch_ptr == 13) begin
            mem[i][447:416] = value; fetch_ptr++;
        end else if (fetch_ptr == 14) begin
            mem[i][479:448] = value; fetch_ptr++;
        end else if (fetch_ptr == 15) begin
            mem[i][511:480] = value; fetch_ptr = 0;
            i++;
        end
    end
    $fclose(fd);
    
    
    // i = 1111360;
    // fetch_ptr = 0;
    // fd = $fopen("../rtl/00.ddr_module/file_for_sim/res_layer18_bias_for_ddr_module.txt", "r");
    // while (!$feof(fd)) begin
        // $fscanf(fd, "%h", value);
        // if (fetch_ptr == 0) begin 
            // mem[i][ 31:  0] = value; fetch_ptr++;
        // end else if (fetch_ptr == 1) begin
            // mem[i][ 63: 32] = value; fetch_ptr++;
        // end else if (fetch_ptr == 2) begin
            // mem[i][ 95: 64] = value; fetch_ptr++;
        // end else if (fetch_ptr == 3) begin
            // mem[i][127: 96] = value; fetch_ptr++;
        // end else if (fetch_ptr == 4) begin
            // mem[i][159:128] = value; fetch_ptr++;
        // end else if (fetch_ptr == 5) begin
            // mem[i][191:160] = value; fetch_ptr++;
        // end else if (fetch_ptr == 6) begin
            // mem[i][223:192] = value; fetch_ptr++;
        // end else if (fetch_ptr == 7) begin
            // mem[i][255:224] = value; fetch_ptr++;
        // end else if (fetch_ptr == 8) begin
            // mem[i][287:256] = value; fetch_ptr++;
        // end else if (fetch_ptr == 9) begin
            // mem[i][319:288] = value; fetch_ptr++;
        // end else if (fetch_ptr == 10) begin
            // mem[i][351:320] = value; fetch_ptr++;
        // end else if (fetch_ptr == 11) begin
            // mem[i][383:352] = value; fetch_ptr++;
        // end else if (fetch_ptr == 12) begin
            // mem[i][415:384] = value; fetch_ptr++;
        // end else if (fetch_ptr == 13) begin
            // mem[i][447:416] = value; fetch_ptr++;
        // end else if (fetch_ptr == 14) begin
            // mem[i][479:448] = value; fetch_ptr++;
        // end else if (fetch_ptr == 15) begin
            // mem[i][511:480] = value; fetch_ptr = 0;
            // i++;
        // end
    // end
    // $fclose(fd);

    i = 1020480;
    fetch_ptr = 0;
    fd = $fopen("../rtl/00.ddr_module/file_for_sim/res_layer1_bias_for_ddr_module.txt", "r");
    while (!$feof(fd)) begin
        $fscanf(fd, "%h", value);
        if (fetch_ptr == 0) begin 
            mem[i][ 31:  0] = value; fetch_ptr++;
        end else if (fetch_ptr == 1) begin
            mem[i][ 63: 32] = value; fetch_ptr++;
        end else if (fetch_ptr == 2) begin
            mem[i][ 95: 64] = value; fetch_ptr++;
        end else if (fetch_ptr == 3) begin
            mem[i][127: 96] = value; fetch_ptr++;
        end else if (fetch_ptr == 4) begin
            mem[i][159:128] = value; fetch_ptr++;
        end else if (fetch_ptr == 5) begin
            mem[i][191:160] = value; fetch_ptr++;
        end else if (fetch_ptr == 6) begin
            mem[i][223:192] = value; fetch_ptr++;
        end else if (fetch_ptr == 7) begin
            mem[i][255:224] = value; fetch_ptr++;
        end else if (fetch_ptr == 8) begin
            mem[i][287:256] = value; fetch_ptr++;
        end else if (fetch_ptr == 9) begin
            mem[i][319:288] = value; fetch_ptr++;
        end else if (fetch_ptr == 10) begin
            mem[i][351:320] = value; fetch_ptr++;
        end else if (fetch_ptr == 11) begin
            mem[i][383:352] = value; fetch_ptr++;
        end else if (fetch_ptr == 12) begin
            mem[i][415:384] = value; fetch_ptr++;
        end else if (fetch_ptr == 13) begin
            mem[i][447:416] = value; fetch_ptr++;
        end else if (fetch_ptr == 14) begin
            mem[i][479:448] = value; fetch_ptr++;
        end else if (fetch_ptr == 15) begin
            mem[i][511:480] = value; fetch_ptr = 0;
            i++;
        end
    end
    $fclose(fd);

endtask: read_file

`endif
