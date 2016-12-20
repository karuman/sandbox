#!/usr/bin/perl

$hash{'a'} = 1;
$hash{'b'} = 2;
$hash{'c'} = 3;
$hash{'d'} = 4;

while( ($key, $value) = each %hash ) {
  print "Key: $key, Value: $value\n";
}
