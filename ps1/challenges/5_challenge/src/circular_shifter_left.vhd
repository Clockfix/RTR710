library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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
    output <= std_logic_vector(unsigned(input) rol to_integer(unsigned(shift))) ;

end architecture;
