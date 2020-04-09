package Test::OpenTracing::Interface::SpanContext;

use Test::OpenTracing::Interface;

sub can_all_ok {
    my $thing = shift;
    
    my $Test = Test::OpenTracing::Interface::CanAll->new(
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
