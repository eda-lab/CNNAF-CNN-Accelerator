	component nios_qsys_pio_7 is
		port (
			clk      : in  std_logic                     := 'X';             -- clk
			reset_n  : in  std_logic                     := 'X';             -- reset_n
			address  : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			readdata : out std_logic_vector(31 downto 0);                    -- readdata
			in_port  : in  std_logic_vector(31 downto 0) := (others => 'X')  -- export
		);
	end component nios_qsys_pio_7;

	u0 : component nios_qsys_pio_7
		port map (
			clk      => CONNECTED_TO_clk,      --                 clk.clk
			reset_n  => CONNECTED_TO_reset_n,  --               reset.reset_n
			address  => CONNECTED_TO_address,  --                  s1.address
			readdata => CONNECTED_TO_readdata, --                    .readdata
			in_port  => CONNECTED_TO_in_port   -- external_connection.export
		);

