#!/usr/bin/perl
use strict;
use warnings;
use Test::More tests => 3;

BEGIN {
  use_ok('Picky::Fonts');
}
require_ok('Picky::Fonts');

can_ok('Picky::Fonts', qw(getfonts setfont));

done_testing(3);

