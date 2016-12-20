`timescale 1ns/1ps

module tb_count();

   reg clk = 0;
   reg rst = 1;
   wire[3:0] dout;
   wire[7:0] doutm;
   wire[7:0] doutm_lrtl;
   
   counter c0 (clk,rst,dout);
   mul m0 (dout,dout,doutm);
   mul_lrtl m1 (dout,dout,doutm_lrtl);
   
   initial
     begin
	#0 rst <=1'b1;
	#10 rst <=1'b0;
	
	#500 $stop;
	
     end
   parameter CLK_PERIOD = 10;
   
   always #(CLK_PERIOD/2)
     clk <= !clk;

   always @(negedge clk)
     begin
	if(doutm != doutm_lrtl)
	  $display("not equal");
     end
   
   
endmodule // tb_count
