package Test::OpenTracing;

use strict;
use warnings;

our $VERSION = '0.01_00';



use Moo;



use Scalar::Util qw/blessed/;
use Types::Standard qw/ClassName Object Str/;



has interface_name => (
    is => 'ro',
    isa => Str,
);

has test_this => (
    is => 'ro',
   isa => ClassName | Object,
);

sub this_name {
    my $self = shift;
    
    return blessed( $self->test_this ) // $self->test_this;
}



package Test::OpenTracing::CanInterface;

use strict;
use warnings;



use Moo;
extends 'Test::OpenTracing';



use Test::Builder;
use Types::Standard qw/ArrayRef Str/;



has interface_methods => (
    is => 'ro',
    isa => ArrayRef[ Str ]
);



sub run_tests{
    my $self = shift;
    
    my $test_name = $self->this_name;
    
    my $Test = Test::Builder->new;
    local $Test::Builder::Level = $Test::Builder::Level + 1;
    
    no strict qw/refs/;
    my @failures;
    foreach my $test_method ( sort @{$self->interface_methods} ) {
        unless ( $self->test_this->can($test_method) ) {
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
    
    my $test_message = $self->test_message( $self->test_this );
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
