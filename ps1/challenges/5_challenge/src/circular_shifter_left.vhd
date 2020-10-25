library ieee;
use ieee.std_logic_1164.all;

entity circular_shifter_left is
    port(
        input  : in  std_logic_vector(15 downto 0);
        shift  : in  std_logic_vector(3  downto 0);
        output : out std_logic_vector(15 downto 0) := (others => '0')
    );
end entity;

architecture RTL of circular_shifter_left is

    -- signal declaration
    -- < your code goes here >

begin

    -- implementation
    -- < your code goes here >
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

end architecture;
