module fifo_pointers #(
      parameter addr_width = 3,
      parameter depth = 8
   ) (
      input clk, rst,
      input wr_inc, rd_inc,
      output reg [addr_width-1:0] wr_ptr,
      output reg [addr_width-1:0] rd_ptr
   ); 

   always @(posedge clk) begin

      if (rst) begin
         wr_ptr <= 0;
         rd_ptr <= 0;
      end
      else begin

         if (wr_inc) begin
            if (wr_ptr == (depth-1)) begin
               wr_ptr <= 0;
            end
            else begin
               wr_ptr <= wr_ptr + 1;
            end
         end
         else begin
            wr_ptr <= wr_ptr;
         end

         if (rd_inc) begin
            if (rd_ptr == (depth-1)) begin
               rd_ptr <= 0;
            end
            else begin
               rd_ptr <= rd_ptr + 1;
            end
         end
         else begin
            rd_ptr <= rd_ptr;
         end

      end

   end

endmodule