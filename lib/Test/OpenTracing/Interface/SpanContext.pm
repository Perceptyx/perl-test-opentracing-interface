package Test::OpenTracing::Interface::SpanContext;

use Test::OpenTracing::Interface;

use Exporter qw/import/;

our @EXPORT_OK = qw/can_all_ok/;
our %EXPORT_TAGS = ( all => [qw/can_all_ok/] );

use syntax qw/maybe/;

sub can_all_ok {
    my $thing   = shift;
    my $message = shift;
    
    my $Test = Test::OpenTracing::Interface::CanAll->new(
        test_this           => $thing,
        interface_name      => 'SpanContext',
        interface_methods   => [
            'get_baggage_item',
            'with_baggage_item',
        ],
        maybe
        message             => $message,
    );
    
    return $Test->run_tests;
}

1;
