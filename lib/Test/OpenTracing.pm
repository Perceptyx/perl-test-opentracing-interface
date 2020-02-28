package Test::OpenTracing;

use strict;
use warnings;

our $VERSION = '0.01_00';



use Moo;



use Scalar::Util qw/blessed/;



has interface_name => (
    is => 'ro',
);

has this => (
    is => 'ro',
);

sub this_name {
    my $self = shift;
    
    return blessed( $self->this ) // $self->this;
}



package Test::OpenTracing::CanInterface;

use strict;
use warnings;



use Moo;
extends 'Test::OpenTracing';



use Test::Builder;



has interface_methods => (
    is => 'ro',
);



sub run_tests{
    my $self = shift;
    
    my $test_name = $self->this_name;
    
    my $Test = Test::Builder->new;
    local $Test::Builder::Level = $Test::Builder::Level + 1;
    
    no strict qw/refs/;
    my @failures;
    foreach my $test_method ( sort @{$self->interface_methods} ) {
        unless ( $self->this->can($test_method) ) {
            $Test->diag(
                $self->this_name
                .
                "->can('"
                .
                $test_method
                .
                "') failed"
            );
            push @failures, $test_method;
        }
    }
    
    my $test_message = $self->test_message( $self->this );
    my $ok = scalar @failures ? 0 : 1;
    return $Test->ok( $ok, $test_message );
    
}


sub test_message {
    my $self = shift;
    my $this = shift;
    
    my $this_name = $self->this_name();
    my $interface_name = $self->interface_name;
    
    return "$this_name->can_interface( '$interface_name' )"
}



1;
