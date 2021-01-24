library ieee, edi;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use edi.simulation.all;
use work.components.all;
use work.data_types.all;


entity image_sobelHor_tb is
end entity;


architecture RTL of image_sobelHor_tb is
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

    signal ast_in_data_delayed : std_logic_vector(7 downto 0) := (others => '0');
begin

    DUT: image_sobelHor
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
    begin
        wait until rising_edge(clk);
        simulation_stop_condition;
        random.generate_signal(ast_in_data(7 downto 0));
        ast_in_valid <= '1';
    end process;

    -- output
    process
        variable v_iterations : integer := 0;
        variable random : random_t;
        variable v_enable : std_logic;
        variable v_sobel : integer;
        variable v_pixels : aslv(0 to 2)(7 downto 0);
		variable v_timeout : integer := 0;
    begin
        wait until rising_edge(clk);
        random.generate_variable(v_enable);
        ast_out_ready <= v_enable;

        if ast_in_ready = '1' then
            v_pixels(2) := v_pixels(1);
            v_pixels(1) := v_pixels(0);
            v_pixels(0) := ast_in_data_delayed;
        end if;

        if ast_out_valid = '1' and ast_in_ready = '1' then
			-- nullify timeout
			v_timeout := 0;

            v_sobel := to_integer(unsigned(v_pixels(0))) 
                     - to_integer(unsigned(v_pixels(2))) + 128;

            if v_sobel > 255 then
                v_sobel := 255;
            elsif v_sobel < 0 then
                v_sobel := 0;
            end if;
            
            -- print some feedback
            report "INPUT: " & 
                integer'image(to_integer(unsigned(v_pixels(2)))) &","&
                integer'image(to_integer(unsigned(v_pixels(1)))) &","&
                integer'image(to_integer(unsigned(v_pixels(0)))) &
                "; EXPECTED: " & integer'image(v_sobel) & 
                "; GOT: " & integer'image(to_integer(unsigned(ast_out_data)));

            -- check output vector
            if(v_sobel /= to_integer(unsigned(ast_out_data))) then
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
