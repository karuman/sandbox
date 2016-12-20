module mul8_wt(sum0_00,sum1_00,
	       sum0_01,sum1_01,
	       sum0_10,sum1_10,
	       sum0_11,sum1_11,result);
   input [7:0] sum0_00,sum1_00;
   input [7:0] sum0_01,sum1_01;
   input [7:0] sum0_10,sum1_10;
   input [7:0] sum0_11,sum1_11;
   output [17:0] result;
   

   assign {a0b7,a0b6,a0b5,a0b4,a0b3,a0b2,a0b1,a0b0}=sum0_00[7:0];
   assign {a1b7,a1b6,a1b5,a1b4,a1b3,a1b2,a1b1,a1b0}=sum1_00[7:0];

   assign {a2b11,a2b10,a2b9,a2b8,a2b7,a2b6,a2b5,a2b4}=sum0_01[7:0];
   assign {a3b11,a3b10,a3b9,a3b8,a3b7,a3b6,a3b5,a3b4}=sum1_01[7:0];
   assign {a4b11,a4b10,a4b9,a4b8,a4b7,a4b6,a4b5,a4b4}=sum0_10[7:0];
   assign {a5b11,a5b10,a5b9,a5b8,a5b7,a5b6,a5b5,a5b4}=sum1_10[7:0];

   assign {a0b15,a0b14,a0b13,a0b12,a0b11,a0b10,a0b9,a0b8}=sum0_11[7:0];
   assign {a1b15,a1b14,a1b13,a1b12,a1b11,a1b10,a1b9,a1b8}=sum1_11[7:0];

   fa fa1(.a0(a0b4),.b0(a1b4),.ci(a2b4),.so(s1),.co(c1));
   fa fa2(.a0(a0b5),.b0(a1b5),.ci(a2b5),.so(s2),.co(c2));
   fa fa3(.a0(a0b6),.b0(a1b6),.ci(a2b6),.so(s3),.co(c3));
   fa fa4(.a0(a0b7),.b0(a1b7),.ci(a2b7),.so(s4),.co(c4));
   fa fa5(.a0(a0b8),.b0(a1b8),.ci(a2b8),.so(s5),.co(c5));
   fa fa6(.a0(a0b9),.b0(a1b9),.ci(a2b9),.so(s6),.co(c6));
   fa fa7(.a0(a0b10),.b0(a1b10),.ci(a2b10),.so(s7),.co(c7));
   fa fa8(.a0(a0b11),.b0(a1b11),.ci(a2b11),.so(s8),.co(c8));
   fa fa9(.a0(a3b4),.b0(a4b4),.ci(a5b4),.so(s13),.co(c13));
   fa fa10(.a0(a3b5),.b0(a4b5),.ci(a5b5),.so(s14),.co(c14));
   fa fa11(.a0(a3b6),.b0(a4b6),.ci(a5b6),.so(s15),.co(c15));
   fa fa12(.a0(a3b7),.b0(a4b7),.ci(a5b7),.so(s16),.co(c16));
   fa fa13(.a0(a3b8),.b0(a4b8),.ci(a5b8),.so(s17),.co(c17));
   fa fa14(.a0(a3b9),.b0(a4b9),.ci(a5b9),.so(s18),.co(c18));
   fa fa15(.a0(a3b10),.b0(a4b10),.ci(a5b10),.so(s19),.co(c19));
   fa fa16(.a0(a3b11),.b0(a4b11),.ci(a5b11),.so(s20),.co(c20));
   fa fa17(.a0(s9),.b0(c8),.ci(c20),.so(s21),.co(c21));
   fa fa18(.a0(s2),.b0(s14),.ci(c1),.so(s25),.co(c25));
   fa fa19(.a0(s3),.b0(s15),.ci(c2),.so(s26),.co(c26));
   fa fa20(.a0(s4),.b0(s16),.ci(c3),.so(s27),.co(c27));
   fa fa21(.a0(s5),.b0(s17),.ci(c4),.so(s28),.co(c28));
   fa fa22(.a0(s6),.b0(s18),.ci(c5),.so(s29),.co(c29));
   fa fa23(.a0(s7),.b0(s19),.ci(c6),.so(s30),.co(c30));
   fa fa24(.a0(s8),.b0(s20),.ci(c7),.so(s31),.co(c31));
   fa fa25(.a0(c14),.b0(s26),.ci(c25),.so(s32),.co(c32));
   fa fa26(.a0(c15),.b0(s27),.ci(c26),.so(s33),.co(c33));
   fa fa27(.a0(c16),.b0(s28),.ci(c27),.so(s34),.co(c34));
   fa fa28(.a0(c17),.b0(s29),.ci(c28),.so(s35),.co(c35));
   fa fa29(.a0(c18),.b0(s30),.ci(c29),.so(s36),.co(c36));
   fa fa30(.a0(c19),.b0(s31),.ci(c30),.so(s37),.co(c37));
   ha ha1(.a0(a0b12),.b0(a1b12),.so(s9),.co(c9));
   ha ha2(.a0(a0b13),.b0(a1b13),.so(s10),.co(c10));
   ha ha3(.a0(a0b14),.b0(a1b14),.so(s11),.co(c11));
   ha ha4(.a0(a0b15),.b0(a1b15),.so(s12),.co(c12));
   ha ha5(.a0(s10),.b0(c9),.so(s22),.co(c22));
   ha ha6(.a0(s11),.b0(c10),.so(s23),.co(c23));
   ha ha7(.a0(s12),.b0(c11),.so(s24),.co(c24));
   ha ha8(.a0(s21),.b0(c31),.so(s38),.co(c38));
   ha ha9(.a0(s22),.b0(c21),.so(s39),.co(c39));
   ha ha10(.a0(s23),.b0(c22),.so(s40),.co(c40));
   ha ha11(.a0(s24),.b0(c23),.so(s41),.co(c41));
   ha ha12(.a0(c12),.b0(c24),.so(s42),.co(c42));

   wire [17:0] S0={c42,s42,s41,s40,s39,s38,s37,s36,s35,s34,s33,s32,c13,s1,a0b3,a0b2,a0b1,a0b0};
   wire [17:0] S1={1'b0,c41,c40,c39,c38,c37,c36,c35,c34,c33,c32,1'b0,s25,s13,a1b3,a1b2,a1b1,a1b0};
   assign result = S0 + S1;
   
endmodule // mul8_wt


   
