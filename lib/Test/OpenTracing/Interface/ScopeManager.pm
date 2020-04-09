package Test::OpenTracing::Interface::ScopeManager;

use Test::OpenTracing::Interface;

sub can_all_ok {
    my $thing = shift;
    
    my $Test = Test::OpenTracing::Interface::CanAll->new(
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
