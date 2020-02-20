use Test::Most;

use Test::OpenTracing::Interface::Scope;

use lib 't/lib/';
use Test::OpenTracing::Interface::Tester qw/run_tests/;

run_tests( Scope => qw/close get_span/ );

done_testing();



package MyTest::Scope;

sub close;
sub get_span;
