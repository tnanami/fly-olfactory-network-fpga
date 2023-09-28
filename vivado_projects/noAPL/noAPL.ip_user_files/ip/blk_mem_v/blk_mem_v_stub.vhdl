-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Fri Mar 24 14:17:08 2023
-- Host        : DESKTOP-GD656IR running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/research/Xilinx/DrosophilaOlfactorySystem/release/DrosophilaOlfactorySystem20230324/DrosophilaOlfactorySystem20230324.srcs/sources_1/ip/blk_mem_v/blk_mem_v_stub.vhdl
-- Design      : blk_mem_v
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blk_mem_v is
  Port ( 
    clka : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 17 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 17 downto 0 )
  );

end blk_mem_v;

architecture stub of blk_mem_v is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,wea[0:0],addra[11:0],dina[17:0],douta[17:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_3_5,Vivado 2016.4";
begin
end;
