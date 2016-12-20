//
// Low level 
//
module mul8_lrtl(a,b,c);
   input [7:0] a;
   input [7:0] b;
   output [15:0] c;

   wire [7:0] sum0_00,sum1_00;
   wire [7:0] sum0_01,sum1_01;
   wire [7:0] sum0_10,sum1_10;
   wire [7:0] sum0_11,sum1_11;

   
   mul4x4_wt u00(a[3:0],b[3:0],sum0_00,sum1_00);
   mul4x4_wt u01(a[7:4],b[3:0],sum0_01,sum1_01);
   mul4x4_wt u10(a[3:0],b[7:4],sum0_10,sum1_10);
   mul4x4_wt u11(a[7:4],b[7:4],sum0_11,sum1_11);

   wire [17:0] 	 result;
   
   mul8_wt u12(sum0_00,sum1_00,
	       sum0_01,sum1_01,
	       sum0_10,sum1_10,
	       sum0_11,sum1_11,result);

   assign c=result[15:0];
   
   

endmodule // mul8_lrtl
