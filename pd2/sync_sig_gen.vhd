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
ENTITY sync_sig_gen IS
    GENERIC (
        g_HS_START : NATURAL := 660;
        g_HS_END : NATURAL := 755;
        g_HS_MAX : NATURAL := 799;
        g_VS_START : NATURAL := 493;
        g_VS_END : NATURAL := 494;
        g_VS_MAX : NATURAL := 524;
        g_HRES : NATURAL := 640;
        g_VRES : NATURAL := 480
    );
    PORT (
        i_clk : IN std_logic; --25Mhz clock
        o_hs : OUT std_logic; -- Horizontal sync
        o_vs : OUT std_logic; -- Vertical sync
        o_sync_n : OUT std_logic; -- to ADC
        o_blanc_n : OUT std_logic -- to SDC
    );
END sync_sig_gen;
ARCHITECTURE rtl OF sync_sig_gen IS

    SIGNAL r_hs_reg, r_hs_next : std_logic := '0';
    SIGNAL r_vs_reg, r_vs_next : std_logic := '0';
    SIGNAL r_blank_reg, r_blank_next : std_logic := '0';
    SIGNAL w_hs_counter_out : std_logic_vector(log2c(g_HS_MAX + 1) - 1 DOWNTO 0);
    SIGNAL w_vs_counter_out : std_logic_vector(log2c(g_VS_MAX + 1) - 1 DOWNTO 0);
    SIGNAL w_hs_counter_full : std_logic;

BEGIN
    -- instantiate components
    comp_hs_counter : ENTITY work.counter 
        GENERIC MAP(
            g_MAX_VALUE => g_HS_MAX
        )
        PORT MAP
        (
            i_clk => i_clk,
            i_en => '1',
            o_counter_out => w_hs_counter_out,
            o_counter_full => w_hs_counter_full
        );

    comp_vs_counter : ENTITY work.counter 
        GENERIC MAP
        (
            g_MAX_VALUE => g_VS_MAX
        )
        PORT MAP
        (
            i_clk => i_clk,
            i_en => w_hs_counter_full,
            o_counter_out => w_vs_counter_out
            -- o_counter_full =>
        );

    -- reg state logic
    PROCESS
    BEGIN
        WAIT UNTIL rising_edge(i_clk);
        r_hs_reg <= r_hs_next;
        r_vs_reg <= r_vs_next;
        r_blank_reg <= r_blank_next;
    END PROCESS;
    -- next state logic

    r_hs_next <= '0' WHEN unsigned(w_hs_counter_out) >= g_HS_START AND
        unsigned(w_hs_counter_out) <= g_HS_END
        ELSE
        '1';

    r_vs_next <= '0' WHEN unsigned(w_vs_counter_out) >= g_VS_START AND
        unsigned(w_vs_counter_out) <= g_VS_END
        ELSE
        '1';
    
       r_blank_next <= '1' WHEN unsigned(w_hs_counter_out) < g_HRES AND
        unsigned(w_vs_counter_out) < g_VRES
        ELSE
        '0';

    -- output logic
    o_hs <= r_hs_reg;
    o_vs <= r_vs_reg;
    o_blanc_n <= r_blank_reg; 
    o_sync_n <= '0';
END;