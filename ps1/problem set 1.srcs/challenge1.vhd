----------------------------------------------------------------------------------
-- Company: Riga Technical University
-- Engineer: Imants Pulkstenis
-- 
-- Create Date: 10/20/2020 12:00:51 AM
-- Design Name: 
-- Module Name: Challenge 1 - Behavioral
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
ENTITY challenge1 IS
    PORT (
        status : OUT STD_LOGIC;
        op, a, b : IN unsigned(1 DOWNTO 0);
        y, z : OUT unsigned(1 DOWNTO 0)
    );
END challenge1;

ARCHITECTURE behavioral OF challenge1 IS
BEGIN
    PROCESS (a, b, op)
    BEGIN
        IF (a > b AND op = "00") THEN
            y <= a - b;
            z <= a - 1;
            status <= '0';
        ELSE
            y <= b - a;
            z <= b - 1;
            status <= '1';
        END IF;
    END PROCESS;
END behavioral;