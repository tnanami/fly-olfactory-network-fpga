-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
-- Date        : Thu Jul 08 23:38:23 2021
-- Host        : DESKTOP-GD656IR running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/research/Xilinx/DrosophilaOlfactorySystem20210701/DrosophilaOlfactorySystem20210701.srcs/sources_1/ip/dssn_glomeruli_fifo/dssn_glomeruli_fifo_stub.vhdl
-- Design      : dssn_glomeruli_fifo
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dssn_glomeruli_fifo is
  Port ( 
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 11 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 11 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC
  );

end dssn_glomeruli_fifo;

architecture stub of dssn_glomeruli_fifo is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,srst,din[11:0],wr_en,rd_en,dout[11:0],full,empty";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fifo_generator_v13_1_3,Vivado 2016.4";
begin
end;
