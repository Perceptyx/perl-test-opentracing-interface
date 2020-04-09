package Test::OpenTracing::Interface::Scope;

use Test::OpenTracing::Interface;

sub can_all_ok {
    my $thing = shift;
    
    my $Test = Test::OpenTracing::Interface::CanAll->new(
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
