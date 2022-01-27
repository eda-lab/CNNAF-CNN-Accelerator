	component nios_qsys_nios2_gen2_0 is
		port (
			clk                                 : in  std_logic                     := 'X';             -- clk
			reset_n                             : in  std_logic                     := 'X';             -- reset_n
			reset_req                           : in  std_logic                     := 'X';             -- reset_req
			d_address                           : out std_logic_vector(16 downto 0);                    -- address
			d_byteenable                        : out std_logic_vector(3 downto 0);                     -- byteenable
			d_read                              : out std_logic;                                        -- read
			d_readdata                          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			d_waitrequest                       : in  std_logic                     := 'X';             -- waitrequest
			d_write                             : out std_logic;                                        -- write
			d_writedata                         : out std_logic_vector(31 downto 0);                    -- writedata
			d_readdatavalid                     : in  std_logic                     := 'X';             -- readdatavalid
			debug_mem_slave_debugaccess_to_roms : out std_logic;                                        -- debugaccess
			i_address                           : out std_logic_vector(16 downto 0);                    -- address
			i_read                              : out std_logic;                                        -- read
			i_readdata                          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			i_waitrequest                       : in  std_logic                     := 'X';             -- waitrequest
			i_readdatavalid                     : in  std_logic                     := 'X';             -- readdatavalid
			irq                                 : in  std_logic_vector(31 downto 0) := (others => 'X'); -- irq
			debug_reset_request                 : out std_logic;                                        -- reset
			debug_mem_slave_address             : in  std_logic_vector(8 downto 0)  := (others => 'X'); -- address
			debug_mem_slave_byteenable          : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			debug_mem_slave_debugaccess         : in  std_logic                     := 'X';             -- debugaccess
			debug_mem_slave_read                : in  std_logic                     := 'X';             -- read
			debug_mem_slave_readdata            : out std_logic_vector(31 downto 0);                    -- readdata
			debug_mem_slave_waitrequest         : out std_logic;                                        -- waitrequest
			debug_mem_slave_write               : in  std_logic                     := 'X';             -- write
			debug_mem_slave_writedata           : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			dummy_ci_port                       : out std_logic                                         -- readra
		);
	end component nios_qsys_nios2_gen2_0;

	u0 : component nios_qsys_nios2_gen2_0
		port map (
			clk                                 => CONNECTED_TO_clk,                                 --                       clk.clk
			reset_n                             => CONNECTED_TO_reset_n,                             --                     reset.reset_n
			reset_req                           => CONNECTED_TO_reset_req,                           --                          .reset_req
			d_address                           => CONNECTED_TO_d_address,                           --               data_master.address
			d_byteenable                        => CONNECTED_TO_d_byteenable,                        --                          .byteenable
			d_read                              => CONNECTED_TO_d_read,                              --                          .read
			d_readdata                          => CONNECTED_TO_d_readdata,                          --                          .readdata
			d_waitrequest                       => CONNECTED_TO_d_waitrequest,                       --                          .waitrequest
			d_write                             => CONNECTED_TO_d_write,                             --                          .write
			d_writedata                         => CONNECTED_TO_d_writedata,                         --                          .writedata
			d_readdatavalid                     => CONNECTED_TO_d_readdatavalid,                     --                          .readdatavalid
			debug_mem_slave_debugaccess_to_roms => CONNECTED_TO_debug_mem_slave_debugaccess_to_roms, --                          .debugaccess
			i_address                           => CONNECTED_TO_i_address,                           --        instruction_master.address
			i_read                              => CONNECTED_TO_i_read,                              --                          .read
			i_readdata                          => CONNECTED_TO_i_readdata,                          --                          .readdata
			i_waitrequest                       => CONNECTED_TO_i_waitrequest,                       --                          .waitrequest
			i_readdatavalid                     => CONNECTED_TO_i_readdatavalid,                     --                          .readdatavalid
			irq                                 => CONNECTED_TO_irq,                                 --                       irq.irq
			debug_reset_request                 => CONNECTED_TO_debug_reset_request,                 --       debug_reset_request.reset
			debug_mem_slave_address             => CONNECTED_TO_debug_mem_slave_address,             --           debug_mem_slave.address
			debug_mem_slave_byteenable          => CONNECTED_TO_debug_mem_slave_byteenable,          --                          .byteenable
			debug_mem_slave_debugaccess         => CONNECTED_TO_debug_mem_slave_debugaccess,         --                          .debugaccess
			debug_mem_slave_read                => CONNECTED_TO_debug_mem_slave_read,                --                          .read
			debug_mem_slave_readdata            => CONNECTED_TO_debug_mem_slave_readdata,            --                          .readdata
			debug_mem_slave_waitrequest         => CONNECTED_TO_debug_mem_slave_waitrequest,         --                          .waitrequest
			debug_mem_slave_write               => CONNECTED_TO_debug_mem_slave_write,               --                          .write
			debug_mem_slave_writedata           => CONNECTED_TO_debug_mem_slave_writedata,           --                          .writedata
			dummy_ci_port                       => CONNECTED_TO_dummy_ci_port                        -- custom_instruction_master.readra
		);

