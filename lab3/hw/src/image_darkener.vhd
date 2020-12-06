library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity image_darkener is
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
end entity;

architecture RTL of image_darkener is
	signal enable : std_logic;
begin
    -- inputs
	 enable <= ast_out_ready;

    -- reg-state logic
    process(clk)
    begin
        if reset = '1' then
        else
            if rising_edge(clk) then
                if enable = '1' then
                else
                end if;
            end if;
        end if;
    end process;

    -- next-state logic

    -- outputs

end architecture;
