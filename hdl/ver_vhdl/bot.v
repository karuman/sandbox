module bot(bot_p1);
   input bot_p1;
   parameter PullTime = 10000;

   initial $monitor($stime ,, "bot_p1 = %b %s" , bot_p1,PullTime);
endmodule
