#
#
use Fcntl;
use DB_File;

my $file = 'DB_File_sample';

#
# Use Hash
#
#tie my %db, 'DB_File', "$file.hash", O_RDONLY, 0644, $DB_HASH or die;



#
# Use B-Tree
#
tie my %db, 'DB_File', "$file.tree", O_RDONLY, 0644, $DB_BTREE or die;

my $key = $ARGV[0];
print $db{$key},"\n" if defined $db{$key};
