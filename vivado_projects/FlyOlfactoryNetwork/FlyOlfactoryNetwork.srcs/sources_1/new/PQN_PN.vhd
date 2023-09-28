library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.ALL;
entity PQN_PN is
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
end PQN_PN;
architecture Behavioral of PQN_PN is
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
    SIGNAL utf : STD_LOGIC_VECTOR(17 DOWNTO 0) := "000000100000000000"; --1.0

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
    SIGNAL coqleak_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL coqI0_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL coqIstim_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL coqIgj0_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL coqIgj1_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cos_s_vS_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cos_s_vL_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cov_vv_vS : std_logic_vector(17 downto 0);
    SIGNAL cov_vv_vS_0 : std_logic_vector(20 downto 0);
    SIGNAL cov_vv_vS_1 : std_logic_vector(20 downto 0);
    SIGNAL cov_vv_vS_2 : std_logic_vector(20 downto 0);
    SIGNAL cov_vv_vL : std_logic_vector(17 downto 0);
    SIGNAL cov_vv_vL_0 : std_logic_vector(27 downto 0);
    SIGNAL cov_vv_vL_1 : std_logic_vector(27 downto 0);
    SIGNAL cov_vv_vL_2 : std_logic_vector(27 downto 0);
    SIGNAL cov_v_vS : std_logic_vector(17 downto 0);
    SIGNAL cov_v_vS_0 : std_logic_vector(17 downto 0);
    SIGNAL cov_v_vS_1 : std_logic_vector(17 downto 0);
    SIGNAL cov_v_vS_2 : std_logic_vector(17 downto 0);
    SIGNAL cov_v_vL : std_logic_vector(17 downto 0);
    SIGNAL cov_v_vL_0 : std_logic_vector(17 downto 0);
    SIGNAL cov_v_vL_1 : std_logic_vector(17 downto 0);
    SIGNAL cov_v_vL_2 : std_logic_vector(17 downto 0);
    SIGNAL cov_n : std_logic_vector(17 downto 0);
    SIGNAL cov_n_0 : std_logic_vector(27 downto 0);
    SIGNAL cov_n_1 : std_logic_vector(27 downto 0);
    SIGNAL cov_n_2 : std_logic_vector(27 downto 0);
    SIGNAL cov_q : std_logic_vector(17 downto 0);
    SIGNAL cov_q_0 : std_logic_vector(27 downto 0);
    SIGNAL cov_q_1 : std_logic_vector(27 downto 0);
    SIGNAL cov_q_2 : std_logic_vector(27 downto 0);
    SIGNAL cov_Istim : std_logic_vector(17 downto 0);
    SIGNAL cov_Istim_0 : std_logic_vector(18 downto 0);
    SIGNAL cov_Istim_1 : std_logic_vector(18 downto 0);
    SIGNAL cov_Istim_2 : std_logic_vector(18 downto 0);
    SIGNAL con_vv_vS : std_logic_vector(17 downto 0);
    SIGNAL con_vv_vL : std_logic_vector(17 downto 0);
    SIGNAL con_v_vS : std_logic_vector(17 downto 0);
    SIGNAL con_v_vL : std_logic_vector(17 downto 0);
    SIGNAL con_v_vL_0 : std_logic_vector(21 downto 0);
    SIGNAL con_v_vL_1 : std_logic_vector(21 downto 0);
    SIGNAL con_v_vL_2 : std_logic_vector(21 downto 0);
    SIGNAL con_v_vL_3 : std_logic_vector(21 downto 0);
    SIGNAL con_n : std_logic_vector(17 downto 0);
    SIGNAL con_n_0 : std_logic_vector(27 downto 0);
    SIGNAL con_n_1 : std_logic_vector(27 downto 0);
    SIGNAL coq_vv_vS : std_logic_vector(17 downto 0);
    SIGNAL coq_vv_vL : std_logic_vector(17 downto 0);
    SIGNAL coq_v_vS : std_logic_vector(17 downto 0);
    SIGNAL coq_v_vL : std_logic_vector(17 downto 0);
    SIGNAL coq_q : std_logic_vector(17 downto 0);
    SIGNAL cos_s_vS : std_logic_vector(17 downto 0);
    SIGNAL cos_s_vS_0 : std_logic_vector(27 downto 0);
    SIGNAL cos_s_vS_1 : std_logic_vector(27 downto 0);
    SIGNAL cos_s_vS_2 : std_logic_vector(27 downto 0);
    SIGNAL cos_s_vS_3 : std_logic_vector(27 downto 0);
    SIGNAL cos_s_vL : std_logic_vector(17 downto 0);
    SIGNAL cos_s_vL_0 : std_logic_vector(27 downto 0);
    SIGNAL cos_s_vL_1 : std_logic_vector(27 downto 0);
    SIGNAL coIgj0 : std_logic_vector(17 downto 0);
    SIGNAL coIgj0_0 : std_logic_vector(27 downto 0);
    SIGNAL coIgj0_1 : std_logic_vector(27 downto 0);
    SIGNAL coIgj0_2 : std_logic_vector(27 downto 0);
    SIGNAL coIgj1 : std_logic_vector(17 downto 0);
    SIGNAL coIgj1_0 : std_logic_vector(25 downto 0);
    SIGNAL coIgj1_1 : std_logic_vector(25 downto 0);
    SIGNAL coIgj1_2 : std_logic_vector(25 downto 0);
    SIGNAL coqleak : std_logic_vector(17 downto 0);
    SIGNAL coqleak_0 : std_logic_vector(27 downto 0);
    SIGNAL coqleak_1 : std_logic_vector(27 downto 0);
    SIGNAL coqIstim : std_logic_vector(17 downto 0);
    SIGNAL coqIstim_0 : std_logic_vector(23 downto 0);
    SIGNAL coqIstim_1 : std_logic_vector(23 downto 0);
    SIGNAL coqIstim_2 : std_logic_vector(23 downto 0);
    SIGNAL cov_vS : std_logic_vector(17 downto 0):="111111101011000000";-- -1.3125
    SIGNAL cov_vL : std_logic_vector(17 downto 0):="111111101011000000";-- -1.3125
    SIGNAL con_vS : std_logic_vector(17 downto 0):="111111110010000000";-- -0.875
    SIGNAL con_vL : std_logic_vector(17 downto 0):="111111110010111000";-- -0.8203125
    SIGNAL coq_vS : std_logic_vector(17 downto 0):="000000000000000000";-- 0
    SIGNAL coq_vL : std_logic_vector(17 downto 0):="000000000000000000";-- 0
    SIGNAL cos_vL : std_logic_vector(17 downto 0):="000000000100000000";-- 0.25
    SIGNAL crf : std_logic_vector(17 downto 0):="000000000000000000";-- 0
    SIGNAL crg : std_logic_vector(17 downto 0):="111111111000000000";-- -0.5
    SIGNAL crh : std_logic_vector(17 downto 0):="000000000000000000";-- 0
    SIGNAL vini : std_logic_vector(17 downto 0):="111111000010001101";-- -3.8623046875
    SIGNAL nini : std_logic_vector(17 downto 0):="111111000110110101";-- -3.5732421875
    SIGNAL qini : std_logic_vector(17 downto 0):="111111001010000000";-- -3.375
    SIGNAL vth : std_logic_vector(17 downto 0):="000000000000000000";-- 0
    SIGNAL coqI0 : std_logic_vector(17 downto 0):="111111111111101000";-- -0.0234375

BEGIN
    updater : PROCESS (CLK)
    BEGIN
        IF (rising_edge(CLK)) THEN
            -- 1st stage
            I36 <= PORT_Iin * PORT_uin;
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
            cov_Istim_b0 <= cov_Istim;
            con_vv_vS_b0 <= con_vv_vS;
            con_vv_vL_b0 <= con_vv_vL;
            con_v_vS_b0 <= con_v_vS;
            con_v_vL_b0 <= con_v_vL;
            con_n_b0 <= con_n;
            coqleak_b0 <= coqleak;
            coqI0_b0 <= coqI0;
            coqIstim_b0 <= coqIstim;
            coqIgj0_b0 <= coIgj0;
            coqIgj1_b0 <= coIgj1;
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
                vout_b0 <= vin_b0 + cov_vv_vS_b0 + cov_v_vS_b0 + cov_vS + cov_n_b0 + cov_Istim_b0 + coqIgj0_b0;
            ELSE
                vout_b0 <= vin_b0 + cov_vv_vL_b0 + cov_v_vL_b0 + cov_vL + cov_n_b0 + cov_Istim_b0 + coqIgj0_b0;
            END IF;
            IF vin_b0 < crg THEN
                nout_b0 <= nin_b0 + con_vv_vS_b0 + con_v_vS_b0 + con_vS + con_n_b0;
            ELSE
                nout_b0 <= nin_b0 + con_vv_vL_b0 + con_v_vL_b0 + con_vL + con_n_b0;
            END IF;
            qout_b0 <= qin_b0 + coqleak_b0 + coqI0_b0 + coqIgj1_b0;
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
            IF(uout_b0 > 0)THEN
                PORT_uout <= uout_b0;
            ELSE
                PORT_uout <= "000000000000000000";
            END IF;
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
    I18 <= I36(27 downto 10 );
    Iin <= "000001000000000000" when I18>"000001000000000000" else "111111110000000000" when I18<"111111110000000000" else I18;

    vv <= vv36(27 downto 10 );
    -- vv * 0.1875 : 00000000.0011000000    21bit
    cov_vv_vS_0 <= "000" & vv(17 downto 0) & "" when vv(17)='0' else "111" & vv(17 downto 0) & "";
    cov_vv_vS_1 <= "0000" & vv(17 downto 1) & "" when vv(17)='0' else "1111" & vv(17 downto 1) & "";
    cov_vv_vS_2 <= cov_vv_vS_0 + cov_vv_vS_1;
    cov_vv_vS <= cov_vv_vS_2(20 downto 3);

    -- vv * -0.1875 : 00000000.0011000000    28bit
    cov_vv_vL_0 <= "000" & vv(17 downto 0) & "0000000" when vv(17)='0' else "111" & vv(17 downto 0) & "0000000";
    cov_vv_vL_1 <= "0000" & vv(17 downto 0) & "000000" when vv(17)='0' else "1111" & vv(17 downto 0) & "000000";
    cov_vv_vL_2 <= not (cov_vv_vL_0 + cov_vv_vL_1) + 1;
    cov_vv_vL <= cov_vv_vL_2(27 downto 10);

    -- vin * 1.125 : 00000001.0010000000    18bit
    cov_v_vS_0 <= vin & "";
    cov_v_vS_1 <= "000" & vin(17 downto 3) & "" when vin(17)='0' else "111" & vin(17 downto 3) & "";
    cov_v_vS_2 <= cov_v_vS_0 + cov_v_vS_1;
    cov_v_vS <= cov_v_vS_2(17 downto 0);

    -- vin * 1.125 : 00000001.0010000000    18bit
    cov_v_vL_0 <= vin & "";
    cov_v_vL_1 <= "000" & vin(17 downto 3) & "" when vin(17)='0' else "111" & vin(17 downto 3) & "";
    cov_v_vL_2 <= cov_v_vL_0 + cov_v_vL_1;
    cov_v_vL <= cov_v_vL_2(17 downto 0);

    -- nin * -0.75 : 00000000.1100000000    28bit
    cov_n_0 <= "0" & nin(17 downto 0) & "000000000" when nin(17)='0' else "1" & nin(17 downto 0) & "000000000";
    cov_n_1 <= "00" & nin(17 downto 0) & "00000000" when nin(17)='0' else "11" & nin(17 downto 0) & "00000000";
    cov_n_2 <= not (cov_n_0 + cov_n_1) + 1;
    cov_n <= cov_n_2(27 downto 10);

    -- qin * -0.75 : 00000000.1100000000    28bit
    cov_q_0 <= "0" & qin(17 downto 0) & "000000000" when qin(17)='0' else "1" & qin(17 downto 0) & "000000000";
    cov_q_1 <= "00" & qin(17 downto 0) & "00000000" when qin(17)='0' else "11" & qin(17 downto 0) & "00000000";
    cov_q_2 <= not (cov_q_0 + cov_q_1) + 1;
    cov_q <= cov_q_2(27 downto 10);

    -- Iin * 0.75 : 00000000.1100000000    19bit
    cov_Istim_0 <= "0" & Iin(17 downto 0) & "" when Iin(17)='0' else "1" & Iin(17 downto 0) & "";
    cov_Istim_1 <= "00" & Iin(17 downto 1) & "" when Iin(17)='0' else "11" & Iin(17 downto 1) & "";
    cov_Istim_2 <= cov_Istim_0 + cov_Istim_1;
    cov_Istim <= cov_Istim_2(18 downto 1);

    -- vv * 0.03125 : 00000000.0000100000    18bit
    con_vv_vS <= "00000" & vv(17 downto 5) when vv(17)='0' else "11111" & vv(17 downto 5);

    -- vv * 0.25 : 00000000.0100000000    18bit
    con_vv_vL <= "00" & vv(17 downto 2) when vv(17)='0' else "11" & vv(17 downto 2);

    -- vin * 0.125 : 00000000.0010000000    18bit
    con_v_vS <= "000" & vin(17 downto 3) when vin(17)='0' else "111" & vin(17 downto 3);

    -- vin * 0.34375 : 00000000.0101100000    22bit
    con_v_vL_0 <= "00" & vin(17 downto 0) & "00" when vin(17)='0' else "11" & vin(17 downto 0) & "00";
    con_v_vL_1 <= "0000" & vin(17 downto 0) & "" when vin(17)='0' else "1111" & vin(17 downto 0) & "";
    con_v_vL_2 <= "00000" & vin(17 downto 1) & "" when vin(17)='0' else "11111" & vin(17 downto 1) & "";
    con_v_vL_3 <= con_v_vL_0 + con_v_vL_1 + con_v_vL_2;
    con_v_vL <= con_v_vL_3(21 downto 4);

    -- nin * -0.25 : 00000000.0100000000    28bit
    con_n_0 <= "00" & nin(17 downto 0) & "00000000" when nin(17)='0' else "11" & nin(17 downto 0) & "00000000";
    con_n_1 <= not (con_n_0) + 1;
    con_n <= con_n_1(27 downto 10);

    -- vv * 0 : 00000000.0000000000    18bit
    coq_vv_vS <= "000000000000000000";

    -- vv * 0 : 00000000.0000000000    18bit
    coq_vv_vL <= "000000000000000000";

    -- vin * 0 : 00000000.0000000000    18bit
    coq_v_vS <= "000000000000000000";

    -- vin * 0 : 00000000.0000000000    18bit
    coq_v_vL <= "000000000000000000";

    -- qin * 0 : 00000000.0000000000    18bit
    coq_q <= "000000000000000000";

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

    -- vq * -0.375 : 00000000.0110000000    28bit
    coIgj0_0 <= "00" & vq(17 downto 0) & "00000000" when vq(17)='0' else "11" & vq(17 downto 0) & "00000000";
    coIgj0_1 <= "000" & vq(17 downto 0) & "0000000" when vq(17)='0' else "111" & vq(17 downto 0) & "0000000";
    coIgj0_2 <= not (coIgj0_0 + coIgj0_1) + 1;
    coIgj0 <= coIgj0_2(27 downto 10);

    -- vq * 0.005859375 : 00000000.0000000110    26bit
    coIgj1_0 <= "00000000" & vq(17 downto 0) & "" when vq(17)='0' else "11111111" & vq(17 downto 0) & "";
    coIgj1_1 <= "000000000" & vq(17 downto 1) & "" when vq(17)='0' else "111111111" & vq(17 downto 1) & "";
    coIgj1_2 <= coIgj1_0 + coIgj1_1;
    coIgj1 <= coIgj1_2(25 downto 8);

    -- qin * -0.0078125 : 00000000.0000001000    28bit
    coqleak_0 <= "0000000" & qin(17 downto 0) & "000" when qin(17)='0' else "1111111" & qin(17 downto 0) & "000";
    coqleak_1 <= not (coqleak_0) + 1;
    coqleak <= coqleak_1(27 downto 10);

    -- Iin * 0.0234375 : 00000000.0000011000    24bit
    coqIstim_0 <= "000000" & Iin(17 downto 0) & "" when Iin(17)='0' else "111111" & Iin(17 downto 0) & "";
    coqIstim_1 <= "0000000" & Iin(17 downto 1) & "" when Iin(17)='0' else "1111111" & Iin(17 downto 1) & "";
    coqIstim_2 <= coqIstim_0 + coqIstim_1;
    coqIstim <= coqIstim_2(23 downto 6);

    uout0 <= utf - (fcin(7 downto 0) & "0000000000"); --18bit
    uout1 <= "00000000" & uout0(17 downto 8) when uout0(17)='0' else "11111111" & uout0(17 downto 8);--1/128--for 300s
    
END Behavioral;
--cov_vv_vS=0.1875
--cov_vv_vL=-0.1875
--cov_v_vS=1.125
--cov_v_vL=1.125
--cov_n=-0.75
--cov_q=-0.75
--cov_Istim=0.75
--con_vv_vS=0.03125
--con_vv_vL=0.25
--con_v_vS=0.125
--con_v_vL=0.34375
--con_n=-0.25
--coq_vv_vS=0
--coq_vv_vL=0
--coq_v_vS=0
--coq_v_vL=0
--coq_q=0
--cos_s_vS=-0.203125
--cos_s_vL=-0.25
--coIgj0=-0.375
--coIgj1=0.005859375
--coqleak=-0.0078125
--coqIstim=0.0234375
--cov_vS=-1.3125
--cov_vL=-1.3125
--con_vS=-0.875
--con_vL=-0.8203125
--coq_vS=0
--coq_vL=0
--cos_vL=0.25
--crf=0
--crg=-0.5
--crh=0
--vini=-3.8623046875
--nini=-3.5732421875
--qini=-3.375
--vth=0
--coqI0=-0.0234375