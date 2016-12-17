open infile,  $ARGV[0];
$aho=AAA;

while(<infile>){
    if( /module([ \t]+)$aho/ ) {
	print "include hello \n";
    }elsif( /module([ \t]*)/ ) {
	print "start module statement \n";
    }else {
	print "exclude hello \n";
    }
}
