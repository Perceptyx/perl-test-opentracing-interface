use Test::More;

use Test::OpenTracing::Interface::SpanContext;

can_ok('Test::OpenTracing::Interface::SpanContext',
    'can_all_ok'
);

done_testing();
