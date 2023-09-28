library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
entity sc_accumulator_KC_APLMBON_ctrl is
    PORT(
    clk : IN STD_LOGIC;
    triger : IN STD_LOGIC;
    KC_sc_addrb : INOUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    KC_sc_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    APL_I0 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    MBON0_I : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    MBON1_I : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    weight_KC_APLMBONa3_addra : INOUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    weight_KC_APLMBONa3_douta : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    weight_KC_MBONa1_addra : INOUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    weight_KC_MBONa1_douta : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
);
end sc_accumulator_KC_APLMBON_ctrl;
architecture Behavioral of sc_accumulator_KC_APLMBON_ctrl is

    COMPONENT sc_accumulator_KC_APLMBON IS
        PORT (
            clk : IN STD_LOGIC;
            KC_sc_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            sc_sum : INOUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            add_ctrl : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            weight_KC_APLMBONa3_douta : IN STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
            weight_KC_MBONa1_douta : IN STD_LOGIC_VECTOR(1 DOWNTO 0) := "00"
        );
    END COMPONENT;
    
    SIGNAL weight_KC_APLMBON_addra : STD_LOGIC_VECTOR(12 DOWNTO 0) := (OTHERS => '0');
    SIGNAL weight_KC_APLMBON_douta : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL weight_KC_MBONa1_addra_temp : STD_LOGIC_VECTOR(12 DOWNTO 0) := (OTHERS => '0');
    
    TYPE STATE_TYPE IS (READY, HANDLING0, ACCUM0, INSERTING0);
    SIGNAL STATE : STATE_TYPE := READY;
    SIGNAL KC_sc_addra_MAX : NATURAL := 1919;
    SIGNAL weight_KC_APLMBONa3_addra_MAX : NATURAL := 3838;
    SIGNAL weight_KC_APLMBON_addra_MAX : NATURAL := 5757;
    SIGNAL COUNTER0 : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL COUNTER1 : STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL sc_sum : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL add_ctrl : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";

BEGIN
    
    weight_KC_APLMBONa3_addra <= weight_KC_APLMBON_addra(11 downto 0);
    weight_KC_MBONa1_addra_temp <= weight_KC_APLMBON_addra - weight_KC_APLMBONa3_addra_MAX;
    weight_KC_MBONa1_addra <= weight_KC_MBONa1_addra_temp(10 downto 0);   
   
    sc_accumulator_KC_APLMBON_0_0 : sc_accumulator_KC_APLMBON PORT MAP(
        clk => clk,
        KC_sc_doutb => KC_sc_doutb,
        sc_sum => sc_sum,
        add_ctrl => add_ctrl,
        weight_KC_APLMBONa3_douta => weight_KC_APLMBONa3_douta,
        weight_KC_MBONa1_douta => weight_KC_MBONa1_douta
    );

    sc_accumulator_ctrl : PROCESS (clk)
    BEGIN
        IF (rising_edge(clk)) THEN
            CASE STATE IS
                WHEN READY =>
                    KC_sc_addrb <= (OTHERS => '0');
                    COUNTER0 <= (OTHERS => '0');
                    COUNTER1 <= (OTHERS => '0');
                    weight_KC_APLMBON_addra <= (OTHERS => '0');
                    add_ctrl <= "00";
                    IF (triger = '1') THEN
                        STATE <= HANDLING0;
                    END IF;
                WHEN HANDLING0 =>
                    IF(COUNTER1="11")THEN
                        STATE <= READY;
                    ELSE
                        add_ctrl <= "00";
                        STATE <= ACCUM0;
                    END IF; 
                WHEN ACCUM0 =>
                    IF(COUNTER0 = 0)THEN
                        KC_sc_addrb<=KC_sc_addrb+1;
                        weight_KC_APLMBON_addra<=weight_KC_APLMBON_addra+1;
                        COUNTER0<=COUNTER0+1;
                    ELSIF(COUNTER0 = 1)THEN
                        IF(weight_KC_APLMBON_addra < weight_KC_APLMBONa3_addra_MAX)THEN
                            add_ctrl <= "01";
                        ELSE
                            add_ctrl <= "10";
                        END IF;
                        KC_sc_addrb<=KC_sc_addrb+1;
                        weight_KC_APLMBON_addra<=weight_KC_APLMBON_addra+1;
                        COUNTER0<=COUNTER0+1;
                    ELSIF(COUNTER0 < KC_sc_addra_MAX-1)THEN
                        KC_sc_addrb<=KC_sc_addrb+1;
                        weight_KC_APLMBON_addra<=weight_KC_APLMBON_addra+1;
                        COUNTER0<=COUNTER0+1;
                    ELSIF(COUNTER0 = KC_sc_addra_MAX-1)THEN    
                        COUNTER0<=COUNTER0+1;
                    ELSIF(COUNTER0 = KC_sc_addra_MAX)THEN    
                        COUNTER0<=COUNTER0+1;
                    ELSIF(COUNTER0 = KC_sc_addra_MAX+1)THEN    
                        add_ctrl <= "11";
                        COUNTER0<=COUNTER0+1;
                    ELSE
                        COUNTER0<=(OTHERS => '0');
                        STATE <= INSERTING0;
                    END IF;
                WHEN INSERTING0 =>
                    IF(COUNTER0="00000000000")THEN
                        IF(COUNTER1="00")THEN
                            APL_I0<=sc_sum;
                        ELSIF(COUNTER1="01")THEN
                            MBON0_I<=sc_sum;
                        ELSIF(COUNTER1="10")THEN
                            MBON1_I<=sc_sum;
                        END IF;
                        COUNTER0<=COUNTER0+1;
                    ELSE
                        weight_KC_APLMBON_addra<=weight_KC_APLMBON_addra+1;
                        COUNTER1<=COUNTER1+1;
                        COUNTER0<=(OTHERS => '0');
                        KC_sc_addrb<=(OTHERS => '0');
                        STATE <= HANDLING0;
                     END IF;                        
                WHEN OTHERS =>
                    STATE <= READY;
            END CASE;
        END IF;
    END PROCESS;
    
END Behavioral;