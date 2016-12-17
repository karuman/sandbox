# コマンドオプションの取得
sub get_opt {
  # デフォルトパラメータの設定
  $prog_name = $0;

  # オプションの解析
  while ($#ARGV >= 0) {
    if ($ARGV[0] eq "-x") { # デバッグモード
      $dbg = 1;
    } elsif ($ARGV[0] eq "-d") { # ベースディレクトリの変更
      shift(@ARGV);
      $base_dir = $ARGV[0];
    } elsif ($ARGV[0] =~ /^-/) { # 使用方法の表示
      &usage();
    } else {
      last;
    }
    shift(@ARGV);
  }

  @incs = @ARGV; # ヘッダ名の指定（複数可）
  if (@incs == 0) {&usage();}
}


