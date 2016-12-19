module ha(a0,b0,so,co);
   input a0;
   input b0;
   output so ;
   assign so = a0 ^ b0;
   output co;
   assign co = (a0 & b0) ;

endmodule // ha

	  
