-----------------------------
-- Author - Imants Pulkstenis
-- Date - 30.09.2020 
-- Project name - hello world!
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
ENTITY main IS
    GENERIC (
        g_COUNTER_WIDTH : NATURAL := 25;
        g_MAX_COUNTER_VALUE : NATURAL := 25000000
    );
    PORT (
        i_clk : IN std_logic; --50Mhz clock
        o_led : OUT std_logic
    );
END main;

ARCHITECTURE rtl OF main IS
    SIGNAL w_led_enable : boolean;
    SIGNAL r_counter_reg, r_counter_next : unsigned (g_COUNTER_WIDTH - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL r_led_next, r_led_reg : std_logic := '0';

BEGIN

    -- reg state logic
    PROCESS
    BEGIN
        WAIT UNTIL rising_edge(i_clk);
        IF w_led_enable THEN
            r_led_reg <= r_led_next;

        END IF;
        r_counter_reg <= r_counter_next;
    END PROCESS;
    -- next state logic
    r_led_next <= NOT r_led_reg;
    r_counter_next <= (OTHERS => '0') WHEN w_led_enable ELSE
        r_counter_reg + 1;

    w_led_enable <= r_counter_reg = g_MAX_COUNTER_VALUE;

    -- output
    o_led <= r_led_reg;
END rtl;