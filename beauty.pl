#!/bin/perl -w 

use strict;
use warnings;

my $arg_length = scalar @ARGV;
die "usage: $0 <name>" if $arg_length != 2;
my ($filename, $times) =  @ARGV;
open (my $FILEHANDLE, "<",$filename) or die "Could not open $filename";
my @lines = <$FILEHANDLE>;
print @lines;

