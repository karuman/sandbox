#!/usr/bin/perl

$hash{'a'} = 1;
$hash{'b'} = 2;
$hash{'c'} = 3;
$hash{'d'} = 4;

@keys = keys %hash;
@vals = values %hash;

while(@keys) {
  $key = pop(@keys);
  print $key, ":" , pop(@vals) , " = ", $hash{$key}, "\n";
}

