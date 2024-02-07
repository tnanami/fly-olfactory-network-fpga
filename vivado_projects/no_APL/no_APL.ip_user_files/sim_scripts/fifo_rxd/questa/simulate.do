onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fifo_rxd_opt

do {wave.do}

view wave
view structure
view signals

do {fifo_rxd.udo}

run -all

quit -force
