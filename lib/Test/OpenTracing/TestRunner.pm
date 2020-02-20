package Test::OpenTracing::TestRunner;

use strict;
use warnings;

use Exporter 'import';
our @EXPORT_OK = qw/run_tests_can_interface_ok/;

use Scalar::Util qw/blessed/;

use Test::Builder;

sub run_tests_can_interface_ok{
    my $thing = shift;
    
    my $interface_name = shift;
    my @interface_methods = @_;
     
    my $thing_name = blessed( $thing ) // "$thing";
    
    my $test_name = "${thing_name}->can_interface( '$interface_name' )";
    
    my $Test = Test::Builder->new;
    local $Test::Builder::Level = $Test::Builder::Level + 1;
    
    my @failures;
    foreach my $method ( sort @interface_methods ) {
        unless ( $thing->can($method) ) {
            $Test->diag("${thing_name}->can('$method') failed");
            push @failures, $method;
        }
    }
    
    my $ok = scalar @failures ? 0 : 1;
    return $Test->ok( $ok, $test_name );
    
}