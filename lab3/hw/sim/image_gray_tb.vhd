library ieee, edi;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use edi.simulation.all;
use work.components.all;


entity image_gray_tb is
end entity;


architecture RTL of image_gray_tb is
    constant CLOCK_PERIOD : time := 10 ns;
	constant TIMEOUT_PERIOD_COUNT : integer := 100;

    signal clk           : std_logic := '0';
    signal reset         : std_logic := '0';
    signal ast_in_valid  : std_logic := '0';
    signal ast_in_data   : std_logic_vector(23 downto 0) := (others => '0');
    signal ast_in_ready  : std_logic := '0';
    signal ast_out_valid : std_logic := '0';
    signal ast_out_data  : std_logic_vector(7 downto 0) := (others => '0');
    signal ast_out_ready : std_logic := '0';

    signal ast_in_data_delayed : std_logic_vector(23 downto 0) := (others => '0');
begin

    DUT: image_gray
    port map(clk, reset,
        ast_in_valid, ast_in_data, ast_in_ready,
        ast_out_valid, ast_out_data, ast_out_ready);

    DELAY_INPUT: delay_std_logic_vector
    generic map(1)
    port map(clk, reset, ast_in_ready, ast_in_data, ast_in_data_delayed);

    -- clock
    process
    begin
        wait for CLOCK_PERIOD/2;
        clk <= not clk;
        simulation_stop_condition;
    end process;

    -- input
    process
        variable random : random_t;
        variable v_input_vector_r : integer := 0;
        variable v_input_vector_g : integer := 0;
        variable v_input_vector_b : integer := 0;
    begin
        wait until rising_edge(clk);
        simulation_stop_condition;
        random.generate_signal(ast_in_data(23 downto 16));
        random.generate_signal(ast_in_data(15 downto 8));
        random.generate_signal(ast_in_data(7 downto 0));
        ast_in_valid <= '1';
    end process;

    -- output
    process
        variable v_iterations : integer := 0;
        variable random : random_t;
        variable v_enable : std_logic := '0';
        variable v_r, v_g, v_b, v_gray : integer;
		variable v_timeout : integer := 0;
    begin
        wait until rising_edge(clk);
        random.generate_variable(v_enable);
        ast_out_ready <= v_enable;

        if ast_out_valid = '1' and ast_in_ready = '1' then
			-- nullify timeout
			v_timeout := 0;

            -- update output vector
            v_r := to_integer(unsigned(ast_in_data_delayed(23 downto 17)));
            v_g := to_integer(unsigned(ast_in_data_delayed(15 downto 10)))
                 + to_integer(unsigned(ast_in_data_delayed(15 downto 11)));
            v_b := to_integer(unsigned(ast_in_data_delayed(7 downto 3)));
            v_gray := v_r + v_g + v_b;

            if v_gray > 255 then
                v_gray := 255;
            end if;
            
            -- print some feedback
            report "INPUT: " & 
                integer'image(to_integer(unsigned(ast_in_data_delayed(23 downto 16)))) & "," &
                integer'image(to_integer(unsigned(ast_in_data_delayed(15 downto 8)))) & "," &
                integer'image(to_integer(unsigned(ast_in_data_delayed(7 downto 0)))) & "," &
                "; EXPECTED: " & integer'image(v_gray) & 
                "; GOT: " & integer'image(to_integer(unsigned(ast_out_data)));

            -- check output vector
            if(v_gray /= to_integer(unsigned(ast_out_data))) then
                report "Test failed!" severity FAILURE;
            end if;

            -- process stop condition
            v_iterations := v_iterations + 1;
            if(v_iterations = 1024) then
                report "Test successful!";
                simulation_stop;
            end if;
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
