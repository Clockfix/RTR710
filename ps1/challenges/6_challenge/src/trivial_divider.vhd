LIBRARY ieee;
-- LIBRARY rtu;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
-- USE rtu.random.ALL;

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
    SIGNAL r_divisor_reg : unsigned(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL r_reminder_reg, r_reminder_next : unsigned(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL r_quotient_reg, r_quotient_next : unsigned(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL r_done_reg, r_done_next : STD_LOGIC := '0';

    SIGNAL w_larger_eq, w_not_zero : STD_LOGIC;
    SIGNAL w_reminder_en, w_quotient_en, w_done_en : STD_LOGIC;

BEGIN
    -- enable for remondrer register
    w_reminder_en <= w_larger_eq OR start;
    -- enable for quotient register
    w_quotient_en <= (w_larger_eq AND w_not_zero) or start;
    -- checking is user deviding by x"0"
    w_not_zero <= '0' WHEN (to_integer(r_divisor_reg) = 0) ELSE
        '1';
    -- compare numinator and denuminator - can we subtract one more time    
    w_larger_eq <= '1' WHEN (r_reminder_reg >= r_divisor_reg) ELSE
        '0';
    w_done_en <= (NOT w_larger_eq) OR (NOT w_not_zero) or start;

    -- reg-state logic
    -- <your code goes here>
    PROCESS (ALL)
    BEGIN
        IF rising_edge(clk) THEN
            IF w_reminder_en THEN
                -- set new value to reminder
                r_reminder_reg <= r_reminder_next;
            END IF;

            IF start THEN
                -- reset internal registers      
                r_divisor_reg <= unsigned(divisor);
            END IF;
            -- quotient reg
            IF w_quotient_en THEN
                r_quotient_reg <= r_quotient_next;
            END IF;
            -- done register
            IF w_done_en THEN
                r_done_reg <= r_done_next;
            END IF;
        END IF;
    END PROCESS;

    -- next-state logic
    -- <your code goes here>

    r_reminder_next <= unsigned(divident) WHEN start ELSE
        r_reminder_reg - r_divisor_reg;
    r_quotient_next <= (OTHERS => '0') WHEN start ELSE
        r_quotient_reg + 1;
    r_done_next <= '0' WHEN start ELSE
        '1';

    -- outputs
    -- <your code goes here>
    done <= r_done_reg;
    quotient <= STD_LOGIC_VECTOR(r_quotient_reg);
    reminder <= STD_LOGIC_VECTOR(r_reminder_reg);
END ARCHITECTURE;