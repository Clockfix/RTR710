LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY main IS
    PORT (
        a : IN unsigned(15 DOWNTO 0);
        b : IN unsigned(15 DOWNTO 0);
        c : IN unsigned(15 DOWNTO 0);
        y : OUT unsigned(15 DOWNTO 0) := (OTHERS => '0')
    );
END ENTITY;

ARCHITECTURE RTL OF main IS

BEGIN

    y <= a - b WHEN a > b ELSE
        a - c WHEN a > c ELSE
        a + 1;

END ARCHITECTURE;