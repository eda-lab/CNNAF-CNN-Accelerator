---------------------
; Table of Contents ;
---------------------
  1. About this file
  2. Outputs of IP generation
  3. Instantiating IP in a Quartus Prime project
  4. Early I/O timing analysis
  5. I/O assignments
  6. Pin locations
  7. Sharing core clocks between interfaces
  8. Sharing PLL reference clock pin between interfaces
  9. Global reset interface
 10. PLL reference clock output
 11. On-Chip Termination (OCT) interface
 12. Interface between FPGA and external memory
 13. PHY calibration status interface
 14. User clock domain reset interface
 15. User clock interface
 16. Reset interface for the core slave logic that interacts with the sequencer CPU
 17. Clock interface for the core slave logic that interacts with the sequencer CPU
 18. Controller Avalon Memory-Mapped interface 0
 19. Interface that allows the EMIF calibration processor to talk to its slave components
 20. Instantiating IP in a simulation project
 21. Full-calibration versus skip-calibration simulation
 22. IP Settings
 23. Configuring the Traffic Generator


------------------------
;   1. About this file ;
------------------------

   This is the readme file for the Altera External Memory Interface (EMIF) IP v18.1.
   
   The file provides a high-level overview of the IP. For details, refer to the
   handbook chapter on Arria 10 DDR4 External Memory Interface.
   
   This file was auto-generated.


---------------------------------
;   2. Outputs of IP generation ;
---------------------------------

   IP generation supports the following output filesets:
   
      Synthesis            - This is the fileset you should use when instantiating the IP in
                             your Quartus Prime project. RTL files in this fileset can be
                             simulated, but your simulator must support SystemVerilog.
                             Simulating the synthesis files yields identical results as
                             simulating the simulation files.
   
      Simulation           - This fileset contains scripts and source files to help you
                             integrate the IP into your simulation project targeting a
                             3rd-party simulator of your choice. If you select VHDL
                             during IP generation, the fileset contains IEEE-encrypted
                             Verilog files that can be used in VHDL-only simulators, such
                             as ModelSim - Intel FPGA edition. All source files in the simulation
                             filesets are functionally equivalent to the synthesis fileset.
   
      Example Design       - This fileset contains scripts to generate example Quartus Prime project
                             and simulation projects for 3rd-party simulators. An example
                             design contains an instantiation of the IP, a simple traffic
                             generator, and in the case of a simulation example design, a
                             simple memory model.


----------------------------------------------------
;   3. Instantiating IP in a Quartus Prime project ;
----------------------------------------------------

   If you instantiate the IP as part of a Qsys system, follow the Qsys
   documentation on how to instantiate the system in a Quartus Prime project.
   
   If the IP was generated as a standalone component, it is sufficient to add
   the generated .qip file from the synthesis fileset to your Quartus Prime project.
   The .qip file allows the Quartus Prime software to locate all the files of
   the IP, including RTL files, SDC files, hex files, and timing scripts. Once the
   .qip file is added, you can instantiate the memory interface in your RTL.


----------------------------------
;   4. Early I/O timing analysis ;
----------------------------------

   Early I/O timing analysis allows you to run I/O timing analysis without first
   running a Quartus Prime compilation. This is useful if you want to quickly evaluate
   whether the I/O interface between the FPGA and the external memory device has
   sufficient timing margin. The analysis takes into account the timing parameters
   of the memory device, the speed and topology of the memory interface, the board
   timing and ISI characteristics, and the timing of the selected FPGA device.
   
   To run early I/O timing analysis:
   
      1) Create a Quartus Prime project that instantiates the IP (or use the example design)
      2) Open the project in the Quartus Prime GUI
      3) Go to "Tools" -> "TimeQuest Timing Analyzer"
      4) Inside TimeQuest, Go to "Script" -> "Run Tcl Script..."
      5) Locate the *_report_io_timing.tcl script, and click "Open"


------------------------
;   5. I/O assignments ;
------------------------

   The generated .qip file in the synthesis fileset contains the I/O standard and input/output
   termination assignments required by the memory interface pins to function correctly.
   The values to the assignments are based on user inputs provided during generation.
   
   Unlike previous EMIF IP, there is no need to manually run a *_pin_assignments.tcl
   script to annotate the assignments into the project's .qsf file.
   Assignments in the .qip file are read and applied during every compilation, regardless
   of how you name the memory interface pins in your design top-level component. No new
   assignment is created in the project's .qsf file during the process.
   
   You should never edit the generated .qip file, because changes made to this file
   are overwritten when you regenerate the IP. To override an I/O assignment made in
   the .qip file, simply add an assignment to the project's .qsf file. Assignments in
   the .qsf file always take precedence over those in the .qip file. Note that I/O
   assignments in the .qsf file must specify the names of your top-level pins as
   target (i.e. -to), and you must not use the -entity and -library options.
   
   Consult the .qip file for the set of I/O assignments that come with the IP.


----------------------
;   6. Pin locations ;
----------------------

   The Arria 10 I/O subsystem is located in the I/O columns. The device has up to
   two I/O columns that can be used by memory interfaces. Each column consists of up
   to 12 I/O banks. Each bank consists of 4 I/O lanes. A lane is a group of 12 I/Os.
   A bank is a group of 48 I/Os.
   
   The pins of a memory interface must be placed within a single I/O column. A memory
   interface can occupy one or more banks. When multiple banks are needed, the banks must
   be consecutive.
   
   All address/command pins of a memory interface must be placed within a single bank.
   This bank is denoted as the "address/command" bank. While any physical bank within
   an I/O column can be used as an "address/command" bank, for a multi-bank memory
   interface, the "address/command" bank must be at the center of the interface.
   
   Address/command pins within the "address/command" bank must follow a fixed pinout
   scheme within the bank. Note that the pinout scheme used is dependent on the topology
   of the memory interface, and is a hardware requirement. An I/O lane unused in the
   "address/command" bank can be used to implement a data group (e.g. a x8 DQS group).
   
   A read data group must be placed based on the DQS/CQ/QK grouping in the pin table.
   Specifically, read data strobes/clocks must be placed at physical pins capable of
   functioning as DQS/CK/QK for a specific read data group size, and the associated
   data pins must be placed within the same group.
   A x8/x9 read data group occupies one lane; a x16/x18 read data group occupies either
   the top or bottom 2 lanes of a bank; a x36 read data group occupies all four lanes of
   a bank. For protocols/topologies where a write data group consists of multiple read data
   groups, the read data groups should be placed in the same bank to improve I/O timing.
   
   I/Os that are unused by memory interface pins can be used as general-purpose I/Os with
   compatible I/O standard and termination settings.
   
   The following shows one possible grouping of memory interface pins into logical banks. To
   implement the scheme in your Quartus Prime project, you need to:
   
      1) Decide which physical I/O banks the logical banks occupy.
      2) Add location assignments for the following pins:
            All read data strobes/clocks (e.g. DQS/CQ/DQ)
            One of the address/command pins
            PLL reference clock pins (unless using a shared PLL reference clock pin in another interface)
            RZQ pin
         The Quartus Prime Fitter automatically places the remaining pins.
   
   The current memory interface occupies 3 banks.
   
   Note that this is only an example and other possible schemes may exist. The example
   is functionally correct and legal, but is not necessarily optimal from the resource
   consumption, timing, and board routability perspective.
   
   Logical bank 2:
   ----------------------
   
      Lane index      Pin index       Port                  
      -------------------------------------------------------
      3               47              -
      .               46              -
      .               45              -
      .               44              -
      .               43              -
      .               42              -
      .               41              -
      .               40              -
      .               39              -
      .               38              -
      .               37              -
      .               36              -
      2               35              mem_dbi_n[7]
      .               34              mem_dq[63]
      .               33              mem_dq[62]
      .               32              mem_dq[61]
      .               31              mem_dq[60]
      .               30              mem_dq[59]
      .               29              mem_dqs_n[7]
      .               28              mem_dqs[7]
      .               27              mem_dq[58]
      .               26              mem_dq[57]
      .               25              mem_dq[56]
      .               24              -
      1               23              mem_dbi_n[6]
      .               22              mem_dq[55]
      .               21              mem_dq[54]
      .               20              mem_dq[53]
      .               19              mem_dq[52]
      .               18              mem_dq[51]
      .               17              mem_dqs_n[6]
      .               16              mem_dqs[6]
      .               15              mem_dq[50]
      .               14              mem_dq[49]
      .               13              mem_dq[48]
      .               12              -
      0               11              mem_dbi_n[5]
      .               10              mem_dq[47]
      .               9               mem_dq[46]
      .               8               mem_dq[45]
      .               7               mem_dq[44]
      .               6               mem_dq[43]
      .               5               mem_dqs_n[5]
      .               4               mem_dqs[5]
      .               3               mem_dq[42]
      .               2               mem_dq[41]
      .               1               mem_dq[40]
      .               0               -
   
   Logical bank 1 (address/command bank):
   --------------------------------------------
   
      Address/command pinout scheme  : DDR4 Scheme 2: Component/SODIMM
      Number of address/command lanes: 3
   
      Lane index      Pin index       Port                  
      -------------------------------------------------------
      3               47              mem_dbi_n[4]
      .               46              mem_dq[39]
      .               45              mem_dq[38]
      .               44              mem_dq[37]
      .               43              mem_dq[36]
      .               42              mem_dq[35]
      .               41              mem_dqs_n[4]
      .               40              mem_dqs[4]
      .               39              mem_dq[34]
      .               38              mem_dq[33]
      .               37              mem_dq[32]
      .               36              -
      2               35              mem_bg[0]
      .               34              mem_ba[1]
      .               33              mem_ba[0]
      .               32              -
      .               31              mem_a[16]
      .               30              mem_a[15]
      .               29              mem_a[14]
      .               28              mem_a[13]
      .               27              mem_a[12]
      .               26              oct_rzqin - if needed
      .               25              pll_ref_clk (negative leg) - if needed
      .               24              pll_ref_clk (positive leg) - if needed
      1               23              mem_a[11]
      .               22              mem_a[10]
      .               21              mem_a[9]
      .               20              mem_a[8]
      .               19              mem_a[7]
      .               18              mem_a[6]
      .               17              mem_a[5]
      .               16              mem_a[4]
      .               15              mem_a[3]
      .               14              mem_a[2]
      .               13              mem_a[1]
      .               12              mem_a[0]
      0               11              mem_par[0]
      .               10              -
      .               9               mem_ck_n[0]
      .               8               mem_ck[0]
      .               7               -
      .               6               mem_cke[0]
      .               5               -
      .               4               mem_odt[0]
      .               3               mem_act_n[0]
      .               2               mem_cs_n[0]
      .               1               mem_reset_n[0]
      .               0               -
   
   Logical bank 0:
   ----------------------
   
      Lane index      Pin index       Port                  
      -------------------------------------------------------
      3               47              mem_dbi_n[3]
      .               46              mem_dq[31]
      .               45              mem_dq[30]
      .               44              mem_dq[29]
      .               43              mem_dq[28]
      .               42              mem_dq[27]
      .               41              mem_dqs_n[3]
      .               40              mem_dqs[3]
      .               39              mem_dq[26]
      .               38              mem_dq[25]
      .               37              mem_dq[24]
      .               36              -
      2               35              mem_dbi_n[2]
      .               34              mem_dq[23]
      .               33              mem_dq[22]
      .               32              mem_dq[21]
      .               31              mem_dq[20]
      .               30              mem_dq[19]
      .               29              mem_dqs_n[2]
      .               28              mem_dqs[2]
      .               27              mem_dq[18]
      .               26              mem_dq[17]
      .               25              mem_dq[16]
      .               24              -
      1               23              mem_dbi_n[1]
      .               22              mem_dq[15]
      .               21              mem_dq[14]
      .               20              mem_dq[13]
      .               19              mem_dq[12]
      .               18              mem_dq[11]
      .               17              mem_dqs_n[1]
      .               16              mem_dqs[1]
      .               15              mem_dq[10]
      .               14              mem_dq[9]
      .               13              mem_dq[8]
      .               12              -
      0               11              mem_dbi_n[0]
      .               10              mem_dq[7]
      .               9               mem_dq[6]
      .               8               mem_dq[5]
      .               7               mem_dq[4]
      .               6               mem_dq[3]
      .               5               mem_dqs_n[0]
      .               4               mem_dqs[0]
      .               3               mem_dq[2]
      .               2               mem_dq[1]
      .               1               mem_dq[0]
      .               0               mem_alert_n[0]


-----------------------------------------------
;   7. Sharing core clocks between interfaces ;
-----------------------------------------------

   When a design contains multiple memory interfaces of the same protocol, rate,
   frequency, and PLL reference clock source, it is possible for these interfaces
   to share a common set of core clock signals. Core clocks sharing allows your
   logic to use a single clock domain to synchronously access all interfaces.
   The feature also reduces the number of core clock networks required.
   
   In order for multiple memory interfaces to share core clocks, one of the interfaces
   must be specified as "Master" using the "Core clocks sharing" setting during
   generation, and the remaining interfaces must be denoted as "Slave". There is no
   preference to which interface needs to be a master. In the RTL, connect the
   clks_sharing_master_out signal from the master interface to the clks_sharing_slave_in
   signal of all the slave interfaces. Note that both the master and slave interfaces
   expose their own output clock ports in the RTL (e.g. emif_usr_clk, afi_clk), but the
   physical signals are equivalent and so it does not matter whether a clock port from a
   master or a slave is used.
   
   Core clocks sharing necessitates PLL reference clock sharing. Therefore,
   only the master interface exposes an input port for the PLL reference clock. The
   same PLL reference clock signal is used by all the slave interfaces. See section
   on PLL reference clock sharing for additional requirements.
   
   The core clocks sharing mode of the current IP is "No Sharing"


-----------------------------------------------------------
;   8. Sharing PLL reference clock pin between interfaces ;
-----------------------------------------------------------

   To share a single PLL reference clock signal between multiple memory interfaces,
   simply connect the same PLL reference clock signal to all interfaces in the RTL.
   
   Interfaces that share the same PLL reference clock signal must be placed in the
   same I/O column and must occupy consecutive banks.


-------------------------------
;   9. Global reset interface ;
-------------------------------

   Port                           Width   Direction   Description                                        
   ------------------------------------------------------------------------------------------------------
   global_reset_n                 1       input       Asynchronous reset causes the memory interface to be reset and recalibrated. The global reset signal applies to all memory interfaces placed within an I/O column.


-----------------------------------
;  10. PLL reference clock output ;
-----------------------------------

   Port                           Width   Direction   Description                                        
   ------------------------------------------------------------------------------------------------------
   pll_ref_clk                    1       input       PLL reference clock input


--------------------------------------------
;  11. On-Chip Termination (OCT) interface ;
--------------------------------------------

   Port                           Width   Direction   Description                                        
   ------------------------------------------------------------------------------------------------------
   oct_rzqin                      1       input       Calibrated On-Chip Termination (OCT) RZQ input pin


---------------------------------------------------
;  12. Interface between FPGA and external memory ;
---------------------------------------------------

   Port                           Width   Direction   Description                                        
   ------------------------------------------------------------------------------------------------------
   mem_ck                         1       output      CK clock
   mem_ck_n                       1       output      CK clock (negative leg)
   mem_a                          17      output      Address
   mem_act_n                      1       output      Activation command
   mem_ba                         2       output      Bank address
   mem_bg                         1       output      Bank group
   mem_cke                        1       output      Clock enable
   mem_cs_n                       1       output      Chip select
   mem_odt                        1       output      On-die termination
   mem_reset_n                    1       output      Asynchronous reset
   mem_par                        1       output      Command and address parity
   mem_alert_n                    1       input       Alert flag
   mem_dqs                        8       bidir       Data strobe
   mem_dqs_n                      8       bidir       Data strobe (negative leg)
   mem_dq                         64      bidir       Read/write data
   mem_dbi_n                      8       bidir       Acts as either the data bus inversion pin, or the data mask pin, depending on configuration. 


-----------------------------------------
;  13. PHY calibration status interface ;
-----------------------------------------

   Port                           Width   Direction   Description                                        
   ------------------------------------------------------------------------------------------------------
   local_cal_success              1       output      When high, indicates that PHY calibration was successful
   local_cal_fail                 1       output      When high, indicates that PHY calibration failed


------------------------------------------
;  14. User clock domain reset interface ;
------------------------------------------

   Port                           Width   Direction   Description                                        
   ------------------------------------------------------------------------------------------------------
   emif_usr_reset_n               1       output      Reset for the user clock domain. Asynchronous assertion and synchronous deassertion


-----------------------------
;  15. User clock interface ;
-----------------------------

   Port                           Width   Direction   Description                                        
   ------------------------------------------------------------------------------------------------------
   emif_usr_clk                   1       output      User clock domain


---------------------------------------------------------------------------------------
;  16. Reset interface for the core slave logic that interacts with the sequencer CPU ;
---------------------------------------------------------------------------------------

   Port                           Width   Direction   Description                                        
   ------------------------------------------------------------------------------------------------------
   cal_slave_reset_n_in           1       input       Reset for the core slave logic that interacts with the sequencer CPU. Asynchronous assertion and synchronous deassertion


---------------------------------------------------------------------------------------
;  17. Clock interface for the core slave logic that interacts with the sequencer CPU ;
---------------------------------------------------------------------------------------

   Port                           Width   Direction   Description                                        
   ------------------------------------------------------------------------------------------------------
   cal_slave_clk_in               1       input       Clock for the core slave logic that interacts with the sequencer CPU.


----------------------------------------------------
;  18. Controller Avalon Memory-Mapped interface 0 ;
----------------------------------------------------

   Port                           Width   Direction   Description                                        
   ------------------------------------------------------------------------------------------------------
   amm_ready_0                    1       output      Wait-request is asserted when controller is busy
   amm_read_0                     1       input       Read request signal
   amm_write_0                    1       input       Write request signal
   amm_address_0                  26      input       Address for the read/write request
   amm_readdata_0                 512     output      Read data
   amm_writedata_0                512     input       Write data
   amm_burstcount_0               7       input       Number of transfers in each read/write burst
   amm_byteenable_0               64      input       Byte-enable for write data
   amm_readdatavalid_0            1       output      Indicates whether read data is valid
   
   Interface properties:
      WORD_WIDTH                    : 512
      SYMBOL_WIDTH                  : 8
      SYMBOLS_PER_WORD              : 64
      BYTE_ENABLE_WIDTH             : 64
      USE_BYTE_ENABLE               : true
      WORD_ADDRESS_WIDTH            : 26
      SYMBOL_ADDRESS_WIDTH          : 32
      BURST_COUNT_WIDTH             : 7
      WORD_ADDRESS_DIVISIBLE_BY     : 1
      BURST_COUNT_DIVISIBLE_BY      : 1
   
   For details, refer to documentation on "Avalon Interface Specifications".


---------------------------------------------------------------------------------------------
;  19. Interface that allows the EMIF calibration processor to talk to its slave components ;
---------------------------------------------------------------------------------------------

   Port                           Width   Direction   Description                                        
   ------------------------------------------------------------------------------------------------------
   cal_master_waitrequest         1       input       Wait-request is asserted when controller is busy
   cal_master_read                1       output      Read request signal
   cal_master_write               1       output      Write request signal
   cal_master_addr                16      output      Address for the read/write request
   cal_master_read_data           32      input       Read data
   cal_master_write_data          32      output      Write data
   cal_master_byteenable          4       output      Byte-enable for write data
   cal_master_read_data_valid     1       input       Indicates whether read data is valid
   cal_master_burstcount          1       output      Burstcount
   cal_master_debugaccess         1       output      Debugaccess


-------------------------------------------------
;  20. Instantiating IP in a simulation project ;
-------------------------------------------------

   The simulation fileset as well as the simulation example design contain scripts
   that illustrate what files are required when including the EMIF IP for simulation.
   The scripts are customized for all the 3rd-party simulators supported. It is highly
   recommended that you use these scripts as reference when setting up your simulation
   environment.


------------------------------------------------------------
;  21. Full-calibration versus skip-calibration simulation ;
------------------------------------------------------------

   During generation, you can specify the default RTL simulation behavior for PHY calibration.
   If you specify full-calibration simulation, the simulation time can take a very long time
   because all the stages and the detailed behavior of PHY calibration are simulated. If you
   specify skip-calibration simulation, the detailed behavior of PHY calibration is not
   simulated. Skip-calibration simulation is recommended unless you suspect a functional
   issue with the PHY calibration algorithm. Note however, that RTL simulation is a zero-delay
   simulation, and so timing-related calibration failures on hardware do not manifest themselves
   during RTL simulations.
   
   The setting that controls the calibration mode is encoded within the *_seq_params_sim.hex file
   and the *_seq_params_synth.hex file. When the IP is compiled under the Quartus Prime software,
   synthesis-directive causes the *_seq_params_synth.hex file to always be used. Outside of the
   Quartus Prime software (e.g. 3rd-party simulator), the *_seq_params_sim.hex file is always used.
   The behavior is the same regardless of which fileset is being synthesized or simulated.
   The calibration mode setting specified during generation only affects the *_seq_params_sim.hex
   file. The *_seq_params_synth.hex file always specifies full-calibration since full calibration
   is key to functional hardware.
   The RTL simulation behavior of the current IP is "Skip Calibration"


--------------------
;  22. IP Settings ;
--------------------

   SYS_INFO_DEVICE_FAMILY                            : Arria 10
   SYS_INFO_DEVICE                                   : 10AX066K3F40E2SG
   SYS_INFO_DEVICE_SPEEDGRADE                        : 2
   SYS_INFO_DEVICE_DIE_REVISIONS                     : 
   FAMILY_ENUM                                       : FAMILY_ARRIA10
   TRAIT_SUPPORTS_VID                                : 0
   PROTOCOL_ENUM                                     : PROTOCOL_DDR4
   IS_ED_SLAVE                                       : false
   INTERNAL_TESTING_MODE                             : false
   CAL_DEBUG_CLOCK_FREQUENCY                         : 50000000
   SYS_INFO_UNIQUE_ID                                : ddr4_qsys_emif_0
   PREV_PROTOCOL_ENUM                                : PROTOCOL_DDR4
   PHY_FPGA_SPEEDGRADE_GUI                           : E2 (Production) - change device under 'View'->'Device Family'
   PHY_TARGET_SPEEDGRADE                             : E2
   PHY_TARGET_IS_ES                                  : false
   PHY_TARGET_IS_ES2                                 : false
   PHY_TARGET_IS_ES3                                 : false
   PHY_TARGET_IS_PRODUCTION                          : true
   PHY_CONFIG_ENUM                                   : CONFIG_PHY_AND_HARD_CTRL
   PHY_PING_PONG_EN                                  : false
   PHY_RATE_ENUM                                     : RATE_QUARTER
   PHY_MEM_CLK_FREQ_MHZ                              : 1200.0
   PHY_REF_CLK_FREQ_MHZ                              : 300.0
   PHY_REF_CLK_JITTER_PS                             : 10.0
   PHY_CORE_CLKS_SHARING_ENUM                        : CORE_CLKS_SHARING_DISABLED
   PHY_CORE_CLKS_SHARING_EXPOSE_SLAVE_OUT            : false
   PHY_CALIBRATED_OCT                                : true
   PHY_AC_CALIBRATED_OCT                             : true
   PHY_CK_CALIBRATED_OCT                             : true
   PHY_DATA_CALIBRATED_OCT                           : true
   PHY_RZQ                                           : 240
   PHY_HPS_ENABLE_EARLY_RELEASE                      : false
   PHY_USER_PERIODIC_OCT_RECAL_ENUM                  : PERIODIC_OCT_RECAL_AUTO
   PHY_AC_IO_STD_ENUM                                : IO_STD_SSTL_12
   PHY_CK_IO_STD_ENUM                                : IO_STD_SSTL_12
   PHY_DATA_IO_STD_ENUM                              : IO_STD_POD_12
   PHY_AC_MODE_ENUM                                  : OUT_OCT_40_CAL
   PHY_CK_MODE_ENUM                                  : OUT_OCT_40_CAL
   PHY_DATA_OUT_MODE_ENUM                            : OUT_OCT_34_CAL
   PLL_ADD_EXTRA_CLKS                                : false
   PLL_USER_NUM_OF_EXTRA_CLKS                        : 0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_0               : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_0               : 0.0
   PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_0              : 0.0
   PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_0              : ps
   PLL_EXTRA_CLK_DESIRED_PHASE_GUI_0                 : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_0              : 0.0
   PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_0            : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_0             : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_0                 : 50.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_1               : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_1               : 0.0
   PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_1              : 0.0
   PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_1              : ps
   PLL_EXTRA_CLK_DESIRED_PHASE_GUI_1                 : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_1              : 0.0
   PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_1            : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_1             : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_1                 : 50.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_2               : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_2               : 0.0
   PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_2              : 0.0
   PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_2              : ps
   PLL_EXTRA_CLK_DESIRED_PHASE_GUI_2                 : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_2              : 0.0
   PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_2            : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_2             : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_2                 : 50.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_3               : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_3               : 0.0
   PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_3              : 0.0
   PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_3              : ps
   PLL_EXTRA_CLK_DESIRED_PHASE_GUI_3                 : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_3              : 0.0
   PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_3            : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_3             : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_3                 : 50.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_4               : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_4               : 0.0
   PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_4              : 0.0
   PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_4              : ps
   PLL_EXTRA_CLK_DESIRED_PHASE_GUI_4                 : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_4              : 0.0
   PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_4            : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_4             : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_4                 : 50.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_5               : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_5               : 0.0
   PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_5              : 0.0
   PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_5              : ps
   PLL_EXTRA_CLK_DESIRED_PHASE_GUI_5                 : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_5              : 0.0
   PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_5            : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_5             : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_5                 : 50.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_6               : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_6               : 0.0
   PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_6              : 0.0
   PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_6              : ps
   PLL_EXTRA_CLK_DESIRED_PHASE_GUI_6                 : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_6              : 0.0
   PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_6            : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_6             : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_6                 : 50.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_7               : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_7               : 0.0
   PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_7              : 0.0
   PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_7              : ps
   PLL_EXTRA_CLK_DESIRED_PHASE_GUI_7                 : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_7              : 0.0
   PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_7            : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_7             : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_7                 : 50.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_GUI_8               : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_GUI_8               : 0.0
   PLL_EXTRA_CLK_DESIRED_FREQ_MHZ_GUI_8              : 0.0
   PLL_EXTRA_CLK_PHASE_SHIFT_UNIT_GUI_8              : ps
   PLL_EXTRA_CLK_DESIRED_PHASE_GUI_8                 : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_DEG_GUI_8              : 0.0
   PLL_EXTRA_CLK_DESIRED_DUTY_CYCLE_GUI_8            : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_GUI_8             : 50.0
   PLL_EXTRA_CLK_ACTUAL_DUTY_CYCLE_8                 : 50.0
   PLL_VCO_CLK_FREQ_MHZ                              : 1200.0
   PLL_NUM_OF_EXTRA_CLKS                             : 0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_0                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_0                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_1                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_1                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_2                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_2                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_3                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_3                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_4                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_4                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_5                   : 1200.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_5                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_6                   : 1200.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_6                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_7                   : 1200.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_7                   : 0.0
   PLL_EXTRA_CLK_ACTUAL_FREQ_MHZ_8                   : 1200.0
   PLL_EXTRA_CLK_ACTUAL_PHASE_PS_8                   : 0.0
   PHY_DDR4_CONFIG_ENUM                              : CONFIG_PHY_AND_HARD_CTRL
   PHY_DDR4_USER_PING_PONG_EN                        : false
   PHY_DDR4_MEM_CLK_FREQ_MHZ                         : 1200.0
   PHY_DDR4_DEFAULT_REF_CLK_FREQ                     : true
   PHY_DDR4_USER_REF_CLK_FREQ_MHZ                    : -1.0
   PHY_DDR4_REF_CLK_JITTER_PS                        : 10.0
   PHY_DDR4_RATE_ENUM                                : RATE_QUARTER
   PHY_DDR4_CORE_CLKS_SHARING_ENUM                   : CORE_CLKS_SHARING_DISABLED
   PHY_DDR4_CORE_CLKS_SHARING_EXPOSE_SLAVE_OUT       : false
   PHY_DDR4_IO_VOLTAGE                               : 1.2
   PHY_DDR4_DEFAULT_IO                               : false
   PHY_DDR4_HPS_ENABLE_EARLY_RELEASE                 : false
   PHY_DDR4_USER_PERIODIC_OCT_RECAL_ENUM             : PERIODIC_OCT_RECAL_AUTO
   PHY_DDR4_REF_CLK_FREQ_MHZ                         : 300.0
   PHY_DDR4_PING_PONG_EN                             : false
   PHY_DDR4_USER_AC_IO_STD_ENUM                      : IO_STD_SSTL_12
   PHY_DDR4_USER_AC_MODE_ENUM                        : OUT_OCT_40_CAL
   PHY_DDR4_USER_AC_SLEW_RATE_ENUM                   : SLEW_RATE_FAST
   PHY_DDR4_USER_CK_IO_STD_ENUM                      : IO_STD_SSTL_12
   PHY_DDR4_USER_CK_MODE_ENUM                        : OUT_OCT_40_CAL
   PHY_DDR4_USER_CK_SLEW_RATE_ENUM                   : SLEW_RATE_FAST
   PHY_DDR4_USER_DATA_IO_STD_ENUM                    : IO_STD_POD_12
   PHY_DDR4_USER_DATA_OUT_MODE_ENUM                  : OUT_OCT_34_CAL
   PHY_DDR4_USER_DATA_IN_MODE_ENUM                   : IN_OCT_60_CAL
   PHY_DDR4_USER_AUTO_STARTING_VREFIN_EN             : true
   PHY_DDR4_USER_STARTING_VREFIN                     : 70.0
   PHY_DDR4_USER_PLL_REF_CLK_IO_STD_ENUM             : IO_STD_LVDS_NO_OCT
   PHY_DDR4_USER_RZQ_IO_STD_ENUM                     : IO_STD_CMOS_12
   PHY_DDR4_AC_IO_STD_ENUM                           : IO_STD_SSTL_12
   PHY_DDR4_AC_MODE_ENUM                             : OUT_OCT_40_CAL
   PHY_DDR4_AC_SLEW_RATE_ENUM                        : SLEW_RATE_FAST
   PHY_DDR4_CK_IO_STD_ENUM                           : IO_STD_SSTL_12
   PHY_DDR4_CK_MODE_ENUM                             : OUT_OCT_40_CAL
   PHY_DDR4_CK_SLEW_RATE_ENUM                        : SLEW_RATE_FAST
   PHY_DDR4_DATA_IO_STD_ENUM                         : IO_STD_POD_12
   PHY_DDR4_DATA_OUT_MODE_ENUM                       : OUT_OCT_34_CAL
   PHY_DDR4_DATA_IN_MODE_ENUM                        : IN_OCT_60_CAL
   PHY_DDR4_AUTO_STARTING_VREFIN_EN                  : true
   PHY_DDR4_STARTING_VREFIN                          : 68.0
   PHY_DDR4_PLL_REF_CLK_IO_STD_ENUM                  : IO_STD_LVDS_NO_OCT
   PHY_DDR4_RZQ_IO_STD_ENUM                          : IO_STD_CMOS_12
   MEM_FORMAT_ENUM                                   : MEM_FORMAT_DISCRETE
   MEM_READ_LATENCY                                  : 18.0
   MEM_WRITE_LATENCY                                 : 14
   MEM_BURST_LENGTH                                  : 8
   MEM_DATA_MASK_EN                                  : true
   MEM_HAS_SIM_SUPPORT                               : true
   MEM_NUM_OF_PHYSICAL_RANKS                         : 1
   MEM_NUM_OF_LOGICAL_RANKS                          : 1
   MEM_NUM_OF_DATA_ENDPOINTS                         : 1
   MEM_TTL_DATA_WIDTH                                : 64
   MEM_TTL_NUM_OF_READ_GROUPS                        : 8
   MEM_TTL_NUM_OF_WRITE_GROUPS                       : 8
   MEM_DDR4_FORMAT_ENUM                              : MEM_FORMAT_DISCRETE
   MEM_DDR4_DQ_WIDTH                                 : 64
   MEM_DDR4_DQ_PER_DQS                               : 8
   MEM_DDR4_DISCRETE_CS_WIDTH                        : 1
   MEM_DDR4_NUM_OF_DIMMS                             : 1
   MEM_DDR4_CHIP_ID_WIDTH                            : 0
   MEM_DDR4_RANKS_PER_DIMM                           : 1
   MEM_DDR4_CKE_PER_DIMM                             : 1
   MEM_DDR4_CK_WIDTH                                 : 1
   MEM_DDR4_ROW_ADDR_WIDTH                           : 16
   MEM_DDR4_COL_ADDR_WIDTH                           : 10
   MEM_DDR4_BANK_ADDR_WIDTH                          : 2
   MEM_DDR4_BANK_GROUP_WIDTH                         : 1
   MEM_DDR4_DM_EN                                    : true
   MEM_DDR4_ALERT_PAR_EN                             : true
   MEM_DDR4_ALERT_N_PLACEMENT_ENUM                   : DDR4_ALERT_N_PLACEMENT_AUTO
   MEM_DDR4_ALERT_N_DQS_GROUP                        : 0
   MEM_DDR4_ALERT_N_AC_LANE                          : 0
   MEM_DDR4_ALERT_N_AC_PIN                           : 0
   MEM_DDR4_DISCRETE_MIRROR_ADDRESSING_EN            : false
   MEM_DDR4_MIRROR_ADDRESSING_EN                     : true
   MEM_DDR4_HIDE_ADV_MR_SETTINGS                     : true
   MEM_DDR4_BL_ENUM                                  : DDR4_BL_BL8
   MEM_DDR4_BT_ENUM                                  : DDR4_BT_SEQUENTIAL
   MEM_DDR4_TCL                                      : 18
   MEM_DDR4_RTT_NOM_ENUM                             : DDR4_RTT_NOM_RZQ_4
   MEM_DDR4_DLL_EN                                   : true
   MEM_DDR4_ATCL_ENUM                                : DDR4_ATCL_DISABLED
   MEM_DDR4_DRV_STR_ENUM                             : DDR4_DRV_STR_RZQ_7
   MEM_DDR4_ASR_ENUM                                 : DDR4_ASR_MANUAL_NORMAL
   MEM_DDR4_RTT_WR_ENUM                              : DDR4_RTT_WR_ODT_DISABLED
   MEM_DDR4_WTCL                                     : 14
   MEM_DDR4_WRITE_CRC                                : false
   MEM_DDR4_GEARDOWN                                 : DDR4_GEARDOWN_HR
   MEM_DDR4_PER_DRAM_ADDR                            : false
   MEM_DDR4_TEMP_SENSOR_READOUT                      : false
   MEM_DDR4_FINE_GRANULARITY_REFRESH                 : DDR4_FINE_REFRESH_FIXED_1X
   MEM_DDR4_MPR_READ_FORMAT                          : DDR4_MPR_READ_FORMAT_SERIAL
   MEM_DDR4_MAX_POWERDOWN                            : false
   MEM_DDR4_TEMP_CONTROLLED_RFSH_RANGE               : DDR4_TEMP_CONTROLLED_RFSH_NORMAL
   MEM_DDR4_TEMP_CONTROLLED_RFSH_ENA                 : false
   MEM_DDR4_INTERNAL_VREFDQ_MONITOR                  : false
   MEM_DDR4_CAL_MODE                                 : 0
   MEM_DDR4_SELF_RFSH_ABORT                          : false
   MEM_DDR4_READ_PREAMBLE_TRAINING                   : false
   MEM_DDR4_READ_PREAMBLE                            : 2
   MEM_DDR4_WRITE_PREAMBLE                           : 1
   MEM_DDR4_AC_PARITY_LATENCY                        : DDR4_AC_PARITY_LATENCY_DISABLE
   MEM_DDR4_ODT_IN_POWERDOWN                         : true
   MEM_DDR4_RTT_PARK                                 : DDR4_RTT_PARK_ODT_DISABLED
   MEM_DDR4_AC_PERSISTENT_ERROR                      : false
   MEM_DDR4_WRITE_DBI                                : false
   MEM_DDR4_READ_DBI                                 : true
   MEM_DDR4_DEFAULT_VREFOUT                          : true
   MEM_DDR4_USER_VREFDQ_TRAINING_VALUE               : 56.0
   MEM_DDR4_USER_VREFDQ_TRAINING_RANGE               : DDR4_VREFDQ_TRAINING_RANGE_1
   MEM_DDR4_RCD_CA_IBT_ENUM                          : DDR4_RCD_CA_IBT_100
   MEM_DDR4_RCD_CS_IBT_ENUM                          : DDR4_RCD_CS_IBT_100
   MEM_DDR4_RCD_CKE_IBT_ENUM                         : DDR4_RCD_CKE_IBT_100
   MEM_DDR4_RCD_ODT_IBT_ENUM                         : DDR4_RCD_ODT_IBT_100
   MEM_DDR4_DB_RTT_NOM_ENUM                          : DDR4_DB_RTT_NOM_ODT_DISABLED
   MEM_DDR4_DB_RTT_WR_ENUM                           : DDR4_DB_RTT_WR_RZQ_3
   MEM_DDR4_DB_RTT_PARK_ENUM                         : DDR4_DB_RTT_PARK_ODT_DISABLED
   MEM_DDR4_DB_DQ_DRV_ENUM                           : DDR4_DB_DRV_STR_RZQ_7
   MEM_DDR4_SPD_137_RCD_CA_DRV                       : 101
   MEM_DDR4_SPD_138_RCD_CK_DRV                       : 5
   MEM_DDR4_SPD_140_DRAM_VREFDQ_R0                   : 29
   MEM_DDR4_SPD_141_DRAM_VREFDQ_R1                   : 29
   MEM_DDR4_SPD_142_DRAM_VREFDQ_R2                   : 29
   MEM_DDR4_SPD_143_DRAM_VREFDQ_R3                   : 29
   MEM_DDR4_SPD_144_DB_VREFDQ                        : 37
   MEM_DDR4_SPD_145_DB_MDQ_DRV                       : 21
   MEM_DDR4_SPD_148_DRAM_DRV                         : 0
   MEM_DDR4_SPD_149_DRAM_RTT_WR_NOM                  : 20
   MEM_DDR4_SPD_152_DRAM_RTT_PARK                    : 39
   MEM_DDR4_SPD_133_RCD_DB_VENDOR_LSB                : 0
   MEM_DDR4_SPD_134_RCD_DB_VENDOR_MSB                : 0
   MEM_DDR4_SPD_135_RCD_REV                          : 0
   MEM_DDR4_SPD_139_DB_REV                           : 0
   MEM_DDR4_LRDIMM_ODT_LESS_BS                       : true
   MEM_DDR4_LRDIMM_ODT_LESS_BS_PARK_OHM              : 240
   MEM_DDR4_DQS_WIDTH                                : 8
   MEM_DDR4_CS_WIDTH                                 : 1
   MEM_DDR4_CS_PER_DIMM                              : 1
   MEM_DDR4_CKE_WIDTH                                : 1
   MEM_DDR4_ODT_WIDTH                                : 1
   MEM_DDR4_ADDR_WIDTH                               : 17
   MEM_DDR4_RM_WIDTH                                 : 0
   MEM_DDR4_NUM_OF_PHYSICAL_RANKS                    : 1
   MEM_DDR4_NUM_OF_LOGICAL_RANKS                     : 1
   MEM_DDR4_IDEAL_VREF_IN_PCT                        : 68.0
   MEM_DDR4_IDEAL_VREF_OUT_PCT                       : 68.0
   MEM_DDR4_VREFDQ_TRAINING_VALUE                    : 68.0
   MEM_DDR4_VREFDQ_TRAINING_RANGE                    : DDR4_VREFDQ_TRAINING_RANGE_1
   MEM_DDR4_VREFDQ_TRAINING_RANGE_DISP               : Range 2 - 45% to 77.5%
   MEM_DDR4_TTL_DQS_WIDTH                            : 8
   MEM_DDR4_TTL_DQ_WIDTH                             : 64
   MEM_DDR4_TTL_CS_WIDTH                             : 1
   MEM_DDR4_TTL_CK_WIDTH                             : 1
   MEM_DDR4_TTL_CKE_WIDTH                            : 1
   MEM_DDR4_TTL_ODT_WIDTH                            : 1
   MEM_DDR4_TTL_BANK_ADDR_WIDTH                      : 2
   MEM_DDR4_TTL_BANK_GROUP_WIDTH                     : 1
   MEM_DDR4_TTL_CHIP_ID_WIDTH                        : 0
   MEM_DDR4_TTL_ADDR_WIDTH                           : 17
   MEM_DDR4_TTL_RM_WIDTH                             : 0
   MEM_DDR4_TTL_NUM_OF_DIMMS                         : 1
   MEM_DDR4_TTL_NUM_OF_PHYSICAL_RANKS                : 1
   MEM_DDR4_TTL_NUM_OF_LOGICAL_RANKS                 : 1
   MEM_DDR4_MR0                                      : 0x840
   MEM_DDR4_MR1                                      : 0x10101
   MEM_DDR4_MR2                                      : 0x20020
   MEM_DDR4_MR3                                      : 0x30200
   MEM_DDR4_MR4                                      : 0x40800
   MEM_DDR4_MR5                                      : 0x51420
   MEM_DDR4_MR6                                      : 0x60863
   MEM_DDR4_RDIMM_CONFIG                             : 
   MEM_DDR4_LRDIMM_EXTENDED_CONFIG                   : 
   MEM_DDR4_ADDRESS_MIRROR_BITVEC                    : 0
   MEM_DDR4_RCD_PARITY_CONTROL_WORD                  : 13
   MEM_DDR4_RCD_COMMAND_LATENCY                      : 1
   MEM_DDR4_USE_DEFAULT_ODT                          : true
   MEM_DDR4_R_ODTN_1X1                               : {Rank 0}
   MEM_DDR4_R_ODT0_1X1                               : off
   MEM_DDR4_W_ODTN_1X1                               : {Rank 0}
   MEM_DDR4_W_ODT0_1X1                               : on
   MEM_DDR4_R_ODTN_2X2                               : {Rank 0} {Rank 1}
   MEM_DDR4_R_ODT0_2X2                               : off off
   MEM_DDR4_R_ODT1_2X2                               : off off
   MEM_DDR4_W_ODTN_2X2                               : {Rank 0} {Rank 1}
   MEM_DDR4_W_ODT0_2X2                               : on off
   MEM_DDR4_W_ODT1_2X2                               : off on
   MEM_DDR4_R_ODTN_4X2                               : {Rank 0} {Rank 1} {Rank 2} {Rank 3}
   MEM_DDR4_R_ODT0_4X2                               : off off on on
   MEM_DDR4_R_ODT1_4X2                               : on on off off
   MEM_DDR4_W_ODTN_4X2                               : {Rank 0} {Rank 1} {Rank 2} {Rank 3}
   MEM_DDR4_W_ODT0_4X2                               : off off on on
   MEM_DDR4_W_ODT1_4X2                               : on on off off
   MEM_DDR4_R_ODTN_4X4                               : {Rank 0} {Rank 1} {Rank 2} {Rank 3}
   MEM_DDR4_R_ODT0_4X4                               : off off on off
   MEM_DDR4_R_ODT1_4X4                               : off off off on
   MEM_DDR4_R_ODT2_4X4                               : on off off off
   MEM_DDR4_R_ODT3_4X4                               : off on off off
   MEM_DDR4_W_ODTN_4X4                               : {Rank 0} {Rank 1} {Rank 2} {Rank 3}
   MEM_DDR4_W_ODT0_4X4                               : on off on off
   MEM_DDR4_W_ODT1_4X4                               : off on off on
   MEM_DDR4_W_ODT2_4X4                               : on off on off
   MEM_DDR4_W_ODT3_4X4                               : off on off on
   MEM_DDR4_R_DERIVED_ODTN                           : {Rank 0} - - -
   MEM_DDR4_R_DERIVED_ODT0                           : {(Drive) RZQ/7 (34 Ohm)} - - -
   MEM_DDR4_R_DERIVED_ODT1                           : - - - -
   MEM_DDR4_R_DERIVED_ODT2                           : - - - -
   MEM_DDR4_R_DERIVED_ODT3                           : - - - -
   MEM_DDR4_W_DERIVED_ODTN                           : {Rank 0} - - -
   MEM_DDR4_W_DERIVED_ODT0                           : {(Nominal) RZQ/4 (60 Ohm)} - - -
   MEM_DDR4_W_DERIVED_ODT1                           : - - - -
   MEM_DDR4_W_DERIVED_ODT2                           : - - - -
   MEM_DDR4_W_DERIVED_ODT3                           : - - - -
   MEM_DDR4_SEQ_ODT_TABLE_LO                         : 4
   MEM_DDR4_SEQ_ODT_TABLE_HI                         : 0
   MEM_DDR4_CTRL_CFG_READ_ODT_CHIP                   : 0
   MEM_DDR4_CTRL_CFG_WRITE_ODT_CHIP                  : 1
   MEM_DDR4_CTRL_CFG_READ_ODT_RANK                   : 0
   MEM_DDR4_CTRL_CFG_WRITE_ODT_RANK                  : 1
   MEM_DDR4_SPEEDBIN_ENUM                            : DDR4_SPEEDBIN_2400
   MEM_DDR4_TIS_PS                                   : 60
   MEM_DDR4_TIS_AC_MV                                : 100
   MEM_DDR4_TIH_PS                                   : 95
   MEM_DDR4_TIH_DC_MV                                : 75
   MEM_DDR4_TDIVW_TOTAL_UI                           : 0.2
   MEM_DDR4_VDIVW_TOTAL                              : 136
   MEM_DDR4_TDQSQ_UI                                 : 0.17
   MEM_DDR4_TQH_UI                                   : 0.74
   MEM_DDR4_TDVWP_UI                                 : 0.72
   MEM_DDR4_TDQSCK_PS                                : 165
   MEM_DDR4_TDQSS_CYC                                : 0.27
   MEM_DDR4_TQSH_CYC                                 : 0.38
   MEM_DDR4_TDSH_CYC                                 : 0.18
   MEM_DDR4_TDSS_CYC                                 : 0.18
   MEM_DDR4_TWLS_CYC                                 : 0.13
   MEM_DDR4_TWLH_CYC                                 : 0.13
   MEM_DDR4_TINIT_US                                 : 500
   MEM_DDR4_TMRD_CK_CYC                              : 8
   MEM_DDR4_TRAS_NS                                  : 32.0
   MEM_DDR4_TRCD_NS                                  : 15.0
   MEM_DDR4_TRP_NS                                   : 15.0
   MEM_DDR4_TREFI_US                                 : 7.8
   MEM_DDR4_TRFC_NS                                  : 350.0
   MEM_DDR4_TWR_NS                                   : 15.0
   MEM_DDR4_TWTR_L_CYC                               : 10
   MEM_DDR4_TWTR_S_CYC                               : 4
   MEM_DDR4_TFAW_NS                                  : 30.0
   MEM_DDR4_TRRD_L_CYC                               : 8
   MEM_DDR4_TRRD_S_CYC                               : 7
   MEM_DDR4_TCCD_L_CYC                               : 6
   MEM_DDR4_TCCD_S_CYC                               : 4
   MEM_DDR4_TRFC_DLR_NS                              : 90.0
   MEM_DDR4_TFAW_DLR_CYC                             : 16
   MEM_DDR4_TRRD_DLR_CYC                             : 4
   MEM_DDR4_TDIVW_DJ_CYC                             : 0.1
   MEM_DDR4_TDQSQ_PS                                 : 66
   MEM_DDR4_TQH_CYC                                  : 0.38
   MEM_DDR4_TINIT_CK                                 : 600000
   MEM_DDR4_TDQSCK_DERV_PS                           : 2
   MEM_DDR4_TDQSCKDS                                 : 450
   MEM_DDR4_TDQSCKDM                                 : 900
   MEM_DDR4_TDQSCKDL                                 : 1200
   MEM_DDR4_TRAS_CYC                                 : 39
   MEM_DDR4_TRCD_CYC                                 : 18
   MEM_DDR4_TRP_CYC                                  : 18
   MEM_DDR4_TRFC_CYC                                 : 420
   MEM_DDR4_TWR_CYC                                  : 18
   MEM_DDR4_TRTP_CYC                                 : 9
   MEM_DDR4_TFAW_CYC                                 : 36
   MEM_DDR4_TREFI_CYC                                : 9360
   MEM_DDR4_WRITE_CMD_LATENCY                        : 5
   MEM_DDR4_TRFC_DLR_CYC                             : 108
   MEM_DDR4_CFG_GEN_SBE                              : false
   MEM_DDR4_CFG_GEN_DBE                              : false
   MEM_DDR4_LRDIMM_VREFDQ_VALUE                      : 
   MEM_DDR4_TWLS_PS                                  : 0.0
   MEM_DDR4_TWLH_PS                                  : 0.0
   BOARD_DDR4_USE_DEFAULT_SLEW_RATES                 : true
   BOARD_DDR4_USE_DEFAULT_ISI_VALUES                 : true
   BOARD_DDR4_USER_CK_SLEW_RATE                      : 4.0
   BOARD_DDR4_USER_AC_SLEW_RATE                      : 2.0
   BOARD_DDR4_USER_RCLK_SLEW_RATE                    : 8.0
   BOARD_DDR4_USER_WCLK_SLEW_RATE                    : 4.0
   BOARD_DDR4_USER_RDATA_SLEW_RATE                   : 4.0
   BOARD_DDR4_USER_WDATA_SLEW_RATE                   : 2.0
   BOARD_DDR4_USER_AC_ISI_NS                         : 0.17
   BOARD_DDR4_USER_RCLK_ISI_NS                       : 0.17
   BOARD_DDR4_USER_WCLK_ISI_NS                       : 0.06
   BOARD_DDR4_USER_RDATA_ISI_NS                      : 0.12
   BOARD_DDR4_USER_WDATA_ISI_NS                      : 0.13
   BOARD_DDR4_IS_SKEW_WITHIN_DQS_DESKEWED            : true
   BOARD_DDR4_BRD_SKEW_WITHIN_DQS_NS                 : 0.02
   BOARD_DDR4_PKG_BRD_SKEW_WITHIN_DQS_NS             : 0.02
   BOARD_DDR4_IS_SKEW_WITHIN_AC_DESKEWED             : true
   BOARD_DDR4_BRD_SKEW_WITHIN_AC_NS                  : 0.02
   BOARD_DDR4_PKG_BRD_SKEW_WITHIN_AC_NS              : 0.02
   BOARD_DDR4_DQS_TO_CK_SKEW_NS                      : 0.02
   BOARD_DDR4_SKEW_BETWEEN_DIMMS_NS                  : 0.05
   BOARD_DDR4_SKEW_BETWEEN_DQS_NS                    : 0.02
   BOARD_DDR4_AC_TO_CK_SKEW_NS                       : 0.0
   BOARD_DDR4_MAX_CK_DELAY_NS                        : 0.6
   BOARD_DDR4_MAX_DQS_DELAY_NS                       : 0.6
   BOARD_DDR4_TIS_DERATING_PS                        : 0
   BOARD_DDR4_TIH_DERATING_PS                        : 0
   BOARD_DDR4_CK_SLEW_RATE                           : 4.0
   BOARD_DDR4_AC_SLEW_RATE                           : 2.0
   BOARD_DDR4_RCLK_SLEW_RATE                         : 8.0
   BOARD_DDR4_WCLK_SLEW_RATE                         : 4.0
   BOARD_DDR4_RDATA_SLEW_RATE                        : 4.0
   BOARD_DDR4_WDATA_SLEW_RATE                        : 2.0
   BOARD_DDR4_AC_ISI_NS                              : 0.15
   BOARD_DDR4_RCLK_ISI_NS                            : 0.15
   BOARD_DDR4_WCLK_ISI_NS                            : 0.038
   BOARD_DDR4_RDATA_ISI_NS                           : 0.075
   BOARD_DDR4_WDATA_ISI_NS                           : 0.09
   BOARD_DDR4_SKEW_WITHIN_DQS_NS                     : 0.02
   BOARD_DDR4_SKEW_WITHIN_AC_NS                      : 0.02
   CTRL_ECC_EN                                       : false
   CTRL_MMR_EN                                       : false
   CTRL_AUTO_PRECHARGE_EN                            : false
   CTRL_USER_PRIORITY_EN                             : false
   CTRL_REORDER_EN                                   : true
   CTRL_ECC_READDATAERROR_EN                         : false
   CTRL_DDR4_AVL_PROTOCOL_ENUM                       : CTRL_AVL_PROTOCOL_MM
   CTRL_DDR4_SELF_REFRESH_EN                         : false
   CTRL_DDR4_AUTO_POWER_DOWN_EN                      : false
   CTRL_DDR4_AUTO_POWER_DOWN_CYCS                    : 32
   CTRL_DDR4_USER_REFRESH_EN                         : false
   CTRL_DDR4_USER_PRIORITY_EN                        : false
   CTRL_DDR4_AUTO_PRECHARGE_EN                       : false
   CTRL_DDR4_ADDR_ORDER_ENUM                         : DDR4_CTRL_ADDR_ORDER_CS_R_B_C_BG
   CTRL_DDR4_ECC_EN                                  : false
   CTRL_DDR4_ECC_AUTO_CORRECTION_EN                  : false
   CTRL_DDR4_ECC_READDATAERROR_EN                    : false
   CTRL_DDR4_REORDER_EN                              : true
   CTRL_DDR4_STARVE_LIMIT                            : 10
   CTRL_DDR4_MMR_EN                                  : false
   CTRL_DDR4_RD_TO_WR_SAME_CHIP_DELTA_CYCS           : 0
   CTRL_DDR4_WR_TO_RD_SAME_CHIP_DELTA_CYCS           : 0
   CTRL_DDR4_RD_TO_RD_DIFF_CHIP_DELTA_CYCS           : 0
   CTRL_DDR4_RD_TO_WR_DIFF_CHIP_DELTA_CYCS           : 0
   CTRL_DDR4_WR_TO_WR_DIFF_CHIP_DELTA_CYCS           : 0
   CTRL_DDR4_WR_TO_RD_DIFF_CHIP_DELTA_CYCS           : 0
   DIAG_SIM_REGTEST_MODE                             : false
   DIAG_TIMING_REGTEST_MODE                          : false
   DIAG_SYNTH_FOR_SIM                                : false
   DIAG_FAST_SIM_OVERRIDE                            : FAST_SIM_OVERRIDE_DEFAULT
   DIAG_SEQ_RESET_AUTO_RELEASE                       : avl
   DIAG_DB_RESET_AUTO_RELEASE                        : avl_release
   DIAG_VERBOSE_IOAUX                                : false
   DIAG_ECLIPSE_DEBUG                                : false
   DIAG_EXPORT_VJI                                   : false
   DIAG_ENABLE_JTAG_UART                             : false
   DIAG_ENABLE_JTAG_UART_HEX                         : false
   DIAG_ENABLE_HPS_EMIF_DEBUG                        : false
   DIAG_SOFT_NIOS_MODE                               : SOFT_NIOS_MODE_DISABLED
   DIAG_SOFT_NIOS_CLOCK_FREQUENCY                    : 100
   DIAG_USE_RS232_UART                               : false
   DIAG_RS232_UART_BAUDRATE                          : 57600
   DIAG_EX_DESIGN_ADD_TEST_EMIFS                     : 
   DIAG_EX_DESIGN_SEPARATE_RESETS                    : false
   DIAG_EXPOSE_DFT_SIGNALS                           : false
   DIAG_EXTRA_CONFIGS                                : 
   DIAG_USE_BOARD_DELAY_MODEL                        : false
   DIAG_BOARD_DELAY_CONFIG_STR                       : 
   DIAG_TG_AVL_2_EXPORT_CFG_INTERFACE                : false
   DIAG_TG_AVL_2_NUM_CFG_INTERFACES                  : 0
   DIAG_EXPORT_PLL_REF_CLK_OUT                       : false
   DIAG_EXPORT_PLL_LOCKED                            : false
   DIAG_HMC_HRC                                      : auto
   SHORT_QSYS_INTERFACE_NAMES                        : true
   DIAG_EXT_DOCS                                     : false
   DIAG_SIM_CAL_MODE_ENUM                            : SIM_CAL_MODE_SKIP
   DIAG_EXPORT_SEQ_AVALON_SLAVE                      : CAL_DEBUG_EXPORT_MODE_DISABLED
   DIAG_EXPORT_SEQ_AVALON_MASTER                     : false
   DIAG_EXPORT_SEQ_AVALON_HEAD_OF_CHAIN              : true
   DIAG_EX_DESIGN_NUM_OF_SLAVES                      : 1
   DIAG_EX_DESIGN_ISSP_EN                            : true
   DIAG_INTERFACE_ID                                 : 0
   DIAG_EFFICIENCY_MONITOR                           : EFFMON_MODE_DISABLED
   DIAG_SIM_VERBOSE_LEVEL                            : 5
   DIAG_FAST_SIM                                     : true
   DIAG_USE_TG_AVL_2                                 : false
   DIAG_INFI_TG2_ERR_TEST                            : false
   DIAG_USE_ABSTRACT_PHY                             : false
   DIAG_TG_DATA_PATTERN_LENGTH                       : 8
   DIAG_TG_BE_PATTERN_LENGTH                         : 8
   DIAG_BYPASS_DEFAULT_PATTERN                       : false
   DIAG_BYPASS_USER_STAGE                            : true
   DIAG_BYPASS_REPEAT_STAGE                          : true
   DIAG_BYPASS_STRESS_STAGE                          : true
   DIAG_ENABLE_SOFT_M20K                             : true
   DIAG_SIM_CHECKER_SKIP_TG                          : false
   DIAG_DISABLE_AFI_P2C_REGISTERS                    : false
   DIAG_EX_DESIGN_SEPARATE_RZQS                      : true
   DIAG_DDR4_SIM_CAL_MODE_ENUM                       : SIM_CAL_MODE_SKIP
   DIAG_DDR4_EXPORT_SEQ_AVALON_SLAVE                 : CAL_DEBUG_EXPORT_MODE_DISABLED
   DIAG_DDR4_EXPORT_SEQ_AVALON_MASTER                : false
   DIAG_DDR4_EXPORT_SEQ_AVALON_HEAD_OF_CHAIN         : true
   DIAG_DDR4_EX_DESIGN_NUM_OF_SLAVES                 : 1
   DIAG_DDR4_EX_DESIGN_ISSP_EN                       : true
   DIAG_DDR4_INTERFACE_ID                            : 0
   DIAG_DDR4_EFFICIENCY_MONITOR                      : EFFMON_MODE_DISABLED
   DIAG_DDR4_SIM_VERBOSE                             : true
   DIAG_DDR4_USE_TG_AVL_2                            : false
   DIAG_DDR4_ABSTRACT_PHY                            : false
   DIAG_DDR4_BYPASS_DEFAULT_PATTERN                  : false
   DIAG_DDR4_BYPASS_USER_STAGE                       : true
   DIAG_DDR4_BYPASS_REPEAT_STAGE                     : true
   DIAG_DDR4_BYPASS_STRESS_STAGE                     : true
   DIAG_DDR4_INFI_TG2_ERR_TEST                       : false
   DIAG_DDR4_TG_DATA_PATTERN_LENGTH                  : 8
   DIAG_DDR4_TG_BE_PATTERN_LENGTH                    : 8
   DIAG_DDR4_SEPARATE_READ_WRITE_ITFS                : false
   DIAG_DDR4_DISABLE_AFI_P2C_REGISTERS               : false
   DIAG_DDR4_EX_DESIGN_SEPARATE_RZQS                 : true
   DIAG_DDR4_SKIP_CA_LEVEL                           : false
   DIAG_DDR4_SKIP_CA_DESKEW                          : false
   DIAG_DDR4_SKIP_VREF_CAL                           : false
   DIAG_DDR4_CAL_ADDR0                               : 0
   DIAG_DDR4_CAL_ADDR1                               : 8
   DIAG_DDR4_CAL_ENABLE_NON_DES                      : false
   DIAG_DDR4_CAL_FULL_CAL_ON_RESET                   : true
   EX_DESIGN_GUI_GEN_SIM                             : true
   EX_DESIGN_GUI_GEN_SYNTH                           : true
   EX_DESIGN_GUI_TARGET_DEV_KIT                      : TARGET_DEV_KIT_NONE
   EX_DESIGN_GUI_PREV_PRESET                         : TARGET_DEV_KIT_NONE
   EX_DESIGN_GUI_DDR4_SEL_DESIGN                     : AVAIL_EX_DESIGNS_GEN_DESIGN
   EX_DESIGN_GUI_DDR4_GEN_SIM                        : true
   EX_DESIGN_GUI_DDR4_GEN_SYNTH                      : true
   EX_DESIGN_GUI_DDR4_HDL_FORMAT                     : HDL_FORMAT_VERILOG
   EX_DESIGN_GUI_DDR4_TARGET_DEV_KIT                 : TARGET_DEV_KIT_NONE
   EX_DESIGN_GUI_DDR4_PREV_PRESET                    : TARGET_DEV_KIT_NONE


------------------------------------------
;  23. Configuring the Traffic Generator ;
------------------------------------------

   The EMIF traffic generator is a built-in verification solution for the EMIF IP.
   The default traffic generator performs random reads and writes in order to stress
   the memory interface. A new configurable traffic generator is also available for
   more complex testing and debugging. Both traffic generators can be instantiated as
   part of the EMIF IP.
   
   The Configurable Traffic Generator 2.0 (CTG2) has many configuration options. These
   include options in read/write command, address, data and data-mask generation. CTG2
   can be used in simulation and hardware verification.
   
   For full details concerning the traffic generator, including the new Configurable
   Traffic Generator 2.0, please consult Volume 3 of the EMIF Handbook.


