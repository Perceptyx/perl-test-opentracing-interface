package Test::OpenTracing::Interface::SpanContext;

use Test::OpenTracing::Interface;

sub can_interface_ok {
    my $thing = shift;
    
    my $Test = Test::OpenTracing::Interface::CanInterface->new(
        test_this           => $thing,
        interface_name      => 'SpanContext',
        interface_methods   => [
            'get_baggage_item',
            'with_baggage_item',
        ],
    );
    
    return $Test->run_tests;
}

1;
