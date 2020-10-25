library rtu;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package random is
	type random_t is protected
        impure function random_slv return std_logic;
        impure function random_slv (len : natural) return std_logic_vector;
	end protected;
end package;


package body random is
  ------------------------------------------------------------------------------
  -- Model-based test
  ------------------------------------------------------------------------------
  type random_t is protected body

    -- For pseudo random generator
    variable SEED1, SEED2 : integer := 1;

    -- Generate random std_logic
    impure function random_slv return std_logic is
      variable r   : real;
      variable sl  : std_logic;
    begin
      uniform(SEED1, SEED2, r);
      sl := '1' when r > 0.5 else '0';
      return sl;
    end function;

    -- Generate random std_logic_vector
    impure function random_slv (len : natural) return std_logic_vector is
      variable r   : real;
      variable slv : std_logic_vector(len-1 downto 0);
    begin
      for i in slv'range loop
        uniform(SEED1, SEED2, r);
        slv(i) := '1' when r > 0.5 else '0';
      end loop;
      return slv;
    end function;

  end protected body;
end package body;
