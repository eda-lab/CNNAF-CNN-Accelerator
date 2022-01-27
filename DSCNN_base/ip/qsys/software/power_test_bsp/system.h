/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'nios2' in SOPC Builder design 'nios_qsys'
 * SOPC Builder design path: /home/gtd/workspace/qts_prj/cnn/Mobilenet_FPGA_Accelarator_test_basic_power/ip/qsys/nios_qsys/nios_qsys.sopcinfo
 *
 * Generated: Sat Apr 24 17:16:35 CST 2021
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_gen2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x00000820
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 125000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "fast"
#define ALT_CPU_DATA_ADDR_WIDTH 0x11
#define ALT_CPU_DCACHE_BYPASS_MASK 0x80000000
#define ALT_CPU_DCACHE_LINE_SIZE 32
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_DCACHE_SIZE 2048
#define ALT_CPU_EXCEPTION_ADDR 0x00010020
#define ALT_CPU_FLASH_ACCELERATOR_LINES 0
#define ALT_CPU_FLASH_ACCELERATOR_LINE_SIZE 0
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 125000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 1
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_EXTRA_EXCEPTION_INFO
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 32
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_ICACHE_SIZE 2048
#define ALT_CPU_INITDA_SUPPORTED
#define ALT_CPU_INST_ADDR_WIDTH 0x11
#define ALT_CPU_NAME "nios2"
#define ALT_CPU_NUM_OF_SHADOW_REG_SETS 0
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x00010000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00000820
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 125000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_DATA_ADDR_WIDTH 0x11
#define NIOS2_DCACHE_BYPASS_MASK 0x80000000
#define NIOS2_DCACHE_LINE_SIZE 32
#define NIOS2_DCACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_SIZE 2048
#define NIOS2_EXCEPTION_ADDR 0x00010020
#define NIOS2_FLASH_ACCELERATOR_LINES 0
#define NIOS2_FLASH_ACCELERATOR_LINE_SIZE 0
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 1
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_EXTRA_EXCEPTION_INFO
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_ICACHE_SIZE 2048
#define NIOS2_INITDA_SUPPORTED
#define NIOS2_INST_ADDR_WIDTH 0x11
#define NIOS2_NUM_OF_SHADOW_REG_SETS 0
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x00010000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_AVALON_TIMER
#define __ALTERA_NIOS2_GEN2


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Arria 10"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag"
#define ALT_STDERR_BASE 0x10e8
#define ALT_STDERR_DEV jtag
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag"
#define ALT_STDIN_BASE 0x10e8
#define ALT_STDIN_DEV jtag
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag"
#define ALT_STDOUT_BASE 0x10e8
#define ALT_STDOUT_DEV jtag
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "nios_qsys"


/*
 * calc_data configuration
 *
 */

#define ALT_MODULE_CLASS_calc_data altera_avalon_pio
#define CALC_DATA_BASE 0x10c0
#define CALC_DATA_BIT_CLEARING_EDGE_REGISTER 0
#define CALC_DATA_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CALC_DATA_CAPTURE 0
#define CALC_DATA_DATA_WIDTH 32
#define CALC_DATA_DO_TEST_BENCH_WIRING 0
#define CALC_DATA_DRIVEN_SIM_VALUE 0
#define CALC_DATA_EDGE_TYPE "NONE"
#define CALC_DATA_FREQ 125000000
#define CALC_DATA_HAS_IN 1
#define CALC_DATA_HAS_OUT 0
#define CALC_DATA_HAS_TRI 0
#define CALC_DATA_IRQ -1
#define CALC_DATA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CALC_DATA_IRQ_TYPE "NONE"
#define CALC_DATA_NAME "/dev/calc_data"
#define CALC_DATA_RESET_VALUE 0
#define CALC_DATA_SPAN 16
#define CALC_DATA_TYPE "altera_avalon_pio"


/*
 * calc_finish configuration
 *
 */

#define ALT_MODULE_CLASS_calc_finish altera_avalon_pio
#define CALC_FINISH_BASE 0x10b0
#define CALC_FINISH_BIT_CLEARING_EDGE_REGISTER 0
#define CALC_FINISH_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CALC_FINISH_CAPTURE 1
#define CALC_FINISH_DATA_WIDTH 1
#define CALC_FINISH_DO_TEST_BENCH_WIRING 0
#define CALC_FINISH_DRIVEN_SIM_VALUE 0
#define CALC_FINISH_EDGE_TYPE "RISING"
#define CALC_FINISH_FREQ 125000000
#define CALC_FINISH_HAS_IN 1
#define CALC_FINISH_HAS_OUT 0
#define CALC_FINISH_HAS_TRI 0
#define CALC_FINISH_IRQ 2
#define CALC_FINISH_IRQ_INTERRUPT_CONTROLLER_ID 0
#define CALC_FINISH_IRQ_TYPE "EDGE"
#define CALC_FINISH_NAME "/dev/calc_finish"
#define CALC_FINISH_RESET_VALUE 0
#define CALC_FINISH_SPAN 16
#define CALC_FINISH_TYPE "altera_avalon_pio"


/*
 * calc_fps configuration
 *
 */

#define ALT_MODULE_CLASS_calc_fps altera_avalon_pio
#define CALC_FPS_BASE 0x1090
#define CALC_FPS_BIT_CLEARING_EDGE_REGISTER 0
#define CALC_FPS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CALC_FPS_CAPTURE 0
#define CALC_FPS_DATA_WIDTH 32
#define CALC_FPS_DO_TEST_BENCH_WIRING 0
#define CALC_FPS_DRIVEN_SIM_VALUE 0
#define CALC_FPS_EDGE_TYPE "NONE"
#define CALC_FPS_FREQ 125000000
#define CALC_FPS_HAS_IN 1
#define CALC_FPS_HAS_OUT 0
#define CALC_FPS_HAS_TRI 0
#define CALC_FPS_IRQ -1
#define CALC_FPS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CALC_FPS_IRQ_TYPE "NONE"
#define CALC_FPS_NAME "/dev/calc_fps"
#define CALC_FPS_RESET_VALUE 0
#define CALC_FPS_SPAN 16
#define CALC_FPS_TYPE "altera_avalon_pio"


/*
 * calc_unit_total configuration
 *
 */

#define ALT_MODULE_CLASS_calc_unit_total altera_avalon_pio
#define CALC_UNIT_TOTAL_BASE 0x1050
#define CALC_UNIT_TOTAL_BIT_CLEARING_EDGE_REGISTER 0
#define CALC_UNIT_TOTAL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CALC_UNIT_TOTAL_CAPTURE 0
#define CALC_UNIT_TOTAL_DATA_WIDTH 32
#define CALC_UNIT_TOTAL_DO_TEST_BENCH_WIRING 0
#define CALC_UNIT_TOTAL_DRIVEN_SIM_VALUE 0
#define CALC_UNIT_TOTAL_EDGE_TYPE "NONE"
#define CALC_UNIT_TOTAL_FREQ 125000000
#define CALC_UNIT_TOTAL_HAS_IN 1
#define CALC_UNIT_TOTAL_HAS_OUT 0
#define CALC_UNIT_TOTAL_HAS_TRI 0
#define CALC_UNIT_TOTAL_IRQ -1
#define CALC_UNIT_TOTAL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CALC_UNIT_TOTAL_IRQ_TYPE "NONE"
#define CALC_UNIT_TOTAL_NAME "/dev/calc_unit_total"
#define CALC_UNIT_TOTAL_RESET_VALUE 0
#define CALC_UNIT_TOTAL_SPAN 16
#define CALC_UNIT_TOTAL_TYPE "altera_avalon_pio"


/*
 * calc_unit_used configuration
 *
 */

#define ALT_MODULE_CLASS_calc_unit_used altera_avalon_pio
#define CALC_UNIT_USED_BASE 0x1060
#define CALC_UNIT_USED_BIT_CLEARING_EDGE_REGISTER 0
#define CALC_UNIT_USED_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CALC_UNIT_USED_CAPTURE 0
#define CALC_UNIT_USED_DATA_WIDTH 32
#define CALC_UNIT_USED_DO_TEST_BENCH_WIRING 0
#define CALC_UNIT_USED_DRIVEN_SIM_VALUE 0
#define CALC_UNIT_USED_EDGE_TYPE "NONE"
#define CALC_UNIT_USED_FREQ 125000000
#define CALC_UNIT_USED_HAS_IN 1
#define CALC_UNIT_USED_HAS_OUT 0
#define CALC_UNIT_USED_HAS_TRI 0
#define CALC_UNIT_USED_IRQ -1
#define CALC_UNIT_USED_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CALC_UNIT_USED_IRQ_TYPE "NONE"
#define CALC_UNIT_USED_NAME "/dev/calc_unit_used"
#define CALC_UNIT_USED_RESET_VALUE 0
#define CALC_UNIT_USED_SPAN 16
#define CALC_UNIT_USED_TYPE "altera_avalon_pio"


/*
 * data_addr configuration
 *
 */

#define ALT_MODULE_CLASS_data_addr altera_avalon_pio
#define DATA_ADDR_BASE 0x10a0
#define DATA_ADDR_BIT_CLEARING_EDGE_REGISTER 0
#define DATA_ADDR_BIT_MODIFYING_OUTPUT_REGISTER 0
#define DATA_ADDR_CAPTURE 0
#define DATA_ADDR_DATA_WIDTH 32
#define DATA_ADDR_DO_TEST_BENCH_WIRING 0
#define DATA_ADDR_DRIVEN_SIM_VALUE 0
#define DATA_ADDR_EDGE_TYPE "NONE"
#define DATA_ADDR_FREQ 125000000
#define DATA_ADDR_HAS_IN 0
#define DATA_ADDR_HAS_OUT 1
#define DATA_ADDR_HAS_TRI 0
#define DATA_ADDR_IRQ -1
#define DATA_ADDR_IRQ_INTERRUPT_CONTROLLER_ID -1
#define DATA_ADDR_IRQ_TYPE "NONE"
#define DATA_ADDR_NAME "/dev/data_addr"
#define DATA_ADDR_RESET_VALUE 0
#define DATA_ADDR_SPAN 16
#define DATA_ADDR_TYPE "altera_avalon_pio"


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 32
#define ALT_SYS_CLK TIMER
#define ALT_TIMESTAMP_CLK none


/*
 * jtag configuration
 *
 */

#define ALT_MODULE_CLASS_jtag altera_avalon_jtag_uart
#define JTAG_BASE 0x10e8
#define JTAG_IRQ 0
#define JTAG_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_NAME "/dev/jtag"
#define JTAG_READ_DEPTH 64
#define JTAG_READ_THRESHOLD 8
#define JTAG_SPAN 8
#define JTAG_TYPE "altera_avalon_jtag_uart"
#define JTAG_WRITE_DEPTH 64
#define JTAG_WRITE_THRESHOLD 8


/*
 * onchip_ram configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_ram altera_avalon_onchip_memory2
#define ONCHIP_RAM_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_RAM_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_RAM_BASE 0x10000
#define ONCHIP_RAM_CONTENTS_INFO ""
#define ONCHIP_RAM_DUAL_PORT 0
#define ONCHIP_RAM_GUI_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_RAM_INIT_CONTENTS_FILE "nios_qsys_onchip_memory2_0_onchip_memory2_0"
#define ONCHIP_RAM_INIT_MEM_CONTENT 1
#define ONCHIP_RAM_INSTANCE_ID "NONE"
#define ONCHIP_RAM_IRQ -1
#define ONCHIP_RAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_RAM_NAME "/dev/onchip_ram"
#define ONCHIP_RAM_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_RAM_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_RAM_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_RAM_SINGLE_CLOCK_OP 0
#define ONCHIP_RAM_SIZE_MULTIPLE 1
#define ONCHIP_RAM_SIZE_VALUE 65536
#define ONCHIP_RAM_SPAN 65536
#define ONCHIP_RAM_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_RAM_WRITABLE 1


/*
 * power_temp_scl configuration
 *
 */

#define ALT_MODULE_CLASS_power_temp_scl altera_avalon_pio
#define POWER_TEMP_SCL_BASE 0x1030
#define POWER_TEMP_SCL_BIT_CLEARING_EDGE_REGISTER 0
#define POWER_TEMP_SCL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define POWER_TEMP_SCL_CAPTURE 0
#define POWER_TEMP_SCL_DATA_WIDTH 1
#define POWER_TEMP_SCL_DO_TEST_BENCH_WIRING 0
#define POWER_TEMP_SCL_DRIVEN_SIM_VALUE 0
#define POWER_TEMP_SCL_EDGE_TYPE "NONE"
#define POWER_TEMP_SCL_FREQ 125000000
#define POWER_TEMP_SCL_HAS_IN 0
#define POWER_TEMP_SCL_HAS_OUT 1
#define POWER_TEMP_SCL_HAS_TRI 0
#define POWER_TEMP_SCL_IRQ -1
#define POWER_TEMP_SCL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define POWER_TEMP_SCL_IRQ_TYPE "NONE"
#define POWER_TEMP_SCL_NAME "/dev/power_temp_scl"
#define POWER_TEMP_SCL_RESET_VALUE 0
#define POWER_TEMP_SCL_SPAN 16
#define POWER_TEMP_SCL_TYPE "altera_avalon_pio"


/*
 * power_temp_sda configuration
 *
 */

#define ALT_MODULE_CLASS_power_temp_sda altera_avalon_pio
#define POWER_TEMP_SDA_BASE 0x1020
#define POWER_TEMP_SDA_BIT_CLEARING_EDGE_REGISTER 0
#define POWER_TEMP_SDA_BIT_MODIFYING_OUTPUT_REGISTER 0
#define POWER_TEMP_SDA_CAPTURE 0
#define POWER_TEMP_SDA_DATA_WIDTH 1
#define POWER_TEMP_SDA_DO_TEST_BENCH_WIRING 0
#define POWER_TEMP_SDA_DRIVEN_SIM_VALUE 0
#define POWER_TEMP_SDA_EDGE_TYPE "NONE"
#define POWER_TEMP_SDA_FREQ 125000000
#define POWER_TEMP_SDA_HAS_IN 0
#define POWER_TEMP_SDA_HAS_OUT 0
#define POWER_TEMP_SDA_HAS_TRI 1
#define POWER_TEMP_SDA_IRQ -1
#define POWER_TEMP_SDA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define POWER_TEMP_SDA_IRQ_TYPE "NONE"
#define POWER_TEMP_SDA_NAME "/dev/power_temp_sda"
#define POWER_TEMP_SDA_RESET_VALUE 0
#define POWER_TEMP_SDA_SPAN 16
#define POWER_TEMP_SDA_TYPE "altera_avalon_pio"


/*
 * sysid configuration
 *
 */

#define ALT_MODULE_CLASS_sysid altera_avalon_sysid_qsys
#define SYSID_BASE 0x10e0
#define SYSID_ID 0
#define SYSID_IRQ -1
#define SYSID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_NAME "/dev/sysid"
#define SYSID_SPAN 8
#define SYSID_TIMESTAMP 0
#define SYSID_TYPE "altera_avalon_sysid_qsys"


/*
 * timer configuration
 *
 */

#define ALT_MODULE_CLASS_timer altera_avalon_timer
#define TIMER_ALWAYS_RUN 0
#define TIMER_BASE 0x1000
#define TIMER_COUNTER_SIZE 32
#define TIMER_FIXED_PERIOD 0
#define TIMER_FREQ 125000000
#define TIMER_IRQ 1
#define TIMER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_LOAD_VALUE 124999999
#define TIMER_MULT 1.0
#define TIMER_NAME "/dev/timer"
#define TIMER_PERIOD 1
#define TIMER_PERIOD_UNITS "s"
#define TIMER_RESET_OUTPUT 0
#define TIMER_SNAPSHOT 1
#define TIMER_SPAN 32
#define TIMER_TICKS_PER_SEC 1
#define TIMER_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_TYPE "altera_avalon_timer"


/*
 * unused_ddrvld configuration
 *
 */

#define ALT_MODULE_CLASS_unused_ddrvld altera_avalon_pio
#define UNUSED_DDRVLD_BASE 0x1070
#define UNUSED_DDRVLD_BIT_CLEARING_EDGE_REGISTER 0
#define UNUSED_DDRVLD_BIT_MODIFYING_OUTPUT_REGISTER 0
#define UNUSED_DDRVLD_CAPTURE 0
#define UNUSED_DDRVLD_DATA_WIDTH 32
#define UNUSED_DDRVLD_DO_TEST_BENCH_WIRING 0
#define UNUSED_DDRVLD_DRIVEN_SIM_VALUE 0
#define UNUSED_DDRVLD_EDGE_TYPE "NONE"
#define UNUSED_DDRVLD_FREQ 125000000
#define UNUSED_DDRVLD_HAS_IN 1
#define UNUSED_DDRVLD_HAS_OUT 0
#define UNUSED_DDRVLD_HAS_TRI 0
#define UNUSED_DDRVLD_IRQ -1
#define UNUSED_DDRVLD_IRQ_INTERRUPT_CONTROLLER_ID -1
#define UNUSED_DDRVLD_IRQ_TYPE "NONE"
#define UNUSED_DDRVLD_NAME "/dev/unused_ddrvld"
#define UNUSED_DDRVLD_RESET_VALUE 0
#define UNUSED_DDRVLD_SPAN 16
#define UNUSED_DDRVLD_TYPE "altera_avalon_pio"


/*
 * used_ddrvld configuration
 *
 */

#define ALT_MODULE_CLASS_used_ddrvld altera_avalon_pio
#define USED_DDRVLD_BASE 0x1080
#define USED_DDRVLD_BIT_CLEARING_EDGE_REGISTER 0
#define USED_DDRVLD_BIT_MODIFYING_OUTPUT_REGISTER 0
#define USED_DDRVLD_CAPTURE 0
#define USED_DDRVLD_DATA_WIDTH 32
#define USED_DDRVLD_DO_TEST_BENCH_WIRING 0
#define USED_DDRVLD_DRIVEN_SIM_VALUE 0
#define USED_DDRVLD_EDGE_TYPE "NONE"
#define USED_DDRVLD_FREQ 125000000
#define USED_DDRVLD_HAS_IN 1
#define USED_DDRVLD_HAS_OUT 0
#define USED_DDRVLD_HAS_TRI 0
#define USED_DDRVLD_IRQ -1
#define USED_DDRVLD_IRQ_INTERRUPT_CONTROLLER_ID -1
#define USED_DDRVLD_IRQ_TYPE "NONE"
#define USED_DDRVLD_NAME "/dev/used_ddrvld"
#define USED_DDRVLD_RESET_VALUE 0
#define USED_DDRVLD_SPAN 16
#define USED_DDRVLD_TYPE "altera_avalon_pio"


/*
 * wr_ddrvld configuration
 *
 */

#define ALT_MODULE_CLASS_wr_ddrvld altera_avalon_pio
#define WR_DDRVLD_BASE 0x1040
#define WR_DDRVLD_BIT_CLEARING_EDGE_REGISTER 0
#define WR_DDRVLD_BIT_MODIFYING_OUTPUT_REGISTER 0
#define WR_DDRVLD_CAPTURE 0
#define WR_DDRVLD_DATA_WIDTH 32
#define WR_DDRVLD_DO_TEST_BENCH_WIRING 0
#define WR_DDRVLD_DRIVEN_SIM_VALUE 0
#define WR_DDRVLD_EDGE_TYPE "NONE"
#define WR_DDRVLD_FREQ 125000000
#define WR_DDRVLD_HAS_IN 1
#define WR_DDRVLD_HAS_OUT 0
#define WR_DDRVLD_HAS_TRI 0
#define WR_DDRVLD_IRQ -1
#define WR_DDRVLD_IRQ_INTERRUPT_CONTROLLER_ID -1
#define WR_DDRVLD_IRQ_TYPE "NONE"
#define WR_DDRVLD_NAME "/dev/wr_ddrvld"
#define WR_DDRVLD_RESET_VALUE 0
#define WR_DDRVLD_SPAN 16
#define WR_DDRVLD_TYPE "altera_avalon_pio"

#endif /* __SYSTEM_H_ */
