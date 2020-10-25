-----------------------------
-- Author - Imants Pulkstenis
-- Date - 25.10.2020 
-- Project name - Problem stet 1  
-- Module name - circular_shifter_left
--
-- Detailed module description
-- Testing Chanlae 4
--
-- Revision:
-- A - initial design
-- B - 
--
-----------------------------
LIBRARY ieee; --always use this library
USE ieee.std_logic_1164.ALL; --always use this library
USE ieee.numeric_std.ALL; --use this library if arithmetic require

ENTITY circular_shifter_left IS
    PORT (
        input : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        shift : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE rtl OF circular_shifter_left IS

BEGIN
    output <= input WHEN shift = x"0" ELSE
        (input(14 DOWNTO 0) & input(15 DOWNTO 15)) WHEN shift = x"1" ELSE
        (input(13 DOWNTO 0) & input(15 DOWNTO 14)) WHEN shift = x"2" ELSE
        (input(12 DOWNTO 0) & input(15 DOWNTO 13)) WHEN shift = x"3" ELSE
        (input(11 DOWNTO 0) & input(15 DOWNTO 12)) WHEN shift = x"4" ELSE
        (input(10 DOWNTO 0) & input(15 DOWNTO 11)) WHEN shift = x"5" ELSE
        (input(09 DOWNTO 0) & input(15 DOWNTO 10)) WHEN shift = x"6" ELSE
        (input(08 DOWNTO 0) & input(15 DOWNTO 09)) WHEN shift = x"7" ELSE
        (input(07 DOWNTO 0) & input(15 DOWNTO 08)) WHEN shift = x"8" ELSE
        (input(06 DOWNTO 0) & input(15 DOWNTO 07)) WHEN shift = x"9" ELSE
        (input(05 DOWNTO 0) & input(15 DOWNTO 06)) WHEN shift = x"a" ELSE
        (input(04 DOWNTO 0) & input(15 DOWNTO 05)) WHEN shift = x"b" ELSE
        (input(03 DOWNTO 0) & input(15 DOWNTO 04)) WHEN shift = x"c" ELSE
        (input(02 DOWNTO 0) & input(15 DOWNTO 03)) WHEN shift = x"d" ELSE
        (input(01 DOWNTO 0) & input(15 DOWNTO 02)) WHEN shift = x"e" ELSE
        (input(00 DOWNTO 0) & input(15 DOWNTO 01));

END rtl;