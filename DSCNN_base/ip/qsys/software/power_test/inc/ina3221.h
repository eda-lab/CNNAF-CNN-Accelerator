/*
 * =====================================================================================
 *
 *       Filename:  ina3221.h
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

#ifndef INA3221_H_
#define INA3221_H_

/*-----------------------------------------------------------------------------
 * INA3221:Triple-Channel, High-Side Measurement, Shunt and Bus Voltage Monitor
 * with I2C interface.
 *-----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
 *  Include
 *-----------------------------------------------------------------------------*/
#include "qsys.h"

/*-----------------------------------------------------------------------------
 *  Define
 *-----------------------------------------------------------------------------*/
#define INA3221_DELAY				625

#define INA3221_DATA_OUT			((INA3221_SDA->DIRECTION) = 1)
#define INA3221_DATA_IN				((INA3221_SDA->DIRECTION) = 0)

#define INA3221_WRITE_CODE			(0x01)
#define INA3221_READ_CODE			(0x81)

#define CONFIG_REG					0x00
#define CH1_SHUNT_VOLTAGE_REG		0x01
#define CH1_SHUNT_BUS_REG			0x02
#define CH2_SHUNT_VOLTAGE_REG		0x03
#define CH2_SHUNT_BUS_REG			0x04
#define CH3_SHUNT_VOLTAGE_REG		0x05
#define CH3_SHUNT_BUS_REG			0x06
#define CH1_CRITICAL_LIMIT_REG		0x07
#define CH1_WARNING_LIMIT_REG		0x08	
#define CH2_CRITICAL_LIMIT_REG		0x09
#define CH2_WARNING_LIMIT_REG		0x0a	
#define CH3_CRITICAL_LIMIT_REG		0x0b
#define CH3_WARNING_LIMIT_REG		0x0c	
#define SHUNT_VOLTAGE_SUM_REG		0x0d
#define SHUNT_VOLTAGE_SUM_LIMIT_REG	0x0e
#define MASK_ENABLE_REG				0x0f
#define POWER_VALID_UPPER_LIMIT_REG 0x10
#define POWER_VALID_LOWER_LIMIT_REG	0x11
#define MANUFACTURER_ID_REG			0xfe
#define DIE_ID_REG					0xff	
		
/*-----------------------------------------------------------------------------
 *  Function Declaration
 *-----------------------------------------------------------------------------*/
void Ina3221_Reg_Write(unsigned char regaddr, unsigned short regdata);
unsigned short Ina3221_Reg_Read(unsigned char regaddr) ;
void Read_Ina3221_Information(void);
void Power_Monitor(unsigned int * ch1_power,unsigned int * ch2_power, unsigned int * ch3_power);

#endif /*INA3221_H_*/
