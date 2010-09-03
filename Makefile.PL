use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'HTTPGrepUI',
    AUTHOR              => q{Joshua Barratt <josh@mediatemple.net>},
    VERSION_FROM        => 'lib/HTTPGrepUI.pm',
    ABSTRACT            => 'Web UI front to HTTPGrep',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'YAML'       => 0,
        'Dancer'     => 1.1805,
        'HTTPGrep'   => 0,
        'Template'   => 0,
        'YAML::XS'   => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'HTTPGrepUI-*' },
);
