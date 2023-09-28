LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY fifo_txd_ctrl IS
	GENERIC (
		PQN_BIT_WIDTH : INTEGER := 18
	);
	PORT (
        CLK : IN STD_LOGIC;
        TRIGER : IN STD_LOGIC;
        UART_TXD : OUT STD_LOGIC;
        FIFO_TXD_RD_EN : OUT STD_LOGIC;
        FIFO_TXD_DOUT : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        FIFO_TXD_DATA_COUNT : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        TXD_DATA0 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA1 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA2 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA3 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA4 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA5 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA6 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA7 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA8 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA9 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA10 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA11 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0)
	);
END fifo_txd_ctrl;

ARCHITECTURE Behavioral OF fifo_txd_ctrl IS

	COMPONENT uart_txd_ctrl
		PORT (
			clk : IN STD_LOGIC;
			send_start : IN STD_LOGIC;
			send_data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			uart_txd : OUT STD_LOGIC;
			send_ready : OUT STD_LOGIC
		);
	END COMPONENT;

	TYPE STATE_TYPE IS (READY,SWITCH_DATA0,SEND_DATA0,SEND_DATA1, SWITCH_ADDR0, SEND_ADDR0, SEND_ADDR1, SEND_END0, SEND_END1);
	SIGNAL STATE : STATE_TYPE := READY;
	SIGNAL counter0 : NATURAL := 0;
	SIGNAL counter1 : NATURAL := 0;
	SIGNAL send_start : STD_LOGIC := '0';
	SIGNAL send_ready : STD_LOGIC := '0';
	SIGNAL send_data : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
	SIGNAL send_counter_max : NATURAL := 2;
	
	SIGNAL txd_data : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL txd_data0_buff : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL txd_data1_buff : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL txd_data2_buff : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL txd_data3_buff : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL txd_data4_buff : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL txd_data5_buff : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL txd_data6_buff : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL txd_data7_buff : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL txd_data8_buff : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL txd_data9_buff : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL txd_data10_buff : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL txd_data11_buff : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    
begin

	processor : PROCESS (CLK)
	BEGIN
		IF (rising_edge(CLK)) THEN
			CASE STATE IS
				WHEN READY => 
					send_start <= '0';
					counter0 <= 0;
					counter1 <= 0;
					IF (TRIGER = '1') THEN
					    txd_data0_buff <= TXD_DATA0;
					    txd_data1_buff <= TXD_DATA1;
					    txd_data2_buff <= TXD_DATA2;
					    txd_data3_buff <= TXD_DATA3;
					    txd_data4_buff <= TXD_DATA4;
					    txd_data5_buff <= TXD_DATA5;
					    txd_data6_buff <= TXD_DATA6;
					    txd_data7_buff <= TXD_DATA7;
					    txd_data8_buff <= TXD_DATA8;
					    txd_data9_buff <= TXD_DATA9;
					    txd_data10_buff <= TXD_DATA10;
					    txd_data11_buff <= TXD_DATA11;
						STATE <= SWITCH_DATA0;
					END IF;
				WHEN SWITCH_DATA0 =>
				    send_start <= '0';
				    IF(counter0 = 0) THEN
				        txd_data <= txd_data0_buff;
				        STATE <= SEND_DATA0;
				    ELSIF(counter0 = 1) THEN
				        txd_data <= txd_data1_buff;
				        STATE <= SEND_DATA0;
				    ELSIF(counter0 = 2) THEN
				        txd_data <= txd_data2_buff;
				        STATE <= SEND_DATA0;
				    ELSIF(counter0 = 3) THEN
				        txd_data <= txd_data3_buff;
				        STATE <= SEND_DATA0;
				    ELSIF(counter0 = 4) THEN
				        txd_data <= txd_data4_buff;
				        STATE <= SEND_DATA0;
				    ELSIF(counter0 = 5) THEN
				        txd_data <= txd_data5_buff;
				        STATE <= SEND_DATA0;
				    ELSIF(counter0 = 6) THEN
				        txd_data <= txd_data6_buff;
				        STATE <= SEND_DATA0;
				    ELSIF(counter0 = 7) THEN
				        txd_data <= txd_data7_buff;
				        STATE <= SEND_DATA0;
				    ELSIF(counter0 = 8) THEN
				        txd_data <= txd_data8_buff;
				        STATE <= SEND_DATA0;
				    ELSIF(counter0 = 9) THEN
				        txd_data <= txd_data9_buff;
				        STATE <= SEND_DATA0;
                    ELSIF(counter0 = 10) THEN
                        txd_data <= txd_data10_buff;
                        STATE <= SEND_DATA0;
                    ELSIF(counter0 = 11) THEN
                        txd_data <= txd_data11_buff;
                        STATE <= SEND_DATA0;
				    ELSE
				        STATE <= SWITCH_ADDR0;
				    END IF;
				WHEN SEND_DATA0 =>
					IF (counter1 < send_counter_max) THEN
						counter1 <= counter1 + 1;
					ELSIF (counter1 = send_counter_max) THEN
						IF (send_ready = '1') THEN
							send_data <= "1"&txd_data(15 downto 9);
							send_start <= '1';
							counter1 <= 0;
							STATE <= SEND_DATA1;
						END IF;
					END IF;
			    WHEN SEND_DATA1 =>
			        send_start <= '0';
					IF (counter1 < send_counter_max) THEN
						counter1 <= counter1 + 1;
					ELSIF (counter1 = send_counter_max) THEN
						IF (send_ready = '1') THEN
							send_data <= "1"&txd_data(8 downto 2);
							send_start <= '1';
							counter1 <= 0;
							counter0 <= counter0 + 1;
							STATE <= SWITCH_DATA0;
						END IF;
					END IF;  
				WHEN SWITCH_ADDR0 =>
				    send_start <= '0';
				    IF ( FIFO_TXD_DATA_COUNT>0) THEN
				        FIFO_TXD_RD_EN <= '1';
				        counter1 <= 0;
                        STATE <= SEND_ADDR0;
                    ELSE
                        STATE <= SEND_END0;
                    END IF;
				WHEN SEND_ADDR0 => 
				    FIFO_TXD_RD_EN <= '0';
					IF (counter1 < send_counter_max) THEN
						counter1 <= counter1 + 1;
					ELSIF (counter1 = send_counter_max) THEN
						IF (send_ready = '1') THEN
							send_data <= "1"&FIFO_TXD_DOUT(13 downto 7);
							send_start <= '1';
							counter1 <= 0;
							STATE <= SEND_ADDR1;
						END IF;
					END IF;
			    WHEN SEND_ADDR1 =>
			        send_start <= '0';
					IF (counter1 < send_counter_max) THEN
						counter1 <= counter1 + 1;
					ELSIF (counter1 = send_counter_max) THEN
						IF (send_ready = '1') THEN
							send_data <= "1"&FIFO_TXD_DOUT(6 downto 0);
							send_start <= '1';
							counter1 <= 0;
							STATE <= SWITCH_ADDR0;
						END IF;
					END IF;
				WHEN SEND_END0 =>
				    IF (counter1 < send_counter_max) THEN
						counter1 <= counter1 + 1;
					ELSIF (counter1 = send_counter_max) THEN
						IF (send_ready = '1') THEN
							send_data <= "00001010";
							send_start <= '1';
							counter1 <= 0;
							STATE <= READY;
						END IF;
					END IF;
				WHEN OTHERS => 
					STATE <= READY;
			END CASE;
		END IF;
	END PROCESS; 
	
	uart_txd_ctrl_0 : uart_txd_ctrl
	PORT MAP(
		CLK => CLK, 
		send_start => send_start, 
		send_data => send_data, 
		uart_txd => uart_txd, 
		send_ready => send_ready
	);

end Behavioral;
