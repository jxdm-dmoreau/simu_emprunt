#!/usr/bin/perl -w

use strict;
use warnings;
use Getopt::Long;

# options

my $apport_init = 0;
my $taux = 0.0375;
my $somme = 200000;
my $nb_mois = 50;
my $epargne = 2000;
GetOptions("somme=i"  => \$somme, "apport=i" =>\$apport_init,
            "taux=f" => \$taux, "nb-mois=i" => \$nb_mois, "epargne=i" => \$epargne);

my $echeance = 1300;
my $loyer = 700;

my $interet = 0;
my $remboursement = 0;


my $nb = 0;
for($nb = 0; $nb <= $nb_mois; $nb++) {
    my $epargne_total = 0;
    my $interet_total = 0;
    my $loyer_total = 0;
    my $somme_restante = $somme - $apport_init;
    $somme_restante -= $epargne*$nb;
    my $i = $nb;
    $loyer_total    += $loyer*$nb;
    while($somme_restante > 0 && $epargne_total < $somme_restante) {
        $i++;
        $epargne_total += ($epargne-$echeance);
        $interet = $somme_restante * $taux/12;
        $interet_total += $interet;
        $remboursement = $echeance - $interet;
        $somme_restante -= $remboursement;
    }
    my $lost = $interet_total + $loyer_total;
    printf("$somme $nb $i %.2f\n", $lost);
}






