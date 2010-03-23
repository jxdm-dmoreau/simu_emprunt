#!/bin/bash
set -x


rm data
for i in $(seq 120000 10000 260000); do ./emprunt.pl --somme=$i >> data; done;


cat > .gpconf << EOF 
set term png size 800,600
set output 'simu1-time.png'
set title ''
set grid
set xlabel 'Somme empruntée (€)'
set ylabel 'Mois'
set key top left
plot 'data' using 1:2 title 'Remboursement complet' with lp, \
        'data' using 1:4 title 'Remboursement par anticipation' with lp, \
        120 title '10 ans', 180 title '15 ans', 240 title '20 ans'
EOF

gnuplot .gpconf

cat > .gpconf << EOF 
set term png size 800,600
set output 'simu1-interet.png'
set title ''
set grid
set xlabel 'Intérêt (€)'
set ylabel 'Mois'
set key top left
plot    'data' using 1:3 title 'Intérêt avec remboursement total' with lp, \
        'data' using 1:5 title 'Intérêt avec remboursement anticipé' with lp
EOF

gnuplot .gpconf
