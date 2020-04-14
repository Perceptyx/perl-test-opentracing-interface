package Test::OpenTracing::Interface::Scope;

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
        interface_name      => 'Scope',
        interface_methods   => [ 
            'close',
            'get_span',
        ],
        maybe
        message             => $message,
    );
    
    return $Test->run_tests;
}

1;
