#
#
#


# $Id: http-client.pl,v 1.3 2003/03/23 11:28:03 68user Exp $
                
use strict;

use Socket;     # Socket モジュールを使う

                # 接続先ホスト名
my $host = 'eda.yamato.ibm.com';

                # HTTP プロトコルを使う
my $port = getservbyname('http', 'tcp');

                # ホスト名を、IP アドレスの構造体に変換
my $iaddr = inet_aton($host)
        or die "$host は存在しないホストです。\n";

                # ポート番号と IP アドレスを構造体に変換
my $sock_addr = pack_sockaddr_in($port, $iaddr);

                # ソケット生成
socket(SOCKET, PF_INET, SOCK_STREAM, 0)
        or die "ソケットを生成できません。\n";

                # 指定のホストの指定のポートに接続
connect(SOCKET, $sock_addr)
        or die "$host のポート $portに接続できません。\n";

                # ファイルハンドル SOCKET をバッファリングしない
select(SOCKET); $|=1; select(STDOUT);

                # WWW サーバに HTTP リクエストを送る
print SOCKET "GET \r\n";
print SOCKET "\r\n";

                # ヘッダ部分を受け取る
while (<SOCKET>){
                # 改行のみの行ならループを抜ける
    m/^\r\n$/ and last;
}

                # ボディ部分を受け取り、表示
while (<SOCKET>){
    print $_;
}
