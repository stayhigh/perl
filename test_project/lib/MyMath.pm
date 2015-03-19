#!/bin/perl -w 
package MyMath;
use strict;
use warnings;
use base 'Exporter';
our @EXPORT_OK = qw(compute);

sub compute{
    my ($operator, $x,$y) = @_;
    $x = sprintf "%8.2f",$x;
    $y = sprintf "%8.2f",$y;
    my $expression = $x.$operator.$y;
    return eval $expression;
    #return eval($x.$operator.$y);
}
