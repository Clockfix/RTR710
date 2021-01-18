LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.data_types.ALL;
USE work.components.ALL;
ENTITY image_sobelHor IS
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
END ENTITY;

ARCHITECTURE RTL OF image_sobelHor IS
    SIGNAL enable : STD_LOGIC;
BEGIN
    -- inputs
    enable <= ast_out_ready;

    -- parallel register output

    -- reg-state logic
    PROCESS (clk)
    BEGIN
        IF reset = '1' THEN
        ELSE
            IF rising_edge(clk) THEN
                IF enable = '1' THEN
                ELSE
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- next-state logic

    -- outputs

END ARCHITECTURE;