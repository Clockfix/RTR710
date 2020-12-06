library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity image_gray is
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
end entity;

-- HINT (Lets try approximation)
-- 0.5870 => 0.5    (/2)
-- 0.2998 => 0.375  (/4 + /8)
-- 0.1140 => 0.125  (/8)

architecture RTL of image_gray is
	signal enable     : std_logic;
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
                end if;
            end if;
        end if;
    end process;

    -- next-state logic

    -- outputs

end architecture;
