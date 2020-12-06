-- synopsis directives:
-- synthesis VHDL_INPUT_VERSION VHDL_2008

library ieee;
use ieee.std_logic_1164.all;

package data_types is
	type aslv is array(natural range <>) of std_logic_vector;
end package;

package body data_types is
end package body;
