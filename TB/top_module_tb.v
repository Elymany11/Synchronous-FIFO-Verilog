module FIFO_tb;

   parameter data_width = 8;
   parameter depth = 8;
   parameter addr_width = 3;
   parameter count_width = 4;

   reg clk, rst;
   reg wr_en, rd_en;
   reg [data_width-1:0] din;
   wire [data_width-1:0] dout;

   FIFO fifo (clk, rst, wr_en, rd_en, din, dout);

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
      din = 0;
      @(negedge clk);
      rst = 0;
      wr_en = 1;
      din = 8'hA5;
      @(negedge clk);
      rd_en = 1;
      din = 8'h8C;
      @(negedge clk);
      wr_en = 0;
      din = 8'hB1;
      @(negedge clk);
      wr_en = 1;
      rd_en = 0;
      repeat (10) begin
         din = $random;
         @(negedge clk);
      end
      rd_en = 1; 
      repeat (10) begin
         din = $random;
         @(negedge clk);
      end
      wr_en = 0;     
      repeat (10) begin
         din = $random;
         @(negedge clk);
      end

      #5;
      $stop;
   end

   initial begin
      $monitor ("Time=%0t, dout=%0d", $time, dout);
   end


endmodule
