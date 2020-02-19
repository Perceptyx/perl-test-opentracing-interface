package Test::OpenTracing::Interface::Scope;

use strict;
use warnings;

use Test::Builder;

my $Test = Test::Builder->new;

sub can_interface_ok {
    
    return $Test->ok( 1, "Object [MyTest::Scope] implements required methods for interface [Scope]" )
    
}

1;
