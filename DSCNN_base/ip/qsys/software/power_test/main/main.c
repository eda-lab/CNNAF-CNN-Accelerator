/*
 * =====================================================================================
 *
 *       Filename:  main.c
 *
 *    Description:
 *
 *        Version:
 *        Created:
 *       Revision:  none
 *       Compiler:  NIOS II Eclipse
 *
 *         Author:  Kevin Han
 *			Email:  kevinhan@flyslice.com
 *			  URL:  http://www.flyslice.com
 *
 * =====================================================================================
 */
/*--------------------------------------------------------------------------------------
 *  Include
 *------------------------------------------------------------------------------------*/
#include "../inc/fa506t.h"
#include "../inc/ina3221.h"
#include "../inc/tmp513.h"


/*--------------------------------------------------------------------------------------
 *  Define
 *------------------------------------------------------------------------------------*/

/*--------------------------------------------------------------------------------------
 *  Global variables
 *------------------------------------------------------------------------------------*/

/*
 * ===  FUNCTION  ======================================================================
 *         Name:  main
 *  Description:  main function
 * =====================================================================================
 */
int main()
{
	unsigned int i = 0;
	unsigned int core_power = 0;
	unsigned int ddr_power = 0;
	unsigned int board_power = 0;
	unsigned int core_temperature = 0;

	//CPU_LED_G_ON;
	//CPU_LED_R_ON;

	printf("$-----------------------------------------------------$\n");
	printf("$    FPGA project version: fa506t_system_monitor demo\n");
	printf("$    Company: FLYSLICE\n");
	printf("$    Email  : kevinhan@flyslice.com\n");
	printf("$    URL    : http://www.flyslice.com\n");
	printf("$-----------------------------------------------------$\n\n");


    // Read chip's information
	Read_Ina3221_Information();
	Read_Tmp513_Information();

    while(1){
    	// Get CORE/BOARD power

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

    	Delay(10000000);

    }

	return 0;
}
