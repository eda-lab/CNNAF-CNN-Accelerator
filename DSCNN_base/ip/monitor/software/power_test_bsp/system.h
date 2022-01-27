/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'cpu_nios2' in SOPC Builder design 'monitor'
 * SOPC Builder design path: /home/gtd/workspace/qts_prj/a10_test/pt/fa506t_system_monitor_restored/monitor/monitor/monitor.sopcinfo
 *
 * Generated: Sun Apr 25 10:27:51 CST 2021
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
#define ALT_CPU_BREAK_ADDR 0x00081820
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 125000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "fast"
#define ALT_CPU_DATA_ADDR_WIDTH 0x14
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x00040020
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
#define ALT_CPU_ICACHE_LINE_SIZE 0
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_ICACHE_SIZE 0
#define ALT_CPU_INST_ADDR_WIDTH 0x14
#define ALT_CPU_NAME "cpu_nios2"
#define ALT_CPU_NUM_OF_SHADOW_REG_SETS 0
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x00040000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00081820
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 125000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_DATA_ADDR_WIDTH 0x14
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x00040020
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
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 0x14
#define NIOS2_NUM_OF_SHADOW_REG_SETS 0
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x00040000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID_QSYS
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
#define ALT_STDERR "/dev/jtag_uart_0"
#define ALT_STDERR_BASE 0x82098
#define ALT_STDERR_DEV jtag_uart_0
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart_0"
#define ALT_STDIN_BASE 0x82098
#define ALT_STDIN_DEV jtag_uart_0
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart_0"
#define ALT_STDOUT_BASE 0x82098
#define ALT_STDOUT_DEV jtag_uart_0
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "monitor"


/*
 * cpu_onchip_memory configuration
 *
 */

#define ALT_MODULE_CLASS_cpu_onchip_memory altera_avalon_onchip_memory2
#define CPU_ONCHIP_MEMORY_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define CPU_ONCHIP_MEMORY_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define CPU_ONCHIP_MEMORY_BASE 0x40000
#define CPU_ONCHIP_MEMORY_CONTENTS_INFO ""
#define CPU_ONCHIP_MEMORY_DUAL_PORT 0
#define CPU_ONCHIP_MEMORY_GUI_RAM_BLOCK_TYPE "AUTO"
#define CPU_ONCHIP_MEMORY_INIT_CONTENTS_FILE "monitor_cpu_onchip_memory_cpu_onchip_memory"
#define CPU_ONCHIP_MEMORY_INIT_MEM_CONTENT 1
#define CPU_ONCHIP_MEMORY_INSTANCE_ID "NONE"
#define CPU_ONCHIP_MEMORY_IRQ -1
#define CPU_ONCHIP_MEMORY_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CPU_ONCHIP_MEMORY_NAME "/dev/cpu_onchip_memory"
#define CPU_ONCHIP_MEMORY_NON_DEFAULT_INIT_FILE_ENABLED 0
#define CPU_ONCHIP_MEMORY_RAM_BLOCK_TYPE "AUTO"
#define CPU_ONCHIP_MEMORY_READ_DURING_WRITE_MODE "DONT_CARE"
#define CPU_ONCHIP_MEMORY_SINGLE_CLOCK_OP 0
#define CPU_ONCHIP_MEMORY_SIZE_MULTIPLE 1
#define CPU_ONCHIP_MEMORY_SIZE_VALUE 65536
#define CPU_ONCHIP_MEMORY_SPAN 65536
#define CPU_ONCHIP_MEMORY_TYPE "altera_avalon_onchip_memory2"
#define CPU_ONCHIP_MEMORY_WRITABLE 1


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 32
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart_0 configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart_0 altera_avalon_jtag_uart
#define JTAG_UART_0_BASE 0x82098
#define JTAG_UART_0_IRQ 0
#define JTAG_UART_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_0_NAME "/dev/jtag_uart_0"
#define JTAG_UART_0_READ_DEPTH 64
#define JTAG_UART_0_READ_THRESHOLD 8
#define JTAG_UART_0_SPAN 8
#define JTAG_UART_0_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_0_WRITE_DEPTH 64
#define JTAG_UART_0_WRITE_THRESHOLD 8


/*
 * led configuration
 *
 */

#define ALT_MODULE_CLASS_led altera_avalon_pio
#define LED_BASE 0x82080
#define LED_BIT_CLEARING_EDGE_REGISTER 0
#define LED_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LED_CAPTURE 0
#define LED_DATA_WIDTH 2
#define LED_DO_TEST_BENCH_WIRING 0
#define LED_DRIVEN_SIM_VALUE 0
#define LED_EDGE_TYPE "NONE"
#define LED_FREQ 125000000
#define LED_HAS_IN 0
#define LED_HAS_OUT 1
#define LED_HAS_TRI 0
#define LED_IRQ -1
#define LED_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LED_IRQ_TYPE "NONE"
#define LED_NAME "/dev/led"
#define LED_RESET_VALUE 0
#define LED_SPAN 16
#define LED_TYPE "altera_avalon_pio"


/*
 * pio_in configuration
 *
 */

#define ALT_MODULE_CLASS_pio_in altera_avalon_pio
#define PIO_IN_BASE 0x82070
#define PIO_IN_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_IN_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_IN_CAPTURE 0
#define PIO_IN_DATA_WIDTH 32
#define PIO_IN_DO_TEST_BENCH_WIRING 0
#define PIO_IN_DRIVEN_SIM_VALUE 0
#define PIO_IN_EDGE_TYPE "NONE"
#define PIO_IN_FREQ 125000000
#define PIO_IN_HAS_IN 1
#define PIO_IN_HAS_OUT 0
#define PIO_IN_HAS_TRI 0
#define PIO_IN_IRQ -1
#define PIO_IN_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_IN_IRQ_TYPE "NONE"
#define PIO_IN_NAME "/dev/pio_in"
#define PIO_IN_RESET_VALUE 0
#define PIO_IN_SPAN 16
#define PIO_IN_TYPE "altera_avalon_pio"


/*
 * pio_out configuration
 *
 */

#define ALT_MODULE_CLASS_pio_out altera_avalon_pio
#define PIO_OUT_BASE 0x82060
#define PIO_OUT_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_OUT_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_OUT_CAPTURE 0
#define PIO_OUT_DATA_WIDTH 32
#define PIO_OUT_DO_TEST_BENCH_WIRING 0
#define PIO_OUT_DRIVEN_SIM_VALUE 0
#define PIO_OUT_EDGE_TYPE "NONE"
#define PIO_OUT_FREQ 125000000
#define PIO_OUT_HAS_IN 0
#define PIO_OUT_HAS_OUT 1
#define PIO_OUT_HAS_TRI 0
#define PIO_OUT_IRQ -1
#define PIO_OUT_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_OUT_IRQ_TYPE "NONE"
#define PIO_OUT_NAME "/dev/pio_out"
#define PIO_OUT_RESET_VALUE 0
#define PIO_OUT_SPAN 16
#define PIO_OUT_TYPE "altera_avalon_pio"


/*
 * power_temp_scl configuration
 *
 */

#define ALT_MODULE_CLASS_power_temp_scl altera_avalon_pio
#define POWER_TEMP_SCL_BASE 0x82030
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
#define POWER_TEMP_SCL_RESET_VALUE 1
#define POWER_TEMP_SCL_SPAN 16
#define POWER_TEMP_SCL_TYPE "altera_avalon_pio"


/*
 * power_temp_sda configuration
 *
 */

#define ALT_MODULE_CLASS_power_temp_sda altera_avalon_pio
#define POWER_TEMP_SDA_BASE 0x82020
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
 * sysid_qsys_0 configuration
 *
 */

#define ALT_MODULE_CLASS_sysid_qsys_0 altera_avalon_sysid_qsys
#define SYSID_QSYS_0_BASE 0x82090
#define SYSID_QSYS_0_ID 0
#define SYSID_QSYS_0_IRQ -1
#define SYSID_QSYS_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_QSYS_0_NAME "/dev/sysid_qsys_0"
#define SYSID_QSYS_0_SPAN 8
#define SYSID_QSYS_0_TIMESTAMP 0
#define SYSID_QSYS_0_TYPE "altera_avalon_sysid_qsys"

#endif /* __SYSTEM_H_ */
