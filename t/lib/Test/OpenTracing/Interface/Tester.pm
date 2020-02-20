package Test::OpenTracing::Interface::Tester;

use strict;
use warnings;

use Exporter 'import';

our @EXPORT_OK = qw/run_tests_can_interface_ok/;

use Test::Builder::Tester;

use Object::Tiny qw/interface_name interface_methods/;

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

sub test_class_name { 'MyTest::' . $_[0]->interface_name }

sub test_method_can_interface_ok { shift->test_method('can_interface_ok', @_) }

sub test_method {
    my $self = shift;
    my $method_name = shift;
    
    my $test_method = join '::',
        'Test::OpenTracing::Interface',
        $self->interface_name(),
        $method_name;
    
    no strict qw/refs/;
    
    $test_method->( @_ ) # if this is not line 46, than test_fail, will fail
}

sub test_object { bless {}, $_[0]->test_class_name() }

sub ok_message {
    my $self = shift;
    my $test_class = shift // $self->test_class_name;
    my $interface_name = $self->interface_name;
    return "ok 1 - $test_class->can_interface( '$interface_name' )"
}

sub not_ok_message {
    my $ok_message = shift->ok_message( @_ );
    
    return "not $ok_message"
}

sub diag_messages {
    my $self = shift;
    
    my @diag_messages = map {
        "MyTest::Empty->can('$_') failed"
    } @{$self->interface_methods};
    
    return @diag_messages
}



1;
