#!/usr/bin/perl

;#
;# DBMを作成する
;#

use SDBM_File;
use Fcntl;

#-------------------------------------------------#
#                ▼ココを設定する▼               #
#-------------------------------------------------#
#■変換後のファイル
#$file = "KEN_ALL_CONV.CSV";

#■作成するDBMの名前
$dbm_name = "SDBM_postcd";
#-------------------------------------------------#
#                   ▲ココまで▲                  #
#-------------------------------------------------#

#--------------------------#
#         作成開始         #
#--------------------------#
tie(%h, 'SDBM_File', $dbm_name, O_RDWR|O_CREAT, 0600);

#-- データを突っ込む --#
#open(DAT, $file) or die("Can not open file:$file ($!)");
#while(<DAT>){
#    chomp;
#    my ( $code, @addr ) = split(/,/);
#
#    $h{$code} = join("", @addr);
#}
#close(DAT);

untie %h ;

#--------------------------#
#   処理終了のメッセージ   #
#--------------------------#
#print "Content-type: text/html\n\n";
#print "<H2>OK</H2>\n";
print "DBMを作成しました\n";

exit(0);
