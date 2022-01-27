source [file join [file dirname [info script]] ./../../../ip/monitor/monitor_cpu_nios2/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/monitor/monitor_clk_0/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/monitor/monitor_sysid_qsys_0/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/monitor/monitor_power_temp_sda/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/monitor/monitor_jtag_uart_0/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/monitor/monitor_pio_in/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/monitor/monitor_power_temp_scl/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/monitor/monitor_pio_out/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/monitor/monitor_led/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/monitor/monitor_cpu_onchip_memory/sim/common/vcs_files.tcl]

namespace eval monitor {
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [monitor_cpu_nios2::get_memory_files "$QSYS_SIMDIR/../../ip/monitor/monitor_cpu_nios2/sim/"]]
    set memory_files [concat $memory_files [monitor_clk_0::get_memory_files "$QSYS_SIMDIR/../../ip/monitor/monitor_clk_0/sim/"]]
    set memory_files [concat $memory_files [monitor_sysid_qsys_0::get_memory_files "$QSYS_SIMDIR/../../ip/monitor/monitor_sysid_qsys_0/sim/"]]
    set memory_files [concat $memory_files [monitor_power_temp_sda::get_memory_files "$QSYS_SIMDIR/../../ip/monitor/monitor_power_temp_sda/sim/"]]
    set memory_files [concat $memory_files [monitor_jtag_uart_0::get_memory_files "$QSYS_SIMDIR/../../ip/monitor/monitor_jtag_uart_0/sim/"]]
    set memory_files [concat $memory_files [monitor_pio_in::get_memory_files "$QSYS_SIMDIR/../../ip/monitor/monitor_pio_in/sim/"]]
    set memory_files [concat $memory_files [monitor_power_temp_scl::get_memory_files "$QSYS_SIMDIR/../../ip/monitor/monitor_power_temp_scl/sim/"]]
    set memory_files [concat $memory_files [monitor_pio_out::get_memory_files "$QSYS_SIMDIR/../../ip/monitor/monitor_pio_out/sim/"]]
    set memory_files [concat $memory_files [monitor_led::get_memory_files "$QSYS_SIMDIR/../../ip/monitor/monitor_led/sim/"]]
    set memory_files [concat $memory_files [monitor_cpu_onchip_memory::get_memory_files "$QSYS_SIMDIR/../../ip/monitor/monitor_cpu_onchip_memory/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [monitor_cpu_nios2::get_common_design_files "$QSYS_SIMDIR/../../ip/monitor/monitor_cpu_nios2/sim/"]]
    set design_files [dict merge $design_files [monitor_clk_0::get_common_design_files "$QSYS_SIMDIR/../../ip/monitor/monitor_clk_0/sim/"]]
    set design_files [dict merge $design_files [monitor_sysid_qsys_0::get_common_design_files "$QSYS_SIMDIR/../../ip/monitor/monitor_sysid_qsys_0/sim/"]]
    set design_files [dict merge $design_files [monitor_power_temp_sda::get_common_design_files "$QSYS_SIMDIR/../../ip/monitor/monitor_power_temp_sda/sim/"]]
    set design_files [dict merge $design_files [monitor_jtag_uart_0::get_common_design_files "$QSYS_SIMDIR/../../ip/monitor/monitor_jtag_uart_0/sim/"]]
    set design_files [dict merge $design_files [monitor_pio_in::get_common_design_files "$QSYS_SIMDIR/../../ip/monitor/monitor_pio_in/sim/"]]
    set design_files [dict merge $design_files [monitor_power_temp_scl::get_common_design_files "$QSYS_SIMDIR/../../ip/monitor/monitor_power_temp_scl/sim/"]]
    set design_files [dict merge $design_files [monitor_pio_out::get_common_design_files "$QSYS_SIMDIR/../../ip/monitor/monitor_pio_out/sim/"]]
    set design_files [dict merge $design_files [monitor_led::get_common_design_files "$QSYS_SIMDIR/../../ip/monitor/monitor_led/sim/"]]
    set design_files [dict merge $design_files [monitor_cpu_onchip_memory::get_common_design_files "$QSYS_SIMDIR/../../ip/monitor/monitor_cpu_onchip_memory/sim/"]]
    return $design_files
  }
  
  proc get_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [monitor_cpu_nios2::get_design_files "$QSYS_SIMDIR/../../ip/monitor/monitor_cpu_nios2/sim/"]]
    set design_files [dict merge $design_files [monitor_clk_0::get_design_files "$QSYS_SIMDIR/../../ip/monitor/monitor_clk_0/sim/"]]
    set design_files [dict merge $design_files [monitor_sysid_qsys_0::get_design_files "$QSYS_SIMDIR/../../ip/monitor/monitor_sysid_qsys_0/sim/"]]
    set design_files [dict merge $design_files [monitor_power_temp_sda::get_design_files "$QSYS_SIMDIR/../../ip/monitor/monitor_power_temp_sda/sim/"]]
    set design_files [dict merge $design_files [monitor_jtag_uart_0::get_design_files "$QSYS_SIMDIR/../../ip/monitor/monitor_jtag_uart_0/sim/"]]
    set design_files [dict merge $design_files [monitor_pio_in::get_design_files "$QSYS_SIMDIR/../../ip/monitor/monitor_pio_in/sim/"]]
    set design_files [dict merge $design_files [monitor_power_temp_scl::get_design_files "$QSYS_SIMDIR/../../ip/monitor/monitor_power_temp_scl/sim/"]]
    set design_files [dict merge $design_files [monitor_pio_out::get_design_files "$QSYS_SIMDIR/../../ip/monitor/monitor_pio_out/sim/"]]
    set design_files [dict merge $design_files [monitor_led::get_design_files "$QSYS_SIMDIR/../../ip/monitor/monitor_led/sim/"]]
    set design_files [dict merge $design_files [monitor_cpu_onchip_memory::get_design_files "$QSYS_SIMDIR/../../ip/monitor/monitor_cpu_onchip_memory/sim/"]]
    dict set design_files "monitor_altera_merlin_master_translator_181_mhudjri.sv" "$QSYS_SIMDIR/../altera_merlin_master_translator_181/sim/monitor_altera_merlin_master_translator_181_mhudjri.sv"
    dict set design_files "monitor_altera_merlin_slave_translator_181_5aswt6a.sv"  "$QSYS_SIMDIR/../altera_merlin_slave_translator_181/sim/monitor_altera_merlin_slave_translator_181_5aswt6a.sv"  
    dict set design_files "monitor_altera_merlin_master_agent_181_t5eyqrq.sv"      "$QSYS_SIMDIR/../altera_merlin_master_agent_181/sim/monitor_altera_merlin_master_agent_181_t5eyqrq.sv"          
    dict set design_files "monitor_altera_merlin_slave_agent_181_a7g37xa.sv"       "$QSYS_SIMDIR/../altera_merlin_slave_agent_181/sim/monitor_altera_merlin_slave_agent_181_a7g37xa.sv"            
    dict set design_files "altera_merlin_burst_uncompressor.sv"                    "$QSYS_SIMDIR/../altera_merlin_slave_agent_181/sim/altera_merlin_burst_uncompressor.sv"                         
    dict set design_files "monitor_altera_avalon_sc_fifo_181_hseo73i.v"            "$QSYS_SIMDIR/../altera_avalon_sc_fifo_181/sim/monitor_altera_avalon_sc_fifo_181_hseo73i.v"                     
    dict set design_files "monitor_altera_merlin_router_181_6vwu4zy.sv"            "$QSYS_SIMDIR/../altera_merlin_router_181/sim/monitor_altera_merlin_router_181_6vwu4zy.sv"                      
    dict set design_files "monitor_altera_merlin_router_181_22apfra.sv"            "$QSYS_SIMDIR/../altera_merlin_router_181/sim/monitor_altera_merlin_router_181_22apfra.sv"                      
    dict set design_files "monitor_altera_merlin_router_181_sc3zhbi.sv"            "$QSYS_SIMDIR/../altera_merlin_router_181/sim/monitor_altera_merlin_router_181_sc3zhbi.sv"                      
    dict set design_files "monitor_altera_merlin_router_181_ygpgyvi.sv"            "$QSYS_SIMDIR/../altera_merlin_router_181/sim/monitor_altera_merlin_router_181_ygpgyvi.sv"                      
    dict set design_files "monitor_altera_merlin_demultiplexer_181_wcwblji.sv"     "$QSYS_SIMDIR/../altera_merlin_demultiplexer_181/sim/monitor_altera_merlin_demultiplexer_181_wcwblji.sv"        
    dict set design_files "monitor_altera_merlin_demultiplexer_181_zuchasy.sv"     "$QSYS_SIMDIR/../altera_merlin_demultiplexer_181/sim/monitor_altera_merlin_demultiplexer_181_zuchasy.sv"        
    dict set design_files "monitor_altera_merlin_multiplexer_181_zml3pxq.sv"       "$QSYS_SIMDIR/../altera_merlin_multiplexer_181/sim/monitor_altera_merlin_multiplexer_181_zml3pxq.sv"            
    dict set design_files "altera_merlin_arbitrator.sv"                            "$QSYS_SIMDIR/../altera_merlin_multiplexer_181/sim/altera_merlin_arbitrator.sv"                                 
    dict set design_files "monitor_altera_merlin_multiplexer_181_s3yksmi.sv"       "$QSYS_SIMDIR/../altera_merlin_multiplexer_181/sim/monitor_altera_merlin_multiplexer_181_s3yksmi.sv"            
    dict set design_files "altera_merlin_arbitrator.sv"                            "$QSYS_SIMDIR/../altera_merlin_multiplexer_181/sim/altera_merlin_arbitrator.sv"                                 
    dict set design_files "monitor_altera_merlin_demultiplexer_181_qqjp3iy.sv"     "$QSYS_SIMDIR/../altera_merlin_demultiplexer_181/sim/monitor_altera_merlin_demultiplexer_181_qqjp3iy.sv"        
    dict set design_files "monitor_altera_merlin_multiplexer_181_pwas3gq.sv"       "$QSYS_SIMDIR/../altera_merlin_multiplexer_181/sim/monitor_altera_merlin_multiplexer_181_pwas3gq.sv"            
    dict set design_files "altera_merlin_arbitrator.sv"                            "$QSYS_SIMDIR/../altera_merlin_multiplexer_181/sim/altera_merlin_arbitrator.sv"                                 
    dict set design_files "monitor_altera_merlin_multiplexer_181_clwxkgy.sv"       "$QSYS_SIMDIR/../altera_merlin_multiplexer_181/sim/monitor_altera_merlin_multiplexer_181_clwxkgy.sv"            
    dict set design_files "altera_merlin_arbitrator.sv"                            "$QSYS_SIMDIR/../altera_merlin_multiplexer_181/sim/altera_merlin_arbitrator.sv"                                 
    dict set design_files "monitor_altera_mm_interconnect_181_qntooey.v"           "$QSYS_SIMDIR/../altera_mm_interconnect_181/sim/monitor_altera_mm_interconnect_181_qntooey.v"                   
    dict set design_files "monitor_altera_irq_mapper_181_ayrpisy.sv"               "$QSYS_SIMDIR/../altera_irq_mapper_181/sim/monitor_altera_irq_mapper_181_ayrpisy.sv"                            
    dict set design_files "altera_reset_controller.v"                              "$QSYS_SIMDIR/../altera_reset_controller_181/sim/altera_reset_controller.v"                                     
    dict set design_files "altera_reset_synchronizer.v"                            "$QSYS_SIMDIR/../altera_reset_controller_181/sim/altera_reset_synchronizer.v"                                   
    dict set design_files "monitor.v"                                              "$QSYS_SIMDIR/monitor.v"                                                                                        
    return $design_files
  }
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    append ELAB_OPTIONS [monitor_cpu_nios2::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [monitor_clk_0::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [monitor_sysid_qsys_0::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [monitor_power_temp_sda::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [monitor_jtag_uart_0::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [monitor_pio_in::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [monitor_power_temp_scl::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [monitor_pio_out::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [monitor_led::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [monitor_cpu_onchip_memory::get_elab_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [monitor_cpu_nios2::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [monitor_clk_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [monitor_sysid_qsys_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [monitor_power_temp_sda::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [monitor_jtag_uart_0::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [monitor_pio_in::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [monitor_power_temp_scl::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [monitor_pio_out::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [monitor_led::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [monitor_cpu_onchip_memory::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [monitor_cpu_nios2::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [monitor_clk_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [monitor_sysid_qsys_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [monitor_power_temp_sda::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [monitor_jtag_uart_0::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [monitor_pio_in::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [monitor_power_temp_scl::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [monitor_pio_out::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [monitor_led::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [monitor_cpu_onchip_memory::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
}
