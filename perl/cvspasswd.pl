#!/usr/bin/perl -w
#
# cvsadduser - a tool to generate a passwd entry for CVS pserver.
#
# Copyright (C) 1999 Satoru Takabayashi <satoru-t@is.aist-nara.ac.jp>
#     All rights reserved.
#     This is free software with ABSOLUTELY NO WARRANTY.
#
# You can redistribute it and/or modify it under the terms of 
# the GNU General Public License version 2.
#
#
use strict;

main();

sub main () {
    srand(time() ^ ($$ << 15));

    print STDERR "cvs account: ";
    my $cvs_account = <STDIN>;
    chomp $cvs_account;

    print STDERR "password: ";
    system "stty -echo";
    my $passwd = <STDIN>;
    system "stty echo";
    chomp $passwd;
    print STDERR "\n";

    print STDERR "Re-enter password: ";
    system "stty -echo";
    my $tmp_passwd = <STDIN>;
    system "stty echo";
    chomp $tmp_passwd;
    print STDERR "\n";

    unless ($passwd eq $tmp_passwd) {
	print STDERR "ERROR! They don't match.\n";
	exit 1;
    }

    print STDERR "real account (can be omitted): ";
    my $real_account = <STDIN>;
    chomp $real_account;

    my $salt = draw_salt();
    my $encoded_passwd = crypt($passwd, $salt);

    print "$cvs_account:$encoded_passwd";
    print ":$real_account" unless $real_account eq "";
    print "\n";
}

sub draw_salt () {
    my $salt_chars = 
	'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789./';

    my $idx1 = int(rand() * length($salt_chars));
    my $idx2 = int(rand() * length($salt_chars));

    my $chr1 = substr($salt_chars, $idx1, 1);
    my $chr2 = substr($salt_chars, $idx2, 1);

    return ($chr1 . $chr2);
}

