# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator. In this case, you must also copy the generated library
# # setup "synopsys_sim.setup" into the location from which you launch the
# # simulator, or incorporate into any existing library setup.
# #
# # Run Quartus-generated IP simulation script once to compile Quartus EDA
# # simulation libraries and Quartus-generated IP simulation files, and copy
# # any ROM/RAM initialization files to the simulation directory.
# #
# # - If necessary, specify any compilation options:
# #   USER_DEFINED_COMPILE_OPTIONS
# #   USER_DEFINED_VHDL_COMPILE_OPTIONS applied to vhdl compiler
# #   USER_DEFINED_VERILOG_COMPILE_OPTIONS applied to verilog compiler
# #
source ../sim/synopsys/vcsmx/vcsmx_setup.sh \
SKIP_FILE_COPY=1 \
SKIP_DEV_COM=1 \
SKIP_COM=1 \
SKIP_ELAB=1 \
SKIP_SIM=1 \
QSYS_SIMDIR="../sim/"


# #
# # Compile all design files and testbench files, including the top level.
# # (These are all the files required for simulation other than the files
# # compiled by the IP script)
# #
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/00.ddr_module/c_ddr_intf.sv"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/00.ddr_module/c_ddr_model.sv"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/01.ddr_ctrl/ddr_ctrl.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/02.ddr_init_ins/ddr_init_ins_gen.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/03.ddr_rd_ins/ddr_rd_addr_gen/rd_conv_b_addr_gen.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/03.ddr_rd_ins/ddr_rd_addr_gen/rd_conv_f_addr_gen.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/03.ddr_rd_ins/ddr_rd_addr_gen/rd_conv_w_addr_gen.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/03.ddr_rd_ins/ddr_rd_addr_gen/rd_dw_b_addr_gen.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/03.ddr_rd_ins/ddr_rd_addr_gen/rd_dw_f_addr_gen.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/03.ddr_rd_ins/ddr_rd_addr_gen/rd_dw_w_addr_gen.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/03.ddr_rd_ins/ddr_rd_addr_gen/rd_pw_w_addr_gen.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/03.ddr_rd_ins/ddr_rd_addr_gen/rd_pw_b_addr_gen.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/03.ddr_rd_ins/ddr_rd_addr_gen/rd_pw_f_addr_gen.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/03.ddr_rd_ins/ddr_rd_addr_gen/rd_avgle_addr_gen.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/03.ddr_rd_ins/ddr_rd_ins_gen.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/04.data_in_reorder/data_gen.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/04.data_in_reorder/data_in_reorder.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/04.data_in_reorder/ddr_rd_data_pro.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/05.weight_ctrl/w_chg_ctrl.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/05.weight_ctrl/w_gen.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/05.weight_ctrl/w_rd_ctrl.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/06.bias_ctrl/bias_gen.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/06.bias_ctrl/bias_ctrl.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/07.sc_ctrl/sc_ctrl.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/08.calc_unit/calc_unit_x16.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/08.calc_unit/calc_unit_single.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/09.bias_add/bias_add.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/10.data_out_reorder/acc_data_reorder_top.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/10.data_out_reorder/addr_map.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/10.data_out_reorder/ddr_wr_addr_gen/dw2pw_reorder_addr_gen.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/10.data_out_reorder/ddr_wr_addr_gen/pw2dw_reorder_addr_gen.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/10.data_out_reorder/ddr_wr_addr_gen/pw2pw_reorder_addr_gen.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/10.data_out_reorder/ddr_wr_addr_gen/avg2pw_reorder_addr_gen.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/11.acc_veri/acc_data_veri_tx.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/11.acc_veri/ddr_veri_ins_gen.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/12.top/mobilenet_acc_top.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/12.top/mobilenet_test_top_forsim.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/12.top/mobilenet_acc_tb.sv"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/14.ddr_interface/ddr_ctrl_ins_sync.v"
vlogan -full64 +v2k +systemverilogext+.sv "../rtl/14.ddr_interface/ddr_rd_data_sync.v"

# #
# # TOP_LEVEL_NAME is used in this script to set the top-level simulation or
# # testbench module/entity name.
# #
# # Run the IP script again to elaborate and simulate the top level:
# # - Specify TOP_LEVEL_NAME and USER_DEFINED_ELAB_OPTIONS.
# # - Override the default USER_DEFINED_SIM_OPTIONS. For example, to run
# #   until $finish(), set to an empty string: USER_DEFINED_SIM_OPTIONS="".
# #
source ../sim/synopsys/vcsmx/vcsmx_setup.sh \
SKIP_FILE_COPY=1 \
SKIP_DEV_COM=1 \
SKIP_COM=1 \
SKIP_ELAB=0 \
SKIP_SIM=1 \
TOP_LEVEL_NAME="'-top mobilenet_acc_tb'" \
QSYS_SIMDIR="../sim/"
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------




