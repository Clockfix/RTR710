LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY trivial_divider IS
    PORT (
        clk : IN STD_LOGIC;
        start : IN STD_LOGIC;
        divident : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        divisor : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        done : OUT STD_LOGIC := '0';
        quotient : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
        reminder : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0')
    );
END ENTITY;

ARCHITECTURE RTL OF trivial_divider IS

    -- signal declaration
    -- <your code goes here>
    SIGNAL r_dividend_reg : unsigned(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL r_divisor_reg : unsigned(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL r_reminder_reg, r_reminder_next, r_reminder_out_reg, r_reminder_out_next : unsigned(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL r_quotient_reg, r_quotient_next, r_quotient_out_reg, r_quotient_out_next : unsigned(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL r_done_reg, r_start : STD_LOGIC := '0';

    SIGNAL w_larger_eq, w_reminder_en, w_quotient_en, w_out_en, w_not_zero : STD_LOGIC;
    SIGNAL w_done_en : STD_LOGIC; -- special enable wire that enable "done" register when w_out_en='1' or w_not_zero='0' -- to comply with task description(result wil be not correct)

BEGIN

    -- enable for remondrer register
    w_reminder_en <= r_start OR w_larger_eq;
    -- enable for output registers
    w_out_en <= (NOT r_start) AND (NOT w_larger_eq) AND w_not_zero;
    -- enable for quotient register
    w_quotient_en <= (NOT r_start) AND w_larger_eq AND w_not_zero;
    -- checking is user deviding by x"0"
    w_not_zero <= '0' WHEN (to_integer(r_divisor_reg) = 0) ELSE
        '1';
    -- compare numinator and denuminator - can we subtract one more time    
    w_larger_eq <= '1' WHEN (r_reminder_reg >= r_divisor_reg) ELSE
        '0';
    w_done_en <= w_out_en OR (NOT w_not_zero);
    -- reg-state logic
    -- <your code goes here>
    PROCESS (ALL)
    BEGIN
        IF rising_edge(clk) THEN
            -- save start pulse in START register
            r_start <= start;
        END IF;
        IF start THEN
            -- reset internal registers
            r_quotient_reg <= (OTHERS => '0');
            r_done_reg <= '0';
            r_quotient_out_reg <= (OTHERS => '0');
            r_reminder_reg <= (OTHERS => '0');
            r_reminder_out_reg <= (OTHERS => '0');
            IF rising_edge(clk) THEN
                -- set new value to input registers
                r_dividend_reg <= unsigned(divident);
                r_divisor_reg <= unsigned(divisor);
            END IF;
        ELSE
            IF rising_edge(clk) THEN
                -- remonder reg
                IF w_reminder_en THEN
                    r_reminder_reg <= r_reminder_next;
                END IF;
                -- quotient reg
                IF w_quotient_en THEN
                    r_quotient_reg <= r_quotient_next;
                END IF;
                -- outputs registers
                IF w_out_en THEN
                    r_quotient_out_reg <= r_quotient_out_next;
                    r_reminder_out_reg <= r_reminder_out_next;
                    -- r_done_reg <= '1'; 
                END IF;
                -- done register
                IF w_done_en THEN
                    r_done_reg <= '1';
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- next-state logic
    -- <your code goes here>
    r_reminder_next <= r_dividend_reg WHEN r_start ELSE
        r_reminder_reg - r_divisor_reg;
    r_quotient_next <= r_quotient_reg + 1;
    r_quotient_out_next <= r_quotient_reg;
    r_reminder_out_next <= r_reminder_reg;
    -- outputs
    -- <your code goes here>
    done <= r_done_reg;
    quotient <= STD_LOGIC_VECTOR(r_quotient_out_reg);
    reminder <= STD_LOGIC_VECTOR(r_reminder_out_reg);
END ARCHITECTURE;