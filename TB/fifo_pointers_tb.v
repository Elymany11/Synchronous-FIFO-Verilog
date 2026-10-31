module fifo_pointers_tb;

   parameter addr_width = 3;
   parameter depth = 8;

   reg clk,rst;
   reg wr_inc, rd_inc;
   wire [addr_width-1:0] wr_ptr;
   wire [addr_width-1:0] rd_ptr;

   fifo_pointers  pnt (clk, rst, wr_inc, rd_inc, wr_ptr, rd_ptr);

   initial begin
      clk = 0;
      forever begin
         #5 clk = ~clk;
      end
   end

   initial begin
      rst = 1;
      wr_inc = 0;
      rd_inc = 0;
      @(negedge clk);
      rst = 0;
      wr_inc = 1;
      rd_inc = 1;
      @(negedge clk);
      wr_inc = 1;
      rd_inc = 0;
      @(negedge clk);
      wr_inc = 0;
      rd_inc = 1;
      @(negedge clk);
      wr_inc = 1;
      rd_inc = 1;
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);

      #5;
      $stop;
   end

endmodule
