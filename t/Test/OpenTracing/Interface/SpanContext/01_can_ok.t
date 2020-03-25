use Test::Most;

use Test::OpenTracing::Interface::SpanContext;

can_ok('Test::OpenTracing::Interface::SpanContext',
    'can_interface_ok'
);

done_testing();
