# ���ޥ�ɥ��ץ����μ���
sub get_opt {
  # �ǥե���ȥѥ�᡼��������
  $prog_name = $0;

  # ���ץ����β���
  while ($#ARGV >= 0) {
    if ($ARGV[0] eq "-x") { # �ǥХå��⡼��
      $dbg = 1;
    } elsif ($ARGV[0] eq "-d") { # �١����ǥ��쥯�ȥ���ѹ�
      shift(@ARGV);
      $base_dir = $ARGV[0];
    } elsif ($ARGV[0] =~ /^-/) { # ������ˡ��ɽ��
      &usage();
    } else {
      last;
    }
    shift(@ARGV);
  }

  @incs = @ARGV; # �إå�̾�λ����ʣ���ġ�
  if (@incs == 0) {&usage();}
}


