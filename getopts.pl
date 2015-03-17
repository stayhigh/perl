#!/bin/perl

use strict;
use warnings;
use Getopt::Std;

#getopts
my $opt_string = "ht:p:";
my %opts = (); 
getopts ("$opt_string",\%opts);
die "-t target is a must" if not exists $opts{t};
die "-p   port is a must" if not exists $opts{p};

print "main function runs\n";
