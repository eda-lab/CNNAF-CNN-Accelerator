

  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries altera_fp_functions_181       1
    dict set libraries fp_add                        1
    dict set libraries fp_cmp_bias                   1
    dict set libraries fp_mul                        1
    dict set libraries fifo_181                      1
    dict set libraries acc_data_fifo                 1
    dict set libraries fifo_bias_gen                 1
    dict set libraries fifo_data                     1
    dict set libraries fifo_sc                       1
    dict set libraries fifo_ddr_data_rev             1
    dict set libraries fifo_ddr_init_ins             1
    dict set libraries fifo_ddr_op_ins               1
    dict set libraries fifo_ddr_rd_ins               1
    dict set libraries fifo_ddr_veri_ins             1
    dict set libraries fifo_ddr_wr_ins               1
    dict set libraries altera_fp_acc_custom_181      1
    dict set libraries fp_acc                        1  
    dict set libraries ram_2port_181                 1
    dict set libraries ram_w                         1
    dict set libraries ram_w_ctrlsig                 1
    dict set libraries veri_data_tx_fifo             1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    lappend design_files "vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS    \"$QSYS_SIMDIR/../ip/fp_add/fp_add/altera_fp_functions_181/sim/dspba_library_package.vhd\"  -work altera_fp_functions_181"                 
    lappend design_files "vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS    \"$QSYS_SIMDIR/../ip/fp_add/fp_add/altera_fp_functions_181/sim/dspba_library.vhd\"  -work altera_fp_functions_181"                         
    lappend design_files "vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS    \"$QSYS_SIMDIR/../ip/fp_add/fp_add/altera_fp_functions_181/sim/fp_add_altera_fp_functions_181_7hdc33a.vhd\"  -work altera_fp_functions_181"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fp_add/fp_add/sim/fp_add.v\"  -work fp_add"                                                                                
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/acc_data_fifo/acc_data_fifo/fifo_181/sim/acc_data_fifo_fifo_181_itqewuq.v\"  -work fifo_181"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/acc_data_fifo/acc_data_fifo/synth/acc_data_fifo.v\"  -work acc_data_fifo"                            
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fifo_bias_gen/fifo_bias_gen/fifo_181/sim/fifo_bias_gen_fifo_181_nhpl7uy.v\"  -work fifo_181"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fifo_bias_gen/fifo_bias_gen/synth/fifo_bias_gen.v\"  -work fifo_bias_gen" 
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fifo_data/fifo_data/fifo_181/sim/fifo_data_fifo_181_elq6aki.v\"  -work fifo_181"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fifo_data/fifo_data/synth/fifo_data.v\"  -work fifo_data"                                
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fifo_sc/fifo_sc/fifo_181/sim/fifo_sc_fifo_181_nttqayi.v\"  -work fifo_181"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fifo_sc/fifo_sc/synth/fifo_sc.v\"  -work fifo_sc"                                  
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fifo_ddr_data_rev/fifo_ddr_data_rev/fifo_181/sim/fifo_ddr_data_rev_fifo_181_5oquqri.v\"  -work fifo_181"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fifo_ddr_data_rev/fifo_ddr_data_rev/synth/fifo_ddr_data_rev.v\"  -work fifo_ddr_data_rev"                        
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fifo_ddr_init_ins/fifo_ddr_init_ins/fifo_181/sim/fifo_ddr_init_ins_fifo_181_m3sw7iy.v\"  -work fifo_181"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fifo_ddr_init_ins/fifo_ddr_init_ins/synth/fifo_ddr_init_ins.v\"  -work fifo_ddr_init_ins"                        
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fifo_ddr_op_ins/fifo_ddr_op_ins/fifo_181/sim/fifo_ddr_op_ins_fifo_181_es7mjhy.v\"  -work fifo_181"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fifo_ddr_op_ins/fifo_ddr_op_ins/synth/fifo_ddr_op_ins.v\"  -work fifo_ddr_op_ins"                          
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fifo_ddr_rd_ins/fifo_ddr_rd_ins/fifo_181/sim/fifo_ddr_rd_ins_fifo_181_q3bq6zi.v\"  -work fifo_181"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fifo_ddr_rd_ins/fifo_ddr_rd_ins/synth/fifo_ddr_rd_ins.v\"  -work fifo_ddr_rd_ins"                          
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fifo_ddr_veri_ins/fifo_ddr_veri_ins/fifo_181/sim/fifo_ddr_veri_ins_fifo_181_2fdj4ca.v\"  -work fifo_181"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fifo_ddr_veri_ins/fifo_ddr_veri_ins/synth/fifo_ddr_veri_ins.v\"  -work fifo_ddr_veri_ins"                        
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fifo_ddr_wr_ins/fifo_ddr_wr_ins/fifo_181/sim/fifo_ddr_wr_ins_fifo_181_quzcbzy.v\"  -work fifo_181"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fifo_ddr_wr_ins/fifo_ddr_wr_ins/synth/fifo_ddr_wr_ins.v\"  -work fifo_ddr_wr_ins"                          
    lappend design_files "vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fp_acc/fp_acc/altera_fp_acc_custom_181/sim/dspba_library_package.vhd\"  -work altera_fp_acc_custom_181"                  
    lappend design_files "vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fp_acc/fp_acc/altera_fp_acc_custom_181/sim/dspba_library.vhd\"  -work altera_fp_acc_custom_181"                          
    lappend design_files "vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fp_acc/fp_acc/altera_fp_acc_custom_181/sim/fp_acc_altera_fp_acc_custom_181_2tuw37a.vhd\"  -work altera_fp_acc_custom_181"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fp_acc/fp_acc/synth/fp_acc.v\"  -work fp_acc"                                                                                   
    lappend design_files "vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fp_cmp_bias/fp_cmp_bias/altera_fp_functions_181/sim/dspba_library_package.vhd\"  -work altera_fp_functions_181"                      
    lappend design_files "vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fp_cmp_bias/fp_cmp_bias/altera_fp_functions_181/sim/dspba_library.vhd\"  -work altera_fp_functions_181"                              
    lappend design_files "vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fp_cmp_bias/fp_cmp_bias/altera_fp_functions_181/sim/fp_cmp_bias_altera_fp_functions_181_zhf76iy.vhd\"  -work altera_fp_functions_181"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fp_cmp_bias/fp_cmp_bias/sim/fp_cmp_bias.v\"  -work fp_cmp_bias"                                                                           
    lappend design_files "vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fp_mul/fp_mul/altera_fp_functions_181/sim/dspba_library_package.vhd\"  -work altera_fp_functions_181"                 
    lappend design_files "vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fp_mul/fp_mul/altera_fp_functions_181/sim/dspba_library.vhd\"  -work altera_fp_functions_181"                         
    lappend design_files "vhdlan -xlrm $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fp_mul/fp_mul/altera_fp_functions_181/sim/fp_mul_altera_fp_functions_181_4pk7koa.vhd\"  -work altera_fp_functions_181"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/fp_mul/fp_mul/sim/fp_mul.v\"  -work fp_mul"                                                                                
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/ram_w/ram_w/ram_2port_181/sim/ram_w_ram_2port_181_pyapd2a.v\"  -work ram_2port_181"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/ram_w/ram_w/synth/ram_w.v\"  -work ram_w"                                                   
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/ram_w_ctrlsig/ram_w_ctrlsig/ram_2port_181/sim/ram_w_ctrlsig_ram_2port_181_djt6qxq.v\"  -work ram_2port_181"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/ram_w_ctrlsig/ram_w_ctrlsig/synth/ram_w_ctrlsig.v\"  -work ram_w_ctrlsig"                                           
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/veri_data_tx_fifo/veri_data_tx_fifo/fifo_181/sim/veri_data_tx_fifo_fifo_181_26xpu7a.v\"  -work fifo_181"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../ip/veri_data_tx_fifo/veri_data_tx_fifo/synth/veri_data_tx_fifo.v\"  -work veri_data_tx_fifo"                        
    
    return $design_files
  }
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }

  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
