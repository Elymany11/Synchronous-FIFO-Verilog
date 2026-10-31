vlib work
vlog top_module.v top_module_tb.v fifo_control.v fifo_control_tb.v fifo_pointers.v fifo_pointers_tb.v fifo_memory.v fifo_memory_tb.v
vsim -voptargs=+acc work.FIFO_tb
add wave *
add wave -position insertpoint  \
sim:/FIFO_tb/fifo/wr_allow_cnt \
sim:/FIFO_tb/fifo/rd_allow_cnt \
sim:/FIFO_tb/fifo/count_cnt \
sim:/FIFO_tb/fifo/empty_cnt \
sim:/FIFO_tb/fifo/full_cnt \
sim:/FIFO_tb/fifo/wr_ptr_ptr \
sim:/FIFO_tb/fifo/rd_ptr_ptr
add wave -position insertpoint  \
sim:/FIFO_tb/fifo/memory/mem
run -all
