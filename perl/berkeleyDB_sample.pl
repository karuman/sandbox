#!/usr/bin/perl -w
#
# pl_create_database.pl: Berkeley DB データベース作成サンプル
#

use strict;
use BerkeleyDB;

my $database = "test.db";
my %db_hash;

tie %db_hash, 'BerkeleyDB::Btree', 
    -Filename => $database, -Flags => DB_CREATE | DB_TRUNCATE, -Mode => 0664
    or die "Cannot open $database: $!\n";

    while (<>) {
        chomp;

        my ($key, $value) = split(/\,/);
        $db_hash{$key} = $value;
    }

untie %db_hash;
