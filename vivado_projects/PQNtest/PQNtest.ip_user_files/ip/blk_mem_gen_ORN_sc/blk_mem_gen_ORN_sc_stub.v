// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Wed Jan 13 22:23:38 2021
// Host        : DESKTOP-GD656IR running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/research/Xilinx/DrosophilaOlfactorySystem20201127/DrosophilaOlfactorySystem20201127.srcs/sources_1/ip/blk_mem_gen_ORN_sc/blk_mem_gen_ORN_sc_stub.v
// Design      : blk_mem_gen_ORN_sc
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_5,Vivado 2016.4" *)
module blk_mem_gen_ORN_sc(clka, ena, wea, addra, dina, douta, clkb, enb, web, addrb, 
  dinb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[10:0],dina[17:0],douta[17:0],clkb,enb,web[0:0],addrb[10:0],dinb[17:0],doutb[17:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [10:0]addra;
  input [17:0]dina;
  output [17:0]douta;
  input clkb;
  input enb;
  input [0:0]web;
  input [10:0]addrb;
  input [17:0]dinb;
  output [17:0]doutb;
endmodule
