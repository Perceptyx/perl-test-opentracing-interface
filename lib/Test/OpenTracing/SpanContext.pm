package Test::OpenTracing::SpanContext;

use Test::OpenTracing;

sub can_interface_ok {
    my $thing = shift;
    
    my $Test = Test::OpenTracing::Test::CanInterface->new(
        interface_name => 'SpanContext',
        interface_methods => [
            'get_baggage_item',
            'with_baggage_item',
        ],
    );
    
    return $Test->run_tests( $thing );
}

1;
