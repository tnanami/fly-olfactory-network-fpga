

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.ALL;
entity PQN_Krasavietz_class2 is
PORT(
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
end PQN_Krasavietz_class2;
architecture Behavioral of PQN_Krasavietz_class2 is
    TYPE STATE_TYPE IS (READY);
    SIGNAL STATE : STATE_TYPE := READY;
    SIGNAL I36 : STD_LOGIC_VECTOR(35 DOWNTO 0) := (OTHERS => '0');
    SIGNAL I18 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL Iin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL vin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL nin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL qin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL sin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL uin : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL fcin : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
    SIGNAL vout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL nout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL qout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL sout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL uout : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL uout0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL uout1 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL utf : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000010000000000"; --1.0
    SIGNAL vv36 : STD_LOGIC_VECTOR(35 DOWNTO 0) := (OTHERS => '0');
    SIGNAL vv : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL vq : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL vin_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL vin_b1 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL nin_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL qin_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL sin_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL uin_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL fcin_b0 : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
    SIGNAL fcin_b1 : STD_LOGIC_VECTOR(9 DOWNTO 0) := (OTHERS => '0');
    SIGNAL vout_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL nout_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL qout_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL sout_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL uout_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cov_vv_vS_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cov_vv_vL_b0: STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cov_v_vS_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cov_v_vL_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cov_n_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cov_q_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cov_Istim_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL con_vv_vS_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL con_vv_vL_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL con_v_vS_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL con_v_vL_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL con_n_b0: STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL coq_vv_vS_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL coq_vv_vL_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL coq_v_vS_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL coq_v_vL_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL coq_q_b0: STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cos_s_vS_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cos_s_vL_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cov_vv_vS : std_logic_vector(17 downto 0);
    SIGNAL cov_vv_vS_0 : std_logic_vector(26 downto 0);
    SIGNAL cov_vv_vS_1 : std_logic_vector(26 downto 0);
    SIGNAL cov_vv_vS_2 : std_logic_vector(26 downto 0);
    SIGNAL cov_vv_vS_3 : std_logic_vector(26 downto 0);
    SIGNAL cov_vv_vS_4 : std_logic_vector(26 downto 0);
    SIGNAL cov_vv_vS_5 : std_logic_vector(26 downto 0);
    SIGNAL cov_vv_vL : std_logic_vector(17 downto 0);
    SIGNAL cov_vv_vL_0 : std_logic_vector(27 downto 0);
    SIGNAL cov_vv_vL_1 : std_logic_vector(27 downto 0);
    SIGNAL cov_vv_vL_2 : std_logic_vector(27 downto 0);
    SIGNAL cov_vv_vL_3 : std_logic_vector(27 downto 0);
    SIGNAL cov_vv_vL_4 : std_logic_vector(27 downto 0);
    SIGNAL cov_vv_vL_5 : std_logic_vector(27 downto 0);
    SIGNAL cov_v_vS : std_logic_vector(17 downto 0);
    SIGNAL cov_v_vS_0 : std_logic_vector(26 downto 0);
    SIGNAL cov_v_vS_1 : std_logic_vector(26 downto 0);
    SIGNAL cov_v_vS_2 : std_logic_vector(26 downto 0);
    SIGNAL cov_v_vS_3 : std_logic_vector(26 downto 0);
    SIGNAL cov_v_vS_4 : std_logic_vector(26 downto 0);
    SIGNAL cov_v_vS_5 : std_logic_vector(26 downto 0);
    SIGNAL cov_v_vL : std_logic_vector(17 downto 0);
    SIGNAL cov_v_vL_0 : std_logic_vector(26 downto 0);
    SIGNAL cov_v_vL_1 : std_logic_vector(26 downto 0);
    SIGNAL cov_v_vL_2 : std_logic_vector(26 downto 0);
    SIGNAL cov_v_vL_3 : std_logic_vector(26 downto 0);
    SIGNAL cov_v_vL_4 : std_logic_vector(26 downto 0);
    SIGNAL cov_v_vL_5 : std_logic_vector(26 downto 0);
    SIGNAL cov_n : std_logic_vector(17 downto 0);
    SIGNAL cov_n_0 : std_logic_vector(27 downto 0);
    SIGNAL cov_n_1 : std_logic_vector(27 downto 0);
    SIGNAL cov_n_2 : std_logic_vector(27 downto 0);
    SIGNAL cov_n_3 : std_logic_vector(27 downto 0);
    SIGNAL cov_q : std_logic_vector(17 downto 0);
    SIGNAL cov_q_0 : std_logic_vector(27 downto 0);
    SIGNAL cov_q_1 : std_logic_vector(27 downto 0);
    SIGNAL cov_q_2 : std_logic_vector(27 downto 0);
    SIGNAL cov_q_3 : std_logic_vector(27 downto 0);
    SIGNAL cov_Istim : std_logic_vector(17 downto 0);
    SIGNAL cov_Istim_0 : std_logic_vector(22 downto 0);
    SIGNAL cov_Istim_1 : std_logic_vector(22 downto 0);
    SIGNAL cov_Istim_2 : std_logic_vector(22 downto 0);
    SIGNAL cov_Istim_3 : std_logic_vector(22 downto 0);
    SIGNAL cov_Istim_4 : std_logic_vector(22 downto 0);
    SIGNAL con_vv_vS : std_logic_vector(17 downto 0);
    SIGNAL con_vv_vS_0 : std_logic_vector(26 downto 0);
    SIGNAL con_vv_vS_1 : std_logic_vector(26 downto 0);
    SIGNAL con_vv_vS_2 : std_logic_vector(26 downto 0);
    SIGNAL con_vv_vS_3 : std_logic_vector(26 downto 0);
    SIGNAL con_vv_vS_4 : std_logic_vector(26 downto 0);
    SIGNAL con_vv_vS_5 : std_logic_vector(26 downto 0);
    SIGNAL con_vv_vS_6 : std_logic_vector(26 downto 0);
    SIGNAL con_vv_vL : std_logic_vector(17 downto 0);
    SIGNAL con_vv_vL_0 : std_logic_vector(19 downto 0);
    SIGNAL con_vv_vL_1 : std_logic_vector(19 downto 0);
    SIGNAL con_vv_vL_2 : std_logic_vector(19 downto 0);
    SIGNAL con_vv_vL_3 : std_logic_vector(19 downto 0);
    SIGNAL con_vv_vL_4 : std_logic_vector(19 downto 0);
    SIGNAL con_v_vS : std_logic_vector(17 downto 0);
    SIGNAL con_v_vS_0 : std_logic_vector(26 downto 0);
    SIGNAL con_v_vS_1 : std_logic_vector(26 downto 0);
    SIGNAL con_v_vS_2 : std_logic_vector(26 downto 0);
    SIGNAL con_v_vS_3 : std_logic_vector(26 downto 0);
    SIGNAL con_v_vS_4 : std_logic_vector(26 downto 0);
    SIGNAL con_v_vS_5 : std_logic_vector(26 downto 0);
    SIGNAL con_v_vS_6 : std_logic_vector(26 downto 0);
    SIGNAL con_v_vL : std_logic_vector(17 downto 0);
    SIGNAL con_v_vL_0 : std_logic_vector(26 downto 0);
    SIGNAL con_v_vL_1 : std_logic_vector(26 downto 0);
    SIGNAL con_v_vL_2 : std_logic_vector(26 downto 0);
    SIGNAL con_v_vL_3 : std_logic_vector(26 downto 0);
    SIGNAL con_v_vL_4 : std_logic_vector(26 downto 0);
    SIGNAL con_v_vL_5 : std_logic_vector(26 downto 0);
    SIGNAL con_v_vL_6 : std_logic_vector(26 downto 0);
    SIGNAL con_v_vL_7 : std_logic_vector(26 downto 0);
    SIGNAL con_v_vL_8 : std_logic_vector(26 downto 0);
    SIGNAL con_n : std_logic_vector(17 downto 0);
    SIGNAL con_n_0 : std_logic_vector(27 downto 0);
    SIGNAL con_n_1 : std_logic_vector(27 downto 0);
    SIGNAL coq_vv_vS : std_logic_vector(17 downto 0);
    SIGNAL coq_vv_vS_0 : std_logic_vector(27 downto 0);
    SIGNAL coq_vv_vS_1 : std_logic_vector(27 downto 0);
    SIGNAL coq_vv_vL : std_logic_vector(17 downto 0);
    SIGNAL coq_vv_vL_0 : std_logic_vector(25 downto 0);
    SIGNAL coq_vv_vL_1 : std_logic_vector(25 downto 0);
    SIGNAL coq_vv_vL_2 : std_logic_vector(25 downto 0);
    SIGNAL coq_v_vS : std_logic_vector(17 downto 0);
    SIGNAL coq_v_vS_0 : std_logic_vector(27 downto 0);
    SIGNAL coq_v_vS_1 : std_logic_vector(27 downto 0);
    SIGNAL coq_v_vS_2 : std_logic_vector(27 downto 0);
    SIGNAL coq_v_vL : std_logic_vector(17 downto 0);
    SIGNAL coq_v_vL_0 : std_logic_vector(26 downto 0);
    SIGNAL coq_v_vL_1 : std_logic_vector(26 downto 0);
    SIGNAL coq_v_vL_2 : std_logic_vector(26 downto 0);
    SIGNAL coq_v_vL_3 : std_logic_vector(26 downto 0);
    SIGNAL coq_q : std_logic_vector(17 downto 0);
    SIGNAL coq_q_0 : std_logic_vector(27 downto 0);
    SIGNAL coq_q_1 : std_logic_vector(27 downto 0);
    SIGNAL cos_s_vS : std_logic_vector(17 downto 0);
    SIGNAL cos_s_vS_0 : std_logic_vector(27 downto 0);
    SIGNAL cos_s_vS_1 : std_logic_vector(27 downto 0);
    SIGNAL cos_s_vS_2 : std_logic_vector(27 downto 0);
    SIGNAL cos_s_vS_3 : std_logic_vector(27 downto 0);
    SIGNAL cos_s_vL : std_logic_vector(17 downto 0);
    SIGNAL cos_s_vL_0 : std_logic_vector(27 downto 0);
    SIGNAL cos_s_vL_1 : std_logic_vector(27 downto 0);    
    SIGNAL cov_vS : std_logic_vector(17 downto 0):="000000000101101010";-- 0.353515625
    SIGNAL cov_vL : std_logic_vector(17 downto 0):="000000000101101010";-- 0.353515625  
    SIGNAL con_vS : std_logic_vector(17 downto 0):="000000011000100110";-- 1.537109375
    SIGNAL con_vL : std_logic_vector(17 downto 0):="000000111000000111";-- 3.5068359375
    SIGNAL coq_vS : std_logic_vector(17 downto 0):="111111111111111010";-- -0.005859375
    SIGNAL coq_vL : std_logic_vector(17 downto 0):="000000000000001011";-- 0.0107421875
    SIGNAL cos_vL : std_logic_vector(17 downto 0):="000000000100000000";-- 0.25
    SIGNAL crf : std_logic_vector(17 downto 0):="000000000000000000";-- 0
    SIGNAL crg : std_logic_vector(17 downto 0):="111111101101111110";-- -1.126953125
    SIGNAL crh : std_logic_vector(17 downto 0):="111111100100111111";-- -1.6884765625
    SIGNAL cIstim0 : std_logic_vector(17 downto 0):="000000001000000000";-- 0.5
    SIGNAL cIstim1 : std_logic_vector(17 downto 0):="000000001001100110";-- 0.6
    SIGNAL cIstim2 : std_logic_vector(17 downto 0):="000000001100110011";-- 0.8
    SIGNAL vini : std_logic_vector(17 downto 0):="111111000100110000";-- -3.703125
    SIGNAL nini : std_logic_vector(17 downto 0):="000110100010101000";-- 26.1640625
    SIGNAL qini : std_logic_vector(17 downto 0):="111111100000000000";-- -2.0
    SIGNAL vth : std_logic_vector(17 downto 0):="000000000000000000";-- 0

BEGIN
    updater : PROCESS (CLK)
    BEGIN
        IF (rising_edge(CLK)) THEN
            -- 1st stage
            --I36 <= PORT_Iin * PORT_uin;
            I18 <= PORT_Iin;
            vv36 <= PORT_vin * PORT_vin;
            vq <=  PORT_vin - PORT_qin;
            vin <= PORT_vin;
            nin <= PORT_nin;
            qin <= PORT_qin;
            sin <= PORT_sin;
            uin <= PORT_uin;
            fcin <= PORT_fcin;
            -- 2nd stage
            cov_vv_vS_b0 <= cov_vv_vS;
            cov_vv_vL_b0 <= cov_vv_vL;
            cov_v_vS_b0 <= cov_v_vS;
            cov_v_vL_b0 <= cov_v_vL;
            cov_n_b0 <= cov_n;
            cov_q_b0 <= cov_q;
            cov_Istim_b0 <= cov_Istim;
            con_vv_vS_b0 <= con_vv_vS;
            con_vv_vL_b0 <= con_vv_vL;
            con_v_vS_b0 <= con_v_vS;
            con_v_vL_b0 <= con_v_vL;
            con_n_b0 <= con_n;
            coq_vv_vS_b0 <= coq_vv_vS;
            coq_vv_vL_b0 <= coq_vv_vL;
            coq_v_vS_b0 <= coq_v_vS;
            coq_v_vL_b0 <= coq_v_vL;
            coq_q_b0 <= coq_q;
            cos_s_vS_b0 <= cos_s_vS;
            cos_s_vL_b0 <= cos_s_vL;
            vin_b0 <= vin;
            nin_b0 <= nin;
            qin_b0 <= qin;
            uin_b0 <= uin;
            sin_b0 <= sin;
            fcin_b0 <= fcin;
            -- 3rd stage
            IF vin_b0 < crf THEN
                vout_b0 <= vin_b0 + cov_vv_vS_b0 + cov_v_vS_b0 + cov_vS + cov_n_b0 + cov_q_b0 + cov_Istim_b0;
            ELSE
                vout_b0 <= vin_b0 + cov_vv_vL_b0 + cov_v_vL_b0 + cov_vL + cov_n_b0 + cov_q_b0 + cov_Istim_b0;
            END IF;
            IF vin_b0 < crg THEN
                nout_b0 <= nin_b0 + con_vv_vS_b0 + con_v_vS_b0 + con_vS + con_n_b0;
            ELSE
                nout_b0 <= nin_b0 + con_vv_vL_b0 + con_v_vL_b0 + con_vL + con_n_b0;
            END IF;
            IF vin_b0 < crh THEN
                qout_b0 <= qin_b0 + coq_vv_vS_b0 + coq_v_vS_b0 + coq_vS + coq_q_b0;
            ELSE
                qout_b0 <= qin_b0 + coq_vv_vL_b0 + coq_v_vL_b0 + coq_vL + coq_q_b0;
            END IF;
            IF vin_b0 < vth THEN
                sout_b0 <= sin_b0 + cos_s_vS_b0;
            ELSE
                sout_b0 <= sin_b0 + cos_s_vL_b0 + cos_vL;
            END IF;
            uout_b0 <= uin_b0 + uout1;
            fcin_b1 <= fcin_b0;
            vin_b1 <= vin_b0;
            --4th stage
            PORT_vout <= vout_b0;
            PORT_nout <= nout_b0;
            PORT_qout <= qout_b0;
            PORT_sout <= sout_b0;
            PORT_uout <= uout_b0;
            IF vin_b1<vth and vout_b0>=vth THEN
                PORT_spike_flag <= "1";
            ELSE
                PORT_spike_flag <= "0";
            END IF;
            IF vin_b1<vth and vout_b0>=vth and fcin_b1 < "0000100000" THEN
                PORT_fcout <= fcin_b1 + 1;
            ELSE
                PORT_fcout <= fcin_b1;
            END IF;
        END IF;
    END PROCESS;
    Iin <= "000000010000000000" when I18>"000000010000000000" else "111111111000000000" when I18<"111111111000000000" else I18;
    vv <= vv36(27 downto 10 );
    -- vv * 0.0888671875 : 00000000.0001011011    27bit
    cov_vv_vS_0 <= "0000" & vv(17 downto 0) & "00000" when vv(17)='0' else "1111" & vv(17 downto 0) & "00000";
    cov_vv_vS_1 <= "000000" & vv(17 downto 0) & "000" when vv(17)='0' else "111111" & vv(17 downto 0) & "000";
    cov_vv_vS_2 <= "0000000" & vv(17 downto 0) & "00" when vv(17)='0' else "1111111" & vv(17 downto 0) & "00";
    cov_vv_vS_3 <= "000000000" & vv(17 downto 0) & "" when vv(17)='0' else "111111111" & vv(17 downto 0) & "";
    cov_vv_vS_4 <= "0000000000" & vv(17 downto 1) & "" when vv(17)='0' else "1111111111" & vv(17 downto 1) & "";
    cov_vv_vS_5 <= cov_vv_vS_0 + cov_vv_vS_1 + cov_vv_vS_2 + cov_vv_vS_3 + cov_vv_vS_4;
    cov_vv_vS <= cov_vv_vS_5(26 downto 9);

    -- vv * -0.3251953125 : 00000000.0101001101    28bit
    cov_vv_vL_0 <= "00" & vv(17 downto 0) & "00000000" when vv(17)='0' else "11" & vv(17 downto 0) & "00000000";
    cov_vv_vL_1 <= "0000" & vv(17 downto 0) & "000000" when vv(17)='0' else "1111" & vv(17 downto 0) & "000000";
    cov_vv_vL_2 <= "0000000" & vv(17 downto 0) & "000" when vv(17)='0' else "1111111" & vv(17 downto 0) & "000";
    cov_vv_vL_3 <= "00000000" & vv(17 downto 0) & "00" when vv(17)='0' else "11111111" & vv(17 downto 0) & "00";
    cov_vv_vL_4 <= "0000000000" & vv(17 downto 0) & "" when vv(17)='0' else "1111111111" & vv(17 downto 0) & "";
    cov_vv_vL_5 <= not (cov_vv_vL_0 + cov_vv_vL_1 + cov_vv_vL_2 + cov_vv_vL_3 + cov_vv_vL_4) + 1;
    cov_vv_vL <= cov_vv_vL_5(27 downto 10);

    -- vin * 0.2646484375 : 00000000.0100001111    27bit
    cov_v_vS_0 <= "00" & vin(17 downto 0) & "0000000" when vin(17)='0' else "11" & vin(17 downto 0) & "0000000";
    cov_v_vS_1 <= "0000000" & vin(17 downto 0) & "00" when vin(17)='0' else "1111111" & vin(17 downto 0) & "00";
    cov_v_vS_2 <= "00000000" & vin(17 downto 0) & "0" when vin(17)='0' else "11111111" & vin(17 downto 0) & "0";
    cov_v_vS_3 <= "000000000" & vin(17 downto 0) & "" when vin(17)='0' else "111111111" & vin(17 downto 0) & "";
    cov_v_vS_4 <= "0000000000" & vin(17 downto 1) & "" when vin(17)='0' else "1111111111" & vin(17 downto 1) & "";
    cov_v_vS_5 <= cov_v_vS_0 + cov_v_vS_1 + cov_v_vS_2 + cov_v_vS_3 + cov_v_vS_4;
    cov_v_vS <= cov_v_vS_5(26 downto 9);

    -- vin * 0.2724609375 : 00000000.0100010111    27bit
    cov_v_vL_0 <= "00" & vin(17 downto 0) & "0000000" when vin(17)='0' else "11" & vin(17 downto 0) & "0000000";
    cov_v_vL_1 <= "000000" & vin(17 downto 0) & "000" when vin(17)='0' else "111111" & vin(17 downto 0) & "000";
    cov_v_vL_2 <= "00000000" & vin(17 downto 0) & "0" when vin(17)='0' else "11111111" & vin(17 downto 0) & "0";
    cov_v_vL_3 <= "000000000" & vin(17 downto 0) & "" when vin(17)='0' else "111111111" & vin(17 downto 0) & "";
    cov_v_vL_4 <= "0000000000" & vin(17 downto 1) & "" when vin(17)='0' else "1111111111" & vin(17 downto 1) & "";
    cov_v_vL_5 <= cov_v_vL_0 + cov_v_vL_1 + cov_v_vL_2 + cov_v_vL_3 + cov_v_vL_4;
    cov_v_vL <= cov_v_vL_5(26 downto 9);

    -- nin * -0.0244140625 : 00000000.0000011001    28bit
    cov_n_0 <= "000000" & nin(17 downto 0) & "0000" when nin(17)='0' else "111111" & nin(17 downto 0) & "0000";
    cov_n_1 <= "0000000" & nin(17 downto 0) & "000" when nin(17)='0' else "1111111" & nin(17 downto 0) & "000";
    cov_n_2 <= "0000000000" & nin(17 downto 0) & "" when nin(17)='0' else "1111111111" & nin(17 downto 0) & "";
    cov_n_3 <= not (cov_n_0 + cov_n_1 + cov_n_2) + 1;
    cov_n <= cov_n_3(27 downto 10);

    -- qin * -0.0244140625 : 00000000.0000011001    28bit
    cov_q_0 <= "000000" & qin(17 downto 0) & "0000" when qin(17)='0' else "111111" & qin(17 downto 0) & "0000";
    cov_q_1 <= "0000000" & qin(17 downto 0) & "000" when qin(17)='0' else "1111111" & qin(17 downto 0) & "000";
    cov_q_2 <= "0000000000" & qin(17 downto 0) & "" when qin(17)='0' else "1111111111" & qin(17 downto 0) & "";
    cov_q_3 <= not (cov_q_0 + cov_q_1 + cov_q_2) + 1;
    cov_q <= cov_q_3(27 downto 10);

    -- Iin * 0.4072265625 : 00000000.0110100001    23bit
    cov_Istim_0 <= "00" & Iin(17 downto 0) & "000" when Iin(17)='0' else "11" & Iin(17 downto 0) & "000";
    cov_Istim_1 <= "000" & Iin(17 downto 0) & "00" when Iin(17)='0' else "111" & Iin(17 downto 0) & "00";
    cov_Istim_2 <= "00000" & Iin(17 downto 0) & "" when Iin(17)='0' else "11111" & Iin(17 downto 0) & "";
    cov_Istim_3 <= "0000000000" & Iin(17 downto 5) & "" when Iin(17)='0' else "1111111111" & Iin(17 downto 5) & "";
    cov_Istim_4 <= cov_Istim_0 + cov_Istim_1 + cov_Istim_2 + cov_Istim_3;
    cov_Istim <= cov_Istim_4(22 downto 5);

    -- vv * 0.2021484375 : 00000000.0011001111    27bit
    con_vv_vS_0 <= "000" & vv(17 downto 0) & "000000" when vv(17)='0' else "111" & vv(17 downto 0) & "000000";
    con_vv_vS_1 <= "0000" & vv(17 downto 0) & "00000" when vv(17)='0' else "1111" & vv(17 downto 0) & "00000";
    con_vv_vS_2 <= "0000000" & vv(17 downto 0) & "00" when vv(17)='0' else "1111111" & vv(17 downto 0) & "00";
    con_vv_vS_3 <= "00000000" & vv(17 downto 0) & "0" when vv(17)='0' else "11111111" & vv(17 downto 0) & "0";
    con_vv_vS_4 <= "000000000" & vv(17 downto 0) & "" when vv(17)='0' else "111111111" & vv(17 downto 0) & "";
    con_vv_vS_5 <= "0000000000" & vv(17 downto 1) & "" when vv(17)='0' else "1111111111" & vv(17 downto 1) & "";
    con_vv_vS_6 <= con_vv_vS_0 + con_vv_vS_1 + con_vv_vS_2 + con_vv_vS_3 + con_vv_vS_4 + con_vv_vS_5;
    con_vv_vS <= con_vv_vS_6(26 downto 9);

    -- vv * 1.751953125 : 00000001.1100000010    20bit
    con_vv_vL_0 <= vv & "00";
    con_vv_vL_1 <= "0" & vv(17 downto 0) & "0" when vv(17)='0' else "1" & vv(17 downto 0) & "0";
    con_vv_vL_2 <= "00" & vv(17 downto 0) & "" when vv(17)='0' else "11" & vv(17 downto 0) & "";
    con_vv_vL_3 <= "000000000" & vv(17 downto 7) & "" when vv(17)='0' else "111111111" & vv(17 downto 7) & "";
    con_vv_vL_4 <= con_vv_vL_0 + con_vv_vL_1 + con_vv_vL_2 + con_vv_vL_3;
    con_vv_vL <= con_vv_vL_4(19 downto 2);

    -- vin * 0.2802734375 : 00000000.0100011111    27bit
    con_v_vS_0 <= "00" & vin(17 downto 0) & "0000000" when vin(17)='0' else "11" & vin(17 downto 0) & "0000000";
    con_v_vS_1 <= "000000" & vin(17 downto 0) & "000" when vin(17)='0' else "111111" & vin(17 downto 0) & "000";
    con_v_vS_2 <= "0000000" & vin(17 downto 0) & "00" when vin(17)='0' else "1111111" & vin(17 downto 0) & "00";
    con_v_vS_3 <= "00000000" & vin(17 downto 0) & "0" when vin(17)='0' else "11111111" & vin(17 downto 0) & "0";
    con_v_vS_4 <= "000000000" & vin(17 downto 0) & "" when vin(17)='0' else "111111111" & vin(17 downto 0) & "";
    con_v_vS_5 <= "0000000000" & vin(17 downto 1) & "" when vin(17)='0' else "1111111111" & vin(17 downto 1) & "";
    con_v_vS_6 <= con_v_vS_0 + con_v_vS_1 + con_v_vS_2 + con_v_vS_3 + con_v_vS_4 + con_v_vS_5;
    con_v_vS <= con_v_vS_6(26 downto 9);

    -- vin * 3.7646484375 : 00000011.1100001111    27bit
    con_v_vL_0 <= vin( 16 downto 0) & "0000000000";
    con_v_vL_1 <= vin & "000000000";
    con_v_vL_2 <= "0" & vin(17 downto 0) & "00000000" when vin(17)='0' else "1" & vin(17 downto 0) & "00000000";
    con_v_vL_3 <= "00" & vin(17 downto 0) & "0000000" when vin(17)='0' else "11" & vin(17 downto 0) & "0000000";
    con_v_vL_4 <= "0000000" & vin(17 downto 0) & "00" when vin(17)='0' else "1111111" & vin(17 downto 0) & "00";
    con_v_vL_5 <= "00000000" & vin(17 downto 0) & "0" when vin(17)='0' else "11111111" & vin(17 downto 0) & "0";
    con_v_vL_6 <= "000000000" & vin(17 downto 0) & "" when vin(17)='0' else "111111111" & vin(17 downto 0) & "";
    con_v_vL_7 <= "0000000000" & vin(17 downto 1) & "" when vin(17)='0' else "1111111111" & vin(17 downto 1) & "";
    con_v_vL_8 <= con_v_vL_0 + con_v_vL_1 + con_v_vL_2 + con_v_vL_3 + con_v_vL_4 + con_v_vL_5 + con_v_vL_6 + con_v_vL_7;
    con_v_vL <= con_v_vL_8(26 downto 9);

    -- nin * -0.125 : 00000000.0010000000    28bit
    con_n_0 <= "000" & nin(17 downto 0) & "0000000" when nin(17)='0' else "111" & nin(17 downto 0) & "0000000";
    con_n_1 <= not (con_n_0) + 1;
    con_n <= con_n_1(27 downto 10);

    -- vv * -0.0009765625 : 00000000.0000000001    28bit
    coq_vv_vS_0 <= "0000000000" & vv(17 downto 0) & "" when vv(17)='0' else "1111111111" & vv(17 downto 0) & "";
    coq_vv_vS_1 <= not (coq_vv_vS_0) + 1;
    coq_vv_vS <= coq_vv_vS_1(27 downto 10);

    -- vv * 0.0048828125 : 00000000.0000000101    26bit
    coq_vv_vL_0 <= "00000000" & vv(17 downto 0) & "" when vv(17)='0' else "11111111" & vv(17 downto 0) & "";
    coq_vv_vL_1 <= "0000000000" & vv(17 downto 2) & "" when vv(17)='0' else "1111111111" & vv(17 downto 2) & "";
    coq_vv_vL_2 <= coq_vv_vL_0 + coq_vv_vL_1;
    coq_vv_vL <= coq_vv_vL_2(25 downto 8);

    -- vin * -0.0048828125 : 00000000.0000000101    28bit
    coq_v_vS_0 <= "00000000" & vin(17 downto 0) & "00" when vin(17)='0' else "11111111" & vin(17 downto 0) & "00";
    coq_v_vS_1 <= "0000000000" & vin(17 downto 0) & "" when vin(17)='0' else "1111111111" & vin(17 downto 0) & "";
    coq_v_vS_2 <= not (coq_v_vS_0 + coq_v_vS_1) + 1;
    coq_v_vS <= coq_v_vS_2(27 downto 10);

    -- vin * 0.0107421875 : 00000000.0000001011    27bit
    coq_v_vL_0 <= "0000000" & vin(17 downto 0) & "00" when vin(17)='0' else "1111111" & vin(17 downto 0) & "00";
    coq_v_vL_1 <= "000000000" & vin(17 downto 0) & "" when vin(17)='0' else "111111111" & vin(17 downto 0) & "";
    coq_v_vL_2 <= "0000000000" & vin(17 downto 1) & "" when vin(17)='0' else "1111111111" & vin(17 downto 1) & "";
    coq_v_vL_3 <= coq_v_vL_0 + coq_v_vL_1 + coq_v_vL_2;
    coq_v_vL <= coq_v_vL_3(26 downto 9);

    -- qin * -0.0009765625 : 00000000.0000000001    28bit
    coq_q_0 <= "0000000000" & qin(17 downto 0) & "" when qin(17)='0' else "1111111111" & qin(17 downto 0) & "";
    coq_q_1 <= not (coq_q_0) + 1;
    coq_q <= coq_q_1(27 downto 10);

    -- sin * -0.203125 : 00000000.0011010000    28bit
    cos_s_vS_0 <= "000" & sin(17 downto 0) & "0000000" when sin(17)='0' else "111" & sin(17 downto 0) & "0000000";
    cos_s_vS_1 <= "0000" & sin(17 downto 0) & "000000" when sin(17)='0' else "1111" & sin(17 downto 0) & "000000";
    cos_s_vS_2 <= "000000" & sin(17 downto 0) & "0000" when sin(17)='0' else "111111" & sin(17 downto 0) & "0000";
    cos_s_vS_3 <= not (cos_s_vS_0 + cos_s_vS_1 + cos_s_vS_2) + 1;
    cos_s_vS <= cos_s_vS_3(27 downto 10);

    -- sin * -0.25 : 00000000.0100000000    28bit
    cos_s_vL_0 <= "00" & sin(17 downto 0) & "00000000" when sin(17)='0' else "11" & sin(17 downto 0) & "00000000";
    cos_s_vL_1 <= not (cos_s_vL_0) + 1;
    cos_s_vL <= cos_s_vL_1(27 downto 10);

    uout0 <= utf - (fcin(7 downto 0) & "0000000000"); --18bit
    uout1 <= "0000000" & uout0(17 downto 7) when uout0(17)='0' else "1111111" & uout0(17 downto 7);--1/128

END Behavioral;
--cov_vv_vS=0.0888671875
--cov_vv_vL=-0.3251953125
--cov_v_vS=0.2646484375
--cov_v_vL=0.2724609375
--cov_n=-0.0244140625
--cov_q=-0.0244140625
--cov_Istim=0.4072265625
--con_vv_vS=0.2021484375
--con_vv_vL=1.751953125
--con_v_vS=0.2802734375
--con_v_vL=3.7646484375
--con_n=-0.125
--coq_vv_vS=-0.0009765625
--coq_vv_vL=0.0048828125
--coq_v_vS=-0.0048828125
--coq_v_vL=0.0107421875
--coq_q=-0.0009765625
--cos_s_vS=-0.203125
--cos_s_vL=-0.25
--cov_vS=0.353515625
--cov_vL=0.353515625
--con_vS=1.537109375
--con_vL=3.5068359375
--coq_vS=-0.005859375
--coq_vL=0.0107421875
--cos_vL=0.25
--crf=0
--crg=-1.126953125
--crh=-1.6884765625
--cIstim0=0.5
--cIstim1=0.6
--cIstim2=0.8
--vini=-3.703125
--nini=26.1640625
--qini=-2.0
--vth=0