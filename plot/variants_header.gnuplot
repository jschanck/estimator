sieve_ylabel = 'Core-sieve attack cost (log scale)'
enum_ylabel = 'Hybrid-enum attack cost (log scale)'

# Mouse-over text
Params(a,b) = sprintf("n=%d, q=%d", column(a), column(b))
Params2(a,b,c) = sprintf("n=%d, q=%d, d=%s", column(a), column(b), stringcolumn(c))
Params3(a,b,c) = sprintf("n=%d, q=%d, w=%.2fn", column(a), column(b), column(c)/column(a))

# Constants for arrows
ntruhrss701_bytes = 2276          # 2 * ceil(700*log(2,8192)/8)
ntruhrss701_sievecost = 134
ntruhrss701_enumcost  = 207

sntrup4591761_bytes = 1158 + 1007 # ceil(761*log(2,4591)/8)+ceil(761*log(2,4591/3)/8)
sntrup4591761_sievecost = 151
sntrup4591761_enumcost  = 225


plotw = 700
ploth = 900

pt_wt_38 = 8
pt_wt_38_f = 9
pt_wt_12 = 12
pt_wt_12_f = 13
pt_wt_35 = 4
pt_wt_35_f = 5
pt_wt_23 = 6
pt_wt_23_f = 7
pt_u1 = 10
pt_u1_f = 11
pt_u2 = 3
pt_sntrup = 2

lc_fill = "#ffffff"

lc_grey         = "#dddddd"
lc_hrss_prime   = "#009e73"
lc_hrss_pow2    = "#56b4e9"
lc_hrss_prime_u = "#9400d3"
lc_hrss_pow2_u  = "#e51e10"
lc_ntru_prime   = "#003366"
lc_ntru_pow2    = "#ff66cc"
lc_sntrup       = "#ff9f00"



#set arrow 3 from sntrup4591761_bytes-250,sntrup4591761_sievecost+5 to sntrup4591761_bytes-20,sntrup4591761_sievecost+.5
#set label 3 "sntrup4591761" at sntrup4591761_bytes-450,sntrup4591761_sievecost+6
#
#set arrow 1 from ntruhrss701_bytes+150, ntruhrss701_sievecost-5 to ntruhrss701_bytes+25, ntruhrss701_sievecost+1
#set label 2 "ntruhrss701" at ntruhrss701_bytes+150, ntruhrss701_sievecost-6


