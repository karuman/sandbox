use LWP::UserAgent;
use HTTP::Request;
use HTTP::Request::Common qw(POST);

# �ꥯ�����Ȥ�����
#my $url = 'https://hoge.jp/~test/cgi-bin/login.cgi';
my $url = 'https://mail.yahoo.co.jp/';
my %formdata = ('type' => 'login','ID' => 'ID', 'PW' => 'PW');
my $request = POST($url,[%formdata]);
$request->init_header('HOGE' => 'HOGEHOGE');

# UserAgent���������ƽ���
my $ua = LWP::UserAgent->new;
my $res = $ua->request($request);
print $res->as_string;
