LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY triger_generator IS
	PORT (
		CLK : IN STD_LOGIC;
		TRIGER : OUT STD_LOGIC;
		command_signal : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        command_signal_flag : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        rxd_start_flag : IN STD_LOGIC
	);
END triger_generator;

ARCHITECTURE Behavioral OF triger_generator IS

	CONSTANT counter_max : NATURAL := 100000; -- 1ms
	SIGNAL counter : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');
	TYPE STATE_TYPE IS (READY, RUN);
    SIGNAL STATE : STATE_TYPE := READY;

BEGIN
	PROCESS (CLK)
	BEGIN
		IF (rising_edge(CLK)) THEN
			CASE STATE IS
                WHEN READY => 
		            IF(rxd_start_flag='1')THEN
		                STATE <= RUN;
		            END IF;
		        WHEN RUN => 
                    counter <= counter + 1;
			        IF counter = counter_max-1 THEN
		                triger <= '1';
				        counter <= (OTHERS => '0');
		            ELSE
				        triger <= '0';
			        END IF;
			END CASE;
        END IF;
	END PROCESS;

END Behavioral;