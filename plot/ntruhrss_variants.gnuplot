
# Mouse-over text
Params(a,b) = sprintf("n=%d, q=%d", column(a), column(b))
FixedWtParams(a,b,c) = sprintf("n=%d, q=%d, w=%.2fn", column(a), column(b), column(c)/column(a))

# Constants for arrows
ntruhrss701_bytes = 2276          # 2 * ceil(700*log(2,8192)/8)
ntruhrss701_sievecost = 134
ntruhrss701_enumcost  = 207

sntrup4591761_bytes = 1158 + 1007 # ceil(761*log(2,4591)/8)+ceil(761*log(2,4591/3)/8)
sntrup4591761_sievecost = 151
sntrup4591761_enumcost  = 225


plotw = 768
ploth = 768


# uniform prime q vs ntruhrss

reset

set terminal svg enhanced mouse standalone font "arial,10" size plotw, ploth
set output 'variants_uniform.svg'
set title "Comparison of NTRU-HRSS variants: power-of-two q vs. prime q" font ",14"

set grid
set xtics 1200,100,3501
set ytics 80,10,361

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel 'Core-sieve attack cost (log scale)'

set key bottom right

set arrow 1 from ntruhrss701_bytes+20, ntruhrss701_sievecost-10 to ntruhrss701_bytes+2, ntruhrss701_sievecost+1
set label 2 "ntruhrss701" at ntruhrss701_bytes+20, ntruhrss701_sievecost-11
# Data is input twice. First for mouse over text, then for points
plot "data/sieve_hrss_prq.dat" using (2*$4):3:(Params(1,2)) with labels hypertext point pt 11 lc rgb "#ffffff" notitle,\
     "data/sieve_hrss_prq.dat" using (2*$4):3 with points pt 10 lc 1 title 'prime q, uniform', \
     "data/sieve_hrss.dat"     using (2*$4):3 with points pt 3  lc 7 title 'NTRU-HRSS', \
     "data/sieve_hrss.dat"     using (2*$4):3:(Params(1,2)) with labels hypertext point pt 3  lc rgb "#ff0000" notitle, \





#  Fixed weight pow2 q vs ntruhss

reset

set terminal svg enhanced mouse standalone font "arial,10" size plotw, ploth
set output 'variants_fixed_pow2.svg'
set title "Comparison of power-of-two q NTRU-HRSS variants: fixed weight vs. uniform" font ",14"

set grid
set xtics 1200,100,3501
set ytics 80,10,361

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel 'Core-sieve attack cost (log scale)'

set key bottom right
set label 1 "Lines connect parameter sets that use the same ring." at graph .05, graph .9

set arrow 1 from ntruhrss701_bytes+20, ntruhrss701_sievecost-10 to ntruhrss701_bytes+2, ntruhrss701_sievecost+1
set label 2 "ntruhrss701" at ntruhrss701_bytes+20, ntruhrss701_sievecost-11
# Data is input twice. First for mouse over text, then for points
plot "data/sieve_pow2.dat"     using (2*$5):4 with lines lc rgb "#aaaaaa" notitle, \
     "data/sieve_pow2_38.dat"  using (2*$5):4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, \
        "data/sieve_pow2_38.dat"  using (2*$5):4 with points pt 8  lc rgb "#00bfff" title 'pow2 q, fixed weight 3n/8', \
     "data/sieve_pow2_12.dat"  using (2*$5):4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, \
        "data/sieve_pow2_12.dat"  using (2*$5):4 with points pt 12 lc rgb "#00bfff" title 'pow2 q, fixed weight 1n/2', \
     "data/sieve_pow2_35.dat"  using (2*$5):4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, \
        "data/sieve_pow2_35.dat"  using (2*$5):4 with points pt 4  lc rgb "#00bfff" title 'pow2 q, fixed weight 3n/5', \
     "data/sieve_pow2_23.dat"  using (2*$5):4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, \
        "data/sieve_pow2_23.dat"  using (2*$5):4 with points pt 6  lc rgb "#00bfff" title 'pow2 q, fixed weight 2n/3', \
     "data/sieve_hrss.dat"     using (2*$4):3 with points pt 3  lc 7 title 'NTRU-HRSS', \
        "data/sieve_hrss.dat"     using (2*$4):3:(Params(1,2)) with labels hypertext point pt 3  lc rgb "#ff0000" notitle, \

#  Fixed weight prime q vs uniform prime q vs ntruhrss

reset

set terminal svg enhanced mouse standalone font "arial,10" size plotw, ploth
set output 'variants_fixed_prime.svg'
set title "Comparison of prime q NTRU-HRSS variants: fixed weight vs. uniform" font ",14"

set grid
set xtics 1200,100,3501
set ytics 80,10,361

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel 'Core-sieve attack cost (log scale)'

set key bottom right
set label 1 "Lines connect parameter sets that use the same ring." at graph .05, graph .9

set arrow 1 from ntruhrss701_bytes+20, ntruhrss701_sievecost-10 to ntruhrss701_bytes+2, ntruhrss701_sievecost+1
set label 2 "n=701, q=7933" at ntruhrss701_bytes+20, ntruhrss701_sievecost-11
# Data is input twice. First for mouse over text, then for points
plot "data/sieve_prime.dat"     using (2*$5):4 with lines lc rgb "#aaaaaa" notitle, \
     "data/sieve_prime_38.dat"  using (2*$5):4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, \
        "data/sieve_prime_38.dat"  using (2*$5):4 with points pt 8  lc 2 title 'prime q, fixed weight 3n/8', \
     "data/sieve_prime_12.dat"  using (2*$5):4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, \
        "data/sieve_prime_12.dat"  using (2*$5):4 with points pt 12 lc 2 title 'prime q, fixed weight 1n/2', \
     "data/sieve_prime_35.dat"  using (2*$5):4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, \
        "data/sieve_prime_35.dat"  using (2*$5):4 with points pt 4  lc 2 title 'prime q, fixed weight 3n/5', \
     "data/sieve_prime_23.dat"  using (2*$5):4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, \
        "data/sieve_prime_23.dat"  using (2*$5):4 with points pt 6  lc 2 title 'prime q, fixed weight 2n/3', \
     "data/sieve_hrss_prq.dat" using (2*$4):3:(Params(1,2)) with labels hypertext point pt 11 lc rgb "#ffffff" notitle,  \
         "data/sieve_hrss_prq.dat" using (2*$4):3 with points pt 10 lc 1 title 'prime q, uniform', \


#  Fixed weight prime q vs streamlined ntruprime

reset

set terminal svg enhanced mouse standalone font "arial,10" size plotw, ploth
set output 'variants_sntrup.svg'
set title "NTRU-HRSS vs. NTRU-HRSS with prime q and fixed-weight vs. Streamlined NTRUPrime" font ",14"

set grid
set xtics 1200,100,3501
set ytics 80,10,361

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel 'Core-sieve attack cost (log scale)'

set key bottom right
set label 1 "Lines connect parameter sets that use the same ring." at graph .05, graph .9

set arrow 3 from sntrup4591761_bytes-50,sntrup4591761_sievecost+15 to sntrup4591761_bytes,sntrup4591761_sievecost+1
set label 3 "sntrup4591761" at sntrup4591761_bytes-250,sntrup4591761_sievecost+16

set arrow 1 from ntruhrss701_bytes+20, ntruhrss701_sievecost-10 to ntruhrss701_bytes+2, ntruhrss701_sievecost+1
set label 2 "ntruhrss701" at ntruhrss701_bytes+20, ntruhrss701_sievecost-11

# Data is input twice. First for mouse over text, then for points
plot "data/sieve_sntrup.dat"    using 5:4 with lines lt rgb "#cccccc" notitle, \
     "data/sieve_prime.dat"     using (2*$5):4 with lines lc rgb "#aaaaaa" notitle, \
     "data/sieve_sntrup.dat"    using 5:4 with points pt 2  lc rgb "#ff9f00" title 'Streamlined NTRU Prime',                \
       "data/sieve_sntrup.dat"    using 5:4:(FixedWtParams(1,2,3)) with labels hypertext point pt 2  lc rgb "#ff9f00" notitle, \
     "data/sieve_hrss.dat"      using (2*$4):3 with points pt 3  lc 7 title 'NTRU-HRSS', \
       "data/sieve_hrss.dat"      using (2*$4):3:(Params(1,2)) with labels hypertext point pt 3  lc rgb "#ff0000" notitle, \
     "data/sieve_prime_38.dat"  using (2*$5):4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, \
        "data/sieve_prime_38.dat"  using (2*$5):4 with points pt 8  lc 2 title 'prime q, fixed weight 3n/8', \
     "data/sieve_prime_12.dat"  using (2*$5):4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, \
        "data/sieve_prime_12.dat"  using (2*$5):4 with points pt 12 lc 2 title 'prime q, fixed weight 1n/2', \
     "data/sieve_prime_35.dat"  using (2*$5):4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, \
        "data/sieve_prime_35.dat"  using (2*$5):4 with points pt 4  lc 2 title 'prime q, fixed weight 3n/5', \
     "data/sieve_prime_23.dat"  using (2*$5):4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, \
        "data/sieve_prime_23.dat"  using (2*$5):4 with points pt 6  lc 2 title 'prime q, fixed weight 2n/3', \

