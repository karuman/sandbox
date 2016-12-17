
$a=0;

printf("top %d\n",$a);

&test0;

printf("top %d\n",$a);

&test1;

printf("top %d\n",$a);

sub test0 {
    $a=5;
    printf("test0 %d\n",$a);
}


sub test1 {
    my $a;
    $a=9;
    printf("test1 %d\n",$a);
}
