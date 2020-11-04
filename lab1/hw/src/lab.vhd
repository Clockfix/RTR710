library ieee;
use ieee.std_logic_1164.all;

entity lab is
	port(
		clk : in std_logic;
		-- avalon-mm interface
		writereq  : in std_logic;
		address   : in std_logic_vector(1 downto 0);
		writedata : in std_logic_vector(7 downto 0);
		-- outputs for 7segment displayes
		val0     : out std_logic_vector(7 downto 0);
		val1     : out std_logic_vector(7 downto 0);
		val2     : out std_logic_vector(7 downto 0)
	);
end entity;

architecture RTL of lab is
	-- <LAB: your code goes here>


    SIGNAL r_hex0_reg, r_hex0_next : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL r_hex1_reg, r_hex1_next : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL r_hex2_reg, r_hex2_next : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');

	SIGNAL w_hex0_en, w_hex1_en, w_hex2_en : STD_LOGIC;
	
begin
	-- reg-state logic
	-- <LAB: your code goes here>
	PROCESS (ALL)
    BEGIN

        IF address = "00" THEN
            w_hex0_en <= writereq;
            w_hex1_en <= '0';
            w_hex2_en <= '0';
        ELSE
            IF address = "01" THEN
                w_hex0_en <= '0';
                w_hex1_en <= writereq;
                w_hex2_en <= '0';
            ELSE
                IF address = "10" THEN
                    w_hex0_en <= '0';
                    w_hex1_en <= '0';
                    w_hex2_en <= writereq;
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
	-- <LAB: your code goes here>

	r_hex0_next <= writedata;
    r_hex1_next <= writedata;
	r_hex2_next <= writedata;
	
	-- outputs
	-- <LAB: your code goes here>

    val0 <= r_hex0_reg;
    val1 <= r_hex1_reg;
    val2 <= r_hex2_reg;
end architecture;