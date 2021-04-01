#! /usr/local/bin/perl -w
use warnings;
use strict;

my ($input, $ref, $output) = 0;
my (%id_Hash) = ();

$input = $ARGV[0];
open(INPUT, "$input") or die "Can't open \"$input\"\n";

$ref = $ARGV[1];
open(REF, "$ref") or die "Can't open \"$ref\"\n";

$output = "$input.withoutkasanari";
open(OUTPUT, ">$output") or die "Can't open \"$output\"\n";

open(REF, "$ref") or die "Can't open \"$ref\"\n";
while(<REF>){
    if(/^(\S+)\s+/){
        $id_Hash{$1} = 1;
    }
}
close REF;

open(INPUT, "$input") or die "Can't open \"$input\"\n";
while(<INPUT>){
    if(/^(\S+)\s+/){
        if(exists($id_Hash{$1})){
            next;
        }
        else{
            print OUTPUT "$_";
        }
    }
}
close INPUT;
close OUTPUT;
exit;
