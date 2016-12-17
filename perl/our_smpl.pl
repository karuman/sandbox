
&test;
&test2;
&test;
&test2;
&test2;
&test;
&test;



sub test {
    our $cnt;

    if($cnt eq ""){
	$cnt=0;
    }
    print $cnt ;
    print "\n";
    $cnt=$cnt+1;
}

sub test2 {
    our $cnt;

    if($cnt eq ""){
	$cnt=0;
    }
    print $cnt ;
    print "\n";
    $cnt=$cnt+1;
}
