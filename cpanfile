on 'runtime' => sub {
    requires    "Moo";
    requires    "Ref::Util";
    requires    "Test::Builder";
    requires    "Types::Standard", '>=1.010';
};

on 'develop' => sub {
    requires    "ExtUtils::MakeMaker::CPANfile";
};

on 'test' => sub {
    requires    "Test::Most";
    requires    "Test::Builder::Tester";
};
