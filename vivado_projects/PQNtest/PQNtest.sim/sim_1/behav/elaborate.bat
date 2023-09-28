@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 719498d658f546b7b8128282b7142d09 -m64 --debug typical --relax --mt 2 -L blk_mem_gen_v8_3_5 -L xil_defaultlib -L fifo_generator_v13_1_3 -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot test3_behav xil_defaultlib.test3 xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
