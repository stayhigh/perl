#!/bin/perl -w 
use strict;
use warnings;
use Test::More;
use Scalar::Util qw(reftype); #type checking


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
my $somenum = 100;
my %somehash = (k1 => 'v1', k2 => 'v2');
my $numref = \$somenum;
my $hashref = \%somehash;

#show variable types
#<BUILT-IN TYPES>
# => SCALAR ARRAY HASH CODE REF GLOB LVALUE FORMAT IO VSTRING Regexp 
print ref($numref)."\n";
print ref($hashref)."\n";

# use_ok: check for module import
# like:check for pattern
# is: check for function return values
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


for (1..20){
    my $expect_answer = $_;
    isnt(ultimate_answer(),$expect_answer, $rangetest_name)
}


isa_ok($numref, 'SCALAR'  );
isa_ok($hashref, 'HASH'  );


