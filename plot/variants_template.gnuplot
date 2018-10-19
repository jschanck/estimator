load "variants_header.gnuplot"

# This file generates
#   - variants_hrss_xxxx.svg
#   - variants_ntru_xxxx.svg
#   - variants_sntrup_xxxx.svg
#   - variants_primeq_xxxx.svg
#   - variants_pow2q_xxxx.svg
#   - variants_hrss_p_xxxx.svg


# variants_hrss

reset

set terminal svg enhanced mouse standalone font "arial,10" size plotw, ploth
set output 'variants_hrss_xxxx.svg'

set grid
set xtics 1200,100,3501
set ytics 80,10,361

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel xxxx_ylabel

set key bottom right
set label 1 "Lines connect parameter sets with the same n." at graph .05, graph .9

plot "data/xxxx_hrss_primeq_fw_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, \
     "data/xxxx_hrss_primeq_fw_38.dat" using 5:4 with points pt 8  lc 2 title 'NTRU-HRSS, prime q, fixed weight 3n/8', \
     "data/xxxx_hrss_primeq_fw_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, \
     "data/xxxx_hrss_primeq_fw_12.dat" using 5:4 with points pt 12 lc 2 title 'NTRU-HRSS, prime q, fixed weight 1n/2', \
     "data/xxxx_hrss_primeq_fw_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, \
     "data/xxxx_hrss_primeq_fw_35.dat" using 5:4 with points pt 4  lc 2 title 'NTRU-HRSS, prime q, fixed weight 3n/5', \
     "data/xxxx_hrss_primeq_fw_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, \
     "data/xxxx_hrss_primeq_fw_23.dat" using 5:4 with points pt 6  lc 2 title 'NTRU-HRSS, prime q, fixed weight 2n/3', \
     "data/xxxx_hrss_pow2q_fw_38.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, \
     "data/xxxx_hrss_pow2q_fw_38.dat"  using 5:4 with points pt 8  lc 3 title 'NTRU-HRSS, pow2 q, fixed weight 3n/8', \
     "data/xxxx_hrss_pow2q_fw_12.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, \
     "data/xxxx_hrss_pow2q_fw_12.dat"  using 5:4 with points pt 12 lc 3 title 'NTRU-HRSS, pow2 q, fixed weight 1n/2', \
     "data/xxxx_hrss_pow2q_fw_35.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, \
     "data/xxxx_hrss_pow2q_fw_35.dat"  using 5:4 with points pt 4  lc 3 title 'NTRU-HRSS, pow2 q, fixed weight 3n/5', \
     "data/xxxx_hrss_pow2q_fw_23.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, \
     "data/xxxx_hrss_pow2q_fw_23.dat"  using 5:4 with points pt 6  lc 3 title 'NTRU-HRSS, pow2 q, fixed weight 2n/3', \
     "data/xxxx_hrss_primeq.dat"       using 5:4:(Params(1,2)) with labels hypertext point pt 11 lc rgb "#ffffff" notitle,  \
     "data/xxxx_hrss_primeq.dat"       using 5:4 with points pt 10 lc 1 title 'NTRU-HRSS, prime q, uniform', \
     "data/xxxx_hrss_pow2q.dat"        using 5:4 with points pt 3  lc 7 title 'NTRU-HRSS, pow2 q, uniform', \
     "data/xxxx_hrss_pow2q.dat"        using 5:4:(Params(1,2)) with labels hypertext point pt 3  lc rgb "#ff0000" notitle, \


# variants_ntru

reset

set terminal svg enhanced mouse standalone font "arial,10" size plotw, ploth
set output 'variants_ntru_xxxx.svg'

set grid
set xtics 1200,100,3501
set ytics 80,10,361

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel xxxx_ylabel

set key bottom right
set label 1 "Lines connect parameter sets with the same n." at graph .05, graph .9

plot "data/xxxx_ntru_primeq_ft_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, \
     "data/xxxx_ntru_primeq_ft_38.dat" using 5:4 with points pt 8  lc 2 title 'NTRU, prime q, fixed type 3n/8', \
     "data/xxxx_ntru_primeq_ft_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, \
     "data/xxxx_ntru_primeq_ft_12.dat" using 5:4 with points pt 12 lc 2 title 'NTRU, prime q, fixed type 1n/2', \
     "data/xxxx_ntru_primeq_ft_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, \
     "data/xxxx_ntru_primeq_ft_35.dat" using 5:4 with points pt 4  lc 2 title 'NTRU, prime q, fixed type 3n/5', \
     "data/xxxx_ntru_primeq_ft_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, \
     "data/xxxx_ntru_primeq_ft_23.dat" using 5:4 with points pt 6  lc 2 title 'NTRU, prime q, fixed type 2n/3', \
     "data/xxxx_ntru_pow2q_ft_38.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, \
     "data/xxxx_ntru_pow2q_ft_38.dat"  using 5:4 with points pt 8  lc 3 title 'NTRU, pow2 q, fixed type 3n/8', \
     "data/xxxx_ntru_pow2q_ft_12.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, \
     "data/xxxx_ntru_pow2q_ft_12.dat"  using 5:4 with points pt 12 lc 3 title 'NTRU, pow2 q, fixed type 1n/2', \
     "data/xxxx_ntru_pow2q_ft_35.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, \
     "data/xxxx_ntru_pow2q_ft_35.dat"  using 5:4 with points pt 4  lc 3 title 'NTRU, pow2 q, fixed type 3n/5', \
     "data/xxxx_ntru_pow2q_ft_23.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, \
     "data/xxxx_ntru_pow2q_ft_23.dat"  using 5:4 with points pt 6  lc 3 title 'NTRU, pow2 q, fixed type 2n/3', \


# variants_sntrup

reset

set terminal svg enhanced mouse standalone font "arial,10" size plotw, ploth
set output 'variants_sntrup_xxxx.svg'

set grid
set xtics 1200,100,3501
set ytics 80,10,361

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel xxxx_ylabel

set key bottom right
set label 1 "Lines connect parameter sets with the same n." at graph .05, graph .9

plot "data/xxxx_sntrup.dat"            using 5:4 with lines lc rgb "#aaaaaa" notitle, \
     "data/xxxx_sntrup.dat"            using 5:4 with points pt 2  lc rgb "#ff9f00" title 'Streamlined NTRU Prime, prime q, various weights',                \
     "data/xxxx_sntrup.dat"            using 5:4:(Params3(1,2,3))   with labels hypertext point pt 2  lc rgb "#ff9f00" notitle, \



# variants_primeq

reset

set terminal svg enhanced mouse standalone font "arial,10" size plotw, ploth
set output 'variants_primeq_xxxx.svg'

set grid
set xtics 1200,100,3501
set ytics 80,10,361

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel xxxx_ylabel

set key bottom right
set label 1 "Lines connect parameter sets with the same n." at graph .05, graph .9

plot "data/xxxx_all_primeq.dat"        using 5:4 with lines lc rgb "#aaaaaa" notitle, \
     "data/xxxx_sntrup.dat"            using 5:4 with lines lc rgb "#dddddd" notitle, \
     "data/xxxx_ntru_primeq_ft_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, \
     "data/xxxx_ntru_primeq_ft_38.dat" using 5:4 with points pt 8  lc 3 title 'NTRU, prime q, fixed type 3n/8', \
     "data/xxxx_ntru_primeq_ft_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, \
     "data/xxxx_ntru_primeq_ft_12.dat" using 5:4 with points pt 12 lc 3 title 'NTRU, prime q, fixed type 1n/2', \
     "data/xxxx_ntru_primeq_ft_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, \
     "data/xxxx_ntru_primeq_ft_35.dat" using 5:4 with points pt 4  lc 3 title 'NTRU, prime q, fixed type 3n/5', \
     "data/xxxx_ntru_primeq_ft_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, \
     "data/xxxx_ntru_primeq_ft_23.dat" using 5:4 with points pt 6  lc 3 title 'NTRU, prime q, fixed type 2n/3', \
     "data/xxxx_sntrup.dat"            using 5:4 with points pt 2  lc rgb "#ff9f00" title 'Streamlined NTRU Prime, prime q, various weights',                \
     "data/xxxx_sntrup.dat"            using 5:4:(Params3(1,2,3))   with labels hypertext point pt 2  lc rgb "#ff9f00" notitle, \
     "data/xxxx_hrss_primeq_fw_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, \
     "data/xxxx_hrss_primeq_fw_38.dat" using 5:4 with points pt 8  lc 2 title 'NTRU-HRSS, prime q, fixed weight 3n/8', \
     "data/xxxx_hrss_primeq_fw_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, \
     "data/xxxx_hrss_primeq_fw_12.dat" using 5:4 with points pt 12 lc 2 title 'NTRU-HRSS, prime q, fixed weight 1n/2', \
     "data/xxxx_hrss_primeq_fw_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, \
     "data/xxxx_hrss_primeq_fw_35.dat" using 5:4 with points pt 4  lc 2 title 'NTRU-HRSS, prime q, fixed weight 3n/5', \
     "data/xxxx_hrss_primeq_fw_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, \
     "data/xxxx_hrss_primeq_fw_23.dat" using 5:4 with points pt 6  lc 2 title 'NTRU-HRSS, prime q, fixed weight 2n/3', \
     "data/xxxx_hrss_primeq.dat"       using 5:4:(Params(1,2)) with labels hypertext point pt 11 lc rgb "#ffffff" notitle,  \
     "data/xxxx_hrss_primeq.dat"       using 5:4 with points pt 10 lc 1 title 'NTRU-HRSS, prime q, uniform'



# variants_pow2q

reset

set terminal svg enhanced mouse standalone font "arial,10" size plotw, ploth
set output 'variants_pow2_xxxx.svg'

set grid
set xtics 1200,100,3501
set ytics 80,10,361

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel xxxx_ylabel

set key bottom right
set label 1 "Lines connect parameter sets with the same n." at graph .05, graph .9

plot "data/xxxx_all_pow2q.dat"       using 5:4 with lines lc rgb "#aaaaaa" notitle, \
     "data/xxxx_ntru_pow2q_ft_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, \
     "data/xxxx_ntru_pow2q_ft_38.dat" using 5:4 with points pt 8  lc 3 title 'NTRU, pow2 q, fixed type 3n/8', \
     "data/xxxx_ntru_pow2q_ft_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, \
     "data/xxxx_ntru_pow2q_ft_12.dat" using 5:4 with points pt 12 lc 3 title 'NTRU, pow2 q, fixed type 1n/2', \
     "data/xxxx_ntru_pow2q_ft_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, \
     "data/xxxx_ntru_pow2q_ft_35.dat" using 5:4 with points pt 4  lc 3 title 'NTRU, pow2 q, fixed type 3n/5', \
     "data/xxxx_ntru_pow2q_ft_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, \
     "data/xxxx_ntru_pow2q_ft_23.dat" using 5:4 with points pt 6  lc 3 title 'NTRU, pow2 q, fixed type 2n/3', \
     "data/xxxx_hrss_pow2q_fw_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, \
     "data/xxxx_hrss_pow2q_fw_38.dat" using 5:4 with points pt 8  lc 2 title 'NTRU-HRSS, pow2 q, fixed weight 3n/8', \
     "data/xxxx_hrss_pow2q_fw_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, \
     "data/xxxx_hrss_pow2q_fw_12.dat" using 5:4 with points pt 12 lc 2 title 'NTRU-HRSS, pow2 q, fixed weight 1n/2', \
     "data/xxxx_hrss_pow2q_fw_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, \
     "data/xxxx_hrss_pow2q_fw_35.dat" using 5:4 with points pt 4  lc 2 title 'NTRU-HRSS, pow2 q, fixed weight 3n/5', \
     "data/xxxx_hrss_pow2q_fw_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, \
     "data/xxxx_hrss_pow2q_fw_23.dat" using 5:4 with points pt 6  lc 2 title 'NTRU-HRSS, pow2 q, fixed weight 2n/3', \
     "data/xxxx_hrss_pow2q.dat"       using 5:4 with points pt 3  lc 7 title 'NTRU-HRSS, pow2 q, uniform', \
     "data/xxxx_hrss_pow2q.dat"       using 5:4:(Params(1,2)) with labels hypertext point pt 3  lc rgb "#ff0000" notitle, \






#  Various values of p

reset

set terminal svg font "arial,10" size plotw, ploth
set output 'variants_hrss_p_xxxx.svg'

set grid
set xtics 1200,200,4001
set ytics 80,10,361

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel xxxx_ylabel

set key bottom right

plot "data/xxxx_hrss_primeq_p2.dat" using 5:4 with points pt 2 lc 1 title 'NTRU-HRSS, prime q, p=2', \
     "data/xxxx_hrss_primeq_p3.dat" using 5:4 with points pt 4 lc 2 title 'NTRU-HRSS, prime q, p=3', \
     "data/xxxx_hrss_primeq_p4.dat" using 5:4 with points pt 6 lc 3 title 'NTRU-HRSS, prime q, p=4', \
     "data/xxxx_hrss_primeq_p5.dat" using 5:4 with points pt 8 lc 4 title 'NTRU-HRSS, prime q, p=5', \
