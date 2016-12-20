module counter(clk,rst,dout);
   input clk;
   input rst;
   output [3:0] dout;

   reg [3:0] 	cnt_reg;
   
   always  @(posedge clk)
     begin
	if(rst==1'b1)
	  cnt_reg <= 4'b0;
	else
	  cnt_reg <= cnt_reg+4'b1;
     end
   assign dout = cnt_reg;
   
endmodule // counter
