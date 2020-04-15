#!/usr/bin/perl
use strict;
use warnings;

my %acid_of;
{
    my $raw = <<'***';
TTT,TTC                   F #Phe
TTA,TTG,CTT,CTC,CTA,CTG   L #Leu
ATT,ATC,ATA               I #Ile
ATG                       M #Met
GTT,GTC,GTA,GTG           V #Val
TCT,TCC,TCA,TCG           S #Ser
CCT,CCC,CCA,CCG           P #Pro
ACT,ACC,ACA,ACG           T #Thr
GCT,GCC,GCA,GCG           A #Ala
TAT,TAC                   Y #Tyr
TAA,TAG                   * #Stop
CAT,CAC                   H #His
CAA,CAG                   Q #Gln
AAT,AAC                   N #Asn
AAA,AAG                   K #Lys
GAT,GAC                   D #Asp
GAA,GAG                   E #Glu
TGT,TGC                   C #Cys
TGA                       * #Stop
TGG                       W #Trp
CGT,CGC,CGA,CGG           R #Arg
AGT,AGC                   S #Ser
AGA,AGG                   R #Arg
GGT,GGC,GGA,GGG           G #Gly
***

    for my $line (split /\n/, $raw) {
        my ($codons, $acid) = split ' ', $line;
        for my $codon (split /,/, $codons) {
            $acid_of{$codon} = $acid;
        }
    }
}

while (my $line = readline) {
    next if $line !~ /\S/;

    # my %count;
    $line =~ s{\G([ACGT]{3})}{
        my $acid = $acid_of{$1};
        # $count{$acid}++;
        $acid
    }eg;

#    for my $acid (sort keys %count) {
  #      $line .= "$acid: $count{$acid}\n";
    #}
} continue {
    print $line;
}
