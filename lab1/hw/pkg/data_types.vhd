-------------------------------------------------------
--! @file  data_types.vhd
--!
--! @brief This is a part of EDI VHDL library responsible for data types
--!		   Note that VHDL 2008 input must be set
--!
--! Modifications:
--! Rihards Novickis - 02.08.2016 - started commenting this file
--! Rihards Novickis - 03.08.2016 - added array_of_array_of_std_logic_vector type
--! Rihards Novickis - 02.09.2016 - changed array names
--! Toms Sturmanis 	 - 02.03.2017 - synthesises to EDI library
--! Rihards Novickis - 07.29.2017 - added overloaded procedures for data type casting (only in VHDL_2008)
--!
-------------------------------------------------------

-- synopsis directives:
-- synthesis VHDL_INPUT_VERSION VHDL_2008
-- synthesis LIBRARY edi

library ieee;
use ieee.std_logic_1164.all;


package data_types is
	type array_of_std_logic_vector is array(natural range <>) of std_logic_vector;
	type array_of_std_logic_vector_2D is array(natural range <>) of array_of_std_logic_vector;
	type array_of_std_logic_vector_3D is array(natural range <>) of array_of_std_logic_vector_2D;

	type array_of_real is array(natural range <>) of real;
	type array_of_real_2D is array(natural range <>) of array_of_real;
	
	type array_of_integers is array(natural range <>) of integer;
	type array_of_integers_2D is array(natural range <>) of array_of_integers;
	type array_of_integers_3D is array(natural range <>) of array_of_integers_2D;

	--! @brief The following casts are currently supported:
	--! 		std_logic_vector -> array_of_std_logic_vector
	--! 		std_logic_vector -> array_of_std_logic_vector_2D
	--! 		array_of_std_logic_vector -> std_logic_vector
	--! 		array_of_std_logic_vector_2D -> std_logic_vector
	--!///@{
	procedure edi_data_type_cast( signal data_out : out array_of_std_logic_vector; signal data_in : in std_logic_vector);
	procedure edi_data_type_cast( signal data_out : out array_of_std_logic_vector_2D; signal data_in : in std_logic_vector);
	procedure edi_data_type_cast( signal data_out : out std_logic_vector; signal data_in : in array_of_std_logic_vector);
	procedure edi_data_type_cast( signal data_out : out std_logic_vector; signal data_in : in array_of_std_logic_vector_2D);
	procedure edi_data_type_cast_v( variable data_out : out array_of_std_logic_vector; variable data_in : in std_logic_vector);
	procedure edi_data_type_cast_v( variable data_out : out array_of_std_logic_vector_2D; variable data_in : in std_logic_vector);
	procedure edi_data_type_cast_v( variable data_out : out std_logic_vector; variable data_in : in array_of_std_logic_vector);
	procedure edi_data_type_cast_v( variable data_out : out std_logic_vector; variable data_in : in array_of_std_logic_vector_2D);
	--!///@}
end package;


package body data_types is

	procedure edi_data_type_cast_v( variable data_out : out array_of_std_logic_vector; variable data_in : in std_logic_vector) is
		constant VECTOR_WIDTH : natural := data_out(0)'length;
		variable bit_high 	: natural;
		variable bit_low 	: natural;
	begin
		for i in data_out'range loop
			bit_high 	:= (i+1)*VECTOR_WIDTH-1;
			bit_low 	:= i*VECTOR_WIDTH;
			--report natural'image(bit_high);
			--report natural'image(bit_low);
			data_out(i) := data_in( bit_high downto bit_low);
		end loop;
	end procedure;

	procedure edi_data_type_cast_v( variable data_out : out array_of_std_logic_vector_2D; variable data_in : in std_logic_vector) is
		constant VECTOR_WIDTH 	: natural := data_out(0)(0)'length;
		constant ARRAY_SIZE_X 	: natural := data_out(0)'length;
		variable bit_high 		: natural;
		variable bit_low 		: natural;
		variable data_in_tmp 	: std_logic_vector(ARRAY_SIZE_X*VECTOR_WIDTH-1 downto 0);
	begin
		for i in data_out'range loop
			bit_high 	:= (i+1)*ARRAY_SIZE_X*VECTOR_WIDTH-1;
			bit_low 	:= i*ARRAY_SIZE_X*VECTOR_WIDTH;
			--report natural'image(bit_high);
			--report natural'image(bit_low);
			data_in_tmp := data_in(bit_high downto bit_low);
			edi_data_type_cast_v( data_out(i), data_in_tmp );
		end loop;
	end procedure;

	procedure edi_data_type_cast_v( variable data_out : out std_logic_vector; variable data_in : in array_of_std_logic_vector) is
		constant VECTOR_WIDTH : natural := data_in(0)'length;
		variable bit_high 	: natural;
		variable bit_low 	: natural;
	begin
		for i in data_in'range loop
			bit_high 	:= (i+1)*VECTOR_WIDTH-1;
			bit_low 	:= i*VECTOR_WIDTH;
			--report natural'image(bit_high);
			--report natural'image(bit_low);
			data_out( bit_high downto bit_low) := data_in(i);
		end loop;
	end procedure;

	procedure edi_data_type_cast_v( variable data_out : out std_logic_vector; variable data_in : in array_of_std_logic_vector_2D) is
		constant VECTOR_WIDTH 	: natural := data_in(0)(0)'length;
		constant ARRAY_SIZE_X 	: natural := data_in(0)'length;
		variable bit_high 		: natural;
		variable bit_low 		: natural;
		variable data_out_tmp 	: std_logic_vector(ARRAY_SIZE_X*VECTOR_WIDTH-1 downto 0);
	begin
		for i in data_in'range loop
			bit_high 	:= (i+1)*ARRAY_SIZE_X*VECTOR_WIDTH-1;
			bit_low 	:= i*ARRAY_SIZE_X*VECTOR_WIDTH;
			--report natural'image(bit_high);
			--report natural'image(bit_low);
			edi_data_type_cast_v( data_out_tmp, data_in(i) );
			data_out(bit_high downto bit_low) := data_out_tmp;
		end loop;
	end procedure;




	procedure edi_data_type_cast( signal data_out : out array_of_std_logic_vector; signal data_in : in std_logic_vector) is
		variable data_out_v : array_of_std_logic_vector(data_out'range)(data_out(0)'range);
		variable data_in_v 	: std_logic_vector(data_in'range);
	begin
		data_in_v := data_in;
		edi_data_type_cast_v(data_out_v, data_in_v);
		data_out <= data_out_v;
	end procedure;


	procedure edi_data_type_cast( signal data_out : out array_of_std_logic_vector_2D; signal data_in : in std_logic_vector) is
		variable data_out_v 	: array_of_std_logic_vector_2D(data_out'range)(data_out(0)'range)(data_out(0)(0)'range);
		variable data_in_v		: std_logic_vector(data_in'range);
	begin
		data_in_v := data_in;
		edi_data_type_cast_v( data_out_v, data_in_v);
		data_out <= data_out_v; 
	end procedure;


	procedure edi_data_type_cast( signal data_out : out std_logic_vector; signal data_in : in array_of_std_logic_vector) is
		variable data_out_v : std_logic_vector(data_out'range);
		variable data_in_v 	: array_of_std_logic_vector(data_in'range)(data_in(0)'range);
	begin
		data_in_v := data_in;
		edi_data_type_cast_v(data_out_v, data_in_v);
		data_out <= data_out_v;
	end procedure;


	procedure edi_data_type_cast( signal data_out : out std_logic_vector; signal data_in : in array_of_std_logic_vector_2D) is
		variable data_out_v		: std_logic_vector(data_out'range);
		variable data_in_v 		: array_of_std_logic_vector_2D(data_in'range)(data_in(0)'range)(data_in(0)(0)'range);
	begin
		data_in_v := data_in;
		edi_data_type_cast_v( data_out_v, data_in_v);
		data_out <= data_out_v; 
	end procedure;

end package body;