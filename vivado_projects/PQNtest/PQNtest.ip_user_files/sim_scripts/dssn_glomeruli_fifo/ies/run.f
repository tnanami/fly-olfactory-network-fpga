-makelib ies/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies/xpm \
  "C:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/fifo_generator_v13_1_3 \
  "../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies/fifo_generator_v13_1_3 \
  "../../../ipstatic/hdl/fifo_generator_v13_1_rfs.vhd" \
-endlib
-makelib ies/fifo_generator_v13_1_3 \
  "../../../ipstatic/hdl/fifo_generator_v13_1_rfs.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../DrosophilaOlfactorySystem20210701.srcs/sources_1/ip/dssn_glomeruli_fifo/sim/dssn_glomeruli_fifo.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

