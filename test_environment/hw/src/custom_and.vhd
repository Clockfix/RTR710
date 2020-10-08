library ieee;
use ieee.std_logic_1164.all;

entity custom_and is
port(
    a,b : in  std_logic;
    c   : out std_logic
);
end entity;

architecture RTL of custom_and is
begin
    c <= a and b;
end architecture;
