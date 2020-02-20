package Test::OpenTracing::Interface::Scope;

use Test::OpenTracing::TestRunner;

sub can_interface_ok {
    my $thing = shift;
    
    my $Test = Test::OpenTracing::TestRunner->new(
        interface_name => 'Scope',
        interface_methods => [ 
            'close',
            'get_span',
        ],
    );
    
    return $Test->run_tests_can_interface_ok( $thing );
}

1;
