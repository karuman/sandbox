#
#再帰呼び出しの実験
#

my @aho=();			# 初期化

cyc_test(10,\@aho);

print "\n\npushed data\n";
foreach $i (@aho){
    print "$i\n";
}

exit;



#------------------------------------------------------------------------
#
# Cyclic function
#

sub cyc_test
{
    my($parm,$ref_array)=@_;
    local(*list)=$ref_array;

    if(!search_table($parm,\@list)){
	push @list,$parm;
    }
    print "parm1\n";
    foreach $i (@list){
	print $i;
    }
    print "\n";

    if($parm>0){
	cyc_test($parm-1,\@list);
    }

    if(!search_table($parm,\@list)){
	push @list,$parm;
    }

    print "parm2\n";
    foreach $i (@list){
	print $i;
    }
    print "\n";
}


sub search_table
{
   my($key,$ref_array)=@_;
   local(*table)=$ref_array;
   foreach $i (@table){
       if($i==$key){
	   return 1;
       }
   }
   return 0;
   
}
