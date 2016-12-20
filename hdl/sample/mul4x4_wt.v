//
// Low level 
//
module mul4x4_wt(a,b,sum0,sum1);
   input [3:0] a;
   input [3:0] b;
   output [7:0] sum0;
   output [7:0] sum1;

   wire 	a0b0 = a[0] & b[0];
   wire 	a0b1 = a[0] & b[1];
   wire 	a0b2 = a[0] & b[2];
   wire 	a0b3 = a[0] & b[3];
   wire 	a1b1 = a[1] & b[0];
   wire 	a1b2 = a[1] & b[1];
   wire 	a1b3 = a[1] & b[2];
   wire 	a1b4 = a[1] & b[3];
   wire 	a2b2 = a[2] & b[0];
   wire 	a2b3 = a[2] & b[1];
   wire 	a2b4 = a[2] & b[2];
   wire 	a2b5 = a[2] & b[3];
   wire 	a3b3 = a[3] & b[0];
   wire 	a3b4 = a[3] & b[1];
   wire 	a3b5 = a[3] & b[2];
   wire 	a3b6 = a[3] & b[3];

   fa fa1(.a0(a0b2),.b0(a1b2),.ci(a2b2),.so(s1),.co(c1));
   fa fa2(.a0(a0b3),.b0(a1b3),.ci(a2b3),.so(s2),.co(c2));
   fa fa3(.a0(a1b4),.b0(a2b4),.ci(a3b4),.so(s3),.co(c3));
   fa fa4(.a0(a3b3),.b0(s2),.ci(c1),.so(s5),.co(c5));
   ha ha1(.a0(a2b5),.b0(a3b5),.so(s4),.co(c4));
   ha ha2(.a0(s3),.b0(c2),.so(s6),.co(c6));
   ha ha3(.a0(s4),.b0(c3),.so(s7),.co(c7));
   ha ha4(.a0(a3b6),.b0(c4),.so(s8),.co(c8));

   assign sum0 ={c8,s8,s7,s6,s5,s1,a0b1,a0b0};
   assign sum1 ={1'b0,c7,c6,c5,1'b0,1'b0,a1b1,1'b0};
   
   

endmodule // mul_lrtl
