module fa(a0,b0,ci,so,co);
   input a0;
   input b0;
   input ci;
   output so ;
   assign so = a0 ^ b0 ^ ci;
   output co;
   assign co = (a0 & b0) |
	       (a0 & ci) |
	       (ci & b0) ;

endmodule // fa

	  
