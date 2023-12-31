// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Fri Mar 24 15:02:34 2023
// Host        : DESKTOP-GD656IR running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/research/Xilinx/DrosophilaOlfactorySystem/release/DrosophilaOlfactorySystem20230324/DrosophilaOlfactorySystem20230324.srcs/sources_1/ip/blk_mem_fc/blk_mem_fc_stub.v
// Design      : blk_mem_fc
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_5,Vivado 2016.4" *)
module blk_mem_fc(clka, wea, addra, dina, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[8:0],dina[9:0],douta[9:0]" */;
  input clka;
  input [0:0]wea;
  input [8:0]addra;
  input [9:0]dina;
  output [9:0]douta;
endmodule
