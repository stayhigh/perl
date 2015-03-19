#!/bin/perl -w 
use strict;
use warnings;
use Test::More;
use MyMath qw(compute);


ok (compute('+',2,3) == 5);
ok (compute('-',5,2) == 3);
