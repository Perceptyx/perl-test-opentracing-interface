package Test::OpenTracing::Interface::Span;

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
