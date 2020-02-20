use Test::Most;
use Test::Builder::Tester;

use Test::OpenTracing::Interface::Scope;

my $test_obj = bless {}, 'MyTest::Scope';

run_tests();




done_testing();



sub run_tests {
    
    test_out( "ok 1 - MyTest::Scope->can_interface( 'Scope' )" );
    Test::OpenTracing::Interface::Scope::can_interface_ok( $test_obj );
    test_test( "Tests PASS when 'can_interface_ok' for object" );
    
    test_out( "ok 1 - MyTest::Scope->can_interface( 'Scope' )" );
    Test::OpenTracing::Interface::Scope::can_interface_ok( 'MyTest::Scope' );
    test_test( "Tests PASS when 'can_interface_ok' for class" );
    
    test_out( "not ok 1 - MyTest::Empty->can_interface( 'Scope' )");
    test_diag( sort
        "MyTest::Empty->can('close') failed",
        "MyTest::Empty->can('get_span') failed",
    );
    test_fail( +1 );
    Test::OpenTracing::Interface::Scope::can_interface_ok( 'MyTest::Empty' );
    test_test( "Tests FAIL when 'can_interface_ok' for bad class" );
    
    return
    
}



package MyTest::Scope;

sub close;
sub get_span;
