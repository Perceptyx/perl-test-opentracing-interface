package Test::OpenTracing::Interface::ScopeManager;

use Test::OpenTracing::Interface;

use syntax qw/maybe/;

sub can_all_ok {
    my $class   = shift;
    my $thing   = shift;
    my $message = shift;
    
    my $Test = Test::OpenTracing::Interface::CanAll->new(
        test_this           => $thing,
        interface_name      => 'ScopeManager',
        interface_methods   => [
            'activate_span',
            'get_active_scope'
        ],
        maybe
        message             => $message,
    );
    
    return $Test->run_tests;
}

1;
