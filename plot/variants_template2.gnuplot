# variants_sntrup

# variants_hps_hrss_sntrup

reset

set output 'svg/xxxx_nist_submission_options.svg'

set key bottom right

set grid
set xtics 0,200,4000
set ytics 0,10,400

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel xxxx_ylabel

#set arrow 1 size 1 front lc rgb lc_arrow \
#            from sntrup4591761_bytes+ax1,sntrup4591761_xxxxcost+ay1+6 \
#              to sntrup4591761_bytes+ax2,sntrup4591761_xxxxcost+ay2
#set label 1 "sntrup4591761" at sntrup4591761_bytes-580,sntrup4591761_xxxxcost+ay1+7

set arrow 2 size 1 front lc rgb lc_gray2 \
            from ntruhrss701_bytes+ax1,ntruhrss701_xxxxcost+ay1 \
            to ntruhrss701_bytes+ax2,ntruhrss701_xxxxcost+ay2
set label 2 "ntruhrss701" at ntruhrss701_bytes-475,ntruhrss701_xxxxcost+ay1+1

set arrow 3 size 1 front lc rgb lc_gray2 \
            from ntruhps2048509_bytes+ax2-50,ntruhps2048509_xxxxcost+ay1 \
            to ntruhps2048509_bytes+ax2,ntruhps2048509_xxxxcost+ay2
set label 3 "ntruhps2048509" at ntruhps2048509_bytes+ax2-100,ntruhps2048509_xxxxcost+ay1+2

set arrow 4 size 1 front lc rgb lc_gray2 \
            from ntruhps2048677_bytes+ax1,ntruhps2048677_xxxxcost+ay1 \
            to ntruhps2048677_bytes+ax2,ntruhps2048677_xxxxcost+ay2
set label 4 "ntruhps2048677" at ntruhps2048677_bytes-550,ntruhps2048677_xxxxcost+ay1+2

set arrow 5 size 1 front lc rgb lc_gray2 \
            from ntruhps4096821_bytes+ax1,ntruhps4096821_xxxxcost+ay1-13 \
              to ntruhps4096821_bytes+ax2,ntruhps4096821_xxxxcost+ay2
set label 5 "ntruhps4096821" at ntruhps4096821_bytes-550,ntruhps4096821_xxxxcost+ay1-12

plot "data/xxxx_hps_primeq.dat"          using 5:4 with points pt 7 ps .5 lc rgb lc_ntru_prime title 'ntruhps-like with q prime', \
     "data/xxxx_hps_pow2q.dat"           using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f lc rgb lc_fill notitle, \
     "data/xxxx_hps_pow2q.dat"           using 5:4 with points pt pt_wt_23 lc rgb lc_ntru_prime title 'ntruhps', \
     "data/xxxx_hps_primeq_fatf.dat"     using 5:4 with points pt 7 ps .5 lc rgb lc_hrss_prime title 'ntruhps-like with f = 1+3F and q prime', \
     "data/xxxx_hps_pow2q_fatf.dat"      using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f lc rgb lc_fill notitle, \
     "data/xxxx_hps_pow2q_fatf.dat"      using 5:4 with points pt pt_wt_23 lc rgb lc_hrss_prime title 'ntruhps-like with f = 1+3F', \
     "data/xxxx_hrss_primeq.dat"         using 5:4 with points pt 7 ps .5 lc rgb lc_hrss_pow2_u title 'ntruhrss-like with q prime', \
     "data/xxxx_hrss_pow2q.dat"          using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f lc rgb lc_fill notitle, \
     "data/xxxx_hrss_pow2q.dat"          using 5:4 with points pt pt_wt_23 lc rgb lc_hrss_pow2_u title 'ntruhrss', \
     #"data/xxxx_sntrup_pruned.dat"       using 5:4 with points pt pt_sntrup  lc rgb lc_sntrup title 'Streamlined NTRU Prime with n/3 < d < 2n/3 and q < 18n', \
     #"data/xxxx_sntrup_pruned.dat"       using 5:4:(Params3(1,2,3))   with labels hypertext point pt pt_sntrup  lc rgb "#ff9f00" notitle, \
