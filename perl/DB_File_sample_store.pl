#
#
#
#

use Fcntl;
use DB_File;

my $file = 'DB_File_sample';
my %db;
unlink "$file.tree";


#
#
#
#tie %db, 'DB_File' , "$file.hash", O_RDWR|O_CREAT, 0644, $DB_HASH or die;

#
#
#
tie %db, 'DB_File' , "$file.tree", O_RDWR|O_CREAT, 0644, $DB_BTREE or die;

open(FP, "$file.txt") or die;
while (<FP>) {
    chomp;
    my ($key, $value) = split(/:/, $_, 2);
    $db{$key} = $value;
}
close(FP);
untie %db;
