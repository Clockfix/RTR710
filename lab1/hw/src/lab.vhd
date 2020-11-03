library ieee;
use ieee.std_logic_1164.all;

entity lab is
	port(
		clk : in std_logic;
		-- avalon-mm interface
		writereq  : in std_logic;
		address   : in std_logic_vector(1 downto 0);
		writedata : in std_logic_vector(7 downto 0);
		-- outputs for 7segment displayes
		val0     : out std_logic_vector(7 downto 0);
		val1     : out std_logic_vector(7 downto 0);
		val2     : out std_logic_vector(7 downto 0)
	);
end entity;

architecture RTL of lab is
	-- <LAB: your code goes here>
begin
	-- reg-state logic
	-- <LAB: your code goes here>

	-- next-state logic
	-- <LAB: your code goes here>
	
	-- outputs
	-- <LAB: your code goes here>

end architecture;