/*
 * =====================================================================================
 *
 *       Filename:  tmp513.c
 *
 *    Description:  
 *
 *        Version:  
 *        Created:  
 *       Revision:  
 *       Compiler:  
 *
 *         Author:  Kevin Han
 *			Email:  kevinhan@flyslice.com
 *			  URL:  http://www.flyslice.com
 *
 * =====================================================================================
 */

#include "../inc/tmp513.h"

/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  Tmp513_Reg_Write
 *  Description:  Write tmp513's register
 * =====================================================================================
 */ 
void Tmp513_Reg_Write(unsigned char regaddr, unsigned short regdata) 
{ 
	unsigned int i;
	unsigned int j;
	unsigned char opcode;
	unsigned char low_regdata;
	unsigned char high_regdata;
	
	low_regdata = regdata & 0xff;
	high_regdata = (regdata >> 8) & 0xff;

	TMP513_DATA_OUT;

	// START
	(TMP513_SDA->DATA) = 0;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 0;

	opcode = TMP513_WRITE_CODE;

	// Operation code
	for(i = 0; i < 7; i++){
		(TMP513_SDA->DATA) = opcode;
		Delay(TMP513_DELAY);
		(TMP513_SCL->DATA) = 1;
		Delay(TMP513_DELAY);
		(TMP513_SCL->DATA) = 0;
		opcode = opcode >> 1;
	}
	(TMP513_SDA->DATA) = opcode;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 1;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 0;

	// Slave ACK
	TMP513_DATA_IN;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 1;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 0;

	// Reg address
	TMP513_DATA_OUT;
	for(i = 0; i < 7; i++){
		(TMP513_SDA->DATA) = (regaddr >> (7-i));
		Delay(TMP513_DELAY);
		(TMP513_SCL->DATA) = 1;
		Delay(TMP513_DELAY);
		(TMP513_SCL->DATA) = 0;
	}
	(TMP513_SDA->DATA) = regaddr;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 1;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 0;

	// Slave ACK
	TMP513_DATA_IN;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 1;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 0;

	// Write high byte
	TMP513_DATA_OUT;
	for(j = 0; j < 7; j++){
		(TMP513_SDA->DATA) = (high_regdata >> (7 - j));
		Delay(TMP513_DELAY);
		(TMP513_SCL->DATA) = 1;
		Delay(TMP513_DELAY);
		(TMP513_SCL->DATA) = 0;
	}
	(TMP513_SDA->DATA) = high_regdata;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 1;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 0;

	// Slave ACK
	TMP513_DATA_IN;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 1;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 0;
	
	// Write low byte
	TMP513_DATA_OUT;
	for(j = 0; j < 7; j++){
		(TMP513_SDA->DATA) = (low_regdata >> (7 - j));
		Delay(TMP513_DELAY);
		(TMP513_SCL->DATA) = 1;
		Delay(TMP513_DELAY);
		(TMP513_SCL->DATA) = 0;
	}
	(TMP513_SDA->DATA) = low_regdata;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 1;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 0;

	// Slave ACK
	TMP513_DATA_IN;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 1;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 0;

	// Stop
	TMP513_DATA_OUT;
	(TMP513_SDA->DATA) = 0;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 1;
	Delay(TMP513_DELAY);
	(TMP513_SDA->DATA) = 1;

	TMP513_DATA_IN;
}

/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  Tmp513_Reg_Read
 *  Description:  read tmp513's register
 * =====================================================================================
 */ 
unsigned short Tmp513_Reg_Read(unsigned char regaddr) 
{ 
	unsigned int i;
	unsigned int j;
	unsigned char opcode;
	unsigned short readdata;

	// Register pointer set
	TMP513_DATA_OUT;
	
	// START
	(TMP513_SDA->DATA) = 0;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 0;

	// Operation code
	opcode = TMP513_WRITE_CODE;
	for(i = 0; i < 7; i++){
		(TMP513_SDA->DATA) = opcode;
		Delay(TMP513_DELAY);
		(TMP513_SCL->DATA) = 1;
		Delay(TMP513_DELAY);
		(TMP513_SCL->DATA) = 0;
		opcode = opcode >> 1;
	}
	(TMP513_SDA->DATA) = opcode;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 1;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 0;

	// Slave ACK
	TMP513_DATA_IN;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 1;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 0;

	// Reg address
	TMP513_DATA_OUT;
	for(i = 0; i < 7; i++){
		(TMP513_SDA->DATA) = (regaddr >> (7-i));
		Delay(TMP513_DELAY);
		(TMP513_SCL->DATA) = 1;
		Delay(TMP513_DELAY);
		(TMP513_SCL->DATA) = 0;
	}
	(TMP513_SDA->DATA) = regaddr;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 1;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 0;

	// Slave ACK
	TMP513_DATA_IN;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 1;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 0;
	
	// Stop
	Delay(TMP513_DELAY);
	TMP513_DATA_OUT;
	(TMP513_SDA->DATA) = 0;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 1;
	Delay(TMP513_DELAY);
	(TMP513_SDA->DATA) = 1;
	TMP513_DATA_IN;

	// Read register
	// Start
	TMP513_DATA_OUT;
	Delay(TMP513_DELAY);
	(TMP513_SDA->DATA) = 0;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 0;

	// Operation code
	opcode = TMP513_READ_CODE;
	for(i = 0; i < 7; i++){
		(TMP513_SDA->DATA) = opcode;
		Delay(TMP513_DELAY);
		(TMP513_SCL->DATA) = 1;
		Delay(TMP513_DELAY);
		(TMP513_SCL->DATA) = 0;
		opcode = opcode >> 1;
	}
	(TMP513_SDA->DATA) = opcode;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 1;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 0;

	// Slave ACK
	TMP513_DATA_IN;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 1;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 0;

	// Read reg's high byte
	readdata = 0;
	for(j = 0; j < 8; j++){
		Delay(TMP513_DELAY);
		readdata = 	readdata << 1;
		readdata = ((TMP513_SDA->DATA) & 0x00000001) | readdata;
		(TMP513_SCL->DATA) = 1;
		Delay(TMP513_DELAY);
		(TMP513_SCL->DATA) = 0;
	}

	// Master ACK
	Delay(TMP513_DELAY);
	TMP513_DATA_OUT;
	(TMP513_SDA->DATA) = 0;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 1;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 0;
	TMP513_DATA_IN;

	// Read reg's low byte
	for(j = 0; j < 8; j++){
		Delay(TMP513_DELAY);
		readdata = 	readdata << 1;
		readdata = ((TMP513_SDA->DATA) & 0x00000001) | readdata;
		(TMP513_SCL->DATA) = 1;
		Delay(TMP513_DELAY);
		(TMP513_SCL->DATA) = 0;
	}

	// Master NO ACK
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 1;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 0;

	// Stop
	TMP513_DATA_OUT;
	(TMP513_SDA->DATA) = 0;
	Delay(TMP513_DELAY);
	(TMP513_SCL->DATA) = 1;
	Delay(TMP513_DELAY);
	(TMP513_SDA->DATA) = 1;

	TMP513_DATA_IN;
	return readdata;
}

/*
 * ===  FUNCTION  ======================================================================
 *         Name:  Read_Tmp513_Information
 *  Description:  read tmp513's information
 * =====================================================================================
 */
void Read_Tmp513_Information(void)
{
	printf("$-----------------------------------------------------$\n");
	printf("$ TMP513's Information\n\r");
	printf("$-----------------------------------------------------$\n");
	printf("$ manufacturer ID    : %x\n\r", Tmp513_Reg_Read(MANUFACTURE_REG));
	printf("$ Die ID             : %x\n\r", Tmp513_Reg_Read(DEVICE_ID_REG));
	printf("$ Cfg1 Reg           : %x\n\r", Tmp513_Reg_Read(CONFIG1_REG));
	printf("$ Cfg2 Reg           : %x\n\r", Tmp513_Reg_Read(CONFIG2_REG));
	printf("$ Status Reg         : %x\n\r", Tmp513_Reg_Read(STATUS_REG));
	printf("$ Remote1 temp Reg   : %x\n\r", Tmp513_Reg_Read(REMOTE_TEMP1_REG));
	printf("$ Remote2 temp Reg   : %x\n\r", Tmp513_Reg_Read(REMOTE_TEMP2_REG));
	printf("$ Remote3 temp Reg   : %x\n\r", Tmp513_Reg_Read(REMOTE_TEMP3_REG));
	printf("$ Local temp Reg     : %x\n\r", Tmp513_Reg_Read(LOCAL_TEMP_REG));
	printf("$-----------------------------------------------------$\n\n");
}
