#
#
#

$bit_str=$ARGV[0];
$padding=$ARGV[1];

printf  "bit_str=%s padding=%s\n",$bit_str,$padding;
bit2hex($bit_str,$padding);


sub bit2hex_str
{

    my($bit_str,$padding)=@_;
    my $len;
    $len=length($bit_str);
    


    printf "%-020s\n",$bit_str;
}


sub bit2hex
{
   my($bit_str)=@_;


 
}
