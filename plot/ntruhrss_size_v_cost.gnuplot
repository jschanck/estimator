
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


# prime cyclotomic NTRU

reset

## core-sieve

set terminal svg enhanced mouse standalone font "arial,10" size 1536, 768
set output 'ntru_size_v_security.svg'
set multiplot layout 1,2 rowsfirst title "Size/security trade-offs for (prime cyclotomic) NTRU" font ",14"

set grid
set xtics 1200,100,3501
set ytics 80,10,361

set title 'Trade-offs with respect to the core-sieve estimate'
set xlabel 'Communication cost (pk + ct bytes)'
set ylabel 'Core-sieve attack cost (log scale)'

set key bottom right
set label 1 "Lines connect parameter sets that use the same ring." at graph .05, graph .9

set arrow 1 from ntruhrss701_bytes+40, ntruhrss701_sievecost-20 to ntruhrss701_bytes+5, ntruhrss701_sievecost-2
set label 2 "ntruhrss701" at ntruhrss701_bytes+40, ntruhrss701_sievecost-21

plot "data/sieve_hrss_pow2q.dat"     using (2*$5):4 with lines lc rgb "#aaaaaa" notitle, \
     "data/sieve_hrss_primeq.dat"    using (2*$5):4 with lines lt rgb "#444444" notitle, \
     "data/sieve_hrss_pow2q_fw_38.dat"  using (2*$5):4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, "data/sieve_hrss_pow2q_fw_38.dat"  using (2*$5):4 with points pt 8  lc rgb "#00bfff" title 'prime cyclotomic, pow2 q, weight 3n/8', \
     "data/sieve_hrss_pow2q_fw_12.dat"  using (2*$5):4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, "data/sieve_hrss_pow2q_fw_12.dat"  using (2*$5):4 with points pt 12 lc rgb "#00bfff" title 'prime cyclotomic, pow2 q, weight 1n/2', \
     "data/sieve_hrss_pow2q_fw_35.dat"  using (2*$5):4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, "data/sieve_hrss_pow2q_fw_35.dat"  using (2*$5):4 with points pt 4  lc rgb "#00bfff" title 'prime cyclotomic, pow2 q, weight 3n/5', \
     "data/sieve_hrss_pow2q_fw_23.dat"  using (2*$5):4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, "data/sieve_hrss_pow2q_fw_23.dat"  using (2*$5):4 with points pt 6  lc rgb "#00bfff" title 'prime cyclotomic, pow2 q, weight 2n/3', \
     "data/sieve_hrss_primeq_fw_38.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, "data/sieve_hrss_primeq_fw_38.dat" using (2*$5):4 with points pt 8  lc 2 title 'prime cyclotomic, prime q, weight 3n/8', \
     "data/sieve_hrss_primeq_fw_12.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, "data/sieve_hrss_primeq_fw_12.dat" using (2*$5):4 with points pt 12 lc 2 title 'prime cyclotomic, prime q, weight 1n/2', \
     "data/sieve_hrss_primeq_fw_35.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, "data/sieve_hrss_primeq_fw_35.dat" using (2*$5):4 with points pt 4  lc 2 title 'prime cyclotomic, prime q, weight 3n/5', \
     "data/sieve_hrss_primeq_fw_23.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, "data/sieve_hrss_primeq_fw_23.dat" using (2*$5):4 with points pt 6  lc 2 title 'prime cyclotomic, prime q, weight 2n/3', \
     "data/sieve_hrss_primeq.dat" using (2*$4):3:(Params(1,2)) with labels hypertext point pt 11 lc rgb "#ffffff" notitle, "data/sieve_hrss_primeq.dat" using (2*$4):3 with points pt 10 lc 1 title 'prime cyclotomic, prime q, uniform', \
     "data/sieve_hrss_pow2q.dat"     using (2*$4):3 with points pt 3  lc 7 title 'NTRU-HRSS', "data/sieve_hrss_pow2q.dat"     using (2*$4):3:(Params(1,2)) with labels hypertext point pt 3  lc 7 notitle

## hybrid-enum

unset arrow 1
unset label 2

set title 'Trade-offs with respect to the hybrid-enum estimate'
set ylabel 'Hybrid-enum attack cost (log scale)'

set arrow 2 from ntruhrss701_bytes+40, ntruhrss701_enumcost-20 to ntruhrss701_bytes+8, ntruhrss701_enumcost-4
set label 4 "ntruhrss701" at ntruhrss701_bytes+40, ntruhrss701_enumcost-21

plot "data/enum_hrss_pow2q.dat"     using (2*$5):4 with lines lc rgb "#aaaaaa" notitle, \
     "data/enum_hrss_primeq.dat"    using (2*$5):4 with lines lt rgb "#444444" notitle, \
     "data/enum_hrss_pow2q_fw_38.dat"  using (2*$5):4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, "data/enum_hrss_pow2q_fw_38.dat"  using (2*$5):4 with points pt 8  lc rgb "#00bfff" title 'prime cyclotomic, pow2 q, weight 3n/8', \
     "data/enum_hrss_pow2q_fw_12.dat"  using (2*$5):4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, "data/enum_hrss_pow2q_fw_12.dat"  using (2*$5):4 with points pt 12 lc rgb "#00bfff" title 'prime cyclotomic, pow2 q, weight 1n/2', \
     "data/enum_hrss_pow2q_fw_35.dat"  using (2*$5):4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, "data/enum_hrss_pow2q_fw_35.dat"  using (2*$5):4 with points pt 4  lc rgb "#00bfff" title 'prime cyclotomic, pow2 q, weight 3n/5', \
     "data/enum_hrss_pow2q_fw_23.dat"  using (2*$5):4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, "data/enum_hrss_pow2q_fw_23.dat"  using (2*$5):4 with points pt 6  lc rgb "#00bfff" title 'prime cyclotomic, pow2 q, weight 2n/3', \
     "data/enum_hrss_primeq_fw_38.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, "data/enum_hrss_primeq_fw_38.dat" using (2*$5):4 with points pt 8  lc 2 title 'prime cyclotomic, prime q, weight 3n/8', \
     "data/enum_hrss_primeq_fw_12.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, "data/enum_hrss_primeq_fw_12.dat" using (2*$5):4 with points pt 12 lc 2 title 'prime cyclotomic, prime q, weight 1n/2', \
     "data/enum_hrss_primeq_fw_35.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, "data/enum_hrss_primeq_fw_35.dat" using (2*$5):4 with points pt 4  lc 2 title 'prime cyclotomic, prime q, weight 3n/5', \
     "data/enum_hrss_primeq_fw_23.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, "data/enum_hrss_primeq_fw_23.dat" using (2*$5):4 with points pt 6  lc 2 title 'prime cyclotomic, prime q, weight 2n/3', \
     "data/enum_hrss_primeq.dat" using (2*$4):3:(Params(1,2)) with labels hypertext point pt 11 lc rgb "#ffffff" notitle, "data/enum_hrss_primeq.dat" using (2*$4):3 with points pt 10 lc 1 title 'prime cyclotomic, prime q, uniform', \
     "data/enum_hrss_pow2q.dat"     using (2*$4):3 with points pt 3  lc 7 title 'NTRU-HRSS', "data/enum_hrss_pow2q.dat"     using (2*$4):3:(Params(1,2)) with labels hypertext point pt 3  lc 7 notitle

unset arrow 2
unset label 4
unset multiplot


# prime cyclotomic prime q NTRU vs sntrup

reset

## core-sieve

set terminal svg enhanced mouse standalone font "arial,10" size 1536, 768
set output 'compare_primeq_ntru_sntrup.svg'
set multiplot layout 1,2 rowsfirst title "Size/security trade-offs for (prime cyclotomic, prime q) NTRU and Streamlined NTRU Prime" font ",14"

set grid
set xtics 1200,100,3501
set ytics 80,10,361

set key bottom right
set label 1 "Lines connect parameter sets that use the same ring." at graph .05, graph .9

set title 'Trade-offs with respect to the core-sieve estimate'
set xlabel 'Communication cost (pk + ct bytes)'
set ylabel 'Core-sieve attack cost (log scale)'

set arrow 3 from sntrup4591761_bytes-100,sntrup4591761_sievecost+25 to sntrup4591761_bytes-5,sntrup4591761_sievecost+2
set label 3 "sntrup4591761" at sntrup4591761_bytes-100,sntrup4591761_sievecost+26

plot "data/sieve_sntrup.dat" using 5:4 with lines lt rgb "#cccccc" notitle, \
     "data/sieve_hrss_primeq.dat"    using (2*$5):4 with lines lt rgb "#aaaaaa" notitle, \
     "data/sieve_hrss_primeq_fw_38.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, "data/sieve_hrss_primeq_fw_38.dat" using (2*$5):4 with points pt 8  lc 2 title 'prime cyclotomic, prime q, weight 3n/8', \
     "data/sieve_hrss_primeq_fw_12.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, "data/sieve_hrss_primeq_fw_12.dat" using (2*$5):4 with points pt 12 lc 2 title 'prime cyclotomic, prime q, weight 1n/2', \
     "data/sieve_hrss_primeq_fw_35.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, "data/sieve_hrss_primeq_fw_35.dat" using (2*$5):4 with points pt 4  lc 2 title 'prime cyclotomic, prime q, weight 3n/5', \
     "data/sieve_hrss_primeq_fw_23.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, "data/sieve_hrss_primeq_fw_23.dat" using (2*$5):4 with points pt 6  lc 2 title 'prime cyclotomic, prime q, weight 2n/3', \
     "data/sieve_hrss_primeq.dat" using (2*$4):3:(Params(1,2)) with labels hypertext point pt 11 lc rgb "#ffffff" notitle, "data/sieve_hrss_primeq.dat" using (2*$4):3 with points pt 10 lc 1 title 'prime cyclotomic, prime q, uniform', \
     "data/sieve_sntrup.dat" using 5:4 with points pt 2  lc rgb "#ff9f00" title 'Streamlined NTRU Prime', "data/sieve_sntrup.dat"     using 5:4:(FixedWtParams(1,2,3)) with labels hypertext point pt 2  lc rgb "#ff9f00" notitle

unset arrow 3
unset label 3

## hybrid-enum

set title 'Trade-offs with respect to the hybrid-enum estimate'
set ylabel 'Hybrid-enum attack cost (log scale)'

set arrow 4 from sntrup4591761_bytes-100,sntrup4591761_enumcost+25 to sntrup4591761_bytes-15,sntrup4591761_enumcost+3
set label 4 "sntrup4591761" at sntrup4591761_bytes-100,sntrup4591761_enumcost+26

plot "data/enum_sntrup.dat" using 5:4 with lines lt rgb "#cccccc" notitle, \
     "data/enum_hrss_primeq.dat"    using (2*$5):4 with lines lt rgb "#aaaaaa" notitle, \
     "data/enum_hrss_primeq_fw_38.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, "data/enum_hrss_primeq_fw_38.dat" using (2*$5):4 with points pt 8  lc 2 title 'prime cyclotomic, prime q, weight 3n/8', \
     "data/enum_hrss_primeq_fw_12.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, "data/enum_hrss_primeq_fw_12.dat" using (2*$5):4 with points pt 12 lc 2 title 'prime cyclotomic, prime q, weight 1n/2', \
     "data/enum_hrss_primeq_fw_35.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, "data/enum_hrss_primeq_fw_35.dat" using (2*$5):4 with points pt 4  lc 2 title 'prime cyclotomic, prime q, weight 3n/5', \
     "data/enum_hrss_primeq_fw_23.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, "data/enum_hrss_primeq_fw_23.dat" using (2*$5):4 with points pt 6  lc 2 title 'prime cyclotomic, prime q, weight 2n/3', \
     "data/enum_hrss_primeq.dat" using (2*$4):3:(Params(1,2)) with labels hypertext point pt 11 lc rgb "#ffffff" notitle, "data/enum_hrss_primeq.dat" using (2*$4):3 with points pt 10 lc 1 title 'prime cyclotomic, prime q, uniform', \
     "data/enum_sntrup.dat"   using 5:4 with points pt 2  lc rgb "#ff9f00" title 'Streamlined NTRU Prime', "data/enum_sntrup.dat"     using 5:4:(FixedWtParams(1,2,3)) with labels hypertext point pt 2  lc rgb "#ff9f00" notitle

unset arrow 4
unset label 4

unset multiplot


# Prime cyclotomic pow2 q NTRU vs sntrup

reset

## core-sieve

set terminal svg enhanced mouse standalone font "arial,10" size 1536, 768
set output 'compare_pow2q_ntru_sntrup.svg'
set multiplot layout 1,2 rowsfirst title "Size/security trade-offs for (prime cyclotomic, pow2 q) NTRU and Streamlined NTRU Prime" font ",14"

set grid
set xtics 1200,100,3501
set ytics 80,10,361

set key bottom right
set label 1 "Lines connect parameter sets that use the same ring." at graph .05, graph .9

set title 'Trade-offs with respect to the core-sieve estimate'
set xlabel 'Communication cost (pk + ct bytes)'
set ylabel 'Core-sieve attack cost (log scale)'

set arrow 3 from sntrup4591761_bytes-100,sntrup4591761_sievecost+25 to sntrup4591761_bytes-5,sntrup4591761_sievecost+2
set label 3 "sntrup4591761" at sntrup4591761_bytes-100,sntrup4591761_sievecost+26

plot "data/sieve_sntrup.dat"  using 5:4 with lines lt rgb "#cccccc" notitle, \
     "data/sieve_hrss_pow2q.dat"    using (2*$5):4 with lines lt rgb "#aaaaaa" notitle, \
     "data/sieve_hrss_pow2q_fw_38.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, "data/sieve_hrss_pow2q_fw_38.dat" using (2*$5):4 with points pt 8  lc rgb "#00bfff" title 'prime cyclotomic, pow2 q, weight 3n/8', \
     "data/sieve_hrss_pow2q_fw_12.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, "data/sieve_hrss_pow2q_fw_12.dat" using (2*$5):4 with points pt 12 lc rgb "#00bfff" title 'prime cyclotomic, pow2 q, weight 1n/2', \
     "data/sieve_hrss_pow2q_fw_35.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, "data/sieve_hrss_pow2q_fw_35.dat" using (2*$5):4 with points pt 4  lc rgb "#00bfff" title 'prime cyclotomic, pow2 q, weight 3n/5', \
     "data/sieve_hrss_pow2q_fw_23.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, "data/sieve_hrss_pow2q_fw_23.dat" using (2*$5):4 with points pt 6  lc rgb "#00bfff" title 'prime cyclotomic, pow2 q, weight 2n/3', \
     "data/sieve_hrss_pow2q.dat"    using (2*$4):3 with points pt 3  lc 7 title 'NTRU-HRSS', "data/sieve_hrss_pow2q.dat"     using (2*$4):3:(Params(1,2)) with labels hypertext point pt 3  lc 7 notitle, \
     "data/sieve_sntrup.dat"  using 5:4 with points pt 2  lc rgb "#ff9f00" title 'Streamlined NTRU Prime', "data/sieve_sntrup.dat"     using 5:4:(FixedWtParams(1,2,3)) with labels hypertext point pt 2  lc rgb "#ff9f00" notitle

unset arrow 3
unset label 3

## hybrid-enum

set title 'Trade-offs with respect to the hybrid-enum estimate'
set ylabel 'Hybrid-enum attack cost (log scale)'

set arrow 4 from sntrup4591761_bytes-100,sntrup4591761_enumcost+25 to sntrup4591761_bytes-15,sntrup4591761_enumcost+3
set label 4 "sntrup4591761" at sntrup4591761_bytes-100,sntrup4591761_enumcost+26

plot "data/enum_sntrup.dat"  using 5:4 with lines lt rgb "#cccccc" notitle, \
     "data/enum_hrss_pow2q.dat"    using (2*$5):4 with lines lt rgb "#aaaaaa" notitle, \
     "data/enum_hrss_pow2q_fw_38.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 9  lc rgb "#ffffff" notitle, "data/enum_hrss_pow2q_fw_38.dat" using (2*$5):4 with points pt 8  lc rgb "#00bfff" title 'prime cyclotomic, pow2 q, weight 3n/8', \
     "data/enum_hrss_pow2q_fw_12.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 13 lc rgb "#ffffff" notitle, "data/enum_hrss_pow2q_fw_12.dat" using (2*$5):4 with points pt 12 lc rgb "#00bfff" title 'prime cyclotomic, pow2 q, weight 1n/2', \
     "data/enum_hrss_pow2q_fw_35.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 5  lc rgb "#ffffff" notitle, "data/enum_hrss_pow2q_fw_35.dat" using (2*$5):4 with points pt 4  lc rgb "#00bfff" title 'prime cyclotomic, pow2 q, weight 3n/5', \
     "data/enum_hrss_pow2q_fw_23.dat" using (2*$5):4:(Params(1,2)) with labels hypertext point pt 7  lc rgb "#ffffff" notitle, "data/enum_hrss_pow2q_fw_23.dat" using (2*$5):4 with points pt 6  lc rgb "#00bfff" title 'prime cyclotomic, pow2 q, weight 2n/3', \
     "data/enum_hrss_pow2q.dat"    using (2*$4):3 with points pt 3  lc 7 title 'NTRU-HRSS', "data/enum_hrss_pow2q.dat"     using (2*$4):3:(Params(1,2)) with labels hypertext point pt 3  lc 7 notitle, \
     "data/enum_sntrup.dat"  using 5:4 with points pt 2  lc rgb "#ff9f00" title 'Streamlined NTRU Prime', "data/enum_sntrup.dat"     using 5:4:(FixedWtParams(1,2,3)) with labels hypertext point pt 2  lc rgb "#ff9f00" notitle

#

unset arrow 4
unset label 4

unset multiplot
