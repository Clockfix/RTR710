library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.data_types.all;
use work.functions.all;
use work.components.all;

entity pipeline_tree_adder is
		
	generic
		(
			ARRAY_SIZE   : natural := 133;
			DATA_WIDTH   : natural :=8
		);
	
	port
		(
			clk        : in std_logic;
			enable     : in std_logic;
			data_in    : in aslv(0 to ARRAY_SIZE-1)(DATA_WIDTH-1 downto 0);
			data_out   : out std_logic_vector(DATA_WIDTH+log2c(ARRAY_SIZE)-1 downto 0)
		);
end entity;

architecture RTL of pipeline_tree_adder is 

	constant ADDER_COUNT         : natural := ARRAY_SIZE/2;
	constant REGISTER_COUNT      : natural := (ARRAY_SIZE+1)/2;
	constant DATA_WIDTH_REGISTER : natural := DATA_WIDTH+1;
	constant IS_ODD              : boolean := (ARRAY_SIZE mod 2) = 1;
	
	signal data_reg, data_next   : aslv(0 to REGISTER_COUNT-1)(DATA_WIDTH_REGISTER-1 downto 0) := (others => (others => '0'));
	
begin
	-- reg-state logic
	GEN_REG_STATE: if ARRAY_SIZE /= 1 generate
      process
	   begin
			wait until rising_edge(clk);
			if enable = '1' then
				data_reg <= data_next;
			else
				data_reg <= data_reg;
			end if;
	   end process;
    end generate GEN_REG_STATE;
	
	-- next-state logic
	GEN_NEXT_STATE: if ARRAY_SIZE /= 1 generate
		process(all)
		begin
			for i in 0 to ADDER_COUNT-1 loop
				data_next(i) <= std_logic_vector(("0" & unsigned(data_in(2*i))) + ("0" & unsigned(data_in(2*i+1))));
			end loop;
			--ODD register
			if IS_ODD then 
				data_next(REGISTER_COUNT-1) <= ("0" &data_in(ARRAY_SIZE-1));
			end if;
		end process;
	end generate GEN_NEXT_STATE;
	
	GEN_COMPONENT: if ARRAY_SIZE /= 1 generate
		COMP_0:pipeline_tree_adder
			generic map(REGISTER_COUNT, DATA_WIDTH_REGISTER)			
			port map(clk, enable, data_reg, data_out);
	end generate GEN_COMPONENT;
	
	NO_LOGIC: if ARRAY_SIZE = 1 generate
		data_out <= data_in(0);
	end generate NO_LOGIC;
	
end architecture;