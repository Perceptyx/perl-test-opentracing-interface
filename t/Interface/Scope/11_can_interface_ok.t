use Test::Most;
use Test::Builder::Tester;

use Test::OpenTracing::Interface::Scope;

my $test_obj = bless {}, 'MyTest::Scope';

run_tests( Scope => qw/close get_span/ );


done_testing();



sub run_tests {
    my $interface_name = shift;
    my @interface_methods = @_;
    
    my $test_class = 'MyTest::' . $interface_name;
    
    my @diag_messages = map {
        "MyTest::Empty->can('$_') failed"
    } @interface_methods;
        
    test_out( "ok 1 - $test_class->can_interface( '$interface_name' )" );
    Test::OpenTracing::Interface::Scope::can_interface_ok( $test_obj );
    test_test( "Tests PASS when 'can_interface_ok' for object" );
    
    test_out( "ok 1 - $test_class->can_interface( '$interface_name' )" );
    Test::OpenTracing::Interface::Scope::can_interface_ok( $test_class );
    test_test( "Tests PASS when 'can_interface_ok' for class" );
    
    test_out( "not ok 1 - MyTest::Empty->can_interface( '$interface_name' )");
    test_diag( sort @diag_messages );
    test_fail( +1 );
    Test::OpenTracing::Interface::Scope::can_interface_ok( 'MyTest::Empty' );
    test_test( "Tests FAIL when 'can_interface_ok' for bad class" );
    
    return
    
}



package MyTest::Scope;

sub close;
sub get_span;
