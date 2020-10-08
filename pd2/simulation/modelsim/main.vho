-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "10/07/2020 20:51:50"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	main IS
    PORT (
	i_clk : IN std_logic;
	o_hs : OUT std_logic;
	o_vs : OUT std_logic;
	o_sync_n : OUT std_logic;
	o_blanc_n : OUT std_logic;
	o_r : OUT std_logic_vector(7 DOWNTO 0);
	o_g : OUT std_logic_vector(7 DOWNTO 0);
	o_b : OUT std_logic_vector(7 DOWNTO 0)
	);
END main;

-- Design Ports Information
-- o_hs	=>  Location: PIN_B11,	 I/O Standard: 3.0-V LVTTL,	 Current Strength: Default
-- o_vs	=>  Location: PIN_D11,	 I/O Standard: 3.0-V LVTTL,	 Current Strength: Default
-- o_sync_n	=>  Location: PIN_C10,	 I/O Standard: 3.0-V LVTTL,	 Current Strength: Default
-- o_blanc_n	=>  Location: PIN_F10,	 I/O Standard: 3.0-V LVTTL,	 Current Strength: Default
-- o_r[0]	=>  Location: PIN_A13,	 I/O Standard: 3.0-V LVTTL,	 Current Strength: Default
-- o_r[1]	=>  Location: PIN_C13,	 I/O Standard: 3.0-V LVTTL,	 Current Strength: Default
-- o_r[2]	=>  Location: PIN_E13,	 I/O Standard: 3.0-V LVTTL,	 Current Strength: Default
-- o_r[3]	=>  Location: PIN_B12,	 I/O Standard: 3.0-V LVTTL,	 Current Strength: Default
-- o_r[4]	=>  Location: PIN_C12,	 I/O Standard: 3.0-V LVTTL,	 Current Strength: Default
-- o_r[5]	=>  Location: PIN_D12,	 I/O Standard: 3.0-V LVTTL,	 Current Strength: Default
-- o_r[6]	=>  Location: PIN_E12,	 I/O Standard: 3.0-V LVTTL,	 Current Strength: Default
-- o_r[7]	=>  Location: PIN_F13,	 I/O Standard: 3.0-V LVTTL,	 Current Strength: Default
-- o_g[0]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_g[1]	=>  Location: PIN_AG7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_g[2]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_g[3]	=>  Location: PIN_AH13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_g[4]	=>  Location: PIN_AJ6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_g[5]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_g[6]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_g[7]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_b[0]	=>  Location: PIN_AG26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_b[1]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_b[2]	=>  Location: PIN_AH8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_b[3]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_b[4]	=>  Location: PIN_AJ14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_b[5]	=>  Location: PIN_AJ19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_b[6]	=>  Location: PIN_AE23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_b[7]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_clk	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF main IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_i_clk : std_logic;
SIGNAL ww_o_hs : std_logic;
SIGNAL ww_o_vs : std_logic;
SIGNAL ww_o_sync_n : std_logic;
SIGNAL ww_o_blanc_n : std_logic;
SIGNAL ww_o_r : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_o_g : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_o_b : std_logic_vector(7 DOWNTO 0);
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \i_clk~input_o\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Add0~37_sumout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Equal0~1_combout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Add0~38\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Add0~33_sumout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Add0~34\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Add0~29_sumout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Add0~30\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Add0~25_sumout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Add0~26\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Add0~21_sumout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Add0~22\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Add0~13_sumout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Add0~14\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Add0~17_sumout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Add0~18\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Add0~5_sumout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Add0~6\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Add0~1_sumout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Add0~2\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|Add0~9_sumout\ : std_logic;
SIGNAL \sync_sig_gen0|r_hs_next~0_combout\ : std_logic;
SIGNAL \sync_sig_gen0|r_hs_next~1_combout\ : std_logic;
SIGNAL \sync_sig_gen0|r_hs_reg~q\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Add0~5_sumout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Add0~34\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Add0~29_sumout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Add0~30\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Add0~25_sumout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Add0~26\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Add0~21_sumout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Add0~22\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Add0~17_sumout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Add0~18\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Add0~13_sumout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Add0~14\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Add0~1_sumout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|r_counter_reg[9]~DUPLICATE_q\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Equal0~1_combout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Equal0~2_combout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Add0~6\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Add0~9_sumout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Add0~10\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Add0~37_sumout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Add0~38\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Add0~33_sumout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|Equal0~0_combout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|r_counter_reg[0]~DUPLICATE_q\ : std_logic;
SIGNAL \sync_sig_gen0|r_vs_next~0_combout\ : std_logic;
SIGNAL \sync_sig_gen0|r_vs_next~1_combout\ : std_logic;
SIGNAL \sync_sig_gen0|r_vs_reg~q\ : std_logic;
SIGNAL \sync_sig_gen0|r_blank_next~0_combout\ : std_logic;
SIGNAL \sync_sig_gen0|r_blank_reg~q\ : std_logic;
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ync_sig_gen0|pll_inst|altera_pll_i|fboutclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \sync_sig_gen0|comp_vs_counter|r_counter_reg\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \sync_sig_gen0|comp_hs_counter|r_counter_reg\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg[0]~DUPLICATE_q\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg[9]~DUPLICATE_q\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_vs_counter|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \sync_sig_gen0|ALT_INV_r_vs_next~0_combout\ : std_logic;
SIGNAL \sync_sig_gen0|ALT_INV_r_hs_next~0_combout\ : std_logic;
SIGNAL \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\ : std_logic_vector(9 DOWNTO 0);

BEGIN

ww_i_clk <= i_clk;
o_hs <= ww_o_hs;
o_vs <= ww_o_vs;
o_sync_n <= ww_o_sync_n;
o_blanc_n <= ww_o_blanc_n;
o_r <= ww_o_r;
o_g <= ww_o_g;
o_b <= ww_o_b;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ <= \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(0);
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ <= \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(1);
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ <= \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(2);
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ <= \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(3);
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ <= \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(4);
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ <= \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(5);
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ <= \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(6);
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ <= \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(7);

\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ <= \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(0);
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ <= \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(1);
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ <= \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(2);
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ <= \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(3);
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ <= \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(4);
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ <= \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(5);
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ <= \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(6);
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ <= \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(7);

\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ <= (gnd & gnd & gnd & \i_clk~input_o\);

\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ <= (\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ & \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ & 
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ & \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ & \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ & 
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ & \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ & \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\);

\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ <= \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\(6);

\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ <= (\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ & \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ & 
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ & \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ & \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ & 
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ & \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ & \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\);
\sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg[0]~DUPLICATE_q\ <= NOT \sync_sig_gen0|comp_vs_counter|r_counter_reg[0]~DUPLICATE_q\;
\sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg[9]~DUPLICATE_q\ <= NOT \sync_sig_gen0|comp_vs_counter|r_counter_reg[9]~DUPLICATE_q\;
\sync_sig_gen0|comp_hs_counter|ALT_INV_Equal0~1_combout\ <= NOT \sync_sig_gen0|comp_hs_counter|Equal0~1_combout\;
\sync_sig_gen0|comp_vs_counter|ALT_INV_Equal0~1_combout\ <= NOT \sync_sig_gen0|comp_vs_counter|Equal0~1_combout\;
\sync_sig_gen0|comp_vs_counter|ALT_INV_Equal0~0_combout\ <= NOT \sync_sig_gen0|comp_vs_counter|Equal0~0_combout\;
\sync_sig_gen0|ALT_INV_r_vs_next~0_combout\ <= NOT \sync_sig_gen0|r_vs_next~0_combout\;
\sync_sig_gen0|ALT_INV_r_hs_next~0_combout\ <= NOT \sync_sig_gen0|r_hs_next~0_combout\;
\sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(0) <= NOT \sync_sig_gen0|comp_hs_counter|r_counter_reg\(0);
\sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(1) <= NOT \sync_sig_gen0|comp_hs_counter|r_counter_reg\(1);
\sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(2) <= NOT \sync_sig_gen0|comp_vs_counter|r_counter_reg\(2);
\sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(3) <= NOT \sync_sig_gen0|comp_vs_counter|r_counter_reg\(3);
\sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(4) <= NOT \sync_sig_gen0|comp_vs_counter|r_counter_reg\(4);
\sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(5) <= NOT \sync_sig_gen0|comp_vs_counter|r_counter_reg\(5);
\sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(6) <= NOT \sync_sig_gen0|comp_vs_counter|r_counter_reg\(6);
\sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(7) <= NOT \sync_sig_gen0|comp_vs_counter|r_counter_reg\(7);
\sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(8) <= NOT \sync_sig_gen0|comp_vs_counter|r_counter_reg\(8);
\sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(1) <= NOT \sync_sig_gen0|comp_vs_counter|r_counter_reg\(1);
\sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(0) <= NOT \sync_sig_gen0|comp_vs_counter|r_counter_reg\(0);
\sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(9) <= NOT \sync_sig_gen0|comp_vs_counter|r_counter_reg\(9);
\sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(2) <= NOT \sync_sig_gen0|comp_hs_counter|r_counter_reg\(2);
\sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(3) <= NOT \sync_sig_gen0|comp_hs_counter|r_counter_reg\(3);
\sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(4) <= NOT \sync_sig_gen0|comp_hs_counter|r_counter_reg\(4);
\sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(6) <= NOT \sync_sig_gen0|comp_hs_counter|r_counter_reg\(6);
\sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(5) <= NOT \sync_sig_gen0|comp_hs_counter|r_counter_reg\(5);
\sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(9) <= NOT \sync_sig_gen0|comp_hs_counter|r_counter_reg\(9);
\sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(7) <= NOT \sync_sig_gen0|comp_hs_counter|r_counter_reg\(7);
\sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(8) <= NOT \sync_sig_gen0|comp_hs_counter|r_counter_reg\(8);

-- Location: IOOBUF_X36_Y81_N53
\o_hs~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sync_sig_gen0|r_hs_reg~q\,
	devoe => ww_devoe,
	o => ww_o_hs);

-- Location: IOOBUF_X34_Y81_N42
\o_vs~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sync_sig_gen0|r_vs_reg~q\,
	devoe => ww_devoe,
	o => ww_o_vs);

-- Location: IOOBUF_X28_Y81_N36
\o_sync_n~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_sync_n);

-- Location: IOOBUF_X6_Y81_N19
\o_blanc_n~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sync_sig_gen0|r_blank_reg~q\,
	devoe => ww_devoe,
	o => ww_o_blanc_n);

-- Location: IOOBUF_X40_Y81_N53
\o_r[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_o_r(0));

-- Location: IOOBUF_X38_Y81_N2
\o_r[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_r(1));

-- Location: IOOBUF_X26_Y81_N59
\o_r[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_o_r(2));

-- Location: IOOBUF_X38_Y81_N19
\o_r[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_r(3));

-- Location: IOOBUF_X36_Y81_N36
\o_r[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_o_r(4));

-- Location: IOOBUF_X22_Y81_N19
\o_r[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_r(5));

-- Location: IOOBUF_X22_Y81_N2
\o_r[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_o_r(6));

-- Location: IOOBUF_X26_Y81_N42
\o_r[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_r(7));

-- Location: IOOBUF_X52_Y0_N2
\o_g[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_g(0));

-- Location: IOOBUF_X10_Y0_N93
\o_g[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_g(1));

-- Location: IOOBUF_X89_Y8_N56
\o_g[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_g(2));

-- Location: IOOBUF_X30_Y0_N2
\o_g[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_g(3));

-- Location: IOOBUF_X26_Y0_N76
\o_g[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_g(4));

-- Location: IOOBUF_X60_Y0_N19
\o_g[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_g(5));

-- Location: IOOBUF_X56_Y0_N2
\o_g[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_g(6));

-- Location: IOOBUF_X89_Y9_N22
\o_g[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_g(7));

-- Location: IOOBUF_X84_Y0_N36
\o_b[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_b(0));

-- Location: IOOBUF_X4_Y0_N53
\o_b[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_b(1));

-- Location: IOOBUF_X32_Y0_N53
\o_b[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_b(2));

-- Location: IOOBUF_X89_Y9_N39
\o_b[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_b(3));

-- Location: IOOBUF_X40_Y0_N36
\o_b[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_b(4));

-- Location: IOOBUF_X60_Y0_N36
\o_b[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_b(5));

-- Location: IOOBUF_X78_Y0_N19
\o_b[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_b(6));

-- Location: IOOBUF_X89_Y11_N79
\o_b[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_o_b(7));

-- Location: IOIBUF_X32_Y0_N1
\i_clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_clk,
	o => \i_clk~input_o\);

-- Location: PLLREFCLKSELECT_X0_Y21_N0
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT\ : cyclonev_pll_refclk_select
-- pragma translate_off
GENERIC MAP (
	pll_auto_clk_sw_en => "false",
	pll_clk_loss_edge => "both_edges",
	pll_clk_loss_sw_en => "false",
	pll_clk_sw_dly => 0,
	pll_clkin_0_src => "clk_0",
	pll_clkin_1_src => "ref_clk1",
	pll_manu_clk_sw_en => "false",
	pll_sw_refclk_src => "clk_0")
-- pragma translate_on
PORT MAP (
	clkin => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\,
	clkout => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	extswitchbuf => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\);

-- Location: FRACTIONALPLL_X0_Y15_N0
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL\ : cyclonev_fractional_pll
-- pragma translate_off
GENERIC MAP (
	dsm_accumulator_reset_value => 0,
	forcelock => "false",
	mimic_fbclk_type => "none",
	nreset_invert => "true",
	output_clock_frequency => "300.0 mhz",
	pll_atb => 0,
	pll_bwctrl => 4000,
	pll_cmp_buf_dly => "0 ps",
	pll_cp_comp => "true",
	pll_cp_current => 10,
	pll_ctrl_override_setting => "false",
	pll_dsm_dither => "disable",
	pll_dsm_out_sel => "disable",
	pll_dsm_reset => "false",
	pll_ecn_bypass => "false",
	pll_ecn_test_en => "false",
	pll_enable => "true",
	pll_fbclk_mux_1 => "glb",
	pll_fbclk_mux_2 => "m_cnt",
	pll_fractional_carry_out => 32,
	pll_fractional_division => 1,
	pll_fractional_division_string => "'0'",
	pll_fractional_value_ready => "true",
	pll_lf_testen => "false",
	pll_lock_fltr_cfg => 25,
	pll_lock_fltr_test => "false",
	pll_m_cnt_bypass_en => "false",
	pll_m_cnt_coarse_dly => "0 ps",
	pll_m_cnt_fine_dly => "0 ps",
	pll_m_cnt_hi_div => 6,
	pll_m_cnt_in_src => "ph_mux_clk",
	pll_m_cnt_lo_div => 6,
	pll_m_cnt_odd_div_duty_en => "false",
	pll_m_cnt_ph_mux_prst => 0,
	pll_m_cnt_prst => 1,
	pll_n_cnt_bypass_en => "false",
	pll_n_cnt_coarse_dly => "0 ps",
	pll_n_cnt_fine_dly => "0 ps",
	pll_n_cnt_hi_div => 1,
	pll_n_cnt_lo_div => 1,
	pll_n_cnt_odd_div_duty_en => "false",
	pll_ref_buf_dly => "0 ps",
	pll_reg_boost => 0,
	pll_regulator_bypass => "false",
	pll_ripplecap_ctrl => 0,
	pll_slf_rst => "false",
	pll_tclk_mux_en => "false",
	pll_tclk_sel => "n_src",
	pll_test_enable => "false",
	pll_testdn_enable => "false",
	pll_testup_enable => "false",
	pll_unlock_fltr_cfg => 2,
	pll_vco_div => 2,
	pll_vco_ph0_en => "true",
	pll_vco_ph1_en => "true",
	pll_vco_ph2_en => "true",
	pll_vco_ph3_en => "true",
	pll_vco_ph4_en => "true",
	pll_vco_ph5_en => "true",
	pll_vco_ph6_en => "true",
	pll_vco_ph7_en => "true",
	pll_vctrl_test_voltage => 750,
	reference_clock_frequency => "50.0 mhz",
	vccd0g_atb => "disable",
	vccd0g_output => 0,
	vccd1g_atb => "disable",
	vccd1g_output => 0,
	vccm1g_tap => 2,
	vccr_pd => "false",
	vcodiv_override => "false",
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	coreclkfb => \ync_sig_gen0|pll_inst|altera_pll_i|fboutclk_wire\(0),
	ecnc1test => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\,
	nresync => GND,
	refclkin => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	shift => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftdonein => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	cntnen => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	fbclk => \ync_sig_gen0|pll_inst|altera_pll_i|fboutclk_wire\(0),
	tclk => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	vcoph => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\,
	mhi => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\);

-- Location: PLLRECONFIG_X0_Y19_N0
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG\ : cyclonev_pll_reconfig
-- pragma translate_off
GENERIC MAP (
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	cntnen => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	mhi => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\,
	shift => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftenm => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	shiften => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\);

-- Location: PLLOUTPUTCOUNTER_X0_Y20_N1
\ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER\ : cyclonev_pll_output_counter
-- pragma translate_off
GENERIC MAP (
	c_cnt_coarse_dly => "0 ps",
	c_cnt_fine_dly => "0 ps",
	c_cnt_in_src => "ph_mux_clk",
	c_cnt_ph_mux_prst => 0,
	c_cnt_prst => 1,
	cnt_fpll_src => "fpll_0",
	dprio0_cnt_bypass_en => "false",
	dprio0_cnt_hi_div => 6,
	dprio0_cnt_lo_div => 6,
	dprio0_cnt_odd_div_even_duty_en => "false",
	duty_cycle => 50,
	output_clock_frequency => "25.0 mhz",
	phase_shift => "0 ps",
  fractional_pll_index => 0,
  output_counter_index => 6)
-- pragma translate_on
PORT MAP (
	nen0 => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	shift0 => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\,
	tclk0 => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	up0 => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	vco0ph => \ync_sig_gen0|pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\,
	divclk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire\(0));

-- Location: CLKCTRL_G0
\ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire\(0),
	outclk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\);

-- Location: LABCELL_X33_Y80_N30
\sync_sig_gen0|comp_hs_counter|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_hs_counter|Add0~37_sumout\ = SUM(( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(0) ) + ( VCC ) + ( !VCC ))
-- \sync_sig_gen0|comp_hs_counter|Add0~38\ = CARRY(( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(0),
	cin => GND,
	sumout => \sync_sig_gen0|comp_hs_counter|Add0~37_sumout\,
	cout => \sync_sig_gen0|comp_hs_counter|Add0~38\);

-- Location: LABCELL_X33_Y80_N27
\sync_sig_gen0|comp_hs_counter|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_hs_counter|Equal0~1_combout\ = ( !\sync_sig_gen0|comp_hs_counter|r_counter_reg\(7) & ( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(0) & ( (!\sync_sig_gen0|comp_hs_counter|r_counter_reg\(6) & 
-- (!\sync_sig_gen0|comp_hs_counter|r_counter_reg\(5) & \sync_sig_gen0|comp_hs_counter|r_counter_reg\(9))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001000000010000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(6),
	datab => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(5),
	datac => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(9),
	datae => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(7),
	dataf => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(0),
	combout => \sync_sig_gen0|comp_hs_counter|Equal0~1_combout\);

-- Location: LABCELL_X33_Y80_N18
\sync_sig_gen0|comp_hs_counter|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\ = ( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(2) & ( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(1) & ( (\sync_sig_gen0|comp_hs_counter|Equal0~1_combout\ & 
-- (\sync_sig_gen0|comp_hs_counter|r_counter_reg\(3) & (\sync_sig_gen0|comp_hs_counter|r_counter_reg\(8) & \sync_sig_gen0|comp_hs_counter|r_counter_reg\(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sync_sig_gen0|comp_hs_counter|ALT_INV_Equal0~1_combout\,
	datab => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(3),
	datac => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(8),
	datad => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(4),
	datae => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(2),
	dataf => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(1),
	combout => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\);

-- Location: FF_X33_Y80_N32
\sync_sig_gen0|comp_hs_counter|r_counter_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_hs_counter|Add0~37_sumout\,
	sclr => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_hs_counter|r_counter_reg\(0));

-- Location: LABCELL_X33_Y80_N33
\sync_sig_gen0|comp_hs_counter|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_hs_counter|Add0~33_sumout\ = SUM(( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(1) ) + ( GND ) + ( \sync_sig_gen0|comp_hs_counter|Add0~38\ ))
-- \sync_sig_gen0|comp_hs_counter|Add0~34\ = CARRY(( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(1) ) + ( GND ) + ( \sync_sig_gen0|comp_hs_counter|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(1),
	cin => \sync_sig_gen0|comp_hs_counter|Add0~38\,
	sumout => \sync_sig_gen0|comp_hs_counter|Add0~33_sumout\,
	cout => \sync_sig_gen0|comp_hs_counter|Add0~34\);

-- Location: FF_X33_Y80_N35
\sync_sig_gen0|comp_hs_counter|r_counter_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_hs_counter|Add0~33_sumout\,
	sclr => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_hs_counter|r_counter_reg\(1));

-- Location: LABCELL_X33_Y80_N36
\sync_sig_gen0|comp_hs_counter|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_hs_counter|Add0~29_sumout\ = SUM(( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(2) ) + ( GND ) + ( \sync_sig_gen0|comp_hs_counter|Add0~34\ ))
-- \sync_sig_gen0|comp_hs_counter|Add0~30\ = CARRY(( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(2) ) + ( GND ) + ( \sync_sig_gen0|comp_hs_counter|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(2),
	cin => \sync_sig_gen0|comp_hs_counter|Add0~34\,
	sumout => \sync_sig_gen0|comp_hs_counter|Add0~29_sumout\,
	cout => \sync_sig_gen0|comp_hs_counter|Add0~30\);

-- Location: FF_X33_Y80_N38
\sync_sig_gen0|comp_hs_counter|r_counter_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_hs_counter|Add0~29_sumout\,
	sclr => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_hs_counter|r_counter_reg\(2));

-- Location: LABCELL_X33_Y80_N39
\sync_sig_gen0|comp_hs_counter|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_hs_counter|Add0~25_sumout\ = SUM(( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(3) ) + ( GND ) + ( \sync_sig_gen0|comp_hs_counter|Add0~30\ ))
-- \sync_sig_gen0|comp_hs_counter|Add0~26\ = CARRY(( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(3) ) + ( GND ) + ( \sync_sig_gen0|comp_hs_counter|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(3),
	cin => \sync_sig_gen0|comp_hs_counter|Add0~30\,
	sumout => \sync_sig_gen0|comp_hs_counter|Add0~25_sumout\,
	cout => \sync_sig_gen0|comp_hs_counter|Add0~26\);

-- Location: FF_X33_Y80_N40
\sync_sig_gen0|comp_hs_counter|r_counter_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_hs_counter|Add0~25_sumout\,
	sclr => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_hs_counter|r_counter_reg\(3));

-- Location: LABCELL_X33_Y80_N42
\sync_sig_gen0|comp_hs_counter|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_hs_counter|Add0~21_sumout\ = SUM(( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(4) ) + ( GND ) + ( \sync_sig_gen0|comp_hs_counter|Add0~26\ ))
-- \sync_sig_gen0|comp_hs_counter|Add0~22\ = CARRY(( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(4) ) + ( GND ) + ( \sync_sig_gen0|comp_hs_counter|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(4),
	cin => \sync_sig_gen0|comp_hs_counter|Add0~26\,
	sumout => \sync_sig_gen0|comp_hs_counter|Add0~21_sumout\,
	cout => \sync_sig_gen0|comp_hs_counter|Add0~22\);

-- Location: FF_X33_Y80_N44
\sync_sig_gen0|comp_hs_counter|r_counter_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_hs_counter|Add0~21_sumout\,
	sclr => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_hs_counter|r_counter_reg\(4));

-- Location: LABCELL_X33_Y80_N45
\sync_sig_gen0|comp_hs_counter|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_hs_counter|Add0~13_sumout\ = SUM(( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(5) ) + ( GND ) + ( \sync_sig_gen0|comp_hs_counter|Add0~22\ ))
-- \sync_sig_gen0|comp_hs_counter|Add0~14\ = CARRY(( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(5) ) + ( GND ) + ( \sync_sig_gen0|comp_hs_counter|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(5),
	cin => \sync_sig_gen0|comp_hs_counter|Add0~22\,
	sumout => \sync_sig_gen0|comp_hs_counter|Add0~13_sumout\,
	cout => \sync_sig_gen0|comp_hs_counter|Add0~14\);

-- Location: FF_X33_Y80_N47
\sync_sig_gen0|comp_hs_counter|r_counter_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_hs_counter|Add0~13_sumout\,
	sclr => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_hs_counter|r_counter_reg\(5));

-- Location: LABCELL_X33_Y80_N48
\sync_sig_gen0|comp_hs_counter|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_hs_counter|Add0~17_sumout\ = SUM(( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(6) ) + ( GND ) + ( \sync_sig_gen0|comp_hs_counter|Add0~14\ ))
-- \sync_sig_gen0|comp_hs_counter|Add0~18\ = CARRY(( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(6) ) + ( GND ) + ( \sync_sig_gen0|comp_hs_counter|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(6),
	cin => \sync_sig_gen0|comp_hs_counter|Add0~14\,
	sumout => \sync_sig_gen0|comp_hs_counter|Add0~17_sumout\,
	cout => \sync_sig_gen0|comp_hs_counter|Add0~18\);

-- Location: FF_X33_Y80_N50
\sync_sig_gen0|comp_hs_counter|r_counter_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_hs_counter|Add0~17_sumout\,
	sclr => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_hs_counter|r_counter_reg\(6));

-- Location: LABCELL_X33_Y80_N51
\sync_sig_gen0|comp_hs_counter|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_hs_counter|Add0~5_sumout\ = SUM(( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(7) ) + ( GND ) + ( \sync_sig_gen0|comp_hs_counter|Add0~18\ ))
-- \sync_sig_gen0|comp_hs_counter|Add0~6\ = CARRY(( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(7) ) + ( GND ) + ( \sync_sig_gen0|comp_hs_counter|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(7),
	cin => \sync_sig_gen0|comp_hs_counter|Add0~18\,
	sumout => \sync_sig_gen0|comp_hs_counter|Add0~5_sumout\,
	cout => \sync_sig_gen0|comp_hs_counter|Add0~6\);

-- Location: FF_X33_Y80_N52
\sync_sig_gen0|comp_hs_counter|r_counter_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_hs_counter|Add0~5_sumout\,
	sclr => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_hs_counter|r_counter_reg\(7));

-- Location: LABCELL_X33_Y80_N54
\sync_sig_gen0|comp_hs_counter|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_hs_counter|Add0~1_sumout\ = SUM(( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(8) ) + ( GND ) + ( \sync_sig_gen0|comp_hs_counter|Add0~6\ ))
-- \sync_sig_gen0|comp_hs_counter|Add0~2\ = CARRY(( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(8) ) + ( GND ) + ( \sync_sig_gen0|comp_hs_counter|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(8),
	cin => \sync_sig_gen0|comp_hs_counter|Add0~6\,
	sumout => \sync_sig_gen0|comp_hs_counter|Add0~1_sumout\,
	cout => \sync_sig_gen0|comp_hs_counter|Add0~2\);

-- Location: FF_X33_Y80_N56
\sync_sig_gen0|comp_hs_counter|r_counter_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_hs_counter|Add0~1_sumout\,
	sclr => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_hs_counter|r_counter_reg\(8));

-- Location: LABCELL_X33_Y80_N57
\sync_sig_gen0|comp_hs_counter|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_hs_counter|Add0~9_sumout\ = SUM(( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(9) ) + ( GND ) + ( \sync_sig_gen0|comp_hs_counter|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(9),
	cin => \sync_sig_gen0|comp_hs_counter|Add0~2\,
	sumout => \sync_sig_gen0|comp_hs_counter|Add0~9_sumout\);

-- Location: FF_X33_Y80_N59
\sync_sig_gen0|comp_hs_counter|r_counter_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_hs_counter|Add0~9_sumout\,
	sclr => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_hs_counter|r_counter_reg\(9));

-- Location: LABCELL_X33_Y80_N15
\sync_sig_gen0|r_hs_next~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|r_hs_next~0_combout\ = ( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(2) & ( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(4) & ( (\sync_sig_gen0|comp_hs_counter|r_counter_reg\(6) & \sync_sig_gen0|comp_hs_counter|r_counter_reg\(5)) ) ) ) # 
-- ( !\sync_sig_gen0|comp_hs_counter|r_counter_reg\(2) & ( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(4) & ( (!\sync_sig_gen0|comp_hs_counter|r_counter_reg\(6) & (!\sync_sig_gen0|comp_hs_counter|r_counter_reg\(5) & 
-- !\sync_sig_gen0|comp_hs_counter|r_counter_reg\(3))) # (\sync_sig_gen0|comp_hs_counter|r_counter_reg\(6) & (\sync_sig_gen0|comp_hs_counter|r_counter_reg\(5) & \sync_sig_gen0|comp_hs_counter|r_counter_reg\(3))) ) ) ) # ( 
-- \sync_sig_gen0|comp_hs_counter|r_counter_reg\(2) & ( !\sync_sig_gen0|comp_hs_counter|r_counter_reg\(4) & ( (!\sync_sig_gen0|comp_hs_counter|r_counter_reg\(6) & !\sync_sig_gen0|comp_hs_counter|r_counter_reg\(5)) ) ) ) # ( 
-- !\sync_sig_gen0|comp_hs_counter|r_counter_reg\(2) & ( !\sync_sig_gen0|comp_hs_counter|r_counter_reg\(4) & ( (!\sync_sig_gen0|comp_hs_counter|r_counter_reg\(6) & !\sync_sig_gen0|comp_hs_counter|r_counter_reg\(5)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010001000100010000001100000010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(6),
	datab => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(5),
	datac => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(3),
	datae => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(2),
	dataf => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(4),
	combout => \sync_sig_gen0|r_hs_next~0_combout\);

-- Location: LABCELL_X33_Y80_N0
\sync_sig_gen0|r_hs_next~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|r_hs_next~1_combout\ = ( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(7) & ( \sync_sig_gen0|r_hs_next~0_combout\ ) ) # ( !\sync_sig_gen0|comp_hs_counter|r_counter_reg\(7) & ( \sync_sig_gen0|r_hs_next~0_combout\ ) ) # ( 
-- \sync_sig_gen0|comp_hs_counter|r_counter_reg\(7) & ( !\sync_sig_gen0|r_hs_next~0_combout\ & ( (!\sync_sig_gen0|comp_hs_counter|r_counter_reg\(9)) # (\sync_sig_gen0|comp_hs_counter|r_counter_reg\(8)) ) ) ) # ( 
-- !\sync_sig_gen0|comp_hs_counter|r_counter_reg\(7) & ( !\sync_sig_gen0|r_hs_next~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111110011111100111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(9),
	datac => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(8),
	datae => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(7),
	dataf => \sync_sig_gen0|ALT_INV_r_hs_next~0_combout\,
	combout => \sync_sig_gen0|r_hs_next~1_combout\);

-- Location: FF_X33_Y80_N1
\sync_sig_gen0|r_hs_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|r_hs_next~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|r_hs_reg~q\);

-- Location: MLABCELL_X34_Y80_N30
\sync_sig_gen0|comp_vs_counter|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_vs_counter|Add0~5_sumout\ = SUM(( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(0) ) + ( VCC ) + ( !VCC ))
-- \sync_sig_gen0|comp_vs_counter|Add0~6\ = CARRY(( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(0),
	cin => GND,
	sumout => \sync_sig_gen0|comp_vs_counter|Add0~5_sumout\,
	cout => \sync_sig_gen0|comp_vs_counter|Add0~6\);

-- Location: MLABCELL_X34_Y80_N39
\sync_sig_gen0|comp_vs_counter|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_vs_counter|Add0~33_sumout\ = SUM(( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(3) ) + ( GND ) + ( \sync_sig_gen0|comp_vs_counter|Add0~38\ ))
-- \sync_sig_gen0|comp_vs_counter|Add0~34\ = CARRY(( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(3) ) + ( GND ) + ( \sync_sig_gen0|comp_vs_counter|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(3),
	cin => \sync_sig_gen0|comp_vs_counter|Add0~38\,
	sumout => \sync_sig_gen0|comp_vs_counter|Add0~33_sumout\,
	cout => \sync_sig_gen0|comp_vs_counter|Add0~34\);

-- Location: MLABCELL_X34_Y80_N42
\sync_sig_gen0|comp_vs_counter|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_vs_counter|Add0~29_sumout\ = SUM(( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(4) ) + ( GND ) + ( \sync_sig_gen0|comp_vs_counter|Add0~34\ ))
-- \sync_sig_gen0|comp_vs_counter|Add0~30\ = CARRY(( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(4) ) + ( GND ) + ( \sync_sig_gen0|comp_vs_counter|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(4),
	cin => \sync_sig_gen0|comp_vs_counter|Add0~34\,
	sumout => \sync_sig_gen0|comp_vs_counter|Add0~29_sumout\,
	cout => \sync_sig_gen0|comp_vs_counter|Add0~30\);

-- Location: FF_X34_Y80_N44
\sync_sig_gen0|comp_vs_counter|r_counter_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_vs_counter|Add0~29_sumout\,
	sclr => \sync_sig_gen0|comp_vs_counter|Equal0~2_combout\,
	ena => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_vs_counter|r_counter_reg\(4));

-- Location: MLABCELL_X34_Y80_N45
\sync_sig_gen0|comp_vs_counter|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_vs_counter|Add0~25_sumout\ = SUM(( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(5) ) + ( GND ) + ( \sync_sig_gen0|comp_vs_counter|Add0~30\ ))
-- \sync_sig_gen0|comp_vs_counter|Add0~26\ = CARRY(( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(5) ) + ( GND ) + ( \sync_sig_gen0|comp_vs_counter|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(5),
	cin => \sync_sig_gen0|comp_vs_counter|Add0~30\,
	sumout => \sync_sig_gen0|comp_vs_counter|Add0~25_sumout\,
	cout => \sync_sig_gen0|comp_vs_counter|Add0~26\);

-- Location: FF_X34_Y80_N47
\sync_sig_gen0|comp_vs_counter|r_counter_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_vs_counter|Add0~25_sumout\,
	sclr => \sync_sig_gen0|comp_vs_counter|Equal0~2_combout\,
	ena => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_vs_counter|r_counter_reg\(5));

-- Location: MLABCELL_X34_Y80_N48
\sync_sig_gen0|comp_vs_counter|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_vs_counter|Add0~21_sumout\ = SUM(( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(6) ) + ( GND ) + ( \sync_sig_gen0|comp_vs_counter|Add0~26\ ))
-- \sync_sig_gen0|comp_vs_counter|Add0~22\ = CARRY(( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(6) ) + ( GND ) + ( \sync_sig_gen0|comp_vs_counter|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(6),
	cin => \sync_sig_gen0|comp_vs_counter|Add0~26\,
	sumout => \sync_sig_gen0|comp_vs_counter|Add0~21_sumout\,
	cout => \sync_sig_gen0|comp_vs_counter|Add0~22\);

-- Location: FF_X34_Y80_N49
\sync_sig_gen0|comp_vs_counter|r_counter_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_vs_counter|Add0~21_sumout\,
	sclr => \sync_sig_gen0|comp_vs_counter|Equal0~2_combout\,
	ena => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_vs_counter|r_counter_reg\(6));

-- Location: MLABCELL_X34_Y80_N51
\sync_sig_gen0|comp_vs_counter|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_vs_counter|Add0~17_sumout\ = SUM(( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(7) ) + ( GND ) + ( \sync_sig_gen0|comp_vs_counter|Add0~22\ ))
-- \sync_sig_gen0|comp_vs_counter|Add0~18\ = CARRY(( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(7) ) + ( GND ) + ( \sync_sig_gen0|comp_vs_counter|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(7),
	cin => \sync_sig_gen0|comp_vs_counter|Add0~22\,
	sumout => \sync_sig_gen0|comp_vs_counter|Add0~17_sumout\,
	cout => \sync_sig_gen0|comp_vs_counter|Add0~18\);

-- Location: FF_X34_Y80_N53
\sync_sig_gen0|comp_vs_counter|r_counter_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_vs_counter|Add0~17_sumout\,
	sclr => \sync_sig_gen0|comp_vs_counter|Equal0~2_combout\,
	ena => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_vs_counter|r_counter_reg\(7));

-- Location: MLABCELL_X34_Y80_N54
\sync_sig_gen0|comp_vs_counter|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_vs_counter|Add0~13_sumout\ = SUM(( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(8) ) + ( GND ) + ( \sync_sig_gen0|comp_vs_counter|Add0~18\ ))
-- \sync_sig_gen0|comp_vs_counter|Add0~14\ = CARRY(( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(8) ) + ( GND ) + ( \sync_sig_gen0|comp_vs_counter|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(8),
	cin => \sync_sig_gen0|comp_vs_counter|Add0~18\,
	sumout => \sync_sig_gen0|comp_vs_counter|Add0~13_sumout\,
	cout => \sync_sig_gen0|comp_vs_counter|Add0~14\);

-- Location: FF_X34_Y80_N56
\sync_sig_gen0|comp_vs_counter|r_counter_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_vs_counter|Add0~13_sumout\,
	sclr => \sync_sig_gen0|comp_vs_counter|Equal0~2_combout\,
	ena => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_vs_counter|r_counter_reg\(8));

-- Location: FF_X34_Y80_N58
\sync_sig_gen0|comp_vs_counter|r_counter_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_vs_counter|Add0~1_sumout\,
	sclr => \sync_sig_gen0|comp_vs_counter|Equal0~2_combout\,
	ena => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_vs_counter|r_counter_reg\(9));

-- Location: MLABCELL_X34_Y80_N57
\sync_sig_gen0|comp_vs_counter|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_vs_counter|Add0~1_sumout\ = SUM(( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(9) ) + ( GND ) + ( \sync_sig_gen0|comp_vs_counter|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(9),
	cin => \sync_sig_gen0|comp_vs_counter|Add0~14\,
	sumout => \sync_sig_gen0|comp_vs_counter|Add0~1_sumout\);

-- Location: FF_X34_Y80_N59
\sync_sig_gen0|comp_vs_counter|r_counter_reg[9]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_vs_counter|Add0~1_sumout\,
	sclr => \sync_sig_gen0|comp_vs_counter|Equal0~2_combout\,
	ena => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_vs_counter|r_counter_reg[9]~DUPLICATE_q\);

-- Location: MLABCELL_X34_Y80_N9
\sync_sig_gen0|comp_vs_counter|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_vs_counter|Equal0~1_combout\ = ( \sync_sig_gen0|comp_vs_counter|r_counter_reg[9]~DUPLICATE_q\ & ( (!\sync_sig_gen0|comp_vs_counter|r_counter_reg\(7) & (!\sync_sig_gen0|comp_vs_counter|r_counter_reg\(6) & 
-- !\sync_sig_gen0|comp_vs_counter|r_counter_reg\(8))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010100000000000001010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(7),
	datac => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(6),
	datad => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(8),
	dataf => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg[9]~DUPLICATE_q\,
	combout => \sync_sig_gen0|comp_vs_counter|Equal0~1_combout\);

-- Location: MLABCELL_X34_Y80_N12
\sync_sig_gen0|comp_vs_counter|Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_vs_counter|Equal0~2_combout\ = ( \sync_sig_gen0|comp_vs_counter|Equal0~0_combout\ & ( (!\sync_sig_gen0|comp_vs_counter|r_counter_reg\(1) & (\sync_sig_gen0|comp_vs_counter|Equal0~1_combout\ & 
-- (!\sync_sig_gen0|comp_vs_counter|r_counter_reg\(0) & !\sync_sig_gen0|comp_vs_counter|r_counter_reg\(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000100000000000000010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(1),
	datab => \sync_sig_gen0|comp_vs_counter|ALT_INV_Equal0~1_combout\,
	datac => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(0),
	datad => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(5),
	dataf => \sync_sig_gen0|comp_vs_counter|ALT_INV_Equal0~0_combout\,
	combout => \sync_sig_gen0|comp_vs_counter|Equal0~2_combout\);

-- Location: FF_X34_Y80_N31
\sync_sig_gen0|comp_vs_counter|r_counter_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_vs_counter|Add0~5_sumout\,
	sclr => \sync_sig_gen0|comp_vs_counter|Equal0~2_combout\,
	ena => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_vs_counter|r_counter_reg\(0));

-- Location: MLABCELL_X34_Y80_N33
\sync_sig_gen0|comp_vs_counter|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_vs_counter|Add0~9_sumout\ = SUM(( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(1) ) + ( GND ) + ( \sync_sig_gen0|comp_vs_counter|Add0~6\ ))
-- \sync_sig_gen0|comp_vs_counter|Add0~10\ = CARRY(( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(1) ) + ( GND ) + ( \sync_sig_gen0|comp_vs_counter|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(1),
	cin => \sync_sig_gen0|comp_vs_counter|Add0~6\,
	sumout => \sync_sig_gen0|comp_vs_counter|Add0~9_sumout\,
	cout => \sync_sig_gen0|comp_vs_counter|Add0~10\);

-- Location: FF_X34_Y80_N35
\sync_sig_gen0|comp_vs_counter|r_counter_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_vs_counter|Add0~9_sumout\,
	sclr => \sync_sig_gen0|comp_vs_counter|Equal0~2_combout\,
	ena => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_vs_counter|r_counter_reg\(1));

-- Location: MLABCELL_X34_Y80_N36
\sync_sig_gen0|comp_vs_counter|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_vs_counter|Add0~37_sumout\ = SUM(( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(2) ) + ( GND ) + ( \sync_sig_gen0|comp_vs_counter|Add0~10\ ))
-- \sync_sig_gen0|comp_vs_counter|Add0~38\ = CARRY(( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(2) ) + ( GND ) + ( \sync_sig_gen0|comp_vs_counter|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(2),
	cin => \sync_sig_gen0|comp_vs_counter|Add0~10\,
	sumout => \sync_sig_gen0|comp_vs_counter|Add0~37_sumout\,
	cout => \sync_sig_gen0|comp_vs_counter|Add0~38\);

-- Location: FF_X34_Y80_N38
\sync_sig_gen0|comp_vs_counter|r_counter_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_vs_counter|Add0~37_sumout\,
	sclr => \sync_sig_gen0|comp_vs_counter|Equal0~2_combout\,
	ena => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_vs_counter|r_counter_reg\(2));

-- Location: FF_X34_Y80_N41
\sync_sig_gen0|comp_vs_counter|r_counter_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_vs_counter|Add0~33_sumout\,
	sclr => \sync_sig_gen0|comp_vs_counter|Equal0~2_combout\,
	ena => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_vs_counter|r_counter_reg\(3));

-- Location: MLABCELL_X34_Y80_N15
\sync_sig_gen0|comp_vs_counter|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|comp_vs_counter|Equal0~0_combout\ = ( !\sync_sig_gen0|comp_vs_counter|r_counter_reg\(4) & ( (\sync_sig_gen0|comp_vs_counter|r_counter_reg\(3) & \sync_sig_gen0|comp_vs_counter|r_counter_reg\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(3),
	datad => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(2),
	dataf => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(4),
	combout => \sync_sig_gen0|comp_vs_counter|Equal0~0_combout\);

-- Location: FF_X34_Y80_N32
\sync_sig_gen0|comp_vs_counter|r_counter_reg[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|comp_vs_counter|Add0~5_sumout\,
	sclr => \sync_sig_gen0|comp_vs_counter|Equal0~2_combout\,
	ena => \sync_sig_gen0|comp_hs_counter|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|comp_vs_counter|r_counter_reg[0]~DUPLICATE_q\);

-- Location: MLABCELL_X34_Y80_N6
\sync_sig_gen0|r_vs_next~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|r_vs_next~0_combout\ = (\sync_sig_gen0|comp_vs_counter|r_counter_reg\(7) & (\sync_sig_gen0|comp_vs_counter|r_counter_reg\(6) & (\sync_sig_gen0|comp_vs_counter|r_counter_reg\(8) & \sync_sig_gen0|comp_vs_counter|r_counter_reg\(5))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000100000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(7),
	datab => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(6),
	datac => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(8),
	datad => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(5),
	combout => \sync_sig_gen0|r_vs_next~0_combout\);

-- Location: MLABCELL_X34_Y80_N0
\sync_sig_gen0|r_vs_next~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|r_vs_next~1_combout\ = ( \sync_sig_gen0|r_vs_next~0_combout\ & ( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(9) ) ) # ( !\sync_sig_gen0|r_vs_next~0_combout\ & ( \sync_sig_gen0|comp_vs_counter|r_counter_reg\(9) ) ) # ( 
-- \sync_sig_gen0|r_vs_next~0_combout\ & ( !\sync_sig_gen0|comp_vs_counter|r_counter_reg\(9) & ( (!\sync_sig_gen0|comp_vs_counter|Equal0~0_combout\) # (!\sync_sig_gen0|comp_vs_counter|r_counter_reg\(1) $ 
-- (\sync_sig_gen0|comp_vs_counter|r_counter_reg[0]~DUPLICATE_q\)) ) ) ) # ( !\sync_sig_gen0|r_vs_next~0_combout\ & ( !\sync_sig_gen0|comp_vs_counter|r_counter_reg\(9) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111001100111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \sync_sig_gen0|comp_vs_counter|ALT_INV_Equal0~0_combout\,
	datac => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(1),
	datad => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg[0]~DUPLICATE_q\,
	datae => \sync_sig_gen0|ALT_INV_r_vs_next~0_combout\,
	dataf => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg\(9),
	combout => \sync_sig_gen0|r_vs_next~1_combout\);

-- Location: FF_X34_Y80_N1
\sync_sig_gen0|r_vs_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|r_vs_next~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|r_vs_reg~q\);

-- Location: LABCELL_X33_Y80_N9
\sync_sig_gen0|r_blank_next~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sync_sig_gen0|r_blank_next~0_combout\ = ( \sync_sig_gen0|comp_hs_counter|r_counter_reg\(7) & ( (!\sync_sig_gen0|comp_vs_counter|r_counter_reg[9]~DUPLICATE_q\ & (!\sync_sig_gen0|comp_hs_counter|r_counter_reg\(9) & !\sync_sig_gen0|r_vs_next~0_combout\)) ) 
-- ) # ( !\sync_sig_gen0|comp_hs_counter|r_counter_reg\(7) & ( (!\sync_sig_gen0|comp_vs_counter|r_counter_reg[9]~DUPLICATE_q\ & (!\sync_sig_gen0|r_vs_next~0_combout\ & ((!\sync_sig_gen0|comp_hs_counter|r_counter_reg\(8)) # 
-- (!\sync_sig_gen0|comp_hs_counter|r_counter_reg\(9))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100100000000000110000000000000011001000000000001100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(8),
	datab => \sync_sig_gen0|comp_vs_counter|ALT_INV_r_counter_reg[9]~DUPLICATE_q\,
	datac => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(9),
	datad => \sync_sig_gen0|ALT_INV_r_vs_next~0_combout\,
	datae => \sync_sig_gen0|comp_hs_counter|ALT_INV_r_counter_reg\(7),
	combout => \sync_sig_gen0|r_blank_next~0_combout\);

-- Location: FF_X33_Y80_N10
\sync_sig_gen0|r_blank_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ync_sig_gen0|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \sync_sig_gen0|r_blank_next~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sig_gen0|r_blank_reg~q\);

-- Location: LABCELL_X22_Y65_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;


pll_reconfig_inst_tasks : altera_pll_reconfig_tasks
-- pragma translate_off
GENERIC MAP (
      number_of_fplls => 1);
-- pragma translate_on
END structure;


