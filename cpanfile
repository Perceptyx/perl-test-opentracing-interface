on 'runtime' => sub {
    requires    "Moo";
    requires    "PerlX::Maybe";
    requires    "Ref::Util";
    requires    "Test::Builder";
    requires    "Types::Standard", '>=1.010';
    requires    "syntax";
};

on 'develop' => sub {
    requires    "ExtUtils::MakeMaker::CPANfile";
};

on 'test' => sub {
    requires    "Test::More";
    requires    "Test::Builder::Tester", '>=1.28'; # because of CR/LF
};
