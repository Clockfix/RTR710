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
    -- input registers
    SIGNAL r_red_in_reg, r_red_in_next : unsigned(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL r_green_in_reg, r_green_in_next : unsigned(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL r_blue_in_reg, r_blue_in_next : unsigned(7 DOWNTO 0) := (OTHERS => '0');

    -- shift registers
    SIGNAL r_red_shift_one_reg, r_red_shift_one_next : unsigned(7 DOWNTO 0) := (OTHERS => '0'); -- /4
    SIGNAL r_red_shift_two_reg, r_red_shift_two_next : unsigned(7 DOWNTO 0) := (OTHERS => '0'); -- /8
    SIGNAL r_green_shift_reg, r_green_shift_next : unsigned(7 DOWNTO 0) := (OTHERS => '0'); -- /2
    SIGNAL r_blue_shift_reg, r_blue_shift_next : unsigned(7 DOWNTO 0) := (OTHERS => '0'); -- /8

    -- sum registers
    SIGNAL r_red_sum_reg, r_red_sum_next : unsigned(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL r_green_blue_sum_reg, r_green_blue_sum_next : unsigned(7 DOWNTO 0) := (OTHERS => '0');

    -- output registers
    SIGNAL r_gray_out_reg, r_gray_out_next : unsigned(7 DOWNTO 0) := (OTHERS => '0');

    -- valid shift registers
    SIGNAL r_valid_one, r_valid_two, r_valid_three, r_valid_four : STD_LOGIC := '0';
BEGIN
    -- inputs
    enable <= ast_out_ready;

    -- reg-state logic
    PROCESS (clk)
    BEGIN
        IF reset = '1' THEN
            -- input registers
            r_red_in_reg <= (OTHERS => '0');
            r_green_in_reg <= (OTHERS => '0');
            r_blue_in_reg <= (OTHERS => '0');
            -- shift registers
            r_red_shift_one_reg <= (OTHERS => '0');
            r_red_shift_two_reg <= (OTHERS => '0');
            r_green_shift_reg <= (OTHERS => '0');
            r_blue_shift_reg <= (OTHERS => '0');
            -- sum registers
            r_red_sum_reg <= (OTHERS => '0');
            r_green_blue_sum_reg <= (OTHERS => '0');
            -- output registers
            r_gray_out_reg <= (OTHERS => '0');
            -- valid shift registers
            r_valid_one <= '0';
            r_valid_two <= '0';
            r_valid_three <= '0';
            r_valid_four <= '0';
        ELSE
            IF rising_edge(clk) THEN
                IF enable = '1' THEN
                    -- input registers
                    r_red_in_reg <= r_red_in_next;
                    r_green_in_reg <= r_green_in_next;
                    r_blue_in_reg <= r_blue_in_next;
                    -- shift registers
                    r_red_shift_one_reg <= r_red_shift_one_next;
                    r_red_shift_two_reg <= r_red_shift_two_next;
                    r_green_shift_reg <= r_green_shift_next;
                    r_blue_shift_reg <= r_blue_shift_next;
                    -- sum registers
                    r_red_sum_reg <= r_red_sum_next;
                    r_green_blue_sum_reg <= r_green_blue_sum_next;
                    -- output registers
                    r_gray_out_reg <= r_gray_out_next;
                    -- valid shift registers
                    r_valid_one <= ast_in_valid;
                    r_valid_two <= r_valid_one;
                    r_valid_three <= r_valid_two;
                    r_valid_four <= r_valid_three;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- next-state logic

    -- input registers
    r_red_in_next <= unsigned(ast_in_data(23 downto 16));
    r_green_in_next <= unsigned(ast_in_data(15 DOWNTO 8));
    r_blue_in_next <= unsigned(ast_in_data(7 DOWNTO 0));
    -- shift registers
    r_red_shift_one_next <= to_unsigned(to_integer(r_red_in_reg(7 DOWNTO 2)),8); -- /4
    r_red_shift_two_next <= to_unsigned(to_integer(r_red_in_reg(7 DOWNTO 3)),8); -- /8
    r_green_shift_next <= to_unsigned(to_integer(r_green_in_reg(7 DOWNTO 1)),8); -- /2
    r_blue_shift_next <= to_unsigned(to_integer(r_blue_in_reg(7 DOWNTO 3)),8); -- /8
    -- sum registers
    r_red_sum_next <= to_unsigned((to_integer(r_red_shift_one_reg) + to_integer(r_red_shift_two_reg)),8); -- red
    r_green_blue_sum_next <= to_unsigned((to_integer(r_blue_shift_reg) + to_integer(r_green_shift_reg)),8); -- blue + green
    -- output registers
    r_gray_out_next <= to_unsigned((to_integer(r_red_sum_reg) + to_integer(r_green_blue_sum_reg)),8); -- gray

    -- outputs

    ast_in_ready <= enable;
    ast_out_valid <= r_valid_four;
    ast_out_data <= STD_LOGIC_VECTOR(r_gray_out_reg);

END ARCHITECTURE;