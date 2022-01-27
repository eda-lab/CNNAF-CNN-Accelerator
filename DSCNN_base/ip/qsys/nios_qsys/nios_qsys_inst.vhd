	component nios_qsys is
		port (
			calc_data_export       : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
			calc_finish_export     : in    std_logic                     := 'X';             -- export
			calc_fps_export        : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
			calc_unit_total_export : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
			calc_unit_used_export  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
			clk_clk                : in    std_logic                     := 'X';             -- clk
			data_addr_export       : out   std_logic_vector(31 downto 0);                    -- export
			power_temp_scl_export  : out   std_logic;                                        -- export
			power_temp_sda_export  : inout std_logic                     := 'X';             -- export
			reset_reset            : in    std_logic                     := 'X';             -- reset
			unused_ddrvld_export   : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
			used_ddrvld_export     : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
			wr_ddrvld_export       : in    std_logic_vector(31 downto 0) := (others => 'X')  -- export
		);
	end component nios_qsys;

	u0 : component nios_qsys
		port map (
			calc_data_export       => CONNECTED_TO_calc_data_export,       --       calc_data.export
			calc_finish_export     => CONNECTED_TO_calc_finish_export,     --     calc_finish.export
			calc_fps_export        => CONNECTED_TO_calc_fps_export,        --        calc_fps.export
			calc_unit_total_export => CONNECTED_TO_calc_unit_total_export, -- calc_unit_total.export
			calc_unit_used_export  => CONNECTED_TO_calc_unit_used_export,  --  calc_unit_used.export
			clk_clk                => CONNECTED_TO_clk_clk,                --             clk.clk
			data_addr_export       => CONNECTED_TO_data_addr_export,       --       data_addr.export
			power_temp_scl_export  => CONNECTED_TO_power_temp_scl_export,  --  power_temp_scl.export
			power_temp_sda_export  => CONNECTED_TO_power_temp_sda_export,  --  power_temp_sda.export
			reset_reset            => CONNECTED_TO_reset_reset,            --           reset.reset
			unused_ddrvld_export   => CONNECTED_TO_unused_ddrvld_export,   --   unused_ddrvld.export
			used_ddrvld_export     => CONNECTED_TO_used_ddrvld_export,     --     used_ddrvld.export
			wr_ddrvld_export       => CONNECTED_TO_wr_ddrvld_export        --       wr_ddrvld.export
		);

