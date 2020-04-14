package Test::OpenTracing::Interface::ContextReference;

use Test::OpenTracing::Interface;

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
