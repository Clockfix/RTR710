LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY image_gray IS
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        -- Avalon-ST (input)
        ast_in_valid : IN STD_LOGIC;
        ast_in_data : IN STD_LOGIC_VECTOR(23 DOWNTO 0); -- r,g,b
        ast_in_ready : OUT STD_LOGIC;
        -- Avalon-ST (output)
        ast_out_valid : OUT STD_LOGIC;
        ast_out_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        ast_out_ready : IN STD_LOGIC
    );
END ENTITY;

-- HINT (Lets try approximation)
-- 0.5870 => 0.5    (/2) {should be GREEN}
-- 0.2998 => 0.375  (/4 + /8) {should be RED}
-- 0.1140 => 0.125  (/8) {ok its BLUE}

ARCHITECTURE RTL OF image_gray IS
    SIGNAL enable : STD_LOGIC;

    -- shift registers
    SIGNAL w_red_shift_one: unsigned(7 DOWNTO 0) ; -- /4
    SIGNAL w_red_shift_two : unsigned(7 DOWNTO 0) ; -- /8
    SIGNAL w_green_shift : unsigned(7 DOWNTO 0) ; -- /2
    SIGNAL w_blue_shift : unsigned(7 DOWNTO 0) ; -- /8

    -- sum registers
    SIGNAL r_red_sum_reg, r_red_sum_next : unsigned(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL r_green_blue_sum_reg, r_green_blue_sum_next : unsigned(7 DOWNTO 0) := (OTHERS => '0');

    -- output registers
    SIGNAL r_gray_out_reg, r_gray_out_next : unsigned(7 DOWNTO 0) := (OTHERS => '0');

    -- valid shift registers
    SIGNAL r_valid_delay : STD_LOGIC := '0';

BEGIN
    -- inputs
    enable <= ast_out_ready;        -- for better readability
    ----------------------------------------------------------------
    -- reg-state logic
    ----------------------------------------------------------------
    PROCESS (clk)
    BEGIN
        IF reset = '1' THEN
            -- sum registers
            r_red_sum_reg <= (OTHERS => '0');
            r_green_blue_sum_reg <= (OTHERS => '0');
            -- output registers
            r_gray_out_reg <= (OTHERS => '0');
            -- valid shift registers
            r_valid_delay <= '0';
        ELSE
            IF rising_edge(clk) THEN
                IF enable = '1' THEN
                    -- sum registers
                    r_red_sum_reg <= r_red_sum_next;
                    r_green_blue_sum_reg <= r_green_blue_sum_next;
                    -- output registers
                    r_gray_out_reg <= r_gray_out_next;
                    -- valid shift registers
                    r_valid_delay <= ast_in_valid;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    ----------------------------------------------------------------
    -- next-state logic
    ----------------------------------------------------------------

    -- shift registers
    w_red_shift_one <= to_unsigned(to_integer(unsigned(ast_in_data(23 DOWNTO 18))), 8); -- /4
    w_red_shift_two <= to_unsigned(to_integer(unsigned(ast_in_data(23 DOWNTO 19))), 8); -- /8
    w_green_shift <= to_unsigned(to_integer(unsigned(ast_in_data(15 DOWNTO 9))), 8); -- /2
    w_blue_shift <= to_unsigned(to_integer(unsigned(ast_in_data(7 DOWNTO 3))), 8); -- /8
    -- sum registers
    r_red_sum_next <= to_unsigned((to_integer(w_red_shift_one) + to_integer(w_red_shift_two)), 8); -- red
    r_green_blue_sum_next <= to_unsigned((to_integer(w_green_shift) + to_integer(w_blue_shift)), 8); -- blue + green
    -- output registers
    r_gray_out_next <= to_unsigned((to_integer(r_red_sum_reg) + to_integer(r_green_blue_sum_reg)), 8); -- gray
    ----------------------------------------------------------------
    -- outputs
    ----------------------------------------------------------------
    ast_in_ready <= enable;
    ast_out_valid <= r_valid_delay;
    ast_out_data <= STD_LOGIC_VECTOR(r_gray_out_next); 

END ARCHITECTURE;