package Test::OpenTracing::Interface::Tracer;

use Test::OpenTracing::Interface;

use syntax qw/maybe/;

sub can_all_ok {
    my $class   = shift;
    my $thing   = shift;
    my $message = shift;
    
    my $Test = Test::OpenTracing::Interface::CanAll->new(
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
        maybe
        message             => $message,
    );
    
    return $Test->run_tests;
}

1;
