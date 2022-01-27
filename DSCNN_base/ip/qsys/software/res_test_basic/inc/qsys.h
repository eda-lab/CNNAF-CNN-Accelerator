/*
 * =====================================================================================
 *
 *       Filename:  qsys.h
 *
 *    Description:  FA506T cpu(nios2)'s soft project
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

#ifndef QSYS_H_
#define QSYS_H_


/*-----------------------------------------------------------------------------
 *  Include
 *-----------------------------------------------------------------------------*/
#include <stdio.h>
#include "system.h"

/*-----------------------------------------------------------------------------
 *  Define
 *-----------------------------------------------------------------------------*/
#define _E2PROM
#define _POWER
#define _OTHERS

/*-----------------------------------------------------------------------------
 *  Struct
 *-----------------------------------------------------------------------------*/
typedef struct
{
	unsigned int DATA;
	unsigned int DIRECTION;
	unsigned int INTERRUPT_MASK;
	unsigned int EDGE_CAPTURE;
}PIO_STR;

/*-----------------------------------------------------------------------------
 *  Peripheral declaration
 *-----------------------------------------------------------------------------*/

#ifdef _E2PROM
#define E2PROM_SCL				((PIO_STR *)E2PROM_SCL_BASE)
#define E2PROM_SDA				((PIO_STR *)E2PROM_SDA_BASE)
#endif /* _E2PROM */

#ifdef _POWER
#define INA3221_SCL				((PIO_STR *)POWER_TEMP_SCL_BASE)
#define INA3221_SDA				((PIO_STR *)POWER_TEMP_SDA_BASE)
#define TMP513_SCL				((PIO_STR *)POWER_TEMP_SCL_BASE)
#define TMP513_SDA				((PIO_STR *)POWER_TEMP_SDA_BASE)

#endif /* _POWER */	

#ifdef _OTHERS
#define PIO_IN_REG				((PIO_STR *)PIO_IN_BASE)
#define PIO_OUT_REG				((PIO_STR *)PIO_OUT_BASE)
//#define CPU_LED					((PIO_STR *)LED_BASE)
#endif /* _OTHERS */

/*-----------------------------------------------------------------------------
 *  Define
 *-----------------------------------------------------------------------------*/
//#define CPU_LED_G_ON			((CPU_LED->DATA) = (CPU_LED->DATA) & 0x2)
//#define CPU_LED_G_OFF			((CPU_LED->DATA) = (CPU_LED->DATA) | 0x1)
//#define CPU_LED_R_ON            ((CPU_LED->DATA) = (CPU_LED->DATA) & 0x1)
//#define CPU_LED_R_OFF           ((CPU_LED->DATA) = (CPU_LED->DATA) | 0x2)

/*-----------------------------------------------------------------------------
 *  Function Declaration
 *-----------------------------------------------------------------------------*/
void Delay(unsigned int dly);

#endif /*QSYS_H_*/