#!/bin/gnuplot
set terminal svg
set output "exp-pdfs.svg"

set datafile separator ";"
set style fill solid 0.5

stats "exp-0.5.txt" nooutput
N = STATS_records
binsize = (STATS_max_x - STATS_min_x) / (N - 1)

set ylabel "Counts"

plot "exp-0.5.txt" using 1:2:(binsize) every 1::1::N-2 w l title "λ = 0.5",\
     "exp-1.txt" using 1:2:(binsize) every 1::1::N-2 w l title "λ = 1",\
     "exp-1.5.txt" using 1:2:(binsize) every 1::1::N-2 w l title "λ = 1.5"
