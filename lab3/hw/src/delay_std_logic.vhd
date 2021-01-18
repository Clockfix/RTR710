LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY delay_std_logic IS
	GENERIC (
		DELAY_COUNT : NATURAL := 1
	);
	PORT (
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		enable : IN STD_LOGIC;
		sig_in : IN STD_LOGIC;
		sig_out : OUT STD_LOGIC
	);
END ENTITY;
ARCHITECTURE RTL OF delay_std_logic IS
	SIGNAL delay_reg, delay_next : STD_LOGIC_VECTOR(DELAY_COUNT - 1 DOWNTO 0) := (OTHERS => '0');
BEGIN

	GENERATE_LOGIC : IF DELAY_COUNT > 0 GENERATE
		-- reg state logic
		PROCESS (clk, reset, enable)
		BEGIN
			IF reset = '1' THEN
				delay_reg <= (OTHERS => '0');
			ELSE
				IF clk'event AND clk = '1' THEN
					IF enable = '1' THEN
						delay_reg <= delay_next;
					ELSE
						delay_reg <= delay_reg;
					END IF;
				END IF;
			END IF;
		END PROCESS;

		-- next state logic
		PROCESS (ALL)
		BEGIN
			FOR i IN 0 TO DELAY_COUNT - 1 LOOP
				IF i = 0 THEN
					delay_next(i) <= sig_in;
				ELSE
					delay_next(i) <= delay_reg(i - 1);
				END IF;
			END LOOP;
		END PROCESS;

		-- outputs
		sig_out <= delay_reg(DELAY_COUNT - 1);
	END GENERATE GENERATE_LOGIC;
	GENERATE_NO_LOGIC : IF DELAY_COUNT = 0 GENERATE
		-- outputs
		sig_out <= sig_in;
	END GENERATE GENERATE_NO_LOGIC;

END ARCHITECTURE;