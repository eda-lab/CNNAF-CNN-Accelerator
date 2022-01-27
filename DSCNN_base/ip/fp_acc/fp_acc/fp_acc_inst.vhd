	component fp_acc is
		port (
			clk    : in  std_logic                     := 'X';             -- clk
			areset : in  std_logic                     := 'X';             -- reset
			x      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- x
			n      : in  std_logic                     := 'X';             -- n
			r      : out std_logic_vector(31 downto 0);                    -- r
			xo     : out std_logic;                                        -- xo
			xu     : out std_logic;                                        -- xu
			ao     : out std_logic;                                        -- ao
			en     : in  std_logic_vector(0 downto 0)  := (others => 'X')  -- en
		);
	end component fp_acc;

	u0 : component fp_acc
		port map (
			clk    => CONNECTED_TO_clk,    --    clk.clk
			areset => CONNECTED_TO_areset, -- areset.reset
			x      => CONNECTED_TO_x,      --      x.x
			n      => CONNECTED_TO_n,      --      n.n
			r      => CONNECTED_TO_r,      --      r.r
			xo     => CONNECTED_TO_xo,     --     xo.xo
			xu     => CONNECTED_TO_xu,     --     xu.xu
			ao     => CONNECTED_TO_ao,     --     ao.ao
			en     => CONNECTED_TO_en      --     en.en
		);

