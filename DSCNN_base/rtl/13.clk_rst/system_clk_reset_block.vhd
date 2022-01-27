----------------------------------------------------------------------------------
-- Update: 2017-02-21
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------------------------------------------------------------
entity system_clk_reset_block is
port(
	sys_clk						: in		std_logic;
	hard_resetn				    : in		std_logic;
	
	hard_reset_n				: out		std_logic;
	hard_reset_p				: out		std_logic;
	sys_pll_clkout0				: out		std_logic;
	sys_pll_clkout0_reset_n		: out		std_logic;

	sys_pll_locked				: out		std_logic
);
end system_clk_reset_block;
----------------------------------------------------------------------------------

architecture behave of system_clk_reset_block is

----------------------------------------------------------------------------------
    --component a10_fpll is
    --    port (
    --        pll_refclk0   		: in  std_logic := 'X'; 
    --        pll_powerdown 		: in  std_logic := 'X'; 
    --        pll_locked    		: out std_logic;        
    --        pll_cal_busy  		: out std_logic;        
    --        outclk0       		: out std_logic         
    --    );
    --end component a10_fpll;
	
    component a10_iopll is
        port (
            locked   			: out std_logic;        
            outclk_0 			: out std_logic;        
            refclk   			: in  std_logic := 'X'; 
            rst      			: in  std_logic := 'X'  
        );
    end component a10_iopll;
	
	component reset_block is
		port (
			clk 				: in  std_logic;
		    en					: in  std_logic;
		    rst_n				: out std_logic;
		    rst_p				: out std_logic
		);		
	end component reset_block;
	
	component reset_sync_block is
		port (	
			clk 				: in  std_logic;	
			rst_n_in 			: in  std_logic;	
			rst_n_out			: out std_logic
		);
	end component reset_sync_block;	

	signal hard_reset_in_sync	: 	std_logic;
	signal sig_hard_reset_n		: 	std_logic;
	signal sig_hard_reset_p		: 	std_logic;
	signal pll_locked			:	std_logic;
	signal sig_sys_pll_clkout0	:	std_logic;
----------------------------------------------------------------------------------

begin

----------------------------------------------------------------------------------
-- system clock and reset
----------------------------------------------------------------------------------
	inst0_reset_sync_block: component reset_sync_block
	port map (
		clk 			=>	sys_clk,
		rst_n_in 		=>	hard_resetn,
		rst_n_out		=>	hard_reset_in_sync
	);
	
	inst0_reset_block: component reset_block
	port map (
		clk 			=>  sys_clk,
	    en				=>  hard_reset_in_sync,
	    rst_n       	=>  sig_hard_reset_n,
	    rst_p       	=>  sig_hard_reset_p
	);
	
	inst0_a10_iopll: component a10_iopll
	port map (
		refclk         	=>  sys_clk,
		rst            	=>  sig_hard_reset_p,
		outclk_0       	=>  sig_sys_pll_clkout0,
		locked  		=>  pll_locked
	);
	
	--inst0_a10_fpll: component a10_fpll
	--port map (
	--	pll_refclk0   	=> 	sys_clk,
	--	pll_powerdown 	=> 	sig_hard_reset_p,
	--	pll_locked    	=> 	pll_locked,
	--	pll_cal_busy  	=> 	open,
	--	outclk0       	=> 	sys_pll_clkout0
	--);
	
	inst1_reset_sync_block: component reset_sync_block
	port map (
		clk 			=>	sig_sys_pll_clkout0,
		rst_n_in 		=>	pll_locked,
		rst_n_out		=>	sys_pll_clkout0_reset_n
	);
	
	hard_reset_n	<= sig_hard_reset_n;
	hard_reset_p    <= sig_hard_reset_p;
	sys_pll_locked	<= pll_locked;
	sys_pll_clkout0 <= sig_sys_pll_clkout0;
----------------------------------------------------------------------------------

end behave;

----------------------------------------------------------------------------------