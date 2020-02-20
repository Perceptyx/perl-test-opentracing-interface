on 'runtime' => sub {
    requires    "Ref::Util";
    requires    "Test::Builder";
};

on 'develop' => sub {
    requires    "ExtUtils::MakeMaker::CPANfile";
};

on 'test' => sub {
    requires    "Object::Tiny";
    requires    "Test::Most";
    requires    "Test::Builder::Tester";
};
