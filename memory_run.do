vlib work
vlog fifo_memory.v fifo_memory_tb.v
vsim -voptargs=+acc work.fifo_memory_tb
add wave *
add wave -position insertpoint  \
sim:/fifo_memory_tb/DUT/mem
run -all
