#!/usr/bin/perl                                                                                                                                                                                                                                                 
use warnings;
use strict;
use Getopt::Long;
my $file;
GetOptions(
'file=s' => \$file
) or die "Whoops";

my $count = 0;
open(FH,'<',$file) or die "Couldn't open file file.txt, $!";
while(<FH>) {
    $count++;
}
print "$count\n" ;
