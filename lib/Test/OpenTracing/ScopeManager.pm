package Test::OpenTracing::ScopeManager;

use Test::OpenTracing;

sub can_interface_ok {
    my $thing = shift;
    
    my $Test = Test::OpenTracing::CanInterface->new(
        test_this           => $thing,
        interface_name      => 'ScopeManager',
        interface_methods   => [
            'activate_span',
            'get_active_scope'
        ],
    );
    
    return $Test->run_tests;
}

1;
