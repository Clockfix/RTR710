----------------------------------------------------------------------------------
-- Company: Riga Technical University
-- Engineer: Imants Pulkstenis
-- 
-- Create Date: 10/20/2020 12:00:51 AM
-- Design Name: 
-- Module Name: Challenge 2 - Behavioral
-- Project Name: Problem set 1
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

LIBRARY ieee; --always use this library
USE ieee.std_logic_1164.ALL; --always use this library
USE IEEE.numeric_std.ALL;
ENTITY challenge2 IS
    PORT (
        a, b : IN unsigned(15 DOWNTO 0);
        z : OUT unsigned(15 DOWNTO 0)
    );
END challenge2;

ARCHITECTURE behavioral OF challenge2 IS
BEGIN
    PROCESS (a, b)
    BEGIN
        z <= a + b;
    END PROCESS;
END behavioral;