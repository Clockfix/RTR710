library ieee;
use ieee.std_logic_1164.all;

entity tb is
end entity;

architecture RTL of tb is
   signal a,b,c : std_logic := '0';
begin
    ----------------------------------------------------------------------------
    -- Instantianate DUT
    ----------------------------------------------------------------------------
    DUT: entity work.custom_and
    port map(a,b,c);

    ----------------------------------------------------------------------------
    -- Test sequencer
    ----------------------------------------------------------------------------
    process
        procedure dut_check is
        begin
            if (c /= (a and b)) then
                report "CHECK ERROR!" severity FAILURE;
            end if;
            report "CHECK SUCCESSFUL";
        end procedure;
    begin
        a <= '0';
        b <= '0';
        wait for 10 ns;
        dut_check;

        a <= '1';
        b <= '0';
        wait for 10 ns;
        dut_check;

        a <= '0';
        b <= '1';
        wait for 10 ns;
        dut_check;

        a <= '1';
        b <= '1';
        wait for 10 ns;
        dut_check;

        std.env.stop;
    end process;
end architecture;
