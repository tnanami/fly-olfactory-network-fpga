LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

-- received_data_coupled
-- 0: not used
-- 1: reward signal for LTD
-- 2: LTD reset
-- 3: PN homeostasis start
-- 4: PN homeostasis end
-- 5: start pqn
-- 10: next time step
-- 11--2536 : addrass of ORN that spikes in this time step - 11

ENTITY fifo_rxd_ctrl IS
	GENERIC (
		PQN_BIT_WIDTH : INTEGER := 18
	);
	PORT (
		CLK : IN STD_LOGIC;
		TRIGER : IN STD_LOGIC;
		UART_RXD : IN STD_LOGIC;
		command_signal : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
		command_signal_flag : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
	    ORN_sc_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
		ORN_sc_addra : INOUT STD_LOGIC_VECTOR(11 DOWNTO 0);
		ORN_sc_dina : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH - 1 DOWNTO 0);
		ORN_sc_douta : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH - 1 DOWNTO 0);
		ORN_sc_sum : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH - 1 DOWNTO 0);
		ORN_fifo_data_count : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
		rxd_start_flag : OUT STD_LOGIC
	);
END fifo_rxd_ctrl;

ARCHITECTURE Behavioral OF fifo_rxd_ctrl IS

	COMPONENT uart_rxd_ctrl
		PORT (
			clk : IN STD_LOGIC;
			uart_rxd : IN STD_LOGIC;
			received_data : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			received_done : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT fifo_rxd IS
		PORT (
			clk : IN STD_LOGIC;
			din : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			wr_en : IN STD_LOGIC;
			rd_en : IN STD_LOGIC;
			dout : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
			full : OUT STD_LOGIC;
			empty : OUT STD_LOGIC;
			data_count : OUT STD_LOGIC_VECTOR(13 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL received_done : STD_LOGIC := '0';
	SIGNAL received_data : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
	SIGNAL received_data_coupled : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
	SIGNAL counter0 : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
	CONSTANT ORN_sc_amp : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000010000000000";--1
	CONSTANT ORN_sc_addra_max : NATURAL := 1780;
	SIGNAL ORN_sc_decay : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
 	SIGNAL ORN_sc_sum_temp : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');

	TYPE STATE_TYPE IS (READY, READ0, READ1, READ2);
	SIGNAL STATE : STATE_TYPE := READY;
	TYPE MAIN_STATE_TYPE IS (READY, READ0, SWITCH0, SWITCH1, INCREASE0, DECREASE0, DECREASE1);
	SIGNAL MAIN_STATE : MAIN_STATE_TYPE := READY;

	SIGNAL fifo_din : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
	SIGNAL fifo_dout : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
	SIGNAL fifo_wr_en : STD_LOGIC := '0';
	SIGNAL fifo_rd_en : STD_LOGIC := '0';
	SIGNAL fifo_full : STD_LOGIC := '0';
	SIGNAL fifo_empty : STD_LOGIC := '0';
	SIGNAL fifo_data_count : STD_LOGIC_VECTOR(13 DOWNTO 0) := (OTHERS => '0');
	SIGNAL start_flag : STD_LOGIC := '0';

BEGIN

    ORN_fifo_data_count <= "0000"&fifo_data_count;
    rxd_start_flag <= start_flag;

	DATA_CTRL : PROCESS (CLK)
	BEGIN
		IF (rising_edge(CLK)) THEN
			CASE STATE IS
				WHEN READY => 
					fifo_wr_en <= '0';
					IF (received_done = '1' AND received_data(7 DOWNTO 6) = "10") THEN
						received_data_coupled(11 DOWNTO 6) <= received_data(5 DOWNTO 0);
						start_flag <='1';
						STATE <= READ0;
					END IF;
				WHEN READ0 => 
					IF (received_done = '1') THEN
						IF (received_data(7 DOWNTO 6) = "01") THEN
							received_data_coupled(5 DOWNTO 0) <= received_data(5 DOWNTO 0);
							STATE <= READ1;
						ELSE
							STATE <= READY;
						END IF;
					END IF;
				WHEN READ1 => 
					fifo_din <= received_data_coupled; 
					fifo_wr_en <= '1';                 
					STATE <= READY;
				WHEN OTHERS => 
					STATE <= READY;
			END CASE;
		END IF;
	END PROCESS;

	ORN_sc_ctrl : PROCESS (CLK)
	BEGIN
		IF (rising_edge(CLK)) THEN
			CASE MAIN_STATE IS
				WHEN READY => 
				    ORN_sc_sum_temp <= (OTHERS => '0');
					IF (TRIGER = '1') THEN
						MAIN_STATE <= READ0;
					END IF;
				WHEN READ0 => 
					fifo_rd_en <= '1';
					command_signal_flag <= "0";
					ORN_sc_wea <= "0";
					IF(fifo_data_count=0)THEN
		                ORN_sc_addra <= (OTHERS => '0');
						MAIN_STATE <= DECREASE0;
			        ELSE
					   MAIN_STATE <= SWITCH0;
					END IF;
				WHEN SWITCH0 =>
				    fifo_rd_en <= '0';
				    MAIN_STATE <= SWITCH1;	
				WHEN SWITCH1 => 
					fifo_rd_en <= '0';
					IF (fifo_dout>0 and fifo_dout < 10) THEN
						command_signal <= fifo_dout;
						command_signal_flag <= "1";
						MAIN_STATE <= READ0;
					ELSIF (fifo_dout = 10 or fifo_data_count=0) THEN
						ORN_sc_addra <= (OTHERS => '0');
						MAIN_STATE <= DECREASE0;
					ELSE
						ORN_sc_addra <= fifo_dout - 11;
						counter0 <= (OTHERS => '0');
						MAIN_STATE <= INCREASE0;
					END IF;
				WHEN INCREASE0 => 
					IF (counter0 = 2) THEN
						ORN_sc_dina <= ORN_sc_amp;
						ORN_sc_wea <= "1";
						counter0 <= (OTHERS => '0');
						MAIN_STATE <= READ0;
					ELSE
						counter0 <= counter0 + 1;
					END IF;
				WHEN DECREASE0 =>
				    fifo_rd_en <= '0';
					IF (ORN_sc_addra = ORN_sc_addra_MAX) THEN
						ORN_sc_addra <= (OTHERS => '0');
						ORN_sc_sum <= ORN_sc_sum_temp;
						MAIN_STATE <= READY;
					ELSE
						counter0 <= (OTHERS => '0');
						MAIN_STATE <= DECREASE1;
					END IF; 
				WHEN DECREASE1 => 
					IF (counter0 = 2) THEN
						ORN_sc_decay <= ("000" & ORN_sc_douta(17 DOWNTO 3)) + ("0000" & ORN_sc_douta(17 DOWNTO 4)) + ("000000" & ORN_sc_douta(17 DOWNTO 6));
						ORN_sc_sum_temp <= ORN_sc_sum_temp + ORN_sc_douta;
                        counter0 <= counter0 + 1;
					ELSIF (counter0 = 3) THEN
					    ORN_sc_wea <= "1";
						ORN_sc_dina <= ORN_sc_douta - ORN_sc_decay;
						counter0 <= counter0 + 1;
					ELSIF (counter0 = 4) THEN
					    ORN_sc_wea <= "0";
						ORN_sc_addra <= ORN_sc_addra + 1;
						counter0 <= (OTHERS => '0');
						MAIN_STATE <= DECREASE0;
					ELSE
						counter0 <= counter0 + 1;
					END IF; 
				WHEN OTHERS => 
					MAIN_STATE <= READY;
			END CASE;
		END IF;
	END PROCESS;

	uart_rxd_ctrl_0 : uart_rxd_ctrl
	PORT MAP(
		clk => CLK, 
		uart_rxd => UART_RXD, 
		received_data => received_data, 
		received_done => received_done
	);

    fifo_rxd_0 : fifo_rxd
	PORT MAP(
		CLK => CLK, 
		din => fifo_din, 
		wr_en => fifo_wr_en, 
		rd_en => fifo_rd_en, 
		dout => fifo_dout, 
		full => fifo_full, 
		empty => fifo_empty, 
		data_count => fifo_data_count
	);

END Behavioral;