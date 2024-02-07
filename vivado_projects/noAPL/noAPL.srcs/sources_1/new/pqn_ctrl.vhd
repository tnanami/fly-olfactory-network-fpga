LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY pqn_ctrl IS
    GENERIC (
        PQN_BIT_WIDTH : INTEGER := 18
    );
	PORT (
		clk : IN STD_LOGIC;
		triger : IN STD_LOGIC;
		triger2 : IN STD_LOGIC;
		command_signal : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		command_signal_flag : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		LNPN_I_exci_addrb : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
		LNPN_I_exci_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		LNPN_I_inhi_addrb : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
		LNPN_I_inhi_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		LNPN_sc_addra : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
		LNPN_sc_dina : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
		LNPN_sc_douta : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		LNPN_sc_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0); 
	    PN_sc_addra : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		PN_sc_dina : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
		PN_sc_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0); 
		KC_I_addrb : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		KC_I_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		KC_sc_addra : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		KC_sc_dina : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
		KC_sc_douta : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		KC_sc_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
		KC_sr_addra : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		KC_sr_dina : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
		KC_sr_douta : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		KC_sr_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        APL_I0 : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        APL_I1 : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        MBON0_I : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        MBON1_I : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        fifo_txd_din : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
	    fifo_txd_wr_en : OUT STD_LOGIC := '0';
	    fifo_txd_data_count : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        TXD_DATA0 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA1 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA2 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA3 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA4 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA5 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA6 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA7 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA8 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA9 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA10 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        TXD_DATA11 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0)
	);
END pqn_ctrl;

ARCHITECTURE Behavioral OF pqn_ctrl IS

	COMPONENT PQN_Krasavietz_class1 IS
		PORT (
			clk : IN STD_LOGIC;
			PORT_Iin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_vin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_nin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_qin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_sin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_uin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_fcin : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			PORT_vout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_nout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_qout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_sout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_uout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_fcout : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
			PORT_spike_flag : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT PQN_Krasavietz_class2 IS
		PORT (
			clk : IN STD_LOGIC;
			PORT_Iin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_vin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_nin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_qin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_sin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_uin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_fcin : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			PORT_vout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_nout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_qout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_sout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_uout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_fcout : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
			PORT_spike_flag : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT PQN_NP1227_class1 IS
		PORT (
			clk : IN STD_LOGIC;
			PORT_Iin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_vin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_nin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_qin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_sin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_uin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_fcin : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			PORT_vout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_nout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_qout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_sout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_uout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_fcout : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
			PORT_spike_flag : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT PQN_NP2426_class1 IS
		PORT (
			clk : IN STD_LOGIC;
			PORT_Iin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_vin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_nin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_qin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_sin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_uin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_fcin : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			PORT_vout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_nout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_qout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_sout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_uout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_fcout : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
			PORT_spike_flag : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT PQN_PN IS
		PORT (
			clk : IN STD_LOGIC;
			PORT_Iin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_vin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_nin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_qin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_sin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_uin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_fcin : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			PORT_vout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_nout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_qout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_sout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_uout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_fcout : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
			PORT_spike_flag : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT PQN_KC IS
		PORT (
			clk : IN STD_LOGIC;
			PORT_Iin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_vin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_nin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_qin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_sin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_uin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_fcin : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			PORT_vout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_nout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_qout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_sout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_uout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_fcout : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
			PORT_spike_flag : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT PQN_APL IS
		PORT (
			clk : IN STD_LOGIC;
			PORT_Iin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_vin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_nin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_qin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_sin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_uin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_fcin : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			PORT_vout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_nout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_qout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_sout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_uout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_fcout : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
			PORT_spike_flag : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT PQN_MBON IS
		PORT (
			clk : IN STD_LOGIC;
			PORT_Iin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_vin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_nin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_qin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_sin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_uin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_fcin : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			PORT_vout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_nout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_qout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_sout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_uout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_fcout : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
			PORT_spike_flag : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT PQN_ON IS
		PORT (
			clk : IN STD_LOGIC;
			PORT_Iin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_vin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_nin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_qin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_sin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_uin : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_fcin : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			PORT_vout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_nout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_qout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_sout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_uout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
			PORT_fcout : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
			PORT_spike_flag : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
		);
	END COMPONENT;
 
	COMPONENT blk_mem_v IS
		PORT (
			clka : IN STD_LOGIC;
			wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
			addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			dina : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT blk_mem_n IS
		PORT (
			clka : IN STD_LOGIC;
			wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
			addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			dina : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT blk_mem_q IS
		PORT (
			clka : IN STD_LOGIC;
			wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
			addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			dina : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT blk_mem_u IS
		PORT (
			clka : IN STD_LOGIC;
			wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
			addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
			dina : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT blk_mem_fc IS
		PORT (
			clka : IN STD_LOGIC;
			wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
			addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
			dina : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			douta : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
		);
	END COMPONENT;
		
	TYPE STATE_TYPE IS (STANDBY,READY, UPDATE);
	SIGNAL STATE : STATE_TYPE := STANDBY;
	
    CONSTANT addra_LN0_MAX : NATURAL := 48; 
    CONSTANT addra_LN1_MAX : NATURAL  := 96;
	CONSTANT addra_LN2_MAX : NATURAL := 144;
	CONSTANT addra_LN3_MAX : NATURAL := 191;
	CONSTANT addra_PN_MAX : NATURAL := 312;
	CONSTANT addra_KC_MAX : NATURAL := 2231;
	CONSTANT addra_APL_MAX : NATURAL := 2232;
	CONSTANT addra_MBON0_MAX : NATURAL := 2233;
	CONSTANT addra_MBON1_MAX : NATURAL := 2234;
	CONSTANT addra_ON_MAX : NATURAL := 2235;
	CONSTANT ORN_addra_MAX : NATURAL := 1780;
	SIGNAL KC_sr_const : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000111110100000";-- 4000 
	
	SIGNAL addra : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
	SIGNAL Istim : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL APL_sc : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL MBON0_sc : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL MBON1_sc : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL ON_sc : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL addra_PN : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
    SIGNAL addra_KC : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
    SIGNAL counter0 : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL PQN_spike_flag : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PN_sc_addra_temp : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
    SIGNAL counter_homeostasis : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0'); 
    CONSTANT counter_homeostasis_max : NATURAL := 999;
    SIGNAL homeostasis_flag0 : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0"; 
    SIGNAL homeostasis_flag1 : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0"; 
    SIGNAL LN0_s_sum : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LN1_s_sum : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LN2_s_sum : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LN3_s_sum : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL PN_s_sum : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_s_sum : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL PN_u_sum : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');

	SIGNAL mem_v_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
	SIGNAL mem_v_addra : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
	SIGNAL mem_v_dina : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL mem_v_douta : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL mem_n_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
	SIGNAL mem_n_addra : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
	SIGNAL mem_n_dina : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL mem_n_douta : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL mem_q_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
	SIGNAL mem_q_addra : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
	SIGNAL mem_q_dina : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL mem_q_douta : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL mem_u_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
	SIGNAL mem_u_addra : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
	SIGNAL mem_u_dina : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL mem_u_douta : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL mem_fc_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
	SIGNAL mem_fc_addra : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
	SIGNAL mem_fc_dina : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	SIGNAL mem_fc_douta : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	 
	SIGNAL PQN_Krasavietz_class1_Iin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class1_vin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class1_nin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class1_qin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class1_sin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class1_uin : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000010000000000";
	SIGNAL PQN_Krasavietz_class1_fcin : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class1_vout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class1_nout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class1_qout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class1_sout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class1_uout : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000010000000000";
	SIGNAL PQN_Krasavietz_class1_fcout : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class1_spike_flag : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0'); 
	SIGNAL PQN_Krasavietz_class2_Iin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class2_vin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class2_nin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class2_qin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class2_sin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class2_uin : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000010000000000";
	SIGNAL PQN_Krasavietz_class2_fcin : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class2_vout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class2_nout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class2_qout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class2_sout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class2_uout : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000010000000000";
	SIGNAL PQN_Krasavietz_class2_fcout : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_Krasavietz_class2_spike_flag : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP1227_class1_Iin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP1227_class1_vin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP1227_class1_nin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP1227_class1_qin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP1227_class1_sin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP1227_class1_uin : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000010000000000";
	SIGNAL PQN_NP1227_class1_fcin : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP1227_class1_vout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP1227_class1_nout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP1227_class1_qout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP1227_class1_sout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP1227_class1_uout : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000010000000000";
	SIGNAL PQN_NP1227_class1_fcout : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP1227_class1_spike_flag : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP2426_class1_Iin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP2426_class1_vin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP2426_class1_nin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP2426_class1_qin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP2426_class1_sin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP2426_class1_uin : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000010000000000";
	SIGNAL PQN_NP2426_class1_fcin : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP2426_class1_vout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP2426_class1_nout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP2426_class1_qout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP2426_class1_sout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP2426_class1_uout : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000010000000000";
	SIGNAL PQN_NP2426_class1_fcout : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_NP2426_class1_spike_flag : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0'); 
	SIGNAL PQN_PN_Iin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_PN_vin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_PN_nin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_PN_qin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_PN_sin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_PN_uin : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000010000000000";
	SIGNAL PQN_PN_fcin : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_PN_vout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_PN_nout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_PN_qout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_PN_sout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_PN_uout : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000010000000000";
	SIGNAL PQN_PN_fcout : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_PN_spike_flag : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_KC_Iin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_KC_vin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_KC_nin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_KC_qin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_KC_sin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_KC_uin : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000010000000000";
	SIGNAL PQN_KC_fcin : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_KC_vout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_KC_nout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_KC_qout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_KC_sout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_KC_uout : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000010000000000";
	SIGNAL PQN_KC_fcout : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_KC_spike_flag : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_APL_Iin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_APL_vin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_APL_nin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_APL_qin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_APL_sin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_APL_uin : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000010000000000";
	SIGNAL PQN_APL_fcin : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_APL_vout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_APL_nout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_APL_qout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_APL_sout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_APL_uout : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000010000000000";
	SIGNAL PQN_APL_fcout : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_APL_spike_flag : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_MBON_Iin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_MBON_vin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_MBON_nin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_MBON_qin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_MBON_sin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_MBON_uin : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000010000000000";
	SIGNAL PQN_MBON_fcin : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_MBON_vout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_MBON_nout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_MBON_qout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_MBON_sout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_MBON_uout : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000010000000000";
	SIGNAL PQN_MBON_fcout : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_MBON_spike_flag : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_ON_Iin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_ON_vin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_ON_nin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_ON_qin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_ON_sin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_ON_uin : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000010000000000";
	SIGNAL PQN_ON_fcin : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_ON_vout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_ON_nout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_ON_qout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_ON_sout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_ON_uout : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000010000000000";
	SIGNAL PQN_ON_fcout : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	SIGNAL PQN_ON_spike_flag : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
	SIGNAL LN0_inact_flag : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
	SIGNAL LN1_inact_flag : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
	SIGNAL LN2_inact_flag : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
	SIGNAL LN3_inact_flag : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');

	SIGNAL t0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL t1 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL t2 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL t3 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL t4 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL t5 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL t6 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL t7 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL t8 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	SIGNAL t9 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
	
BEGIN 

	Port_controller : PROCESS (clk)
	BEGIN
		IF (rising_edge(clk)) THEN
  		    IF (addra < addra_LN3_MAX) THEN
	            Istim <= ("" & LNPN_I_exci_doutb(17 DOWNTO 0)&"")+("0" & LNPN_I_exci_doutb(17 DOWNTO 1)&"") - (""&LNPN_I_inhi_doutb(17 DOWNTO 0)&"");
		    ELSIF (addra < addra_PN_MAX) THEN
                Istim <= ("" & LNPN_I_exci_doutb(17 DOWNTO 0)&"") - ("00"&LNPN_I_inhi_doutb(17 DOWNTO 2)&"") -("00000"&LNPN_I_inhi_doutb(17 DOWNTO 5)&"")-("000000"&LNPN_I_inhi_doutb(17 DOWNTO 6)&"");
		    ELSIF (addra < addra_KC_MAX) THEN
			    Istim <= ("" & KC_I_doutb(17 DOWNTO 0)&"")+ ("00000" & KC_I_doutb(17 DOWNTO 5)&"") - ("000000"&APL_sc(17 DOWNTO 6));
			ELSIF (addra < addra_APL_MAX) THEN
				Istim <= ("0000" & APL_I0(17 DOWNTO 4) & "") + ("0000" & APL_I1(17 DOWNTO 4) & "");
			ELSIF (addra < addra_MBON0_MAX) THEN
                Istim <= ("00" & MBON0_I(17 DOWNTO 2)&"")+("0000" & MBON0_I(17 DOWNTO 4)&"") - (""&APL_sc(17 DOWNTO 0)&"");
            ELSIF (addra < addra_MBON1_MAX) THEN
	            Istim <= ("0" & MBON1_I(17 DOWNTO 1)&"")+("0000" & MBON1_I(17 DOWNTO 4)&"")  - (""&APL_sc(17 DOWNTO 0)&"");
            ELSE
				Istim <= ("00"&MBON0_sc(17 downto 2)&"")-("00000"&MBON0_sc(17 downto 5)&"")-("00"&MBON1_sc(17 downto 2)&"")+("0000"&MBON1_sc(17 downto 4)&"");
            END IF;
			mem_v_addra <= addra;
			mem_n_addra <= addra;
			mem_q_addra <= addra;
			IF (addra < addra_PN_MAX) THEN
				LNPN_I_exci_addrb <= addra(8 DOWNTO 0);
				LNPN_I_inhi_addrb <= addra(8 DOWNTO 0);
				LNPN_sc_addra <= addra(8 DOWNTO 0);
				mem_u_addra <= addra(8 DOWNTO 0);
				mem_fc_addra <= addra(8 DOWNTO 0);
			END IF;
			IF (addra >= addra_LN3_MAX AND addra < addra_PN_MAX) THEN
			    addra_PN <= addra - addra_LN3_MAX;
            END IF;
			IF (addra >= addra_PN_MAX AND addra < addra_KC_MAX) THEN
				addra_KC <= addra - addra_PN_MAX;

			END IF;
		END IF;
	END PROCESS;
    PN_sc_addra <= addra_PN(6 downto 0);
    KC_I_addrb <= addra_KC(10 DOWNTO 0);
	KC_sc_addra <= addra_KC(10 DOWNTO 0);
    KC_sr_addra <= addra_KC(10 DOWNTO 0);
    
    homeostasis_flag0_ctrl : PROCESS (CLK)
    BEGIN
        IF (rising_edge(CLK)) THEN
            IF(command_signal_flag="1" and command_signal=3)THEN
                homeostasis_flag0 <= "1";
            ELSIF(command_signal_flag="1" and command_signal=4)THEN
                homeostasis_flag0 <= "0";
            END IF;
        END IF;
    END PROCESS;

    homeostasis_flag1_ctrl : PROCESS (CLK)
    BEGIN
        IF (rising_edge(CLK)) THEN
            IF(triger='1' and  homeostasis_flag0="1")THEN
                IF(counter_homeostasis<counter_homeostasis_max)THEN
                    homeostasis_flag1 <= "0";
                    counter_homeostasis <= counter_homeostasis + 1;
                ELSE
                    homeostasis_flag1 <= "1";
                    counter_homeostasis <= (OTHERS => '0');
                END IF;
            END IF;
        END IF;
    END PROCESS;
    
    LNonoff_ctrl : PROCESS (CLK)
    BEGIN
        IF (rising_edge(CLK)) THEN
            IF(command_signal_flag="1" and command_signal=5)THEN
                IF(LN0_inact_flag="0")THEN
                    LN0_inact_flag <= "1";
                ELSE
                    LN0_inact_flag <= "0";
                END IF;
            END IF;
            IF(command_signal_flag="1" and command_signal=6)THEN
                IF(LN1_inact_flag="0")THEN
                    LN1_inact_flag <= "1";
                ELSE
                    LN1_inact_flag <= "0";
                END IF;
            END IF;
            IF(command_signal_flag="1" and command_signal=7)THEN
                IF(LN2_inact_flag="0")THEN
                    LN2_inact_flag <= "1";
                ELSE
                    LN2_inact_flag <= "0";
                END IF;
            END IF;
            IF(command_signal_flag="1" and command_signal=8)THEN
                IF(LN3_inact_flag="0")THEN
                    LN3_inact_flag <= "1";
                ELSE
                    LN3_inact_flag <= "0";
                END IF;
            END IF;
        END IF;
    END PROCESS;
    
	PQN_updater : PROCESS (clk)
	BEGIN
		IF (rising_edge(clk)) THEN
			CASE STATE IS
			    WHEN STANDBY => 
			        IF(command_signal_flag="1" and command_signal=9)THEN
			            STATE <= READY;
			        END IF;
				WHEN READY => 
					IF (triger = '1') THEN
						STATE <= UPDATE;
						counter0 <=  (OTHERS => '0');
						addra <=  (OTHERS => '0');
					    LN0_s_sum <= (OTHERS => '0');
                        LN1_s_sum <= (OTHERS => '0');
                        LN2_s_sum <= (OTHERS => '0');
                        LN3_s_sum <= (OTHERS => '0');
                        PN_s_sum <= (OTHERS => '0');
                        KC_s_sum <= (OTHERS => '0');
                        PN_u_sum <= (OTHERS => '0');
                        t0 <= (OTHERS => '0');
                        t1 <= (OTHERS => '0');
                        t2 <= (OTHERS => '0');
                        t3 <= (OTHERS => '0');
                        t4 <= (OTHERS => '0');
                        t5 <= (OTHERS => '0');
                        t6 <= (OTHERS => '0');
                        t7 <= (OTHERS => '0');
                        t8 <= (OTHERS => '0');
                        t9 <= (OTHERS => '0');
				    END IF;
				WHEN UPDATE => 
					IF (addra < addra_ON_MAX) THEN
						IF (counter0 < "0100") THEN
							counter0 <= counter0 + 1;
						ELSIF (counter0 = "0100") THEN
							IF (addra < addra_LN0_MAX) THEN    
							    IF(LN0_inact_flag="1")THEN
								    PQN_Krasavietz_class1_Iin <= (OTHERS => '0');
								ELSE
								    PQN_Krasavietz_class1_Iin <= Istim;
								END IF;
								PQN_Krasavietz_class1_vin <= mem_v_douta;
								PQN_Krasavietz_class1_nin <= mem_n_douta;
								PQN_Krasavietz_class1_qin <= mem_q_douta;
								PQN_Krasavietz_class1_sin <= LNPN_sc_douta;
							ELSIF (addra < addra_LN1_MAX) THEN
							    IF(LN1_inact_flag="1")THEN
								    PQN_Krasavietz_class2_Iin <= (OTHERS => '0');
								ELSE
								    PQN_Krasavietz_class2_Iin <= Istim;
								END IF;
								PQN_Krasavietz_class2_vin <= mem_v_douta;
								PQN_Krasavietz_class2_nin <= mem_n_douta;
								PQN_Krasavietz_class2_qin <= mem_q_douta;
								PQN_Krasavietz_class2_sin <= LNPN_sc_douta;
							ELSIF (addra < addra_LN2_MAX) THEN
							    IF(LN2_inact_flag="1")THEN
								    PQN_NP1227_class1_Iin <= (OTHERS => '0');
								ELSE
								    PQN_NP1227_class1_Iin <= Istim;
								END IF;
								PQN_NP1227_class1_vin <= mem_v_douta;
								PQN_NP1227_class1_nin <= mem_n_douta;
								PQN_NP1227_class1_qin <= mem_q_douta;
								PQN_NP1227_class1_sin <= LNPN_sc_douta;
							ELSIF (addra < addra_LN3_MAX) THEN
							    IF(LN3_inact_flag="1")THEN
								    PQN_NP2426_class1_Iin <= (OTHERS => '0');
								ELSE
								    PQN_NP2426_class1_Iin <= Istim;
								END IF;
								PQN_NP2426_class1_vin <= mem_v_douta;
								PQN_NP2426_class1_nin <= mem_n_douta;
								PQN_NP2426_class1_qin <= mem_q_douta;
								PQN_NP2426_class1_sin <= LNPN_sc_douta;
							ELSIF (addra < addra_PN_MAX) THEN
								PQN_PN_Iin <= Istim;
								PQN_PN_vin <= mem_v_douta;
								PQN_PN_nin <= mem_n_douta;
								PQN_PN_qin <= mem_q_douta;
								PQN_PN_uin <= mem_u_douta;
								PQN_PN_fcin <= mem_fc_douta;
								PQN_PN_sin <= LNPN_sc_douta;
							ELSIF (addra < addra_KC_MAX) THEN
								PQN_KC_Iin <= Istim;
								PQN_KC_vin <= mem_v_douta;
								PQN_KC_nin <= mem_n_douta;
								PQN_KC_qin <= mem_q_douta;
								PQN_KC_sin <= KC_sc_douta;
								IF(KC_sr_douta > 0)THEN
                                    KC_sr_dina <= KC_sr_douta - 1;
                                    KC_sr_wea <= "1";
                                END IF;
							ELSIF (addra < addra_APL_MAX) THEN
							    --PQN_APL_Iin <= Istim; 
                                PQN_APL_Iin <= (OTHERS => '0'); -- for no APL
								PQN_APL_vin <= mem_v_douta;
								PQN_APL_nin <= mem_n_douta;
								PQN_APL_qin <= mem_q_douta;
								PQN_APL_sin <= APL_sc;
							ELSIF (addra < addra_MBON0_MAX) THEN
								PQN_MBON_Iin <= Istim;
								PQN_MBON_vin <= mem_v_douta;
								PQN_MBON_nin <= mem_n_douta;
								PQN_MBON_qin <= mem_q_douta;
								PQN_MBON_sin <= MBON0_sc;
							ELSIF (addra < addra_MBON1_MAX) THEN
								PQN_MBON_Iin <= Istim;
								PQN_MBON_vin <= mem_v_douta;
								PQN_MBON_nin <= mem_n_douta;
								PQN_MBON_qin <= mem_q_douta;
								PQN_MBON_sin <= MBON1_sc;
							ELSE 
								PQN_ON_Iin <= Istim;
								PQN_ON_vin <= mem_v_douta;
								PQN_ON_nin <= mem_n_douta;
								PQN_ON_qin <= mem_q_douta;
								PQN_ON_sin <= ON_sc;
							END IF;
							counter0 <= counter0 + 1;
						ELSIF (counter0 < "1101") THEN
							KC_sr_wea <= "0";
							counter0 <= counter0 + 1;
						ELSIF (counter0 = "1101") THEN
							mem_v_wea <= "1";
							mem_n_wea <= "1";
							mem_q_wea <= "1";
							mem_fc_wea <= "1";
							IF(homeostasis_flag0="1" and  homeostasis_flag1="1")THEN
							    mem_u_wea <= "1";
							END IF;
							IF (addra < addra_LN0_MAX) THEN
								mem_v_dina <= PQN_Krasavietz_class1_vout;
								mem_n_dina <= PQN_Krasavietz_class1_nout;
								mem_q_dina <= PQN_Krasavietz_class1_qout;
								LNPN_sc_dina <= PQN_Krasavietz_class1_sout;
								LNPN_sc_wea <= "1";
								PQN_spike_flag <= PQN_Krasavietz_class1_spike_flag;
		                        LN0_s_sum <= LN0_s_sum + ("00"&PQN_Krasavietz_class1_sout(17 downto 2));                                   
							ELSIF (addra < addra_LN1_MAX) THEN
								mem_v_dina <= PQN_Krasavietz_class2_vout;
								mem_n_dina <= PQN_Krasavietz_class2_nout;
								mem_q_dina <= PQN_Krasavietz_class2_qout;
								LNPN_sc_dina <= PQN_Krasavietz_class2_sout;
								LNPN_sc_wea <= "1";
								PQN_spike_flag <= PQN_Krasavietz_class2_spike_flag;
						        LN1_s_sum <= LN1_s_sum + ("00"&PQN_Krasavietz_class2_sout(17 downto 2));                                   
							ELSIF (addra < addra_LN2_MAX) THEN
								mem_v_dina <= PQN_NP1227_class1_vout;
								mem_n_dina <= PQN_NP1227_class1_nout;
								mem_q_dina <= PQN_NP1227_class1_qout;
								LNPN_sc_dina <= PQN_NP1227_class1_sout;
								LNPN_sc_wea <= "1";
								PQN_spike_flag <= PQN_NP1227_class1_spike_flag; 
							    LN2_s_sum <= LN2_s_sum + ("00"&PQN_NP1227_class1_sout(17 downto 2));
							ELSIF (addra < addra_LN3_MAX) THEN
								mem_v_dina <= PQN_NP2426_class1_vout;
								mem_n_dina <= PQN_NP2426_class1_nout;
								mem_q_dina <= PQN_NP2426_class1_qout;
								LNPN_sc_dina <= PQN_NP2426_class1_sout;
								LNPN_sc_wea <= "1";
								PQN_spike_flag <= PQN_NP2426_class1_spike_flag;
						        LN3_s_sum <= LN3_s_sum + ("00"&PQN_NP2426_class1_sout(17 downto 2));                                   
							ELSIF (addra < addra_PN_MAX) THEN
								mem_v_dina <= PQN_PN_vout;
								mem_n_dina <= PQN_PN_nout;
								mem_q_dina <= PQN_PN_qout;
								LNPN_sc_dina <= PQN_PN_sout;
								LNPN_sc_wea <= "1";
								PN_sc_dina <= PQN_PN_sout;
								PN_sc_wea <= "1";
								PQN_spike_flag <= PQN_PN_spike_flag; 
                                PN_s_sum <= PN_s_sum + (""&PQN_PN_sout(17 downto 0));
                                PN_u_sum <= PN_u_sum + ("000"&PQN_PN_uin(17 downto 3));
                                IF(PQN_PN_uout<"000000010000000000")THEN
                                    mem_u_dina <= PQN_PN_uout;
                                ELSE
                                    mem_u_dina <= "000000010000000000";
                                END IF;
                                IF(homeostasis_flag0="1" and  homeostasis_flag1="1")THEN
                                    mem_fc_dina <= (OTHERS => '0');
                                ELSE
                                    mem_fc_dina <= PQN_PN_fcout;
                                END IF;
							ELSIF (addra < addra_KC_MAX) THEN
								mem_v_dina <= PQN_KC_vout;
								mem_n_dina <= PQN_KC_nout;
								mem_q_dina <= PQN_KC_qout;
							    KC_sc_dina <= PQN_KC_sout;
								KC_sc_wea <= "1";
								PQN_spike_flag <= PQN_KC_spike_flag; 
								KC_s_sum <= KC_s_sum + ("0000000"&PQN_KC_sout(17 downto 7));
							ELSIF (addra < addra_APL_MAX) THEN
								mem_v_dina <= PQN_APL_vout;
								mem_n_dina <= PQN_APL_nout;
								mem_q_dina <= PQN_APL_qout;
								APL_sc <= PQN_APL_sout;
								PQN_spike_flag <= PQN_APL_spike_flag; 
							ELSIF (addra < addra_MBON0_MAX) THEN
								mem_v_dina <= PQN_MBON_vout;
								mem_n_dina <= PQN_MBON_nout;
								mem_q_dina <= PQN_MBON_qout;
								MBON0_sc <= PQN_MBON_sout;
								PQN_spike_flag <= PQN_MBON_spike_flag; 
							ELSIF (addra < addra_MBON1_MAX) THEN
								mem_v_dina <= PQN_MBON_vout;
								mem_n_dina <= PQN_MBON_nout;
								mem_q_dina <= PQN_MBON_qout;
								MBON1_sc <= PQN_MBON_sout;
								PQN_spike_flag <= PQN_MBON_spike_flag; 
							ELSIF (addra < addra_ON_MAX) THEN
								mem_v_dina <= PQN_ON_vout;
								mem_n_dina <= PQN_ON_nout;
								mem_q_dina <= PQN_ON_qout;
								ON_sc <= PQN_ON_sout;
								PQN_spike_flag <= PQN_ON_spike_flag; 
							END IF;
							counter0 <= counter0 + 1;
						ELSIF (counter0 = "1110") THEN
							mem_v_wea <= "0";
							mem_n_wea <= "0";
							mem_q_wea <= "0";
							mem_u_wea <= "0";
							mem_fc_wea <= "0";
					        LNPN_sc_wea <= "0";
                            PN_sc_wea <= "0";
							KC_sc_wea <= "0";
				            IF (PQN_spike_flag = "1" and fifo_txd_data_count<"0100000000") THEN
							    fifo_txd_din <= "000000"&addra;
							    fifo_txd_wr_en <= '1';
							END IF;
	                        IF (PQN_spike_flag = "1") THEN
							    KC_sr_dina <= KC_sr_const;
                                KC_sr_wea <= "1";
							END IF;
							IF(addra=addra_LN0_MAX-1)THEN
							    TXD_DATA0 <= LN0_s_sum;
							ELSIF(addra=addra_LN1_MAX-1)THEN
							    TXD_DATA1 <= LN1_s_sum;
							ELSIF(addra=addra_LN2_MAX-1)THEN
							    TXD_DATA2 <= LN2_s_sum;
							ELSIF(addra=addra_LN3_MAX-1)THEN
							    TXD_DATA3 <= LN3_s_sum;
							ELSIF(addra=addra_PN_MAX-1)THEN
							    TXD_DATA4 <= PN_s_sum;
							    TXD_DATA11 <= PN_u_sum;
							ELSIF(addra=addra_KC_MAX-1)THEN
						        TXD_DATA5 <= KC_s_sum;
							ELSIF(addra=addra_APL_MAX-1)THEN
							    TXD_DATA6 <=  PQN_APL_sout;
							    TXD_DATA10 <= PQN_APL_vout;
							ELSIF(addra=addra_MBON0_MAX-1)THEN
							    TXD_DATA7 <= mem_q_dina;
							ELSIF(addra=addra_MBON1_MAX-1)THEN
							    TXD_DATA8 <= mem_q_dina;
							ELSIF(addra=addra_ON_MAX-1)THEN
							    TXD_DATA9 <= mem_v_dina;
							END IF;
							counter0 <= counter0 + 1;
						ELSE
							addra <= addra + 1;
							fifo_txd_wr_en <= '0';
							KC_sr_wea <= "0";
							counter0 <=  (OTHERS => '0');
						END IF;
					ELSE
						STATE <= READY;
					END IF; 
				WHEN OTHERS => 
					STATE <= READY;
			END CASE;
		END IF;
	END PROCESS;
 
	PQN_Krasavietz_class1_0 : PQN_Krasavietz_class1
	PORT MAP(
		clk => clk, 
		PORT_Iin => PQN_Krasavietz_class1_Iin, 
		PORT_vin => PQN_Krasavietz_class1_vin, 
		PORT_nin => PQN_Krasavietz_class1_nin, 
		PORT_qin => PQN_Krasavietz_class1_qin, 
		PORT_sin => PQN_Krasavietz_class1_sin, 
		PORT_uin => PQN_Krasavietz_class1_uin, 
		PORT_fcin => PQN_Krasavietz_class1_fcin, 
		PORT_vout => PQN_Krasavietz_class1_vout, 
		PORT_nout => PQN_Krasavietz_class1_nout, 
		PORT_qout => PQN_Krasavietz_class1_qout, 
		PORT_sout => PQN_Krasavietz_class1_sout, 
		PORT_uout => PQN_Krasavietz_class1_uout, 
		PORT_fcout => PQN_Krasavietz_class1_fcout, 
		PORT_spike_flag => PQN_Krasavietz_class1_spike_flag
		);
		PQN_Krasavietz_class2_0 : PQN_Krasavietz_class2
		PORT MAP(
			clk => clk, 
			PORT_Iin => PQN_Krasavietz_class2_Iin, 
			PORT_vin => PQN_Krasavietz_class2_vin, 
			PORT_nin => PQN_Krasavietz_class2_nin, 
			PORT_qin => PQN_Krasavietz_class2_qin, 
			PORT_sin => PQN_Krasavietz_class2_sin, 
			PORT_uin => PQN_Krasavietz_class2_uin, 
			PORT_fcin => PQN_Krasavietz_class2_fcin, 
			PORT_vout => PQN_Krasavietz_class2_vout, 
			PORT_nout => PQN_Krasavietz_class2_nout, 
			PORT_qout => PQN_Krasavietz_class2_qout, 
			PORT_sout => PQN_Krasavietz_class2_sout, 
			PORT_uout => PQN_Krasavietz_class2_uout, 
			PORT_fcout => PQN_Krasavietz_class2_fcout, 
			PORT_spike_flag => PQN_Krasavietz_class2_spike_flag
		);
		PQN_NP1227_class1_0 : PQN_NP1227_class1
		PORT MAP(
			clk => clk, 
			PORT_Iin => PQN_NP1227_class1_Iin, 
			PORT_vin => PQN_NP1227_class1_vin, 
			PORT_nin => PQN_NP1227_class1_nin, 
			PORT_qin => PQN_NP1227_class1_qin, 
			PORT_sin => PQN_NP1227_class1_sin, 
			PORT_uin => PQN_NP1227_class1_uin, 
			PORT_fcin => PQN_NP1227_class1_fcin, 
			PORT_vout => PQN_NP1227_class1_vout, 
			PORT_nout => PQN_NP1227_class1_nout, 
			PORT_qout => PQN_NP1227_class1_qout, 
			PORT_sout => PQN_NP1227_class1_sout, 
			PORT_uout => PQN_NP1227_class1_uout, 
			PORT_fcout => PQN_NP1227_class1_fcout, 
			PORT_spike_flag => PQN_NP1227_class1_spike_flag
		);
		PQN_NP2426_class1_0 : PQN_NP2426_class1
		PORT MAP(
			clk => clk, 
			PORT_Iin => PQN_NP2426_class1_Iin, 
			PORT_vin => PQN_NP2426_class1_vin, 
			PORT_nin => PQN_NP2426_class1_nin, 
			PORT_qin => PQN_NP2426_class1_qin, 
			PORT_sin => PQN_NP2426_class1_sin, 
			PORT_uin => PQN_NP2426_class1_uin, 
			PORT_fcin => PQN_NP2426_class1_fcin, 
			PORT_vout => PQN_NP2426_class1_vout, 
			PORT_nout => PQN_NP2426_class1_nout, 
			PORT_qout => PQN_NP2426_class1_qout, 
			PORT_sout => PQN_NP2426_class1_sout, 
			PORT_uout => PQN_NP2426_class1_uout, 
			PORT_fcout => PQN_NP2426_class1_fcout, 
			PORT_spike_flag => PQN_NP2426_class1_spike_flag
		);
		PQN_PN_0 : PQN_PN
		PORT MAP(
			clk => clk, 
			PORT_Iin => PQN_PN_Iin, 
			PORT_vin => PQN_PN_vin, 
			PORT_nin => PQN_PN_nin, 
			PORT_qin => PQN_PN_qin, 
			PORT_sin => PQN_PN_sin, 
			PORT_uin => PQN_PN_uin, 
			PORT_fcin => PQN_PN_fcin, 
			PORT_vout => PQN_PN_vout, 
			PORT_nout => PQN_PN_nout, 
			PORT_qout => PQN_PN_qout, 
			PORT_sout => PQN_PN_sout, 
			PORT_uout => PQN_PN_uout, 
			PORT_fcout => PQN_PN_fcout, 
			PORT_spike_flag => PQN_PN_spike_flag
		);
		PQN_KC_0 : PQN_KC
		PORT MAP(
			clk => clk, 
			PORT_Iin => PQN_KC_Iin, 
			PORT_vin => PQN_KC_vin, 
			PORT_nin => PQN_KC_nin, 
			PORT_qin => PQN_KC_qin, 
			PORT_sin => PQN_KC_sin, 
			PORT_uin => PQN_KC_uin, 
			PORT_fcin => PQN_KC_fcin, 
			PORT_vout => PQN_KC_vout, 
			PORT_nout => PQN_KC_nout, 
			PORT_qout => PQN_KC_qout, 
			PORT_sout => PQN_KC_sout, 
			PORT_uout => PQN_KC_uout, 
			PORT_fcout => PQN_KC_fcout, 
			PORT_spike_flag => PQN_KC_spike_flag
		);
		PQN_APL_0 : PQN_APL
		PORT MAP(
			clk => clk, 
			PORT_Iin => PQN_APL_Iin, 
			PORT_vin => PQN_APL_vin, 
			PORT_nin => PQN_APL_nin, 
			PORT_qin => PQN_APL_qin, 
			PORT_sin => PQN_APL_sin, 
			PORT_uin => PQN_APL_uin, 
			PORT_fcin => PQN_APL_fcin, 
			PORT_vout => PQN_APL_vout, 
			PORT_nout => PQN_APL_nout, 
			PORT_qout => PQN_APL_qout, 
			PORT_sout => PQN_APL_sout, 
			PORT_uout => PQN_APL_uout, 
			PORT_fcout => PQN_APL_fcout, 
			PORT_spike_flag => PQN_APL_spike_flag
		);
		PQN_MBON_0 : PQN_MBON
		PORT MAP(
			clk => clk, 
			PORT_Iin => PQN_MBON_Iin, 
			PORT_vin => PQN_MBON_vin, 
			PORT_nin => PQN_MBON_nin, 
			PORT_qin => PQN_MBON_qin, 
			PORT_sin => PQN_MBON_sin, 
			PORT_uin => PQN_MBON_uin, 
			PORT_fcin => PQN_MBON_fcin, 
			PORT_vout => PQN_MBON_vout, 
			PORT_nout => PQN_MBON_nout, 
			PORT_qout => PQN_MBON_qout, 
			PORT_sout => PQN_MBON_sout, 
			PORT_uout => PQN_MBON_uout, 
			PORT_fcout => PQN_MBON_fcout, 
			PORT_spike_flag => PQN_MBON_spike_flag
		);
		PQN_ON_0 : PQN_ON
		PORT MAP(
			clk => clk, 
			PORT_Iin => PQN_ON_Iin, 
			PORT_vin => PQN_ON_vin, 
			PORT_nin => PQN_ON_nin, 
			PORT_qin => PQN_ON_qin, 
			PORT_sin => PQN_ON_sin, 
			PORT_uin => PQN_ON_uin, 
			PORT_fcin => PQN_ON_fcin, 
			PORT_vout => PQN_ON_vout, 
			PORT_nout => PQN_ON_nout, 
			PORT_qout => PQN_ON_qout, 
			PORT_sout => PQN_ON_sout, 
			PORT_uout => PQN_ON_uout, 
			PORT_fcout => PQN_ON_fcout, 
			PORT_spike_flag => PQN_ON_spike_flag
		);
		blk_mem_v_0 : blk_mem_v
		PORT MAP(
			clka => clk, 
			wea => mem_v_wea, 
			addra => mem_v_addra, 
			dina => mem_v_dina, 
			douta => mem_v_douta
		);
		blk_mem_n_0 : blk_mem_n
		PORT MAP(
			clka => clk, 
			wea => mem_n_wea, 
			addra => mem_n_addra, 
			dina => mem_n_dina, 
			douta => mem_n_douta
		);
		blk_mem_q_0 : blk_mem_q
		PORT MAP(
			clka => clk, 
			wea => mem_q_wea, 
			addra => mem_q_addra, 
			dina => mem_q_dina, 
			douta => mem_q_douta
		);
		blk_mem_u_0 : blk_mem_u
		PORT MAP(
			clka => clk, 
			wea => mem_u_wea, 
			addra => mem_u_addra, 
			dina => mem_u_dina, 
			douta => mem_u_douta
		);
		blk_mem_fc_0 : blk_mem_fc
		PORT MAP(
			clka => clk, 
			wea => mem_fc_wea, 
			addra => mem_fc_addra, 
			dina => mem_fc_dina, 
			douta => mem_fc_douta
		);
END Behavioral;