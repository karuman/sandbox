`timescale 1ns/1ps


module tb_mul();
   parameter CLK_PERIOD = 10;

   reg clk = 0;
   reg rst = 1;
   reg [3:0] a;
   reg [3:0] b;
   wire[7:0] doutm;
   wire[7:0] doutm_lrtl;
   integer   i,j;
   
   mul m0 (a,b,doutm);
   mul_lrtl m1 (a,b,doutm_lrtl);
   
   initial
     begin
	#0 rst <=1'b1;
	#10 rst <=1'b0;
	for (i = 0; i < 16; i = i + 1) begin
	   for (j = 0; j < 16; j = j + 1) begin
	      #(CLK_PERIOD) a<= i; b<=j;
	   end
	end
	
	#500 $stop;
	
     end
   
   always #(CLK_PERIOD/2)
     clk <= !clk;

   always @(negedge clk)
     begin
	if(doutm != doutm_lrtl)
	  $display("not equal");
     end
   
   
endmodule // tb_count
