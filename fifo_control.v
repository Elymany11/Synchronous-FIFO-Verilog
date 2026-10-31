module fifo_control #(
      parameter depth = 8,
      parameter count_width = 4
   ) (
      input clk, rst,
      input wr_en, rd_en,
      output wr_allow, rd_allow,
      output reg [count_width-1:0] count,
      output empty, full
   );

   assign empty = (count == 0)? 1 : 0;
   assign full = (count == depth)? 1 : 0;

   assign wr_allow = (wr_en && (!full))? 1 : 0;
   assign rd_allow = (rd_en && (!empty))? 1 : 0;

   always @(posedge clk) begin
      if (rst) begin
         count <= 0;
      end
      else begin
         case ({wr_allow, rd_allow})
            2'b10 : count <= count + 1;
            2'b01 : count <= count - 1;
            default : count <= count;
         endcase
      end
   end

endmodule