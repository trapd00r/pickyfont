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
use Getopt::Long;

our ($t_def, $t_med, $p_sml, $p_med, $p_big, $crisp, $cfobi, $pcms1,   
     $pcms2, $prgy1, $prgy2, $prgy3, $prgy4, $prgy5, $prgy6, $prgy7, $prfsl,
     $spdy1, $spdy2, $p_lrg, $p_hge, $prgsl, $envyr, $inco1, $inco2, $clea1,
     $clea2, $clea3, $clea4, $clea5, $clea6, $fixd1, $fixd2, $fixd3, $fixd4,
     $fixd5, $fixd6, $fixd7, $fixd8);
$t_def = "-*-terminus-medium-*-normal-*-*-*-72-72-c-*-*-*";
$t_med = "-*-terminus-*-*-*-*-*-140-*-*-*-*-*-*";
$p_sml = "-*-profont-medium-*-normal-*-10-*-*-*-*-*-*-*";
$p_med = "-*-profont-*-*-*-*-11-*-*-*-*-*-*-*";
$p_big = "-*-profont-*-*-*-*-12-*-*-*-*-*-*-*";
$p_lrg = "-*-profont-*-*-*-*-15-*-*-*-*-*-*-*";
$p_hge = "-*-profont-*-*-*-*-17-*-*-*-*-*-*-*";
$cfobi = "-*-codingfonttobi-*-*-*-*-*-*-*-*-*-*-*-*";
$pcms1 = "-*-pixelcarnage monospace-*-*-*-*-14-*-*-*-*-*-*-*";
$pcms2 = "-*-pixelcarnage monospace-*-*-*-*-17-*-*-*-*-*-*-*";
$prgy1 = "-*-proggyclean-*-*-*-*-13-*-*-*-*-*-*-*";
$prgy2 = "-*-proggycleancp-*-*-*-*-13-*-*-*-*-*-*-*";
$prgy3 = "-*-proggycleansz-*-*-*-*-13-*-*-*-*-*-*-*";
$prgy4 = "-*-proggyopti-*-*-*-*-11-*-*-*-*-*-*-*";
$prgy5 = "-*-proggyoptis-*-*-*-*-*-*-*-*-*-*-*-*";
$prgy6 = "-*-proggysquare-*-*-*-*-11-*-*-*-*-*-*-*";
$prgy7 = "-*-proggytiny-*-*-*-*-10-*-*-*-*-*-*-*";
$prgsl = "-*-progsole-*-*-*-*-10-*-*-*-*-*-*-*";
$spdy1 = "-*-speedy-*-*-*-*-11-*-*-*-*-*-*-*";
$spdy2 = "-*-speedy-*-*-*-*-12-*-*-*-*-*-*-*";
$envyr = "-misc-envy code r-bold-r-normal--0-0-0-0-m-0-iso8859-1";
$inco1 = "-*-inconsolata-*-*-*-*-*-*-*-*-*-*-*-*";
$inco2 = "-*-inconsolata g-*-*-*-*-*-*-*-*-*-*-*-*";
$clea1 = "-*-clean-*-*-normal-*-10-*-*-*-*-*-*-*";
$clea2 = "-*-clean-*-*-normal-*-12-*-*-*-*-*-*-*";
$clea3 = "-*-clean-*-*-normal-*-13-*-*-*-*-*-*-*";
$clea4 = "-*-clean-*-*-normal-*-14-*-*-*-*-*-*-*";
$clea5 = "-*-clean-*-*-normal-*-15-*-*-*-*-*-*-*";
$clea6 = "-*-clean-*-*-normal-*-16-*-*-*-*-*-*-*";
$fixd1 = "-*-fixed-*-*-*-*-6-*-*-*-*-*-*-*";
$fixd2 = "-*-fixed-*-*-*-*-7-*-*-*-*-*-*-*";
$fixd3 = "-*-fixed-*-*-*-*-9-*-*-*-*-*-*-*";
$fixd4 = "-*-fixed-*-*-*-*-10-*-*-*-*-*-*-*";
$fixd5 = "-*-fixed-*-*-*-*-12-*-*-*-*-*-*-*";
$fixd6 = "-*-fixed-*-*-*-*-13-*-*-*-*-*-*-*";
$fixd7 = "-*-fixed-*-*-*-*-14-*-*-*-*-*-*-*";
$fixd8 = "-*-fixed-*-*-*-*-15-*-*-*-*-*-*-*";

my %fonts = ('terminus1' =>  $t_def,
             'terminus2' =>  $t_med,
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
             'fixed1'    =>  $fixd1,
             'fixed2'    =>  $fixd2,
             'fixed3'    =>  $fixd3,
             'fixed4'    =>  $fixd4,
             'fixed5'    =>  $fixd5,
             'fixed6'    =>  $fixd6,
             'fixed7'    =>  $fixd7,
             'fixed8'    =>  $fixd8,
             );

our ($font, $help);
GetOptions('f=s'  => \$font,
           'h'    => \$help,
           );
if($font) {
  &setfont($font);
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
      printf("\e]710;%s\007", $fonts{$font});
      printf("\e]711;%s\007", $fonts{$font});
      printf("\e]712;%s\007", $fonts{$font});
    }
  }
  exit 0;
}

my $i = 0;
printf("\033[31m%16s\033[0m\n", 'PICK FONT');
foreach my $fontname(sort(keys(%fonts))) {
  ++$i;
  if(0==$i%2) {
    printf("%10s", $fontname);
  }
  else {
    printf("%10s\n", $fontname);
  }
}
print "\nThe recommended font for everyday use is terminus1 or fixed6. \n";

print "Font: ";
my $choice = <STDIN>;
chomp($choice);

for my $key(keys(%fonts)) {
  if($key =~ /$choice/) {
    printf("\e]710;%s\007", $fonts{$choice});
    printf("\e]711;%s\007", $fonts{$choice});
    printf("\e]712;%s\007", $fonts{$choice});
  }
}
