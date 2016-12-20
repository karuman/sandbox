Wallace Treeをadderの組み合わせに変換するプログラム

input:
   textFile  : wallace treeを表現する。
   fa-sum  : full adderのsum 遅延
   fa-cry  : full adderのcarry遅延
   ha-sum  : half adderのsum 遅延
   ha-cry  : half adderのcry 遅延


textFile...
 行単位で該当ビットで処理するbitの信号名を記述していく。1行目は0bit名

　例)  A[3:0] x B[3:0] の場合のWallace Tree入力
     A0B0.0
     A1B0.0 A0B1.0
     A2B0.0 A1B1.0 A0B2.0
     A3B0.0 A2B1.0 A1B2.0 A0B3.0
            A3B1.0 A2B2.0 A1B3.0
	           A3B2.0 A2B3.0
	                  A3B3.0
        XXX.nn
	   XXX...信号名
	   nn...遅延値

  例) A[3:0] + B[3:0] + C[3:0] + D[3:0]
        A0.0 B0.0 C0.0 D0.0
        A1.0 B1.0 C1.0 D1.0
        A2.0 B2.0 C2.0 D2.0
        A3.0 B3.0 C3.0 D3.0



構造体
  signal
    信号名
　  遅延

　adder
    インスタンス名
    入力信号名
    sum出力信号名
    cry出力信号名

処理の内容
　各bit毎のsignalのリストを作る

　bitのリストを表示

  while(いずれかのビットのなかのsignalリストの数が3以上の間)
    全ビット分loop　
      各bitでadderオペレーションを行う
      　リストの要素数が３以上の場合に処理をおこなう
        3つもしくは 2つのsignalを選び（遅延の値をベースに選択)　listから削除
        現在のbitのsignalリストにsignalを追加
        ひとけた上のbitのsignalリストにsignalを追加(最上位の場合にはbitを追加)
    end loop
   
    bitのリストを表示

  end while
    
    
  