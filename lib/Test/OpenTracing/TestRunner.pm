package Test::OpenTracing::TestRunner;

use strict;
use warnings;

use Object::Tiny qw/interface_name interface_methods/;

use Scalar::Util qw/blessed/;

use Test::Builder;

sub run_tests_can_interface_ok{
    my $self = shift;
    my $thing = shift;
    
    my $test_class_name = $self->test_class_name($thing);
    
    my $Test = Test::Builder->new;
    local $Test::Builder::Level = $Test::Builder::Level + 1;
    
    no strict qw/refs/;
    my @failures;
    foreach my $test_method ( sort @{$self->interface_methods} ) {
        unless ( $thing->can($test_method) ) {
            $Test->diag("$test_class_name->can('$test_method') failed");
            push @failures, $test_method;
        }
    }
    
    my $test_name = $self->test_name( $thing );
    my $ok = scalar @failures ? 0 : 1;
    return $Test->ok( $ok, $test_name );
    
}

sub test_class_name {
    my $self = shift;
    my $thing = shift;
    
    return blessed( $thing ) // "$thing";
}

sub test_name {
    my $self = shift;
    my $thing = shift;
    
    my $test_class_name = $self->test_class_name($thing);
    my $interface_name = $self->interface_name;
    
    return "${test_class_name}->can_interface( '$interface_name' )"
}



1;
