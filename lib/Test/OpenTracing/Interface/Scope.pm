package Test::OpenTracing::Interface::Scope;

use Test::OpenTracing::TestRunner qw/run_tests_can_interface_ok/;

my $interface_name = 'Scope';
my @interface_methods = qw{
    close
    get_span
};

sub can_interface_ok {
    my $thing = shift;
    
    return run_tests_can_interface_ok(
        $thing,
        $interface_name => @interface_methods
    )
}

1;
