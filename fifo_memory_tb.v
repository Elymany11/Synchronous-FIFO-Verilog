module fifo_memory_tb;

   parameter data_width = 8;
   parameter depth = 8;
   parameter addr_width = 3;

   reg clk;
   reg wr_en, rd_en;
   reg [addr_width-1:0] wr_addr;
   reg [addr_width-1:0] rd_addr;
   reg [data_width-1:0] din;
   wire [data_width-1:0] dout;

   fifo_memory  DUT (clk, wr_en, rd_en, wr_addr, rd_addr, din, dout);

   integer i;

   initial begin
      clk = 0;
      forever begin
         #5 clk = ~clk;
      end
   end

   initial begin
      for (i=0; i < 8; i=i+1) begin
         DUT.mem[i] = 0;
      end

      wr_addr = 0;
      rd_addr = 0;
      wr_en = 0;
      rd_en = 0;
      din = 0;
      @(negedge clk);
      din = 8'hA5;
      wr_addr = 0;
      wr_en = 1;
      @(negedge clk);
      din = 8'h3C;
      wr_addr = 1;
      wr_en = 1;
      @(negedge clk);
      wr_en = 0;
      rd_addr = 0;
      rd_en = 1;
      @(negedge clk);
      rd_addr = 1;
      @(negedge clk);
      wr_en = 1;
      @(negedge clk);

      #5;
      $stop;
   end

endmodule