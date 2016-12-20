//
// Low level 
//
module mul8_lrtl(a,b,c);
   input [7:0] a;
   input [7:0] b;
   output [15:0] c;
   wire 	a0b0=a[0] & b[0];
   wire 	a0b1=a[0] & b[1];
   wire 	a1b1=a[1] & b[0];
   wire 	a0b2=a[0] & b[2];
   wire 	a1b2=a[1] & b[1];
   wire 	a2b2=a[2] & b[0];
   wire 	a0b3=a[0] & b[3];
   wire 	a1b3=a[1] & b[2];
   wire 	a2b3=a[2] & b[1];
   wire 	a3b3=a[3] & b[0];
   wire 	a0b4=a[0] & b[4];
   wire 	a1b4=a[1] & b[3];
   wire 	a2b4=a[2] & b[2];
   wire 	a3b4=a[3] & b[1];
   wire 	a4b4=a[4] & b[0];
   wire 	a0b5=a[0] & b[5];
   wire 	a1b5=a[1] & b[4];
   wire 	a2b5=a[2] & b[3];
   wire 	a3b5=a[3] & b[2];
   wire 	a4b5=a[4] & b[1];
   wire 	a5b5=a[5] & b[0];
   wire 	a0b6=a[0] & b[6];
   wire 	a1b6=a[1] & b[5];
   wire 	a2b6=a[2] & b[4];
   wire 	a3b6=a[3] & b[3];
   wire 	a4b6=a[4] & b[2];
   wire 	a5b6=a[5] & b[1];
   wire 	a6b6=a[6] & b[0];
   wire 	a0b7=a[0] & b[7];
   wire 	a1b7=a[1] & b[6];
   wire 	a2b7=a[2] & b[5];
   wire 	a3b7=a[3] & b[4];
   wire 	a4b7=a[4] & b[3];
   wire 	a5b7=a[5] & b[2];
   wire 	a6b7=a[6] & b[1];
   wire 	a7b7=a[7] & b[0];
   wire 	a1b8=a[1] & b[7];
   wire 	a2b8=a[2] & b[6];
   wire 	a3b8=a[3] & b[5];
   wire 	a4b8=a[4] & b[4];
   wire 	a5b8=a[5] & b[3];
   wire 	a6b8=a[6] & b[2];
   wire 	a7b8=a[7] & b[1];
   wire 	a2b9=a[2] & b[7];
   wire 	a3b9=a[3] & b[6];
   wire 	a4b9=a[4] & b[5];
   wire 	a5b9=a[5] & b[4];
   wire 	a6b9=a[6] & b[3];
   wire 	a7b9=a[7] & b[2];
   wire 	a3b10=a[3] & b[7];
   wire 	a4b10=a[4] & b[6];
   wire 	a5b10=a[5] & b[5];
   wire 	a6b10=a[6] & b[4];
   wire 	a7b10=a[7] & b[3];
   wire 	a4b11=a[4] & b[7];
   wire 	a5b11=a[5] & b[6];
   wire 	a6b11=a[6] & b[5];
   wire 	a7b11=a[7] & b[4];
   wire 	a5b12=a[5] & b[7];
   wire 	a6b12=a[6] & b[6];
   wire 	a7b12=a[7] & b[5];
   wire 	a6b13=a[6] & b[7];
   wire 	a7b13=a[7] & b[6];
   wire 	a7b14=a[7] & b[7];

   fa fa1(.a0(a0b2),.b0(a1b2),.ci(a2b2),.so(s1),.co(c1));
   fa fa2(.a0(a0b3),.b0(a1b3),.ci(a2b3),.so(s2),.co(c2));
   fa fa3(.a0(a0b4),.b0(a1b4),.ci(a2b4),.so(s3),.co(c3));
   fa fa4(.a0(a0b5),.b0(a1b5),.ci(a2b5),.so(s4),.co(c4));
   fa fa5(.a0(a0b6),.b0(a1b6),.ci(a2b6),.so(s5),.co(c5));
   fa fa6(.a0(a0b7),.b0(a1b7),.ci(a2b7),.so(s6),.co(c6));
   fa fa7(.a0(a1b8),.b0(a2b8),.ci(a3b8),.so(s7),.co(c7));
   fa fa8(.a0(a2b9),.b0(a3b9),.ci(a4b9),.so(s8),.co(c8));
   fa fa9(.a0(a3b10),.b0(a4b10),.ci(a5b10),.so(s9),.co(c9));
   fa fa10(.a0(a4b11),.b0(a5b11),.ci(a6b11),.so(s10),.co(c10));
   fa fa11(.a0(a5b12),.b0(a6b12),.ci(a7b12),.so(s11),.co(c11));
   fa fa12(.a0(a3b3),.b0(s2),.ci(c1),.so(s13),.co(c13));
   fa fa13(.a0(a3b5),.b0(a4b5),.ci(a5b5),.so(s15),.co(c15));
   fa fa14(.a0(a3b6),.b0(a4b6),.ci(a5b6),.so(s16),.co(c16));
   fa fa15(.a0(a3b7),.b0(a4b7),.ci(a5b7),.so(s17),.co(c17));
   fa fa16(.a0(a4b8),.b0(a5b8),.ci(a6b8),.so(s18),.co(c18));
   fa fa17(.a0(a5b9),.b0(a6b9),.ci(a7b9),.so(s19),.co(c19));
   fa fa18(.a0(a7b11),.b0(s10),.ci(c9),.so(s21),.co(c21));
   fa fa19(.a0(s3),.b0(s14),.ci(c2),.so(s25),.co(c25));
   fa fa20(.a0(s4),.b0(s15),.ci(c3),.so(s26),.co(c26));
   fa fa21(.a0(a6b6),.b0(s5),.ci(s16),.so(s27),.co(c27));
   fa fa22(.a0(a7b8),.b0(s7),.ci(s18),.so(s29),.co(c29));
   fa fa23(.a0(s8),.b0(s19),.ci(c7),.so(s30),.co(c30));
   fa fa24(.a0(s9),.b0(s20),.ci(c8),.so(s31),.co(c31));
   fa fa25(.a0(c20),.b0(s21),.ci(c31),.so(s32),.co(c32));
   fa fa26(.a0(c14),.b0(s26),.ci(c25),.so(s36),.co(c36));
   fa fa27(.a0(c4),.b0(c15),.ci(s27),.so(s37),.co(c37));
   fa fa28(.a0(s6),.b0(s17),.ci(s28),.so(s38),.co(c38));
   fa fa29(.a0(c6),.b0(c17),.ci(c28),.so(s39),.co(c39));
   fa fa30(.a0(c18),.b0(c29),.ci(s30),.so(s40),.co(c40));
   fa fa31(.a0(c19),.b0(s31),.ci(c30),.so(s41),.co(c41));
   fa fa32(.a0(c5),.b0(c16),.ci(s38),.so(s43),.co(c43));
   fa fa33(.a0(s29),.b0(c38),.ci(s39),.so(s44),.co(c44));
   fa fa34(.a0(c39),.b0(s40),.ci(c44),.so(s45),.co(c45));
   fa fa35(.a0(c27),.b0(s43),.ci(c37),.so(s52),.co(c52));
   ha ha1(.a0(a6b13),.b0(a7b13),.so(s12),.co(c12));
   ha ha2(.a0(a3b4),.b0(a4b4),.so(s14),.co(c14));
   ha ha3(.a0(a6b10),.b0(a7b10),.so(s20),.co(c20));
   ha ha4(.a0(s11),.b0(c10),.so(s22),.co(c22));
   ha ha5(.a0(s12),.b0(c11),.so(s23),.co(c23));
   ha ha6(.a0(a7b14),.b0(c12),.so(s24),.co(c24));
   ha ha7(.a0(a6b7),.b0(a7b7),.so(s28),.co(c28));
   ha ha8(.a0(s22),.b0(c21),.so(s33),.co(c33));
   ha ha9(.a0(s23),.b0(c22),.so(s34),.co(c34));
   ha ha10(.a0(s24),.b0(c23),.so(s35),.co(c35));
   ha ha11(.a0(c26),.b0(s37),.so(s42),.co(c42));
   ha ha12(.a0(c40),.b0(s41),.so(s46),.co(c46));
   ha ha13(.a0(s32),.b0(c41),.so(s47),.co(c47));
   ha ha14(.a0(s33),.b0(c32),.so(s48),.co(c48));
   ha ha15(.a0(s34),.b0(c33),.so(s49),.co(c49));
   ha ha16(.a0(s35),.b0(c34),.so(s50),.co(c50));
   ha ha17(.a0(c24),.b0(c35),.so(s51),.co(c51));
   ha ha18(.a0(c43),.b0(s44),.so(s53),.co(c53));

   
//   wire [16:0] 	sum0 ={c51,s51,s50,s49,s48,c46,s46,s45,s53,c42,s42,s36,s25,s13,s1,a0b1,a0b0};
//   wire [16:0] 	sum1 ={1'b0,c50,c49,c48,c47,s47,c45,c53,c52,s52,c36,1'b0,c13,1'b0,1'b0,a1b1,1'b0};

   wire [15:0] 	sum0 ={s51,s50,s49,s48,c46,s46,s45,s53,c42,s42,s36,s25,s13,s1,a0b1,a0b0};
//bug   wire [15:0] 	sum0 ={1'b0,s50,s49,s48,c46,s46,s45,s53,c42,s42,s36,s25,s13,s1,a0b1,a0b0};
   wire [15:0] 	sum1 ={c50,c49,c48,c47,s47,c45,c53,c52,s52,c36,1'b0,c13,1'b0,1'b0,a1b1,1'b0};


   
   
   assign c = sum0 + sum1;
   
   

endmodule // mul8_lrtl
