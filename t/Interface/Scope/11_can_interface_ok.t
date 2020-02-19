use Test::Most;
use Test::Builder::Tester;

use Test::OpenTracing::Interface::Scope;

my $test_obj = bless {}, 'MyTest::Scope';


test_out( "ok 1 - Object of class 'MyTest::Scope' implements all methods" );
Test::OpenTracing::Interface::Scope::can_interface_ok( $test_obj );
test_test( "Tests PASS when 'can_interface_ok' for object - ok" );


done_testing();
