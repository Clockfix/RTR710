library ieee;
use ieee.std_logic_1164.all;
use work.data_types.all;
use work.functions.all;

package components is
	component pipeline_tree_adder is
	generic(
		ARRAY_SIZE   : natural;
		DATA_WIDTH   : natural :=8
	);
	port(
		clk        : in std_logic;
		enable     : in std_logic;
		data_in    : in aslv(0 to ARRAY_SIZE-1)(DATA_WIDTH-1 downto 0);
		data_out   : out std_logic_vector(DATA_WIDTH+log2c(ARRAY_SIZE)-1 downto 0)
	);
	end component;
	
	component delay_sl is
	generic(
		DELAY_COUNT    : natural := 17
	);
	port(
		clk        : in std_logic;
		enable     : in std_logic;
		data_in    : in std_logic;
		data_out   : out std_logic
	);
	end component;
end package;

package body components is
end package body;