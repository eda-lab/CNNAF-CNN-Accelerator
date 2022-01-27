/*
 * =====================================================================================
 *
 *       Filename:  tmp513.h
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

#ifndef TMP513_H_
#define TMP513_H_

/*-----------------------------------------------------------------------------
 *  Include
 *-----------------------------------------------------------------------------*/
#include "./fa506t.h"

/*-----------------------------------------------------------------------------
 *  Define
 *-----------------------------------------------------------------------------*/
#define TMP513_DELAY				625

#define TMP513_DATA_OUT			    ((TMP513_SDA->DIRECTION) = 1)
#define TMP513_DATA_IN				((TMP513_SDA->DIRECTION) = 0)

#define TMP513_WRITE_CODE			(0x1d)
#define TMP513_READ_CODE			(0x9d)

#define CONFIG1_REG					0x00
#define CONFIG2_REG       		    0x01
#define STATUS_REG			        0x02
#define ALERT_CTRL_REG    		    0x03
#define SHUNT_VOLTAGE_REG			0x04
#define BUS_VOLTAGE_REG		        0x05
#define POWER_REG     			    0x06
#define SHUNT_CURRENT_REG   		0x07
#define LOCAL_TEMP_REG      		0x08	
#define REMOTE_TEMP1_REG		    0x09
#define REMOTE_TEMP2_REG		    0x0a
#define REMOTE_TEMP3_REG		    0x0b

#define SHUNT_VOLTAGE_P_LIMIT_REG	0x0c	
#define SHUNT_VOLTAGE_N_LIMIT_REG	0x0d
#define BUS_VOLTAGE_P_LIMIT_REG	    0x0e
#define BUS_VOLTAGE_N_LIMIT_REG		0x0f
#define POWER_LIMIT_REG             0x10
#define LOCAL_TEMP_LIMIT_REG	    0x11
#define REMOTE_TEMP_LIMIT1_REG		0x12
#define REMOTE_TEMP_LIMIT2_REG		0x13
#define REMOTE_TEMP_LIMIT3_REG		0x14
#define SHUNT_CALIBRATION_REG		0x15
#define N_FACTOR1_REG		        0x16	
#define N_FACTOR2_REG		        0x17
#define N_FACTOR3_REG		        0x18	
#define MANUFACTURE_REG		        0x1e
#define DEVICE_ID_REG			    0x1f
/*-----------------------------------------------------------------------------
 *  Function Declaration
 *-----------------------------------------------------------------------------*/
void Tmp513_Reg_Write(unsigned char regaddr, unsigned short regdata);
unsigned short Tmp513_Reg_Read(unsigned char regaddr) ;
void Read_Tmp513_Information(void);

#endif /*TMP513_H_*/
