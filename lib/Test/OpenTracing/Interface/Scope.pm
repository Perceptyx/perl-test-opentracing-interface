package Test::OpenTracing::Interface::Scope;

use strict;
use warnings;

use Scalar::Util qw/blessed/;

use Test::Builder;

my $Test = Test::Builder->new;

sub can_interface_ok {
    my $thing = shift;
    
    my $thing_name = blessed( $thing ) // "$thing";
    
    return $Test->ok( 1, "${thing_name}->can_interface( 'Scope' )" )
    
}

sub foo; sub bar; sub qux;
1;
