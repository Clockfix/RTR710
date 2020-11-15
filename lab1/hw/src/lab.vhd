LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY lab IS
    PORT (
        clk : IN STD_LOGIC;
        -- avalon-mm interface
        writereq : IN STD_LOGIC;
        address : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        writedata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        -- outputs for 7segment displayes
        val0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        val1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        val2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE RTL OF lab IS
    -- <LAB: your code goes here>
    SIGNAL r_hex0_reg, r_hex0_next : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL r_hex1_reg, r_hex1_next : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL r_hex2_reg, r_hex2_next : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');

    SIGNAL w_hex0_en, w_hex1_en, w_hex2_en : STD_LOGIC;

BEGIN

    w_hex0_en <= writereq WHEN address = "00" ELSE
        '0';
    w_hex1_en <= writereq WHEN address = "01" ELSE
        '0';
    w_hex2_en <= writereq WHEN address = "10" ELSE
        '0';

    -- reg-state logic
    -- <LAB: your code goes here>
    PROCESS (ALL)
    BEGIN

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
    -- <LAB: your code goes here>

    r_hex0_next <= writedata;
    r_hex1_next <= writedata;
    r_hex2_next <= writedata;

    -- outputs
    -- <LAB: your code goes here>

    val0 <= r_hex0_reg;
    val1 <= r_hex1_reg;
    val2 <= r_hex2_reg;
END ARCHITECTURE;