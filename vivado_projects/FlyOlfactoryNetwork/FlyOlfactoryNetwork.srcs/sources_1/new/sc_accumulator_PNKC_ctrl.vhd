library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
entity sc_accumulator_PNKC_ctrl is
PORT(
    clk : IN STD_LOGIC;
    triger : IN STD_LOGIC;
    PN_sc_addrb : INOUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    PN_sc_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    KC_I_addra : INOUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    KC_I_dina : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    KC_I_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    APL_I1 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
);
end sc_accumulator_PNKC_ctrl;
architecture Behavioral of sc_accumulator_PNKC_ctrl is

    COMPONENT sc_accumulator_PNKC IS
        PORT (
            clk : IN STD_LOGIC;
            triger : IN STD_LOGIC;
            PN_sc_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            sc_sum : INOUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            add_ctrl : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            weight_PNKC_douta : IN STD_LOGIC_VECTOR(0 DOWNTO 0) := "0"
        );
    END COMPONENT;
    
    COMPONENT blk_mem_weight_PNKC_0 IS
        PORT (
            clka : IN STD_LOGIC;
            addra : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT blk_mem_weight_PNKC_1 IS
        PORT (
            clka : IN STD_LOGIC;
            addra : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT blk_mem_weight_PNKC_2 IS
        PORT (
            clka : IN STD_LOGIC;
            addra : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
        );
    END COMPONENT;
  
    SIGNAL weight_PNKC_addra : STD_LOGIC_VECTOR(16 DOWNTO 0) := (OTHERS => '0');  
    SIGNAL weight_PNKC_douta_0 : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL weight_PNKC_douta_1 : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL weight_PNKC_douta_2 : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    
    TYPE STATE_TYPE IS (READY, HANDLING0, ACCUM0, INSERTING0);
    SIGNAL STATE : STATE_TYPE := READY;
    SIGNAL PN_sc_addra_MAX : NATURAL := 121;
    SIGNAL COUNTER0 : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL COUNTER1 : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_I_addra_buff : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_I_addra_MAX : NATURAL :=  1919;
    SIGNAL add_ctrl : STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL sc_sum_0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL sc_sum_1 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL sc_sum_2 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');

BEGIN

    sc_accumulator_PNKC_0 : sc_accumulator_PNKC PORT MAP(
        clk => clk,
        triger => triger,
        PN_sc_doutb => PN_sc_doutb,
        sc_sum => sc_sum_0,
        add_ctrl => add_ctrl,
        weight_PNKC_douta => weight_PNKC_douta_0
    );
    sc_accumulator_PNKC_1 : sc_accumulator_PNKC PORT MAP(
        clk => clk,
        triger => triger,
        PN_sc_doutb => PN_sc_doutb,
        sc_sum => sc_sum_1,
        add_ctrl => add_ctrl,
        weight_PNKC_douta => weight_PNKC_douta_1
    );
    sc_accumulator_PNKC_2 : sc_accumulator_PNKC PORT MAP(
        clk => clk,
        triger => triger,
        PN_sc_doutb => PN_sc_doutb,
        sc_sum => sc_sum_2,
        add_ctrl => add_ctrl,
        weight_PNKC_douta => weight_PNKC_douta_2
    );
    blk_mem_weight_PNKC_0_0 : blk_mem_weight_PNKC_0 PORT MAP(
        clka => clk,
        addra => weight_PNKC_addra,
        douta => weight_PNKC_douta_0
    );
    blk_mem_weight_PNKC_1_0 : blk_mem_weight_PNKC_1 PORT MAP(
        clka => clk,
        addra => weight_PNKC_addra,
        douta => weight_PNKC_douta_1
    );
    blk_mem_weight_PNKC_2_0 : blk_mem_weight_PNKC_2 PORT MAP(
        clka => clk,
        addra => weight_PNKC_addra,
        douta => weight_PNKC_douta_2
    );

    sc_accumulator_ctrl : PROCESS (clk)
    BEGIN
        IF (rising_edge(clk)) THEN
            CASE STATE IS
                WHEN READY =>
                    PN_sc_addrb <= (OTHERS => '0');
                    COUNTER0 <= (OTHERS => '0');
                    COUNTER1 <= (OTHERS => '0');
                    weight_PNKC_addra <= (OTHERS => '0');
                    add_ctrl <= "00";
                    IF (triger = '1') THEN
                        STATE <= HANDLING0;
                    END IF;
                WHEN HANDLING0 =>
                    IF(COUNTER1=640)THEN
                        STATE <= READY;
                    ELSE
                        add_ctrl <= "00";
                        STATE <= ACCUM0;
                    END IF; 
                WHEN ACCUM0 =>
                    IF(COUNTER0 = 0)THEN
                        PN_sc_addrb<=PN_sc_addrb+1;
                        weight_PNKC_addra<=weight_PNKC_addra+1;
                        COUNTER0<=COUNTER0+1;
                    ELSIF(COUNTER0 = 1)THEN
                        add_ctrl <= "01";
                        PN_sc_addrb<=PN_sc_addrb+1;
                        weight_PNKC_addra<=weight_PNKC_addra+1;
                        COUNTER0<=COUNTER0+1;
                    ELSIF(COUNTER0 < PN_sc_addra_MAX-1)THEN
                        PN_sc_addrb<=PN_sc_addrb+1;
                        weight_PNKC_addra<=weight_PNKC_addra+1;
                        COUNTER0<=COUNTER0+1;
                    ELSIF(COUNTER0 = PN_sc_addra_MAX-1)THEN    
                        COUNTER0<=COUNTER0+1;
                    ELSIF(COUNTER0 = PN_sc_addra_MAX)THEN    
                        COUNTER0<=COUNTER0+1;
                    ELSIF(COUNTER0 = PN_sc_addra_MAX+1)THEN    
                        add_ctrl <= "11";
                        COUNTER0<=COUNTER0+1;
                    ELSE
                        COUNTER0<=(OTHERS => '0');
                        STATE <= INSERTING0;
                    END IF;
                WHEN INSERTING0 =>
                    IF(COUNTER0="00000000000")THEN
                        KC_I_addra <=  COUNTER1;
                        KC_I_dina <= sc_sum_0;
                        KC_I_wea <= "1";
                        COUNTER0<=COUNTER0+1;
                     ELSIF(COUNTER0="00000000001")THEN
                        KC_I_addra <= COUNTER1+640;
                        KC_I_dina <= sc_sum_1;
                        KC_I_wea <= "1";
                        COUNTER0<=COUNTER0+1;
                     ELSIF(COUNTER0="00000000010")THEN
                        IF(COUNTER1<639)THEN
                            KC_I_addra <= COUNTER1+640+640;
                            KC_I_dina <= sc_sum_2;
                            KC_I_wea <= "1";
                            COUNTER0<=COUNTER0+1;
                        ELSIF(COUNTER1=639)THEN
                            APL_I1 <= sc_sum_2;
                        END IF;
                        COUNTER0<=COUNTER0+1;
                     ELSE
                        weight_PNKC_addra<=weight_PNKC_addra+1;
                        KC_I_wea <= "0";
                        COUNTER1<=COUNTER1+1;
                        COUNTER0<=(OTHERS => '0');
                        PN_sc_addrb<=(OTHERS => '0');
                        STATE <= HANDLING0;
                     END IF;                        
                WHEN OTHERS =>
                    STATE <= READY;
            END CASE;
        END IF;
    END PROCESS;
    
END Behavioral;