#
#
#


# $Id: http-client.pl,v 1.3 2003/03/23 11:28:03 68user Exp $
                
use strict;

use Socket;     # Socket �⥸�塼���Ȥ�

                # ��³��ۥ���̾
my $host = 'eda.yamato.ibm.com';

                # HTTP �ץ�ȥ����Ȥ�
my $port = getservbyname('http', 'tcp');

                # �ۥ���̾��IP ���ɥ쥹�ι�¤�Τ��Ѵ�
my $iaddr = inet_aton($host)
        or die "$host ��¸�ߤ��ʤ��ۥ��ȤǤ���\n";

                # �ݡ����ֹ�� IP ���ɥ쥹��¤�Τ��Ѵ�
my $sock_addr = pack_sockaddr_in($port, $iaddr);

                # �����å�����
socket(SOCKET, PF_INET, SOCK_STREAM, 0)
        or die "�����åȤ������Ǥ��ޤ���\n";

                # ����Υۥ��Ȥλ���Υݡ��Ȥ���³
connect(SOCKET, $sock_addr)
        or die "$host �Υݡ��� $port����³�Ǥ��ޤ���\n";

                # �ե�����ϥ�ɥ� SOCKET ��Хåե���󥰤��ʤ�
select(SOCKET); $|=1; select(STDOUT);

                # WWW �����Ф� HTTP �ꥯ�����Ȥ�����
print SOCKET "GET \r\n";
print SOCKET "\r\n";

                # �إå���ʬ��������
while (<SOCKET>){
                # ���ԤΤߤιԤʤ�롼�פ�ȴ����
    m/^\r\n$/ and last;
}

                # �ܥǥ���ʬ�������ꡢɽ��
while (<SOCKET>){
    print $_;
}
