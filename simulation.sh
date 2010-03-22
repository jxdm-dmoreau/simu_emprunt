#!/bin/bash
set -x
APPORT=20000
EPARGNE=1800
TAUX="0.0375"

#generate data
for i in $(seq 180000 10000 240000)
do
    ./emprunt.pl --taux=$TAUX --epargne=$EPARGNE --apport=$APPORT --somme=$i > $i.data
done

# plot
echo "" > .gpconf

cat > .gpconf << EOF 
set term png
set output 'interet_$APPORT-$EPARGNE-$TAUX.png'
set title 'Apport: $APPORT€ Epargne:$EPARGNE€ TAUX=$TAUX'
set xlabel 'Mois'
set ylabel 'Intérêt'
plot '180000.data' using 2:4 title '180000€' with lp, \
    '190000.data' using 2:4 title '190000€' with lp, \
    '200000.data' using 2:4 title '200000€' with lp, \
    '210000.data' using 2:4 title '210000€' with lp, \
    '220000.data' using 2:4 title '220000€' with lp, \
    '230000.data' using 2:4 title '230000€' with lp
EOF

gnuplot .gpconf

