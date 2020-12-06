--------------------------------------------------------------------------------
--! @file  lab.vhd
--!
--! @brief This block receives a vector, splits into smaller chunks for addition,
--!        adds the cunks and sends sum to the output. The circuit communicates
--!        via avalon streaming interface.
--!		   Note that VHDL 2008 input must be set
--------------------------------------------------------------------------------

library ieee;
library rtu;
use ieee.std_logic_1164.all;
use rtu.functions.all;
use rtu.data_types.all;

entity lab is
    generic(
        ARRAY_SIZE     : natural := 16;
        DATA_IN_WIDTH  : natural := 8;
        DATA_OUT_WIDTH : natural := 16
    );
    port(
        clk   : in std_logic;
        -- avalon stream (from memory)
        valid_in  : in  std_logic;
        ready_out : out std_logic;
        data_in   : in  std_logic_vector(ARRAY_SIZE*DATA_IN_WIDTH-1 downto 0);
        -- avalon stream (to memory)
        valid_out : out std_logic;
        ready_in  : in  std_logic;
        data_out  : out std_logic_vector(DATA_OUT_WIDTH-1 downto 0)
    );
end entity;


architecture RTL of lab is
    -- this signal is used to split the input's 128 bits into 16 bytes
    signal data_in_array  : aslv(0 to ARRAY_SIZE-1)(DATA_IN_WIDTH-1 downto 0);

	-- <LAB: your code goes here>
begin

    -- format inpute data as 'aslv' (array of std_logic_vector)
    process(all)
    begin
        for i in 0 to ARRAY_SIZE-1 loop
            data_in_array(i) <= 
                data_in((i+1)*DATA_IN_WIDTH-1 downto i*DATA_IN_WIDTH);
        end loop;
    end process;

	-- reg-state logic
	-- <LAB: your code goes here>

	-- next-state logic
	-- <LAB: your code goes here>
	
	-- outputs
	-- <LAB: your code goes here>

end architecture;
