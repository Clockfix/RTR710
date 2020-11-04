LIBRARY ieee;
--LIBRARY rtu;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
--USE rtu.random.ALL;

ENTITY main IS
    PORT (
        clk : IN STD_LOGIC;
        wq : IN STD_LOGIC;
        data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        addr : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        hex_0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        hex_1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        hex_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE RTL OF main IS

    -- signal declaration
    -- <your code goes here>

    SIGNAL r_hex0_reg, r_hex0_next : unsigned(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL r_hex1_reg, r_hex1_next : unsigned(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL r_hex2_reg, r_hex2_next : unsigned(7 DOWNTO 0) := (OTHERS => '0');

    SIGNAL w_hex0_en, w_hex1_en, w_hex2_en : STD_LOGIC;

BEGIN

    -- reg-state logic
    -- <your code goes here>
    PROCESS (ALL)
    BEGIN

        IF addr = "00" THEN
            w_hex0_en <= wq;
            w_hex1_en <= '0';
            w_hex2_en <= '0';
        ELSE
            IF addr = "01"
                w_hex0_en <= '0';
                w_hex1_en <= wq;
                w_hex2_en <= '0';
            ELSE
                IF addr = "10"
                    w_hex0_en <= '0';
                    w_hex1_en <= '0';
                    w_hex2_en <= wq;
                ELSE
                    w_hex0_en <= '0';
                    w_hex1_en <= '0';
                    w_hex2_en <= '0';
                END IF;
            END IF;
        END IF;

        IF rising_edge(clk) THEN
            -- hex0
            IF w_hex0_en THEN
                r_hex0_reg <= r_hex0_next;
            END IF;
            -- hex1
            IF w_hex1_en THEN
                r_hex1_reg <= r_hex1_next;
            END IF;
            -- hex2
            IF w_hex2_en THEN
                r_hex2_reg <= r_hex2_next;
            END IF;

        END IF;
    END PROCESS;

    -- next-state logic
    -- <your code goes here>

    r_hex0_next <= data;
    r_hex1_next <= data;
    r_hex2_next <= data;
    -- outputs
    -- <your code goes here>

    hex_0 <= r_hex0_reg;
    hex_1 <= r_hex1_reg;
    hex_2 <= r_hex2_reg;
END ARCHITECTURE;