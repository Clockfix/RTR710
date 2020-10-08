-----------------------------
-- Author - Imants Pulkstenis
-- Date - 30.09.2020 
-- Project name - VGA driver
-- Module name - main- TOP entity
--
-- Detailed module description
--
-- Revision:
-- A - initial design
-- B - 
--
-----------------------------
LIBRARY ieee; --always use this library
USE ieee.std_logic_1164.ALL; --always use this library
USE ieee.numeric_std.ALL; --use this library if arithmetic requir

LIBRARY work; -- this is implicit
USE work.functions.ALL;

ENTITY counter IS
    GENERIC (
        g_MAX_VALUE : NATURAL := 799
    );
    PORT (
        i_clk : IN std_logic; --25Mhz clock
        i_en : IN std_logic;
        o_counter_out : OUT std_logic_vector(log2c(g_MAX_VALUE + 1) - 1 DOWNTO 0);
        o_counter_full : OUT std_logic
    );
END counter;
ARCHITECTURE rtl OF counter IS

    SIGNAL r_counter_reg, r_counter_next : unsigned (o_counter_out'RANGE) := (OTHERS => '0');
    SIGNAL w_counter_max : std_logic;

BEGIN

    -- reg state logic
    PROCESS
    BEGIN
        WAIT UNTIL rising_edge(i_clk);
        IF i_en = '1' THEN
            r_counter_reg <= r_counter_next;
        END IF;

    END PROCESS;

    -- reg state logic
    w_counter_max <= '1' WHEN r_counter_reg = g_MAX_VALUE ELSE
        '0';
    r_counter_next <= (OTHERS => '0') WHEN w_counter_max ELSE
        r_counter_reg + 1;

    -- reg state logic
    o_counter_out <= std_logic_vector(r_counter_reg);
    o_counter_full <= w_counter_max;
END rtl;