debImport "-F" "rtl_lst.list"
debLoadSimResult \
           /home/gtd/workspace/qts_prj/cnn/Mobilenet_FPGA_Accelarator_nios_ddr4/rtl/00.ddr_module/sim/mobilenet_sim.fsdb
wvCreateWindow
verdiDockWidgetMaximize -dock windowDock_nWave_2
wvRestoreSignal -win $_nWave2 \
           "/home/gtd/workspace/qts_prj/cnn/Mobilenet_FPGA_Accelarator_nios_ddr4/rtl/00.ddr_module/sim/res.rc" \
           -overWriteAutoAlias on
wvUnknownSaveResult -win $_nWave2 -clear
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSetCursor -win $_nWave2 105994.069257 -snap {("G1" 6)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 170786.463137 -snap {("G1" 7)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 273839.551495 -snap {("G1" 10)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 286134.388501 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 194984.937789 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 202361.839993 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 212644.794580 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 225610.259059 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 236563.841118 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 244164.285813 -snap {("G1" 3)}
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSetCursor -win $_nWave2 286972.672843 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 316927.366639 -snap {("G1" 7)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 378569.208537 -snap {("G1" 8)}
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 484640.120524 -snap {("G1" 9)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 0.000000 808500.309598
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 242612.670303 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 219333.868819 -snap {("G1" 7)}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoom -win $_nWave2 20024.775470 328406.317706
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectGroup -win $_nWave2 {G2}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/_\$novas_unit__1"
wvGetSignalSetScope -win $_nWave2 "/ddr_module_tb"
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 12)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/ddr_module_tb/ddr_clk} \
{/ddr_module_tb/ddr_rst_n} \
{/ddr_module_tb/ddr_ready} \
{/ddr_module_tb/ddr_rd_req} \
{/ddr_module_tb/ddr_wr_req} \
{/ddr_module_tb/ddr_address\[25:0\]} \
{/ddr_module_tb/ddr_bl_size\[3:0\]} \
{/ddr_module_tb/ddr_rd_data_vld} \
{/ddr_module_tb/ddr_rd_data\[511:0\]} \
{/ddr_module_tb/ddr_wr_data\[511:0\]} \
{/ddr_module_tb/ddr_be\[63:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/ddr_module_tb/ddr_address\[25:0\]} \
{/ddr_module_tb/ddr_be\[63:0\]} \
{/ddr_module_tb/ddr_bl_size\[6:0\]} \
{/ddr_module_tb/ddr_clk} \
{/ddr_module_tb/ddr_rd_data\[511:0\]} \
{/ddr_module_tb/ddr_rd_data_vld} \
{/ddr_module_tb/ddr_rd_req} \
{/ddr_module_tb/ddr_ready} \
{/ddr_module_tb/ddr_rst_n} \
{/ddr_module_tb/ddr_wr_data\[511:0\]} \
{/ddr_module_tb/ddr_wr_req} \
{/LOGIC_LOW} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvSetPosition -win $_nWave2 {("G2" 12)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 99293.128150 -snap {("G2" 9)}
wvSelectSignal -win $_nWave2 {( "G2" 9 )} 
wvSelectSignal -win $_nWave2 {( "G2" 11 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvZoom -win $_nWave2 84017.262281 157341.418454
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 106309.621836 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 112075.670030 -snap {("G1" 5)}
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSetCursor -win $_nWave2 105991.808156 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 111803.258304 -snap {("G1" 5)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvZoomOut -win $_nWave2
wvSelectGroup -win $_nWave2 {G3}
wvSetCursor -win $_nWave2 64971.142458 -snap {("G3" 0)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/_\$novas_unit__1"
wvGetSignalSetScope -win $_nWave2 "/ddr_module_tb"
wvGetSignalSetScope -win $_nWave2 "/ddr_module_tb/ddr4_test_driver_tb"
wvGetSignalSetScope -win $_nWave2 "/ddr_module_tb/ddr_intf"
wvGetSignalSetScope -win $_nWave2 "/ddr_module_tb/ddr4_test_driver_tb"
wvGetSignalSetScope -win $_nWave2 "/ddr_module_tb/ddr_intf"
wvGetSignalSetScope -win $_nWave2 "/ddr_module_tb/ddr4_test_driver_tb"
verdiDockWidgetRestore -dock windowDock_nWave_2
srcHBSelect "ddr_module_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "ddr_module_tb" -delim "."
srcHBSelect "ddr_module_tb.ddr4_test_driver_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "ddr_module_tb.ddr4_test_driver_tb" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cur_st" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
verdiDockWidgetMaximize -dock windowDock_nWave_2
wvZoomOut -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 376291.397127 -snap {("G1" 8)}
wvZoom -win $_nWave2 238269.456096 321809.051983
wvSetCursor -win $_nWave2 262529.561651 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 273599.204697 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 285755.121126 -snap {("G1" 4)}
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 315472.457248 -snap {("G1" 4)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 -10 96 1920 901
wvResizeWindow -win $_nWave2 -10 20 1920 977
wvSelectGroup -win $_nWave2 {G3}
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvSetRadix -win $_nWave2 -format UDec
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSetRadix -win $_nWave2 -format UDec
wvSetCursor -win $_nWave2 230846.587978 -snap {("G3" 0)}
wvSetCursor -win $_nWave2 375476.129836 -snap {("G1" 8)}
wvSetCursor -win $_nWave2 381476.497095 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 388511.410433 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 286712.076249 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 292712.443508 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 299126.629198 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 303264.813515 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 316713.912543 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 287332.803897 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 294988.444882 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 301816.449004 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 316300.094111 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 387476.864353 -snap {("G1" 9)}
wvSetCursor -win $_nWave2 376717.585131 -snap {("G1" 8)}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvSetCursor -win $_nWave2 316455.276023 -snap {("G1" 4)}
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetCursor -win $_nWave2 286867.258161 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 310041.090333 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 316248.366807 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 321007.278771 -snap {("G1" 4)}
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSetCursor -win $_nWave2 316726.282116 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 285276.081312 -snap {("G1" 7)}
wvSetCursor -win $_nWave2 291483.357786 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 298518.271124 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 303484.092304 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 309691.368778 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 317140.100548 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 285276.081312 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 316105.554469 -snap {("G1" 4)}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSetCursor -win $_nWave2 333485.928598 -snap {("G1" 7)}
srcActiveTrace "ddr_module_tb.ddr_bl_size\[3:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 322000 -TraceValue 0000
nsMsgSwitchTab -tab trace
srcHBSelect "ddr_module_tb" -win $_nTrace1
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetCursor -win $_nWave2 243894.238148 -snap {("G3" 0)}
srcHBSelect "ddr_module_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "ddr_module_tb" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {6 18 1 1 1 1} -backward
srcAddSelectedToWave -win $_nTrace1
wvSelectGroup -win $_nWave2 {G4}
wvSelectSignal -win $_nWave2 {( "G3" 11 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSetRadix -win $_nWave2 -format UDec
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 4 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSelectSignal -win $_nWave2 {( "G3" 7 )} 
wvSetRadix -win $_nWave2 -format UDec
wvSetCursor -win $_nWave2 286724.445822 -snap {("G3" 7)}
wvSetCursor -win $_nWave2 295000.814455 -snap {("G3" 7)}
srcActiveTrace "ddr_module_tb.ddr_bl_size\[6:0\]" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 292000 -TraceValue 0000001
srcHBSelect "ddr_module_tb" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSelectSignal -win $_nWave2 {( "G3" 9 )} 
wvSetRadix -win $_nWave2 -format UDec
wvClearAll -win $_nWave2
wvSelectGroup -win $_nWave2 {G1}
wvUndo -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 11)}
wvSetCursor -win $_nWave2 261015.975757 -snap {("G3" 8)}
wvSaveSignal -win $_nWave2 \
           "/home/gtd/workspace/qts_prj/cnn/Mobilenet_FPGA_Accelarator_nios_ddr4/rtl/00.ddr_module/sim/res.rc"
wvSetCursor -win $_nWave2 389506.598781 -snap {("G3" 9)}
wvSetCursor -win $_nWave2 394679.329176 -snap {("G3" 8)}
wvSetCursor -win $_nWave2 405645.517615 -snap {("G3" 8)}
wvSetCursor -win $_nWave2 412059.703305 -snap {("G3" 9)}
wvSetCursor -win $_nWave2 424888.074686 -snap {("G3" 9)}
wvSetCursor -win $_nWave2 147577.998183 -snap {("G1" 6)}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSetCursor -win $_nWave2 153992.183874 -snap {("G1" 3)}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSetCursor -win $_nWave2 148405.635047 -snap {("G1" 6)}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSetCursor -win $_nWave2 168682.738197 -snap {("G3" 5)}
srcActiveTrace "ddr_module_tb.ddr_wr_req" -win $_nTrace1 -TraceByDConWave \
           -TraceTime 160000 -TraceValue 1
srcHBSelect "ddr_module_tb" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "avl_write_req" -win $_nTrace1
srcAction -pos 30 3 9 -win $_nTrace1 -name "avl_write_req" -ctrlKey off
wvSetCursor -win $_nWave2 147991.816615 -snap {("G1" 3)}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetRadix -win $_nWave2 -format UDec
wvSetCursor -win $_nWave2 316002.099861 -snap {("G3" 4)}
wvSelectSignal -win $_nWave2 {( "G3" 5 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 188701.204828 372436.588476
wvSetCursor -win $_nWave2 304232.648849 -snap {("G3" 6)}
wvSetCursor -win $_nWave2 316633.365145 -snap {("G3" 6)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 399411.144361 -snap {("G3" 9)}
wvSelectSignal -win $_nWave2 {( "G3" 6 )} 
wvSetCursor -win $_nWave2 303789.107236 -snap {("G3" 6)}
wvTpfCloseForm -win $_nWave2
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
debExit
