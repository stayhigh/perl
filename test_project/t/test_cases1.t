#!/bin/perl -wT
#-T :taint mode detects its program running with differing real and effective user or group IDs.

use strict;
use warnings;
use Test::More;
use Scalar::Util qw(reftype); #type checking
use Test::More; # if the items num is not specified,call done_testing() at the end. 
#use Test::More tests => 10; # test 10 items


#All test names
my $got = "hello world";
my $hellotest_name = "hello string test";
my $wordtest_name = "word string test";
my $istest_name = "num is test";
my $isnttest_name = "num isn't test";
my $ok_expression_name = "expression test";
my $rangetest_name = "range number test";
my $comparsion_test = "comparision test";
my $comparision_expected = 42; 
my $comparison_op = '==';

#All functions names
sub ultimate_answer{
    return 42;
}

#All variables' name 
my $somestr = "123";
my $somenum = 100;
my %somehash = (k1 => 'v1', k2 => 'v2');
my $numref = \$somenum;
my $hashref = \%somehash;
my $num2str = sprintf "%8d", $somenum;

#show variable types
#<BUILT-IN TYPES>
      # SCALAR ARRAY HASH CODE REF GLOB LVALUE FORMAT IO VSTRING Regexp 
#print ref($numref)."\n";
#print ref($hashref)."\n";
#print "==>".ref(\$num2str)."\n";
#print "==>".ref(\$str2num)."\n";

# use_ok: check for module import
# like: test regular expression
# is: test a matching expression
# ok: check for expression
# cmp_ok: check for perl operator comparators
# can_ok: check for module methods or object methods, need -Ilib to include *.pm and call use_ok() before can_ok()
# isa_ok: check for data type, class instance, and parent class 
      #isa_ok($object,   $class, $object_name);
      #isa_ok($subclass, $class, $object_name);
      #isa_ok($ref,      $type,  $ref_name);

use_ok("MyMath");
like ($got, qr/hello/, $hellotest_name);
unlike ($got, qr/some_pattern/, $wordtest_name);
is(ultimate_answer(),42,$istest_name);
isnt(ultimate_answer(),0,$isnttest_name);
ok(ultimate_answer() == 42,$ok_expression_name);
cmp_ok(ultimate_answer(), $comparison_op, $comparision_expected, $comparsion_test);
can_ok('MyMath', "compute");
isa_ok($numref, 'SCALAR'  );
isa_ok($hashref, 'HASH'  );
done_testing();
