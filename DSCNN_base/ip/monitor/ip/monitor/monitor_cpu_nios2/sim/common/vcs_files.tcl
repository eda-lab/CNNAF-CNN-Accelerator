
namespace eval monitor_cpu_nios2 {
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
  
  proc get_common_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    dict set design_files "monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_test_bench.v"          "$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_test_bench.v"         
    dict set design_files "monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_mult_cell.v"           "$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_mult_cell.v"          
    dict set design_files "monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_debug_slave_tck.v"     "$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_debug_slave_tck.v"    
    dict set design_files "monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_debug_slave_sysclk.v"  "$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_debug_slave_sysclk.v" 
    dict set design_files "monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_debug_slave_wrapper.v" "$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa_debug_slave_wrapper.v"
    dict set design_files "monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa.vo"                    "$QSYS_SIMDIR/../altera_nios2_gen2_unit_181/sim/monitor_cpu_nios2_altera_nios2_gen2_unit_181_sh4qswa.vo"                   
    dict set design_files "monitor_cpu_nios2_altera_nios2_gen2_181_vjw4aiy.v"                          "$QSYS_SIMDIR/../altera_nios2_gen2_181/sim/monitor_cpu_nios2_altera_nios2_gen2_181_vjw4aiy.v"                              
    dict set design_files "monitor_cpu_nios2.v"                                                        "$QSYS_SIMDIR/monitor_cpu_nios2.v"                                                                                         
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
