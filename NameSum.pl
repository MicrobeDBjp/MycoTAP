#! /usr/bin/perl -w
use warnings;
use strict;

my ($input, $output, $aa) = 0;
my (%id_Hash) = ();

$input = $ARGV[0];
open(INPUT, "$input") or die "Can't open \"$input\"\n";

$output = "$input.species.txt";
open(OUTPUT, ">$output") or die "Can't open \"$output\"\n";

open(INPUT, "$input") or die "Can't open \"$input\"\n";
while(<INPUT>){
    if(/^\S+\s+(\S+?\_\S+?)\|\S+?\s+/){
        if(exists($id_Hash{$1})){
            $id_Hash{$1} += 1;
        }
        else{
            $id_Hash{$1} = 1;
        }
    }
    elsif(/^\S+\s+(\S+?\_\S+?)\_\S+?\s+/){
        if(exists($id_Hash{$1})){
            $id_Hash{$1} += 1;
        }
        else{
            $id_Hash{$1} = 1;
        }
    }
}
close INPUT;

foreach $aa (sort keys %id_Hash){
    print OUTPUT "$aa\t$id_Hash{$aa}\n";
}
close OUTPUT;
exit;
