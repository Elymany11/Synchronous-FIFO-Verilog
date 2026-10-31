module FIFO #(
      parameter data_width = 8,
      parameter depth = 8,
      parameter addr_width = 3,
      parameter count_width = 4
   ) (
      input clk, rst,
      input wr_en, rd_en,
      input [data_width-1:0] din,
      output [data_width-1:0] dout
   );

   wire wr_allow_cnt, rd_allow_cnt;  // Control
   wire [count_width-1:0] count_cnt; // Control
   wire empty_cnt, full_cnt;         // Control

   wire [addr_width-1:0] wr_ptr_ptr; // Pointers
   wire [addr_width-1:0] rd_ptr_ptr; // Pointers

   fifo_control  control (
      .clk(clk),
      .rst(rst),
      .wr_en(wr_en),
      .rd_en(rd_en),
      .wr_allow(wr_allow_cnt),
      .rd_allow(rd_allow_cnt),
      .count(count_cnt),
      .empty(empty_cnt),
      .full(full_cnt)
   );

   fifo_pointers  pointers (
      .clk(clk),
      .rst(rst),
      .wr_inc(wr_allow_cnt),
      .rd_inc(rd_allow_cnt),
      .wr_ptr(wr_ptr_ptr),
      .rd_ptr(rd_ptr_ptr)
   );

   fifo_memory  memory (
      .clk(clk),
      .rst(rst),
      .wr_en(wr_allow_cnt),
      .rd_en(rd_allow_cnt),
      .wr_addr(wr_ptr_ptr),
      .rd_addr(rd_ptr_ptr),
      .din(din),
      .dout(dout)
   );

endmodule