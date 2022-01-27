/*
 * =====================================================================================
 *
 *       Filename:  qsys.c
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
#include "../inc/qsys.h"

/*
 * ===  FUNCTION  ======================================================================
 *         Name:  Delay
 *  Description:
 * =====================================================================================
 */
void Delay(unsigned int dly)
{
	for(; dly>0; dly--);
}
