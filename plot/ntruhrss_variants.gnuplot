
# Mouse-over text
Params(a,b) = sprintf("n=%d, q=%d", column(a), column(b))
Params3(a,b,c) = sprintf("n=%d, q=%d, w=%.2fn", column(a), column(b), column(c)/column(a))

# Constants for arrows
ntruhrss701_bytes = 2276          # 2 * ceil(700*log(2,8192)/8)
ntruhrss701_sievecost = 134
ntruhrss701_enumcost  = 207

sntrup4591761_bytes = 1158 + 1007 # ceil(761*log(2,4591)/8)+ceil(761*log(2,4591/3)/8)
sntrup4591761_sievecost = 151
sntrup4591761_enumcost  = 225


plotw = 768
ploth = 768


#  Fixed weight prime q vs uniform prime q vs ntruhrss

reset

set terminal svg enhanced mouse standalone font "arial,10" size plotw, ploth
set output 'variants_primeq_sieve.svg'

set grid
set xtics 1200,100,3501
set ytics 80,10,361

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel 'Core-sieve attack cost (log scale)'

set key bottom right
set label 1 "Lines connect parameter sets with the same n." at graph .05, graph .9

set arrow 1 from ntruhrss701_bytes+20, ntruhrss701_sievecost-10 to ntruhrss701_bytes+2, ntruhrss701_sievecost+1
set label 2 "ntruhrss701" at ntruhrss701_bytes+20, ntruhrss701_sievecost-11
# Data is input twice. First for mouse over text, then for points

plot "data/sieve_all_primeq.dat"            using 5:4 with lines lc rgb "#aaaaaa" notitle, \
     "data/sieve_hrss_primeq_fw_38.dat"     using 5:4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, \
        "data/sieve_hrss_primeq_fw_38.dat"  using 5:4 with points pt 8  lc 2 title 'prime q, fixed weight 3n/8', \
     "data/sieve_hrss_primeq_fw_12.dat"     using 5:4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, \
        "data/sieve_hrss_primeq_fw_12.dat"  using 5:4 with points pt 12 lc 2 title 'prime q, fixed weight 1n/2', \
     "data/sieve_hrss_primeq_fw_35.dat"     using 5:4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, \
        "data/sieve_hrss_primeq_fw_35.dat"  using 5:4 with points pt 4  lc 2 title 'prime q, fixed weight 3n/5', \
     "data/sieve_hrss_primeq_fw_23.dat"     using 5:4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, \
        "data/sieve_hrss_primeq_fw_23.dat"  using 5:4 with points pt 6  lc 2 title 'prime q, fixed weight 2n/3', \
     "data/sieve_ntru_primeq_ft_38.dat"     using 5:4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, \
        "data/sieve_ntru_primeq_ft_38.dat"  using 5:4 with points pt 8  lc 3 title 'prime q, fixed type 3n/8', \
     "data/sieve_ntru_primeq_ft_12.dat"     using 5:4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, \
        "data/sieve_ntru_primeq_ft_12.dat"  using 5:4 with points pt 12 lc 3 title 'prime q, fixed type 1n/2', \
     "data/sieve_ntru_primeq_ft_35.dat"     using 5:4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, \
        "data/sieve_ntru_primeq_ft_35.dat"  using 5:4 with points pt 4  lc 3 title 'prime q, fixed type 3n/5', \
     "data/sieve_ntru_primeq_ft_23.dat"     using 5:4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, \
        "data/sieve_ntru_primeq_ft_23.dat"  using 5:4 with points pt 6  lc 3 title 'prime q, fixed type 2n/3', \
     "data/sieve_hrss_primeq.dat"           using 5:4:(Params(1,2)) with labels hypertext point pt 11 lc rgb "#ffffff" notitle,  \
         "data/sieve_hrss_primeq.dat"       using 5:4 with points pt 10 lc 1 title 'prime q, uniform', \
     "data/sieve_hrss_pow2q.dat"            using 5:4 with points pt 3  lc 7 title 'NTRU-HRSS', \
        "data/sieve_hrss_pow2q.dat"         using 5:4:(Params(1,2)) with labels hypertext point pt 3  lc rgb "#ff0000" notitle, \


#  Fixed weight prime q vs uniform prime q vs ntruhrss

reset

set terminal svg enhanced mouse standalone font "arial,10" size plotw, ploth
set output 'variants_primeq_enum.svg'

set grid
set xtics 1200,100,3501
set ytics 80,10,361

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel 'Hybrid-enum attack cost (log scale)'

set key bottom right
set label 1 "Lines connect parameter sets with the same n." at graph .05, graph .9

set arrow 2 from ntruhrss701_bytes+40, ntruhrss701_enumcost-20 to ntruhrss701_bytes+8, ntruhrss701_enumcost-4
set label 4 "ntruhrss701" at ntruhrss701_bytes+40, ntruhrss701_enumcost-21

# Data is input twice. First for mouse over text, then for points
plot "data/enum_all_primeq.dat"        using 5:4 with lines lc rgb "#aaaaaa" notitle, \
     "data/enum_hrss_primeq_fw_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, \
     "data/enum_hrss_primeq_fw_38.dat" using 5:4 with points pt 8  lc 2 title 'prime q, fixed weight 3n/8', \
     "data/enum_hrss_primeq_fw_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, \
     "data/enum_hrss_primeq_fw_12.dat" using 5:4 with points pt 12 lc 2 title 'prime q, fixed weight 1n/2', \
     "data/enum_hrss_primeq_fw_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, \
     "data/enum_hrss_primeq_fw_35.dat" using 5:4 with points pt 4  lc 2 title 'prime q, fixed weight 3n/5', \
     "data/enum_hrss_primeq_fw_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, \
     "data/enum_hrss_primeq_fw_23.dat" using 5:4 with points pt 6  lc 2 title 'prime q, fixed weight 2n/3', \
     "data/enum_ntru_primeq_ft_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, \
     "data/enum_ntru_primeq_ft_38.dat" using 5:4 with points pt 8  lc 3 title 'prime q, fixed type 3n/8', \
     "data/enum_ntru_primeq_ft_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, \
     "data/enum_ntru_primeq_ft_12.dat" using 5:4 with points pt 12 lc 3 title 'prime q, fixed type 1n/2', \
     "data/enum_ntru_primeq_ft_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, \
     "data/enum_ntru_primeq_ft_35.dat" using 5:4 with points pt 4  lc 3 title 'prime q, fixed type 3n/5', \
     "data/enum_ntru_primeq_ft_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, \
     "data/enum_ntru_primeq_ft_23.dat" using 5:4 with points pt 6  lc 3 title 'prime q, fixed type 2n/3', \
     "data/enum_hrss_primeq.dat"       using 5:4:(Params(1,2)) with labels hypertext point pt 11 lc rgb "#ffffff" notitle,  \
     "data/enum_hrss_primeq.dat"       using 5:4 with points pt 10 lc 1 title 'prime q, uniform', \
     "data/enum_hrss_pow2q.dat"        using 5:4 with points pt 3  lc 7 title 'NTRU-HRSS', \
     "data/enum_hrss_pow2q.dat"        using 5:4:(Params(1,2)) with labels hypertext point pt 3  lc rgb "#ff0000" notitle, \

#  Fixed weight prime q vs streamlined ntruprime

reset

set terminal svg enhanced mouse standalone font "arial,10" size plotw, ploth
set output 'variants_primeq_vs_sntrup.svg'

set grid
set xtics 1200,100,3501
set ytics 80,10,361

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel 'Core-sieve attack cost (log scale)'

set key bottom right
set label 1 "Lines connect parameter sets that use the same n." at graph .05, graph .8

set arrow 3 from sntrup4591761_bytes-250,sntrup4591761_sievecost+5 to sntrup4591761_bytes-20,sntrup4591761_sievecost+.5
set label 3 "sntrup4591761" at sntrup4591761_bytes-450,sntrup4591761_sievecost+6

set arrow 1 from ntruhrss701_bytes+150, ntruhrss701_sievecost-5 to ntruhrss701_bytes+25, ntruhrss701_sievecost+1
set label 2 "ntruhrss701" at ntruhrss701_bytes+150, ntruhrss701_sievecost-6

plot "data/sieve_ntru_primeq_ft.dat"    using 5:4 with lines    lc rgb "#aaaaaa" notitle, \
     "data/sieve_sntrup.dat"            using 5:4      with lines    lt rgb "#cccccc" notitle, \
     "data/sieve_ntru_primeq_ft_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, \
     "data/sieve_ntru_primeq_ft_38.dat" using 5:4 with points   pt 8  lc 3 title 'NTRU, prime q,  fixed type 3n/8', \
     "data/sieve_ntru_primeq_ft_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, \
     "data/sieve_ntru_primeq_ft_12.dat" using 5:4 with points   pt 12 lc 3 title 'NTRU, prime q,  fixed type 1n/2', \
     "data/sieve_ntru_primeq_ft_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, \
     "data/sieve_ntru_primeq_ft_35.dat" using 5:4 with points   pt 4  lc 3 title 'NTRU, prime q,  fixed type 3n/5', \
     "data/sieve_ntru_primeq_ft_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, \
     "data/sieve_ntru_primeq_ft_23.dat" using 5:4 with points   pt 6  lc 3 title 'NTRU, prime q,  fixed type 2n/3', \
     "data/sieve_sntrup.dat"            using 5:4 with points        pt 2  lc rgb "#ff9f00" title 'Streamlined NTRU Prime, prime q, various weights',                \
     "data/sieve_sntrup.dat"            using 5:4:(Params3(1,2,3))   with labels hypertext point pt 2  lc rgb "#ff9f00" notitle, \
     "data/sieve_hrss_primeq.dat"       using 5:4:(Params(1,2)) with labels hypertext point pt 11 lc rgb "#ffffff" notitle,  \
     "data/sieve_hrss_primeq.dat"       using 5:4 with points   pt 10 lc 1 title 'NTRU-HRSS, prime q,   uniform trinary', \
     "data/sieve_hrss_pow2q.dat"        using 5:4 with points   pt 3  lc 7 title 'NTRU-HRSS, pow2 q,   uniform trinary', \
     "data/sieve_hrss_pow2q.dat"        using 5:4:(Params(1,2)) with labels hypertext point pt 3  lc rgb "#ff0000" notitle, \







#  Various values of p

reset

set terminal svg font "arial,10" size plotw, ploth
set output 'variants_p_sieve.svg'

set grid
#set xrange [1500:3000]
#set yrange [100:260]
set xtics 1200,200,4001
set ytics 80,10,361

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel 'Core-sieve attack cost (log scale)'

set key bottom right

# Data is input twice. First for mouse over text, then for points
plot "data/sieve_hrss_primeq_p2.dat"    using 5:4 with points pt 2 lc 1 title 'p=2', \
        "data/sieve_hrss_primeq_p3.dat" using 5:4 with points pt 4 lc 2 title 'p=3', \
        "data/sieve_hrss_primeq_p4.dat" using 5:4 with points pt 6 lc 3 title 'p=4', \
        "data/sieve_hrss_primeq_p5.dat" using 5:4 with points pt 8 lc 4 title 'p=5', \


#  Fixed weight prime q vs uniform prime q vs ntruhrss

reset

set terminal svg font "arial,10" size plotw, ploth
set output 'variants_p_enum.svg'
set title "Comparison of NTRU-HRSS variants: prime q, arbitrary weight, various p" font ",14"

set grid
set xrange [1500:3000]
set yrange [100:260]
set xtics 1200,100,3501
set ytics 80,10,361

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel 'Hybrid-enum attack cost (log scale)'

set key bottom right

# Data is input twice. First for mouse over text, then for points
plot "data/enum_hrss_primeq_p2.dat" using 5:4 with points pt 2 lc 1 title 'p=2', \
     "data/enum_hrss_primeq_p3.dat" using 5:4 with points pt 4 lc 2 title 'p=3', \
     "data/enum_hrss_primeq_p4.dat" using 5:4 with points pt 6 lc 3 title 'p=4', \
     "data/enum_hrss_primeq_p5.dat" using 5:4 with points pt 8 lc 4 title 'p=5', \









#  Fixed weight pow2 q vs ntruhrss

reset

set terminal svg enhanced mouse standalone font "arial,10" size plotw, ploth
set output 'variants_fixed_pow2.svg'

set grid
set xtics 1200,100,3501
set ytics 80,10,361

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel 'Core-sieve attack cost (log scale)'

set key bottom right
set label 1 "Lines connect parameter sets with the same n." at graph .05, graph .9

set arrow 1 from ntruhrss701_bytes+20, ntruhrss701_sievecost-10 to ntruhrss701_bytes+2, ntruhrss701_sievecost+1
set label 2 "ntruhrss701" at ntruhrss701_bytes+20, ntruhrss701_sievecost-11
# Data is input twice. First for mouse over text, then for points
plot "data/sieve_hrss_pow2q_fw_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, \
     "data/sieve_hrss_pow2q_fw_38.dat" using 5:4 with points pt 8  lc 2 title 'NTRU-HRSS, pow2 q, fixed weight 3n/8', \
     "data/sieve_hrss_pow2q_fw_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, \
     "data/sieve_hrss_pow2q_fw_12.dat" using 5:4 with points pt 12 lc 2 title 'NTRU-HRSS, pow2 q, fixed weight 1n/2', \
     "data/sieve_hrss_pow2q_fw_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, \
     "data/sieve_hrss_pow2q_fw_35.dat" using 5:4 with points pt 4  lc 2 title 'NTRU-HRSS, pow2 q, fixed weight 3n/5', \
     "data/sieve_hrss_pow2q_fw_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, \
     "data/sieve_hrss_pow2q_fw_23.dat" using 5:4 with points pt 6  lc 2 title 'NTRU-HRSS, pow2 q, fixed weight 2n/3', \
     "data/sieve_ntru_pow2q_ft_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, \
     "data/sieve_ntru_pow2q_ft_38.dat" using 5:4 with points pt 8  lc 3 title 'NTRU, pow2 q, fixed type 3n/8', \
     "data/sieve_ntru_pow2q_ft_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, \
     "data/sieve_ntru_pow2q_ft_12.dat" using 5:4 with points pt 12 lc 3 title 'NTRU, pow2 q, fixed type 1n/2', \
     "data/sieve_ntru_pow2q_ft_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, \
     "data/sieve_ntru_pow2q_ft_35.dat" using 5:4 with points pt 4  lc 3 title 'NTRU, pow2 q, fixed type 3n/5', \
     "data/sieve_ntru_pow2q_ft_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, \
     "data/sieve_ntru_pow2q_ft_23.dat" using 5:4 with points pt 6  lc 3 title 'NTRU, pow2 q, fixed type 2n/3', \
     "data/sieve_hrss_pow2q.dat"       using 5:4 with points pt 3  lc 7 title 'NTRU-HRSS, pow2 q, uniform', \
     "data/sieve_hrss_pow2q.dat"       using 5:4:(Params(1,2)) with labels hypertext point pt 3  lc rgb "#ff0000" notitle, \


#  Fixed weight pow 2 vs ntruhrss

reset

set terminal svg enhanced mouse standalone font "arial,10" size plotw, ploth
set output 'variants_fixed_pow2_enum.svg'

set grid
set xtics 1200,100,3501
set ytics 80,10,361

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel 'Hybrid-enum attack cost (log scale)'

set key bottom right
set label 1 "Lines connect parameter sets with the same n." at graph .05, graph .9

set arrow 2 from ntruhrss701_bytes+40, ntruhrss701_enumcost-20 to ntruhrss701_bytes+8, ntruhrss701_enumcost-4
set label 4 "ntruhrss701" at ntruhrss701_bytes+40, ntruhrss701_enumcost-21

# Data is input twice. First for mouse over text, then for points
plot "data/enum_hrss_pow2q_fw_38.dat"     using 5:4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, \
        "data/enum_hrss_pow2q_fw_38.dat"  using 5:4 with points pt 8  lc 2 title 'pow2 q, fixed weight 3n/8', \
     "data/enum_hrss_pow2q_fw_12.dat"     using 5:4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, \
        "data/enum_hrss_pow2q_fw_12.dat"  using 5:4 with points pt 12 lc 2 title 'pow2 q, fixed weight 1n/2', \
     "data/enum_hrss_pow2q_fw_35.dat"     using 5:4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, \
        "data/enum_hrss_pow2q_fw_35.dat"  using 5:4 with points pt 4  lc 2 title 'pow2 q, fixed weight 3n/5', \
     "data/enum_hrss_pow2q_fw_23.dat"     using 5:4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, \
        "data/enum_hrss_pow2q_fw_23.dat"  using 5:4 with points pt 6  lc 2 title 'pow2 q, fixed weight 2n/3', \
     "data/enum_ntru_pow2q_ft_38.dat"     using 5:4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, \
        "data/enum_ntru_pow2q_ft_38.dat"  using 5:4 with points pt 8  lc 3 title 'pow2 q, fixed type 3n/8', \
     "data/enum_ntru_pow2q_ft_12.dat"     using 5:4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, \
        "data/enum_ntru_pow2q_ft_12.dat"  using 5:4 with points pt 12 lc 3 title 'pow2 q, fixed type 1n/2', \
     "data/enum_ntru_pow2q_ft_35.dat"     using 5:4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, \
        "data/enum_ntru_pow2q_ft_35.dat"  using 5:4 with points pt 4  lc 3 title 'pow2 q, fixed type 3n/5', \
     "data/enum_ntru_pow2q_ft_23.dat"     using 5:4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, \
        "data/enum_ntru_pow2q_ft_23.dat"  using 5:4 with points pt 6  lc 3 title 'pow2 q, fixed type 2n/3', \
     "data/enum_hrss_pow2q.dat"           using 5:4 with points pt 3  lc 7 title 'NTRU-HRSS', \
        "data/enum_hrss_pow2q.dat"        using 5:4:(Params(1,2)) with labels hypertext point pt 3  lc rgb "#ff0000" notitle, \



