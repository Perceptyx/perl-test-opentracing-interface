package Test::OpenTracing::Interface::ContextReference;

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
        interface_name      => 'ContextReference',
        interface_methods   => [ 
            'new_child_of',
            'new_follows_from',
            'get_referenced_context',
            'type_is_child_of',
            'type_is_follows_from',
        ],
        maybe
        message             => $message,
    );
    
    return $Test->run_tests;
}

1;
