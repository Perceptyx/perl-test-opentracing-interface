package Test::OpenTracing::Span;

use Test::OpenTracing;

sub can_interface_ok {
    my $thing = shift;
    
    my $Test = Test::OpenTracing::CanInterface->new(
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
    );
    
    return $Test->run_tests;
}

1;
