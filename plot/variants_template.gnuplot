
# This file generates
#   - variants_hrss_xxxx.svg
#   - variants_ntru_xxxx.svg
#   - variants_sntrup_xxxx.svg
#   - variants_primeq_xxxx.svg
#   - variants_pow2q_xxxx.svg
#   - variants_hrss_p_xxxx.svg


# variants_hrss

reset

set output 'svg/variants_hrss_xxxx.svg'

set grid
set xtics 0,200,4000
set ytics 0,10,400

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel xxxx_ylabel

set key bottom right
#set label 1 "Lines connect parameter sets with the same n." at graph .05, graph .9

plot "data/xxxx_hrss_primeq_fw.dat"    using 5:4 with lines lw .5 lc rgb lc_hrss_prime notitle, \
     "data/xxxx_hrss_pow2q_fw.dat"     using 5:4 with lines lw .5 lc rgb lc_hrss_pow2 notitle, \
     "data/xxxx_hrss_primeq_fw_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_38.dat" using 5:4 with points pt pt_wt_38 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, fixed weight 3n/8', \
     "data/xxxx_hrss_primeq_fw_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_12.dat" using 5:4 with points pt pt_wt_12 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, fixed weight 1n/2', \
     "data/xxxx_hrss_primeq_fw_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_35.dat" using 5:4 with points pt pt_wt_35 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, fixed weight 3n/5', \
     "data/xxxx_hrss_primeq_fw_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_23.dat" using 5:4 with points pt pt_wt_23 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, fixed weight 2n/3', \
     "data/xxxx_hrss_pow2q_fw_38.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_38.dat"  using 5:4 with points pt pt_wt_38 lc rgb lc_hrss_pow2 title 'NTRU-HRSS, pow2 q, fixed weight 3n/8', \
     "data/xxxx_hrss_pow2q_fw_12.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_12.dat"  using 5:4 with points pt pt_wt_12 lc rgb lc_hrss_pow2 title 'NTRU-HRSS, pow2 q, fixed weight 1n/2', \
     "data/xxxx_hrss_pow2q_fw_35.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_35.dat"  using 5:4 with points pt pt_wt_35 lc rgb lc_hrss_pow2 title 'NTRU-HRSS, pow2 q, fixed weight 3n/5', \
     "data/xxxx_hrss_pow2q_fw_23.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_23.dat"  using 5:4 with points pt pt_wt_23 lc rgb lc_hrss_pow2 title 'NTRU-HRSS, pow2 q, fixed weight 2n/3', \
     "data/xxxx_hrss_primeq.dat"       using 5:4:(Params(1,2)) with labels hypertext point pt pt_u1_f lc rgb lc_fill notitle,  \
     "data/xxxx_hrss_primeq.dat"       using 5:4 with points pt pt_u1 lc rgb lc_hrss_prime_u title 'NTRU-HRSS, prime q, uniform', \
     "data/xxxx_hrss_pow2q.dat"        using 5:4 with points pt pt_u2  lc rgb lc_hrss_pow2_u title 'NTRU-HRSS, pow2 q, uniform', \
     "data/xxxx_hrss_pow2q.dat"        using 5:4:(Params(1,2)) with labels hypertext point pt pt_u2  lc rgb lc_hrss_pow2_u notitle, \


# variants_sntrup

reset

set output 'svg/variants_sntrup_xxxx.svg'

set grid
set xtics 0,200,4000
set ytics 0,10,400

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel xxxx_ylabel

set key bottom right
#set label 1 "Lines connect parameter sets with the same n." at graph .05, graph .9

plot "data/xxxx_sntrup.dat"            using 5:4 with lines lw .5 lc rgb lc_sntrup notitle, \
     "data/xxxx_sntrup.dat"            using 5:4 with points pt pt_sntrup  lc rgb lc_sntrup title 'Streamlined NTRU Prime',                \
     "data/xxxx_sntrup.dat"            using 5:4:(Params3(1,2,3))  with labels hypertext point pt pt_sntrup  lc rgb "#ff9f00" notitle, \



# variants_primeq

reset

set output 'svg/variants_primeq_xxxx.svg'

set grid
set xtics 0,200,4000
set ytics 0,10,400

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel xxxx_ylabel

set key bottom right
#set label 1 "Lines connect parameter sets with the same n." at graph .05, graph .9

plot "data/xxxx_hrss_primeq_fw.dat"     using 5:4 with lines lw .5 lc rgb lc_hrss_prime notitle, \
     "data/xxxx_ntru_primeq_fgrm.dat"     using 5:4 with lines lw .5 lc rgb lc_ntru_prime notitle, \
     "data/xxxx_sntrup.dat"            using 5:4 with lines lw .2 lc rgb lc_sntrup notitle, \
     "data/xxxx_ntru_primeq_fgrm_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_fgrm_38.dat" using 5:4 with points pt pt_wt_38 lc rgb lc_ntru_prime title 'NTRU, prime q, fixed type 3n/8 fgrm', \
     "data/xxxx_ntru_primeq_fgrm_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_fgrm_12.dat" using 5:4 with points pt pt_wt_12 lc rgb lc_ntru_prime title 'NTRU, prime q, fixed type 1n/2 fgrm', \
     "data/xxxx_ntru_primeq_fgrm_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_fgrm_35.dat" using 5:4 with points pt pt_wt_35 lc rgb lc_ntru_prime title 'NTRU, prime q, fixed type 3n/5 fgrm', \
     "data/xxxx_ntru_primeq_fgrm_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_fgrm_23.dat" using 5:4 with points pt pt_wt_23 lc rgb lc_ntru_prime title 'NTRU, prime q, fixed type 2n/3 fgrm', \
     "data/xxxx_sntrup.dat"            using 5:4 with points pt pt_sntrup  lc rgb lc_sntrup title 'Streamlined NTRU Prime',                \
     "data/xxxx_sntrup.dat"            using 5:4:(Params3(1,2,3))   with labels hypertext point pt pt_sntrup  lc rgb "#ff9f00" notitle, \
     "data/xxxx_hrss_primeq_fw_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_38.dat" using 5:4 with points pt pt_wt_38 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, fixed weight 3n/8', \
     "data/xxxx_hrss_primeq_fw_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_12.dat" using 5:4 with points pt pt_wt_12 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, fixed weight 1n/2', \
     "data/xxxx_hrss_primeq_fw_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_35.dat" using 5:4 with points pt pt_wt_35 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, fixed weight 3n/5', \
     "data/xxxx_hrss_primeq_fw_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_23.dat" using 5:4 with points pt pt_wt_23 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, fixed weight 2n/3', \
     "data/xxxx_hrss_primeq.dat"       using 5:4:(Params(1,2)) with labels hypertext point pt pt_u1_f lc rgb lc_fill notitle,  \
     "data/xxxx_hrss_primeq.dat"       using 5:4 with points pt pt_u1 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, uniform'



# variants_pow2q

reset

set output 'svg/variants_pow2_xxxx.svg'

set grid
set xtics 0,200,4000
set ytics 0,10,400

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel xxxx_ylabel

set key bottom right
#set label 1 "Lines connect parameter sets with the same n." at graph .05, graph .9

plot "data/xxxx_ntru_pow2q_fgrm.dat"    using 5:4 with lines lw .5 lc rgb lc_ntru_pow2 notitle, \
     "data/xxxx_hrss_pow2q_fw.dat"    using 5:4 with lines lw .5 lc rgb lc_ntru_pow2 notitle, \
     "data/xxxx_ntru_pow2q_fgrm_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_fgrm_38.dat" using 5:4 with points pt pt_wt_38  lc rgb lc_ntru_pow2 title 'NTRU, pow2 q, fixed type 3n/8 fgrm', \
     "data/xxxx_ntru_pow2q_fgrm_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_fgrm_12.dat" using 5:4 with points pt pt_wt_12 lc rgb lc_ntru_pow2 title 'NTRU, pow2 q, fixed type 1n/2 fgrm', \
     "data/xxxx_ntru_pow2q_fgrm_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_fgrm_35.dat" using 5:4 with points pt pt_wt_35  lc rgb lc_ntru_pow2 title 'NTRU, pow2 q, fixed type 3n/5 fgrm', \
     "data/xxxx_ntru_pow2q_fgrm_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_fgrm_23.dat" using 5:4 with points pt pt_wt_23  lc rgb lc_ntru_pow2 title 'NTRU, pow2 q, fixed type 2n/3 fgrm', \
     "data/xxxx_hrss_pow2q_fw_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_38.dat" using 5:4 with points pt pt_wt_38  lc rgb lc_hrss_pow2 title 'NTRU-HRSS, pow2 q, fixed weight 3n/8', \
     "data/xxxx_hrss_pow2q_fw_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_12.dat" using 5:4 with points pt pt_wt_12 lc rgb lc_hrss_pow2 title 'NTRU-HRSS, pow2 q, fixed weight 1n/2', \
     "data/xxxx_hrss_pow2q_fw_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_35.dat" using 5:4 with points pt pt_wt_35  lc rgb lc_hrss_pow2 title 'NTRU-HRSS, pow2 q, fixed weight 3n/5', \
     "data/xxxx_hrss_pow2q_fw_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_23.dat" using 5:4 with points pt pt_wt_23  lc rgb lc_hrss_pow2 title 'NTRU-HRSS, pow2 q, fixed weight 2n/3', \
     "data/xxxx_hrss_pow2q.dat"       using 5:4 with points pt pt_u2  lc lc_hrss_pow2_u title 'NTRU-HRSS, pow2 q, uniform', \
     "data/xxxx_hrss_pow2q.dat"       using 5:4:(Params(1,2)) with labels hypertext point pt pt_u2 lc rgb lc_hrss_pow2_u notitle, \


# variants_all_ntrufgm

# reset
# 
# set output 'svg/variants_all_ntrufgm_xxxx.svg'
# 
# set key bottom right
# 
# set grid
# set xtics 0,200,4000
# set ytics 0,10,400
# 
# set xlabel 'Communication cost (pk + ct bytes)'
# set ylabel xxxx_ylabel
# 
# #set label 1 "Lines connect parameter sets with the same n." at graph .05, graph .9
# 
# plot "data/xxxx_ntru_pow2q_fgm.dat"     using 5:4 with lines lw .5 lc rgb lc_ntru_pow2 notitle, \
#      "data/xxxx_hrss_pow2q_fw.dat"      using 5:4 with lines lw .5 lc rgb lc_hrss_pow2 notitle, \
#      "data/xxxx_hrss_primeq_fw.dat"     using 5:4 with lines lw .5 lc rgb lc_hrss_prime notitle, \
#      "data/xxxx_ntru_primeq_fgm.dat"    using 5:4 with lines lw .5 lc rgb lc_ntru_prime notitle, \
#      "data/xxxx_sntrup.dat"             using 5:4 with lines lw .2 lc rgb lc_sntrup notitle, \
#      "data/xxxx_sntrup.dat"             using 5:4 with points pt pt_sntrup  lc rgb lc_sntrup title 'Streamlined NTRU Prime', \
#      "data/xxxx_sntrup.dat"             using 5:4:(Params3(1,2,3))   with labels hypertext point pt pt_sntrup  lc rgb "#ff9f00" notitle, \
#      "data/xxxx_ntru_primeq_fgm_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
#      "data/xxxx_ntru_primeq_fgm_38.dat" using 5:4 with points pt pt_wt_38 lc rgb lc_ntru_prime title 'NTRU, prime q, fixed type 3n/8 fgm', \
#      "data/xxxx_ntru_primeq_fgm_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
#      "data/xxxx_ntru_primeq_fgm_12.dat" using 5:4 with points pt pt_wt_12 lc rgb lc_ntru_prime title 'NTRU, prime q, fixed type 1n/2 fgm', \
#      "data/xxxx_ntru_primeq_fgm_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
#      "data/xxxx_ntru_primeq_fgm_35.dat" using 5:4 with points pt pt_wt_35 lc rgb lc_ntru_prime title 'NTRU, prime q, fixed type 3n/5 fgm', \
#      "data/xxxx_ntru_primeq_fgm_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
#      "data/xxxx_ntru_primeq_fgm_23.dat" using 5:4 with points pt pt_wt_23 lc rgb lc_ntru_prime title 'NTRU, prime q, fixed type 2n/3 fgm', \
#      "data/xxxx_ntru_pow2q_fgm_38.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
#      "data/xxxx_ntru_pow2q_fgm_38.dat"  using 5:4 with points pt pt_wt_38  lc rgb lc_ntru_pow2 title 'NTRU, pow2 q, fixed type 3n/8 fgm', \
#      "data/xxxx_ntru_pow2q_fgm_12.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
#      "data/xxxx_ntru_pow2q_fgm_12.dat"  using 5:4 with points pt pt_wt_12 lc rgb lc_ntru_pow2 title 'NTRU, pow2 q, fixed type 1n/2 fgm', \
#      "data/xxxx_ntru_pow2q_fgm_35.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
#      "data/xxxx_ntru_pow2q_fgm_35.dat"  using 5:4 with points pt pt_wt_35  lc rgb lc_ntru_pow2 title 'NTRU, pow2 q, fixed type 3n/5 fgm', \
#      "data/xxxx_ntru_pow2q_fgm_23.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
#      "data/xxxx_ntru_pow2q_fgm_23.dat"  using 5:4 with points pt pt_wt_23  lc rgb lc_ntru_pow2 title 'NTRU, pow2 q, fixed type 2n/3 fgm', \
#      "data/xxxx_hrss_primeq_fw_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
#      "data/xxxx_hrss_primeq_fw_38.dat" using 5:4 with points pt pt_wt_38 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, fixed weight 3n/8', \
#      "data/xxxx_hrss_primeq_fw_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
#      "data/xxxx_hrss_primeq_fw_12.dat" using 5:4 with points pt pt_wt_12 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, fixed weight 1n/2', \
#      "data/xxxx_hrss_primeq_fw_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
#      "data/xxxx_hrss_primeq_fw_35.dat" using 5:4 with points pt pt_wt_35 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, fixed weight 3n/5', \
#      "data/xxxx_hrss_primeq_fw_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
#      "data/xxxx_hrss_primeq_fw_23.dat" using 5:4 with points pt pt_wt_23 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, fixed weight 2n/3', \
#      "data/xxxx_hrss_pow2q_fw_38.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
#      "data/xxxx_hrss_pow2q_fw_38.dat"  using 5:4 with points pt pt_wt_38  lc rgb lc_hrss_pow2 title 'NTRU-HRSS, pow2 q, fixed weight 3n/8', \
#      "data/xxxx_hrss_pow2q_fw_12.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
#      "data/xxxx_hrss_pow2q_fw_12.dat"  using 5:4 with points pt pt_wt_12 lc rgb lc_hrss_pow2 title 'NTRU-HRSS, pow2 q, fixed weight 1n/2', \
#      "data/xxxx_hrss_pow2q_fw_35.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
#      "data/xxxx_hrss_pow2q_fw_35.dat"  using 5:4 with points pt pt_wt_35  lc rgb lc_hrss_pow2 title 'NTRU-HRSS, pow2 q, fixed weight 3n/5', \
#      "data/xxxx_hrss_pow2q_fw_23.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
#      "data/xxxx_hrss_pow2q_fw_23.dat"  using 5:4 with points pt pt_wt_23  lc rgb lc_hrss_pow2 title 'NTRU-HRSS, pow2 q, fixed weight 2n/3', \
#      "data/xxxx_hrss_primeq.dat"       using 5:4:(Params(1,2)) with labels hypertext point pt pt_u1_f lc rgb lc_fill notitle,  \
#      "data/xxxx_hrss_primeq.dat"       using 5:4 with points pt pt_u1 lc rgb lc_hrss_prime_u title 'NTRU-HRSS, prime q, uniform', \
#      "data/xxxx_hrss_pow2q.dat"        using 5:4 with points pt pt_u2  lc rgb lc_hrss_pow2_u title 'NTRU-HRSS, pow2 q, uniform', \
#      "data/xxxx_hrss_pow2q.dat"        using 5:4:(Params(1,2)) with labels hypertext point pt pt_u2 lc rgb lc_hrss_pow2_u notitle, \


# variants_all

reset

set output 'svg/variants_all_xxxx.svg'

set key bottom right

set grid
set xtics 0,200,4000
set ytics 0,10,400

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel xxxx_ylabel

#set label 1 "Lines connect parameter sets with the same n." at graph .05, graph .9

#     "data/xxxx_sntrup.dat"              using 5:4 with lines lw .2 lc rgb lc_sntrup notitle, \
#     "data/xxxx_sntrup.dat"              using 5:4 with points pt pt_sntrup  lc rgb lc_sntrup title 'Streamlined NTRU Prime', \
#     "data/xxxx_sntrup.dat"              using 5:4:(Params3(1,2,3))   with labels hypertext point pt pt_sntrup  lc rgb "#ff9f00" notitle, \

plot "data/xxxx_ntru_pow2q_fgrm.dat"     using 5:4 with lines lw .5 lc rgb lc_ntru_pow2 notitle, \
     "data/xxxx_hrss_pow2q_fw.dat"       using 5:4 with lines lw .5 lc rgb lc_hrss_pow2 notitle, \
     "data/xxxx_hrss_primeq_fw.dat"      using 5:4 with lines lw .5 lc rgb lc_hrss_prime notitle, \
     "data/xxxx_ntru_primeq_fgrm.dat"    using 5:4 with lines lw .5 lc rgb lc_ntru_prime notitle, \
     "data/xxxx_ntru_primeq_fgrm_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_fgrm_38.dat" using 5:4 with points pt pt_wt_38 lc rgb lc_ntru_prime title 'NTRU, prime q, fixed type 3n/8 fgrm', \
     "data/xxxx_ntru_primeq_fgrm_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_fgrm_12.dat" using 5:4 with points pt pt_wt_12 lc rgb lc_ntru_prime title 'NTRU, prime q, fixed type 1n/2 fgrm', \
     "data/xxxx_ntru_primeq_fgrm_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_fgrm_35.dat" using 5:4 with points pt pt_wt_35 lc rgb lc_ntru_prime title 'NTRU, prime q, fixed type 3n/5 fgrm', \
     "data/xxxx_ntru_primeq_fgrm_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_fgrm_23.dat" using 5:4 with points pt pt_wt_23 lc rgb lc_ntru_prime title 'NTRU, prime q, fixed type 2n/3 fgrm', \
     "data/xxxx_ntru_pow2q_fgrm_38.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_fgrm_38.dat"  using 5:4 with points pt pt_wt_38  lc rgb lc_ntru_pow2 title 'NTRU, pow2 q, fixed type 3n/8 fgrm', \
     "data/xxxx_ntru_pow2q_fgrm_12.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_fgrm_12.dat"  using 5:4 with points pt pt_wt_12 lc rgb lc_ntru_pow2 title 'NTRU, pow2 q, fixed type 1n/2 fgrm', \
     "data/xxxx_ntru_pow2q_fgrm_35.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_fgrm_35.dat"  using 5:4 with points pt pt_wt_35  lc rgb lc_ntru_pow2 title 'NTRU, pow2 q, fixed type 3n/5 fgrm', \
     "data/xxxx_ntru_pow2q_fgrm_23.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_fgrm_23.dat"  using 5:4 with points pt pt_wt_23  lc rgb lc_ntru_pow2 title 'NTRU, pow2 q, fixed type 2n/3 fgrm', \
     "data/xxxx_hrss_primeq_fw_38.dat"   using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_38.dat"   using 5:4 with points pt pt_wt_38 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, fixed weight 3n/8', \
     "data/xxxx_hrss_primeq_fw_12.dat"   using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_12.dat"   using 5:4 with points pt pt_wt_12 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, fixed weight 1n/2', \
     "data/xxxx_hrss_primeq_fw_35.dat"   using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_35.dat"   using 5:4 with points pt pt_wt_35 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, fixed weight 3n/5', \
     "data/xxxx_hrss_primeq_fw_23.dat"   using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_23.dat"   using 5:4 with points pt pt_wt_23 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, fixed weight 2n/3', \
     "data/xxxx_hrss_pow2q_fw_38.dat"    using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_38.dat"    using 5:4 with points pt pt_wt_38  lc rgb lc_hrss_pow2 title 'NTRU-HRSS, pow2 q, fixed weight 3n/8', \
     "data/xxxx_hrss_pow2q_fw_12.dat"    using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_12.dat"    using 5:4 with points pt pt_wt_12 lc rgb lc_hrss_pow2 title 'NTRU-HRSS, pow2 q, fixed weight 1n/2', \
     "data/xxxx_hrss_pow2q_fw_35.dat"    using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_35.dat"    using 5:4 with points pt pt_wt_35  lc rgb lc_hrss_pow2 title 'NTRU-HRSS, pow2 q, fixed weight 3n/5', \
     "data/xxxx_hrss_pow2q_fw_23.dat"    using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_23.dat"    using 5:4 with points pt pt_wt_23  lc rgb lc_hrss_pow2 title 'NTRU-HRSS, pow2 q, fixed weight 2n/3', \
     "data/xxxx_hrss_primeq.dat"         using 5:4:(Params(1,2)) with labels hypertext point pt pt_u1_f lc rgb lc_fill notitle,  \
     "data/xxxx_hrss_primeq.dat"         using 5:4 with points pt pt_u1 lc rgb lc_hrss_prime_u title 'NTRU-HRSS, prime q, uniform', \
     "data/xxxx_hrss_pow2q.dat"          using 5:4 with points pt pt_u2  lc rgb lc_hrss_pow2_u title 'NTRU-HRSS, pow2 q, uniform', \
     "data/xxxx_hrss_pow2q.dat"          using 5:4:(Params(1,2)) with labels hypertext point pt pt_u2 lc rgb lc_hrss_pow2_u notitle, \


# variants_all_best

reset

set output 'svg/variants_best_xxxx.svg'

set key bottom right

set grid
set xtics 0,200,4000
set ytics 0,10,400

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel xxxx_ylabel

#set label 1 "Lines connect parameter sets with the same n." at graph .05, graph .9

plot "data/xxxx_ntru_pow2q_fgrm.dat"     using 5:4 with lines lw .5 lc rgb lc_grey notitle, \
     "data/xxxx_hrss_pow2q_fw.dat"       using 5:4 with lines lw .5 lc rgb lc_grey notitle, \
     "data/xxxx_hrss_primeq_fw.dat"      using 5:4 with lines lw .5 lc rgb lc_grey notitle, \
     "data/xxxx_ntru_primeq_fgrm.dat"    using 5:4 with lines lw .5 lc rgb lc_grey notitle, \
     "data/xxxx_ntru_primeq_fgrm_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_fgrm_38.dat" using 5:4 with points pt pt_wt_38 lc rgb lc_grey notitle, \
     "data/xxxx_ntru_primeq_fgrm_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_fgrm_12.dat" using 5:4 with points pt pt_wt_12 lc rgb lc_grey notitle, \
     "data/xxxx_ntru_primeq_fgrm_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_fgrm_35.dat" using 5:4 with points pt pt_wt_35 lc rgb lc_grey notitle, \
     "data/xxxx_ntru_primeq_fgrm_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_fgrm_23.dat" using 5:4 with points pt pt_wt_23 lc rgb lc_grey notitle, \
     "data/xxxx_ntru_pow2q_fgrm_38.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_fgrm_38.dat"  using 5:4 with points pt pt_wt_38  lc rgb lc_grey notitle, \
     "data/xxxx_ntru_pow2q_fgrm_12.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_fgrm_12.dat"  using 5:4 with points pt pt_wt_12 lc rgb lc_grey notitle, \
     "data/xxxx_ntru_pow2q_fgrm_35.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_fgrm_35.dat"  using 5:4 with points pt pt_wt_35  lc rgb lc_grey notitle, \
     "data/xxxx_ntru_pow2q_fgrm_23.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_fgrm_23.dat"  using 5:4 with points pt pt_wt_23  lc rgb lc_grey notitle, \
     "data/xxxx_hrss_primeq_fw_38.dat"   using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_38.dat"   using 5:4 with points pt pt_wt_38 lc rgb lc_grey notitle, \
     "data/xxxx_hrss_primeq_fw_12.dat"   using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_12.dat"   using 5:4 with points pt pt_wt_12 lc rgb lc_grey notitle, \
     "data/xxxx_hrss_primeq_fw_35.dat"   using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_35.dat"   using 5:4 with points pt pt_wt_35 lc rgb lc_grey notitle, \
     "data/xxxx_hrss_primeq_fw_23.dat"   using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_23.dat"   using 5:4 with points pt pt_wt_23 lc rgb lc_grey notitle, \
     "data/xxxx_hrss_pow2q_fw_38.dat"    using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_38.dat"    using 5:4 with points pt pt_wt_38  lc rgb lc_grey notitle, \
     "data/xxxx_hrss_pow2q_fw_12.dat"    using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_12.dat"    using 5:4 with points pt pt_wt_12 lc rgb lc_grey notitle, \
     "data/xxxx_hrss_pow2q_fw_35.dat"    using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_35.dat"    using 5:4 with points pt pt_wt_35  lc rgb lc_grey notitle, \
     "data/xxxx_hrss_pow2q_fw_23.dat"    using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_23.dat"    using 5:4 with points pt pt_wt_23  lc rgb lc_grey notitle, \
     "data/xxxx_hrss_primeq.dat"         using 5:4:(Params(1,2)) with labels hypertext point pt pt_u1_f lc rgb lc_fill notitle,  \
     "data/xxxx_hrss_primeq.dat"         using 5:4 with points pt pt_u1 lc rgb lc_grey notitle, \
     "data/xxxx_hrss_pow2q.dat"          using 5:4 with points pt pt_u2  lc rgb lc_grey notitle, \
     "data/xxxx_hrss_pow2q.dat"          using 5:4:(Params(1,2)) with labels hypertext point pt pt_u2 lc rgb lc_grey notitle, \
     "data/xxxx_ntru_primeq_fgrm_38_best.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_fgrm_38_best.dat" using 5:4 with points pt pt_wt_38 lc rgb lc_ntru_prime title 'NTRU, prime q, fixed type 3n/8 fgrm', \
     "data/xxxx_ntru_primeq_fgrm_12_best.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_fgrm_12_best.dat" using 5:4 with points pt pt_wt_12 lc rgb lc_ntru_prime title 'NTRU, prime q, fixed type 1n/2 fgrm', \
     "data/xxxx_ntru_primeq_fgrm_35_best.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_fgrm_35_best.dat" using 5:4 with points pt pt_wt_35 lc rgb lc_ntru_prime title 'NTRU, prime q, fixed type 3n/5 fgrm', \
     "data/xxxx_ntru_primeq_fgrm_23_best.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_fgrm_23_best.dat" using 5:4 with points pt pt_wt_23 lc rgb lc_ntru_prime title 'NTRU, prime q, fixed type 2n/3 fgrm', \
     "data/xxxx_ntru_pow2q_fgrm_38_best.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_fgrm_38_best.dat"  using 5:4 with points pt pt_wt_38  lc rgb lc_ntru_pow2 title 'NTRU, pow2 q, fixed type 3n/8 fgrm', \
     "data/xxxx_ntru_pow2q_fgrm_12_best.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_fgrm_12_best.dat"  using 5:4 with points pt pt_wt_12 lc rgb lc_ntru_pow2 title 'NTRU, pow2 q, fixed type 1n/2 fgrm', \
     "data/xxxx_ntru_pow2q_fgrm_35_best.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_fgrm_35_best.dat"  using 5:4 with points pt pt_wt_35  lc rgb lc_ntru_pow2 title 'NTRU, pow2 q, fixed type 3n/5 fgrm', \
     "data/xxxx_ntru_pow2q_fgrm_23_best.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_fgrm_23_best.dat"  using 5:4 with points pt pt_wt_23  lc rgb lc_ntru_pow2 title 'NTRU, pow2 q, fixed type 2n/3 fgrm', \
     "data/xxxx_hrss_primeq_fw_38_best.dat"   using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_38_best.dat"   using 5:4 with points pt pt_wt_38 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, fixed weight 3n/8', \
     "data/xxxx_hrss_primeq_fw_12_best.dat"   using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_12_best.dat"   using 5:4 with points pt pt_wt_12 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, fixed weight 1n/2', \
     "data/xxxx_hrss_primeq_fw_35_best.dat"   using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_35_best.dat"   using 5:4 with points pt pt_wt_35 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, fixed weight 3n/5', \
     "data/xxxx_hrss_primeq_fw_23_best.dat"   using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_23_best.dat"   using 5:4 with points pt pt_wt_23 lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, fixed weight 2n/3', \
     "data/xxxx_hrss_pow2q_fw_38_best.dat"    using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_38_best.dat"    using 5:4 with points pt pt_wt_38  lc rgb lc_hrss_pow2 title 'NTRU-HRSS, pow2 q, fixed weight 3n/8', \
     "data/xxxx_hrss_pow2q_fw_12_best.dat"    using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_12_best.dat"    using 5:4 with points pt pt_wt_12 lc rgb lc_hrss_pow2 title 'NTRU-HRSS, pow2 q, fixed weight 1n/2', \
     "data/xxxx_hrss_pow2q_fw_35_best.dat"    using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_35_best.dat"    using 5:4 with points pt pt_wt_35  lc rgb lc_hrss_pow2 title 'NTRU-HRSS, pow2 q, fixed weight 3n/5', \
     "data/xxxx_hrss_pow2q_fw_23_best.dat"    using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_23_best.dat"    using 5:4 with points pt pt_wt_23  lc rgb lc_hrss_pow2 title 'NTRU-HRSS, pow2 q, fixed weight 2n/3', \
     "data/xxxx_hrss_primeq_best.dat"         using 5:4:(Params(1,2)) with labels hypertext point pt pt_u1_f lc rgb lc_fill notitle,  \
     "data/xxxx_hrss_primeq_best.dat"         using 5:4 with points pt pt_u1 lc rgb lc_hrss_prime_u title 'NTRU-HRSS, prime q, uniform', \
     "data/xxxx_hrss_pow2q_best.dat"          using 5:4 with points pt pt_u2  lc rgb lc_hrss_pow2_u title 'NTRU-HRSS, pow2 q, uniform', \
     "data/xxxx_hrss_pow2q_best.dat"          using 5:4:(Params(1,2)) with labels hypertext point pt pt_u2 lc rgb lc_hrss_pow2_u notitle, \





#  Various values of p

reset

set output 'svg/variants_hrss_p_xxxx.svg'

set grid
set xtics 0,200,4000
set ytics 0,10,400

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel xxxx_ylabel

set key bottom right

plot "data/xxxx_hrss_primeq_p2.dat" using 5:4 with points pt pt_sntrup lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, p=2', \
     "data/xxxx_hrss_primeq_p3.dat" using 5:4 with points pt pt_wt_35  lc rgb lc_hrss_pow2  title 'NTRU-HRSS, prime q, p=3', \
     "data/xxxx_hrss_primeq_p4.dat" using 5:4 with points pt pt_wt_23  lc rgb lc_sntrup     title 'NTRU-HRSS, prime q, p=4', \
     "data/xxxx_hrss_primeq_p5.dat" using 5:4 with points pt pt_wt_38  lc rgb lc_ntru_pow2  title 'NTRU-HRSS, prime q, p=5', \
