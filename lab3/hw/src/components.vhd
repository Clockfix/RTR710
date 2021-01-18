-- synopsis directives:
-- synthesis VHDL_INPUT_VERSION VHDL_2008

LIBRARY ieee;
USE ieee.std_logic_1164.ALL,
work.data_types.ALL;

PACKAGE components IS
    COMPONENT delay_std_logic IS
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
    END COMPONENT;

    COMPONENT parallel_output IS
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
    END COMPONENT;

    COMPONENT image_darkener IS
        GENERIC (
            DARKENER_CONSTANT : NATURAL := 20
        );
        PORT (
            clk : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            -- Avalon-ST (input)
            ast_in_valid : IN STD_LOGIC;
            ast_in_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            ast_in_ready : OUT STD_LOGIC;
            -- Avalon-ST (output)
            ast_out_valid : OUT STD_LOGIC;
            ast_out_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            ast_out_ready : IN STD_LOGIC
        );
    END COMPONENT;

    COMPONENT delay_std_logic_vector IS
        GENERIC (
            DELAY_COUNT : NATURAL := 1
        );
        PORT (
            clk : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            enable : IN STD_LOGIC;
            sig_in : IN STD_LOGIC_VECTOR;
            sig_out : OUT STD_LOGIC_VECTOR
        );
    END COMPONENT;

    COMPONENT image_gray IS
        PORT (
            clk : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            -- Avalon-ST (input)
            ast_in_valid : IN STD_LOGIC;
            ast_in_data : IN STD_LOGIC_VECTOR(23 DOWNTO 0); -- r,g,b
            ast_in_ready : OUT STD_LOGIC;
            -- Avalon-ST (output)
            ast_out_valid : OUT STD_LOGIC;
            ast_out_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            ast_out_ready : IN STD_LOGIC
        );
    END COMPONENT;

    COMPONENT image_sobelHor IS
        PORT (
            clk : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            -- Avalon-ST (input)
            ast_in_valid : IN STD_LOGIC;
            ast_in_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            ast_in_ready : OUT STD_LOGIC;
            -- Avalon-ST (output)
            ast_out_valid : OUT STD_LOGIC;
            ast_out_data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            ast_out_ready : IN STD_LOGIC
        );
    END COMPONENT;
END PACKAGE;

PACKAGE BODY components IS
END PACKAGE BODY;