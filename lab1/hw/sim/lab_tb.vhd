library ieee;
library edi;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use edi.simulation.all;


entity lab_tb is
end entity;

architecture RTL of lab_tb is
    constant CLOCK_PERIOD : time := 10 ns;

    signal clk       : std_logic := '0';
    signal writereq  : std_logic := '0';
    signal address   : std_logic_vector(1 downto 0) := (others => '0');
    signal writedata : std_logic_vector(7 downto 0) := (others => '0');
    signal val0      : std_logic_vector(7 downto 0) := (others => '0');
    signal val1      : std_logic_vector(7 downto 0) := (others => '0');
    signal val2      : std_logic_vector(7 downto 0) := (others => '0');
begin
    --------------------------------------------------------------------------------
    -- Device Under Test
    --------------------------------------------------------------------------------
    DUT: entity work.lab
    port map(clk, writereq, address, writedata, val0, val1, val2);

    --------------------------------------------------------------------------------
    -- Clock generation
    --------------------------------------------------------------------------------
    CLOCK: process
    begin
        wait for CLOCK_PERIOD/2;
        clk <= not clk;
        simulation_stop_condition;
    end process;

    --------------------------------------------------------------------------------
    -- Test sequencer
    --------------------------------------------------------------------------------
    process
        procedure check_values(
            val0_anticipated : in std_logic_vector(7 downto 0);
            val1_anticipated : in std_logic_vector(7 downto 0);
            val2_anticipated : in std_logic_vector(7 downto 0)
        ) is
        begin
            if ((val0_anticipated /= val0) or
                (val1_anticipated /= val1) or
                (val2_anticipated /= val2)) then
                report "Test FAILED!" severity FAILURE;
            end if;
        end procedure;
    begin
        wait until rising_edge(clk);

        -- write "10101010"@"00"
        writereq  <= '1';
        address   <= "00";
        writedata <= "10101010";
        wait until rising_edge(clk);
        wait until falling_edge(clk);
        check_values("10101010", "00000000", "00000000");
        
        -- wait one cycle
        writereq  <= '0';
        wait until rising_edge(clk);
        wait until falling_edge(clk);
        check_values("10101010", "00000000", "00000000");

        -- write "11110000"@"01"
        writereq  <= '1';
        address   <= "01";
        writedata <= "11110000";
        wait until rising_edge(clk);
        wait until falling_edge(clk);
        check_values("10101010", "11110000", "00000000");
        
        -- wait one cycle
        writereq  <= '0';
        wait until rising_edge(clk);
        wait until falling_edge(clk);
        check_values("10101010", "11110000", "00000000");
        
        -- write "11100011"@"10"
        writereq  <= '1';
        address   <= "10";
        writedata <= "11100011";
        wait until rising_edge(clk);
        wait until falling_edge(clk);
        check_values("10101010", "11110000", "11100011");
        
        -- wait one cycle
        writereq  <= '0';
        wait until rising_edge(clk);
        wait until falling_edge(clk);
        check_values("10101010", "11110000", "11100011");

        report "Test SUCCESSFUL!";
        simulation_stop;
    end process;

end architecture;
