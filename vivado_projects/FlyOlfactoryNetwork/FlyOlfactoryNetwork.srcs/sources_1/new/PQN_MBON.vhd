library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.ALL;
entity PQN_MBON is
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
end PQN_MBON;
architecture Behavioral of PQN_MBON is
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
    SIGNAL coqleak_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL coqI0_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL coqIstim_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL coqIgj0_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL coqIgj1_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cos_s_vS_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cos_s_vL_b0 : STD_LOGIC_VECTOR(17 DOWNTO 0) := (OTHERS => '0');
    SIGNAL cov_vv_vS : std_logic_vector(17 downto 0);
    SIGNAL cov_vv_vL : std_logic_vector(17 downto 0);
    SIGNAL cov_vv_vL_0 : std_logic_vector(27 downto 0);
    SIGNAL cov_vv_vL_1 : std_logic_vector(27 downto 0);
    SIGNAL cov_v_vS : std_logic_vector(17 downto 0);
    SIGNAL cov_v_vL : std_logic_vector(17 downto 0);
    SIGNAL cov_n : std_logic_vector(17 downto 0);
    SIGNAL cov_n_0 : std_logic_vector(27 downto 0);
    SIGNAL cov_n_1 : std_logic_vector(27 downto 0);
    SIGNAL cov_q : std_logic_vector(17 downto 0);
    SIGNAL cov_q_0 : std_logic_vector(27 downto 0);
    SIGNAL cov_q_1 : std_logic_vector(27 downto 0);
    SIGNAL cov_Istim : std_logic_vector(17 downto 0);
    SIGNAL con_vv_vS : std_logic_vector(17 downto 0);
    SIGNAL con_vv_vS_0 : std_logic_vector(27 downto 0);
    SIGNAL con_vv_vS_1 : std_logic_vector(27 downto 0);
    SIGNAL con_vv_vL : std_logic_vector(17 downto 0);
    SIGNAL con_v_vS : std_logic_vector(17 downto 0);
    SIGNAL con_v_vS_0 : std_logic_vector(27 downto 0);
    SIGNAL con_v_vS_1 : std_logic_vector(27 downto 0);
    SIGNAL con_v_vS_2 : std_logic_vector(27 downto 0);
    SIGNAL con_v_vL : std_logic_vector(17 downto 0);
    SIGNAL con_v_vL_0 : std_logic_vector(27 downto 0);
    SIGNAL con_v_vL_1 : std_logic_vector(27 downto 0);
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
    SIGNAL coIgj1 : std_logic_vector(17 downto 0);
    SIGNAL coqleak : std_logic_vector(17 downto 0);
    SIGNAL coqleak_0 : std_logic_vector(27 downto 0);
    SIGNAL coqleak_1 : std_logic_vector(27 downto 0);
    SIGNAL coqIstim : std_logic_vector(17 downto 0);
    SIGNAL cov_vS : std_logic_vector(17 downto 0):="111111110000110100";-- -0.95
    SIGNAL cov_vL : std_logic_vector(17 downto 0):="111111110000110100";-- -0.95
    SIGNAL con_vS : std_logic_vector(17 downto 0):="111111001110000000";-- -3.125
    SIGNAL con_vL : std_logic_vector(17 downto 0):="111111010000100000";-- -2.96875
    SIGNAL coq_vS : std_logic_vector(17 downto 0):="000000000000000000";-- 0
    SIGNAL coq_vL : std_logic_vector(17 downto 0):="000000000000000000";-- 0
    SIGNAL cos_vL : std_logic_vector(17 downto 0):="000000000100000000";-- 0.25
    SIGNAL crf : std_logic_vector(17 downto 0):="000000000000000000";-- 0
    SIGNAL crg : std_logic_vector(17 downto 0):="111111111000000000";-- -0.5
    SIGNAL crh : std_logic_vector(17 downto 0):="000000000000000000";-- 0
    SIGNAL vini : std_logic_vector(17 downto 0):="111111100111010010";-- -1.544921875
    SIGNAL nini : std_logic_vector(17 downto 0):="111110110111011111";-- -4.5322265625
    SIGNAL qini : std_logic_vector(17 downto 0):="111111100011010010";-- -1.794921875
    SIGNAL vth : std_logic_vector(17 downto 0):="000000000000000000";-- 0
    SIGNAL coqI0 : std_logic_vector(17 downto 0):="111111111111011100";-- -0.0359375

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
            cov_Istim_b0 <= cov_Istim;--
            con_vv_vS_b0 <= con_vv_vS;
            con_vv_vL_b0 <= con_vv_vL;
            con_v_vS_b0 <= con_v_vS;
            con_v_vL_b0 <= con_v_vL;
            con_n_b0 <= con_n;
            coqleak_b0 <= coqleak;
            coqI0_b0 <= coqI0;
            coqIstim_b0 <= coqIstim;--
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
    Iin <= "000000100000000000" when I18>"000000100000000000" else "111111111110000000" when I18<"111111111110000000" else I18;
    vv <= vv36(27 downto 10 );
    -- vv * 0.25 : 00000000.0100000000    18bit
    cov_vv_vS <= "00" & vv(17 downto 2) when vv(17)='0' else "11" & vv(17 downto 2);

    -- vv * -0.0625 : 00000000.0001000000    28bit
    cov_vv_vL_0 <= "0000" & vv(17 downto 0) & "000000" when vv(17)='0' else "1111" & vv(17 downto 0) & "000000";
    cov_vv_vL_1 <= not (cov_vv_vL_0) + 1;
    cov_vv_vL <= cov_vv_vL_1(27 downto 10);

    -- vin * 0.5 : 00000000.1000000000    18bit
    cov_v_vS <= "0" & vin(17 downto 1) when vin(17)='0' else "1" & vin(17 downto 1);

    -- vin * 0.5 : 00000000.1000000000    18bit
    cov_v_vL <= "0" & vin(17 downto 1) when vin(17)='0' else "1" & vin(17 downto 1);

    -- nin * -0.25 : 00000000.0100000000    28bit
    cov_n_0 <= "00" & nin(17 downto 0) & "00000000" when nin(17)='0' else "11" & nin(17 downto 0) & "00000000";
    cov_n_1 <= not (cov_n_0) + 1;
    cov_n <= cov_n_1(27 downto 10);

    -- qin * -0.25 : 00000000.0100000000    28bit
    cov_q_0 <= "00" & qin(17 downto 0) & "00000000" when qin(17)='0' else "11" & qin(17 downto 0) & "00000000";
    cov_q_1 <= not (cov_q_0) + 1;
    cov_q <= cov_q_1(27 downto 10);

    -- Iin * 1.0 : 00000001.0000000000    18bit
    cov_Istim <= Iin;

    -- vv * -0.125 : 00000000.0010000000    28bit
    con_vv_vS_0 <= "000" & vv(17 downto 0) & "0000000" when vv(17)='0' else "111" & vv(17 downto 0) & "0000000";
    con_vv_vS_1 <= not (con_vv_vS_0) + 1;
    con_vv_vS <= con_vv_vS_1(27 downto 10);

    -- vv * 0.5 : 00000000.1000000000    18bit
    con_vv_vL <= "0" & vv(17 downto 1) when vv(17)='0' else "1" & vv(17 downto 1);

    -- vin * -0.75 : 00000000.1100000000    28bit
    con_v_vS_0 <= "0" & vin(17 downto 0) & "000000000" when vin(17)='0' else "1" & vin(17 downto 0) & "000000000";
    con_v_vS_1 <= "00" & vin(17 downto 0) & "00000000" when vin(17)='0' else "11" & vin(17 downto 0) & "00000000";
    con_v_vS_2 <= not (con_v_vS_0 + con_v_vS_1) + 1;
    con_v_vS <= con_v_vS_2(27 downto 10);

    -- vin * -0.125 : 00000000.0010000000    28bit
    con_v_vL_0 <= "000" & vin(17 downto 0) & "0000000" when vin(17)='0' else "111" & vin(17 downto 0) & "0000000";
    con_v_vL_1 <= not (con_v_vL_0) + 1;
    con_v_vL <= con_v_vL_1(27 downto 10);

    -- nin * -0.5 : 00000000.1000000000    28bit
    con_n_0 <= "0" & nin(17 downto 0) & "000000000" when nin(17)='0' else "1" & nin(17 downto 0) & "000000000";
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

    -- vq * -0.03125 : 00000000.0000100000    28bit
    coIgj0_0 <= "00000" & vq(17 downto 0) & "00000" when vq(17)='0' else "11111" & vq(17 downto 0) & "00000";
    coIgj0_1 <= not (coIgj0_0) + 1;
    coIgj0 <= coIgj0_1(27 downto 10);

    -- vq * 0.03125 : 00000000.0000100000    18bit
    coIgj1 <= "00000" & vq(17 downto 5) when vq(17)='0' else "11111" & vq(17 downto 5);

    -- qin * -0.015625 : 00000000.0000010000    28bit
    coqleak_0 <= "000000" & qin(17 downto 0) & "0000" when qin(17)='0' else "111111" & qin(17 downto 0) & "0000";
    coqleak_1 <= not (coqleak_0) + 1;
    coqleak <= coqleak_1(27 downto 10);

    -- Iin * 0.0625 : 00000000.0001000000    18bit
    coqIstim <= "0000" & Iin(17 downto 4) when Iin(17)='0' else "1111" & Iin(17 downto 4);

    uout0 <= utf - (fcin(7 downto 0) & "0000000000"); --18bit
    uout1 <= "0000000" & uout0(17 downto 7) when uout0(17)='0' else "1111111" & uout0(17 downto 7);--1/128

END Behavioral;
--cov_vv_vS=0.25
--cov_vv_vL=-0.0625
--cov_v_vS=0.5
--cov_v_vL=0.5
--cov_n=-0.25
--cov_q=-0.25
--cov_Istim=1.0
--con_vv_vS=-0.125
--con_vv_vL=0.5
--con_v_vS=-0.75
--con_v_vL=-0.125
--con_n=-0.5
--coq_vv_vS=0
--coq_vv_vL=0
--coq_v_vS=0
--coq_v_vL=0
--coq_q=0
--cos_s_vS=-0.203125
--cos_s_vL=-0.25
--coIgj0=-0.03125
--coIgj1=0.03125
--coqleak=-0.015625
--coqIstim=0.0625
--cov_vS=-0.95
--cov_vL=-0.95
--con_vS=-3.125
--con_vL=-2.96875
--coq_vS=0
--coq_vL=0
--cos_vL=0.25
--crf=0
--crg=-0.5
--crh=0
--vini=-1.544921875
--nini=-4.5322265625
--qini=-1.794921875
--vth=0
--coqI0=-0.0359375