library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
ENTITY UART_TX IS
    PORT (
        clk100 : IN STD_LOGIC;
        clk1k : IN STD_LOGIC;
        UART_TX : OUT STD_LOGIC;
        PORT_dssn_glomeruli_id : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        PORT_dssn_glomeruli_wr_en : IN STD_LOGIC;
        PORT_LN0_for_measuring : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        PORT_LN1_for_measuring : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        PORT_LN2_for_measuring : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        PORT_LN3_for_measuring : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        PORT_PN_for_measuring : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        PORT_KC_for_measuring : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        PORT_MBON_for_measuring : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        PORT_APL_for_measuring : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        PORT_CREPINE_for_measuring : IN STD_LOGIC_VECTOR(17 DOWNTO 0)
    );
END UART_TX;
ARCHITECTURE Behavioral OF UART_TX IS

    COMPONENT dssn_glomeruli_fifo IS
        PORT (
            clk : IN STD_LOGIC;
            srst : IN STD_LOGIC;
            din : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            wr_en : IN STD_LOGIC;
            rd_en : IN STD_LOGIC;
            dout : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
            full : OUT STD_LOGIC;
            empty : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT UART_TX_CTRL
        PORT (
            SEND : IN STD_LOGIC;
            DATA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            CLK : IN STD_LOGIC;
            READY : OUT STD_LOGIC;
            UART_TX : OUT STD_LOGIC;
            DONE : OUT STD_LOGIC
        );
    END COMPONENT;

    --SIGNAL dssn_id : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
    --SIGNAL dssn_id_rd_en : STD_LOGIC;

    TYPE STATE_TYPE IS (STANDBY, SEND_MEASURING0, SEND_MEASURING1, SEND_MEASURING2, SEND_MEASURING3, SEND_MEASURING4, SEND_MEASURING5, SEND_MEASURING6, SEND_MEASURING7, SEND_MEASURING8, SEND_MEASURING9, SEND_MEASURING10, SEND_MEASURING11, SEND_MEASURING12, SEND_MEASURING13, SEND_MEASURING14, SEND_MEASURING15,SEND_MEASURING16, SEND_MEASURING17, SEND_DSSN_ID0, SEND_DSSN_ID1, SEND_DSSN_ID2,END0);
    SIGNAL STATE : STATE_TYPE := STANDBY;
    SIGNAL COUNTER0 : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL TX_SEND : STD_LOGIC := '0';
    SIGNAL TX_READY : STD_LOGIC := '0';
    SIGNAL TX_DONE : STD_LOGIC := '0';
    SIGNAL TX_DATA : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');

    SIGNAL dssn_glomeruli_fifo_srst : STD_LOGIC := '0';
    SIGNAL dssn_glomeruli_fifo_din : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
    SIGNAL dssn_glomeruli_fifo_wr_en : STD_LOGIC := '0';
    SIGNAL dssn_glomeruli_fifo_rd_en : STD_LOGIC := '0';
    SIGNAL dssn_glomeruli_fifo_dout : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
    SIGNAL dssn_glomeruli_fifo_full : STD_LOGIC := '0';
    SIGNAL dssn_glomeruli_fifo_empty : STD_LOGIC := '0';

BEGIN
    dssn_glomeruli_fifo_din <= PORT_dssn_glomeruli_id;
    dssn_glomeruli_fifo_wr_en <= PORT_dssn_glomeruli_wr_en;

    dssn_glomeruli_fifo_0 : dssn_glomeruli_fifo PORT MAP(
        clk => clk100,
        srst => dssn_glomeruli_fifo_srst,
        din => dssn_glomeruli_fifo_din,
        wr_en => dssn_glomeruli_fifo_wr_en,
        rd_en => dssn_glomeruli_fifo_rd_en,
        dout => dssn_glomeruli_fifo_dout,
        full => dssn_glomeruli_fifo_full,
        empty => dssn_glomeruli_fifo_empty
    );
    Inst_UART_TX_CTRL : UART_TX_CTRL PORT MAP(
        SEND => TX_SEND,
        DATA => TX_DATA,
        CLK => CLK100,
        READY => TX_READY,
        UART_TX => UART_TX,
        DONE => TX_DONE
    );

    processor : PROCESS (clk100)
    BEGIN
        IF (rising_edge(clk100)) THEN
            CASE STATE IS
                WHEN STANDBY =>
                    TX_SEND <= '0';
                    IF (clk1k = '1') THEN
                        STATE <= SEND_MEASURING0;
                        COUNTER0 <= (OTHERS => '0');
                    END IF;
                WHEN SEND_MEASURING0 =>
                    IF (COUNTER0 < "1110") THEN
                        TX_SEND <= '0';
                        COUNTER0 <= COUNTER0 + 1;
                    ELSIF (COUNTER0 = "1110") THEN
                        IF (TX_READY = '1') THEN
                            TX_DATA <= "01" & PORT_LN0_for_measuring(16 DOWNTO 11);
                            TX_SEND <= '1';
                            COUNTER0 <= (OTHERS => '0');
                            STATE <= SEND_MEASURING1;
                        END IF;
                    END IF;
                WHEN SEND_MEASURING1 =>
                    IF (COUNTER0 < "1110") THEN
                        TX_SEND <= '0';
                        COUNTER0 <= COUNTER0 + 1;
                    ELSIF (COUNTER0 = "1110") THEN
                        IF (TX_READY = '1') THEN
                            TX_DATA <= "01" & PORT_LN0_for_measuring(10 DOWNTO 5);
                            TX_SEND <= '1';
                            COUNTER0 <= (OTHERS => '0');
                            STATE <= SEND_MEASURING2;
                        END IF;
                    END IF;
                WHEN SEND_MEASURING2 =>
                    IF (COUNTER0 < "1110") THEN
                        TX_SEND <= '0';
                        COUNTER0 <= COUNTER0 + 1;
                    ELSIF (COUNTER0 = "1110") THEN
                        IF (TX_READY = '1') THEN
                            TX_DATA <= "01" & PORT_LN1_for_measuring(16 DOWNTO 11);
                            TX_SEND <= '1';
                            COUNTER0 <= (OTHERS => '0');
                            STATE <= SEND_MEASURING3;
                        END IF;
                    END IF;
                WHEN SEND_MEASURING3 =>
                    IF (COUNTER0 < "1110") THEN
                        TX_SEND <= '0';
                        COUNTER0 <= COUNTER0 + 1;
                    ELSIF (COUNTER0 = "1110") THEN
                        IF (TX_READY = '1') THEN
                            TX_DATA <= "01" & PORT_LN1_for_measuring(10 DOWNTO 5);
                            TX_SEND <= '1';
                            COUNTER0 <= (OTHERS => '0');
                            STATE <= SEND_MEASURING4;
                        END IF;
                    END IF;
                WHEN SEND_MEASURING4 =>
                    IF (COUNTER0 < "1110") THEN
                        TX_SEND <= '0';
                        COUNTER0 <= COUNTER0 + 1;
                    ELSIF (COUNTER0 = "1110") THEN
                        IF (TX_READY = '1') THEN
                            TX_DATA <= "01" & PORT_LN2_for_measuring(16 DOWNTO 11);
                            TX_SEND <= '1';
                            COUNTER0 <= (OTHERS => '0');
                            STATE <= SEND_MEASURING5;
                        END IF;
                    END IF;
                WHEN SEND_MEASURING5 =>
                    IF (COUNTER0 < "1110") THEN
                        TX_SEND <= '0';
                        COUNTER0 <= COUNTER0 + 1;
                    ELSIF (COUNTER0 = "1110") THEN
                        IF (TX_READY = '1') THEN
                            TX_DATA <= "01" &  PORT_LN2_for_measuring(10 DOWNTO 5);
                            TX_SEND <= '1';
                            COUNTER0 <= (OTHERS => '0');
                            STATE <= SEND_MEASURING6;
                        END IF;
                    END IF;
                WHEN SEND_MEASURING6 =>
                    IF (COUNTER0 < "1110") THEN
                        TX_SEND <= '0';
                        COUNTER0 <= COUNTER0 + 1;
                    ELSIF (COUNTER0 = "1110") THEN
                        IF (TX_READY = '1') THEN
                            TX_DATA <= "01" & PORT_LN3_for_measuring(16 DOWNTO 11);
                            TX_SEND <= '1';
                            COUNTER0 <= (OTHERS => '0');
                            STATE <= SEND_MEASURING7;
                        END IF;
                    END IF;
                WHEN SEND_MEASURING7 =>
                    IF (COUNTER0 < "1110") THEN
                        TX_SEND <= '0';
                        COUNTER0 <= COUNTER0 + 1;
                    ELSIF (COUNTER0 = "1110") THEN
                        IF (TX_READY = '1') THEN
                            TX_DATA <= "01" & PORT_LN3_for_measuring(10 DOWNTO 5);
                            TX_SEND <= '1';
                            COUNTER0 <= (OTHERS => '0');
                            STATE <= SEND_MEASURING8;
                        END IF;
                    END IF;
                WHEN SEND_MEASURING8 =>
                    IF (COUNTER0 < "1110") THEN
                        TX_SEND <= '0';
                        COUNTER0 <= COUNTER0 + 1;
                     ELSIF (COUNTER0 = "1110") THEN
                         IF (TX_READY = '1') THEN
                            TX_DATA <= "01" & PORT_PN_for_measuring(16 DOWNTO 11);
                            TX_SEND <= '1';
                            COUNTER0 <= (OTHERS => '0');
                            STATE <= SEND_MEASURING9;
                        END IF;
                    END IF;
                WHEN SEND_MEASURING9 =>
                    IF (COUNTER0 < "1110") THEN                         
                        TX_SEND <= '0';
                        COUNTER0 <= COUNTER0 + 1;
                    ELSIF (COUNTER0 = "1110") THEN
                        IF (TX_READY = '1') THEN
                            TX_DATA <= "01" & PORT_PN_for_measuring(10 DOWNTO 5);
                            TX_SEND <= '1';
                            COUNTER0 <= (OTHERS => '0');
                            STATE <= SEND_MEASURING10;
                        END IF;
                    END IF;
                WHEN SEND_MEASURING10 =>
                        IF (COUNTER0 < "1110") THEN
                            TX_SEND <= '0';
                            COUNTER0 <= COUNTER0 + 1;
                         ELSIF (COUNTER0 = "1110") THEN
                             IF (TX_READY = '1') THEN
                                TX_DATA <= "01" & PORT_KC_for_measuring(16 DOWNTO 11);
                                TX_SEND <= '1';
                                COUNTER0 <= (OTHERS => '0');
                                STATE <= SEND_MEASURING11;
                            END IF;
                        END IF;
                    WHEN SEND_MEASURING11 =>
                        IF (COUNTER0 < "1110") THEN                         
                            TX_SEND <= '0';
                            COUNTER0 <= COUNTER0 + 1;
                        ELSIF (COUNTER0 = "1110") THEN
                            IF (TX_READY = '1') THEN
                                TX_DATA <= "01" & PORT_KC_for_measuring(10 DOWNTO 5);
                                TX_SEND <= '1';
                                COUNTER0 <= (OTHERS => '0');
                                STATE <=  SEND_MEASURING12;
                            END IF;
                        END IF;                
                WHEN SEND_MEASURING12 =>
                            IF (COUNTER0 < "1110") THEN
                                TX_SEND <= '0';
                                COUNTER0 <= COUNTER0 + 1;
                             ELSIF (COUNTER0 = "1110") THEN
                                 IF (TX_READY = '1') THEN
                                    TX_DATA <= "01" & PORT_MBON_for_measuring(16 DOWNTO 11);
                                    TX_SEND <= '1';
                                    COUNTER0 <= (OTHERS => '0');
                                    STATE <= SEND_MEASURING13;
                                END IF;
                            END IF;
                        WHEN SEND_MEASURING13 =>
                            IF (COUNTER0 < "1110") THEN                         
                                TX_SEND <= '0';
                                COUNTER0 <= COUNTER0 + 1;
                            ELSIF (COUNTER0 = "1110") THEN
                                IF (TX_READY = '1') THEN
                                    TX_DATA <= "01" & PORT_MBON_for_measuring(10 DOWNTO 5);
                                    TX_SEND <= '1';
                                    COUNTER0 <= (OTHERS => '0');
                                    STATE <=  SEND_MEASURING14;
                                END IF;
                            END IF;                     
                WHEN SEND_MEASURING14 =>
                                IF (COUNTER0 < "1110") THEN
                                    TX_SEND <= '0';
                                    COUNTER0 <= COUNTER0 + 1;
                                 ELSIF (COUNTER0 = "1110") THEN
                                     IF (TX_READY = '1') THEN
                                        TX_DATA <= "01" & PORT_APL_for_measuring(16 DOWNTO 11);
                                        TX_SEND <= '1';
                                        COUNTER0 <= (OTHERS => '0');
                                        STATE <= SEND_MEASURING15;
                                    END IF;
                                END IF;
                            WHEN SEND_MEASURING15 =>
                                IF (COUNTER0 < "1110") THEN                         
                                    TX_SEND <= '0';
                                    COUNTER0 <= COUNTER0 + 1;
                                ELSIF (COUNTER0 = "1110") THEN
                                    IF (TX_READY = '1') THEN
                                        TX_DATA <= "01" & PORT_APL_for_measuring(10 DOWNTO 5);
                                        TX_SEND <= '1';
                                        COUNTER0 <= (OTHERS => '0');
                                        STATE <=  SEND_MEASURING16;
                                    END IF;
                                END IF;
                WHEN SEND_MEASURING16 =>
                                    IF (COUNTER0 < "1110") THEN
                                        TX_SEND <= '0';
                                        COUNTER0 <= COUNTER0 + 1;
                                     ELSIF (COUNTER0 = "1110") THEN
                                         IF (TX_READY = '1') THEN
                                            TX_DATA <= "01" & PORT_CREPINE_for_measuring(16 DOWNTO 11);
                                            TX_SEND <= '1';
                                            COUNTER0 <= (OTHERS => '0');
                                            STATE <= SEND_MEASURING17;
                                        END IF;
                                    END IF;
                                WHEN SEND_MEASURING17 =>
                                    IF (COUNTER0 < "1110") THEN                         
                                        TX_SEND <= '0';
                                        COUNTER0 <= COUNTER0 + 1;
                                    ELSIF (COUNTER0 = "1110") THEN
                                        IF (TX_READY = '1') THEN
                                            TX_DATA <= "01" & PORT_CREPINE_for_measuring(10 DOWNTO 5);
                                            TX_SEND <= '1';
                                            COUNTER0 <= (OTHERS => '0');
                                            STATE <= END0;
                                        END IF;
                                    END IF;                   
                WHEN SEND_DSSN_ID0 =>
                    TX_SEND <= '0';
                    dssn_glomeruli_fifo_rd_en <= '0';
                    IF(dssn_glomeruli_fifo_empty='1')THEN
                        STATE <= END0;
                    ELSE
                        STATE <= SEND_DSSN_ID1;
                    END IF;
                WHEN SEND_DSSN_ID1 =>
                    IF (COUNTER0 < "1110") THEN
                        TX_SEND <= '0';
                        COUNTER0 <= COUNTER0 + 1;
                    ELSIF (COUNTER0 = "1110") THEN
                        IF (TX_READY = '1') THEN
                            TX_DATA <= "11" & dssn_glomeruli_fifo_dout(11 DOWNTO 6);
                            TX_SEND <= '1';
                            COUNTER0 <= (OTHERS => '0');
                            STATE <= SEND_DSSN_ID2;
                        END IF;
                    END IF;
                WHEN SEND_DSSN_ID2 =>
                    IF (COUNTER0 < "1110") THEN
                        TX_SEND <= '0';
                        COUNTER0 <= COUNTER0 + 1;
                    ELSIF (COUNTER0 = "1110") THEN
                        IF (TX_READY = '1') THEN
                            TX_DATA <= "10" & dssn_glomeruli_fifo_dout(5 DOWNTO 0);
                            TX_SEND <= '1';
                            COUNTER0 <= (OTHERS => '0');
                            dssn_glomeruli_fifo_rd_en <= '1';
                            STATE <= SEND_DSSN_ID0;
                        END IF;
                    END IF;
                WHEN END0 =>
                    IF (COUNTER0 < "1110") THEN
                        TX_SEND <= '0';
                        COUNTER0 <= COUNTER0 + 1;
                    ELSIF (COUNTER0 = "1110") THEN
                        IF (TX_READY = '1') THEN
                            TX_DATA <= "00001010";
                            TX_SEND <= '1';
                            COUNTER0 <= (OTHERS => '0');
                            STATE <= STANDBY;--SEND_DSSN_ID0;
                        END IF;
                    END IF;
                WHEN OTHERS =>
                    STATE <= STANDBY;
            END CASE;
        END IF;
    END PROCESS;
END Behavioral;