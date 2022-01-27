create_clock -period 125Mhz [get_ports {A10_SYSCLK_125MHZ}]
create_clock -period 300Mhz [get_ports {pll0_ref_clk}]
create_clock -name {altera_reserved_tck} -period 50 [get_ports { altera_reserved_tck }]

derive_pll_clocks
derive_clock_uncertainty

# False Paths
set_clock_groups -exclusive -group [get_clocks {altera_reserved_tck}]
set_clock_groups -exclusive -group [get_clocks {A10_SYSCLK_125MHZ}]
set_clock_groups -exclusive -group [get_clocks {inst0_system_clk_reset_block|inst0_iopll|iopll_0|outclk0}]
set_clock_groups -exclusive -group [get_clocks {inst0_system_clk_reset_block|inst0_iopll|iopll_0|outclk1}]
set_clock_groups -exclusive -group [get_clocks {inst0_system_clk_reset_block|inst0_iopll|iopll_0|outclk2}]