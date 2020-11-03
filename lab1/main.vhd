-----------------------------
-- Author - Imants Pulkstenis
-- Date - 28.10.2020 
-- Project name - LAB1
-- Module name - main- TOP entity
--
-- Detailed module description
--
-- Revision:
-- A - initial design
-- B - 
--
-----------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY trivial_divider IS
    PORT (
        clk : IN STD_LOGIC;
        i_wr : IN STD_LOGIC;
        i_addr : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        i_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        o_hex_one : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        o_hex_two : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        o_hex_three : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) 
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


    -- reg-state logic
    -- <your code goes here>
    PROCESS (ALL)
    BEGIN
  
    END PROCESS;

    -- next-state logic
    -- <your code goes here>


    -- outputs
    -- <your code goes here>

END ARCHITECTURE;