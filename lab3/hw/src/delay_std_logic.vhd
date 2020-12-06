library ieee;
use ieee.std_logic_1164.all;

entity delay_std_logic is
	generic
	(
		DELAY_COUNT : natural := 1
	);
	port
	(
		clk				: in  std_logic;
		reset			: in  std_logic;
		enable 			: in  std_logic;
		sig_in  		: in  std_logic;
		sig_out 		: out std_logic
	);
end entity;


architecture RTL of delay_std_logic is
	signal delay_reg, delay_next : std_logic_vector(DELAY_COUNT-1 downto 0) := (others => '0');
begin

	GENERATE_LOGIC: if DELAY_COUNT > 0 generate
		-- reg state logic
		process(clk,reset,enable)
		begin
			if reset = '1' then
				delay_reg <= (others => '0');
			else
				if clk'event and clk = '1' then
					if enable = '1' then
						delay_reg <= delay_next;
					else
						delay_reg <= delay_reg;
					end if;
				end if;
			end if;
		end process;

		-- next state logic
		process(all)
		begin
			for i in 0 to DELAY_COUNT-1 loop 
				if i = 0 then
					delay_next(i) <= sig_in;
				else
					delay_next(i) <= delay_reg(i-1);
				end if;
			end loop;
		end process;

		-- outputs
		sig_out <= delay_reg(DELAY_COUNT-1);
	end generate GENERATE_LOGIC;


	GENERATE_NO_LOGIC: if DELAY_COUNT = 0 generate
		-- outputs
		sig_out <= sig_in;
	end generate GENERATE_NO_LOGIC;

end architecture;
