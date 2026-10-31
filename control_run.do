vlib work
vlog fifo_control.v fifo_control_tb.v
vsim -voptargs=+acc work.fifo_control_tb
add wave *
run -all