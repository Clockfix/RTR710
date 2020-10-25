-----------------------------
-- Author - Imants Pulkstenis
-- Date - 25.10.2020 
-- Project name - Problem stet 1  
-- Module name - main- TOP entity
--
-- Detailed module description
-- Testing Chanlae 2
--
-- Revision:
-- A - initial design
-- B - 
--
-----------------------------
LIBRARY ieee; --always use this library
USE ieee.std_logic_1164.ALL; --always use this library
USE ieee.numeric_std.ALL; --use this library if arithmetic require
ENTITY main IS
    PORT (
        -- i_b : IN unsigned( 15 downto 0); 
        o_sum : OUT unsigned(15 DOWNTO 0);
        i_a : IN unsigned(15 DOWNTO 0)
    );
END main;

ARCHITECTURE rtl OF main IS
    CONSTANT c_two : unsigned (15 DOWNTO 0) := "0000000000000001";
    CONSTANT c_three : unsigned (15 DOWNTO 0) := "0000000010000000";
    CONSTANT c_four : unsigned (15 DOWNTO 0) := "1000000000000000";
    CONSTANT c_five : unsigned (15 DOWNTO 0) := "1010101010101010";

BEGIN

    -- o_sum <= i_a + i_b;  -- 1
    -- o_sum <= i_a + c_two;   -- 2
    -- o_sum <= i_a + c_three;   -- 3
    -- o_sum <= i_a + c_four;   -- 4
    o_sum <= i_a + c_five; -- 5
END rtl;