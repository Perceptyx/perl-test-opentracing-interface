package Test::OpenTracing::Interface::ContextReference;

use Test::OpenTracing::Interface;

sub can_all_ok {
    my $class = shift;
    my $thing = shift;
    
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
    );
    
    return $Test->run_tests;
}

1;
