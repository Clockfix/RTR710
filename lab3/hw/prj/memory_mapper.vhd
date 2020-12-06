library ieee;
use ieee.std_logic_1164.all;

entity memory_mapper is
	port(
		clk           : in std_logic;
		reset	        : in std_logic;
		-- avalon mm in
		writereq_in   : in std_logic;
		writedata_in  : in std_logic_vector(7 downto 0);
		address_in    : in std_logic_vector(1 downto 0);
		-- avalon mm out
		writereq_out  : out std_logic;
		writedata_out : out std_logic_vector(7 downto 0);
		address_out   : out std_logic_vector(1 downto 0)
	);
end entity;

architecture RTL of memory_mapper is
begin
	-- mapping
	writereq_out  <= writereq_in;
	writedata_out <= writedata_in;
	address_out   <= address_in;

end architecture;