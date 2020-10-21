library ieee;
library rtu;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use rtu.random.all;

entity tb is
end entity;

architecture RTL of tb is
  -- Test constants
  constant TEST_COUNT : natural := 1000;

  -- DUT signals
  signal input  : std_logic_vector(15 downto 0) := (others => '0');
  signal shift  : std_logic_vector(3  downto 0) := (others => '0');
  signal output : std_logic_vector(15 downto 0) := (others => '0');
begin

  ------------------------------------------------------------------------------
  -- Instantianate DUT
  ------------------------------------------------------------------------------
  DUT: entity work.circular_shifter_left
  port map(input, shift, output);

  ------------------------------------------------------------------------------
  -- Model-based test
  ------------------------------------------------------------------------------
  process
    variable random : random_t;
    variable dut_output : std_logic_vector(output'range) := (others => '0');
    
    procedure update_dut is
      variable dut_shift : natural := to_integer(unsigned(shift));
    begin
      dut_output(dut_output'high downto dut_shift) 
        := input(dut_output'high-dut_shift downto 0);
      if(unsigned(shift) > 0) then
        dut_output((dut_shift-1) downto 0) 
          := input(dut_output'high downto dut_output'high-(dut_shift-1));
      end if;
    end procedure;

    procedure update_input is
    begin
      input <= random.random_slv(input'length);
      shift <= random.random_slv(shift'length);
    end procedure;

    procedure check_dut is
    begin
        if output /= dut_output then
          report "TEST FAILED, " &
            "Expecting: " & integer'image(to_integer(unsigned(dut_output))) & "; " &
            "Got: " & integer'image(to_integer(unsigned(output)))
            severity FAILURE;
        end if;
    end procedure;
  begin

    for i in 0 to TEST_COUNT-1 loop
        update_input;
        wait for 10 ns;
        update_dut;
        check_dut;
    end loop;
    report"TEST SUCCESSFUL";
    wait;
  end process;

end architecture;
