LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity main is
    GENERIC (
        PQN_BIT_WIDTH : INTEGER := 18
    );
    PORT (
		CLK : IN STD_LOGIC;   -- clock
		UART_RXD : IN STD_LOGIC;  -- UART receiver pin
		UART_TXD : OUT STD_LOGIC  -- UART transmitter pin
    );
end main;

architecture Behavioral of main is

    -- clock generator 
    -- generate 100 MHz clock from on-board 12MHz clock
	COMPONENT clk_generator
		PORT (
			clk_in1 : IN STD_LOGIC;
			clk_out1 : OUT STD_LOGIC
		);
	END COMPONENT;

	
    -- generate triger signal that becomes 1 every 0.1 ms
    -- generate triger2 signal that becomes 1 every 1 ms
	COMPONENT triger_generator
		PORT (
			clk : IN STD_LOGIC;
			triger : OUT STD_LOGIC;
			command_signal : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            command_signal_flag : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            rxd_start_flag : IN STD_LOGIC
		);
	END COMPONENT;
	
	-- receive ORN address (spike) and command signal and store in FIFO_RXD
	-- output command signal
	-- update ORN sc
    COMPONENT fifo_rxd_ctrl IS
        PORT (
            clk : IN STD_LOGIC;
            triger : IN STD_LOGIC;
            uart_rxd : IN STD_LOGIC;
            command_signal : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
            command_signal_flag : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
            ORN_sc_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
            ORN_sc_addra : INOUT STD_LOGIC_VECTOR(11 DOWNTO 0);
            ORN_sc_dina : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            ORN_sc_douta : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            ORN_sc_sum : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            ORN_fifo_data_count : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            rxd_start_flag : OUT STD_LOGIC
        );
    END COMPONENT;
    
    -- send signals and address of firing neurons 
    COMPONENT fifo_txd_ctrl IS
        PORT (
            clk : IN STD_LOGIC;
            triger : IN STD_LOGIC;
            uart_txd : OUT STD_LOGIC;
            fifo_txd_rd_en : OUT STD_LOGIC;
            fifo_txd_dout : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            fifo_txd_data_count : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
            txd_data0 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            txd_data1 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            txd_data2 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            txd_data3 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            txd_data4 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            txd_data5 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            txd_data6 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            txd_data7 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            txd_data8 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            txd_data9 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            txd_data10 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            txd_data11 : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0)
        );
    END COMPONENT;
    
    -- update neurons
    COMPONENT pqn_ctrl is
       PORT (
		clk : IN STD_LOGIC;
		triger : IN STD_LOGIC;
		triger2 : IN STD_LOGIC;
		command_signal : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		command_signal_flag : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		LNPN_I_exci_addrb : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
		LNPN_I_exci_doutb : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
		LNPN_I_inhi_addrb : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
		LNPN_I_inhi_doutb : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
		LNPN_sc_addra : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
		LNPN_sc_dina : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
		LNPN_sc_douta : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
		LNPN_sc_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0); 
	    PN_sc_addra : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		PN_sc_dina : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
		PN_sc_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0); 
		KC_I_addrb : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		KC_I_doutb : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
		KC_sc_addra : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		KC_sc_dina : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
		KC_sc_douta : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
		KC_sc_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
		KC_sr_addra : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		KC_sr_dina : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
		KC_sr_douta : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
		KC_sr_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
		APL_I0 : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        APL_I1 : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        MBON0_I : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        MBON1_I : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
	    fifo_txd_din : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
	    fifo_txd_wr_en : OUT STD_LOGIC := '0';
	    fifo_txd_data_count : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	    txd_data0 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        txd_data1 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        txd_data2 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        txd_data3 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        txd_data4 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        txd_data5 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        txd_data6 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        txd_data7 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        txd_data8 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        txd_data9 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        txd_data10 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        txd_data11 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0)
    );
    end COMPONENT;
    
    -- calculate synaptic currents of PNs and LNs
    COMPONENT sc_accumulator_glomeruli_ctrl IS
    	PORT (
		clk : IN STD_LOGIC;
		triger : IN STD_LOGIC;
		ORN_sc_addrb : INOUT STD_LOGIC_VECTOR(11 DOWNTO 0);
		ORN_sc_doutb : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
		LNPN_sc_addrb : INOUT STD_LOGIC_VECTOR(8 DOWNTO 0);
		LNPN_sc_doutb : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
		LNPN_I_exci_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
		LNPN_I_exci_addra : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
		LNPN_I_exci_dina : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
		LNPN_I_inhi_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
		LNPN_I_inhi_addra : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
		LNPN_I_inhi_dina : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0)
	);
	END COMPONENT;
	
	COMPONENT sc_accumulator_PNKC_ctrl IS
        PORT(
            clk : IN STD_LOGIC;
            triger : IN STD_LOGIC;
            PN_sc_addrb : INOUT STD_LOGIC_VECTOR(6 DOWNTO 0);
            PN_sc_doutb : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            KC_I_addra : INOUT STD_LOGIC_VECTOR(10 DOWNTO 0);
            KC_I_dina : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            KC_I_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
            APL_I1 : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0)
        );
    END COMPONENT;
    
    -- calculate synaptic currents of KCs, MBONs, and APL
    COMPONENT sc_accumulator_KC_APLMBON_ctrl IS
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
    END COMPONENT;
    
    -- performe STDP
    COMPONENT stdp_ctrl IS
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
    END COMPONENT;
       
    ----- block RAMs ----
    
    COMPONENT fifo_txd IS
	PORT (
        clk : IN STD_LOGIC;
        srst : IN STD_LOGIC;
        din : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        wr_en : IN STD_LOGIC;
        rd_en : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        full : OUT STD_LOGIC;
        empty : OUT STD_LOGIC;
        data_count : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
        );	
    END COMPONENT;
    
    COMPONENT blk_mem_ORN_sc IS
        PORT (
        clka : IN STD_LOGIC;
        wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        dina : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        clkb : IN STD_LOGIC;
        web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addrb : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        dinb : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
        doutb : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0)
        );
    END COMPONENT;
	
    COMPONENT blk_mem_LNPN_sc IS
        PORT (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            clkb : IN STD_LOGIC;
            web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
            dinb : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT blk_mem_PN_sc IS
        PORT (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            clkb : IN STD_LOGIC;
            web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addrb : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
            dinb : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT blk_mem_LNPN_I_exci IS
        PORT (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            clkb : IN STD_LOGIC;
            web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
            dinb : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT blk_mem_LNPN_I_inhi IS
        PORT (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            clkb : IN STD_LOGIC;
            web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
            dinb : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT blk_mem_KC_I IS
        PORT (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            clkb : IN STD_LOGIC;
            web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addrb : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            dinb : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT blk_mem_KC_sc IS
        PORT (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            clkb : IN STD_LOGIC;
            web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addrb : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            dinb : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT blk_mem_KC_sr IS
        PORT (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            clkb : IN STD_LOGIC;
            web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addrb : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            dinb : IN STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT blk_mem_weight_KC_APLMBONa3 IS
        PORT (        
            clka : IN STD_LOGIC;
            addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT blk_mem_weight_KC_MBONa1 IS
        PORT (        
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
            clkb : IN STD_LOGIC;
            web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addrb : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            dinb : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
        );
    END COMPONENT;
	 
	SIGNAL clk100MHz : STD_LOGIC;
	SIGNAL triger : STD_LOGIC := '0';
	SIGNAL triger2 : STD_LOGIC := '0';

    SIGNAL command_signal : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
    SIGNAL command_signal_flag : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
    
    SIGNAL fifo_txd_srst : STD_LOGIC := '0';
    SIGNAL fifo_txd_din : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL fifo_txd_dout : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL fifo_txd_wr_en : STD_LOGIC := '0';
	SIGNAL fifo_txd_rd_en : STD_LOGIC := '0';
	SIGNAL fifo_txd_full : STD_LOGIC := '0';
	SIGNAL fifo_txd_empty : STD_LOGIC := '0';
	SIGNAL fifo_txd_data_count : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
	SIGNAL txd_data0 : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL txd_data1 : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL txd_data2 : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL txd_data3 : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL txd_data4 : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL txd_data5 : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL txd_data6 : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL txd_data7 : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL txd_data8 : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL txd_data9 : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL txd_data10 : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL txd_data11 : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    
    SIGNAL ORN_sc_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL ORN_sc_addra : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
    SIGNAL ORN_sc_dina : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL ORN_sc_douta : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL ORN_sc_web : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL ORN_sc_addrb : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
    SIGNAL ORN_sc_dinb : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL ORN_sc_doutb : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');	
    SIGNAL ORN_fifo_data_count : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');	
    SIGNAL LNPN_sc_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL LNPN_sc_addra : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_sc_dina : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_sc_douta : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_sc_web : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL LNPN_sc_addrb : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_sc_dinb : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_sc_doutb : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_exci_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL LNPN_I_exci_addra : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_exci_dina : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_exci_douta : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_exci_web : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL LNPN_I_exci_addrb : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_exci_dinb : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_exci_doutb : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_inhi_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL LNPN_I_inhi_addra : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_inhi_dina : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_inhi_douta : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_inhi_web : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL LNPN_I_inhi_addrb : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_inhi_dinb : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_inhi_doutb : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL PN_sc_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL PN_sc_addra : STD_LOGIC_VECTOR(6 DOWNTO 0) := (OTHERS => '0');
    SIGNAL PN_sc_dina : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL PN_sc_douta : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL PN_sc_web : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL PN_sc_addrb : STD_LOGIC_VECTOR(6 DOWNTO 0) := (OTHERS => '0');
    SIGNAL PN_sc_dinb : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL PN_sc_doutb : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_I_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL KC_I_addra : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_I_dina : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_I_douta : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_I_web : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL KC_I_addrb : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_I_dinb : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_I_doutb : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sc_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL KC_sc_addra : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sc_dina : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sc_douta : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sc_web : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL KC_sc_addrb : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sc_dinb : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sc_doutb : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sr_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL KC_sr_addra : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sr_dina : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sr_douta : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sr_web : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL KC_sr_addrb : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sr_dinb : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sr_doutb : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL APL_I0 : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL APL_I1 : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL MBON0_I : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL MBON1_I : STD_LOGIC_VECTOR(PQN_BIT_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL weight_KC_APLMBONa3_addra : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
    SIGNAL weight_KC_APLMBONa3_douta : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";    
    SIGNAL weight_KC_MBONa1_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL weight_KC_MBONa1_addra : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL weight_KC_MBONa1_dina : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
    SIGNAL weight_KC_MBONa1_douta : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
    SIGNAL weight_KC_MBONa1_web : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL weight_KC_MBONa1_addrb : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL weight_KC_MBONa1_dinb : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
    SIGNAL weight_KC_MBONa1_doutb : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
    
    SIGNAL zero18 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
 	SIGNAL ORN_sc_sum : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
 	
    SIGNAL rxd_start_flag : STD_LOGIC := '0';

begin

	clk_generator_0 : clk_generator
	PORT MAP(
		clk_in1 => CLK, 
		clk_out1 => CLK100MHz
	);
 
	triger_generator_0 : triger_generator
	PORT MAP(
		clk => CLK100MHz, 
		triger => triger,
        command_signal => command_signal,
        command_signal_flag => command_signal_flag,
        rxd_start_flag => rxd_start_flag
	);
	
	fifo_rxd_ctrl_0 : fifo_rxd_ctrl PORT MAP (
        clk => CLK100MHz, 
        triger => triger, 
        uart_rxd => UART_RXD, 
        command_signal => command_signal,
        command_signal_flag => command_signal_flag,
        ORN_sc_wea => ORN_sc_wea,
        ORN_sc_addra => ORN_sc_addra,
        ORN_sc_dina => ORN_sc_dina,
        ORN_sc_douta => ORN_sc_douta,
        ORN_sc_sum =>  ORN_sc_sum,
        ORN_fifo_data_count => ORN_fifo_data_count,
        rxd_start_flag => rxd_start_flag
    );

	fifo_txd_ctrl_0 : fifo_txd_ctrl PORT MAP (
        clk => CLK100MHz, 
        triger => triger, 
        uart_txd => UART_TXD, 
        fifo_txd_rd_en => fifo_txd_rd_en,
        fifo_txd_dout => fifo_txd_dout,
        fifo_txd_data_count => fifo_txd_data_count,
        txd_data0 => txd_data0,
        txd_data1 => txd_data1,
        txd_data2 => txd_data2,
        txd_data3 => txd_data3,
        txd_data4 => txd_data4,
        txd_data5 => txd_data5,
        txd_data6 => txd_data6,
        txd_data7 => txd_data7,
        txd_data8 => txd_data8,
        txd_data9 => txd_data9,
        txd_data10 => txd_data10,
        txd_data11 => txd_data11
    );
    
    pqn_ctrl_0 : pqn_ctrl PORT MAP (
		clk => clk100MHz,
		triger => triger,
		triger2 => triger,
		command_signal => command_signal,
        command_signal_flag => command_signal_flag,
		LNPN_I_exci_addrb => LNPN_I_exci_addrb,
		LNPN_I_exci_doutb => LNPN_I_exci_doutb,
		LNPN_I_inhi_addrb => LNPN_I_inhi_addrb,
		LNPN_I_inhi_doutb => LNPN_I_inhi_doutb,
		LNPN_sc_addra => LNPN_sc_addra,
		LNPN_sc_dina => LNPN_sc_dina,
		LNPN_sc_douta => LNPN_sc_douta,
		LNPN_sc_wea => LNPN_sc_wea,
	    PN_sc_addra => PN_sc_addra,
		PN_sc_dina => PN_sc_dina,
		PN_sc_wea => PN_sc_wea,
		KC_I_addrb => KC_I_addrb,
		KC_I_doutb => KC_I_doutb,
		KC_sc_addra => KC_sc_addra,
		KC_sc_dina => KC_sc_dina,
		KC_sc_douta => KC_sc_douta,
		KC_sc_wea => KC_sc_wea,
		KC_sr_addra => KC_sr_addra,
		KC_sr_dina => KC_sr_dina,
		KC_sr_douta => KC_sr_douta,
		KC_sr_wea => KC_sr_wea,
		APL_I0 => APL_I0,
        APL_I1 => APL_I1,
        MBON0_I => MBON0_I,
        MBON1_I => MBON1_I,
        fifo_txd_din => fifo_txd_din,
	    fifo_txd_wr_en => fifo_txd_wr_en,
	    fifo_txd_data_count => fifo_txd_data_count,
        txd_data0 => txd_data0,
        txd_data1 => txd_data1,
        txd_data2 => txd_data2,
        txd_data3 => txd_data3,
        txd_data4 => txd_data4,
        txd_data5 => txd_data5,
        txd_data6 => txd_data6,
        txd_data7 => txd_data7,
        txd_data8 => txd_data8,
        txd_data9 => txd_data9,
        txd_data10 => txd_data10,
        txd_data11 => txd_data11
	);
    
    sc_accumulator_glomeruli_ctrl_0 : sc_accumulator_glomeruli_ctrl PORT MAP (
        clk => CLK100MHz, 
		triger => triger,
		ORN_sc_addrb => ORN_sc_addrb,
		ORN_sc_doutb => ORN_sc_doutb,
		LNPN_sc_addrb => LNPN_sc_addrb,
		LNPN_sc_doutb => LNPN_sc_doutb,
		LNPN_I_exci_wea => LNPN_I_exci_wea,
		LNPN_I_exci_addra => LNPN_I_exci_addra,
		LNPN_I_exci_dina => LNPN_I_exci_dina,
		LNPN_I_inhi_wea => LNPN_I_inhi_wea,
		LNPN_I_inhi_addra => LNPN_I_inhi_addra,
		LNPN_I_inhi_dina => LNPN_I_inhi_dina 
      );
      
    sc_accumulator_PNKC_ctrl_0 : sc_accumulator_PNKC_ctrl PORT MAP (
        clk => CLK100MHz, 
		triger => triger,
        PN_sc_addrb => PN_sc_addrb,
        PN_sc_doutb => PN_sc_doutb,
        KC_I_addra => KC_I_addra,
        KC_I_dina =>  KC_I_dina,
        KC_I_wea => KC_I_wea,
        APL_I1 => APL_I1
    );
        
    sc_accumulator_KC_APLMBON_ctrl_0 : sc_accumulator_KC_APLMBON_ctrl PORT MAP (
        clk => CLK100MHz, 
		triger => triger,
        KC_sc_addrb => KC_sc_addrb,
        KC_sc_doutb => KC_sc_doutb,
        APL_I0 => APL_I0,
        MBON0_I => MBON0_I, 
        MBON1_I => MBON1_I,
        weight_KC_APLMBONa3_addra => weight_KC_APLMBONa3_addra,
        weight_KC_APLMBONa3_douta => weight_KC_APLMBONa3_douta,
        weight_KC_MBONa1_addra => weight_KC_MBONa1_addra,
        weight_KC_MBONa1_douta => weight_KC_MBONa1_douta
    );
    
    stdp_ctrl_0 : stdp_ctrl PORT MAP (
        clk => clk100MHz,
        command_signal =>  command_signal,
        command_signal_flag =>  command_signal_flag,
        KC_sr_addrb => KC_sr_addrb,
        KC_sr_doutb => KC_sr_doutb,
        weight_KC_MBONa1_web => weight_KC_MBONa1_web ,
        weight_KC_MBONa1_addrb => weight_KC_MBONa1_addrb,
        weight_KC_MBONa1_dinb => weight_KC_MBONa1_dinb,
        weight_KC_MBONa1_doutb => weight_KC_MBONa1_doutb
    );
    
    fifo_txd_0 : fifo_txd PORT MAP(
		CLK => CLK100MHz, 
		srst => fifo_txd_srst,
		din => fifo_txd_din, 
		wr_en => fifo_txd_wr_en, 
		rd_en => fifo_txd_rd_en, 
		dout => fifo_txd_dout, 
		full => fifo_txd_full, 
		empty => fifo_txd_empty, 
		data_count => fifo_txd_data_count
	);

    blk_mem_ORN_sc_0 : blk_mem_ORN_sc PORT MAP(
        clka => clk100MHz,
        wea => ORN_sc_wea,
        addra => ORN_sc_addra,
        dina => ORN_sc_dina,
        douta => ORN_sc_douta,
        clkb => clk100MHz,
        web => ORN_sc_web,
        addrb => ORN_sc_addrb,
        dinb => ORN_sc_dinb,
        doutb => ORN_sc_doutb
    );
    
   blk_mem_LNPN_sc_0 : blk_mem_LNPN_sc PORT MAP(
        clka => clk100MHz,
        wea => LNPN_sc_wea,
        addra => LNPN_sc_addra,
        dina => LNPN_sc_dina,
        douta => LNPN_sc_douta,
        clkb => clk100MHz,
        web => LNPN_sc_web,
        addrb => LNPN_sc_addrb,
        dinb => LNPN_sc_dinb,
        doutb => LNPN_sc_doutb
    );

    blk_mem_LNPN_I_exci_0 : blk_mem_LNPN_I_exci PORT MAP(
        clka => clk100MHz,
        wea => LNPN_I_exci_wea,
        addra => LNPN_I_exci_addra,
        dina => LNPN_I_exci_dina,
        douta => LNPN_I_exci_douta,
        clkb => clk100MHz,
        web => LNPN_I_exci_web,
        addrb => LNPN_I_exci_addrb,
        dinb => LNPN_I_exci_dinb,
        doutb => LNPN_I_exci_doutb
    );

    blk_mem_LNPN_I_inhi_0 : blk_mem_LNPN_I_inhi PORT MAP(
        clka => clk100MHz,
        wea => LNPN_I_inhi_wea,
        addra => LNPN_I_inhi_addra,
        dina => LNPN_I_inhi_dina,
        douta => LNPN_I_inhi_douta,
        clkb => clk100MHz,
        web => LNPN_I_inhi_web,
        addrb => LNPN_I_inhi_addrb,
        dinb => LNPN_I_inhi_dinb,
        doutb => LNPN_I_inhi_doutb
    );

    blk_mem_PN_sc_0 : blk_mem_PN_sc PORT MAP(
        clka => clk100MHz,
        wea => PN_sc_wea,
        addra => PN_sc_addra,
        dina => PN_sc_dina,
        douta => PN_sc_douta,
        clkb => clk100MHz,
        web => PN_sc_web,
        addrb => PN_sc_addrb,
        dinb => PN_sc_dinb,
        doutb => PN_sc_doutb
    );
    
    blk_mem_KC_I_0 : blk_mem_KC_I PORT MAP(
        clka => clk100MHz,
        wea => KC_I_wea,
        addra => KC_I_addra,
        dina => KC_I_dina,
        douta => KC_I_douta,
        clkb => clk100MHz,
        web => KC_I_web,
        addrb => KC_I_addrb,
        dinb => KC_I_dinb,
        doutb => KC_I_doutb
    );
    
    blk_mem_KC_sc_0 : blk_mem_KC_sc PORT MAP(
        clka => clk100MHz,
        wea => KC_sc_wea,
        addra => KC_sc_addra,
        dina => KC_sc_dina,
        douta => KC_sc_douta,
        clkb => clk100MHz,
        web => KC_sc_web,
        addrb => KC_sc_addrb,
        dinb => KC_sc_dinb,
        doutb => KC_sc_doutb
    );
    
    blk_mem_KC_sr_0 : blk_mem_KC_sr PORT MAP(
        clka => clk100MHz,
        wea => KC_sr_wea,
        addra => KC_sr_addra,
        dina => KC_sr_dina,
        douta => KC_sr_douta,
        clkb => clk100MHz,
        web => KC_sr_web,
        addrb => KC_sr_addrb,
        dinb => KC_sr_dinb,
        doutb => KC_sr_doutb
    );
    
    blk_mem_weight_KC_APLMBONa3_0 : blk_mem_weight_KC_APLMBONa3 PORT MAP(
        clka => clk100MHz,
        addra => weight_KC_APLMBONa3_addra,
        douta => weight_KC_APLMBONa3_douta
    );

    blk_mem_weight_KC_MBONa1_0 : blk_mem_weight_KC_MBONa1 PORT MAP(
        clka => clk100MHz,
        wea => weight_KC_MBONa1_wea,
        addra => weight_KC_MBONa1_addra,
        dina => weight_KC_MBONa1_dina,
        douta => weight_KC_MBONa1_douta,
        clkb => clk100MHz,
        web => weight_KC_MBONa1_web,
        addrb => weight_KC_MBONa1_addrb,
        dinb => weight_KC_MBONa1_dinb,
        doutb => weight_KC_MBONa1_doutb
    );
        
end Behavioral;
