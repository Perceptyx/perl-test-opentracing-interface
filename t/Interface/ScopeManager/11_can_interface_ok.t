use Test::Most;

use Test::OpenTracing::Interface::ScopeManager;

use lib 't/lib/';
use Test::OpenTracing::Interface::Tester;

my $Test = Test::OpenTracing::Interface::Tester->new(
    interface_name => 'ScopeManager',
    interface_methods => [
        'activate_span',
        'get_active_scope'
    ],
);

$Test->run_tests_can_interface_ok;

done_testing();



package MyTest::ScopeManager;

sub activate_span;
sub get_active_scope;

1;
