# variants_sntrup

# variants_hps_hrss_sntrup

reset

set output 'svg/xxxx_yyyy_nist_submission_options.svg'

set key bottom right

set grid
set xtics 0,200,4000
set ytics 0,10,400

set xlabel 'Communication cost (pk + ct bytes)'
set ylabel xxxx_yyyy_ylabel

#set arrow 1 size 1 front lc rgb lc_arrow \
#            from sntrup4591761_bytes+ax1,sntrup4591761_xxxx_yyyy_cost+ay1+6 \
#              to sntrup4591761_bytes+ax2,sntrup4591761_xxxx_yyyy_cost+ay2
#set label 1 "sntrup4591761" at sntrup4591761_bytes-580,sntrup4591761_xxxx_yyyy_cost+ay1+7

set arrow 2 size 1 front lc rgb lc_black \
            from ntruhrss701_bytes+ax1,ntruhrss701_xxxx_yyyy_cost+ay1-13 \
              to ntruhrss701_bytes+ax2,ntruhrss701_xxxx_yyyy_cost+ay2
set label 2 "ntruhrss701" at ntruhrss701_bytes+ax2-500,ntruhrss701_xxxx_yyyy_cost+ay1-12

set arrow 3 size 1 front lc rgb lc_black \
            from ntruhps2048509_bytes,ntruhps2048509_xxxx_yyyy_cost+ay1-1 \
              to ntruhps2048509_bytes,ntruhps2048509_xxxx_yyyy_cost+ay2
set label 3 "ntruhps2048509" at ntruhps2048509_bytes-200,ntruhps2048509_xxxx_yyyy_cost+ay1

set arrow 4 size 1 front lc rgb lc_black \
            from ntruhps2048677_bytes+ax1,ntruhps2048677_xxxx_yyyy_cost+ay1-13 \
              to ntruhps2048677_bytes+ax2,ntruhps2048677_xxxx_yyyy_cost+ay2
set label 4 "ntruhps2048677" at ntruhps2048677_bytes-550,ntruhps2048677_xxxx_yyyy_cost+ay1-12

set arrow 5 size 1 front lc rgb lc_black \
            from ntruhps4096821_bytes+ax1,ntruhps4096821_xxxx_yyyy_cost+ay1-13 \
              to ntruhps4096821_bytes+ax2,ntruhps4096821_xxxx_yyyy_cost+ay2
set label 5 "ntruhps4096821" at ntruhps4096821_bytes-550,ntruhps4096821_xxxx_yyyy_cost+ay1-12

set arrow 6 size 1 front lc rgb lc_black \
            from ntruees443ep1_bytes,ntruees443ep1_xxxx_yyyy_cost+ay1-1 \
              to ntruees443ep1_bytes,ntruees443ep1_xxxx_yyyy_cost+ay2
set label 6 "ntru-pke-443" at ntruees443ep1_bytes-125,ntruees443ep1_xxxx_yyyy_cost+ay1

set arrow 7 size 1 front lc rgb lc_black \
            from ntruees743ep1_bytes+ax1,ntruees743ep1_xxxx_yyyy_cost+ay1-13 \
              to ntruees743ep1_bytes+ax2,ntruees743ep1_xxxx_yyyy_cost+ay2
set label 7 "ntru-pke-743" at ntruees743ep1_bytes-450,ntruees743ep1_xxxx_yyyy_cost+ay1-12

plot "data/xxxx_yyyy_hps_primeq.dat"          using 5:4 with points pt 7 ps .5 lc rgb lc_ntru_prime title 'ntruhps-like with q prime', \
     "data/xxxx_yyyy_hps_pow2q.dat"           using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f lc rgb lc_fill notitle, \
     "data/xxxx_yyyy_hps_pow2q.dat"           using 5:4 with points pt pt_wt_23 lc rgb lc_ntru_prime title 'ntruhps', \
     "data/xxxx_yyyy_hps_primeq_fatf.dat"     using 5:4 with points pt 7 ps .5 lc rgb lc_hrss_prime title 'ntruhps-like with f = 1+3F and q prime', \
     "data/xxxx_yyyy_hps_pow2q_fatf.dat"      using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f lc rgb lc_fill notitle, \
     "data/xxxx_yyyy_hps_pow2q_fatf.dat"      using 5:4 with points pt pt_wt_23 lc rgb lc_hrss_prime title 'ntruhps-like with f = 1+3F', \
     "data/xxxx_yyyy_hrss_primeq.dat"         using 5:4 with points pt 7 ps .5 lc rgb lc_hrss_pow2_u title 'ntruhrss-like with q prime', \
     "data/xxxx_yyyy_hrss_pow2q.dat"          using 5:4:(Params(1,2)) with labels hypertext point pt pt_wt_23_f lc rgb lc_fill notitle, \
     "data/xxxx_yyyy_hrss_pow2q.dat"          using 5:4 with points pt pt_wt_23 lc rgb lc_hrss_pow2_u title 'ntruhrss', \
     "data/xxxx_yyyy_ees.dat"                 using 5:4 with points pt pt_wt_23  lc rgb lc_ees title 'NTRUEncrypt submission parameters', \
     "data/xxxx_yyyy_ees.dat"                 using 5:4:(Params3(1,2,3))   with labels hypertext point pt pt_wt_23 lc lc_ees notitle, \
