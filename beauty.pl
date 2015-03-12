#!/bin/perl -w 

use strict;
use warnings;

#check sysargs
my $arg_length = scalar @ARGV;
my $PROGRAM_NAME = $0; 
die "usage: $PROGRAM_NAME <name>" if $arg_length != 2;
my ($filename, $times) =  @ARGV;

# show lines in file
open (my $FILEHANDLE, "<",$filename) or die "Couldn't open $filename $!";
my @lines = <$FILEHANDLE>;
print @lines;
close $FILEHANDLE;

# open direcotry and show files
opendir (DIR, '.') or die "Couldn't open directory, $!";
my @files = readdir DIR or die "READ DIRERROR";#while (my $file = readdir DIR) { print "$file\n";}
foreach my $file (@files) {print "$file\n";} #foreach (@files) {print "$_\n";} # print filename for each
closedir DIR;
