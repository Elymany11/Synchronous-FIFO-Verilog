module fifo_memory #(
      parameter data_width = 8,
      parameter depth = 8,
      parameter addr_width = 3
   ) (
      input clk,rst,
      input wr_en, rd_en,
      input [addr_width-1:0] wr_addr, 
      input [addr_width-1:0] rd_addr,
      input [data_width-1:0] din,
      output reg [data_width-1:0] dout
   );

   reg [data_width-1:0] mem [depth-1:0];

   integer i;

   always @(posedge clk) begin
      if (rst) begin
         dout = 0;
         for (i=0; i<depth; i=i+1) begin
            mem[i] = 0;
         end
      end
      else begin
         if (wr_en) begin 
            mem[wr_addr] <= din;
         end
         if (rd_en) begin
            dout <= mem[rd_addr] ;
         end       
      end
   end
   
endmodule
