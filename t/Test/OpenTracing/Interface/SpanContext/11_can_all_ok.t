use Test::Most;

use Test::OpenTracing::Interface::SpanContext;

use lib 't/lib/';
use Test::OpenTracing::Tester::CanInterface;

my $Test = Test::OpenTracing::Tester::CanInterface->new(
    interface_name => 'SpanContext',
    interface_methods => [
        'get_baggage_item',
        'with_baggage_item',
    ],
);

$Test->run_tests_can_all_ok;

done_testing();



package MyTest::SpanContext;

sub get_baggage_item;
sub with_baggage_item;

1;
