	component monitor is
		port (
			clk_clk               : in    std_logic                     := 'X';             -- clk
			reset_reset_n         : in    std_logic                     := 'X';             -- reset_n
			led_export            : out   std_logic_vector(1 downto 0);                     -- export
			pio_in_export         : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
			pio_out_export        : out   std_logic_vector(31 downto 0);                    -- export
			power_temp_scl_export : out   std_logic;                                        -- export
			power_temp_sda_export : inout std_logic                     := 'X'              -- export
		);
	end component monitor;

	u0 : component monitor
		port map (
			clk_clk               => CONNECTED_TO_clk_clk,               --            clk.clk
			reset_reset_n         => CONNECTED_TO_reset_reset_n,         --          reset.reset_n
			led_export            => CONNECTED_TO_led_export,            --            led.export
			pio_in_export         => CONNECTED_TO_pio_in_export,         --         pio_in.export
			pio_out_export        => CONNECTED_TO_pio_out_export,        --        pio_out.export
			power_temp_scl_export => CONNECTED_TO_power_temp_scl_export, -- power_temp_scl.export
			power_temp_sda_export => CONNECTED_TO_power_temp_sda_export  -- power_temp_sda.export
		);

