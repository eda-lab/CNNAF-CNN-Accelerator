----------------------------------------------------------------------------------
-- Update: 2017-02-21
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------------------------------------------------------------
entity reset_sync_block is
port(
	clk 				: in 	std_logic;	
	rst_n_in 			: in 	std_logic;
	rst_n_out			: out   std_logic
);
end reset_sync_block;
----------------------------------------------------------------------------------
	
architecture behave of reset_sync_block is

----------------------------------------------------------------------------------
-- signal 
	signal sync_rst0  	: 	std_logic;
	signal sync_rst1 	: 	std_logic;
----------------------------------------------------------------------------------

begin

----------------------------------------------------------------------------------
	-- reset sync to signal_gen_clk domain
	process(rst_n_in,clk)
	begin
		if(rst_n_in = '0')then	
			sync_rst0 <= '0';
			sync_rst1 <= '0';
		elsif(rising_edge(clk))then
			sync_rst0 <= '1';
			sync_rst1 <= sync_rst0;
		end if;
	end process;
	
	rst_n_out <= sync_rst1;
----------------------------------------------------------------------------------

end behave;

----------------------------------------------------------------------------------