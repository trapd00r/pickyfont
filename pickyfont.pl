#!/usr/bin/perl 
# pickyfont - Pick Your Font... on the fly
# Copyright (C) 2010 trapd00r <trapd00r@trapd00r.se>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


use strict;
use warnings;
use Getopt::Long;

our ($t_def, $t_med, $f_big, $p_sml, $p_med, $p_big, $crisp, $cfobi, $pcms1,   
     $pcms2, $prgy1, $prgy2, $prgy3, $prgy4, $prgy5, $prgy6, $prgy7, $prfsl,
     $spdy1, $spdy2, $p_lrg, $p_hge, $prgsl, $envyr, $inco1, $inco2, $clea1,
     $clea2, $clea3, $clea4, $clea5, $clea6);
$t_def = "\033]50;-*-terminus-medium-*-normal-*-*-*-72-72-c-*-*-*\007";
$t_med = "\033]50;-*-terminus-*-*-*-*-12-*-72-72-*-*-*-*\007";
$f_big = "\033]50;-misc-fixed-medium-r-normal-*-*-150-*-*-c-*-iso8859-15\007";
$p_sml = "\033]50;-*-profont-medium-*-normal-*-10-*-*-*-*-*-*-*\007";
$p_med = "\033]50;-*-profont-*-*-*-*-11-*-*-*-*-*-*-*\007";
$p_big = "\033]50;-*-profont-*-*-*-*-12-*-*-*-*-*-*-*\007";
$p_lrg = "\033]50;-*-profont-*-*-*-*-15-*-*-*-*-*-*-*\007";
$p_hge = "\033]50;-*-profont-*-*-*-*-17-*-*-*-*-*-*-*\007";
$cfobi = "\033]50;-*-codingfonttobi-*-*-*-*-*-*-*-*-*-*-*-*\007";
$pcms1 = "\033]50;-*-pixelcarnage monospace-*-*-*-*-14-*-*-*-*-*-*-*\007";
$pcms2 = "\033]50;-*-pixelcarnage monospace-*-*-*-*-17-*-*-*-*-*-*-*\007";
$prgy1 = "\033]50;-*-proggyclean-*-*-*-*-13-*-*-*-*-*-*-*\007";
$prgy2 = "\033]50;-*-proggycleancp-*-*-*-*-13-*-*-*-*-*-*-*\007";
$prgy3 = "\033]50;-*-proggycleansz-*-*-*-*-13-*-*-*-*-*-*-*\007";
$prgy4 = "\033]50;-*-proggyopti-*-*-*-*-11-*-*-*-*-*-*-*\007";
$prgy5 = "\033]50;-*-proggyoptis-*-*-*-*-*-*-*-*-*-*-*-*\007";
$prgy6 = "\033]50;-*-proggysquare-*-*-*-*-11-*-*-*-*-*-*-*\007";
$prgy7 = "\033]50;-*-proggytiny-*-*-*-*-10-*-*-*-*-*-*-*\007";
$prgsl = "\033]50;-*-progsole-*-*-*-*-10-*-*-*-*-*-*-*\007";
$spdy1 = "\033]50;-*-speedy-*-*-*-*-11-*-*-*-*-*-*-*\007";
$spdy2 = "\033]50;-*-speedy-*-*-*-*-12-*-*-*-*-*-*-*\007";
$envyr = "\033]50;-*-envy code r-*-*-*-*-17-*-*-*-m-0-*-*\007";
$inco1 = "\033]50;-*-inconsolata-*-*-*-*-*-*-*-*-*-*-*-*\007";
$inco2 = "\033]50;-*-inconsolata g-*-*-*-*-*-*-*-*-*-*-*-*\007";
$clea1 = "\033]50;-*-clean-*-*-normal-*-10-*-*-*-*-*-*-*\007";
$clea2 = "\033]50;-*-clean-*-*-normal-*-12-*-*-*-*-*-*-*\007";
$clea3 = "\033]50;-*-clean-*-*-normal-*-13-*-*-*-*-*-*-*\007";
$clea4 = "\033]50;-*-clean-*-*-normal-*-14-*-*-*-*-*-*-*\007";
$clea5 = "\033]50;-*-clean-*-*-normal-*-15-*-*-*-*-*-*-*\007";
$clea6 = "\033]50;-*-clean-*-*-normal-*-16-*-*-*-*-*-*-*\007";

my %fonts = ('terminus1' =>  $t_def,
             'terminus2' =>  $t_med,
             'fixed'     =>  $f_big,
             'profont1'  =>  $p_sml,
             'profont2'  =>  $p_med,
             'profont3'  =>  $p_big,
             'profont4'  =>  $p_lrg,
             'profont5'  =>  $p_hge,
             'codef'     =>  $cfobi,
             'pixelc1'   =>  $pcms1,
             'pixelc2'   =>  $pcms2,
             'proggy1'   =>  $prgy1,
             'proggy2'   =>  $prgy2,
             'proggy3'   =>  $prgy3,
             'proggy4'   =>  $prgy4,
             'proggy5'   =>  $prgy5,
             'proggy6'   =>  $prgy6,
             'proggy7'   =>  $prgy7,
             'progsole'  =>  $prgsl,
             'speedy1'   =>  $spdy1,
             'speedy2'   =>  $spdy2,
             'envyr'     =>  $envyr,
             'inco1'     =>  $inco1,
             'inco2'     =>  $inco2,
             'clea1'     =>  $clea1,
             'clea2'     =>  $clea2,
             'clea3'     =>  $clea3,
             'clea4'     =>  $clea4,
             'clea5'     =>  $clea5,
             'clea6'     =>  $clea6,

             );

our ($font, $help);
GetOptions('f=s'  => \$font,
           'h'    =>  \$help,
           );
if($font) {
  print &setfont($font);
  exit 0;
}
if($help) {
  print << "HELP";
  USAGE: $0 [OPTIONS]
  -f  set font without calling the interactive font-chooser
  -h  help
HELP

exit 0;
}

sub setfont {
  my $font = shift;
  chomp($font);
  for my $key(keys(%fonts)) {
    if($key =~ /$font/) {
      return $fonts{$font};
    }
  }
  exit 0;
}


print "\033[31;1m PICK YOUR FONT\033[0m\n";
foreach my $fontname(sort(keys(%fonts))) {
  print $fontname, "\n"
}
print "\nThe recommended font for everyday use is terminus1. \n";

print "Font: ";
my $choice = <STDIN>;
chomp($choice);

for my $key(keys(%fonts)) {
  if($key =~ /$choice/) {
    printf $fonts{$choice};
  }
}
