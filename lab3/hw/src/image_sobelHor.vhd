LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.data_types.ALL;
USE work.components.ALL;
ENTITY image_sobelHor IS
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

ARCHITECTURE RTL OF image_sobelHor IS
    SIGNAL w_valid_enable, w_data_enable, w_enable : STD_LOGIC; -- enable wire for registers
    SIGNAL r_data_one, r_data_two, r_data_tree : signed(8 DOWNTO 0) := (OTHERS => '0');
    SIGNAL r_valid_shift : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL w_result_w_threshold : signed(9 DOWNTO 0);
    SIGNAL r_data_out_reg, r_data_out_next : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
BEGIN
    -- inputs
    w_enable <= ast_out_ready AND ast_in_valid;

    --------------------------------------------------------------
    -- reg-state logic
    --------------------------------------------------------------
    PROCESS (clk)
    BEGIN
        IF reset = '1' THEN
            r_valid_shift <= (OTHERS => '0');
            r_data_one <= (OTHERS => '0');
            r_data_two <= (OTHERS => '0');
            r_data_tree <= (OTHERS => '0');
        ELSE
            IF rising_edge(clk) THEN

                IF w_enable = '1' THEN
                    r_data_one <= to_signed(to_integer(unsigned(ast_in_data)), 9);
                    r_data_two <= r_data_one;
                    r_data_tree <= r_data_two;
                    -- out reg
                    r_data_out_reg <= r_data_out_next;
                END IF;

                IF ast_out_ready = '1' THEN
                    r_valid_shift(3) <= r_valid_shift(2);
                    r_valid_shift(2) <= r_valid_shift(1);
                    r_valid_shift(1) <= r_valid_shift(0);
                    r_valid_shift(0) <= ast_in_valid;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    ---------------------------------------------------------------------
    -- next-state logic
    ------------------------------------------------------------------
    w_result_w_threshold <= to_signed(to_integer(r_data_one) + to_integer(r_data_tree * (-1)) + 128, 10);
    r_data_out_next <= (OTHERS => '0') WHEN (w_result_w_threshold < 0) ELSE
        (OTHERS => '1') WHEN (w_result_w_threshold > 255) ELSE
        STD_LOGIC_VECTOR(to_unsigned(to_integer(w_result_w_threshold), 8));
    --------------------------------------------------------------------
    -- outputs
    --------------------------------------------------------------------
    ast_in_ready <= ast_out_ready;
    ast_out_valid <= r_valid_shift(3) AND ast_out_ready;
    ast_out_data <= r_data_out_reg;
END ARCHITECTURE;