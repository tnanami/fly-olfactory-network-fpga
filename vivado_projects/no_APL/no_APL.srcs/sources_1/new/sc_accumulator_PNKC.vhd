LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY sc_accumulator_PNKC IS
        PORT (
    clk : IN STD_LOGIC;
    triger : IN STD_LOGIC;
    PN_sc_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    sc_sum : INOUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    add_ctrl : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    weight_PNKC_douta : IN STD_LOGIC_VECTOR(0 DOWNTO 0) := "0"
);
END sc_accumulator_PNKC;

ARCHITECTURE Behavioral OF sc_accumulator_PNKC IS

BEGIN

    sc_accumulator : PROCESS (clk)
    BEGIN
        IF (rising_edge(clk)) THEN
            IF(add_ctrl="00")THEN
                sc_sum<=(OTHERS => '0');
            ELSIF(add_ctrl="01")THEN
                IF(weight_PNKC_douta="1")THEN
                    IF(sc_sum < "111110000000000000") THEN
                        sc_sum<=sc_sum+("" & PN_sc_doutb(17 downto 0));
                    END IF;
                END IF;
            END iF;
        END IF;
    END PROCESS;

END Behavioral;