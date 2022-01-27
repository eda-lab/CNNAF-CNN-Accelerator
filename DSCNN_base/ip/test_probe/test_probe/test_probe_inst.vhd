	component test_probe is
		port (
			source : out std_logic_vector(0 downto 0);                      -- source
			probe  : in  std_logic_vector(510 downto 0) := (others => 'X')  -- probe
		);
	end component test_probe;

	u0 : component test_probe
		port map (
			source => CONNECTED_TO_source, -- sources.source
			probe  => CONNECTED_TO_probe   --  probes.probe
		);

