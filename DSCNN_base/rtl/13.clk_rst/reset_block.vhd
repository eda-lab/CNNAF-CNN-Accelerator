----------------------------------------------------------------------------------
-- Update: 2017-02-21
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------------------------------------------------------------
entity reset_block is
port(
	clk 		: in 	std_logic;
	en			: in	std_logic;
    rst_n		: out   std_logic;
	rst_p		: out   std_logic
);
end reset_block;
----------------------------------------------------------------------------------

architecture behave of reset_block is

----------------------------------------------------------------------------------
	signal counter	: 	std_logic_vector(15 downto 0) := x"0000";
	signal rst_i	:	std_logic;
----------------------------------------------------------------------------------

begin

----------------------------------------------------------------------------------
	process(clk,en)
	begin
		if(en = '0')then
			counter <= (others => '0');
		elsif(rising_edge(clk))then
			if(counter = x"ffff")then
				counter <= counter;
			else
				counter <= counter  + '1';
			end if;
		end if;
	end process;
	
	process(clk,en)
	begin
		if(en  = '0')then
			rst_i <= '0';
		elsif(rising_edge(clk))then
			if(counter = x"ffff")then
				rst_i <= '1';
			else
				rst_i <= '0';
			end if;
		end if;
	end process;
	
	-- Low level reset signal
	rst_n <= rst_i;
	-- High level reset signal
	rst_p <= not rst_i;
----------------------------------------------------------------------------------

end behave;

----------------------------------------------------------------------------------