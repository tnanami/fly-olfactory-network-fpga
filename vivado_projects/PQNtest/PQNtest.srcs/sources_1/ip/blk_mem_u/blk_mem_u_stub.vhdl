-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Mon Jan 17 22:56:12 2022
-- Host        : DESKTOP-GD656IR running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/research/Xilinx/DrosophilaOlfactorySystem20220104/DrosophilaOlfactorySystem20220104.srcs/sources_1/ip/blk_mem_u/blk_mem_u_stub.vhdl
-- Design      : blk_mem_u
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blk_mem_u is
  Port ( 
    clka : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 17 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 17 downto 0 )
  );

end blk_mem_u;

architecture stub of blk_mem_u is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,wea[0:0],addra[11:0],dina[17:0],douta[17:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_3_5,Vivado 2016.4";
begin
end;
