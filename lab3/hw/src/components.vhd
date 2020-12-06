-- synopsis directives:
-- synthesis VHDL_INPUT_VERSION VHDL_2008

library ieee;
use ieee.std_logic_1164.all,
	work.data_types.all;

package components is
    component delay_std_logic is
	generic
	(
		DELAY_COUNT : natural := 1
	);
	port
	(
		clk     : in  std_logic;
		reset   : in  std_logic;
		enable  : in  std_logic;
		sig_in  : in  std_logic;
		sig_out : out std_logic
	);
    end component;

    component parallel_output is
    generic(
        DATA_WIDTH  : natural := 8;
        VECTOR_SIZE : natural := 3
    );
    port(
        clk           : in std_logic;
        reset         : in std_logic;
        enable        : in std_logic;
        data_in       : in std_logic_vector(DATA_WIDTH-1 downto 0);
        data_out      : out aslv(0 to VECTOR_SIZE-1)(DATA_WIDTH-1 downto 0)
    );
    end component;

    component image_darkener is
    generic(
        DARKENER_CONSTANT : natural := 20
    );
    port(
        clk           : in std_logic;
        reset         : in std_logic;
        -- Avalon-ST (input)
        ast_in_valid  : in  std_logic;
        ast_in_data   : in  std_logic_vector(7 downto 0);
        ast_in_ready  : out std_logic;
        -- Avalon-ST (output)
        ast_out_valid : out std_logic;
        ast_out_data  : out std_logic_vector(7 downto 0);
        ast_out_ready : in  std_logic
    );
    end component;

    component delay_std_logic_vector is
	generic
	(
		DELAY_COUNT : natural := 1
	);
	port
	(
		clk				: in  std_logic;
		reset			: in  std_logic;
		enable 			: in  std_logic;
		sig_in  		: in  std_logic_vector;
		sig_out 		: out std_logic_vector
	);
    end component;

    component image_gray is
    port(
        clk           : in std_logic;
        reset         : in std_logic;
        -- Avalon-ST (input)
        ast_in_valid  : in  std_logic;
        ast_in_data   : in  std_logic_vector(23 downto 0); -- r,g,b
        ast_in_ready  : out std_logic;
        -- Avalon-ST (output)
        ast_out_valid : out std_logic;
        ast_out_data  : out std_logic_vector(7 downto 0);
        ast_out_ready : in  std_logic
    );
    end component;

    component image_sobelHor is
    port(
        clk           : in std_logic;
        reset         : in std_logic;
        -- Avalon-ST (input)
        ast_in_valid  : in  std_logic;
        ast_in_data   : in  std_logic_vector(7 downto 0);
        ast_in_ready  : out std_logic;
        -- Avalon-ST (output)
        ast_out_valid : out std_logic;
        ast_out_data  : out std_logic_vector(7 downto 0);
        ast_out_ready : in  std_logic
    );
    end component;
end package;

package body components is
end package body;
