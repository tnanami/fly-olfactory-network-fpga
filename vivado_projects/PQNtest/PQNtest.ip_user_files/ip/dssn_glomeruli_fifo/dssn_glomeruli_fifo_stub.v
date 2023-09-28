// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Thu Jul 08 23:38:23 2021
// Host        : DESKTOP-GD656IR running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/research/Xilinx/DrosophilaOlfactorySystem20210701/DrosophilaOlfactorySystem20210701.srcs/sources_1/ip/dssn_glomeruli_fifo/dssn_glomeruli_fifo_stub.v
// Design      : dssn_glomeruli_fifo
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_1_3,Vivado 2016.4" *)
module dssn_glomeruli_fifo(clk, srst, din, wr_en, rd_en, dout, full, empty)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[11:0],wr_en,rd_en,dout[11:0],full,empty" */;
  input clk;
  input srst;
  input [11:0]din;
  input wr_en;
  input rd_en;
  output [11:0]dout;
  output full;
  output empty;
endmodule
