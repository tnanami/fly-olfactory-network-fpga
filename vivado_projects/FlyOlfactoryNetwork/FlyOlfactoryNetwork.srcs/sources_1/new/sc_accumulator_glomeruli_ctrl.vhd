LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY sc_accumulator_glomeruli_ctrl IS
	PORT (
		clk : IN STD_LOGIC;
		triger : IN STD_LOGIC;
		ORN_sc_addrb : INOUT STD_LOGIC_VECTOR(11 DOWNTO 0);
		ORN_sc_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		LNPN_sc_addrb : INOUT STD_LOGIC_VECTOR(8 DOWNTO 0);
		LNPN_sc_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		LNPN_I_exci_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
		LNPN_I_exci_addra : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
		LNPN_I_exci_dina : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
		LNPN_I_inhi_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
		LNPN_I_inhi_addra : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
		LNPN_I_inhi_dina : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
	);
END sc_accumulator_glomeruli_ctrl;

ARCHITECTURE Behavioral OF sc_accumulator_glomeruli_ctrl IS

	COMPONENT sc_accumulator_glomeruli_0 IS
		PORT (
			clk : IN STD_LOGIC;
			triger : IN STD_LOGIC;
			ORN_sc_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			LNPN_sc_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			sc_sum : INOUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			sc_sum_inhi : INOUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			add_ctrl : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			weight_glomeruli_douta : IN STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
			LNPN_sc_addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
			I_addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT blk_mem_weight_glomeruli_0 IS
		PORT (
			clka : IN STD_LOGIC;
			addra : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
			douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT blk_mem_weight_glomeruli_1 IS
		PORT (
			clka : IN STD_LOGIC;
			addra : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
			douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT blk_mem_weight_glomeruli_2 IS
		PORT (
			clka : IN STD_LOGIC;
			addra : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
			douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT blk_mem_weight_glomeruli_3 IS
		PORT (
			clka : IN STD_LOGIC;
			addra : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
			douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT blk_mem_weight_glomeruli_4 IS
		PORT (
			clka : IN STD_LOGIC;
			addra : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
			douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT blk_mem_weight_glomeruli_5 IS
		PORT (
			clka : IN STD_LOGIC;
			addra : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
			douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT blk_mem_weight_glomeruli_6 IS
		PORT (
			clka : IN STD_LOGIC;
			addra : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
			douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL weight_glomeruli_addra : STD_LOGIC_VECTOR(16 DOWNTO 0) := (OTHERS => '0');
	SIGNAL weight_glomeruli_douta_0 : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
	SIGNAL weight_glomeruli_douta_1 : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
	SIGNAL weight_glomeruli_douta_2 : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
	SIGNAL weight_glomeruli_douta_3 : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
	SIGNAL weight_glomeruli_douta_4 : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
	SIGNAL weight_glomeruli_douta_5 : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
	SIGNAL weight_glomeruli_douta_6 : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
	SIGNAL weight_glomeruli_douta_7 : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
	SIGNAL weight_glomeruli_douta_8 : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
	SIGNAL weight_glomeruli_douta_9 : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";

	TYPE STATE_TYPE IS (READY, HANDLING0, ACCUM_ORN0, ACCUM_LNPN0, ACCUM_APL0, INSERTING0, INSERT_LNPN_I1, INSERT_LNPN_I2, INSERT_LNPN_I3, INSERT_LNPN_I4, INSERT_LNPN_I5, INSERT_LNPN_I6, INSERT_LNPN_I7, INSERT_LNPN_I8, INSERT_LNPN_I9, INSERT_LNPN_I10, INSERT_LNPN_I11, INSERT_LNPN_I12, INSERT_LNPN_I13, INSERT_LNPN_I14);
	SIGNAL STATE : STATE_TYPE := READY;
	CONSTANT ORN_sc_addra_MAX : natural := 1780;
	CONSTANT LNPN_sc_addra_MAX : natural := 312;
	CONSTANT LN3_sc_addra_MAX : natural := 191;
	SIGNAL COUNTER0 : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
	SIGNAL COUNTER1 : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
	SIGNAL sc_sum : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');

	CONSTANT LNPN_I_addra_temp : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
	SIGNAL add_ctrl : STD_LOGIC_VECTOR(1 DOWNTO 0) :=  (OTHERS => '0');
	SIGNAL sc_sum_0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL sc_sum_1 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL sc_sum_2 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL sc_sum_3 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL sc_sum_4 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL sc_sum_5 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL sc_sum_6 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL sc_sum_inhi_0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL sc_sum_inhi_1 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL sc_sum_inhi_2 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL sc_sum_inhi_3 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL sc_sum_inhi_4 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL sc_sum_inhi_5 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL sc_sum_inhi_6 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL I_addra0 : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
	SIGNAL I_addra1 : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
	SIGNAL I_addra2 : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
	SIGNAL I_addra3 : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
	SIGNAL I_addra4 : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
	SIGNAL I_addra5 : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
	SIGNAL I_addra6 : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');

BEGIN
    I_addra0 <= COUNTER1;
    I_addra1 <= COUNTER1 + 45;
    I_addra2 <= COUNTER1 + 90;
    I_addra3 <= COUNTER1 + 135;
    I_addra4 <= COUNTER1 + 180;
    I_addra5 <= COUNTER1 + 225;
    I_addra6 <= COUNTER1 + 270;
   
	sc_accumulator_glomeruli_0_0 : sc_accumulator_glomeruli_0
	PORT MAP(
		clk => clk, 
		triger => triger, 
		ORN_sc_doutb => ORN_sc_doutb, 
		LNPN_sc_doutb => LNPN_sc_doutb, 
		sc_sum => sc_sum_0, 
		sc_sum_inhi => sc_sum_inhi_0, 
		add_ctrl => add_ctrl, 
		weight_glomeruli_douta => weight_glomeruli_douta_0,
		LNPN_sc_addrb => LNPN_sc_addrb,
		I_addra => I_addra0
	);
	sc_accumulator_glomeruli_0_1 : sc_accumulator_glomeruli_0
	PORT MAP(
		clk => clk, 
		triger => triger, 
		ORN_sc_doutb => ORN_sc_doutb, 
		LNPN_sc_doutb => LNPN_sc_doutb, 
		sc_sum => sc_sum_1, 
	    sc_sum_inhi => sc_sum_inhi_1, 
		add_ctrl => add_ctrl, 
		weight_glomeruli_douta => weight_glomeruli_douta_1,
		LNPN_sc_addrb => LNPN_sc_addrb,
		I_addra => I_addra1
	);
	sc_accumulator_glomeruli_0_2 : sc_accumulator_glomeruli_0
	PORT MAP(
		clk => clk, 
		triger => triger, 
		ORN_sc_doutb => ORN_sc_doutb, 
		LNPN_sc_doutb => LNPN_sc_doutb, 
		sc_sum => sc_sum_2, 
		sc_sum_inhi => sc_sum_inhi_2, 
		add_ctrl => add_ctrl, 
		weight_glomeruli_douta => weight_glomeruli_douta_2,
		LNPN_sc_addrb => LNPN_sc_addrb,
		I_addra => I_addra2
	);
	sc_accumulator_glomeruli_0_3 : sc_accumulator_glomeruli_0
	PORT MAP(
		clk => clk, 
		triger => triger, 
		ORN_sc_doutb => ORN_sc_doutb, 
		LNPN_sc_doutb => LNPN_sc_doutb, 
		sc_sum => sc_sum_3, 
		sc_sum_inhi => sc_sum_inhi_3, 
		add_ctrl => add_ctrl, 
		weight_glomeruli_douta => weight_glomeruli_douta_3,
		LNPN_sc_addrb => LNPN_sc_addrb,
		I_addra => I_addra3
	);
	sc_accumulator_glomeruli_0_4 : sc_accumulator_glomeruli_0
	PORT MAP(
		clk => clk, 
		triger => triger, 
		ORN_sc_doutb => ORN_sc_doutb, 
		LNPN_sc_doutb => LNPN_sc_doutb, 
	    sc_sum => sc_sum_4, 
		sc_sum_inhi => sc_sum_inhi_4, 
		add_ctrl => add_ctrl, 
		weight_glomeruli_douta => weight_glomeruli_douta_4,
		LNPN_sc_addrb => LNPN_sc_addrb,
		I_addra => I_addra4
	);
	sc_accumulator_glomeruli_0_5 : sc_accumulator_glomeruli_0
	PORT MAP(
		clk => clk, 
		triger => triger, 
		ORN_sc_doutb => ORN_sc_doutb, 
	    LNPN_sc_doutb => LNPN_sc_doutb, 
		sc_sum => sc_sum_5, 
		sc_sum_inhi => sc_sum_inhi_5, 
		add_ctrl => add_ctrl, 
		weight_glomeruli_douta => weight_glomeruli_douta_5,
		LNPN_sc_addrb => LNPN_sc_addrb,
		I_addra => I_addra5
	);
    sc_accumulator_glomeruli_0_6 : sc_accumulator_glomeruli_0
	PORT MAP(
		clk => clk, 
		triger => triger, 
		ORN_sc_doutb => ORN_sc_doutb, 
	    LNPN_sc_doutb => LNPN_sc_doutb, 
		sc_sum => sc_sum_6, 
		sc_sum_inhi => sc_sum_inhi_6, 
		add_ctrl => add_ctrl, 
		weight_glomeruli_douta => weight_glomeruli_douta_6,
		LNPN_sc_addrb => LNPN_sc_addrb,
		I_addra => I_addra6
	);

	
	blk_mem_weight_glomeruli_0_0 : blk_mem_weight_glomeruli_0
	PORT MAP(
		clka => clk, 
		addra => weight_glomeruli_addra, 
		douta => weight_glomeruli_douta_0
	);
	blk_mem_weight_glomeruli_1_0 : blk_mem_weight_glomeruli_1
	PORT MAP(
		clka => clk, 
		addra => weight_glomeruli_addra, 
		douta => weight_glomeruli_douta_1
	);
	blk_mem_weight_glomeruli_2_0 : blk_mem_weight_glomeruli_2
	PORT MAP(
		clka => clk, 
		addra => weight_glomeruli_addra, 
		douta => weight_glomeruli_douta_2
	);
	blk_mem_weight_glomeruli_3_0 : blk_mem_weight_glomeruli_3
	PORT MAP(
		clka => clk, 
		addra => weight_glomeruli_addra, 
		douta => weight_glomeruli_douta_3
	);
	blk_mem_weight_glomeruli_4_0 : blk_mem_weight_glomeruli_4
	PORT MAP(
		clka => clk, 
		addra => weight_glomeruli_addra, 
		douta => weight_glomeruli_douta_4
	);
	blk_mem_weight_glomeruli_5_0 : blk_mem_weight_glomeruli_5
	PORT MAP(
		clka => clk, 
		addra => weight_glomeruli_addra, 
		douta => weight_glomeruli_douta_5
	);
	blk_mem_weight_glomeruli_6_0 : blk_mem_weight_glomeruli_6
	PORT MAP(
		clka => clk, 
		addra => weight_glomeruli_addra, 
		douta => weight_glomeruli_douta_6
	);

	
	sc_accumulator_ctrl : PROCESS (clk)
	BEGIN
		IF (rising_edge(clk)) THEN
			CASE STATE IS
				WHEN READY => 
					ORN_sc_addrb <= (OTHERS => '0');
					LNPN_sc_addrb <= (OTHERS => '0');
					COUNTER0 <= (OTHERS => '0');
					COUNTER1 <= (OTHERS => '0');
					weight_glomeruli_addra <= (OTHERS => '0');
					add_ctrl <= "00";
					IF (triger = '1') THEN
						STATE <= HANDLING0;
					END IF;
				WHEN HANDLING0 => 
					IF (COUNTER1 = 45) THEN
						STATE <= READY;
					ELSE
						add_ctrl <= "00";
						STATE <= ACCUM_ORN0;
					END IF;
				WHEN ACCUM_ORN0 => 
					IF (COUNTER0 = 0) THEN
						ORN_sc_addrb <= ORN_sc_addrb + 1;
						weight_glomeruli_addra <= weight_glomeruli_addra + 1;
						COUNTER0 <= COUNTER0 + 1;
					ELSIF (COUNTER0 = 1) THEN
						add_ctrl <= "01";
						ORN_sc_addrb <= ORN_sc_addrb + 1;
						weight_glomeruli_addra <= weight_glomeruli_addra + 1;
						COUNTER0 <= COUNTER0 + 1;
					ELSIF (COUNTER0 < ORN_sc_addra_MAX - 1) THEN
						ORN_sc_addrb <= ORN_sc_addrb + 1;
						weight_glomeruli_addra <= weight_glomeruli_addra + 1;
						COUNTER0 <= COUNTER0 + 1;
					ELSIF (COUNTER0 = ORN_sc_addra_MAX - 1) THEN 
						add_ctrl <= "11";
						COUNTER0 <= COUNTER0 + 1;
					ELSE
						COUNTER0 <= (OTHERS => '0');
						weight_glomeruli_addra <= weight_glomeruli_addra + 1;
						STATE <= ACCUM_LNPN0;
					END IF;
				WHEN ACCUM_LNPN0 => 
					IF (COUNTER0 = 0) THEN
						LNPN_sc_addrb <= LNPN_sc_addrb + 1;
						weight_glomeruli_addra <= weight_glomeruli_addra + 1;
						COUNTER0 <= COUNTER0 + 1;
					ELSIF (COUNTER0 = 1) THEN
						add_ctrl <= "10";
						LNPN_sc_addrb <= LNPN_sc_addrb + 1;
						weight_glomeruli_addra <= weight_glomeruli_addra + 1;
						COUNTER0 <= COUNTER0 + 1;
					ELSIF (COUNTER0 < LNPN_sc_addra_MAX - 1) THEN
						LNPN_sc_addrb <= LNPN_sc_addrb + 1;
						weight_glomeruli_addra <= weight_glomeruli_addra + 1;
						COUNTER0 <= COUNTER0 + 1;
					ELSIF (COUNTER0 = LNPN_sc_addra_MAX - 1) THEN
						add_ctrl <= "11";
						COUNTER0 <= COUNTER0 + 1;
					ELSE
						COUNTER0 <= (OTHERS => '0');
						STATE <= INSERTING0;
					END IF;
				WHEN INSERTING0 => 
					IF (COUNTER0 = 0) THEN
						LNPN_I_exci_addra <= COUNTER1;
					    LNPN_I_exci_dina <= sc_sum_0;
						LNPN_I_exci_wea <= "1";
						LNPN_I_inhi_addra <= COUNTER1;
						LNPN_I_inhi_dina <= sc_sum_inhi_0;
					    LNPN_I_inhi_wea <= "1";
						COUNTER0 <= COUNTER0 + 1;
					ELSIF (COUNTER0 = 1) THEN
						LNPN_I_exci_addra <= COUNTER1 + 45;
						LNPN_I_exci_dina <= sc_sum_1;
					    LNPN_I_exci_wea <= "1";
						LNPN_I_inhi_addra <= COUNTER1 + 45;
						LNPN_I_inhi_dina <= sc_sum_inhi_1;
						LNPN_I_inhi_wea <= "1";
						COUNTER0 <= COUNTER0 + 1;
					ELSIF (COUNTER0 = 2) THEN
						LNPN_I_exci_addra <= COUNTER1 + 90;
						LNPN_I_exci_dina <= sc_sum_2;
						LNPN_I_exci_wea <= "1";
						LNPN_I_inhi_addra <= COUNTER1 + 90;
						LNPN_I_inhi_dina <= sc_sum_inhi_2;
						LNPN_I_inhi_wea <= "1";
						COUNTER0 <= COUNTER0 + 1;
					ELSIF (COUNTER0 = 3) THEN
						LNPN_I_exci_addra <= COUNTER1 + 135;
						LNPN_I_exci_dina <= sc_sum_3;
						LNPN_I_exci_wea <= "1";
						LNPN_I_inhi_addra <= COUNTER1 + 135;
						LNPN_I_inhi_dina <= sc_sum_inhi_3;
						LNPN_I_inhi_wea <= "1";
						COUNTER0 <= COUNTER0 + 1;
					ELSIF (COUNTER0 = 4) THEN
						LNPN_I_exci_addra <= COUNTER1 + 180;
						LNPN_I_exci_dina <= sc_sum_4;
						LNPN_I_exci_wea <= "1";
						LNPN_I_inhi_addra <= COUNTER1 + 180;
						LNPN_I_inhi_dina <= sc_sum_inhi_4;
						LNPN_I_inhi_wea <= "1";
						COUNTER0 <= COUNTER0 + 1;
					ELSIF (COUNTER0 = 5) THEN
					    LNPN_I_exci_addra <= COUNTER1 + 225;
					    LNPN_I_exci_dina <= sc_sum_5;
						LNPN_I_exci_wea <= "1";
						LNPN_I_inhi_addra <= COUNTER1 + 225;
						LNPN_I_inhi_dina <= sc_sum_inhi_5 ;
						LNPN_I_inhi_wea <= "1";
						COUNTER0 <= COUNTER0 + 1;
					ELSIF (COUNTER0 = 6) THEN
					    LNPN_I_exci_addra <= COUNTER1 + 270;
					    LNPN_I_exci_dina <= sc_sum_6;
						LNPN_I_exci_wea <= "1";
						LNPN_I_inhi_addra <= COUNTER1 + 270;
						LNPN_I_inhi_dina <= sc_sum_inhi_6 ;
						LNPN_I_inhi_wea <= "1";
						COUNTER0 <= COUNTER0 + 1;
					ELSE
						weight_glomeruli_addra <= weight_glomeruli_addra + 1;
						LNPN_I_exci_wea <= "0";
						LNPN_I_inhi_wea <= "0";
						COUNTER1 <= COUNTER1 + 1;
						COUNTER0 <= (OTHERS => '0');
						ORN_sc_addrb <= (OTHERS => '0');
						LNPN_sc_addrb <= (OTHERS => '0');
						STATE <= HANDLING0;
					END IF; 
				WHEN OTHERS => 
					STATE <= READY;
			END CASE;
		END IF;
	END PROCESS;

END Behavioral;