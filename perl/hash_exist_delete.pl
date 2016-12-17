#!/usr/bin/perl

%hash = ("key1" =< 1);

if( exists($hash{"key1"}) ){
  print "key1 exists. value is '$hash{'key1'}'\n";
} else {
  print "key1 NOT exists.\n";
}

$hash{"key1"} = "";
if( exists($hash{"key1"}) ){
  print "key1 exists. value is '$hash{'key1'}'\n";
} else {
  print "key1 NOT exists.\n";
}

delete $hash{"key1"};
print "deleted\n";

if( exists($hash{"key1"}) ){
  print "key1 exists. value is '$hash{'key1'}'\n";
} else {
  print "key1 NOT exists.\n";
}

if( exists($hash{"key4"}) ) {
  print "key4 exists. value is '$hash{'key4'}'\n";
} else {
  print "key4 NOT exists.\n";
}
