on 'runtime' => sub {
    requires    "Ref::Util";
    requires    "Test::Builder";
};

on 'develop' => sub {
    requires    "ExtUtils::MakeMaker::CPANfile";
};

on 'test' => sub {
    requires    "Test::Most";
    requires    "Test::Builder::Tester";
};
