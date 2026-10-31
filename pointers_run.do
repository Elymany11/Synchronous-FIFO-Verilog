vlib work
vlog fifo_pointers.v fifo_pointers_tb.v
vsim -voptargs=+acc work.fifo_pointers_tb
add wave *
run -all