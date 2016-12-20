

$mode0=hex @ARGV[0];
$mode1=@ARGV[1];

printf ("%d\n",$mode0);
printf ("%x\n",$mode0);
$mode1=0x00FF;

$mode_reg=
    ~ $mode0 & 1;
#    $mode0 &
#    $mode1;
printf ("%x\n",$mode_reg);


