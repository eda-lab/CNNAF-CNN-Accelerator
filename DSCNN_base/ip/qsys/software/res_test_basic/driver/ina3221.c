/*
 * =====================================================================================
 *
 *       Filename:  ina3221.c
 *
 *    Description:  
 *
 *        Version:  1.0.0
 *        Created:  2016.01.24
 *       Revision:  none
 *       Compiler:  NIOS II Eclipse
 *
 *         Author:  Kevin Han
 *			Email:  kevinhan@flyslice.com
 *			  URL:  http://www.flyslice.com
 *
 * =====================================================================================
 */

#include "../inc/ina3221.h"

/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  Ina3221_Reg_Write
 *  Description:  Write ina3221's register
 * =====================================================================================
 */ 
void Ina3221_Reg_Write(unsigned char regaddr, unsigned short regdata) 
{ 
	unsigned int i;
	unsigned int j;
	unsigned char opcode;
	unsigned char low_regdata;
	unsigned char high_regdata;
	
	low_regdata = regdata & 0xff;
	high_regdata = (regdata >> 8) & 0xff;

	INA3221_DATA_OUT;

	// START
	(INA3221_SDA->DATA) = 0;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 0;

	opcode = INA3221_WRITE_CODE;

	// Operation code
	for(i = 0; i < 7; i++){
		(INA3221_SDA->DATA) = opcode;
		Delay(INA3221_DELAY);
		(INA3221_SCL->DATA) = 1;
		Delay(INA3221_DELAY);
		(INA3221_SCL->DATA) = 0;
		opcode = opcode >> 1;
	}
	(INA3221_SDA->DATA) = opcode;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 1;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 0;

	// Slave ACK
	INA3221_DATA_IN;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 1;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 0;

	// Reg address
	INA3221_DATA_OUT;
	for(i = 0; i < 7; i++){
		(INA3221_SDA->DATA) = (regaddr >> (7-i));
		Delay(INA3221_DELAY);
		(INA3221_SCL->DATA) = 1;
		Delay(INA3221_DELAY);
		(INA3221_SCL->DATA) = 0;
	}
	(INA3221_SDA->DATA) = regaddr;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 1;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 0;

	// Slave ACK
	INA3221_DATA_IN;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 1;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 0;

	// Write high byte
	INA3221_DATA_OUT;
	for(j = 0; j < 7; j++){
		(INA3221_SDA->DATA) = (high_regdata >> (7 - j));
		Delay(INA3221_DELAY);
		(INA3221_SCL->DATA) = 1;
		Delay(INA3221_DELAY);
		(INA3221_SCL->DATA) = 0;
	}
	(INA3221_SDA->DATA) = high_regdata;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 1;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 0;

	// Slave ACK
	INA3221_DATA_IN;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 1;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 0;
	
	// Write low byte
	INA3221_DATA_OUT;
	for(j = 0; j < 7; j++){
		(INA3221_SDA->DATA) = (low_regdata >> (7 - j));
		Delay(INA3221_DELAY);
		(INA3221_SCL->DATA) = 1;
		Delay(INA3221_DELAY);
		(INA3221_SCL->DATA) = 0;
	}
	(INA3221_SDA->DATA) = low_regdata;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 1;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 0;

	// Slave ACK
	INA3221_DATA_IN;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 1;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 0;

	// Stop
	INA3221_DATA_OUT;
	(INA3221_SDA->DATA) = 0;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 1;
	Delay(INA3221_DELAY);
	(INA3221_SDA->DATA) = 1;

	INA3221_DATA_IN;
}

/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  Ina3221_Reg_Read
 *  Description:  read ina3221's register
 * =====================================================================================
 */ 
unsigned short Ina3221_Reg_Read(unsigned char regaddr) 
{ 
	unsigned int i;
	unsigned int j;
	unsigned char opcode;
	unsigned short readdata;

	INA3221_DATA_OUT;

	// START
	(INA3221_SDA->DATA) = 0;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 0;

	// Operation code
	opcode = INA3221_WRITE_CODE;
	for(i = 0; i < 7; i++){
		(INA3221_SDA->DATA) = opcode;
		Delay(INA3221_DELAY);
		(INA3221_SCL->DATA) = 1;
		Delay(INA3221_DELAY);
		(INA3221_SCL->DATA) = 0;
		opcode = opcode >> 1;
	}
	(INA3221_SDA->DATA) = opcode;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 1;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 0;

	// Slave ACK
	INA3221_DATA_IN;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 1;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 0;

	// Reg address
	INA3221_DATA_OUT;
	for(i = 0; i < 7; i++){
		(INA3221_SDA->DATA) = (regaddr >> (7-i));
		Delay(INA3221_DELAY);
		(INA3221_SCL->DATA) = 1;
		Delay(INA3221_DELAY);
		(INA3221_SCL->DATA) = 0;
	}
	(INA3221_SDA->DATA) = regaddr;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 1;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 0;

	// Slave ACK
	INA3221_DATA_IN;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 1;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 0;

	// Start
	INA3221_DATA_OUT;
	(INA3221_SDA->DATA) = 1;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 1;
	Delay(INA3221_DELAY);
	(INA3221_SDA->DATA) = 0;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 0;

	// Operation code
	opcode = INA3221_READ_CODE;
	for(i = 0; i < 7; i++){
		(INA3221_SDA->DATA) = opcode;
		Delay(INA3221_DELAY);
		(INA3221_SCL->DATA) = 1;
		Delay(INA3221_DELAY);
		(INA3221_SCL->DATA) = 0;
		opcode = opcode >> 1;
	}
	(INA3221_SDA->DATA) = opcode;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 1;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 0;

	// Slave ACK
	INA3221_DATA_IN;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 1;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 0;

	// Read reg's high byte
	readdata = 0;
	for(j = 0; j < 8; j++){
		Delay(INA3221_DELAY);
		readdata = 	readdata << 1;
		readdata = ((INA3221_SDA->DATA) & 0x00000001) | readdata;
		(INA3221_SCL->DATA) = 1;
		Delay(INA3221_DELAY);
		(INA3221_SCL->DATA) = 0;
	}

	// Master ACK
	Delay(INA3221_DELAY);
	INA3221_DATA_OUT;
	(INA3221_SDA->DATA) = 0;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 1;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 0;
	INA3221_DATA_IN;

	// Read reg's low byte
	for(j = 0; j < 8; j++){
		Delay(INA3221_DELAY);
		readdata = 	readdata << 1;
		readdata = ((INA3221_SDA->DATA) & 0x00000001) | readdata;
		(INA3221_SCL->DATA) = 1;
		Delay(INA3221_DELAY);
		(INA3221_SCL->DATA) = 0;
	}

	// Master NO ACK
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 1;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 0;

	// Stop
	INA3221_DATA_OUT;
	(INA3221_SDA->DATA) = 0;
	Delay(INA3221_DELAY);
	(INA3221_SCL->DATA) = 1;
	Delay(INA3221_DELAY);
	(INA3221_SDA->DATA) = 1;

	INA3221_DATA_IN;
	return readdata;
}

/*
 * ===  FUNCTION  ======================================================================
 *         Name:  Read_Ina3221_Information
 *  Description:  read ina3221's information
 * =====================================================================================
 */
void Read_Ina3221_Information(void)
{
	printf("$-----------------------------------------------------$\n");
	printf("$ INA3221's Information\n");
	printf("$-----------------------------------------------------$\n");
	printf("$ Manufacturer ID    : %x\n", Ina3221_Reg_Read(MANUFACTURER_ID_REG));
	printf("$ Die ID             : %x\n", Ina3221_Reg_Read(DIE_ID_REG));
	printf("$ Cfg Reg            : %x\n", Ina3221_Reg_Read(CONFIG_REG));
	printf("$ Ch1 Shunt Voltage  : %x\n", Ina3221_Reg_Read(CH1_SHUNT_VOLTAGE_REG));
	printf("$ Ch1 Bus Voltage    : %x\n", Ina3221_Reg_Read(CH1_SHUNT_BUS_REG));
	printf("$ Ch2 Shunt Voltage  : %x\n", Ina3221_Reg_Read(CH2_SHUNT_VOLTAGE_REG));
	printf("$ Ch2 Bus Voltage    : %x\n", Ina3221_Reg_Read(CH2_SHUNT_BUS_REG));
	printf("$ Ch3 Shunt Voltage  : %x\n", Ina3221_Reg_Read(CH3_SHUNT_VOLTAGE_REG));
	printf("$ Ch3 Bus Voltage    : %x\n", Ina3221_Reg_Read(CH3_SHUNT_BUS_REG));
	printf("$-----------------------------------------------------$\n\n");
}

/*
 * ===  FUNCTION  ======================================================================
 *         Name:  Power_Monitor
 *  Description:  moitor FA510Q's power
 * =====================================================================================
 */

void Power_Monitor(unsigned int * ch1_power,unsigned int * ch2_power, unsigned int * ch3_power)
{
	unsigned int temp;
	unsigned int current;
	unsigned int voltage;

	// Calculate ch1 power
	temp = Ina3221_Reg_Read(CH1_SHUNT_VOLTAGE_REG);
	current = (temp * 5/2);
	voltage = Ina3221_Reg_Read(CH1_SHUNT_BUS_REG);
	*ch1_power = current * voltage;

	// Calculate ch2 power
	temp = Ina3221_Reg_Read(CH2_SHUNT_VOLTAGE_REG);
	current = (temp * 5 / 2);
	voltage = Ina3221_Reg_Read(CH2_SHUNT_BUS_REG);
	*ch2_power = current * voltage;

	// Calculate ch3 power
	temp = Ina3221_Reg_Read(CH3_SHUNT_VOLTAGE_REG);
	current = (temp * 5);
	voltage = Ina3221_Reg_Read(CH3_SHUNT_BUS_REG);
	*ch3_power = current * voltage;
}
