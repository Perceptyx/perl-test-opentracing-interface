package Test::OpenTracing::Interface::ScopeManager;

use Test::OpenTracing::Test::CanInterface;

sub can_interface_ok {
    my $thing = shift;
    
    my $Test = Test::OpenTracing::Test::CanInterface->new(
        interface_name => 'ScopeManager',
        interface_methods => [
            'activate_span',
            'get_active_scope'
        ],
    );
    
    return $Test->run_tests( $thing );
}

1;
