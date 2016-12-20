//
// Low level 
//
module mul_lrtl(a,b,c);
   input [3:0] a;
   input [3:0] b;
   output [7:0] c;

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
   
   fa add1(.a0(a0b2),.b0(a1b2),.ci(a2b2),.so(s1),.co(c1));
   fa add2(.a0(a0b3),.b0(a1b3),.ci(a2b3),.so(s2),.co(c2));
   fa add3(.a0(a1b4),.b0(a2b4),.ci(a3b4),.so(s3),.co(c3));
   fa add4(.a0(a2b5),.b0(a3b5),.ci(c3),.so(s4),.co(c4));
   fa add5(.a0(a3b3),.b0(c1),.ci(s2),.so(s5),.co(c5));
   fa add6(.a0(c2),.b0(s3),.ci(c5),.so(s6),.co(c6));

   wire [7:0] 	sum0 ={1'b0,a3b6,s4,s6  ,s5  ,s1  ,a0b1 ,a0b0};
   wire [7:0] 	sum1 ={1'b0,c4  ,c6,1'b0,1'b0,1'b0,a1b1 ,1'b0};
   
   assign c = sum0 + sum1;
   
   

endmodule // mul_lrtl
