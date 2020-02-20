package Test::OpenTracing::Interface::Tester;

use strict;
use warnings;

use Exporter 'import';

our @EXPORT_OK = qw/run_tests_can_interface_ok/;

use Test::Builder::Tester;


sub run_tests_can_interface_ok {
    my $interface_name = shift;
    my @interface_methods = @_;
    
    my $test_class = 'MyTest::' . $interface_name;
    my $test_module_name = 'Test::OpenTracing::Interface::' . $interface_name;
    my $test_method_name = join '::', $test_module_name, 'can_interface_ok';
    
    my @diag_messages = map {
        "MyTest::Empty->can('$_') failed"
    } @interface_methods;
    
    my $test_obj = bless {}, $test_class;
    
    no strict qw/refs/;
    
    test_out( "ok 1 - $test_class->can_interface( '$interface_name' )" );
    $test_method_name->( $test_obj );
    test_test( "Tests PASS when 'can_interface_ok' for object" );
    
    test_out( "ok 1 - $test_class->can_interface( '$interface_name' )" );
    $test_method_name->( $test_class );
    test_test( "Tests PASS when 'can_interface_ok' for class" );
    
    test_out( "not ok 1 - MyTest::Empty->can_interface( '$interface_name' )");
    test_diag( sort @diag_messages );
    test_fail( +1 );
    $test_method_name->( 'MyTest::Empty' );
    test_test( "Tests FAIL when 'can_interface_ok' for bad class" );
    
    return
    
}

1;
