LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY GPIO_demo IS
    GENERIC (
        UART_BYTE_SIZE : INTEGER := 7;
        UART_COUPLED_BYTE_SIZE : INTEGER := 15
    );
    PORT (
        BTN : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        CLK : IN STD_LOGIC;
        LED : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
        uart_txd_in : IN STD_LOGIC;
        UART_TXD : OUT STD_LOGIC;
        RGB0_Red : OUT STD_LOGIC;
        RGB0_Green : OUT STD_LOGIC;
        RGB0_Blue : OUT STD_LOGIC
    );
END GPIO_demo;

ARCHITECTURE Behavioral OF GPIO_demo IS

    COMPONENT UART_RX_CTRL
        PORT (
            UART_RX : IN STD_LOGIC;
            CLK : IN STD_LOGIC;
            DATA : OUT STD_LOGIC_VECTOR (UART_BYTE_SIZE DOWNTO 0);
            READ_DATA : OUT STD_LOGIC := '0';
            READY_O : OUT STD_LOGIC;
            READ_DONE_I : IN STD_LOGIC
        );
    END COMPONENT;
  
    COMPONENT UART_TX
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
    END COMPONENT;

    COMPONENT clk_wiz_0
        PORT (
            clk_in1 : IN STD_LOGIC;
            clk_out1 : OUT STD_LOGIC;
            reset : IN STD_LOGIC
        );
    END COMPONENT;

    COMPONENT clk1k_generator
        PORT (
            clk_in : IN STD_LOGIC;
            clk_out : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT clk1_generator
        PORT (
            clk_in : IN STD_LOGIC;
            clk_out : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT blk_mem_ORN_ctrl IS
        PORT (
            clk100 : IN STD_LOGIC;
            clk1k : IN STD_LOGIC;
            PORT_UART_RX_FLAG : IN STD_LOGIC;
            PORT_UART_DATA_IN : IN STD_LOGIC_VECTOR(UART_BYTE_SIZE DOWNTO 0);
            PORT_UART_DATA_COUPLED : out STD_LOGIC_VECTOR(11 DOWNTO 0);
            PORT_UART_DATA_COUPLED_flag : out STD_LOGIC;
            ORN_sc_mem_web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            ORN_sc_mem_addrb : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            ORN_sc_mem_dinb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            ORN_sc_mem_doutb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            FIFO_1k_done : IN STD_LOGIC
        );
    END COMPONENT;

    COMPONENT blk_mem_gen_LNPN_sc IS
        PORT (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            clkb : IN STD_LOGIC;
            web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
            dinb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT blk_mem_PN_sc IS
        PORT (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            clkb : IN STD_LOGIC;
            web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addrb : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
            dinb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT blk_mem_gen_LNPN_I IS
        PORT (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            clkb : IN STD_LOGIC;
            web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
            dinb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT blk_mem_gen_LNPN_I_inhi IS
        PORT (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            clkb : IN STD_LOGIC;
            web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
            dinb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT sc_accumulator_glomeruli_ctrl IS
        PORT (
            clk100 : IN STD_LOGIC;
            clk1k : IN STD_LOGIC;
            PORT_mem_ORN_sc_web : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
            PORT_mem_ORN_sc_addrb : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
            PORT_mem_ORN_sc_dinb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_ORN_sc_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_LNPN_sc_web : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
            PORT_mem_LNPN_sc_addrb : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
            PORT_mem_LNPN_sc_dinb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_LNPN_sc_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_LNPN_I_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
            PORT_mem_LNPN_I_addra : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
            PORT_mem_LNPN_I_dina : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_LNPN_I_douta : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_LNPN_I_inhi_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
            PORT_mem_LNPN_I_inhi_addra : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
            PORT_mem_LNPN_I_inhi_dina : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_LNPN_I_inhi_douta : IN STD_LOGIC_VECTOR(17 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT dssn_ctrl is
        PORT (
            clk100 : IN STD_LOGIC;
            clk1k : IN STD_LOGIC;
            clk1 : IN STD_LOGIC;
            PORT_mem_LNPN_I_addrb : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
            PORT_mem_LNPN_I_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_LNPN_I_inhi_addrb : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
            PORT_mem_LNPN_I_inhi_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_LNPN_sc_addra : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
            PORT_mem_LNPN_sc_dina : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_LNPN_sc_douta : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_LNPN_sc_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);        
            PORT_mem_KC_I_addrb : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
            PORT_mem_KC_I_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_KC_sc_addra : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
            PORT_mem_KC_sc_dina : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_KC_sc_douta : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_KC_sc_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
            PORT_mem_KC_sr_addra : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
            PORT_mem_KC_sr_dina : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_KC_sr_douta : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_KC_sr_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
            PORT_mem_APL_I : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_APL_sc : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_MBON0_I : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_MBON0_sc : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_MBON1_I : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_MBON1_sc : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_CREPINE_I : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_CREPINE_sc : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_dssn_glomeruli_id : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
            PORT_dssn_glomeruli_wr_en : OUT STD_LOGIC;
            PORT_mem_PN_sc_addra : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
            PORT_mem_PN_sc_dina : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_mem_PN_sc_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
            PORT_UART_DATA_COUPLED : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            PORT_UART_RX_PACKET_COUPLE_DONE : IN  STD_LOGIC;
            PORT_LN0_for_measuring : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_LN1_for_measuring : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_LN2_for_measuring : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_LN3_for_measuring : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_PN_for_measuring : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_KC_for_measuring : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_MBON_for_measuring : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_APL_for_measuring : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            PORT_CREPINE_for_measuring : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
    );
    end COMPONENT;
    
    COMPONENT blk_mem_KC_I IS
        PORT (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            clkb : IN STD_LOGIC;
            web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addrb : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            dinb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT blk_mem_KC_sc IS
        PORT (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            clkb : IN STD_LOGIC;
            web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addrb : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            dinb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT blk_mem_KC_sr IS
        PORT (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            clkb : IN STD_LOGIC;
            web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addrb : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            dinb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
        );
    END COMPONENT;
        
    COMPONENT sc_accumlator_PNKC IS
        PORT(
    clk100 : IN STD_LOGIC;
    clk1k : IN STD_LOGIC;
    PORT_mem_PN_sc_addrb : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    PORT_mem_PN_sc_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    PORT_mem_KC_I_addra : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    PORT_mem_KC_I_dina : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    PORT_mem_KC_I_wea : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    PORT_mem_APL_I1 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT sc_accumlator_KC_APLMBON IS
    PORT(
    clk100 : IN STD_LOGIC;
    clk1k : IN STD_LOGIC;
    PORT_mem_KC_sc_addrb : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    PORT_mem_KC_sc_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    PORT_mem_APL_I : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    PORT_mem_MBON0_I : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    PORT_mem_MBON1_I : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    PORT_mem_weight_KC_APLMBONa3_addra : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    PORT_mem_weight_KC_APLMBONa3_douta : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    PORT_mem_weight_KC_MBONa1_addra : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    PORT_mem_weight_KC_MBONa1_douta : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
    );
    END COMPONENT;
    
    COMPONENT dssn_test IS
        PORT (
            clk100 : IN STD_LOGIC;
            clk1k : IN STD_LOGIC
        );
    END COMPONENT;
    
    COMPONENT blk_mem_gen_weight_KC_APLMBONa3 IS
        PORT (        
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT blk_mem_gen_weight_KC_MBONa1 IS
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
    
    COMPONENT stdp_ctrl IS
        PORT(
    clk100 : IN STD_LOGIC;
    clk1k : IN STD_LOGIC;
    PORT_UART_DATA_COUPLED : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    PORT_UART_RX_PACKET_COUPLE_DONE : IN  STD_LOGIC;
    PORT_KC_sr_addrb : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    PORT_KC_sr_doutb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    PORT_mem_weight_KC_MBONa1_web : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    PORT_mem_weight_KC_MBONa1_addrb : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
    PORT_mem_weight_KC_MBONa1_dinb : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    PORT_mem_weight_KC_MBONa1_doutb : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
        );
    END COMPONENT;
    
    SIGNAL uart_read_data_flag : STD_LOGIC := '0';
    SIGNAL UART_DATA : STD_LOGIC_VECTOR(UART_BYTE_SIZE DOWNTO 0);
    SIGNAL UART_DATA_COUPLED : STD_LOGIC_VECTOR(11 DOWNTO 0);
    SIGNAL DATA_TEST0 : STD_LOGIC_VECTOR(UART_BYTE_SIZE DOWNTO 0) := "11011001";
    SIGNAL clk100 : STD_LOGIC;
    SIGNAL clk1k : STD_LOGIC;
    SIGNAL clk1 : STD_LOGIC;
    SIGNAL clkRst : STD_LOGIC;
    SIGNAL UART_TX_READY : STD_LOGIC := '0';
    SIGNAL UART_RX_RR : STD_LOGIC := '0';
    SIGNAL UART_RX_READ_DONE : STD_LOGIC := '0';
    SIGNAL UART_TX_SEND_DONE : STD_LOGIC := '0';
    SIGNAL UART_RX_PACKET_COUPLE_DONE : STD_LOGIC := '0';
    SIGNAL BLK_MEM_ORN_CTRL_DONE : STD_LOGIC := '0';
    SIGNAL UART_DATA_STORED : STD_LOGIC_VECTOR(UART_BYTE_SIZE DOWNTO 0);
    SIGNAL ORN_sc_mem_web : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL ORN_sc_mem_addrb : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL ORN_sc_mem_dinb : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL ORN_sc_mem_doutb : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL FIFO_1k_done : STD_LOGIC := '0';

    SIGNAL LNPN_sc_mem_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL LNPN_sc_mem_addra : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_sc_mem_dina : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_sc_mem_douta : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_sc_mem_web : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL LNPN_sc_mem_addrb : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_sc_mem_dinb : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_sc_mem_doutb : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');

    SIGNAL LNPN_I_mem_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL LNPN_I_mem_addra : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_mem_dina : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_mem_douta : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_mem_web : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL LNPN_I_mem_addrb : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_mem_dinb : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_mem_doutb : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    
    SIGNAL LNPN_I_inhi_mem_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL LNPN_I_inhi_mem_addra : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_inhi_mem_dina : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_inhi_mem_douta : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_inhi_mem_web : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL LNPN_I_inhi_mem_addrb : STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_inhi_mem_dinb : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LNPN_I_inhi_mem_doutb : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');

    SIGNAL PN_sc_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL PN_sc_addra : STD_LOGIC_VECTOR(6 DOWNTO 0) := (OTHERS => '0');
    SIGNAL PN_sc_dina : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL PN_sc_douta : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL PN_sc_web : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL PN_sc_addrb : STD_LOGIC_VECTOR(6 DOWNTO 0) := (OTHERS => '0');
    SIGNAL PN_sc_dinb : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL PN_sc_doutb : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');

    SIGNAL KC_I_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL KC_I_addra : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_I_dina : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_I_douta : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_I_web : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL KC_I_addrb : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_I_dinb : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_I_doutb : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sc_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL KC_sc_addra : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sc_dina : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sc_douta : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sc_web : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL KC_sc_addrb : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sc_dinb : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sc_doutb : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sr_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL KC_sr_addra : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sr_dina : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sr_douta : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sr_web : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL KC_sr_addrb : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sr_dinb : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL KC_sr_doutb : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
        
    SIGNAL mem_APL_I : STD_LOGIC_VECTOR(17 DOWNTO 0):= (OTHERS => '0');
    SIGNAL mem_MBON0_I : STD_LOGIC_VECTOR(17 DOWNTO 0):= (OTHERS => '0');
    SIGNAL mem_MBON1_I : STD_LOGIC_VECTOR(17 DOWNTO 0):= (OTHERS => '0');
    SIGNAL mem_CREPINE_I : STD_LOGIC_VECTOR(17 DOWNTO 0):= (OTHERS => '0');    
    SIGNAL mem_APL_sc : STD_LOGIC_VECTOR(17 DOWNTO 0):= (OTHERS => '0');
    SIGNAL mem_MBON0_sc : STD_LOGIC_VECTOR(17 DOWNTO 0):= (OTHERS => '0');
    SIGNAL mem_MBON1_sc : STD_LOGIC_VECTOR(17 DOWNTO 0):= (OTHERS => '0');
    SIGNAL mem_CREPINE_sc : STD_LOGIC_VECTOR(17 DOWNTO 0):= (OTHERS => '0');
                
    SIGNAL dssn_glomeruli_id : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
    SIGNAL dssn_glomeruli_wr_en : STD_LOGIC;
    SIGNAL dssn_id : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL dssn_id_send : STD_LOGIC;
    SIGNAL dssn_id_end : STD_LOGIC;
    SIGNAL LN0_for_measuring : STD_LOGIC_VECTOR(17 DOWNTO 0);
    SIGNAL LN1_for_measuring : STD_LOGIC_VECTOR(17 DOWNTO 0);
    SIGNAL LN2_for_measuring : STD_LOGIC_VECTOR(17 DOWNTO 0);
    SIGNAL LN3_for_measuring : STD_LOGIC_VECTOR(17 DOWNTO 0);
    SIGNAL PN_for_measuring : STD_LOGIC_VECTOR(17 DOWNTO 0);
    SIGNAL KC_for_measuring : STD_LOGIC_VECTOR(17 DOWNTO 0);
    SIGNAL MBON_for_measuring : STD_LOGIC_VECTOR(17 DOWNTO 0);
    SIGNAL APL_for_measuring : STD_LOGIC_VECTOR(17 DOWNTO 0);
    SIGNAL CREPINE_for_measuring : STD_LOGIC_VECTOR(17 DOWNTO 0);
    SIGNAL start_dssn_fifo_sending : STD_LOGIC;
    SIGNAL mem_weight_KC_APLMBONa3_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL mem_weight_KC_APLMBONa3_addra : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
    SIGNAL mem_weight_KC_APLMBONa3_dina : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL mem_weight_KC_APLMBONa3_douta : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL mem_weight_KC_APLMBONa3_web : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL mem_weight_KC_APLMBONa3_addrb : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
    SIGNAL mem_weight_KC_APLMBONa3_dinb : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL mem_weight_KC_APLMBONa3_doutb : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    
    SIGNAL mem_weight_KC_MBONa1_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL mem_weight_KC_MBONa1_addra : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL mem_weight_KC_MBONa1_dina : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
    SIGNAL mem_weight_KC_MBONa1_douta : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
    SIGNAL mem_weight_KC_MBONa1_web : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL mem_weight_KC_MBONa1_addrb : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL mem_weight_KC_MBONa1_dinb : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
    SIGNAL mem_weight_KC_MBONa1_doutb : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
 
    SIGNAL mem_APL_I0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');   
    SIGNAL mem_APL_I1 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');

    SIGNAL v : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL ZERO18 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');


BEGIN
    
    --mem_CREPINE_I <= mem_MBON0_sc(17 downto 1)&"0" - (mem_MBON1_sc(17 downto 1)&"0");
    mem_CREPINE_I <= ""&mem_MBON0_sc(17 downto 0)&"" - (""&mem_MBON1_sc(17 downto 0)&"");
    mem_APL_I <= (mem_APL_I1(15 downto 0)&"00") + mem_APL_I1;

    inst_clk : clk_wiz_0
    PORT MAP(
        clk_in1 => CLK,
        clk_out1 => CLK100,
        reset => clkRst
    );

    clk1k_generator_0 : clk1k_generator
    PORT MAP(
        clk_in => CLK100,
        clk_out => clk1k
    );

    clk1_generator_0 : clk1_generator
    PORT MAP(
        clk_in => CLK100,
        clk_out => clk1
    );

    Inst_UART_RX_CTRL : UART_RX_CTRL PORT MAP(
        DATA => UART_DATA,
        READ_DATA => uart_read_data_flag,
        CLK => CLK100,
        UART_RX => uart_txd_in,
        READY_O => UART_RX_RR,
        READ_DONE_I => '1'--UART_RX_READ_DONE
    );
    
     UART_TX_0 : UART_TX PORT MAP(
            clk100 => clk100,
            clk1k => clk1k,
            UART_TX => UART_TXD,
            PORT_dssn_glomeruli_id => dssn_glomeruli_id,
            PORT_dssn_glomeruli_wr_en => dssn_glomeruli_wr_en,
            PORT_LN0_for_measuring => LN0_for_measuring,
            PORT_LN1_for_measuring => LN1_for_measuring,
            PORT_LN2_for_measuring => LN2_for_measuring,
            PORT_LN3_for_measuring => LN3_for_measuring,
            PORT_PN_for_measuring => PN_for_measuring,
            PORT_KC_for_measuring => KC_for_measuring,
            PORT_MBON_for_measuring => MBON_for_measuring,
            PORT_APL_for_measuring => APL_for_measuring,
            PORT_CREPINE_for_measuring => CREPINE_for_measuring
    );  
  
        
    blk_mem_ORN_ctrl_0 : blk_mem_ORN_ctrl PORT MAP(
        clk100 => clk100,
        clk1k => clk1k,
        PORT_UART_RX_FLAG => UART_RX_RR,--UART_RX_PACKET_COUPLE_DONE,
        PORT_UART_DATA_IN => UART_DATA,--_COUPLED(10 DOWNTO 0),
        PORT_UART_DATA_COUPLED => UART_DATA_COUPLED,
        PORT_UART_DATA_COUPLED_flag => UART_RX_PACKET_COUPLE_DONE,
        ORN_sc_mem_web => ORN_sc_mem_web,
        ORN_sc_mem_addrb => ORN_sc_mem_addrb,
        ORN_sc_mem_dinb => ORN_sc_mem_dinb,
        ORN_sc_mem_doutb => ORN_sc_mem_doutb,
        FIFO_1k_done => FIFO_1k_done
    );
    
    dssn_ctrl_0 : dssn_ctrl PORT MAP(
        clk100 => clk100,
        clk1k => clk1k,
        clk1 => clk1,
        PORT_mem_LNPN_I_addrb => LNPN_I_mem_addrb,
        PORT_mem_LNPN_I_doutb => LNPN_I_mem_doutb,
        PORT_mem_LNPN_I_inhi_addrb => LNPN_I_inhi_mem_addrb,
        PORT_mem_LNPN_I_inhi_doutb => LNPN_I_inhi_mem_doutb,
        PORT_mem_LNPN_sc_addra => LNPN_sc_mem_addra,
        PORT_mem_LNPN_sc_dina => LNPN_sc_mem_dina,
        PORT_mem_LNPN_sc_douta => LNPN_sc_mem_douta,
        PORT_mem_LNPN_sc_wea => LNPN_sc_mem_wea,
        PORT_mem_KC_I_addrb => KC_I_addrb,
        PORT_mem_KC_I_doutb => KC_I_doutb,
        PORT_mem_KC_sc_addra => KC_sc_addra,
        PORT_mem_KC_sc_dina => KC_sc_dina,
        PORT_mem_KC_sc_douta => KC_sc_douta,
        PORT_mem_KC_sc_wea => kC_sc_wea,        
        PORT_mem_KC_sr_addra => KC_sr_addra,
        PORT_mem_KC_sr_dina => KC_sr_dina,
        PORT_mem_KC_sr_douta => KC_sr_douta,
        PORT_mem_KC_sr_wea => kC_sr_wea,
        PORT_mem_APL_I => mem_APL_I,
        PORT_mem_APL_sc => mem_APL_sc,
        PORT_mem_MBON0_I => mem_MBON0_I,
        PORT_mem_MBON0_sc => mem_MBON0_sc,
        PORT_mem_MBON1_I => mem_MBON1_I,
        PORT_mem_MBON1_sc => mem_MBON1_sc,
        PORT_mem_CREPINE_I => mem_CREPINE_I,
        PORT_mem_CREPINE_sc => mem_CREPINE_sc,
        PORT_dssn_glomeruli_id => dssn_glomeruli_id,
        PORT_dssn_glomeruli_wr_en => dssn_glomeruli_wr_en,
        PORT_mem_PN_sc_addra => PN_sc_addra,
        PORT_mem_PN_sc_dina =>PN_sc_dina,
        PORT_mem_PN_sc_wea => PN_sc_wea,
        PORT_UART_DATA_COUPLED => UART_DATA_COUPLED,
        PORT_UART_RX_PACKET_COUPLE_DONE => UART_RX_PACKET_COUPLE_DONE,
           PORT_LN0_for_measuring => LN0_for_measuring,
         PORT_LN1_for_measuring => LN1_for_measuring,
         PORT_LN2_for_measuring => LN2_for_measuring,
         PORT_LN3_for_measuring => LN3_for_measuring,
         PORT_PN_for_measuring => PN_for_measuring,
         PORT_KC_for_measuring => KC_for_measuring,
         PORT_MBON_for_measuring => MBON_for_measuring,
         PORT_APL_for_measuring => APL_for_measuring,
         PORT_CREPINE_for_measuring => CREPINE_for_measuring
    );


END Behavioral;