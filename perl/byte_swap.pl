

$mode0=hex @ARGV[0];

printf ("%d\n",$mode0);
printf ("%08x\n",$mode0);

printf ("swap off %08x\n",&byte_swap($mode0,0));
printf ("swap on  %08x\n",&byte_swap($mode0,1));


$byte0 = ($mode0>> 0) & 0x000000FF;
$byte1 = ($mode0>> 8) & 0x000000FF;
$byte2 = ($mode0>>16) & 0x000000FF;
$byte3 = ($mode0>>24) & 0x000000FF;


printf ("%02x\n",$byte0);
printf ("%02x\n",$byte1);
printf ("%02x\n",$byte2);
printf ("%02x\n",$byte3);

sub byte_swap {
    my($data,$switch) = @_;
    my $byte0;
    my $byte1;
    my $byte2;
    my $byte3;
    my $s_data;

    $byte0 = ($data>> 0) & 0xFF;
    $byte1 = ($data>> 8) & 0xFF;
    $byte2 = ($data>>16) & 0xFF;
    $byte3 = ($data>>24) & 0xFF;

    if ($switch==1){
	$s_data = 
	    $byte0  << 24 |
	    $byte1  << 16 |
	    $byte2  <<  8 |
	    $byte3  <<  0 ;
    }else {
	$s_data=$data;
    }
    

    return ($s_data);
}
