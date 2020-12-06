library ieee;
library rtu;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use rtu.simulation.all;

entity tb is
end entity;

architecture RTL of tb is
    constant CLOCK_PERIOD   : time := 10 ns;
    constant ARRAY_SIZE     : natural := 16;
    constant DATA_IN_WIDTH  : natural := 8;
    constant DATA_OUT_WIDTH : natural := 16;

    signal clk       : std_logic := '0';
    signal valid_in  : std_logic := '0';
    signal ready_out : std_logic := '0';
    signal data_in   : std_logic_vector(ARRAY_SIZE*DATA_IN_WIDTH-1 downto 0) := (others => '0');
    signal valid_out : std_logic := '0';
    signal ready_in  : std_logic := '0';
    signal data_out  : std_logic_vector(DATA_OUT_WIDTH-1 downto 0) := (others => '0');
begin
    --------------------------------------------------------------------------------
    -- Device Under Test
    --------------------------------------------------------------------------------
    DUT: entity work.lab
    port map(clk, 
        valid_in, ready_out, data_in, 
        valid_out, ready_in, data_out);

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
        procedure check_value(value: in integer) is
            variable data_out_order : std_logic_vector(15 downto 0);
        begin
            data_out_order(7 downto 0)  := data_out(15 downto 8);
            data_out_order(15 downto 8) := data_out(7 downto 0);
            if( to_integer(unsigned(data_out_order)) /= value ) then
                report "FAILURE: Data out assertion failed! " &
                       "Expected: " & integer'image(value) & " " & 
                       "Got:" & integer'image(to_integer(unsigned(data_out_order)))
                       severity FAILURE;
            end if;
        end procedure;

        procedure check_valid_out(valid : in std_logic) is
        begin
            if( valid /= valid_out ) then
                if valid = '1' then
                    report "FAILURE: Valid out assertion failed! (Expected '1' instead of '0')"
                    severity FAILURE;
                else
                    report "FAILURE: Valid out assertion failed! (Expected '0' instead of '1')"
                    severity FAILURE;
                end if;
            end if;
        end procedure;
    begin
        wait until rising_edge(clk);

        report "1. test with active enable and valid signals!";
        valid_in <= '1';
        ready_in <= '1';
        data_in  <= ("00000010" & "00000001" & "00000001" & "00000001" &
                     "00000001" & "00000001" & "00000001" & "00000001" &
                     "00000001" & "00000001" & "00000001" & "00000001" &
                     "00000001" & "00000001" & "00000001" & "00000001");

        wait until rising_edge(clk);
        data_in  <= ("00000011"  & "00000011" & "00000011" & "00000011" &
                     "00000011"  & "00000011" & "00000011" & "00000011" &
                     "00000011"  & "00000011" & "00000011" & "00000011" &
                     "00000011"  & "00000011" & "00000011" & "00000011");
        check_valid_out('0');

        wait until rising_edge(clk);
        data_in  <= ("00000010" & "00000010" & "00000010" & "00000010" &
                     "00000010" & "00000010" & "00000010" & "00000010" &
                     "00000010" & "00000010" & "00000010" & "00000010" &
                     "00000010" & "00000010" & "00000010" & "00000010");
        check_valid_out('0');

        wait until rising_edge(clk);
        data_in  <= ("00000111" & "00000111" & "00000111" & "00000111" &
                     "00000111" & "00000111" & "00000111" & "00000111" &
                     "00000111" & "00000111" & "00000111" & "00000111" &
                     "00000111" & "00000111" & "00000111" & "00000111");
        check_valid_out('0');

        wait until rising_edge(clk);
        data_in  <= ("00000110" & "00000110" & "00000110" & "00000110" &
                     "00000110" & "00000110" & "00000110" & "00000110" &
                     "00000110" & "00000110" & "00000110" & "00000110" &
                     "00000110" & "00000110" & "00000110" & "00000110");
        check_valid_out('0');

        wait until rising_edge(clk);
        valid_in <= '0';
        check_valid_out('1');
        check_value(15*1 + 2);
        
        wait until rising_edge(clk);
        check_valid_out('1');
        check_value(16*3);

        wait until rising_edge(clk);
        check_valid_out('1');
        check_value(16*2);

        wait until rising_edge(clk);
        check_valid_out('1');
        check_value(16*7);

        wait until rising_edge(clk);
        check_valid_out('1');
        check_value(16*6);

        report "Test SUCCESSFUL!";

        report "2. test with active enable!";
        ready_in <= '1';

        valid_in <= '0';
        data_in  <= ("00000000" & "00000000" & "00000000" & "00000000" &
                     "00000000" & "00000000" & "00000000" & "00000000" &
                     "00000000" & "00000000" & "00000000" & "00000000" &
                     "00000000" & "00000000" & "00000000" & "00000000");
        wait until rising_edge(clk);
        
        valid_in <= '1';
        data_in  <= ("00000001" & "00000001" & "00000001" & "00000001" &
                     "00000001" & "00000001" & "00000001" & "00000001" &
                     "00000001" & "00000001" & "00000001" & "00000001" &
                     "00000001" & "00000001" & "00000001" & "00000001");
        wait until rising_edge(clk);

        valid_in <= '0';
        wait until rising_edge(clk);

        wait until rising_edge(clk);

        wait until rising_edge(clk);
        check_valid_out('0');

        wait until rising_edge(clk);
        check_valid_out('1');
        check_value(16*1);
        report "Test SUCCESSFUL!";
        

        report "3. test with active enable and valid signals!";
        ready_in <= '1';
        valid_in <= '1';
        data_in  <= ("00000001" & "00000001" & "00000001" & "00000001" &
                     "00000001" & "00000001" & "00000001" & "00000001" &
                     "00000001" & "00000001" & "00000001" & "00000001" &
                     "00000001" & "00000001" & "00000001" & "00000001");
        wait until rising_edge(clk);

        valid_in <= '0';
        wait until rising_edge(clk);

        ready_in <= '0';
        wait until rising_edge(clk);

        ready_in <= '1';
        wait until rising_edge(clk);

        wait until rising_edge(clk);
        check_valid_out('0');

        wait until rising_edge(clk);
        check_valid_out('1');
        check_value(16*1);

        report "Test SUCCESSFUL!";
        simulation_stop;
        simulation_stop_condition;
    end process;

end architecture;
