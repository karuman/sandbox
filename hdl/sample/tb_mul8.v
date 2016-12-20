`timescale 1ns/1ps


module tb_mul8();
   parameter CLK_PERIOD = 10;

   reg clk = 0;
   reg rst = 1;
   reg [7:0] a;
   reg [7:0] b;
   reg 	     flag;
   
   wire[15:0] doutm;
   wire[15:0] doutm_lrtl;
   integer   i,j;
   
   mul8 m0 (a,b,doutm);
   mul8_lrtl m1 (a,b,doutm_lrtl);
   
   initial
     begin
	#0 rst <=1'b1;
	#10 rst <=1'b0;
	for (i = 0; i < 256; i = i + 1) begin
	   for (j = 0; j < 256; j = j + 1) begin
	      #(CLK_PERIOD) a<= i; b<=j;
	   end
	end
	
	#500 $stop;
	
     end
   
   always #(CLK_PERIOD/2)
     clk <= !clk;

   always @(negedge clk)
     begin
	if(doutm != doutm_lrtl)begin
	   $display("not equal");
	   flag <=1'b1;
	end
	else
	  flag<=1'b0;
	
     end
   
   
endmodule // tb_count
