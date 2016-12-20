//
// Low level 
//
module mul8_lrtl(a,b,c);
   input [7:0] a;
   input [7:0] b;
   output [15:0] c;

   wire [15:0] sum0_00,sum1_00;
   wire [15:0] sum0_01,sum1_01;
   wire [15:0] sum0_10,sum1_10;
   wire [15:0] sum0_11,sum1_11;

   assign sum0_00[15:8]=8'b0;
   assign sum1_00[15:8]=8'b0;

   assign sum0_01[3:0]=8'b0;
   assign sum1_01[3:0]=8'b0;
   assign sum0_01[15:12]=8'b0;
   assign sum1_01[15:12]=8'b0;

   assign sum0_10[3:0]=8'b0;
   assign sum1_10[3:0]=8'b0;
   assign sum0_10[15:12]=8'b0;
   assign sum1_10[15:12]=8'b0;

   assign sum0_11[7:0]=8'b0;
   assign sum1_11[7:0]=8'b0;
   
   mul4x4_wt u00(a[3:0],b[3:0],sum0_00[7:0],sum1_00[7:0]);
   mul4x4_wt u01(a[7:4],b[3:0],sum0_01[11:4],sum1_01[11:4]);
   mul4x4_wt u10(a[3:0],b[7:4],sum0_10[11:4],sum1_10[11:4]);
   mul4x4_wt u11(a[7:4],b[7:4],sum0_11[15:8],sum1_11[15:8]);

   assign c= sum0_00+sum1_00+
	     sum0_01+sum1_01+
	     sum0_10+sum1_10+
	     sum0_11+sum1_11;
   
   

endmodule // mul8_lrtl
