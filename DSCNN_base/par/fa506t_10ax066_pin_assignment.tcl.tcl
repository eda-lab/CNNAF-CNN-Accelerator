#=======================================================
# FLYSLICE PCIE board FA506T pin assignment  
# Updated by Kevin Han 2017-04-23   
# Email: kevinhan@flyslice.com
# URL: http://www.flyslice.com	          
#=======================================================
#=======================================================
# BANK I/O voltage
#=======================================================
# BANK2A 1.8V
# BANK2G 1.8V
# BANK2H 1.8V

# BANK2I 1.2V
# BANK2J 1.2V
# BANK2K 1.2V

# BANK2L 1.2V

# BANK3A 1.2V
# BANK3B 1.2V
# BANK3C 1.2V

# BANK3D 1.8V
# BANK3E 1.8V

# BANK3F 1.2V
# BANK3G 1.2V
# BANK3H 1.2V

#=======================================================
# BANK2G/H
#=======================================================
#=======================================================
# Flash interface
#=======================================================
set_location_assignment  PIN_AN21  -to FLASH_D[0] 
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_D[0]       
set_location_assignment  PIN_AM20  -to FLASH_D[1]  
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_D[1]     
set_location_assignment  PIN_AP20  -to FLASH_D[2]       
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_D[2]
set_location_assignment  PIN_AW24  -to FLASH_D[3]       
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_D[3]
set_location_assignment  PIN_AL22  -to FLASH_D[4]       
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_D[4]
set_location_assignment  PIN_AH23  -to FLASH_D[5]       
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_D[5]
set_location_assignment  PIN_AW21  -to FLASH_D[6]  
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_D[6]     
set_location_assignment  PIN_AU20  -to FLASH_D[7]       
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_D[7]
set_location_assignment  PIN_AR21  -to FLASH_D[8]       
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_D[8]
set_location_assignment  PIN_AL20  -to FLASH_D[9]       
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_D[9]
set_location_assignment  PIN_AR22  -to FLASH_D[10] 
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_D[10]     
set_location_assignment  PIN_AV23  -to FLASH_D[11]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_D[11]
set_location_assignment  PIN_AM22  -to FLASH_D[12]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_D[12]
set_location_assignment  PIN_AK22  -to FLASH_D[13]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_D[13]
set_location_assignment  PIN_AN24  -to FLASH_D[14]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_D[14]
set_location_assignment  PIN_AU21  -to FLASH_D[15]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_D[15]
     
set_location_assignment  PIN_AR26  -to FLASH_A[1] 
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[1]       
set_location_assignment  PIN_AP26  -to FLASH_A[2]       
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[2] 
set_location_assignment  PIN_AT27  -to FLASH_A[3]       
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[3] 
set_location_assignment  PIN_AV26  -to FLASH_A[4]       
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[4] 
set_location_assignment  PIN_AM24  -to FLASH_A[5]       
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[5] 
set_location_assignment  PIN_AV27  -to FLASH_A[6]       
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[6] 
set_location_assignment  PIN_AU24  -to FLASH_A[7]       
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[7] 
set_location_assignment  PIN_AV28  -to FLASH_A[8]       
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[8] 
set_location_assignment  PIN_AU27  -to FLASH_A[9]       
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[9] 
set_location_assignment  PIN_AP23  -to FLASH_A[10]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[10] 
set_location_assignment  PIN_AK21  -to FLASH_A[11]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[11] 
set_location_assignment  PIN_AR27  -to FLASH_A[12]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[12] 
set_location_assignment  PIN_AW25  -to FLASH_A[13]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[13] 
set_location_assignment  PIN_AJ24  -to FLASH_A[14]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[14] 
set_location_assignment  PIN_AJ20  -to FLASH_A[15]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[15] 
set_location_assignment  PIN_AJ23  -to FLASH_A[16]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[16] 
set_location_assignment  PIN_AT19  -to FLASH_A[17]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[17] 
set_location_assignment  PIN_AJ25  -to FLASH_A[18]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[18] 
set_location_assignment  PIN_AK23  -to FLASH_A[19]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[19] 
set_location_assignment  PIN_AN26  -to FLASH_A[20]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[20] 
set_location_assignment  PIN_AP19  -to FLASH_A[21]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[21] 
set_location_assignment  PIN_AM25  -to FLASH_A[22]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[22] 
set_location_assignment  PIN_AR23  -to FLASH_A[23]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[23] 
set_location_assignment  PIN_AP21  -to FLASH_A[24]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[24] 
set_location_assignment  PIN_AV24  -to FLASH_A[25]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[25] 
set_location_assignment  PIN_AL25  -to FLASH_A[26]      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[26] 
set_location_assignment  PIN_AR20  -to FLASH_A[27]  
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_A[27] 
    
set_location_assignment  PIN_AK20  -to FLASH_CLK  
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_CLK         
set_location_assignment  PIN_AH21  -to FLASH_CE_N0      
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_CE_N0     
set_location_assignment  PIN_AK25  -to FLASH_ADV_N   
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_ADV_N     
set_location_assignment  PIN_AT24  -to FLASH_RDY_BSY_N0 
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_RDY_BSY_N0
set_location_assignment  PIN_AW28  -to FLASH_WE_N   
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_WE_N      
set_location_assignment  PIN_AW23  -to FLASH_OE_N   
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_OE_N       
set_location_assignment  PIN_AT22  -to FLASH_WP_N     
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_WP_N    
set_location_assignment  PIN_AL24  -to FLASH_RESET_N 
set_instance_assignment -name IO_STANDARD "1.8 V" -to FLASH_RESET_N  

#=======================================================
# BANK 2L
#=======================================================
set_location_assignment  PIN_C27   -to POWER_MON_CRITICAL
set_instance_assignment -name IO_STANDARD "1.2 V" -to POWER_MON_CRITICAL      
set_location_assignment  PIN_D24   -to POWER_MON_PV           
set_instance_assignment -name IO_STANDARD "1.2 V" -to POWER_MON_PV  
set_location_assignment  PIN_C24   -to POWER_MON_TC    
set_instance_assignment -name IO_STANDARD "1.2 V" -to POWER_MON_TC          
set_location_assignment  PIN_A27   -to POWER_MON_WARNING  
set_instance_assignment -name IO_STANDARD "1.2 V" -to POWER_MON_WARNING     
                            
set_location_assignment  PIN_D29   -to TEMP_ALERTN       
set_instance_assignment -name IO_STANDARD "1.2 V" -to TEMP_ALERTN     
set_location_assignment  PIN_B30   -to TEMPL_POWER_SMB_DATA           
set_instance_assignment -name IO_STANDARD "1.2 V" -to TEMPL_POWER_SMB_DATA      
set_location_assignment  PIN_C29   -to TEMPL_POWER_SMB_CLK        
set_instance_assignment -name IO_STANDARD "1.2 V" -to TEMPL_POWER_SMB_CLK 

set_location_assignment  PIN_A28   -to PANEL_RED_LED   
set_instance_assignment -name IO_STANDARD "1.2 V" -to PANEL_RED_LED   
set_location_assignment  PIN_C28   -to PANEL_GREEN_LED     
set_instance_assignment -name IO_STANDARD "1.2 V" -to PANEL_GREEN_LED

#=======================================================
# BANK 2H
#=======================================================

#=======================================================
# BANK 3D
#=======================================================

set_location_assignment PIN_AB12   -to A10_SYSCLK_125MHZ
set_instance_assignment -name IO_STANDARD "1.8 V" -to A10_SYSCLK_125MHZ

set_location_assignment PIN_U1     -to SWITCH3
set_instance_assignment -name IO_STANDARD "1.8 V" -to SWITCH3
set_location_assignment PIN_Y3     -to SWITCH4
set_instance_assignment -name IO_STANDARD "1.8 V" -to SWITCH4

set_location_assignment PIN_AD3    -to A10_LED_TEST4	
set_instance_assignment -name IO_STANDARD "1.8 V" -to A10_LED_TEST4
set_location_assignment PIN_AD4    -to A10_LED_TEST3
set_instance_assignment -name IO_STANDARD "1.8 V" -to A10_LED_TEST3
set_location_assignment PIN_AD5    -to A10_LED_TEST2	
set_instance_assignment -name IO_STANDARD "1.8 V" -to A10_LED_TEST2	
set_location_assignment PIN_AC6    -to A10_LED_TEST1
set_instance_assignment -name IO_STANDARD "1.8 V" -to A10_LED_TEST1

#=======================================================
# BANK 3E
#=======================================================
set_location_assignment PIN_V6     -to A10_SYSCLK_REFCLK
set_location_assignment PIN_W6     -to "A10_SYSCLK_REFCLK(n)"
set_instance_assignment -name IO_STANDARD LVDS    -to A10_SYSCLK_REFCLK

#=======================================================
# DDR4 0                                         
# BANK 2I/J/K                                        
#=======================================================
set_location_assignment PIN_A23   -to pll0_ref_clk
set_location_assignment PIN_A22   -to "pll0_ref_clk(n)"
set_instance_assignment -name IO_STANDARD LVDS    -to pll0_ref_clk

set_location_assignment PIN_A19   -to oct0_rzqin
# group0
set_location_assignment PIN_AD26  -to mem0_dq[0]		
set_location_assignment PIN_AD25  -to mem0_dq[1]           
set_location_assignment PIN_AB25  -to mem0_dq[2]           
set_location_assignment PIN_AB26  -to mem0_dq[3]           
set_location_assignment PIN_AB27  -to mem0_dq[4]           
set_location_assignment PIN_AA27  -to mem0_dq[5]           
set_location_assignment PIN_AE26  -to mem0_dq[6]           
set_location_assignment PIN_AC28  -to mem0_dq[7]           
set_location_assignment PIN_AE25  -to mem0_dbi_n[0]        
set_location_assignment PIN_AH26  -to mem0_dqs[0]          
set_location_assignment PIN_AG26  -to mem0_dqs_n[0]        
# group1
set_location_assignment PIN_AL28  -to mem0_dq[8]		
set_location_assignment PIN_AT30  -to mem0_dq[9]           
set_location_assignment PIN_AK27  -to mem0_dq[10]          
set_location_assignment PIN_AN27  -to mem0_dq[11]          
set_location_assignment PIN_AK28  -to mem0_dq[12]          
set_location_assignment PIN_AU30  -to mem0_dq[13]          
set_location_assignment PIN_AL27  -to mem0_dq[14]          
set_location_assignment PIN_AN28  -to mem0_dq[15]          
set_location_assignment PIN_AP29  -to mem0_dbi_n[1]        
set_location_assignment PIN_AR28  -to mem0_dqs[1]          
set_location_assignment PIN_AP28  -to mem0_dqs_n[1]        
# group2
set_location_assignment PIN_AE27  -to mem0_dq[16]
set_location_assignment PIN_AH28  -to mem0_dq[17]
set_location_assignment PIN_AF25  -to mem0_dq[18]
set_location_assignment PIN_AJ26  -to mem0_dq[19]
set_location_assignment PIN_AC26  -to mem0_dq[20]
set_location_assignment PIN_AK26  -to mem0_dq[21]
set_location_assignment PIN_AF27  -to mem0_dq[22]
set_location_assignment PIN_AC27  -to mem0_dq[23]
set_location_assignment PIN_AH27  -to mem0_dbi_n[2]
set_location_assignment PIN_AG27  -to mem0_dqs[2]
set_location_assignment PIN_AF28  -to mem0_dqs_n[2]
# group3
set_location_assignment PIN_AM26  -to mem0_dq[24]
set_location_assignment PIN_AT29  -to mem0_dq[25]
set_location_assignment PIN_AM27  -to mem0_dq[26]
set_location_assignment PIN_AT28  -to mem0_dq[27]
set_location_assignment PIN_AR32  -to mem0_dq[28]
set_location_assignment PIN_AU31  -to mem0_dq[29]
set_location_assignment PIN_AR31  -to mem0_dq[30]
set_location_assignment PIN_AR30  -to mem0_dq[31]
set_location_assignment PIN_AT32  -to mem0_dbi_n[3]
set_location_assignment PIN_AV29  -to mem0_dqs[3]
set_location_assignment PIN_AU29  -to mem0_dqs_n[3]
# group4
set_location_assignment PIN_K27   -to mem0_dq[32]
set_location_assignment PIN_C31   -to mem0_dq[33]
set_location_assignment PIN_F30   -to mem0_dq[34]
set_location_assignment PIN_D30   -to mem0_dq[35]
set_location_assignment PIN_L27   -to mem0_dq[36]
set_location_assignment PIN_E28   -to mem0_dq[37]
set_location_assignment PIN_G30   -to mem0_dq[38]
set_location_assignment PIN_F28   -to mem0_dq[39]
set_location_assignment PIN_C32   -to mem0_dbi_n[4]
set_location_assignment PIN_E30   -to mem0_dqs[4]
set_location_assignment PIN_F29   -to mem0_dqs_n[4]
# group5
set_location_assignment PIN_L28   -to mem0_dq[40]
set_location_assignment PIN_J26   -to mem0_dq[41]
set_location_assignment PIN_H27   -to mem0_dq[42]
set_location_assignment PIN_G27   -to mem0_dq[43]
set_location_assignment PIN_M27   -to mem0_dq[44]
set_location_assignment PIN_M26   -to mem0_dq[45]
set_location_assignment PIN_E32   -to mem0_dq[46]
set_location_assignment PIN_K26   -to mem0_dq[47]
set_location_assignment PIN_E31   -to mem0_dbi_n[5]
set_location_assignment PIN_G29   -to mem0_dqs[5]
set_location_assignment PIN_H28   -to mem0_dqs_n[5]
# group6
set_location_assignment PIN_P28   -to mem0_dq[48]
set_location_assignment PIN_R25   -to mem0_dq[49]
set_location_assignment PIN_T25   -to mem0_dq[50]
set_location_assignment PIN_U25   -to mem0_dq[51]
set_location_assignment PIN_N27   -to mem0_dq[52]
set_location_assignment PIN_U27   -to mem0_dq[53]
set_location_assignment PIN_R27   -to mem0_dq[54]
set_location_assignment PIN_V27   -to mem0_dq[55]
set_location_assignment PIN_R28   -to mem0_dbi_n[6]
set_location_assignment PIN_N26   -to mem0_dqs[6]
set_location_assignment PIN_P26   -to mem0_dqs_n[6]
# group7
set_location_assignment PIN_T27   -to mem0_dq[56]
set_location_assignment PIN_Y25   -to mem0_dq[57]
set_location_assignment PIN_U26   -to mem0_dq[58]
set_location_assignment PIN_W25   -to mem0_dq[59]
set_location_assignment PIN_V26   -to mem0_dq[60]
set_location_assignment PIN_Y26   -to mem0_dq[61]
set_location_assignment PIN_T28   -to mem0_dq[62]
set_location_assignment PIN_W26   -to mem0_dq[63]
set_location_assignment PIN_W28   -to mem0_dbi_n[7]
set_location_assignment PIN_Y28   -to mem0_dqs[7]
set_location_assignment PIN_Y27   -to mem0_dqs_n[7]

# AC
set_location_assignment PIN_K16   -to mem0_a[0]
set_location_assignment PIN_K17   -to mem0_a[1]
set_location_assignment PIN_A15   -to mem0_a[2]
set_location_assignment PIN_B16   -to mem0_a[3]
set_location_assignment PIN_B17   -to mem0_a[4]
set_location_assignment PIN_C17   -to mem0_a[5]
set_location_assignment PIN_C18   -to mem0_a[6]
set_location_assignment PIN_D18   -to mem0_a[7]
set_location_assignment PIN_A17   -to mem0_a[8]
set_location_assignment PIN_A18   -to mem0_a[9]
set_location_assignment PIN_E17   -to mem0_a[10]
set_location_assignment PIN_E18   -to mem0_a[11]
set_location_assignment PIN_B19   -to mem0_a[12]
set_location_assignment PIN_A20   -to mem0_a[13]
set_location_assignment PIN_B20   -to mem0_a[14]
set_location_assignment PIN_B21   -to mem0_a[15]
set_location_assignment PIN_C21   -to mem0_a[16]                                  
set_location_assignment PIN_H17   -to mem0_ck[0]
set_location_assignment PIN_J16   -to mem0_ck_n[0]
set_location_assignment PIN_G16   -to mem0_cs_n[0]
set_location_assignment PIN_L15   -to mem0_odt[0]
set_location_assignment PIN_J15   -to mem0_cke[0]
set_location_assignment PIN_D19   -to mem0_ba[0]
set_location_assignment PIN_G19   -to mem0_ba[1]
set_location_assignment PIN_H18   -to mem0_bg[0]
set_location_assignment PIN_H16   -to mem0_act_n[0]
set_location_assignment PIN_AD28  -to mem0_alert_n[0]
set_location_assignment PIN_D16   -to mem0_par[0]
set_location_assignment PIN_G15   -to mem0_reset_n[0]

#=======================================================
# DDR4 1
# BANK 3A/B/C
#=======================================================
set_location_assignment PIN_AP5   -to pll1_ref_clk
set_location_assignment PIN_AN6   -to "pll1_ref_clk(n)"
set_instance_assignment -name IO_STANDARD LVDS    -to pll1_ref_clk

set_location_assignment PIN_AN7   -to oct1_rzqin
# group0
set_location_assignment PIN_AV2   -to mem1_dq[0]
set_location_assignment PIN_AU5   -to mem1_dq[1]
set_location_assignment PIN_AW3   -to mem1_dq[2]
set_location_assignment PIN_AW6   -to mem1_dq[3]
set_location_assignment PIN_AV4   -to mem1_dq[4]
set_location_assignment PIN_AT5   -to mem1_dq[5]
set_location_assignment PIN_AV3   -to mem1_dq[6]
set_location_assignment PIN_AV6   -to mem1_dq[7]
set_location_assignment PIN_AU4   -to mem1_dbi_n[0]
set_location_assignment PIN_AW4   -to mem1_dqs[0]
set_location_assignment PIN_AW5   -to mem1_dqs_n[0]
# group1                         
set_location_assignment PIN_AU7   -to mem1_dq[8]
set_location_assignment PIN_AN8   -to mem1_dq[9]
set_location_assignment PIN_AV7   -to mem1_dq[10]
set_location_assignment PIN_AR8   -to mem1_dq[11]
set_location_assignment PIN_AT7   -to mem1_dq[12]
set_location_assignment PIN_AP8   -to mem1_dq[13]
set_location_assignment PIN_AV8   -to mem1_dq[14]
set_location_assignment PIN_AW8   -to mem1_dq[15]
set_location_assignment PIN_AU6   -to mem1_dbi_n[1]
set_location_assignment PIN_AT8   -to mem1_dqs[1]
set_location_assignment PIN_AT9   -to mem1_dqs_n[1]
# group2
set_location_assignment PIN_AP10  -to mem1_dq[16]
set_location_assignment PIN_AM9   -to mem1_dq[17]
set_location_assignment PIN_AN11  -to mem1_dq[18]
set_location_assignment PIN_AL10  -to mem1_dq[19]
set_location_assignment PIN_AR10  -to mem1_dq[20]
set_location_assignment PIN_AH12  -to mem1_dq[21]
set_location_assignment PIN_AP11  -to mem1_dq[22]
set_location_assignment PIN_AN9   -to mem1_dq[23]
set_location_assignment PIN_AJ11  -to mem1_dbi_n[2]
set_location_assignment PIN_AM10  -to mem1_dqs[2]
set_location_assignment PIN_AM11  -to mem1_dqs_n[2]
# group3
set_location_assignment PIN_AM12  -to mem1_dq[24]
set_location_assignment PIN_AH14  -to mem1_dq[25]
set_location_assignment PIN_AL13  -to mem1_dq[26]
set_location_assignment PIN_AK13  -to mem1_dq[27]
set_location_assignment PIN_AJ13  -to mem1_dq[28]
set_location_assignment PIN_AH13  -to mem1_dq[29]
set_location_assignment PIN_AN12  -to mem1_dq[30]
set_location_assignment PIN_AJ14  -to mem1_dq[31]
set_location_assignment PIN_AK11  -to mem1_dbi_n[3]
set_location_assignment PIN_AL12  -to mem1_dqs[3]
set_location_assignment PIN_AK12  -to mem1_dqs_n[3]
# group4
set_location_assignment PIN_AK2   -to mem1_dq[32]
set_location_assignment PIN_AL2   -to mem1_dq[33]
set_location_assignment PIN_AM1   -to mem1_dq[34]
set_location_assignment PIN_AM2   -to mem1_dq[35]
set_location_assignment PIN_AJ3   -to mem1_dq[36]
set_location_assignment PIN_AJ4   -to mem1_dq[37]
set_location_assignment PIN_AK3   -to mem1_dq[38]
set_location_assignment PIN_AL4   -to mem1_dq[39]
set_location_assignment PIN_AL3   -to mem1_dbi_n[4]
set_location_assignment PIN_AN1   -to mem1_dqs[4]
set_location_assignment PIN_AN2   -to mem1_dqs_n[4]
# group5
set_location_assignment PIN_AF4   -to mem1_dq[40]
set_location_assignment PIN_AJ1   -to mem1_dq[41]
set_location_assignment PIN_AF2   -to mem1_dq[42]
set_location_assignment PIN_AH1   -to mem1_dq[43]
set_location_assignment PIN_AE5   -to mem1_dq[44]
set_location_assignment PIN_AH4   -to mem1_dq[45]
set_location_assignment PIN_AG2   -to mem1_dq[46]
set_location_assignment PIN_AG4   -to mem1_dq[47]
set_location_assignment PIN_AF3   -to mem1_dbi_n[5]
set_location_assignment PIN_AH2   -to mem1_dqs[5]
set_location_assignment PIN_AH3   -to mem1_dqs_n[5]
# group6
set_location_assignment PIN_AJ6   -to mem1_dq[48]
set_location_assignment PIN_AC7   -to mem1_dq[49]
set_location_assignment PIN_AH6   -to mem1_dq[50]
set_location_assignment PIN_AE6   -to mem1_dq[51]
set_location_assignment PIN_AJ5   -to mem1_dq[52]
set_location_assignment PIN_AF5   -to mem1_dq[53]
set_location_assignment PIN_AK5   -to mem1_dq[54]
set_location_assignment PIN_AG6   -to mem1_dq[55]
set_location_assignment PIN_AD6   -to mem1_dbi_n[6]
set_location_assignment PIN_AF7   -to mem1_dqs[6]
set_location_assignment PIN_AE7   -to mem1_dqs_n[6]
# group7                               
set_location_assignment PIN_AC9   -to mem1_dq[56]
set_location_assignment PIN_AD13  -to mem1_dq[57]
set_location_assignment PIN_AD10  -to mem1_dq[58]
set_location_assignment PIN_AG7   -to mem1_dq[59]
set_location_assignment PIN_AC11  -to mem1_dq[60]
set_location_assignment PIN_AF8   -to mem1_dq[61]
set_location_assignment PIN_AD11  -to mem1_dq[62]
set_location_assignment PIN_AD9   -to mem1_dq[63]
set_location_assignment PIN_AC12  -to mem1_dbi_n[7]
set_location_assignment PIN_AE8   -to mem1_dqs[7]
set_location_assignment PIN_AD8   -to mem1_dqs_n[7]
# AC
set_location_assignment PIN_AE10  -to mem1_a[0]
set_location_assignment PIN_AE11  -to mem1_a[1]
set_location_assignment PIN_AL8   -to mem1_a[2]
set_location_assignment PIN_AL9   -to mem1_a[3]
set_location_assignment PIN_AL7   -to mem1_a[4]
set_location_assignment PIN_AK8   -to mem1_a[5]
set_location_assignment PIN_AK6   -to mem1_a[6]
set_location_assignment PIN_AK7   -to mem1_a[7]
set_location_assignment PIN_AJ8   -to mem1_a[8]
set_location_assignment PIN_AH9   -to mem1_a[9]
set_location_assignment PIN_AH7   -to mem1_a[10]
set_location_assignment PIN_AH8   -to mem1_a[11]
set_location_assignment PIN_AM7   -to mem1_a[12]
set_location_assignment PIN_AR6   -to mem1_a[13]
set_location_assignment PIN_AP6   -to mem1_a[14]
set_location_assignment PIN_AM5   -to mem1_a[15]
set_location_assignment PIN_AM6   -to mem1_a[16]
set_location_assignment PIN_AG9   -to mem1_ck[0]
set_location_assignment PIN_AG10  -to mem1_ck_n[0]
set_location_assignment PIN_AG11  -to mem1_cs_n[0]
set_location_assignment PIN_AE12  -to mem1_odt[0]
set_location_assignment PIN_AF9   -to mem1_cke[0]
set_location_assignment PIN_AR5   -to mem1_ba[0]
set_location_assignment PIN_AM4   -to mem1_ba[1]
set_location_assignment PIN_AL5   -to mem1_bg[0]
set_location_assignment PIN_AF12  -to mem1_act_n[0]
set_location_assignment PIN_AV1   -to mem1_alert_n[0]
set_location_assignment PIN_AJ10  -to mem1_par[0]
set_location_assignment PIN_AG12  -to mem1_reset_n[0]

#=======================================================
# DDR4 2
# BANK 3F/G/H
#=======================================================
set_location_assignment PIN_K8    -to pll2_ref_clk
set_location_assignment PIN_L8    -to "pll2_ref_clk(n)"
set_instance_assignment -name IO_STANDARD LVDS    -to pll2_ref_clk

set_location_assignment PIN_H9    -to oct2_rzqin
# group0                                
set_location_assignment PIN_V12   -to mem2_dq[0]
set_location_assignment PIN_P9    -to mem2_dq[1]
set_location_assignment PIN_U10   -to mem2_dq[2]
set_location_assignment PIN_T8    -to mem2_dq[3]
set_location_assignment PIN_U11   -to mem2_dq[4]
set_location_assignment PIN_R7    -to mem2_dq[5]
set_location_assignment PIN_V11   -to mem2_dq[6]
set_location_assignment PIN_U12   -to mem2_dq[7]
set_location_assignment PIN_R8    -to mem2_dbi_n[0]
set_location_assignment PIN_T9    -to mem2_dqs[0]
set_location_assignment PIN_T10   -to mem2_dqs_n[0]
# group1                                
set_location_assignment PIN_N6    -to mem2_dq[8]
set_location_assignment PIN_K7    -to mem2_dq[9]
set_location_assignment PIN_K6    -to mem2_dq[10]
set_location_assignment PIN_M7    -to mem2_dq[11]
set_location_assignment PIN_L5    -to mem2_dq[12]
set_location_assignment PIN_J6    -to mem2_dq[13]
set_location_assignment PIN_N7    -to mem2_dq[14]
set_location_assignment PIN_L7    -to mem2_dq[15]
set_location_assignment PIN_K5    -to mem2_dbi_n[1]
set_location_assignment PIN_N8    -to mem2_dqs[1]
set_location_assignment PIN_P8    -to mem2_dqs_n[1]
# group2                               
set_location_assignment PIN_B2    -to mem2_dq[16]
set_location_assignment PIN_G5    -to mem2_dq[17]
set_location_assignment PIN_F3    -to mem2_dq[18]
set_location_assignment PIN_H4    -to mem2_dq[19]
set_location_assignment PIN_A2    -to mem2_dq[20]
set_location_assignment PIN_H6    -to mem2_dq[21]
set_location_assignment PIN_E3    -to mem2_dq[22]
set_location_assignment PIN_F4    -to mem2_dq[23]
set_location_assignment PIN_G4    -to mem2_dbi_n[2]
set_location_assignment PIN_H2    -to mem2_dqs[2]
set_location_assignment PIN_H3    -to mem2_dqs_n[2]
# group3                               
set_location_assignment PIN_C2    -to mem2_dq[24]
set_location_assignment PIN_G2    -to mem2_dq[25]
set_location_assignment PIN_E2    -to mem2_dq[26]
set_location_assignment PIN_F2    -to mem2_dq[27]
set_location_assignment PIN_J4    -to mem2_dq[28]
set_location_assignment PIN_G1    -to mem2_dq[29]
set_location_assignment PIN_E1    -to mem2_dq[30]
set_location_assignment PIN_H1    -to mem2_dq[31]
set_location_assignment PIN_J5    -to mem2_dbi_n[3]
set_location_assignment PIN_C1    -to mem2_dqs[3]
set_location_assignment PIN_D1    -to mem2_dqs_n[3]
# group4                               
set_location_assignment PIN_A10   -to mem2_dq[32]
set_location_assignment PIN_F10   -to mem2_dq[33]
set_location_assignment PIN_A9    -to mem2_dq[34]
set_location_assignment PIN_D9    -to mem2_dq[35]
set_location_assignment PIN_B10   -to mem2_dq[36]
set_location_assignment PIN_G10   -to mem2_dq[37]
set_location_assignment PIN_B9    -to mem2_dq[38]
set_location_assignment PIN_A8    -to mem2_dq[39]
set_location_assignment PIN_A7    -to mem2_dbi_n[4]
set_location_assignment PIN_C8    -to mem2_dqs[4]
set_location_assignment PIN_D8    -to mem2_dqs_n[4]
# group5                               
set_location_assignment PIN_G11   -to mem2_dq[40]
set_location_assignment PIN_M12   -to mem2_dq[41]
set_location_assignment PIN_G12   -to mem2_dq[42]
set_location_assignment PIN_H12   -to mem2_dq[43]
set_location_assignment PIN_E10   -to mem2_dq[44]
set_location_assignment PIN_N12   -to mem2_dq[45]
set_location_assignment PIN_H11   -to mem2_dq[46]
set_location_assignment PIN_L12   -to mem2_dq[47]
set_location_assignment PIN_D10   -to mem2_dbi_n[5]
set_location_assignment PIN_J11   -to mem2_dqs[5]
set_location_assignment PIN_K11   -to mem2_dqs_n[5]
# group6                               
set_location_assignment PIN_E12   -to mem2_dq[48]
set_location_assignment PIN_C11   -to mem2_dq[49]
set_location_assignment PIN_D13   -to mem2_dq[50]
set_location_assignment PIN_B12   -to mem2_dq[51]
set_location_assignment PIN_E13   -to mem2_dq[52]
set_location_assignment PIN_E11   -to mem2_dq[53]
set_location_assignment PIN_F12   -to mem2_dq[54]
set_location_assignment PIN_A12   -to mem2_dq[55]
set_location_assignment PIN_D11   -to mem2_dbi_n[6]
set_location_assignment PIN_C12   -to mem2_dqs[6]
set_location_assignment PIN_C13   -to mem2_dqs_n[6]
# group7                               
set_location_assignment PIN_H14   -to mem2_dq[56]
set_location_assignment PIN_N13   -to mem2_dq[57]
set_location_assignment PIN_K13   -to mem2_dq[58]
set_location_assignment PIN_F13   -to mem2_dq[59]
set_location_assignment PIN_L13   -to mem2_dq[60]
set_location_assignment PIN_P13   -to mem2_dq[61]
set_location_assignment PIN_G14   -to mem2_dq[62]
set_location_assignment PIN_F14   -to mem2_dq[63]
set_location_assignment PIN_L14   -to mem2_dbi_n[7]
set_location_assignment PIN_H13   -to mem2_dqs[7]
set_location_assignment PIN_J13   -to mem2_dqs_n[7]
# AC                               
set_location_assignment PIN_E6    -to mem2_a[0]
set_location_assignment PIN_E7    -to mem2_a[1]
set_location_assignment PIN_B6    -to mem2_a[2]
set_location_assignment PIN_C6    -to mem2_a[3]
set_location_assignment PIN_C4    -to mem2_a[4]
set_location_assignment PIN_D4    -to mem2_a[5]
set_location_assignment PIN_B4    -to mem2_a[6]
set_location_assignment PIN_C3    -to mem2_a[7]
set_location_assignment PIN_B7    -to mem2_a[8]
set_location_assignment PIN_C7    -to mem2_a[9]
set_location_assignment PIN_A3    -to mem2_a[10]
set_location_assignment PIN_A4    -to mem2_a[11]
set_location_assignment PIN_J9    -to mem2_a[12]
set_location_assignment PIN_F9    -to mem2_a[13]
set_location_assignment PIN_G9    -to mem2_a[14]
set_location_assignment PIN_H8    -to mem2_a[15]
set_location_assignment PIN_J8    -to mem2_a[16]
set_location_assignment PIN_E8    -to mem2_ck[0]
set_location_assignment PIN_F8    -to mem2_ck_n[0]
set_location_assignment PIN_B5    -to mem2_par[0]
set_location_assignment PIN_H7    -to mem2_reset_n[0]								  
set_location_assignment PIN_F7    -to mem2_cs_n[0]
set_location_assignment PIN_E5    -to mem2_odt[0]
set_location_assignment PIN_D5    -to mem2_cke[0]
set_location_assignment PIN_K10   -to mem2_ba[0]
set_location_assignment PIN_L9    -to mem2_ba[1]
set_location_assignment PIN_L10   -to mem2_bg[0]
set_location_assignment PIN_G7    -to mem2_act_n[0]
set_location_assignment PIN_U9    -to mem2_alert_n[0]
#=========================================================