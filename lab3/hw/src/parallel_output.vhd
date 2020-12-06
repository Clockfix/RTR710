library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.data_types.all;


entity parallel_output is
    generic(
        DATA_WIDTH  : natural := 8;
        VECTOR_SIZE : natural := 3
    );
    port(
        clk           : in std_logic;
        reset         : in std_logic;
        enable        : in std_logic;
        data_in       : in std_logic_vector(DATA_WIDTH-1 downto 0);
        data_out      : out aslv(0 to VECTOR_SIZE-1)(DATA_WIDTH-1 downto 0)
    );
end entity;


architecture RTL of parallel_output is
    signal data_reg, data_next : aslv(0 to VECTOR_SIZE-1)(DATA_WIDTH-1 downto 0) := (others => (others => '0'));
begin
 
	-- reg state logic
	process(clk,reset)
	begin
		if reset = '1' then
			data_reg 	<= (others => (others => '0'));
		else
			if rising_edge(clk) then
				if enable = '1' then
					data_reg 	<= data_next;
				else
					data_reg 	<= data_reg;
				end if;
			end if;
		end if;
	end process;

	-- next state logic
	GENERATE_VECTOR: for i in 0 to VECTOR_SIZE-1 generate 
		INPUT_REGISTER: if i=0 generate
			data_next(i) <= data_in;
		end generate INPUT_REGISTER;

		OTHER_REGISTERS: if i>0 generate
			data_next(i) <= data_reg(i-1);
		end generate OTHER_REGISTERS;
	end generate GENERATE_VECTOR;

	-- paralel outputs
	data_out <= data_reg;
end architecture;
