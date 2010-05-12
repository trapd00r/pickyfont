#!/usr/bin/perl
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME => 'pickyfont',
    DISTNAME => 'pickyfont',
    PMLIBDIRS => ['lib'],
    ABSTRACT => 'Change terminal font on the fly',
    AUTHOR => 'Magnus Woldrich <trapd00r@trapd00r.se',
    EXE_FILES => ['pickyfont'],
    LICENSE => "GPLv2",
    MIN_PERL_VERSION => 0,
);


