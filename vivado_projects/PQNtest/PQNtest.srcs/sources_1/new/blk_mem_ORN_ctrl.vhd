----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/11/18 19:41:13
-- Design Name: 
-- Module Name: blk_mem_ORN_ctrl - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY blk_mem_ORN_ctrl IS
    GENERIC (
        UART_BYTE_SIZE : INTEGER := 7;
        UART_COUPLED_BYTE_SIZE : INTEGER := 7--15
    );
    PORT (
        clk100 : IN STD_LOGIC;
        clk1k : IN STD_LOGIC;
        PORT_UART_RX_FLAG : IN STD_LOGIC;
        PORT_UART_DATA_IN : IN STD_LOGIC_VECTOR(UART_BYTE_SIZE DOWNTO 0);
        PORT_UART_DATA_COUPLED : out STD_LOGIC_VECTOR(11 DOWNTO 0);
        PORT_UART_DATA_COUPLED_flag : OUT  STD_LOGIC;
        ORN_sc_mem_web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        ORN_sc_mem_addrb : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        ORN_sc_mem_dinb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
        ORN_sc_mem_doutb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
        FIFO_1k_done : in  STD_LOGIC   
    );
END blk_mem_ORN_ctrl;

ARCHITECTURE Behavioral OF blk_mem_ORN_ctrl IS

    COMPONENT fifo_generator_ORN
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

    COMPONENT blk_mem_gen_ORN_ff IS
        PORT (
            clka : IN STD_LOGIC;
            ena : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
            clkb : IN STD_LOGIC;
            enb : IN STD_LOGIC;
            web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addrb : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            dinb : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT blk_mem_gen_ORN_sc IS
        PORT (
            clka : IN STD_LOGIC;
            ena : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
            clkb : IN STD_LOGIC;
            enb : IN STD_LOGIC;
            web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addrb : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            dinb : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL fifo_generator_ORN_srst : STD_LOGIC := '0';
    SIGNAL fifo_generator_ORN_din : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
    SIGNAL fifo_generator_ORN_wr_en : STD_LOGIC := '0';
    SIGNAL fifo_generator_ORN_rd_en : STD_LOGIC := '0';
    SIGNAL fifo_generator_ORN_dout : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
    SIGNAL fifo_generator_ORN_full : STD_LOGIC := '0';
    SIGNAL fifo_generator_ORN_empty : STD_LOGIC := '0';
    SIGNAL DATA_PRE : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');

    SIGNAL blk_mem_ORN_sc_ena : STD_LOGIC := '0';
    SIGNAL blk_mem_ORN_sc_wea : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL blk_mem_ORN_sc_addra : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL blk_mem_ORN_sc_dina : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL blk_mem_ORN_sc_douta : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL blk_mem_ORN_sc_enb : STD_LOGIC := '0';
    SIGNAL blk_mem_ORN_sc_web : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
    SIGNAL blk_mem_ORN_sc_addrb : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL blk_mem_ORN_sc_dinb : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL blk_mem_ORN_sc_doutb : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL blk_mem_ORN_sc_buff : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL blk_mem_ORN_sc_amp : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000001000000000";--0.5
    SIGNAL blk_mem_ORN_sc_decay : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL blk_mem_ORN_sc_addra_MAX : STD_LOGIC_VECTOR(10 DOWNTO 0) := "10101101101";
    SIGNAL ZERO18 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL ZERO11 : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
    SIGNAL COUNTER0 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
    SIGNAL COUNTER0_MAX : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1000";
    TYPE STATE_fifo_generator_ORN_write_TYPE IS (READY, WRITING0,COUPLING0);
    SIGNAL STATE_fifo_generator_ORN_write : STATE_fifo_generator_ORN_write_TYPE := READY;
    TYPE STATE_blk_mem_ORN_sc_update_TYPE IS (READY, INCREASING0, INCREASING1, INCREASING2, INCREASING3, INCREASING4, DECREASING0, DECREASING1, DECREASING2, DECREASING3, RESETTING0);
    SIGNAL STATE_blk_mem_ORN_sc_update : STATE_blk_mem_ORN_sc_update_TYPE := READY;
BEGIN

    blk_mem_ORN_sc_ena <= '1';
    blk_mem_ORN_sc_enb <= '1';
    blk_mem_ORN_sc_web <= ORN_sc_mem_web;
    blk_mem_ORN_sc_addrb <= ORN_sc_mem_addrb;
    blk_mem_ORN_sc_dinb <= ORN_sc_mem_dinb;
    ORN_sc_mem_doutb <= blk_mem_ORN_sc_doutb;

    fifo_generator_ORN_0 : fifo_generator_ORN PORT MAP(
        clk => clk100,
        srst => fifo_generator_ORN_srst,
        din => fifo_generator_ORN_din,
        wr_en => fifo_generator_ORN_wr_en,
        rd_en => fifo_generator_ORN_rd_en,
        dout => fifo_generator_ORN_dout,
        full => fifo_generator_ORN_full,
        empty => fifo_generator_ORN_empty
    );

    blk_mem_gen_ORN_sc_0 : blk_mem_gen_ORN_sc PORT MAP(
        clka => clk100,
        ena => blk_mem_ORN_sc_ena,
        wea => blk_mem_ORN_sc_wea,
        addra => blk_mem_ORN_sc_addra,
        dina => blk_mem_ORN_sc_dina,
        douta => blk_mem_ORN_sc_douta,
        clkb => clk100,
        enb => blk_mem_ORN_sc_enb,
        web => blk_mem_ORN_sc_web,
        addrb => blk_mem_ORN_sc_addrb,
        dinb => blk_mem_ORN_sc_dinb,
        doutb => blk_mem_ORN_sc_doutb
    );

    fifo_generator_ORN_write : PROCESS (CLK100)
    BEGIN
        IF (rising_edge(CLK100)) THEN
            CASE STATE_fifo_generator_ORN_write IS
                WHEN READY =>
                    IF( PORT_UART_RX_FLAG='1' and PORT_UART_DATA_IN>="01000000" and PORT_UART_DATA_IN<"10000000")THEN
                         DATA_PRE <=  PORT_UART_DATA_IN;
                         STATE_fifo_generator_ORN_write <= WRITING0;
                    ELSIF( PORT_UART_RX_FLAG='1' and PORT_UART_DATA_IN="00001010")THEN
                         fifo_generator_ORN_wr_en <= '1';
                         fifo_generator_ORN_din <= "111111111111";
                    ELSE
                         fifo_generator_ORN_wr_en <= '0';
                    END IF;
                WHEN WRITING0 =>
                    IF( PORT_UART_RX_FLAG='1' and PORT_UART_DATA_IN>="10000000")THEN
                        fifo_generator_ORN_wr_en <= '1';
                        fifo_generator_ORN_din <= DATA_PRE(5 downto 0) & PORT_UART_DATA_IN(5 downto 0);
                        PORT_UART_DATA_COUPLED <= DATA_PRE(5 downto 0) & PORT_UART_DATA_IN(5 downto 0);
                        PORT_UART_DATA_COUPLED_flag <= '1';
                        STATE_fifo_generator_ORN_write <= READY;
                    ELSIF( PORT_UART_RX_FLAG='1' and PORT_UART_DATA_IN<"10000000")THEN
                        STATE_fifo_generator_ORN_write <= READY;-- error handling
                    ELSIF( PORT_UART_RX_FLAG='1' and PORT_UART_DATA_IN="00001010")THEN
                        fifo_generator_ORN_wr_en <= '1';
                        fifo_generator_ORN_din <= "111111111111";
                        STATE_fifo_generator_ORN_write <= READY;
                    END IF;
                WHEN OTHERS =>
                    STATE_fifo_generator_ORN_write <= READY;
            END CASE;
        END IF;
    END PROCESS;

    blk_mem_ORN_sc_updater : PROCESS (CLK100)
    BEGIN
        IF (rising_edge(CLK100)) THEN
            CASE STATE_blk_mem_ORN_sc_update IS
                WHEN READY =>
                    COUNTER0 <= "0000";
                    IF (clk1k = '1') THEN
                        STATE_blk_mem_ORN_sc_update <= INCREASING0;
                    END IF;
                WHEN INCREASING0 =>
                     blk_mem_ORN_sc_wea <= "0";
                    fifo_generator_ORN_rd_en <= '1';
                    STATE_blk_mem_ORN_sc_update <= INCREASING1;
                WHEN INCREASING1 =>
                    fifo_generator_ORN_rd_en <= '0';
                    STATE_blk_mem_ORN_sc_update <= INCREASING2;
                WHEN INCREASING2 =>
                    fifo_generator_ORN_rd_en <= '0';
                    IF(fifo_generator_ORN_dout = "111111111111")THEN
                        STATE_blk_mem_ORN_sc_update <=  DECREASING0;
                         blk_mem_ORN_sc_addra <= ZERO11;
                    ELSIF(COUNTER0 = "0000")THEN
                        blk_mem_ORN_sc_addra <= fifo_generator_ORN_dout(10 downto 0);
                        COUNTER0 <= COUNTER0 + 1;
                    ELSIF(COUNTER0 = "0001")THEN
                        COUNTER0 <= COUNTER0 + 1;
                    ELSIF(COUNTER0 = "0010")THEN
                        COUNTER0 <= COUNTER0 + 1;
                    ELSIF(COUNTER0 = "0011")THEN
                        blk_mem_ORN_sc_dina <= blk_mem_ORN_sc_douta + blk_mem_ORN_sc_amp;
                        blk_mem_ORN_sc_wea <= "1";
                        COUNTER0 <= "0000";
                        STATE_blk_mem_ORN_sc_update <= INCREASING0;
                    END iF;
                WHEN DECREASING0 =>
                    IF (blk_mem_ORN_sc_addra = blk_mem_ORN_sc_addra_MAX) THEN
                        blk_mem_ORN_sc_addra <= ZERO11;
                        STATE_blk_mem_ORN_sc_update <= READY;
                    ELSE
                        STATE_blk_mem_ORN_sc_update <= DECREASING1;
                    END IF;
                WHEN DECREASING1 =>
                    IF (COUNTER0 < "0011") THEN
                        blk_mem_ORN_sc_decay<= ("000"& blk_mem_ORN_sc_douta(17 downto 3))+("0000"& blk_mem_ORN_sc_douta(17 downto 4))+("000000"& blk_mem_ORN_sc_douta(17 downto 6));
                        COUNTER0 <= COUNTER0 + 1;
                    ELSIF (COUNTER0 = "0011") THEN
                        blk_mem_ORN_sc_dina <= blk_mem_ORN_sc_douta -  blk_mem_ORN_sc_decay;
                        blk_mem_ORN_sc_wea <= "1";
                        COUNTER0 <= COUNTER0 + 1;
                    ELSE
                        blk_mem_ORN_sc_wea <= "0";
                        COUNTER0 <= "0000";
                        blk_mem_ORN_sc_addra <= blk_mem_ORN_sc_addra + 1;
                        STATE_blk_mem_ORN_sc_update <= DECREASING0;  
                    END IF;
                WHEN OTHERS =>
                    STATE_blk_mem_ORN_sc_update <= READY;
            END CASE;
        END IF;
    END PROCESS;
END Behavioral;