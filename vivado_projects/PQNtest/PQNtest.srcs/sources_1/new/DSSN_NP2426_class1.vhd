

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.ALL;
entity DSSN_NP2426_class1 is
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
end DSSN_NP2426_class1;
architecture Behavioral of DSSN_NP2426_class1 is
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
    SIGNAL cov_vv_vS_0 : std_logic_vector(25 downto 0);
    SIGNAL cov_vv_vS_1 : std_logic_vector(25 downto 0);
    SIGNAL cov_vv_vS_2 : std_logic_vector(25 downto 0);
    SIGNAL cov_vv_vS_3 : std_logic_vector(25 downto 0);
    SIGNAL cov_vv_vS_4 : std_logic_vector(25 downto 0);
    SIGNAL cov_vv_vS_5 : std_logic_vector(25 downto 0);
    SIGNAL cov_vv_vS_6 : std_logic_vector(25 downto 0);
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
    SIGNAL cov_v_vL_0 : std_logic_vector(23 downto 0);
    SIGNAL cov_v_vL_1 : std_logic_vector(23 downto 0);
    SIGNAL cov_v_vL_2 : std_logic_vector(23 downto 0);
    SIGNAL cov_v_vL_3 : std_logic_vector(23 downto 0);
    SIGNAL cov_v_vL_4 : std_logic_vector(23 downto 0);
    SIGNAL cov_v_vL_5 : std_logic_vector(23 downto 0);
    SIGNAL cov_n : std_logic_vector(17 downto 0);
    SIGNAL cov_n_0 : std_logic_vector(27 downto 0);
    SIGNAL cov_n_1 : std_logic_vector(27 downto 0);
    SIGNAL cov_n_2 : std_logic_vector(27 downto 0);
    SIGNAL cov_n_3 : std_logic_vector(27 downto 0);
    SIGNAL cov_n_4 : std_logic_vector(27 downto 0);
    SIGNAL cov_q : std_logic_vector(17 downto 0);
    SIGNAL cov_q_0 : std_logic_vector(27 downto 0);
    SIGNAL cov_q_1 : std_logic_vector(27 downto 0);
    SIGNAL cov_q_2 : std_logic_vector(27 downto 0);
    SIGNAL cov_q_3 : std_logic_vector(27 downto 0);
    SIGNAL cov_q_4 : std_logic_vector(27 downto 0);
    SIGNAL cov_Istim : std_logic_vector(17 downto 0);
    SIGNAL cov_Istim_0 : std_logic_vector(23 downto 0);
    SIGNAL cov_Istim_1 : std_logic_vector(23 downto 0);
    SIGNAL cov_Istim_2 : std_logic_vector(23 downto 0);
    SIGNAL cov_Istim_3 : std_logic_vector(23 downto 0);
    SIGNAL cov_Istim_4 : std_logic_vector(23 downto 0);
    SIGNAL cov_Istim_5 : std_logic_vector(23 downto 0);
    SIGNAL con_vv_vS : std_logic_vector(17 downto 0);
    SIGNAL con_vv_vS_0 : std_logic_vector(27 downto 0);
    SIGNAL con_vv_vS_1 : std_logic_vector(27 downto 0);
    SIGNAL con_vv_vS_2 : std_logic_vector(27 downto 0);
    SIGNAL con_vv_vS_3 : std_logic_vector(27 downto 0);
    SIGNAL con_vv_vS_4 : std_logic_vector(27 downto 0);
    SIGNAL con_vv_vS_5 : std_logic_vector(27 downto 0);
    SIGNAL con_vv_vS_6 : std_logic_vector(27 downto 0);
    SIGNAL con_vv_vS_7 : std_logic_vector(27 downto 0);
    SIGNAL con_vv_vL : std_logic_vector(17 downto 0);
    SIGNAL con_vv_vL_0 : std_logic_vector(26 downto 0);
    SIGNAL con_vv_vL_1 : std_logic_vector(26 downto 0);
    SIGNAL con_vv_vL_2 : std_logic_vector(26 downto 0);
    SIGNAL con_vv_vL_3 : std_logic_vector(26 downto 0);
    SIGNAL con_vv_vL_4 : std_logic_vector(26 downto 0);
    SIGNAL con_vv_vL_5 : std_logic_vector(26 downto 0);
    SIGNAL con_vv_vL_6 : std_logic_vector(26 downto 0);
    SIGNAL con_v_vS : std_logic_vector(17 downto 0);
    SIGNAL con_v_vS_0 : std_logic_vector(27 downto 0);
    SIGNAL con_v_vS_1 : std_logic_vector(27 downto 0);
    SIGNAL con_v_vS_2 : std_logic_vector(27 downto 0);
    SIGNAL con_v_vS_3 : std_logic_vector(27 downto 0);
    SIGNAL con_v_vS_4 : std_logic_vector(27 downto 0);
    SIGNAL con_v_vS_5 : std_logic_vector(27 downto 0);
    SIGNAL con_v_vS_6 : std_logic_vector(27 downto 0);
    SIGNAL con_v_vS_7 : std_logic_vector(27 downto 0);
    SIGNAL con_v_vL : std_logic_vector(17 downto 0);
    SIGNAL con_v_vL_0 : std_logic_vector(25 downto 0);
    SIGNAL con_v_vL_1 : std_logic_vector(25 downto 0);
    SIGNAL con_v_vL_2 : std_logic_vector(25 downto 0);
    SIGNAL con_v_vL_3 : std_logic_vector(25 downto 0);
    SIGNAL con_v_vL_4 : std_logic_vector(25 downto 0);
    SIGNAL con_v_vL_5 : std_logic_vector(25 downto 0);
    SIGNAL con_v_vL_6 : std_logic_vector(25 downto 0);
    SIGNAL con_v_vL_7 : std_logic_vector(25 downto 0);
    SIGNAL con_v_vL_8 : std_logic_vector(25 downto 0);
    SIGNAL con_n : std_logic_vector(17 downto 0);
    SIGNAL con_n_0 : std_logic_vector(27 downto 0);
    SIGNAL con_n_1 : std_logic_vector(27 downto 0);
    SIGNAL coq_vv_vS : std_logic_vector(17 downto 0);
    SIGNAL coq_vv_vS_0 : std_logic_vector(27 downto 0);
    SIGNAL coq_vv_vS_1 : std_logic_vector(27 downto 0);
    SIGNAL coq_vv_vS_2 : std_logic_vector(27 downto 0);
    SIGNAL coq_vv_vS_3 : std_logic_vector(27 downto 0);
    SIGNAL coq_vv_vL : std_logic_vector(17 downto 0);
    SIGNAL coq_vv_vL_0 : std_logic_vector(27 downto 0);
    SIGNAL coq_vv_vL_1 : std_logic_vector(27 downto 0);
    SIGNAL coq_vv_vL_2 : std_logic_vector(27 downto 0);
    SIGNAL coq_v_vS : std_logic_vector(17 downto 0);
    SIGNAL coq_v_vS_0 : std_logic_vector(27 downto 0);
    SIGNAL coq_v_vS_1 : std_logic_vector(27 downto 0);
    SIGNAL coq_v_vS_2 : std_logic_vector(27 downto 0);
    SIGNAL coq_v_vS_3 : std_logic_vector(27 downto 0);
    SIGNAL coq_v_vL : std_logic_vector(17 downto 0);
    SIGNAL coq_v_vL_0 : std_logic_vector(27 downto 0);
    SIGNAL coq_v_vL_1 : std_logic_vector(27 downto 0);
    SIGNAL coq_v_vL_2 : std_logic_vector(27 downto 0);
    SIGNAL coq_v_vL_3 : std_logic_vector(27 downto 0);
    SIGNAL coq_q : std_logic_vector(17 downto 0);
    SIGNAL coq_q_0 : std_logic_vector(27 downto 0);
    SIGNAL coq_q_1 : std_logic_vector(27 downto 0);
    SIGNAL coq_q_2 : std_logic_vector(27 downto 0);
    SIGNAL cos_s_vS : std_logic_vector(17 downto 0);
    SIGNAL cos_s_vS_0 : std_logic_vector(27 downto 0);
    SIGNAL cos_s_vS_1 : std_logic_vector(27 downto 0);
    SIGNAL cos_s_vS_2 : std_logic_vector(27 downto 0);
    SIGNAL cos_s_vS_3 : std_logic_vector(27 downto 0);
    SIGNAL cos_s_vL : std_logic_vector(17 downto 0);
    SIGNAL cos_s_vL_0 : std_logic_vector(27 downto 0);
    SIGNAL cos_s_vL_1 : std_logic_vector(27 downto 0);
    SIGNAL cov_vS : std_logic_vector(17 downto 0):="111111110100111101";-- -0.6904296875
    SIGNAL cov_vL : std_logic_vector(17 downto 0):="111111110100111110";-- -0.689453125
    SIGNAL con_vS : std_logic_vector(17 downto 0):="111000111010011111";-- -28.3447265625
    SIGNAL con_vL : std_logic_vector(17 downto 0):="111111100000100001";-- -1.9677734375
    SIGNAL coq_vS : std_logic_vector(17 downto 0):="111111111010110001";-- -0.3271484375
    SIGNAL coq_vL : std_logic_vector(17 downto 0):="000000000001011101";-- 0.0908203125
    SIGNAL cos_vL : std_logic_vector(17 downto 0):="000000000100000000";-- 0.25
    SIGNAL crf : std_logic_vector(17 downto 0):="000000000000000000";-- 0
    SIGNAL crg : std_logic_vector(17 downto 0):="111111001100110000";-- -3.203125
    SIGNAL crh : std_logic_vector(17 downto 0):="111110111001110000";-- -4.390625
    SIGNAL cIstim0 : std_logic_vector(17 downto 0):="000000001000000000";-- 0.5
    SIGNAL cIstim1 : std_logic_vector(17 downto 0):="000000001001100110";-- 0.6
    SIGNAL cIstim2 : std_logic_vector(17 downto 0):="000000001100110011";-- 0.8
    SIGNAL vini : std_logic_vector(17 downto 0):="111111001011010111";-- -3.2900390625
    SIGNAL nini : std_logic_vector(17 downto 0):="000001011111100001";-- 5.9697265625
    SIGNAL qini : std_logic_vector(17 downto 0):="000010000101010101";-- 8.3330078125
    SIGNAL vth : std_logic_vector(17 downto 0):="000000000000000000";-- 0

BEGIN
    updater : PROCESS (CLK)
    BEGIN
        IF (rising_edge(CLK)) THEN
            -- 1st stage
            I18 <= PORT_Iin;
            vv36 <= PORT_vin * PORT_vin;
            vq <=  PORT_vin - PORT_qin;
            vin <= PORT_vin;
            nin <= PORT_nin;
            qin <= PORT_qin;
            sin <= not PORT_sin + 1;
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
            PORT_sout <= not sout_b0 + 1;
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
    -- vv * 0.365234375 : 00000000.0101110110    26bit
    cov_vv_vS_0 <= "00" & vv(17 downto 0) & "000000" when vv(17)='0' else "11" & vv(17 downto 0) & "000000";
    cov_vv_vS_1 <= "0000" & vv(17 downto 0) & "0000" when vv(17)='0' else "1111" & vv(17 downto 0) & "0000";
    cov_vv_vS_2 <= "00000" & vv(17 downto 0) & "000" when vv(17)='0' else "11111" & vv(17 downto 0) & "000";
    cov_vv_vS_3 <= "000000" & vv(17 downto 0) & "00" when vv(17)='0' else "111111" & vv(17 downto 0) & "00";
    cov_vv_vS_4 <= "00000000" & vv(17 downto 0) & "" when vv(17)='0' else "11111111" & vv(17 downto 0) & "";
    cov_vv_vS_5 <= "000000000" & vv(17 downto 1) & "" when vv(17)='0' else "111111111" & vv(17 downto 1) & "";
    cov_vv_vS_6 <= cov_vv_vS_0 + cov_vv_vS_1 + cov_vv_vS_2 + cov_vv_vS_3 + cov_vv_vS_4 + cov_vv_vS_5;
    cov_vv_vS <= cov_vv_vS_6(25 downto 8);

    -- vv * -1.044921875 : 00000001.0000101110    28bit
    cov_vv_vL_0 <= vv & "0000000000";
    cov_vv_vL_1 <= "00000" & vv(17 downto 0) & "00000" when vv(17)='0' else "11111" & vv(17 downto 0) & "00000";
    cov_vv_vL_2 <= "0000000" & vv(17 downto 0) & "000" when vv(17)='0' else "1111111" & vv(17 downto 0) & "000";
    cov_vv_vL_3 <= "00000000" & vv(17 downto 0) & "00" when vv(17)='0' else "11111111" & vv(17 downto 0) & "00";
    cov_vv_vL_4 <= "000000000" & vv(17 downto 0) & "0" when vv(17)='0' else "111111111" & vv(17 downto 0) & "0";
    cov_vv_vL_5 <= not (cov_vv_vL_0 + cov_vv_vL_1 + cov_vv_vL_2 + cov_vv_vL_3 + cov_vv_vL_4) + 1;
    cov_vv_vL <= cov_vv_vL_5(27 downto 10);

    -- vin * 0.6904296875 : 00000000.1011000011    27bit
    cov_v_vS_0 <= "0" & vin(17 downto 0) & "00000000" when vin(17)='0' else "1" & vin(17 downto 0) & "00000000";
    cov_v_vS_1 <= "000" & vin(17 downto 0) & "000000" when vin(17)='0' else "111" & vin(17 downto 0) & "000000";
    cov_v_vS_2 <= "0000" & vin(17 downto 0) & "00000" when vin(17)='0' else "1111" & vin(17 downto 0) & "00000";
    cov_v_vS_3 <= "000000000" & vin(17 downto 0) & "" when vin(17)='0' else "111111111" & vin(17 downto 0) & "";
    cov_v_vS_4 <= "0000000000" & vin(17 downto 1) & "" when vin(17)='0' else "1111111111" & vin(17 downto 1) & "";
    cov_v_vS_5 <= cov_v_vS_0 + cov_v_vS_1 + cov_v_vS_2 + cov_v_vS_3 + cov_v_vS_4;
    cov_v_vS <= cov_v_vS_5(26 downto 9);

    -- vin * 0.705078125 : 00000000.1011010010    24bit
    cov_v_vL_0 <= "0" & vin(17 downto 0) & "00000" when vin(17)='0' else "1" & vin(17 downto 0) & "00000";
    cov_v_vL_1 <= "000" & vin(17 downto 0) & "000" when vin(17)='0' else "111" & vin(17 downto 0) & "000";
    cov_v_vL_2 <= "0000" & vin(17 downto 0) & "00" when vin(17)='0' else "1111" & vin(17 downto 0) & "00";
    cov_v_vL_3 <= "000000" & vin(17 downto 0) & "" when vin(17)='0' else "111111" & vin(17 downto 0) & "";
    cov_v_vL_4 <= "000000000" & vin(17 downto 3) & "" when vin(17)='0' else "111111111" & vin(17 downto 3) & "";
    cov_v_vL_5 <= cov_v_vL_0 + cov_v_vL_1 + cov_v_vL_2 + cov_v_vL_3 + cov_v_vL_4;
    cov_v_vL <= cov_v_vL_5(23 downto 6);

    -- nin * -0.0693359375 : 00000000.0001000111    28bit
    cov_n_0 <= "0000" & nin(17 downto 0) & "000000" when nin(17)='0' else "1111" & nin(17 downto 0) & "000000";
    cov_n_1 <= "00000000" & nin(17 downto 0) & "00" when nin(17)='0' else "11111111" & nin(17 downto 0) & "00";
    cov_n_2 <= "000000000" & nin(17 downto 0) & "0" when nin(17)='0' else "111111111" & nin(17 downto 0) & "0";
    cov_n_3 <= "0000000000" & nin(17 downto 0) & "" when nin(17)='0' else "1111111111" & nin(17 downto 0) & "";
    cov_n_4 <= not (cov_n_0 + cov_n_1 + cov_n_2 + cov_n_3) + 1;
    cov_n <= cov_n_4(27 downto 10);

    -- qin * -0.0693359375 : 00000000.0001000111    28bit
    cov_q_0 <= "0000" & qin(17 downto 0) & "000000" when qin(17)='0' else "1111" & qin(17 downto 0) & "000000";
    cov_q_1 <= "00000000" & qin(17 downto 0) & "00" when qin(17)='0' else "11111111" & qin(17 downto 0) & "00";
    cov_q_2 <= "000000000" & qin(17 downto 0) & "0" when qin(17)='0' else "111111111" & qin(17 downto 0) & "0";
    cov_q_3 <= "0000000000" & qin(17 downto 0) & "" when qin(17)='0' else "1111111111" & qin(17 downto 0) & "";
    cov_q_4 <= not (cov_q_0 + cov_q_1 + cov_q_2 + cov_q_3) + 1;
    cov_q <= cov_q_4(27 downto 10);

    -- Iin * 0.830078125 : 00000000.1101010010    24bit
    cov_Istim_0 <= "0" & Iin(17 downto 0) & "00000" when Iin(17)='0' else "1" & Iin(17 downto 0) & "00000";
    cov_Istim_1 <= "00" & Iin(17 downto 0) & "0000" when Iin(17)='0' else "11" & Iin(17 downto 0) & "0000";
    cov_Istim_2 <= "0000" & Iin(17 downto 0) & "00" when Iin(17)='0' else "1111" & Iin(17 downto 0) & "00";
    cov_Istim_3 <= "000000" & Iin(17 downto 0) & "" when Iin(17)='0' else "111111" & Iin(17 downto 0) & "";
    cov_Istim_4 <= "000000000" & Iin(17 downto 3) & "" when Iin(17)='0' else "111111111" & Iin(17 downto 3) & "";
    cov_Istim_5 <= cov_Istim_0 + cov_Istim_1 + cov_Istim_2 + cov_Istim_3 + cov_Istim_4;
    cov_Istim <= cov_Istim_5(23 downto 6);

    -- vv * -1.8056640625 : 00000001.1100111001    28bit
    con_vv_vS_0 <= vv & "0000000000";
    con_vv_vS_1 <= "0" & vv(17 downto 0) & "000000000" when vv(17)='0' else "1" & vv(17 downto 0) & "000000000";
    con_vv_vS_2 <= "00" & vv(17 downto 0) & "00000000" when vv(17)='0' else "11" & vv(17 downto 0) & "00000000";
    con_vv_vS_3 <= "00000" & vv(17 downto 0) & "00000" when vv(17)='0' else "11111" & vv(17 downto 0) & "00000";
    con_vv_vS_4 <= "000000" & vv(17 downto 0) & "0000" when vv(17)='0' else "111111" & vv(17 downto 0) & "0000";
    con_vv_vS_5 <= "0000000" & vv(17 downto 0) & "000" when vv(17)='0' else "1111111" & vv(17 downto 0) & "000";
    con_vv_vS_6 <= "0000000000" & vv(17 downto 0) & "" when vv(17)='0' else "1111111111" & vv(17 downto 0) & "";
    con_vv_vS_7 <= not (con_vv_vS_0 + con_vv_vS_1 + con_vv_vS_2 + con_vv_vS_3 + con_vv_vS_4 + con_vv_vS_5 + con_vv_vS_6) + 1;
    con_vv_vS <= con_vv_vS_7(27 downto 10);

    -- vv * 0.7646484375 : 00000000.1100001111    27bit
    con_vv_vL_0 <= "0" & vv(17 downto 0) & "00000000" when vv(17)='0' else "1" & vv(17 downto 0) & "00000000";
    con_vv_vL_1 <= "00" & vv(17 downto 0) & "0000000" when vv(17)='0' else "11" & vv(17 downto 0) & "0000000";
    con_vv_vL_2 <= "0000000" & vv(17 downto 0) & "00" when vv(17)='0' else "1111111" & vv(17 downto 0) & "00";
    con_vv_vL_3 <= "00000000" & vv(17 downto 0) & "0" when vv(17)='0' else "11111111" & vv(17 downto 0) & "0";
    con_vv_vL_4 <= "000000000" & vv(17 downto 0) & "" when vv(17)='0' else "111111111" & vv(17 downto 0) & "";
    con_vv_vL_5 <= "0000000000" & vv(17 downto 1) & "" when vv(17)='0' else "1111111111" & vv(17 downto 1) & "";
    con_vv_vL_6 <= con_vv_vL_0 + con_vv_vL_1 + con_vv_vL_2 + con_vv_vL_3 + con_vv_vL_4 + con_vv_vL_5;
    con_vv_vL <= con_vv_vL_6(26 downto 9);

    -- vin * -14.7822265625 : 00001110.1100100001    28bit
    con_v_vS_0 <= vin( 14 downto 0) & "0000000000000";
    con_v_vS_1 <= vin( 15 downto 0) & "000000000000";
    con_v_vS_2 <= vin( 16 downto 0) & "00000000000";
    con_v_vS_3 <= "0" & vin(17 downto 0) & "000000000" when vin(17)='0' else "1" & vin(17 downto 0) & "000000000";
    con_v_vS_4 <= "00" & vin(17 downto 0) & "00000000" when vin(17)='0' else "11" & vin(17 downto 0) & "00000000";
    con_v_vS_5 <= "00000" & vin(17 downto 0) & "00000" when vin(17)='0' else "11111" & vin(17 downto 0) & "00000";
    con_v_vS_6 <= "0000000000" & vin(17 downto 0) & "" when vin(17)='0' else "1111111111" & vin(17 downto 0) & "";
    con_v_vS_7 <= not (con_v_vS_0 + con_v_vS_1 + con_v_vS_2 + con_v_vS_3 + con_v_vS_4 + con_v_vS_5 + con_v_vS_6) + 1;
    con_v_vS <= con_v_vS_7(27 downto 10);

    -- vin * 1.685546875 : 00000001.1010111110    26bit
    con_v_vL_0 <= vin & "00000000";
    con_v_vL_1 <= "0" & vin(17 downto 0) & "0000000" when vin(17)='0' else "1" & vin(17 downto 0) & "0000000";
    con_v_vL_2 <= "000" & vin(17 downto 0) & "00000" when vin(17)='0' else "111" & vin(17 downto 0) & "00000";
    con_v_vL_3 <= "00000" & vin(17 downto 0) & "000" when vin(17)='0' else "11111" & vin(17 downto 0) & "000";
    con_v_vL_4 <= "000000" & vin(17 downto 0) & "00" when vin(17)='0' else "111111" & vin(17 downto 0) & "00";
    con_v_vL_5 <= "0000000" & vin(17 downto 0) & "0" when vin(17)='0' else "1111111" & vin(17 downto 0) & "0";
    con_v_vL_6 <= "00000000" & vin(17 downto 0) & "" when vin(17)='0' else "11111111" & vin(17 downto 0) & "";
    con_v_vL_7 <= "000000000" & vin(17 downto 1) & "" when vin(17)='0' else "111111111" & vin(17 downto 1) & "";
    con_v_vL_8 <= con_v_vL_0 + con_v_vL_1 + con_v_vL_2 + con_v_vL_3 + con_v_vL_4 + con_v_vL_5 + con_v_vL_6 + con_v_vL_7;
    con_v_vL <= con_v_vL_8(25 downto 8);

    -- nin * -0.125 : 00000000.0010000000    28bit
    con_n_0 <= "000" & nin(17 downto 0) & "0000000" when nin(17)='0' else "111" & nin(17 downto 0) & "0000000";
    con_n_1 <= not (con_n_0) + 1;
    con_n <= con_n_1(27 downto 10);

    -- vv * -0.02734375 : 00000000.0000011100    28bit
    coq_vv_vS_0 <= "000000" & vv(17 downto 0) & "0000" when vv(17)='0' else "111111" & vv(17 downto 0) & "0000";
    coq_vv_vS_1 <= "0000000" & vv(17 downto 0) & "000" when vv(17)='0' else "1111111" & vv(17 downto 0) & "000";
    coq_vv_vS_2 <= "00000000" & vv(17 downto 0) & "00" when vv(17)='0' else "11111111" & vv(17 downto 0) & "00";
    coq_vv_vS_3 <= not (coq_vv_vS_0 + coq_vv_vS_1 + coq_vv_vS_2) + 1;
    coq_vv_vS <= coq_vv_vS_3(27 downto 10);

    -- vv * -0.005859375 : 00000000.0000000110    28bit
    coq_vv_vL_0 <= "00000000" & vv(17 downto 0) & "00" when vv(17)='0' else "11111111" & vv(17 downto 0) & "00";
    coq_vv_vL_1 <= "000000000" & vv(17 downto 0) & "0" when vv(17)='0' else "111111111" & vv(17 downto 0) & "0";
    coq_vv_vL_2 <= not (coq_vv_vL_0 + coq_vv_vL_1) + 1;
    coq_vv_vL <= coq_vv_vL_2(27 downto 10);

    -- vin * -0.1953125 : 00000000.0011001000    28bit
    coq_v_vS_0 <= "000" & vin(17 downto 0) & "0000000" when vin(17)='0' else "111" & vin(17 downto 0) & "0000000";
    coq_v_vS_1 <= "0000" & vin(17 downto 0) & "000000" when vin(17)='0' else "1111" & vin(17 downto 0) & "000000";
    coq_v_vS_2 <= "0000000" & vin(17 downto 0) & "000" when vin(17)='0' else "1111111" & vin(17 downto 0) & "000";
    coq_v_vS_3 <= not (coq_v_vS_0 + coq_v_vS_1 + coq_v_vS_2) + 1;
    coq_v_vS <= coq_v_vS_3(27 downto 10);

    -- vin * -0.0068359375 : 00000000.0000000111    28bit
    coq_v_vL_0 <= "00000000" & vin(17 downto 0) & "00" when vin(17)='0' else "11111111" & vin(17 downto 0) & "00";
    coq_v_vL_1 <= "000000000" & vin(17 downto 0) & "0" when vin(17)='0' else "111111111" & vin(17 downto 0) & "0";
    coq_v_vL_2 <= "0000000000" & vin(17 downto 0) & "" when vin(17)='0' else "1111111111" & vin(17 downto 0) & "";
    coq_v_vL_3 <= not (coq_v_vL_0 + coq_v_vL_1 + coq_v_vL_2) + 1;
    coq_v_vL <= coq_v_vL_3(27 downto 10);

    -- qin * -0.005859375 : 00000000.0000000110    28bit
    coq_q_0 <= "00000000" & qin(17 downto 0) & "00" when qin(17)='0' else "11111111" & qin(17 downto 0) & "00";
    coq_q_1 <= "000000000" & qin(17 downto 0) & "0" when qin(17)='0' else "111111111" & qin(17 downto 0) & "0";
    coq_q_2 <= not (coq_q_0 + coq_q_1) + 1;
    coq_q <= coq_q_2(27 downto 10);

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
--cov_vv_vS=0.365234375
--cov_vv_vL=-1.044921875
--cov_v_vS=0.6904296875
--cov_v_vL=0.705078125
--cov_n=-0.0693359375
--cov_q=-0.0693359375
--cov_Istim=0.830078125
--con_vv_vS=-1.8056640625
--con_vv_vL=0.7646484375
--con_v_vS=-14.7822265625
--con_v_vL=1.685546875
--con_n=-0.125
--coq_vv_vS=-0.02734375
--coq_vv_vL=-0.005859375
--coq_v_vS=-0.1953125
--coq_v_vL=-0.0068359375
--coq_q=-0.005859375
--cos_s_vS=-0.203125
--cos_s_vL=-0.25
--cov_vS=-0.6904296875
--cov_vL=-0.689453125
--con_vS=-28.3447265625
--con_vL=-1.9677734375
--coq_vS=-0.3271484375
--coq_vL=0.0908203125
--cos_vL=0.25
--crf=0
--crg=-3.203125
--crh=-4.390625
--cIstim0=0.5
--cIstim1=0.6
--cIstim2=0.8
--vini=-3.2900390625
--nini=5.9697265625
--qini=8.3330078125
--vth=0