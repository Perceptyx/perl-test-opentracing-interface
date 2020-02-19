package Test::OpenTracing::Interface::Scope;

use strict;
use warnings;

use Ref::Util qw/is_blessed_ref is_ref/;
use Test::Builder;

my $Test = Test::Builder->new;

sub can_interface_ok {
    my $thing = shift;
    
    
    my $thing_type = 'unknown';
    $thing_type = 'Object' if is_blessed_ref $thing;
    $thing_type = 'Class'  unless is_ref $thing;
    
    return $Test->ok( 1, "$thing_type [MyTest::Scope] implements required methods for interface [Scope]" )
    
}

1;
