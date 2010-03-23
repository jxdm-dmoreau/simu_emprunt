#!/usr/bin/perl -w

use strict;
use warnings;
use Getopt::Long;

# options

my $taux = 0.0375;
my $somme = 200000;
my $epargne = 700;
GetOptions("somme=i"  => \$somme, "taux=f" => \$taux, "epargne=i" => \$epargne);

my $echeance = 1300;
my $interet = 0;
my $remboursement = 0;
my $epargne_total = 0;
my $interet_total = 0;
my $loyer_total = 0;
my $mois = 0;
my $mois_fin_avec_epargne = 0;
my $interet_fin_avec_epargne = 0;
my $somme_restante = $somme;


while($somme_restante > 0) {
    $mois++;
    # interet du mois
    $interet = $somme_restante * $taux/12;
    # interet total
    $interet_total += $interet;
    # remboursement du mois
    $remboursement = $echeance - $interet;
    # remboursement total
    $somme_restante -= $remboursement;
    # epargne
    if ($epargne_total < $somme_restante) {
        $epargne_total += $epargne;
    } else {
        $mois_fin_avec_epargne = $mois if $mois_fin_avec_epargne == 0;
        $interet_fin_avec_epargne = $interet_total if  $interet_fin_avec_epargne == 0;
    }
}

printf("%d %d %.2f %d %.2f\n",$somme, $mois, $interet_total, $mois_fin_avec_epargne,  $interet_fin_avec_epargne);






