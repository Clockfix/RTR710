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
USE ieee.numeric_std.ALL; --use this library if arithmetic require
LIBRARY pll;

ENTITY main IS
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
        i_clk : IN std_logic; --50Mhz clock
        o_hs : OUT std_logic; -- Horizontal sync
        o_vs : OUT std_logic; -- Vertical sync
        o_vga_clk : OUT std_logic; -- ADC clock
        o_sync_n : OUT std_logic; -- to ADC
        o_blanc_n : OUT std_logic; -- to SDC
        o_r, o_g, o_b : OUT std_logic_vector (7 DOWNTO 0)
    );
END main;

ARCHITECTURE rtl OF main IS
    SIGNAL w_clk25MHz : std_logic;

BEGIN
    -- instantiate components
    ync_sig_gen0 : ENTITY pll.pll
        PORT MAP(
            refclk => i_clk, --  refclk.clk
            rst => '0', --   reset.reset
            outclk_0 => w_clk25MHz -- outclk0.clk
        );

    sync_sig_gen0 : ENTITY work.sync_sig_gen
        GENERIC MAP
        (
            g_HS_START => g_HS_START,
            g_HS_END => g_HS_END,
            g_HS_MAX => g_HS_MAX,
            g_VS_START => g_VS_START,
            g_VS_END => g_VS_END,
            g_VS_MAX => g_VS_MAX,
            g_HRES => g_HRES,
            g_VRES => g_VRES
        )
        PORT MAP
        (
            i_clk => w_clk25MHz, --25Mhz clock
            o_hs => o_hs, -- Horizontal sync
            o_vs => o_vs, -- Vertical sync
            o_sync_n => o_sync_n,
            o_blanc_n => o_blanc_n
        );

    -- reg state logic

    -- next state logic

    -- output
    o_r <= x"55";
    o_vga_clk <= w_clk25MHz;
END rtl;