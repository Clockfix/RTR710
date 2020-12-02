-------------------------------------------------------
--! @file  functions.vhd
-------------------------------------------------------
-- synopsis directives:
-- synthesis VHDL_INPUT_VERSION VHDL_2008
-- synthesis LIBRARY rtu

library ieee;
use ieee.std_logic_1164.all;

package functions is
	function log2c (input:natural) return natural;
end package;

package body functions is
	function log2c (input:natural) return natural is
	variable tmp   :natural;  -- temporary variable
	variable log   :natural;  -- result
	begin
		tmp := input-1;
		log := 0;
		while tmp /= 0 loop
			tmp := tmp/2;
			log := log+1;
		end loop;
		return log;
	end function;
	
end package body;
