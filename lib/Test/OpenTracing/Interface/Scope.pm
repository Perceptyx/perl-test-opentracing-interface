package Test::OpenTracing::Interface::Scope;

use strict;
use warnings;

use Scalar::Util qw/blessed/;

use Test::Builder;

my $interface_name = 'Scope';
my @interface_methods = qw{
    close
    get_span
};

my $Test = Test::Builder->new;

sub can_interface_ok {
    my $thing = shift;
    
    my $thing_name = blessed( $thing ) // "$thing";
    
    my $test_name = "${thing_name}->can_interface( '$interface_name' )";
    
    my @failures;
    foreach my $method ( sort @interface_methods ) {
        unless ( $thing->can($method) ) {
            $Test->diag("${thing_name}->can('$method') failed");
            push @failures, $method;
        }
    }
    
    my $ok = scalar @failures ? 0 : 1;
    return $Test->ok( $ok, $test_name );
    
}

1;
