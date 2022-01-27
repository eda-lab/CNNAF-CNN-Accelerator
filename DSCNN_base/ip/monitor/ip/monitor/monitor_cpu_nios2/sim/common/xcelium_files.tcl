
namespace eval monitor_cpu_nios2 {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries altera_nios2_gen2_unit_181 1
    dict set libraries altera_nios2_gen2_181      1
    dict set libraries monitor_cpu_nios2          1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    lappend memory_files "$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_bht_ram.mif"
    lappend memory_files "$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_bht_ram.dat"
    lappend memory_files "$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_bht_ram.hex"
    lappend memory_files "$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_rf_ram_a.mif"
    lappend memory_files "$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_rf_ram_a.dat"
    lappend memory_files "$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_rf_ram_a.hex"
    lappend memory_files "$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_rf_ram_b.mif"
    lappend memory_files "$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_rf_ram_b.dat"
    lappend memory_files "$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_rf_ram_b.hex"
    lappend memory_files "$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_ociram_default_contents.mif"
    lappend memory_files "$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_ociram_default_contents.dat"
    lappend memory_files "$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_ociram_default_contents.hex"
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_test_bench.v\"  -work altera_nios2_gen2_unit_181 -cdslib  ./cds_libs/altera_nios2_gen2_unit_181.cds.lib"         
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_mult_cell.v\"  -work altera_nios2_gen2_unit_181 -cdslib  ./cds_libs/altera_nios2_gen2_unit_181.cds.lib"          
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_debug_slave_tck.v\"  -work altera_nios2_gen2_unit_181 -cdslib  ./cds_libs/altera_nios2_gen2_unit_181.cds.lib"    
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_debug_slave_sysclk.v\"  -work altera_nios2_gen2_unit_181 -cdslib  ./cds_libs/altera_nios2_gen2_unit_181.cds.lib" 
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_debug_slave_wrapper.v\"  -work altera_nios2_gen2_unit_181 -cdslib  ./cds_libs/altera_nios2_gen2_unit_181.cds.lib"
    lappend design_files "xmvlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa.vo\"  -work altera_nios2_gen2_unit_181 -cdslib  ./cds_libs/altera_nios2_gen2_unit_181.cds.lib"                   
    lappend design_files "xmvlog -compcnfg $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_nios2_gen2_181/sim/monitor_cpu_nios2_altera_nios2_gen2_181_vjw4aiy.v\"  -work altera_nios2_gen2_181"                                                                                
    lappend design_files "xmvlog -compcnfg $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/monitor_cpu_nios2.v\"  -work monitor_cpu_nios2"                                                                                                                                               
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
  
  
}
