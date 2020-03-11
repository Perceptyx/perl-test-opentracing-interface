package Test::OpenTracing::Interface::Tracer;

use Test::OpenTracing;

sub can_interface_ok {
    my $thing = shift;
    
    my $Test = Test::OpenTracing::CanInterface->new(
        test_this           => $thing,
        interface_name      => 'Tracer',
        interface_methods   => [
            'extract_context',
            'get_active_span',
            'get_scope_manager',
            'inject_context',
            'start_active_span',
            'start_span',
        ],
    );
    
    return $Test->run_tests;
}

1;
