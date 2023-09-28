-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Thu Aug 24 01:49:18 2023
-- Host        : DESKTOP-GD656IR running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               D:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/FlyOlfactoryNetwork/FlyOlfactoryNetwork.srcs/sources_1/ip/blk_mem_weight_KC_APLMBONa3/blk_mem_weight_KC_APLMBONa3_sim_netlist.vhdl
-- Design      : blk_mem_weight_KC_APLMBONa3
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity blk_mem_weight_KC_APLMBONa3_blk_mem_gen_prim_wrapper_init is
  port (
    douta : out STD_LOGIC_VECTOR ( 0 to 0 );
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_prim_wrapper_init : entity is "blk_mem_gen_prim_wrapper_init";
end blk_mem_weight_KC_APLMBONa3_blk_mem_gen_prim_wrapper_init;

architecture STRUCTURE of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_prim_wrapper_init is
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_12\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_13\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_14\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 15 downto 4 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram\ : label is "PRIMITIVE";
begin
\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram\: unisim.vcomponents.RAMB18E1
    generic map(
      DOA_REG => 1,
      DOB_REG => 0,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"1111111111011111111111111111011111111111111111111111111110111111",
      INIT_01 => X"1111111111111111111111111111111111111111111111111101111111111111",
      INIT_02 => X"1111111111111111111111111111111111111111111111111111111111101111",
      INIT_03 => X"1111111011111111111011111111111111111111111111111111111111111111",
      INIT_04 => X"1111111111111111111111111111111111111111111111111111111111111111",
      INIT_05 => X"1111111111111111111111111111111111101111111111111111111111111111",
      INIT_06 => X"1111111111111111111111111111111111111111111111111111111111111111",
      INIT_07 => X"1011111111111111110111111111111111111111111111111111111111111111",
      INIT_08 => X"1011111111111111111111111111111111111111111111111111111111111111",
      INIT_09 => X"1111111111111111111111111111111111111111111111111111111111111111",
      INIT_0A => X"1111111111111111111111111111111101110111111111111111111111111111",
      INIT_0B => X"1111111111111111111111111111100111111111111111111111111111111111",
      INIT_0C => X"1110111111111111111111111111111111111111111111111111111111111101",
      INIT_0D => X"1111011111111111111111111111111111111111111111111111111111111111",
      INIT_0E => X"1111111111111111111111111111111111111111111111111111111111111111",
      INIT_0F => X"1111111111111111111111111111111111111111111111111111111111111111",
      INIT_10 => X"1111111111111111111111111111111111111111111111111111111111111111",
      INIT_11 => X"1111111111111111111111111111111111111111111111111111111111111111",
      INIT_12 => X"1111111101111111111111111111111111111111111111011111111111111111",
      INIT_13 => X"1111111111111111111111111111111111111111111111111111111111111111",
      INIT_14 => X"1111111111111111111111111111111111111111111111111111111111111111",
      INIT_15 => X"1111111111111111110111111111111111111111111111111111111111111111",
      INIT_16 => X"1111111111111111111111111111111111111111111111111111111111111111",
      INIT_17 => X"1111111111111111111111111111111001111011111111111111111111111111",
      INIT_18 => X"1111111111111111111011111001111111111111111011111111111111111111",
      INIT_19 => X"1111111111111111111111111111111111111111111111111111111111111111",
      INIT_1A => X"1111111111111111111111111111111111111111111111111111111111111111",
      INIT_1B => X"1111111111111111111111111111111111111111111111101111111111111111",
      INIT_1C => X"1111111111111111111111111111111111111111111111111111101111111111",
      INIT_1D => X"0111111111111111101111111111111111111111111111111111111111111111",
      INIT_1E => X"1101111111111111111111110011111100111110010001111111101111110001",
      INIT_1F => X"1000000000000111110001111111111011111110011100111110000111111110",
      INIT_20 => X"1100111000000100000000000000000110100011111100000001111101111100",
      INIT_21 => X"0000001000011111011011010000111000000000000000000000000000000001",
      INIT_22 => X"0000000000000000000101000110111101100001110000000000000000000000",
      INIT_23 => X"1001000010101011000101010000000000001000000010011011001100000000",
      INIT_24 => X"0010000001011101011010000000000000000000000000010000000000000100",
      INIT_25 => X"0010000100010100011100000000000000000001010000100010000100000000",
      INIT_26 => X"1110010000000110000000000000000011111100111111000100010010000010",
      INIT_27 => X"1010111010001001010001000000010011001000000000011011110010100111",
      INIT_28 => X"1101000000000001011100001000011111110100011011100000000000000000",
      INIT_29 => X"1011111110101110011010010110011110010000111100110110000000001100",
      INIT_2A => X"1111001011100110110111011011101111111111111010000001011101110111",
      INIT_2B => X"0111111110010011111101101101011111101010000111000011101110101110",
      INIT_2C => X"0000000111010000000000101000000000000001110000000111110101111111",
      INIT_2D => X"0000000000000000001111000000011101000000000001010100000000000000",
      INIT_2E => X"0000000000000000000000010000000001000000000000000000000000000000",
      INIT_2F => X"0000000001000000010000000000000000000000000000000000000000000000",
      INIT_30 => X"0111011111111111011000000000000000000000000110110110011001100101",
      INIT_31 => X"0111111000011000111000110110000010111110010000000111001010111110",
      INIT_32 => X"0001001111111101101000000000000000001100000000000000000000000000",
      INIT_33 => X"0000100000111110000100001011101000000000000001100001110000000000",
      INIT_34 => X"1101100010110100000000000000010001100000000000000000000110001101",
      INIT_35 => X"0011100000000001100000001110100011001110000001001011110000010001",
      INIT_36 => X"1000010011111000000011011010011001010011000110001100000000000001",
      INIT_37 => X"0011110000101000000100010000111101100000000000000000000001000001",
      INIT_38 => X"0010001000111110000000001000000001000001010100000000010000000000",
      INIT_39 => X"0111000011000101000000101000000001000110000010001001010001000000",
      INIT_3A => X"0010111100001101000110000110000000000010000000000010001010000001",
      INIT_3B => X"0000100000000011001001110100001010100001000000000100011111000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"00000",
      INIT_B => X"00000",
      INIT_FILE => "NONE",
      IS_CLKARDCLK_INVERTED => '0',
      IS_CLKBWRCLK_INVERTED => '0',
      IS_ENARDEN_INVERTED => '0',
      IS_ENBWREN_INVERTED => '0',
      IS_RSTRAMARSTRAM_INVERTED => '0',
      IS_RSTRAMB_INVERTED => '0',
      IS_RSTREGARSTREG_INVERTED => '0',
      IS_RSTREGB_INVERTED => '0',
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "PERFORMANCE",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      RSTREG_PRIORITY_A => "REGCE",
      RSTREG_PRIORITY_B => "REGCE",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4
    )
        port map (
      ADDRARDADDR(13 downto 2) => addra(11 downto 0),
      ADDRARDADDR(1 downto 0) => B"00",
      ADDRBWRADDR(13 downto 0) => B"00000000000000",
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DIADI(15 downto 0) => B"0000000000000000",
      DIBDI(15 downto 0) => B"0000000000000000",
      DIPADIP(1 downto 0) => B"00",
      DIPBDIP(1 downto 0) => B"00",
      DOADO(15 downto 4) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED\(15 downto 4),
      DOADO(3) => \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_12\,
      DOADO(2) => \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_13\,
      DOADO(1) => \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_14\,
      DOADO(0) => douta(0),
      DOBDO(15 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED\(15 downto 0),
      DOPADOP(1 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED\(1 downto 0),
      DOPBDOP(1 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED\(1 downto 0),
      ENARDEN => '1',
      ENBWREN => '0',
      REGCEAREGCE => '1',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity blk_mem_weight_KC_APLMBONa3_blk_mem_gen_prim_width is
  port (
    douta : out STD_LOGIC_VECTOR ( 0 to 0 );
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_prim_width : entity is "blk_mem_gen_prim_width";
end blk_mem_weight_KC_APLMBONa3_blk_mem_gen_prim_width;

architecture STRUCTURE of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_prim_width is
begin
\prim_init.ram\: entity work.blk_mem_weight_KC_APLMBONa3_blk_mem_gen_prim_wrapper_init
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      clka => clka,
      douta(0) => douta(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity blk_mem_weight_KC_APLMBONa3_blk_mem_gen_generic_cstr is
  port (
    douta : out STD_LOGIC_VECTOR ( 0 to 0 );
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_generic_cstr : entity is "blk_mem_gen_generic_cstr";
end blk_mem_weight_KC_APLMBONa3_blk_mem_gen_generic_cstr;

architecture STRUCTURE of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_generic_cstr is
begin
\ramloop[0].ram.r\: entity work.blk_mem_weight_KC_APLMBONa3_blk_mem_gen_prim_width
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      clka => clka,
      douta(0) => douta(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity blk_mem_weight_KC_APLMBONa3_blk_mem_gen_top is
  port (
    douta : out STD_LOGIC_VECTOR ( 0 to 0 );
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_top : entity is "blk_mem_gen_top";
end blk_mem_weight_KC_APLMBONa3_blk_mem_gen_top;

architecture STRUCTURE of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_top is
begin
\valid.cstr\: entity work.blk_mem_weight_KC_APLMBONa3_blk_mem_gen_generic_cstr
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      clka => clka,
      douta(0) => douta(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5_synth is
  port (
    douta : out STD_LOGIC_VECTOR ( 0 to 0 );
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5_synth : entity is "blk_mem_gen_v8_3_5_synth";
end blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5_synth;

architecture STRUCTURE of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5_synth is
begin
\gnbram.gnativebmg.native_blk_mem_gen\: entity work.blk_mem_weight_KC_APLMBONa3_blk_mem_gen_top
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      clka => clka,
      douta(0) => douta(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 is
  port (
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    regcea : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 0 to 0 );
    douta : out STD_LOGIC_VECTOR ( 0 to 0 );
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    regceb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 0 to 0 );
    doutb : out STD_LOGIC_VECTOR ( 0 to 0 );
    injectsbiterr : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    eccpipece : in STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC;
    rdaddrecc : out STD_LOGIC_VECTOR ( 11 downto 0 );
    sleep : in STD_LOGIC;
    deepsleep : in STD_LOGIC;
    shutdown : in STD_LOGIC;
    rsta_busy : out STD_LOGIC;
    rstb_busy : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_injectsbiterr : in STD_LOGIC;
    s_axi_injectdbiterr : in STD_LOGIC;
    s_axi_sbiterr : out STD_LOGIC;
    s_axi_dbiterr : out STD_LOGIC;
    s_axi_rdaddrecc : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute C_ADDRA_WIDTH : integer;
  attribute C_ADDRA_WIDTH of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 12;
  attribute C_ADDRB_WIDTH : integer;
  attribute C_ADDRB_WIDTH of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 12;
  attribute C_ALGORITHM : integer;
  attribute C_ALGORITHM of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 1;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 4;
  attribute C_AXI_SLAVE_TYPE : integer;
  attribute C_AXI_SLAVE_TYPE of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 1;
  attribute C_BYTE_SIZE : integer;
  attribute C_BYTE_SIZE of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 9;
  attribute C_COMMON_CLK : integer;
  attribute C_COMMON_CLK of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_COUNT_18K_BRAM : string;
  attribute C_COUNT_18K_BRAM of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is "1";
  attribute C_COUNT_36K_BRAM : string;
  attribute C_COUNT_36K_BRAM of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is "0";
  attribute C_CTRL_ECC_ALGO : string;
  attribute C_CTRL_ECC_ALGO of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is "NONE";
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is "0";
  attribute C_DISABLE_WARN_BHV_COLL : integer;
  attribute C_DISABLE_WARN_BHV_COLL of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_DISABLE_WARN_BHV_RANGE : integer;
  attribute C_DISABLE_WARN_BHV_RANGE of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is "./";
  attribute C_ENABLE_32BIT_ADDRESS : integer;
  attribute C_ENABLE_32BIT_ADDRESS of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_EN_DEEPSLEEP_PIN : integer;
  attribute C_EN_DEEPSLEEP_PIN of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_EN_ECC_PIPE : integer;
  attribute C_EN_ECC_PIPE of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_EN_RDADDRA_CHG : integer;
  attribute C_EN_RDADDRA_CHG of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_EN_RDADDRB_CHG : integer;
  attribute C_EN_RDADDRB_CHG of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_EN_SHUTDOWN_PIN : integer;
  attribute C_EN_SHUTDOWN_PIN of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_EN_SLEEP_PIN : integer;
  attribute C_EN_SLEEP_PIN of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_EST_POWER_SUMMARY : string;
  attribute C_EST_POWER_SUMMARY of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is "Estimated Power for IP     :     1.0552 mW";
  attribute C_FAMILY : string;
  attribute C_FAMILY of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is "artix7";
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_HAS_ENA : integer;
  attribute C_HAS_ENA of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_HAS_ENB : integer;
  attribute C_HAS_ENB of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_HAS_INJECTERR : integer;
  attribute C_HAS_INJECTERR of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_HAS_MEM_OUTPUT_REGS_A : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_A of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 1;
  attribute C_HAS_MEM_OUTPUT_REGS_B : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_B of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_A : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_A of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_B : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_B of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_HAS_REGCEA : integer;
  attribute C_HAS_REGCEA of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_HAS_REGCEB : integer;
  attribute C_HAS_REGCEB of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_HAS_RSTA : integer;
  attribute C_HAS_RSTA of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_HAS_RSTB : integer;
  attribute C_HAS_RSTB of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_HAS_SOFTECC_INPUT_REGS_A : integer;
  attribute C_HAS_SOFTECC_INPUT_REGS_A of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B : integer;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_INITA_VAL : string;
  attribute C_INITA_VAL of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is "0";
  attribute C_INITB_VAL : string;
  attribute C_INITB_VAL of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is "0";
  attribute C_INIT_FILE : string;
  attribute C_INIT_FILE of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is "blk_mem_weight_KC_APLMBONa3.mem";
  attribute C_INIT_FILE_NAME : string;
  attribute C_INIT_FILE_NAME of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is "blk_mem_weight_KC_APLMBONa3.mif";
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_LOAD_INIT_FILE : integer;
  attribute C_LOAD_INIT_FILE of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 1;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 3;
  attribute C_MUX_PIPELINE_STAGES : integer;
  attribute C_MUX_PIPELINE_STAGES of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_PRIM_TYPE : integer;
  attribute C_PRIM_TYPE of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 1;
  attribute C_READ_DEPTH_A : integer;
  attribute C_READ_DEPTH_A of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 3838;
  attribute C_READ_DEPTH_B : integer;
  attribute C_READ_DEPTH_B of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 3838;
  attribute C_READ_WIDTH_A : integer;
  attribute C_READ_WIDTH_A of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 1;
  attribute C_READ_WIDTH_B : integer;
  attribute C_READ_WIDTH_B of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 1;
  attribute C_RSTRAM_A : integer;
  attribute C_RSTRAM_A of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_RSTRAM_B : integer;
  attribute C_RSTRAM_B of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_RST_PRIORITY_A : string;
  attribute C_RST_PRIORITY_A of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is "CE";
  attribute C_RST_PRIORITY_B : string;
  attribute C_RST_PRIORITY_B of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is "CE";
  attribute C_SIM_COLLISION_CHECK : string;
  attribute C_SIM_COLLISION_CHECK of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is "ALL";
  attribute C_USE_BRAM_BLOCK : integer;
  attribute C_USE_BRAM_BLOCK of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_USE_BYTE_WEA : integer;
  attribute C_USE_BYTE_WEA of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_USE_BYTE_WEB : integer;
  attribute C_USE_BYTE_WEB of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_USE_DEFAULT_DATA : integer;
  attribute C_USE_DEFAULT_DATA of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_USE_SOFTECC : integer;
  attribute C_USE_SOFTECC of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_USE_URAM : integer;
  attribute C_USE_URAM of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 0;
  attribute C_WEA_WIDTH : integer;
  attribute C_WEA_WIDTH of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 1;
  attribute C_WEB_WIDTH : integer;
  attribute C_WEB_WIDTH of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 1;
  attribute C_WRITE_DEPTH_A : integer;
  attribute C_WRITE_DEPTH_A of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 3838;
  attribute C_WRITE_DEPTH_B : integer;
  attribute C_WRITE_DEPTH_B of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 3838;
  attribute C_WRITE_MODE_A : string;
  attribute C_WRITE_MODE_A of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is "WRITE_FIRST";
  attribute C_WRITE_MODE_B : string;
  attribute C_WRITE_MODE_B of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is "WRITE_FIRST";
  attribute C_WRITE_WIDTH_A : integer;
  attribute C_WRITE_WIDTH_A of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 1;
  attribute C_WRITE_WIDTH_B : integer;
  attribute C_WRITE_WIDTH_B of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is 1;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is "artix7";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is "blk_mem_gen_v8_3_5";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 : entity is "yes";
end blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5;

architecture STRUCTURE of blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5 is
  signal \<const0>\ : STD_LOGIC;
begin
  dbiterr <= \<const0>\;
  doutb(0) <= \<const0>\;
  rdaddrecc(11) <= \<const0>\;
  rdaddrecc(10) <= \<const0>\;
  rdaddrecc(9) <= \<const0>\;
  rdaddrecc(8) <= \<const0>\;
  rdaddrecc(7) <= \<const0>\;
  rdaddrecc(6) <= \<const0>\;
  rdaddrecc(5) <= \<const0>\;
  rdaddrecc(4) <= \<const0>\;
  rdaddrecc(3) <= \<const0>\;
  rdaddrecc(2) <= \<const0>\;
  rdaddrecc(1) <= \<const0>\;
  rdaddrecc(0) <= \<const0>\;
  rsta_busy <= \<const0>\;
  rstb_busy <= \<const0>\;
  s_axi_arready <= \<const0>\;
  s_axi_awready <= \<const0>\;
  s_axi_bid(3) <= \<const0>\;
  s_axi_bid(2) <= \<const0>\;
  s_axi_bid(1) <= \<const0>\;
  s_axi_bid(0) <= \<const0>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_bvalid <= \<const0>\;
  s_axi_dbiterr <= \<const0>\;
  s_axi_rdaddrecc(11) <= \<const0>\;
  s_axi_rdaddrecc(10) <= \<const0>\;
  s_axi_rdaddrecc(9) <= \<const0>\;
  s_axi_rdaddrecc(8) <= \<const0>\;
  s_axi_rdaddrecc(7) <= \<const0>\;
  s_axi_rdaddrecc(6) <= \<const0>\;
  s_axi_rdaddrecc(5) <= \<const0>\;
  s_axi_rdaddrecc(4) <= \<const0>\;
  s_axi_rdaddrecc(3) <= \<const0>\;
  s_axi_rdaddrecc(2) <= \<const0>\;
  s_axi_rdaddrecc(1) <= \<const0>\;
  s_axi_rdaddrecc(0) <= \<const0>\;
  s_axi_rdata(0) <= \<const0>\;
  s_axi_rid(3) <= \<const0>\;
  s_axi_rid(2) <= \<const0>\;
  s_axi_rid(1) <= \<const0>\;
  s_axi_rid(0) <= \<const0>\;
  s_axi_rlast <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
  s_axi_rvalid <= \<const0>\;
  s_axi_sbiterr <= \<const0>\;
  s_axi_wready <= \<const0>\;
  sbiterr <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst_blk_mem_gen: entity work.blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5_synth
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      clka => clka,
      douta(0) => douta(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity blk_mem_weight_KC_APLMBONa3 is
  port (
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of blk_mem_weight_KC_APLMBONa3 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of blk_mem_weight_KC_APLMBONa3 : entity is "blk_mem_weight_KC_APLMBONa3,blk_mem_gen_v8_3_5,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of blk_mem_weight_KC_APLMBONa3 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of blk_mem_weight_KC_APLMBONa3 : entity is "blk_mem_gen_v8_3_5,Vivado 2016.4";
end blk_mem_weight_KC_APLMBONa3;

architecture STRUCTURE of blk_mem_weight_KC_APLMBONa3 is
  signal NLW_U0_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rsta_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rstb_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_doutb_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_rdaddrecc_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_U0_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_rdaddrecc_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_U0_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute C_ADDRA_WIDTH : integer;
  attribute C_ADDRA_WIDTH of U0 : label is 12;
  attribute C_ADDRB_WIDTH : integer;
  attribute C_ADDRB_WIDTH of U0 : label is 12;
  attribute C_ALGORITHM : integer;
  attribute C_ALGORITHM of U0 : label is 1;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of U0 : label is 4;
  attribute C_AXI_SLAVE_TYPE : integer;
  attribute C_AXI_SLAVE_TYPE of U0 : label is 0;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of U0 : label is 1;
  attribute C_BYTE_SIZE : integer;
  attribute C_BYTE_SIZE of U0 : label is 9;
  attribute C_COMMON_CLK : integer;
  attribute C_COMMON_CLK of U0 : label is 0;
  attribute C_COUNT_18K_BRAM : string;
  attribute C_COUNT_18K_BRAM of U0 : label is "1";
  attribute C_COUNT_36K_BRAM : string;
  attribute C_COUNT_36K_BRAM of U0 : label is "0";
  attribute C_CTRL_ECC_ALGO : string;
  attribute C_CTRL_ECC_ALGO of U0 : label is "NONE";
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of U0 : label is "0";
  attribute C_DISABLE_WARN_BHV_COLL : integer;
  attribute C_DISABLE_WARN_BHV_COLL of U0 : label is 0;
  attribute C_DISABLE_WARN_BHV_RANGE : integer;
  attribute C_DISABLE_WARN_BHV_RANGE of U0 : label is 0;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of U0 : label is "./";
  attribute C_ENABLE_32BIT_ADDRESS : integer;
  attribute C_ENABLE_32BIT_ADDRESS of U0 : label is 0;
  attribute C_EN_DEEPSLEEP_PIN : integer;
  attribute C_EN_DEEPSLEEP_PIN of U0 : label is 0;
  attribute C_EN_ECC_PIPE : integer;
  attribute C_EN_ECC_PIPE of U0 : label is 0;
  attribute C_EN_RDADDRA_CHG : integer;
  attribute C_EN_RDADDRA_CHG of U0 : label is 0;
  attribute C_EN_RDADDRB_CHG : integer;
  attribute C_EN_RDADDRB_CHG of U0 : label is 0;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of U0 : label is 0;
  attribute C_EN_SHUTDOWN_PIN : integer;
  attribute C_EN_SHUTDOWN_PIN of U0 : label is 0;
  attribute C_EN_SLEEP_PIN : integer;
  attribute C_EN_SLEEP_PIN of U0 : label is 0;
  attribute C_EST_POWER_SUMMARY : string;
  attribute C_EST_POWER_SUMMARY of U0 : label is "Estimated Power for IP     :     1.0552 mW";
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "artix7";
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of U0 : label is 0;
  attribute C_HAS_ENA : integer;
  attribute C_HAS_ENA of U0 : label is 0;
  attribute C_HAS_ENB : integer;
  attribute C_HAS_ENB of U0 : label is 0;
  attribute C_HAS_INJECTERR : integer;
  attribute C_HAS_INJECTERR of U0 : label is 0;
  attribute C_HAS_MEM_OUTPUT_REGS_A : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_A of U0 : label is 1;
  attribute C_HAS_MEM_OUTPUT_REGS_B : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_B of U0 : label is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_A : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_A of U0 : label is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_B : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_B of U0 : label is 0;
  attribute C_HAS_REGCEA : integer;
  attribute C_HAS_REGCEA of U0 : label is 0;
  attribute C_HAS_REGCEB : integer;
  attribute C_HAS_REGCEB of U0 : label is 0;
  attribute C_HAS_RSTA : integer;
  attribute C_HAS_RSTA of U0 : label is 0;
  attribute C_HAS_RSTB : integer;
  attribute C_HAS_RSTB of U0 : label is 0;
  attribute C_HAS_SOFTECC_INPUT_REGS_A : integer;
  attribute C_HAS_SOFTECC_INPUT_REGS_A of U0 : label is 0;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B : integer;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B of U0 : label is 0;
  attribute C_INITA_VAL : string;
  attribute C_INITA_VAL of U0 : label is "0";
  attribute C_INITB_VAL : string;
  attribute C_INITB_VAL of U0 : label is "0";
  attribute C_INIT_FILE : string;
  attribute C_INIT_FILE of U0 : label is "blk_mem_weight_KC_APLMBONa3.mem";
  attribute C_INIT_FILE_NAME : string;
  attribute C_INIT_FILE_NAME of U0 : label is "blk_mem_weight_KC_APLMBONa3.mif";
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of U0 : label is 0;
  attribute C_LOAD_INIT_FILE : integer;
  attribute C_LOAD_INIT_FILE of U0 : label is 1;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 3;
  attribute C_MUX_PIPELINE_STAGES : integer;
  attribute C_MUX_PIPELINE_STAGES of U0 : label is 0;
  attribute C_PRIM_TYPE : integer;
  attribute C_PRIM_TYPE of U0 : label is 1;
  attribute C_READ_DEPTH_A : integer;
  attribute C_READ_DEPTH_A of U0 : label is 3838;
  attribute C_READ_DEPTH_B : integer;
  attribute C_READ_DEPTH_B of U0 : label is 3838;
  attribute C_READ_WIDTH_A : integer;
  attribute C_READ_WIDTH_A of U0 : label is 1;
  attribute C_READ_WIDTH_B : integer;
  attribute C_READ_WIDTH_B of U0 : label is 1;
  attribute C_RSTRAM_A : integer;
  attribute C_RSTRAM_A of U0 : label is 0;
  attribute C_RSTRAM_B : integer;
  attribute C_RSTRAM_B of U0 : label is 0;
  attribute C_RST_PRIORITY_A : string;
  attribute C_RST_PRIORITY_A of U0 : label is "CE";
  attribute C_RST_PRIORITY_B : string;
  attribute C_RST_PRIORITY_B of U0 : label is "CE";
  attribute C_SIM_COLLISION_CHECK : string;
  attribute C_SIM_COLLISION_CHECK of U0 : label is "ALL";
  attribute C_USE_BRAM_BLOCK : integer;
  attribute C_USE_BRAM_BLOCK of U0 : label is 0;
  attribute C_USE_BYTE_WEA : integer;
  attribute C_USE_BYTE_WEA of U0 : label is 0;
  attribute C_USE_BYTE_WEB : integer;
  attribute C_USE_BYTE_WEB of U0 : label is 0;
  attribute C_USE_DEFAULT_DATA : integer;
  attribute C_USE_DEFAULT_DATA of U0 : label is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of U0 : label is 0;
  attribute C_USE_SOFTECC : integer;
  attribute C_USE_SOFTECC of U0 : label is 0;
  attribute C_USE_URAM : integer;
  attribute C_USE_URAM of U0 : label is 0;
  attribute C_WEA_WIDTH : integer;
  attribute C_WEA_WIDTH of U0 : label is 1;
  attribute C_WEB_WIDTH : integer;
  attribute C_WEB_WIDTH of U0 : label is 1;
  attribute C_WRITE_DEPTH_A : integer;
  attribute C_WRITE_DEPTH_A of U0 : label is 3838;
  attribute C_WRITE_DEPTH_B : integer;
  attribute C_WRITE_DEPTH_B of U0 : label is 3838;
  attribute C_WRITE_MODE_A : string;
  attribute C_WRITE_MODE_A of U0 : label is "WRITE_FIRST";
  attribute C_WRITE_MODE_B : string;
  attribute C_WRITE_MODE_B of U0 : label is "WRITE_FIRST";
  attribute C_WRITE_WIDTH_A : integer;
  attribute C_WRITE_WIDTH_A of U0 : label is 1;
  attribute C_WRITE_WIDTH_B : integer;
  attribute C_WRITE_WIDTH_B of U0 : label is 1;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of U0 : label is "artix7";
  attribute downgradeipidentifiedwarnings of U0 : label is "yes";
begin
U0: entity work.blk_mem_weight_KC_APLMBONa3_blk_mem_gen_v8_3_5
     port map (
      addra(11 downto 0) => addra(11 downto 0),
      addrb(11 downto 0) => B"000000000000",
      clka => clka,
      clkb => '0',
      dbiterr => NLW_U0_dbiterr_UNCONNECTED,
      deepsleep => '0',
      dina(0) => '0',
      dinb(0) => '0',
      douta(0) => douta(0),
      doutb(0) => NLW_U0_doutb_UNCONNECTED(0),
      eccpipece => '0',
      ena => '0',
      enb => '0',
      injectdbiterr => '0',
      injectsbiterr => '0',
      rdaddrecc(11 downto 0) => NLW_U0_rdaddrecc_UNCONNECTED(11 downto 0),
      regcea => '0',
      regceb => '0',
      rsta => '0',
      rsta_busy => NLW_U0_rsta_busy_UNCONNECTED,
      rstb => '0',
      rstb_busy => NLW_U0_rstb_busy_UNCONNECTED,
      s_aclk => '0',
      s_aresetn => '0',
      s_axi_araddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_arburst(1 downto 0) => B"00",
      s_axi_arid(3 downto 0) => B"0000",
      s_axi_arlen(7 downto 0) => B"00000000",
      s_axi_arready => NLW_U0_s_axi_arready_UNCONNECTED,
      s_axi_arsize(2 downto 0) => B"000",
      s_axi_arvalid => '0',
      s_axi_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_awburst(1 downto 0) => B"00",
      s_axi_awid(3 downto 0) => B"0000",
      s_axi_awlen(7 downto 0) => B"00000000",
      s_axi_awready => NLW_U0_s_axi_awready_UNCONNECTED,
      s_axi_awsize(2 downto 0) => B"000",
      s_axi_awvalid => '0',
      s_axi_bid(3 downto 0) => NLW_U0_s_axi_bid_UNCONNECTED(3 downto 0),
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_U0_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_bvalid => NLW_U0_s_axi_bvalid_UNCONNECTED,
      s_axi_dbiterr => NLW_U0_s_axi_dbiterr_UNCONNECTED,
      s_axi_injectdbiterr => '0',
      s_axi_injectsbiterr => '0',
      s_axi_rdaddrecc(11 downto 0) => NLW_U0_s_axi_rdaddrecc_UNCONNECTED(11 downto 0),
      s_axi_rdata(0) => NLW_U0_s_axi_rdata_UNCONNECTED(0),
      s_axi_rid(3 downto 0) => NLW_U0_s_axi_rid_UNCONNECTED(3 downto 0),
      s_axi_rlast => NLW_U0_s_axi_rlast_UNCONNECTED,
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => NLW_U0_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_rvalid => NLW_U0_s_axi_rvalid_UNCONNECTED,
      s_axi_sbiterr => NLW_U0_s_axi_sbiterr_UNCONNECTED,
      s_axi_wdata(0) => '0',
      s_axi_wlast => '0',
      s_axi_wready => NLW_U0_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(0) => '0',
      s_axi_wvalid => '0',
      sbiterr => NLW_U0_sbiterr_UNCONNECTED,
      shutdown => '0',
      sleep => '0',
      wea(0) => '0',
      web(0) => '0'
    );
end STRUCTURE;
