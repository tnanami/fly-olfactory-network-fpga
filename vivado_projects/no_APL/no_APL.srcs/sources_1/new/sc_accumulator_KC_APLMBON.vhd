LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY sc_accumulator_KC_APLMBON IS
        PORT (
    clk : IN STD_LOGIC;
    KC_sc_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    sc_sum : INOUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    add_ctrl : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    weight_KC_APLMBONa3_douta : IN STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    weight_KC_MBONa1_douta : IN STD_LOGIC_VECTOR(1 DOWNTO 0) := "00"
);
END sc_accumulator_KC_APLMBON;

ARCHITECTURE Behavioral OF sc_accumulator_KC_APLMBON IS

BEGIN

    sc_accumulator : PROCESS (clk)
    BEGIN
        IF (rising_edge(clk)) THEN
            IF(add_ctrl="00")THEN
                sc_sum<=(OTHERS => '0');
            ELSIF(add_ctrl="01")THEN
                IF(weight_KC_APLMBONa3_douta="1")THEN
                    IF(sc_sum < "100000000000000000") THEN
                        sc_sum<=sc_sum+("" & KC_sc_doutb(17 downto 0));
                    END IF;
                END IF;
            ELSIF(add_ctrl="10")THEN
                IF(weight_KC_MBONa1_douta="01")THEN
                    IF(sc_sum < "100000000000000000") THEN
                        sc_sum<=sc_sum+("" & KC_sc_doutb(17 downto 0));
                    END IF;
                ELSIF(weight_KC_MBONa1_douta="11")THEN
                    IF(sc_sum < "100000000000000000") THEN
                        sc_sum<=sc_sum+("00" & KC_sc_doutb(17 downto 2));
                    END IF;
                END IF;
            END iF;
        END IF;
    END PROCESS;

END Behavioral;