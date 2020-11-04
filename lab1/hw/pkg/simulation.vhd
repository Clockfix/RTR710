-------------------------------------------------------
--! @file  simulation.vhd
--!
--! @dependancies:
--!     - data_types.vhd
--!
--!
--! @brief This is a part of EDI VHDL library. This package is responsible for
--!        - generating random numbes.
--!        - file I/O.
--!		   
--!        Note that VHDL 2008 input must be selected
--! 	   and package must be compiled with "-allowProtectedBeforeBody" flag.
--!
--!
--! Modifications:
--! Rihards Novickis - 27.04.2017 - started commenting this file
--! Rihards Novickis - 28.04.2017 - added file write functions
--! Rihards Novickis - 28.02.2018 - added constrained random signal generation
-------------------------------------------------------

-- synopsis directives:
-- synthesis LIBRARY edi

library ieee, rtu;
use ieee.std_logic_1164.all,
	ieee.numeric_std.all,
	ieee.math_real.all,
	rtu.data_types.all,
	std.textio.all;


--! This is analogue to C header file, here we have declared public procedures/functions/variables
package simulation is


	--! @brief This represents namespace for procedures generating random signals.
	type random_t is protected
		--! @brief Overloaded procedures for generating rundom signals used in
		--!        combination with global "random" variable. 
		--!///@{
		procedure generate_signal( signal sig : out std_logic );
		procedure generate_signal( signal sig : out std_logic_vector);
		procedure generate_signal( signal sig : out std_logic_vector; constant min_constraint : in natural; constant max_constraint : in natural);
		procedure generate_signal( signal sig : out array_of_std_logic_vector);
		procedure generate_signal( signal sig : out array_of_std_logic_vector_2D);
		procedure generate_variable( variable sig : out std_logic );
		procedure generate_variable( variable sig : out std_logic_vector);
		--!///@}
	end protected;
	--! @brief This variable is used to access random generation finctions. Example: random.generate_sig( <signal> )
	shared variable random : random_t;

	
	--! @brief Helper procedures for the simulation flow control
	--!///@{
		--! @brief Set "stop simulation" flag.
		procedure simulation_stop;
		--! @brief Check for simulation flag and wait if flag is set
		procedure simulation_stop_condition;
	--!///@}


	--! @brief Overloaded file I/O procedures, reads and writes strings in
	--!        accordance with provided data types. Every new line is
	--!        considered new signal entry.
	--!///@{
	procedure read_signal (variable fp : inout text; signal sig : out std_logic);
	procedure read_signal (variable fp : inout text; signal sig : out std_logic_vector);
	procedure read_signal (variable fp : inout text; signal sig : out array_of_std_logic_vector);
	procedure read_signal (variable fp : inout text; signal sig : out array_of_std_logic_vector_2D);
	procedure write_signal (variable fp : inout text; signal sig : in std_logic);
	procedure write_signal (variable fp : inout text; signal sig : in std_logic_vector);
	procedure write_signal (variable fp : inout text; signal sig : in array_of_std_logic_vector);
	procedure write_signal (variable fp : inout text; signal sig : in array_of_std_logic_vector_2D);

	procedure read_variable (variable fp : inout text; variable sig : out std_logic_vector);
	procedure write_variable(variable fp : inout text; variable sig : in std_logic_vector);
	procedure write_variable(variable fp : inout text; variable sig : in array_of_std_logic_vector);
	--!///@}

end package;




package body simulation is

	-- body of protected scope
	type random_t is protected body
		-- static seed variables
 		variable sim_seed0, sim_seed1 : positive;


 		-- generate random real value
	 	impure function generate_random_real return real is
	 		variable rand : real;
	 	begin
	 		uniform(sim_seed0, sim_seed1, rand);
	 		return rand;
	 	end function;

	 	-- generate random std_logic type
	 	impure function generate_random_std_logic return std_logic is
	 	begin
	 		if 2*integer(generate_random_real) > 1 then
				return '1';
			else
				return '0';
			end if;
	 	end function;


	 	-- procedures for generating random std_logic, std_logic_vector, array_std_logic_vector
	 	-- signals and variables
		procedure generate_signal( signal sig : out std_logic ) is
		begin
			sig <= generate_random_std_logic;
		end procedure;

		procedure generate_signal( signal sig : out std_logic_vector) is
		begin
			for i in sig'range loop
			 	sig(i) <= generate_random_std_logic;
			end loop;
		end procedure;

		procedure generate_signal( signal sig : out std_logic_vector; constant min_constraint : in natural; constant max_constraint : in natural) is
			variable sig_int  : integer;
			variable sig_vec  : std_logic_vector(sig'range);
		begin
			generate_variable(sig_vec);
			sig_int := to_integer(unsigned(sig_vec));
			sig <= std_logic_vector(to_unsigned( sig_int mod (max_constraint + 1 - min_constraint) + min_constraint, sig'length));
		end procedure;

		procedure generate_signal( signal sig : out array_of_std_logic_vector) is
		begin
			for i in sig'range loop
				for j in sig(0)'range loop
					sig(i)(j) <= generate_random_std_logic;
				end loop;
			end loop;
		end procedure;

		procedure generate_signal( signal sig : out array_of_std_logic_vector_2D) is
		begin
			for i in sig'range loop
				for j in sig(0)'range loop
					for n in sig(0)(0)'range loop
						sig(i)(j)(n) <= generate_random_std_logic;
					end loop;
				end loop;
			end loop;
		end procedure;

		procedure generate_variable( variable sig : out std_logic ) is
		begin
			sig := generate_random_std_logic;
		end procedure;

		procedure generate_variable( variable sig : out std_logic_vector ) is
		begin
			for i in sig'range loop
			 	sig(i) := generate_random_std_logic;
			end loop;
		end procedure;

	end protected body random_t;



	function char_2_std_logic( char : character) return std_logic is
	begin
		if (char = '1') then
            return '1';
        elsif (char = '0') then
            return '0';
        end if;
	end function;

	function std_logic_2_char( sig : std_logic) return character is
	begin
		if (sig = '1') then
            return '1';
        elsif (sig = '0') then
            return '0';
        end if;
	end function;

	function str_2_std_logic_vector(file_line_str: string) return std_logic_vector is
		constant SIG_HIGH : natural := file_line_str'high - 1;
        variable sig: std_logic_vector(SIG_HIGH downto 0) := (others => 'X');
    begin
        for i in sig'range loop
        	sig(i) := char_2_std_logic(file_line_str(i+1));
        end loop;
        return sig;
    end function;

	function std_logic_vector_2_str(sig : std_logic_vector) return string is
		constant STR_HIGH : natural := sig'length;
        variable file_line_str: string(STR_HIGH downto 1);
    begin
        for i in sig'range loop
        	file_line_str(i+1) := std_logic_2_char(sig(i));
        end loop;
        return file_line_str;
    end function;    



    procedure read_signal (variable fp : inout text; signal sig : out std_logic) is
    	variable file_line: line;
		variable file_char_str: character;
    begin
    	readline(fp, file_line);
		read(file_line, file_char_str);
		sig <= char_2_std_logic(file_char_str);
    end procedure;

	procedure read_signal ( variable fp : inout text; signal sig : out std_logic_vector) is
		variable file_line: line;
		variable file_line_str: string(sig'length downto 1);
	begin
		readline(fp, file_line);
		read(file_line, file_line_str);
		sig <= str_2_std_logic_vector(file_line_str);
	end procedure;

	procedure read_signal (variable fp : inout text; signal sig : out array_of_std_logic_vector) is 
		constant COUNT_c : natural := sig'length;
		constant WIDTH_c : natural := sig(0)'length;
		variable file_line: line;
		variable file_line_str: string(sig'length * sig(0)'length downto 1);
		variable file_line_str_tmp: string(WIDTH_c downto 1);
	begin 
		readline(fp, file_line);
		read(file_line, file_line_str);
		for i in sig'range loop
			file_line_str_tmp := file_line_str((i+1)*WIDTH_c downto 1+(i)*WIDTH_c);
			sig(i) <= str_2_std_logic_vector( file_line_str_tmp );
		end loop;
	end procedure;

	procedure read_signal (variable fp : inout text; signal sig : out array_of_std_logic_vector_2D) is 
		constant COUNT_1D_c : natural := sig'length;
		constant COUNT_2D_c : natural := sig(0)'length;
		constant WIDTH_c 	: natural := sig(0)(0)'length;
		variable char_idx_high, char_idx_low  : natural := 0;
		variable file_line: line;
		variable file_line_str 		: string(COUNT_1D_c*COUNT_2D_c*WIDTH_c downto 1);
		variable file_line_sub_str 	: string(WIDTH_c downto 1);
	begin 
		readline(fp, file_line);
		read(file_line, file_line_str);
		for i in sig'range loop
			for j in sig(i)'range loop
				char_idx_high 	:= i*COUNT_2D_c*WIDTH_c + j*WIDTH_c + WIDTH_c;
				char_idx_low 	:= i*COUNT_2D_c*WIDTH_c + j*WIDTH_c + 1;
				file_line_sub_str	:= file_line_str(char_idx_high downto char_idx_low);
				sig(i)(j) <= str_2_std_logic_vector(file_line_sub_str);
			end loop;
		end loop;
	end procedure;


	procedure write_signal (variable fp : inout text; signal sig : in std_logic) is
    	variable file_line: line;
		variable file_char_str: character;
    begin
    	file_char_str := std_logic_2_char(sig);
		write(file_line, file_char_str);
    	writeline(fp, file_line);
    end procedure;

	procedure write_signal ( variable fp : inout text; signal sig : in std_logic_vector) is
		variable file_line: line;
		variable file_line_str: string(sig'length downto 1);
	begin
		file_line_str := std_logic_vector_2_str(sig);
		write(file_line, file_line_str);
		writeline(fp, file_line);
	end procedure;

	procedure write_signal (variable fp : inout text; signal sig : in array_of_std_logic_vector) is
		constant COUNT_c : natural := sig'length;
		constant WIDTH_c : natural := sig(0)'length;
		variable file_line: line;
		variable file_line_str: string(COUNT_c*WIDTH_c downto 1);
	begin 
		for i in sig'range loop
			file_line_str( (i+1)*WIDTH_c downto 1+(i)*WIDTH_c) := std_logic_vector_2_str( sig(i) );
		end loop;
		write(file_line, file_line_str);
		writeline(fp, file_line);
	end procedure;

	procedure write_signal (variable fp : inout text; signal sig : in array_of_std_logic_vector_2D) is
		constant COUNT_1D_c : natural := sig'length;
		constant COUNT_2D_c : natural := sig(0)'length;
		constant WIDTH_c 	: natural := sig(0)(0)'length;
		variable char_idx_high, char_idx_low  : natural := 0;
		variable file_line 	: line;
		variable file_line_str 		: string(COUNT_1D_c*COUNT_2D_c*WIDTH_c downto 1);
	begin 
		for i in sig'range loop
			for j in sig(i)'range loop
				char_idx_high 		:= i*COUNT_2D_c*WIDTH_c + j*WIDTH_c + WIDTH_c;
				char_idx_low 		:= i*COUNT_2D_c*WIDTH_c + j*WIDTH_c + 1;
				file_line_str(char_idx_high downto char_idx_low) := std_logic_vector_2_str(sig(i)(j));
			end loop;
		end loop;
		write(file_line, file_line_str);
		writeline(fp, file_line);
	end procedure;


	procedure read_variable ( variable fp : inout text; variable sig : out std_logic_vector) is
		variable file_line: line;
		variable file_line_str: string(sig'length downto 1);
	begin
		readline(fp, file_line);
		read(file_line, file_line_str);
		sig := str_2_std_logic_vector(file_line_str);
	end procedure;


	procedure write_variable(variable fp : inout text; variable sig : in std_logic_vector) is
		variable file_line: line;
		variable file_line_str: string(sig'length downto 1);
	begin
		file_line_str := std_logic_vector_2_str(sig);
		write(file_line, file_line_str);
		writeline(fp, file_line);
	end procedure;
	

	procedure write_variable (variable fp : inout text; variable sig : in array_of_std_logic_vector) is
		constant COUNT_c : natural := sig'length;
		constant WIDTH_c : natural := sig(0)'length;
		variable file_line: line;
		variable file_line_str: string(1 to COUNT_c*WIDTH_c);
	begin
		for i in sig'range loop
			file_line_str( 1+(i)*WIDTH_c to (i+1)*WIDTH_c) := std_logic_vector_2_str( sig(i) );
		end loop;
		write(file_line, file_line_str);
		writeline(fp, file_line);
	end procedure;



	type simulation_status_t is (SIM_ACTIVE, SIM_NONACTIVE);

	shared variable simulation_status 	: simulation_status_t := SIM_ACTIVE;

	procedure simulation_stop is
	begin simulation_status := SIM_NONACTIVE; end procedure;

	procedure simulation_stop_condition  is
	begin
		if simulation_status = SIM_NONACTIVE then 
			wait;
		end if;
	end procedure;


end package body;
