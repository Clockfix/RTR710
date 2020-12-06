--------------------------------------------------------------------------------
--! @file  delay_sl.vhd
--!
--! @brief Delays signal of standard logic type specified number of times.
--!		   Note that VHDL 2008 input must be set
--------------------------------------------------------------------------------

library ieee;
library rtu;
use ieee.std_logic_1164.all;
use rtu.data_types.all;

entity delay_sl is
    generic(
        DELAY_COUNT    : natural := 17
    );
    port(
        clk        : in std_logic;
        enable     : in std_logic;
        data_in    : in std_logic;
        data_out   : out std_logic
    );
end entity;

architecture RTL of delay_sl is 
    signal data_reg, data_next : std_logic_vector(DELAY_COUNT-1 downto 0) := (others => '0');
    
begin
    -- reg-state logic
    process
    begin
        wait until rising_edge(clk);
        if enable = '1' then
            data_reg <= data_next;
        end if;
    end process;
    
    -- next-state logic
    process(all)
    begin
        data_next(0) <= data_in;
        for i in 0 to DELAY_COUNT-2 loop
            data_next(i+1) <= data_reg(i);
        end loop;
    end process;
    
    -- outputs
    data_out <= data_reg(DELAY_COUNT-1);
    
end architecture;
