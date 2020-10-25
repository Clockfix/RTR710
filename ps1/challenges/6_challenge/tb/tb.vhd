library ieee;
library rtu;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use rtu.random.all;
use rtu.simulation.all;

entity tb is
end entity;

architecture RTL of tb is
  -- Test constants
  constant TEST_COUNT : natural := 1000;
  constant CLK_PERIOD : time := 10 ns;

  -- DUT signals
  signal clk       : std_logic := '0';
  signal start     : std_logic := '0';
  signal divident  : std_logic_vector(15 downto 0) := (others => '0');
  signal divisor   : std_logic_vector(15 downto 0) := (others => '0');
  signal done      : std_logic := '0';
  signal quotient  : std_logic_vector(15 downto 0) := (others => '0');
  signal reminder  : std_logic_vector(15 downto 0) := (others => '0');

begin

  ------------------------------------------------------------------------------
  -- Instantianate DUT
  ------------------------------------------------------------------------------
  DUT: entity work.trivial_divider
  port map(clk,
    start, divident, divisor, 
    done, quotient, reminder);
    
  ------------------------------------------------------------------------------
  -- Clock (bad practice)
  ------------------------------------------------------------------------------
  process
  begin
    wait for CLK_PERIOD/2;
    clk <= not clk;
    simulation_stop_check;
  end process;

  ------------------------------------------------------------------------------
  -- Model-based test
  ------------------------------------------------------------------------------
  process
    variable random : random_t;
    variable dut_quotient : std_logic_vector(quotient'range) := (others => '0');
    variable dut_reminder : std_logic_vector(reminder'range) := (others => '0');
    
    procedure update_input is
    begin
      divident <= random.random_slv(divident'length);
      divisor  <= random.random_slv(divisor'length);
    end procedure;

    procedure update_dut is
    begin
        dut_quotient := 
          std_logic_vector(to_unsigned(
            to_integer(unsigned(divident)) / to_integer(unsigned(divisor)),
            dut_quotient'length));
        dut_reminder := 
          std_logic_vector(to_unsigned(
            to_integer(unsigned(divident)) rem to_integer(unsigned(divisor)),
            dut_reminder'length));
    end procedure;

    procedure wait_dut_done is
      -- CLK_PERIOD * (margin + expected_time)
      variable timeout : time :=
        CLK_PERIOD * 
        (5+to_integer(unsigned(divident)) / to_integer(unsigned(divisor)));
    begin
        wait until rising_edge(done) for timeout;
        if done = '0' then
            report "FAILURE (TIMEOUT): done signal was not risen high in the "
                 & "given time interval." severity FAILURE;
        end if;
    end procedure;

    procedure check_dut is
    begin
        report 
          "Expression: " 
            & integer'image(to_integer(unsigned(divident))) & " / "
            & integer'image(to_integer(unsigned(divisor))) & "; " &
          "Expected: " 
            & integer'image(to_integer(unsigned(dut_quotient))) & " (rem: "
            & integer'image(to_integer(unsigned(dut_reminder))) & " ); " &
          "Got: "
            & integer'image(to_integer(unsigned(quotient))) & " (rem: "
            & integer'image(to_integer(unsigned(reminder))) & " ); ";

        if (dut_quotient /= quotient) or (dut_reminder /= reminder) then
            report "FAILURE (NO MATCH): the expected and modelled outputs do not match."
            severity FAILURE;
        end if;
    end procedure;

  begin
    for i in 0 to TEST_COUNT-1 loop
        update_input;

        -- simulate start pulse
        wait for CLK_PERIOD;
        start <= '1';
        wait for CLK_PERIOD;
        start <= '0';

        -- lets calculate what the output should be
        update_dut;

        -- wait for done signal or timeout
        wait_dut_done;
    
        -- finally check the output    
        check_dut;
    end loop;
    report"TEST SUCCESSFUL";
    simulation_stop;
  end process;

end architecture;
