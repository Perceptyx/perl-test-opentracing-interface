package Test::OpenTracing::Scope;

use Test::OpenTracing;

sub can_interface_ok {
    my $thing = shift;
    
    my $Test = Test::OpenTracing::CanInterface->new(
        test_this           => $thing,
        interface_name      => 'Scope',
        interface_methods   => [ 
            'close',
            'get_span',
        ],
    );
    
    return $Test->run_tests;
}

1;
