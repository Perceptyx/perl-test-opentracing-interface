# Perl - Test OpenTracing

Make integration testing easy, for all you care about are spans!


## SYNOPSIS

```perl

use Test::Deep;
use Test::OpenTracing;

$ENV{OPENTRACING_IMPLEMENTATATION} = 'Test';

... # run your test-requests

cmp_deeply_global_tracer (
    [
        superhashof => {
            operation_name  => 'request',
            start_time      => 0.0,
            child_spans     => [
                superhash       => {
                    operation_name  => 'setup',
                    finish_time     => 0.1,
                },
                superhash       => {
                    operation_name  => 'run',
                    start_time      => 0.1,
                    child_spans     => ignore(),
                },
                
            ],
            duration        => 0.3,
        },
    ],
    "Looks like we did create all the expected spans on the right timing"
);

```


## DESCRIPTION

Test::OpenTracing is an easy way to check your OpenTracing compliant framework
integrations.

This is a `cmp_deeply` like test, that works on a special tracer implementation:
`OpenTracing::Implementation::Test`.


## EXPORTED SUBROUTINES

### cmp_deeply_global_tracer


## LICENSE INFORMATION

This library is free software; you can redistribute it and/or modify it under
the terms of the Artistic License 2.0.

This library is distributed in the hope that it will be useful, but it is
provided “as is” and without any express or implied warranties.

For details, see the full text of the license in the file LICENSE.
