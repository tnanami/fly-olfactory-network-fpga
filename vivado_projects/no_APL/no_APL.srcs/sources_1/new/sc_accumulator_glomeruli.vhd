LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY sc_accumulator_glomeruli_0 IS
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
END sc_accumulator_glomeruli_0;

ARCHITECTURE Behavioral OF sc_accumulator_glomeruli_0 IS

BEGIN

    sc_accumulator : PROCESS (clk)
    BEGIN
        IF (rising_edge(clk)) THEN
            IF(add_ctrl="00")THEN
                sc_sum<=(OTHERS => '0');
                sc_sum_inhi<=(OTHERS => '0');
            ELSIF(add_ctrl="01")THEN
                IF(weight_glomeruli_douta="1")THEN
                    IF(I_addra < 191)THEN -- to LNs
                        sc_sum<=sc_sum+("00000000" & ORN_sc_doutb(17 downto 8))+("000000000" & ORN_sc_doutb(17 downto 9));
                    ELSE -- to PNs
                        sc_sum<=sc_sum+("000" & ORN_sc_doutb(17 downto 3));
                    END IF;
                END IF;
            ELSIF(add_ctrl="10")THEN
                IF(weight_glomeruli_douta="1")THEN
                    IF(I_addra < 191)THEN -- to LNs
                        IF(LNPN_sc_addrb < 191+2)THEN
                            sc_sum_inhi<=sc_sum_inhi+("00000000" & LNPN_sc_doutb(17 downto 8)); 
                        ELSE
                            sc_sum<=sc_sum+("" & LNPN_sc_doutb(17 downto 0)&"");
                        END IF;
                    ELSE --to PN
                        IF(LNPN_sc_addrb < 191+2)THEN 
                            sc_sum_inhi<=sc_sum_inhi+("000000" & LNPN_sc_doutb(17 downto 6));
                        ELSE
                            sc_sum<=sc_sum+("000" & LNPN_sc_doutb(17 downto 3)&"");
                        END IF;
                    END IF;         
                END IF;
            END iF;
        END IF;
    END PROCESS;

END Behavioral;