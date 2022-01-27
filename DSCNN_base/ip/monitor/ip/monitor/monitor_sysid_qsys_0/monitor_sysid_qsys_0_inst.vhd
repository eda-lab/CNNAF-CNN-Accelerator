	component monitor_sysid_qsys_0 is
		port (
			clock    : in  std_logic                     := 'X'; -- clk
			reset_n  : in  std_logic                     := 'X'; -- reset_n
			readdata : out std_logic_vector(31 downto 0);        -- readdata
			address  : in  std_logic                     := 'X'  -- address
		);
	end component monitor_sysid_qsys_0;

	u0 : component monitor_sysid_qsys_0
		port map (
			clock    => CONNECTED_TO_clock,    --           clk.clk
			reset_n  => CONNECTED_TO_reset_n,  --         reset.reset_n
			readdata => CONNECTED_TO_readdata, -- control_slave.readdata
			address  => CONNECTED_TO_address   --              .address
		);

