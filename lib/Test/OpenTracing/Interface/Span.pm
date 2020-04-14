package Test::OpenTracing::Interface::Span;

use Test::OpenTracing::Interface;

use syntax qw/maybe/;

sub can_all_ok {
    my $class   = shift;
    my $thing   = shift;
    my $message = shift;
    
    my $Test = Test::OpenTracing::Interface::CanAll->new(
        test_this           => $thing,
        interface_name      => 'Span',
        interface_methods   => [
            'finish',
            'get_baggage_item',
            'get_context',
            'log_data',
            'overwrite_operation_name',
            'set_baggage_item',
            'set_tag',
        ],
        maybe
        message             => $message,
    );
    
    return $Test->run_tests;
}

1;
