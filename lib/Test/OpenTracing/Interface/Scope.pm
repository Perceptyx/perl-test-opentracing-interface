package Test::OpenTracing::Interface::Scope;

use Test::OpenTracing::Test::CanInterface;

sub can_interface_ok {
    my $thing = shift;
    
    my $Test = Test::OpenTracing::Test::CanInterface->new(
        interface_name => 'Scope',
        interface_methods => [ 
            'close',
            'get_span',
        ],
    );
    
    return $Test->run_tests( $thing );
}

1;
