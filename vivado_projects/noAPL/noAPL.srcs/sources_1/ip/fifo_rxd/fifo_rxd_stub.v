// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Fri Mar 24 15:24:38 2023
// Host        : DESKTOP-GD656IR running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top fifo_rxd -prefix
//               fifo_rxd_ fifo_rxd_stub.v
// Design      : fifo_rxd
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_1_3,Vivado 2016.4" *)
module fifo_rxd(clk, din, wr_en, rd_en, dout, full, empty, data_count)
/* synthesis syn_black_box black_box_pad_pin="clk,din[11:0],wr_en,rd_en,dout[11:0],full,empty,data_count[13:0]" */;
  input clk;
  input [11:0]din;
  input wr_en;
  input rd_en;
  output [11:0]dout;
  output full;
  output empty;
  output [13:0]data_count;
endmodule
