	component monitor_power_temp_scl is
		port (
			clk        : in  std_logic                     := 'X';             -- clk
			reset_n    : in  std_logic                     := 'X';             -- reset_n
			address    : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			write_n    : in  std_logic                     := 'X';             -- write_n
			writedata  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			chipselect : in  std_logic                     := 'X';             -- chipselect
			readdata   : out std_logic_vector(31 downto 0);                    -- readdata
			out_port   : out std_logic                                         -- export
		);
	end component monitor_power_temp_scl;

	u0 : component monitor_power_temp_scl
		port map (
			clk        => CONNECTED_TO_clk,        --                 clk.clk
			reset_n    => CONNECTED_TO_reset_n,    --               reset.reset_n
			address    => CONNECTED_TO_address,    --                  s1.address
			write_n    => CONNECTED_TO_write_n,    --                    .write_n
			writedata  => CONNECTED_TO_writedata,  --                    .writedata
			chipselect => CONNECTED_TO_chipselect, --                    .chipselect
			readdata   => CONNECTED_TO_readdata,   --                    .readdata
			out_port   => CONNECTED_TO_out_port    -- external_connection.export
		);

