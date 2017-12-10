use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'inspkt',
    AUTHOR              => 'Chad Adams <nugax@thebytexchange.com>',
    VERSION_FROM        => 'bin/inspkt',
    ABSTRACT_FROM       => 'bin/inspkt',
    LICENSE          	=> 'GPL-3',
    EXE_FILES           => [ qw( bin/inspkt ) ],
    PL_FILES            => {},
    PREREQ_PM => {
        'Switch'        => 0,
        'FTN::Packet'   => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'inspkt-*' },
);
