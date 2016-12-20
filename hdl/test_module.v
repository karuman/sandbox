module test_module;

integer i;
reg [31:0] f32;  // 浮動小数点値の変換結果を格納するレジスタ
reg clk;
   
initial begin
  $dumpvars;
  repeat (10) @(posedge clk);
  for (i=0;i<10;i=i+1) begin
    $to_float32(f32,i);  // iをバイナリ値に変換してf32にセット
    $display("float %f %x\n",i,f32);
    @(posedge clk);
  end
  repeat (10) @(posedge clk);
  $finish;
end

endmodule
