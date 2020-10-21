library ieee;
library rtu;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use rtu.random.all;

entity trivial_divider is
    port(
        clk       : in  std_logic;
        start     : in  std_logic;
        divident  : in  std_logic_vector(15 downto 0);
        divisor   : in  std_logic_vector(15 downto 0);
        done      : out std_logic := '0';
        quotient  : out std_logic_vector(15 downto 0) := (others => '0');
        reminder  : out std_logic_vector(15 downto 0) := (others => '0')
    );
end entity;

architecture RTL of trivial_divider is

    -- signal declaration
    -- <your code goes here>

begin

    -- reg-state logic
    -- <your code goes here>

    -- next-state logic
    -- <your code goes here>

    -- outputs
    -- <your code goes here>

end architecture;
