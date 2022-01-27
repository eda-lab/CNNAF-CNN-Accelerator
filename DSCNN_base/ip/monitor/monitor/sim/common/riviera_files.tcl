source [file join [file dirname [info script]] ./../../../ip/monitor/monitor_cpu_nios2/sim/common/riviera_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/monitor/monitor_clk_0/sim/common/riviera_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/monitor/monitor_sysid_qsys_0/sim/common/riviera_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/monitor/monitor_power_temp_sda/sim/common/riviera_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/monitor/monitor_jtag_uart_0/sim/common/riviera_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/monitor/monitor_pio_in/sim/common/riviera_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/monitor/monitor_power_temp_scl/sim/common/riviera_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/monitor/monitor_pio_out/sim/common/riviera_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/monitor/monitor_led/sim/common/riviera_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/monitor/monitor_cpu_onchip_memory/sim/common/riviera_files.tcl]

namespace eval monitor {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [monitor_cpu_nios2::get_design_libraries]]
    set libraries [dict merge $libraries [monitor_clk_0::get_design_libraries]]
    set libraries [dict merge $libraries [monitor_sysid_qsys_0::get_design_libraries]]
    set libraries [dict merge $libraries [monitor_power_temp_sda::get_design_libraries]]
    set libraries [dict merge $libraries [monitor_jtag_uart_0::get_design_libraries]]
    set libraries [dict merge $libraries [monitor_pio_in::get_design_libraries]]
    set libraries [dict merge $libraries [monitor_power_temp_scl::get_design_libraries]]
    set libraries [dict merge $libraries [monitor_pio_out::get_design_libraries]]
    set libraries [dict merge $libraries [monitor_led::get_design_libraries]]
    set libraries [dict merge $libraries [monitor_cpu_onchip_memory::get_design_libraries]]
    dict set libraries altera_merlin_master_translator_181 1
    dict set libraries altera_merlin_slave_translator_181  1
    dict set libraries altera_merlin_master_agent_181      1
    dict set libraries altera_merlin_slave_agent_181       1
    dict set libraries altera_avalon_sc_fifo_181           1
    dict set libraries altera_merlin_router_181            1
    dict set libraries altera_merlin_demultiplexer_181     1
    dict set libraries altera_merlin_multiplexer_181       1
    dict set libraries altera_mm_interconnect_181          1
    dict set libraries altera_irq_mapper_181               1
    dict set libraries altera_reset_controller_181         1
    dict set libraries monitor                             1
    return $libraries
  }
  
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
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [monitor_cpu_nios2::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/monitor/monitor_cpu_nios2/sim/"]]
    set design_files [dict merge $design_files [monitor_clk_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/monitor/monitor_clk_0/sim/"]]
    set design_files [dict merge $design_files [monitor_sysid_qsys_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/monitor/monitor_sysid_qsys_0/sim/"]]
    set design_files [dict merge $design_files [monitor_power_temp_sda::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/monitor/monitor_power_temp_sda/sim/"]]
    set design_files [dict merge $design_files [monitor_jtag_uart_0::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/monitor/monitor_jtag_uart_0/sim/"]]
    set design_files [dict merge $design_files [monitor_pio_in::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/monitor/monitor_pio_in/sim/"]]
    set design_files [dict merge $design_files [monitor_power_temp_scl::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/monitor/monitor_power_temp_scl/sim/"]]
    set design_files [dict merge $design_files [monitor_pio_out::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/monitor/monitor_pio_out/sim/"]]
    set design_files [dict merge $design_files [monitor_led::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/monitor/monitor_led/sim/"]]
    set design_files [dict merge $design_files [monitor_cpu_onchip_memory::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/monitor/monitor_cpu_onchip_memory/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [monitor_cpu_nios2::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/monitor/monitor_cpu_nios2/sim/"]]
    set design_files [concat $design_files [monitor_clk_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/monitor/monitor_clk_0/sim/"]]
    set design_files [concat $design_files [monitor_sysid_qsys_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/monitor/monitor_sysid_qsys_0/sim/"]]
    set design_files [concat $design_files [monitor_power_temp_sda::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/monitor/monitor_power_temp_sda/sim/"]]
    set design_files [concat $design_files [monitor_jtag_uart_0::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/monitor/monitor_jtag_uart_0/sim/"]]
    set design_files [concat $design_files [monitor_pio_in::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/monitor/monitor_pio_in/sim/"]]
    set design_files [concat $design_files [monitor_power_temp_scl::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/monitor/monitor_power_temp_scl/sim/"]]
    set design_files [concat $design_files [monitor_pio_out::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/monitor/monitor_pio_out/sim/"]]
    set design_files [concat $design_files [monitor_led::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/monitor/monitor_led/sim/"]]
    set design_files [concat $design_files [monitor_cpu_onchip_memory::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/monitor/monitor_cpu_onchip_memory/sim/"]]
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_master_translator_181/sim/monitor_altera_merlin_master_translator_181_mhudjri.sv"]\"  -work altera_merlin_master_translator_181"
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_translator_181/sim/monitor_altera_merlin_slave_translator_181_5aswt6a.sv"]\"  -work altera_merlin_slave_translator_181"   
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_master_agent_181/sim/monitor_altera_merlin_master_agent_181_t5eyqrq.sv"]\"  -work altera_merlin_master_agent_181"               
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_agent_181/sim/monitor_altera_merlin_slave_agent_181_a7g37xa.sv"]\"  -work altera_merlin_slave_agent_181"                  
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_slave_agent_181/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_slave_agent_181"                               
    lappend design_files "vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_sc_fifo_181/sim/monitor_altera_avalon_sc_fifo_181_hseo73i.v"]\"  -work altera_avalon_sc_fifo_181"                          
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_181/sim/monitor_altera_merlin_router_181_6vwu4zy.sv"]\"  -work altera_merlin_router_181"                                 
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_181/sim/monitor_altera_merlin_router_181_22apfra.sv"]\"  -work altera_merlin_router_181"                                 
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_181/sim/monitor_altera_merlin_router_181_sc3zhbi.sv"]\"  -work altera_merlin_router_181"                                 
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_181/sim/monitor_altera_merlin_router_181_ygpgyvi.sv"]\"  -work altera_merlin_router_181"                                 
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_181/sim/monitor_altera_merlin_demultiplexer_181_wcwblji.sv"]\"  -work altera_merlin_demultiplexer_181"            
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_181/sim/monitor_altera_merlin_demultiplexer_181_zuchasy.sv"]\"  -work altera_merlin_demultiplexer_181"            
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_181/sim/monitor_altera_merlin_multiplexer_181_zml3pxq.sv"]\"  -work altera_merlin_multiplexer_181"                  
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_181/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_181"                                       
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_181/sim/monitor_altera_merlin_multiplexer_181_s3yksmi.sv"]\"  -work altera_merlin_multiplexer_181"                  
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_181/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_181"                                       
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_181/sim/monitor_altera_merlin_demultiplexer_181_qqjp3iy.sv"]\"  -work altera_merlin_demultiplexer_181"            
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_181/sim/monitor_altera_merlin_multiplexer_181_pwas3gq.sv"]\"  -work altera_merlin_multiplexer_181"                  
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_181/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_181"                                       
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_181/sim/monitor_altera_merlin_multiplexer_181_clwxkgy.sv"]\"  -work altera_merlin_multiplexer_181"                  
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_181/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_181"                                       
    lappend design_files "vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_181/sim/monitor_altera_mm_interconnect_181_qntooey.v"]\"  -work altera_mm_interconnect_181"                       
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_irq_mapper_181/sim/monitor_altera_irq_mapper_181_ayrpisy.sv"]\"  -work altera_irq_mapper_181"                                          
    lappend design_files "vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_181/sim/altera_reset_controller.v"]\"  -work altera_reset_controller_181"                                        
    lappend design_files "vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_181/sim/altera_reset_synchronizer.v"]\"  -work altera_reset_controller_181"                                      
    lappend design_files "vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/monitor.v"]\"  -work monitor"                                                                                                               
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
  
  
  proc normalize_path {FILEPATH} {
      if {[catch { package require fileutil } err]} { 
          return $FILEPATH 
      } 
      set path [fileutil::lexnormalize [file join [pwd] $FILEPATH]]  
      if {[file pathtype $FILEPATH] eq "relative"} { 
          set path [fileutil::relative [pwd] $path] 
      } 
      return $path 
  } 
}
