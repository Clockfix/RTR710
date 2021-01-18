LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY image_darkener IS
    GENERIC (
        DARKENER_CONSTANT : NATURAL := 20
    );
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        -- Avalon-ST (input)
        ast_in_valid : IN STD_LOGIC;
        ast_in_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        ast_in_ready : OUT STD_LOGIC;
        -- Avalon-ST (output)
        ast_out_valid : OUT STD_LOGIC;
        ast_out_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        ast_out_ready : IN STD_LOGIC
    );
END ENTITY;

ARCHITECTURE RTL OF image_darkener IS
    SIGNAL enable : STD_LOGIC;
    -- -- input registers
    -- SIGNAL r_in_reg, r_in_next : unsigned(7 DOWNTO 0) := (OTHERS => '0');
    -- output registers
    SIGNAL r_out_reg, r_out_next : unsigned(7 DOWNTO 0) := (OTHERS => '0');
    -- valid shift registers
    SIGNAL r_valid_one, r_valid_two : STD_LOGIC := '0';

BEGIN
    -- inputs
    enable <= ast_out_ready;

    -- reg-state logic
    PROCESS (clk)
    BEGIN
        IF reset = '1' THEN
            -- input registers
            -- r_in_reg <= (OTHERS => '0');
            -- output registers
            r_out_reg <= (OTHERS => '0');
            -- valid shift registers
            r_valid_one <= '0';
            -- r_valid_two <= '0';
        ELSE
            IF rising_edge(clk) THEN
                IF enable = '1' THEN
                    -- input registers
                    -- r_in_reg <= r_in_next;
                    -- output registers
                    r_out_reg <= r_out_next;
                    --      ELSE
                    -- valid shift registers
                    r_valid_one <= ast_in_valid;
                    -- r_valid_two <= r_valid_one;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- next-state logic

    -- input registers
    -- r_in_next <= unsigned(ast_in_data(7 DOWNTO 0));
    -- output registers
    r_out_next <= (OTHERS => '0') WHEN (to_integer(unsigned(ast_in_data(7 DOWNTO 0))) < DARKENER_CONSTANT)
        ELSE
        to_unsigned(to_integer(unsigned(ast_in_data(7 DOWNTO 0))) - 20, 8);
    -- outputs
    ast_out_valid <= r_valid_one;
    ast_in_ready <= enable;
    ast_out_data <= STD_LOGIC_VECTOR(r_out_reg);
END ARCHITECTURE;