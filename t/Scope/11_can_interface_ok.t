use Test::Most;

use Test::OpenTracing::Scope;

use lib 't/lib/';
use Test::OpenTracing::Tester::CanInterface;

my $Test = Test::OpenTracing::Tester::CanInterface->new(
    interface_name => 'Scope',
    interface_methods => [
        'close',
        'get_span',
    ],
);

$Test->run_tests_can_interface_ok;

done_testing();



package MyTest::Scope;

sub close;
sub get_span;

1;
