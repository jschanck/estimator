# variants_sntrup

# reset
# 
# set output 'svg/variants_sntrup_xxxx.svg'
# 
# set grid
# set xtics 0,200,4000
# set ytics 0,10,400
# 
# set xlabel 'Communication cost (pk + ct bytes)'
# set ylabel xxxx_ylabel
# 
# set key bottom right
# #set label 1 "Lines connect parameter sets with the same n." at graph .05, graph .9
# 
# plot "data/xxxx_sntrup.dat"            using 5:4 with points pt pt_sntrup  lc rgb lc_gray2 title 'Streamlined NTRU Prime',                \
#      "data/xxxx_sntrup.dat"            using 5:4:(Params3(1,2,3))  with labels hypertext point pt pt_sntrup  lc lc_gray2 notitle, \
#      "data/xxxx_sntrup_orig.dat"       using 5:($4-5.5) with points pt pt_sntrup  lc rgb lc_sntrup title 'Streamlined NTRU Prime',                \
#      "data/xxxx_sntrup_orig.dat"       using 5:($4-5.5):(Params3(1,2,3))  with labels hypertext point pt pt_sntrup  lc rgb "#ff9f00" notitle, \



# variants_hps_hrss

reset

set output 'svg/variants_hps_hrss_xxxx.svg'

set key bottom right

set grid
set xtics 0,200,4000
set ytics 0,10,400

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel xxxx_ylabel


set arrow 2 front lc rgb lc_arrow \
            from ntruhrss701_bytes+ax1,ntruhrss701_xxxxcost+ay1 \
            to ntruhrss701_bytes+ax2,ntruhrss701_xxxxcost+ay2
set label 2 "ntruhrss701" at ntruhrss701_bytes-475,ntruhrss701_xxxxcost+ay1+1

set arrow 3 front lc rgb lc_arrow \
            from ntruhps2048509_bytes+ax2-50,ntruhps2048509_xxxxcost+ay1 \
            to ntruhps2048509_bytes+ax2,ntruhps2048509_xxxxcost+ay2
set label 3 "ntruhps2048509" at ntruhps2048509_bytes+ax2-200,ntruhps2048509_xxxxcost+ay1+2

set arrow 4 front lc rgb lc_arrow \
            from ntruhps2048677_bytes+ax1,ntruhps2048677_xxxxcost+ay1 \
            to ntruhps2048677_bytes+ax2,ntruhps2048677_xxxxcost+ay2
set label 4 "ntruhps2048677" at ntruhps2048677_bytes-550,ntruhps2048677_xxxxcost+ay1+2

set arrow 5 front lc rgb lc_arrow \
            from ntruhps4096701_bytes+ax1,ntruhps4096701_xxxxcost+ay1 \
              to ntruhps4096701_bytes+ax2,ntruhps4096701_xxxxcost+ay2
set label 5 "ntruhps4096701" at ntruhps4096701_bytes-550,ntruhps4096701_xxxxcost+ay1+2

set arrow 6 front lc rgb lc_arrow \
            from ntruhps4096821_bytes+ax1,ntruhps4096821_xxxxcost+ay1-13 \
              to ntruhps4096821_bytes+ax2,ntruhps4096821_xxxxcost+ay2
set label 6 "ntruhps4096821" at ntruhps4096821_bytes-550,ntruhps4096821_xxxxcost+ay1-12


plot "data/xxxx_ntru_pow2q_ft.dat"     using 5:4 with lines lw .5 lc rgb lc_ntru_pow2 notitle, \
     "data/xxxx_hrss_pow2q_fw.dat"       using 5:4 with lines lw .5 lc rgb lc_hrss_pow2 notitle, \
     "data/xxxx_hrss_primeq_fw.dat"      using 5:4 with lines lw .5 lc rgb lc_hrss_prime notitle, \
     "data/xxxx_ntru_primeq_ft.dat"    using 5:4 with lines lw .5 lc rgb lc_ntru_prime notitle, \
     "data/xxxx_ntru_primeq_ft_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_ft_38.dat" using 5:4 with points pt pt_wt_38 lc rgb lc_ntru_prime title 'NTRU-HPS, prime q, fixed type 3n/8', \
     "data/xxxx_ntru_primeq_ft_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_ft_12.dat" using 5:4 with points pt pt_wt_12 lc rgb lc_ntru_prime title 'NTRU-HPS, prime q, fixed type 1n/2', \
     "data/xxxx_ntru_primeq_ft_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_ft_35.dat" using 5:4 with points pt pt_wt_35 lc rgb lc_ntru_prime title 'NTRU-HPS, prime q, fixed type 3n/5', \
     "data/xxxx_ntru_primeq_ft_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_ft_23.dat" using 5:4 with points pt pt_wt_23 lc rgb lc_ntru_prime title 'NTRU-HPS, prime q, fixed type 2n/3', \
     "data/xxxx_ntru_pow2q_ft_38.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_ft_38.dat"  using 5:4 with points pt pt_wt_38  lc rgb lc_ntru_pow2 title 'NTRU-HPS, pow2 q, fixed type 3n/8', \
     "data/xxxx_ntru_pow2q_ft_12.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_ft_12.dat"  using 5:4 with points pt pt_wt_12 lc rgb lc_ntru_pow2 title 'NTRU-HPS, pow2 q, fixed type 1n/2', \
     "data/xxxx_ntru_pow2q_ft_35.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_ft_35.dat"  using 5:4 with points pt pt_wt_35  lc rgb lc_ntru_pow2 title 'NTRU-HPS, pow2 q, fixed type 3n/5', \
     "data/xxxx_ntru_pow2q_ft_23.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_ft_23.dat"  using 5:4 with points pt pt_wt_23  lc rgb lc_ntru_pow2 title 'NTRU-HPS, pow2 q, fixed type 2n/3', \
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


# variants_hps_hrss_sntrup

reset

set output 'svg/variants_hps_hrss_sntrup_xxxx.svg'

set key bottom right

set grid
set xtics 0,200,4000
set ytics 0,10,400

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel xxxx_ylabel

set arrow 1 front lc rgb lc_arrow \
            from sntrup7541743_bytes+ax1,sntrup7541743_xxxxcost+ay1+6 \
              to sntrup7541743_bytes+ax2,sntrup7541743_xxxxcost+ay2
set label 1 "sntrup7541743" at sntrup7541743_bytes-480,sntrup7541743_xxxxcost+ay1+7

set arrow 2 front lc rgb lc_arrow \
            from sntrup4591761_bytes+ax1,sntrup4591761_xxxxcost+ay1+6 \
              to sntrup4591761_bytes+ax2,sntrup4591761_xxxxcost+ay2
set label 2 "sntrup4591761" at sntrup4591761_bytes-580,sntrup4591761_xxxxcost+ay1+7

#set arrow 3 front lc rgb lc_arrow \
#            from sntrup877773_bytes+ax1,sntrup877773_xxxxcost+ay1+7 \
#              to sntrup877773_bytes+ax2,sntrup877773_xxxxcost+ay2
#set label 3 "sntrup877773" at sntrup877773_bytes-550,sntrup877773_xxxxcost+ay1+8

set arrow 4 front lc rgb lc_arrow \
            from sntrup11923709_bytes+ax1,sntrup11923709_xxxxcost+ay1+6 \
              to sntrup11923709_bytes+ax2,sntrup11923709_xxxxcost+ay2
set label 4 "sntrup11923709" at sntrup11923709_bytes-590,sntrup11923709_xxxxcost+ay1+7

set arrow 5 front lc rgb lc_arrow \
            from sntrup12241727_bytes+ax1,sntrup12241727_xxxxcost+ay1+6 \
              to sntrup12241727_bytes+ax2,sntrup12241727_xxxxcost+ay2
set label 5 "sntrup12241727" at sntrup12241727_bytes-590,sntrup12241727_xxxxcost+ay1+7

set arrow 6 front lc rgb lc_arrow \
            from sntrup5167857_bytes+ax1,sntrup5167857_xxxxcost+ay1 \
              to sntrup5167857_bytes+ax2,sntrup5167857_xxxxcost+ay2
set label 6 "sntrup5167857" at sntrup5167857_bytes-580,sntrup5167857_xxxxcost+ay1

plot "data/xxxx_ntru_pow2q_ft.dat"     using 5:4 with lines lw .5 lc rgb lc_ntru_pow2 notitle, \
     "data/xxxx_hrss_pow2q_fw.dat"       using 5:4 with lines lw .5 lc rgb lc_hrss_pow2 notitle, \
     "data/xxxx_hrss_primeq_fw.dat"      using 5:4 with lines lw .5 lc rgb lc_hrss_prime notitle, \
     "data/xxxx_ntru_primeq_ft.dat"    using 5:4 with lines lw .5 lc rgb lc_ntru_prime notitle, \
     "data/xxxx_ntru_primeq_ft_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_ft_38.dat" using 5:4 with points pt pt_wt_38 lc rgb lc_ntru_prime title 'NTRU-HPS, prime q, fixed type 3n/8', \
     "data/xxxx_ntru_primeq_ft_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_ft_12.dat" using 5:4 with points pt pt_wt_12 lc rgb lc_ntru_prime title 'NTRU-HPS, prime q, fixed type 1n/2', \
     "data/xxxx_ntru_primeq_ft_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_ft_35.dat" using 5:4 with points pt pt_wt_35 lc rgb lc_ntru_prime title 'NTRU-HPS, prime q, fixed type 3n/5', \
     "data/xxxx_ntru_primeq_ft_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_ft_23.dat" using 5:4 with points pt pt_wt_23 lc rgb lc_ntru_prime title 'NTRU-HPS, prime q, fixed type 2n/3', \
     "data/xxxx_ntru_pow2q_ft_38.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_ft_38.dat"  using 5:4 with points pt pt_wt_38  lc rgb lc_ntru_pow2 title 'NTRU-HPS, pow2 q, fixed type 3n/8', \
     "data/xxxx_ntru_pow2q_ft_12.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_ft_12.dat"  using 5:4 with points pt pt_wt_12 lc rgb lc_ntru_pow2 title 'NTRU-HPS, pow2 q, fixed type 1n/2', \
     "data/xxxx_ntru_pow2q_ft_35.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_ft_35.dat"  using 5:4 with points pt pt_wt_35  lc rgb lc_ntru_pow2 title 'NTRU-HPS, pow2 q, fixed type 3n/5', \
     "data/xxxx_ntru_pow2q_ft_23.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_ft_23.dat"  using 5:4 with points pt pt_wt_23  lc rgb lc_ntru_pow2 title 'NTRU-HPS, pow2 q, fixed type 2n/3', \
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
     "data/xxxx_sntrup.dat"              using 5:4 with lines lw .2 lc rgb lc_gray2 notitle, \
     "data/xxxx_sntrup.dat"              using 5:4 with points pt pt_sntrup  lc rgb lc_gray2   title 'Streamlined NTRU Prime', \
     "data/xxxx_sntrup.dat"              using 5:4:(Params3(1,2,3)) with labels hypertext point pt pt_sntrup  lc lc_gray2 notitle, \
     "data/xxxx_sntrup_pruned.dat"       using 5:4 with lines lw .2 lc rgb lc_sntrup notitle, \
     "data/xxxx_sntrup_pruned.dat"       using 5:4 with points pt pt_sntrup  lc rgb lc_sntrup title 'Streamlined NTRU Prime with n/3 < d < 2n/3 and q < 18n', \
     "data/xxxx_sntrup_pruned.dat"       using 5:4:(Params3(1,2,3))   with labels hypertext point pt pt_sntrup  lc rgb "#ff9f00" notitle, \

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

plot "data/xxxx_ntru_pow2q_ft.dat"     using 5:4 with lines lw .5 lc rgb lc_gray notitle, \
     "data/xxxx_hrss_pow2q_fw.dat"       using 5:4 with lines lw .5 lc rgb lc_gray notitle, \
     "data/xxxx_hrss_primeq_fw.dat"      using 5:4 with lines lw .5 lc rgb lc_gray notitle, \
     "data/xxxx_ntru_primeq_ft.dat"    using 5:4 with lines lw .5 lc rgb lc_gray notitle, \
     "data/xxxx_ntru_primeq_ft_38.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_ft_38.dat" using 5:4 with points pt pt_wt_38 lc rgb lc_gray notitle, \
     "data/xxxx_ntru_primeq_ft_12.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_ft_12.dat" using 5:4 with points pt pt_wt_12 lc rgb lc_gray notitle, \
     "data/xxxx_ntru_primeq_ft_35.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_ft_35.dat" using 5:4 with points pt pt_wt_35 lc rgb lc_gray notitle, \
     "data/xxxx_ntru_primeq_ft_23.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_ft_23.dat" using 5:4 with points pt pt_wt_23 lc rgb lc_gray notitle, \
     "data/xxxx_ntru_pow2q_ft_38.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_ft_38.dat"  using 5:4 with points pt pt_wt_38  lc rgb lc_gray notitle, \
     "data/xxxx_ntru_pow2q_ft_12.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_ft_12.dat"  using 5:4 with points pt pt_wt_12 lc rgb lc_gray notitle, \
     "data/xxxx_ntru_pow2q_ft_35.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_ft_35.dat"  using 5:4 with points pt pt_wt_35  lc rgb lc_gray notitle, \
     "data/xxxx_ntru_pow2q_ft_23.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_ft_23.dat"  using 5:4 with points pt pt_wt_23  lc rgb lc_gray notitle, \
     "data/xxxx_hrss_primeq_fw_38.dat"   using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_38.dat"   using 5:4 with points pt pt_wt_38 lc rgb lc_gray notitle, \
     "data/xxxx_hrss_primeq_fw_12.dat"   using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_12.dat"   using 5:4 with points pt pt_wt_12 lc rgb lc_gray notitle, \
     "data/xxxx_hrss_primeq_fw_35.dat"   using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_35.dat"   using 5:4 with points pt pt_wt_35 lc rgb lc_gray notitle, \
     "data/xxxx_hrss_primeq_fw_23.dat"   using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_primeq_fw_23.dat"   using 5:4 with points pt pt_wt_23 lc rgb lc_gray notitle, \
     "data/xxxx_hrss_pow2q_fw_38.dat"    using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_38.dat"    using 5:4 with points pt pt_wt_38  lc rgb lc_gray notitle, \
     "data/xxxx_hrss_pow2q_fw_12.dat"    using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_12.dat"    using 5:4 with points pt pt_wt_12 lc rgb lc_gray notitle, \
     "data/xxxx_hrss_pow2q_fw_35.dat"    using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_35.dat"    using 5:4 with points pt pt_wt_35  lc rgb lc_gray notitle, \
     "data/xxxx_hrss_pow2q_fw_23.dat"    using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q_fw_23.dat"    using 5:4 with points pt pt_wt_23  lc rgb lc_gray notitle, \
     "data/xxxx_hrss_primeq.dat"         using 5:4:(Params(1,2)) with labels hypertext point pt pt_u1_f lc rgb lc_fill notitle,  \
     "data/xxxx_hrss_primeq.dat"         using 5:4 with points pt pt_u1 lc rgb lc_gray notitle, \
     "data/xxxx_hrss_pow2q.dat"          using 5:4 with points pt pt_u2  lc rgb lc_gray notitle, \
     "data/xxxx_hrss_pow2q.dat"          using 5:4:(Params(1,2)) with labels hypertext point pt pt_u2 lc rgb lc_gray notitle, \
     "data/xxxx_ntru_primeq_ft_38_best.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_ft_38_best.dat" using 5:4 with points pt pt_wt_38 lc rgb lc_ntru_prime title 'NTRU-HPS, prime q, fixed type 3n/8', \
     "data/xxxx_ntru_primeq_ft_12_best.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_ft_12_best.dat" using 5:4 with points pt pt_wt_12 lc rgb lc_ntru_prime title 'NTRU-HPS, prime q, fixed type 1n/2', \
     "data/xxxx_ntru_primeq_ft_35_best.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_ft_35_best.dat" using 5:4 with points pt pt_wt_35 lc rgb lc_ntru_prime title 'NTRU-HPS, prime q, fixed type 3n/5', \
     "data/xxxx_ntru_primeq_ft_23_best.dat" using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_primeq_ft_23_best.dat" using 5:4 with points pt pt_wt_23 lc rgb lc_ntru_prime title 'NTRU-HPS, prime q, fixed type 2n/3', \
     "data/xxxx_ntru_pow2q_ft_38_best.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_38_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_ft_38_best.dat"  using 5:4 with points pt pt_wt_38  lc rgb lc_ntru_pow2 title 'NTRU-HPS, pow2 q, fixed type 3n/8', \
     "data/xxxx_ntru_pow2q_ft_12_best.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_12_f lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_ft_12_best.dat"  using 5:4 with points pt pt_wt_12 lc rgb lc_ntru_pow2 title 'NTRU-HPS, pow2 q, fixed type 1n/2', \
     "data/xxxx_ntru_pow2q_ft_35_best.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_35_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_ft_35_best.dat"  using 5:4 with points pt pt_wt_35  lc rgb lc_ntru_pow2 title 'NTRU-HPS, pow2 q, fixed type 3n/5', \
     "data/xxxx_ntru_pow2q_ft_23_best.dat"  using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f  lc rgb lc_fill notitle, \
     "data/xxxx_ntru_pow2q_ft_23_best.dat"  using 5:4 with points pt pt_wt_23  lc rgb lc_ntru_pow2 title 'NTRU-HPS, pow2 q, fixed type 2n/3', \
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

plot "data/xxxx_hrss_primeq_p2.dat" using 5:4 with points pt pt_sntrup lc rgb lc_hrss_prime title 'NTRU-HRSS, prime q, uniform, p=2', \
     "data/xxxx_hrss_primeq_p3.dat" using 5:4 with points pt pt_wt_35  lc rgb lc_hrss_pow2  title 'NTRU-HRSS, prime q, uniform, p=3', \
     "data/xxxx_hrss_primeq_p5.dat" using 5:4 with points pt pt_wt_38  lc rgb lc_ntru_pow2  title 'NTRU-HRSS, prime q, uniform, p=5', \
