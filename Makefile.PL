use ExtUtils::MakeMaker::CPANfile;

WriteMakefile(
    'NAME'          => 'Test::OpenTracing',
    'VERSION_FROM'  => 'lib/Test/OpenTracing.pm',
    'LICENSE'       => 'perl',
    test            => {
        TESTS       => 't/*.t t/*/*.t t/*/*/*.t',
    },
);
