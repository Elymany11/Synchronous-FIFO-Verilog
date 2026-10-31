module fifo_control_tb;

   parameter depth = 8;
   parameter count_width = 4;

   reg clk, rst;
   reg wr_en, rd_en;
   wire wr_allow, rd_allow;
   wire [count_width-1:0] count;
   wire empty, full;

   fifo_control  cont  (clk, rst, wr_en, rd_en, wr_allow, rd_allow, count, empty, full);

   initial begin
      clk = 0;
      forever begin
         #5 clk = ~clk;
      end
   end

   initial begin
      rst = 1;
      wr_en = 0;
      rd_en = 0;
      @(negedge clk);
      rst = 0;
      wr_en = 1;
      rd_en = 1;
      @(negedge clk);
      rd_en = 0;
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      rd_en = 1;
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      wr_en = 0;
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      wr_en = 1;
      @(negedge clk);
      @(negedge clk);
      rd_en = 0;
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      wr_en = 0;
      rd_en = 1;
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);
      @(negedge clk);

      #5;
      $stop;
   end

   initial begin
      $monitor("Time=%0t, Count=%0d", $time, count);
   end

endmodule