core_nv08_ylabel = 'Core-SVP cost, 0.415b metric, log scale'
hybrid_nv08_ylabel = 'Hybrid attack cost assuming Core-SVP preprocessing, 0.415b metric, log scale'
core_bdgl16_ylabel = 'Core-SVP cost, 0.292b metric, log scale'
hybrid_bdgl16_ylabel = 'Hybrid attack cost assuming Core-SVP preprocessing, 0.292b metric, log scale'
core_d18_ylabel = 'Core-SVP cost, 0.3495b metric, log scale'
hybrid_d18_ylabel = 'Hybrid attack cost assuming Core-SVP preprocessing, 0.3495b metric, log scale'

#hybrid_ylabel = 'Hybrid cost, (b/2e)log2(b) - b + 16 metric, log scale'
#hybrid_ylabel = 'Hybrid cost, 0.000784314*b^2 + 0.366078*b - 6.125 metric, log scale'

# Mouse-over text
Params(a,b) = sprintf("n=%d, q=%d", column(a), column(b))
Params2(a,b,c) = sprintf("n=%d, q=%d, d=%s", column(a), column(b), stringcolumn(c))
Params3(a,b,c) = sprintf("n=%d, q=%d, w=%.2fn", column(a), column(b), column(c)/column(a))

# Constants for arrows
ntruhrss701_bytes = 2276          # 2 * ceil(700*log(2,8192)/8)
ntruhrss701_core_nv08_cost = `grep 701 ./data/core_nv08_hrss_pow2q.dat | cut -d, -f 4`
ntruhrss701_hybrid_nv08_cost  = `grep 701 ./data/hybrid_nv08_hrss_pow2q.dat | cut -d, -f 4`
ntruhrss701_core_bdgl16_cost = `grep 701 ./data/core_bdgl16_hrss_pow2q.dat | cut -d, -f 4`
ntruhrss701_hybrid_bdgl16_cost  = `grep 701 ./data/hybrid_bdgl16_hrss_pow2q.dat | cut -d, -f 4`
ntruhrss701_core_d18_cost = `grep 701 ./data/core_d18_hrss_pow2q.dat | cut -d, -f 4`
ntruhrss701_hybrid_d18_cost  = `grep 701 ./data/hybrid_d18_hrss_pow2q.dat | cut -d, -f 4`

ntruhps2048509_bytes = 1398
ntruhps2048509_core_nv08_cost = `grep "509, 2048" ./data/core_nv08_hps_pow2q.dat | cut -d, -f 4`
ntruhps2048509_hybrid_nv08_cost  = `grep "509, 2048" ./data/hybrid_nv08_hps_pow2q.dat | cut -d, -f 4`
ntruhps2048509_core_bdgl16_cost = `grep "509, 2048" ./data/core_bdgl16_hps_pow2q.dat | cut -d, -f 4`
ntruhps2048509_hybrid_bdgl16_cost  = `grep "509, 2048" ./data/hybrid_bdgl16_hps_pow2q.dat | cut -d, -f 4`
ntruhps2048509_core_d18_cost = `grep "509, 2048" ./data/core_d18_hps_pow2q.dat | cut -d, -f 4`
ntruhps2048509_hybrid_d18_cost  = `grep "509, 2048" ./data/hybrid_d18_hps_pow2q.dat | cut -d, -f 4`

ntruhps2048677_bytes = 1860
#ntruhps2048677_core_bdgl_cost = 144
#ntruhps2048677_hybrid_bdgl_cost = 144
ntruhps2048677_core_nv08_cost = `grep "677, 2048" ./data/core_nv08_hps_pow2q.dat | cut -d, -f 4`
ntruhps2048677_hybrid_nv08_cost  = `grep "677, 2048" ./data/hybrid_nv08_hps_pow2q.dat | cut -d, -f 4`
ntruhps2048677_core_bdgl16_cost = `grep "677, 2048" ./data/core_bdgl16_hps_pow2q.dat | cut -d, -f 4`
ntruhps2048677_hybrid_bdgl16_cost  = `grep "677, 2048" ./data/hybrid_bdgl16_hps_pow2q.dat | cut -d, -f 4`
ntruhps2048677_core_d18_cost = `grep "677, 2048" ./data/core_d18_hps_pow2q.dat | cut -d, -f 4`
ntruhps2048677_hybrid_d18_cost  = `grep "677, 2048" ./data/hybrid_d18_hps_pow2q.dat | cut -d, -f 4`

#ntruhps4096701_bytes = 2100
#ntruhps4096701_core_bdgl_cost = 149
#ntruhps4096701_hybrid_bdgl_cost = 226
#ntruhps4096701_hybrid_bdgl_cost = 146

ntruhps4096821_bytes = 2460
ntruhps4096821_core_nv08_cost = `grep "821, 4096" ./data/core_nv08_hps_pow2q.dat | cut -d, -f 4`
ntruhps4096821_hybrid_nv08_cost  = `grep "821, 4096" ./data/hybrid_nv08_hps_pow2q.dat | cut -d, -f 4`
ntruhps4096821_core_bdgl16_cost = `grep "821, 4096" ./data/core_bdgl16_hps_pow2q.dat | cut -d, -f 4`
ntruhps4096821_hybrid_bdgl16_cost  = `grep "821, 4096" ./data/hybrid_bdgl16_hps_pow2q.dat | cut -d, -f 4`
ntruhps4096821_core_d18_cost = `grep "821, 4096" ./data/core_d18_hps_pow2q.dat | cut -d, -f 4`
ntruhps4096821_hybrid_d18_cost  = `grep "821, 4096" ./data/hybrid_d18_hps_pow2q.dat | cut -d, -f 4`

sntrup11923709_bytes = 2261
sntrup11923709_core_bdgl_cost = 133
#sntrup11923709_hybrid_bdgl_cost  = 202
sntrup11923709_hybrid_bdgl_cost  = 130

sntrup12241727_bytes = 2325
sntrup12241727_core_bdgl_cost = 136
#sntrup12241727_hybrid_bdgl_cost  = 210
sntrup12241727_hybrid_bdgl_cost  = 133

sntrup7541743_bytes = 2247
sntrup7541743_core_bdgl_cost = 147
#sntrup7541743_hybrid_bdgl_cost  = 228
sntrup7541743_hybrid_bdgl_cost  = 146

sntrup4591761_bytes = 2165
sntrup4591761_core_bdgl_cost = 151
#sntrup4591761_hybrid_bdgl_cost  = 225
sntrup4591761_hybrid_bdgl_cost  = 151

#sntrup877773_bytes = 1737
#sntrup877773_core_bdgl_cost = 147
#sntrup877773_hybrid_bdgl_cost  = 116

sntrup5167857_bytes = 2474
sntrup5167857_core_bdgl_cost = 172
sntrup5167857_hybrid_bdgl_cost  = 262
#sntrup5167857_hybrid_bdgl_cost  = 267

ntruees443ep1_bytes = 1220
ntruees443ep1_core_nv08_cost = `grep 443 ./data/core_nv08_ees.dat | cut -d, -f 4`
ntruees443ep1_hybrid_nv08_cost = `grep 443 ./data/hybrid_nv08_ees.dat | cut -d, -f 4`
ntruees443ep1_core_bdgl16_cost = `grep 443 ./data/core_bdgl16_ees.dat | cut -d, -f 4`
ntruees443ep1_hybrid_bdgl16_cost = `grep 443 ./data/hybrid_bdgl16_ees.dat | cut -d, -f 4`
ntruees443ep1_core_d18_cost = `grep 443 ./data/hybrid_d18_ees.dat | cut -d, -f 4`
ntruees443ep1_hybrid_d18_cost  = `grep 443 ./data/hybrid_d18_ees.dat | cut -d, -f 4`

ntruees743ep1_bytes = 2044
ntruees743ep1_core_nv08_cost = `grep 743 ./data/core_nv08_ees.dat | cut -d, -f 4`
ntruees743ep1_hybrid_nv08_cost = `grep 743 ./data/hybrid_nv08_ees.dat | cut -d, -f 4`
ntruees743ep1_core_bdgl16_cost = `grep 743 ./data/core_bdgl16_ees.dat | cut -d, -f 4`
ntruees743ep1_hybrid_bdgl16_cost = `grep 743 ./data/hybrid_bdgl16_ees.dat | cut -d, -f 4`
ntruees743ep1_core_d18_cost = `grep 743 ./data/core_d18_ees.dat | cut -d, -f 4`
ntruees743ep1_hybrid_d18_cost  = `grep 743 ./data/hybrid_d18_ees.dat | cut -d, -f 4`


ax1 = -350
ax2 = -5
ay1 = +33
ay2 = +.5


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
pt_ees = 14
pt_ees_f = 15

lc_fill = "#ffffff"

lc_gray         = "#dddddd"
lc_gray2        = "#aaaaaa"
lc_black        = "#000000"
lc_arrow        = "#000000"
lc_hrss_prime   = "#009e73"
lc_hrss_pow2    = "#56b4e9"
lc_hrss_prime_u = "#9400d3"
lc_hrss_pow2_u  = "#e51e10"
lc_ntru_prime   = "#003366"
lc_ntru_pow2    = "#ff66cc"
lc_sntrup       = "#ff9f00"
lc_ees          = "#9f009f"

