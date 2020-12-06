library ieee, edi;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use edi.simulation.all;
use work.components.all;


entity image_darkener_tb is
    generic(
        DARKENER_CONSTANT : natural := 20
    );
end entity;


architecture RTL of image_darkener_tb is
    constant CLOCK_PERIOD : time := 10 ns;
	constant TIMEOUT_PERIOD_COUNT : integer := 100;

    signal clk           : std_logic := '0';
    signal reset         : std_logic := '0';
    signal ast_in_valid  : std_logic := '0';
    signal ast_in_data   : std_logic_vector(7 downto 0) := (others => '0');
    signal ast_in_ready  : std_logic := '0';
    signal ast_out_valid : std_logic := '0';
    signal ast_out_data  : std_logic_vector(7 downto 0) := (others => '0');
    signal ast_out_ready : std_logic := '0';
begin

    DUT: image_darkener
    generic map(20)
    port map(clk, reset,
        ast_in_valid, ast_in_data, ast_in_ready,
        ast_out_valid, ast_out_data, ast_out_ready);

    -- clock
    process
    begin
        wait for CLOCK_PERIOD/2;
        clk <= not clk;
        simulation_stop_condition;
    end process;

    -- input
    process
        variable v_input_vector : integer := 0;
    begin
        wait until rising_edge(clk);
        wait for CLOCK_PERIOD*0.1;
        simulation_stop_condition;

        if ast_in_ready = '1'then
            ast_in_valid <= '1';
            ast_in_data  <= std_logic_vector(to_unsigned(v_input_vector, 8));
            v_input_vector := v_input_vector + 1;
        end if;
    end process;

    -- output
    process
        variable v_input_vector  : integer := 0;
        variable v_output_vector : integer := 0;
        variable v_enable : std_logic := '0';
        variable random : random_t;
		variable v_timeout : integer := 0;
    begin
        wait until rising_edge(clk);
        random.generate_variable(v_enable);
        ast_out_ready <= v_enable;

        if ast_out_valid = '1' and ast_in_ready = '1' then
			-- nullify timeout
			v_timeout := 0;

            -- update output vector
            v_output_vector := v_input_vector - DARKENER_CONSTANT;
            if v_output_vector < 0 then
                v_output_vector := 0;
            end if;

            -- print some feedback
            report "INPUT: " & integer'image(v_input_vector) &
                "; EXPECTED: " & integer'image(v_output_vector) & 
                "; GOT: " & integer'image(to_integer(unsigned(ast_out_data)));

            -- check output vector
            if(v_output_vector /= to_integer(unsigned(ast_out_data))) then
                report "FAILURE!" severity FAILURE;
            end if;

            -- process stop condition
            if(v_input_vector = 255) then
                report "SUCCESS!";
                simulation_stop;
            end if;

            v_input_vector := v_input_vector + 1;
        end if;

		-- check for timeout
		if v_timeout > TIMEOUT_PERIOD_COUNT then
            report "FAILURE! " &
            "(timeout, check if control signals are correctly connected)" 
			severity ERROR;
            simulation_stop;
		end if;
		v_timeout := v_timeout + 1;

    end process;
end architecture;
