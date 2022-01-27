/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include "unistd.h"
#include "system.h"
#include "altera_avalon_timer_regs.h" 	//Timer �Ĵ���ͷ�ļ�
#include "alt_types.h"
#include "sys/alt_irq.h"
#include "math.h"
//#include "stddef.h"
#include "altera_avalon_pio_regs.h"
#include "./inc/fa506t.h"
#include "./inc/ina3221.h"
#include "./inc/tmp513.h"

void IRQ_calc_finish_Interrupts(); 	//�жϳ�ʼ������
void IRQ_init();

alt_u8 rd_res_start = 0;
alt_u8 rd_res_finish = 1;
alt_u8 show_msg = 0;
float rd_res_f[1001];
float rd_res_num = 0.0;
int infer_res = 0;
int res = 0;
int calc_fps_last = 0;
int rd_fps = 0;
int calc_fps = 0;
int calc_used_ddr_rdy = 0;
int calc_used_wr_ddr_rdy = 0;
int calc_unused_ddr_rdy = 0;
int calc_used_unit = 0;
int calc_total_unit = 0;

void Timer_ISR_Interrupt(void) {
	rd_fps = IORD_ALTERA_AVALON_PIO_DATA(CALC_FPS_BASE);
	calc_fps = (rd_fps - calc_fps_last) / 10;
	calc_fps_last = rd_fps;
	IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_BASE, 0);
	if (show_msg == 0) {show_msg = 1;}
}

void Timer_initial(void){
	IOWR_ALTERA_AVALON_TIMER_PERIODH(TIMER_BASE, 0x3B9A); //3B9A
	IOWR_ALTERA_AVALON_TIMER_PERIODL(TIMER_BASE, 0xC9FF); //C9FF

	//����CONTROL �Ĵ���
	IOWR_ALTERA_AVALON_TIMER_CONTROL(
			TIMER_BASE, ALTERA_AVALON_TIMER_CONTROL_ITO_MSK     //ʹ�ܼ�ʱ���ж�
					  | ALTERA_AVALON_TIMER_CONTROL_CONT_MSK    //��ʱ����������
					  | ALTERA_AVALON_TIMER_CONTROL_START_MSK); //������ʱ��

	alt_ic_isr_register(
			TIMER_IRQ_INTERRUPT_CONTROLLER_ID, //�жϿ�����ID
			TIMER_IRQ,                         //Ӳ���жϺ�
			Timer_ISR_Interrupt,               //�жϷ������
			0,                       		   //���ڴ��ݲ����Ľṹ��ָ��
			0);
}


void Read_data(void)
{
	unsigned rd_res[1001];
	calc_unused_ddr_rdy = IORD_ALTERA_AVALON_PIO_DATA(UNUSED_DDRVLD_BASE);
	calc_used_wr_ddr_rdy = IORD_ALTERA_AVALON_PIO_DATA(WR_DDRVLD_BASE);
	calc_used_ddr_rdy = IORD_ALTERA_AVALON_PIO_DATA(USED_DDRVLD_BASE);
	calc_total_unit = IORD_ALTERA_AVALON_PIO_DATA(CALC_UNIT_TOTAL_BASE);
	calc_used_unit = IORD_ALTERA_AVALON_PIO_DATA(CALC_UNIT_USED_BASE);
	for (int i = 0; i < 1001; i++) {
		IOWR_ALTERA_AVALON_PIO_DATA(DATA_ADDR_BASE, i);
		rd_res[i] = IORD_ALTERA_AVALON_PIO_DATA(CALC_DATA_BASE);
	}
	memcpy(&rd_res_f, &rd_res, 4004);
//	printf("287: %d\n", (int)(rd_res_f[283]*1000));
	IOWR_ALTERA_AVALON_PIO_DATA(DATA_ADDR_BASE, 0); //
}

void softmax(void) {
//	float exp_res = 0.0;
//	for (int i = 0; i < 1001; i++) {
//		exp_res = rd_res_f[i] * rd_res_f[i];
//		rd_res_f[i] = exp_res;
//		rd_res_num += exp_res;
//	}
//	for (int i = 0; i < 1001; i++) {
//		rd_res_f[i] = rd_res_f[i]/rd_res_num;
//	}
	for (int i = 0; i < 1001; i++) {
		if (rd_res_f[i] > rd_res_f[infer_res]) {
			infer_res = i;
		}
	}
//	printf("283: %d\n", (int)(rd_res_f[283]*1000));
//	int a;
//	memcpy(&a, &rd_res_f[286], 4);
//	printf("286: %d\n", a);
//	printf("288: %d\n", (int)(rd_res_f[288]*1000));
//	printf("res: %d\n",infer_res);
}

int get_ddr_utilization(){
	float used = (float)calc_used_ddr_rdy;
	float unused = (float)calc_unused_ddr_rdy;
	used = used / (used + unused);
	used *= 1000;
	return (int)used;
}

int get_unit_utilization(){
	float used = (float)calc_used_unit;
	float total = (float)calc_total_unit;
	used = used/total*1000;
	return (int)used;
}

void IRQ_calc_finish_Interrupts()
{
	if (rd_res_finish == 1) {
		rd_res_finish = 0;
		rd_res_start = 1;
	}
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(CALC_FINISH_BASE, 1);
}

void IRQ_init()
{
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(CALC_FINISH_BASE, 0x01);
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(CALC_FINISH_BASE, 1);
	alt_ic_isr_register(
		CALC_FINISH_IRQ_INTERRUPT_CONTROLLER_ID,  // �жϿ�������ţ���system.h ����
		CALC_FINISH_IRQ                        ,  // Ӳ���жϺţ���system.h ����
		IRQ_calc_finish_Interrupts             	,  // �жϷ����Ӻ���
		0x0                             ,  // ָ�����豸����ʵ����ص����ݽṹ��
		0x0);
}

int main()
{
	unsigned int i = 0;
	unsigned int core_power = 0;
	unsigned int ddr_power = 0;
	unsigned int board_power = 0;
	unsigned int core_temperature = 0;

	//CPU_LED_G_ON;
	//CPU_LED_R_ON;

    // Read chip's information
	Read_Ina3221_Information();
	Read_Tmp513_Information();

    printf("Hello from Nios II!\n");
    Timer_initial();
    IRQ_init();
    int cnt = 0;
    while(1) {
    	if (rd_res_start == 1) {
			Read_data();
			rd_res_num = 0.0;
			infer_res = 0;
			softmax();
			res = infer_res;
			cnt = 0;
    		if (cnt == 20) {
//    			printf("used ddr: %d, unused ddr: %d\n",calc_used_ddr_rdy, calc_unused_ddr_rdy);
//    			printf("wr ddr: %d\n", calc_used_wr_ddr_rdy);
    		}
     		cnt = cnt + 1;
     		rd_res_finish = 1;
     		rd_res_start = 0;
    	}
    	if (show_msg == 1) {
    		printf("#---result---#\n");
    		printf("rd_fps: %d, calc_fps_last: %d\n", rd_fps, calc_fps_last);
    		printf("calc fps = %d\n", calc_fps);
    		printf("Infer result is: %d\n", res);
    		int ddr_utilization = get_ddr_utilization();
    		int unit_utilization = get_unit_utilization();
    		printf("used ddr: %d, unused ddr: %d\n",calc_used_ddr_rdy, calc_unused_ddr_rdy);
    		printf("ddr utilization: 0.%d\n", ddr_utilization);
    		printf("unit total: %d\n", calc_total_unit);
    		printf("unit_utilization: 0.%d\n\n", unit_utilization);

    		// power
    		Power_Monitor(&board_power, &ddr_power, &core_power);
    		core_temperature = Tmp513_Reg_Read(REMOTE_TEMP1_REG);
    		core_temperature = core_temperature/128;

    		printf("$-----------------------------------------------------$\n");
			printf("$ Power monitor: %d\n", i);
			printf("$-----------------------------------------------------$\n");
			printf("$ core's power : %5d mw\n",  core_power/1100);
			printf("$ board's power: %5d mw\n", board_power/1400);
			printf("$ fpga's core temperature: %5d Degree\n", core_temperature);
			printf("$-----------------------------------------------------$\n\n");

			i++;

    		show_msg = 0;
    	}
    }
    return 0;
}


