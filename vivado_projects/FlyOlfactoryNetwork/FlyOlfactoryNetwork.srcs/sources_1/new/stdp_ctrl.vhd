library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
entity stdp_ctrl is
PORT(
    clk : IN STD_LOGIC;
    command_signal : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    command_signal_flag : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    KC_sr_addrb : INOUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    KC_sr_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    weight_KC_MBONa1_web : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    weight_KC_MBONa1_addrb : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    weight_KC_MBONa1_dinb : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    weight_KC_MBONa1_doutb : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
);
end stdp_ctrl;
architecture Behavioral of stdp_ctrl is

    CONSTANT reward : natural := 1;
    CONSTANT LTD_reset : natural := 2;
    
    TYPE STATE_TYPE IS (READY,LTD0,RESET,DONE);
    SIGNAL STATE : STATE_TYPE := READY;
    SIGNAL COUNTER0 : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    CONSTANT weight_KC_APLMBON_addrb_MBON1_start : natural := 3838;
    CONSTANT KC_sr_addrb_MAX : natural := 1919;
    
BEGIN

    weight_KC_MBONa1_addrb <= KC_sr_addrb;
    
    processor : PROCESS (clk)
    BEGIN
        IF (rising_edge(clk)) THEN
            CASE STATE IS
                WHEN READY =>
                    IF(command_signal=reward and command_signal_flag = "1")THEN
                        KC_sr_addrb <= (OTHERS => '0');
                        COUNTER0 <= (OTHERS => '0');
                        STATE <= LTD0;
                    END IF;
                    IF(command_signal=LTD_reset and command_signal_flag = "1")THEN
                        KC_sr_addrb <= (OTHERS => '0');
                        COUNTER0 <= (OTHERS => '0');
                        STATE <= RESET;
                    END IF;
                WHEN LTD0 =>
                    IF(KC_sr_addrb < KC_sr_addrb_MAX)THEN
                        IF(COUNTER0 < "0010")THEN
                            COUNTER0 <= COUNTER0 + 1;
                        ELSIF(COUNTER0 = "0010")THEN
                            IF(KC_sr_doutb > 0 and weight_KC_MBONa1_doutb ="01")THEN
                                weight_KC_MBONa1_web <= "1";
                                weight_KC_MBONa1_dinb <= "11";
                            END IF;
                            COUNTER0 <= COUNTER0 + 1;
                        ELSE
                            weight_KC_MBONa1_web <= "0";
                            KC_sr_addrb <= KC_sr_addrb + 1;
                            COUNTER0 <= "0000";
                        END IF;
                    ELSE
                        STATE <= DONE;
                    END IF;
                WHEN RESET =>
                        IF(KC_sr_addrb < KC_sr_addrb_MAX)THEN
                            IF(COUNTER0 < "0010")THEN
                                COUNTER0 <= COUNTER0 + 1;
                            ELSIF(COUNTER0 = "0010")THEN
                                IF(weight_KC_MBONa1_doutb ="11")THEN
                                    weight_KC_MBONa1_web <= "1";
                                    weight_KC_MBONa1_dinb <= "01";
                                END IF;
                                COUNTER0 <= COUNTER0 + 1;
                            ELSE
                                weight_KC_MBONa1_web <= "0";
                                KC_sr_addrb <= KC_sr_addrb + 1;
                                COUNTER0 <= "0000";
                            END IF;
                        ELSE
                            STATE <= DONE;
                        END IF;
                WHEN DONE =>
                    STATE <= READY;
                WHEN OTHERS =>
                    STATE <= READY;
            END CASE;
        END IF;
    END PROCESS;
    
END Behavioral;