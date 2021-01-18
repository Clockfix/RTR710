LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.data_types.ALL;
ENTITY parallel_output IS
	GENERIC (
		DATA_WIDTH : NATURAL := 8;
		VECTOR_SIZE : NATURAL := 3
	);
	PORT (
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		enable : IN STD_LOGIC;
		data_in : IN STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0);
		data_out : OUT aslv(0 TO VECTOR_SIZE - 1)(DATA_WIDTH - 1 DOWNTO 0)
	);
END ENTITY;
ARCHITECTURE RTL OF parallel_output IS
	SIGNAL data_reg, data_next : aslv(0 TO VECTOR_SIZE - 1)(DATA_WIDTH - 1 DOWNTO 0) := (OTHERS => (OTHERS => '0'));
BEGIN

	-- reg state logic
	PROCESS (clk, reset)
	BEGIN
		IF reset = '1' THEN
			data_reg <= (OTHERS => (OTHERS => '0'));
		ELSE
			IF rising_edge(clk) THEN
				IF enable = '1' THEN
					data_reg <= data_next;
				ELSE
					data_reg <= data_reg;
				END IF;
			END IF;
		END IF;
	END PROCESS;

	-- next state logic
	GENERATE_VECTOR : FOR i IN 0 TO VECTOR_SIZE - 1 GENERATE
		INPUT_REGISTER : IF i = 0 GENERATE
			data_next(i) <= data_in;
		END GENERATE INPUT_REGISTER;

		OTHER_REGISTERS : IF i > 0 GENERATE
			data_next(i) <= data_reg(i - 1);
		END GENERATE OTHER_REGISTERS;
	END GENERATE GENERATE_VECTOR;

	-- paralel outputs
	data_out <= data_reg;
END ARCHITECTURE;