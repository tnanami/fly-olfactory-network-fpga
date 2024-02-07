-makelib ies/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies/xpm \
  "C:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../DrosophilaOlfactorySystem20230324.srcs/sources_1/ip/clk_generator/clk_generator_clk_wiz.v" \
  "../../../../DrosophilaOlfactorySystem20230324.srcs/sources_1/ip/clk_generator/clk_generator.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

