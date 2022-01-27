	component in_system_source_probe is
		port (
			source     : out std_logic_vector(4 downto 0);                    -- source
			source_clk : in  std_logic                    := 'X';             -- clk
			probe      : in  std_logic_vector(2 downto 0) := (others => 'X')  -- probe
		);
	end component in_system_source_probe;

	u0 : component in_system_source_probe
		port map (
			source     => CONNECTED_TO_source,     --    sources.source
			source_clk => CONNECTED_TO_source_clk, -- source_clk.clk
			probe      => CONNECTED_TO_probe       --     probes.probe
		);

