sieve_ylabel = 'Core-SVP cost, 0.292b metric, log scale'
enum_ylabel = 'Hybrid cost, (b/2e)log2(b) - b + 16 metric, log scale'
#enum_ylabel = 'Hybrid cost, 0.000784314*b^2 + 0.366078*b - 6.125 metric, log scale'

# Mouse-over text
Params(a,b) = sprintf("n=%d, q=%d", column(a), column(b))
Params2(a,b,c) = sprintf("n=%d, q=%d, d=%s", column(a), column(b), stringcolumn(c))
Params3(a,b,c) = sprintf("n=%d, q=%d, w=%.2fn", column(a), column(b), column(c)/column(a))

# Constants for arrows
ntruhrss701_bytes = 2276          # 2 * ceil(700*log(2,8192)/8)
ntruhrss701_sievecost = 136
ntruhrss701_enumcost  = 207
#ntruhrss701_enumcost  = 210

ntruhps2048509_bytes = 1398
ntruhps2048509_sievecost = 106
ntruhps2048509_enumcost = 150
#ntruhps2048509_enumcost = 152

ntruhps2048677_bytes = 1860
ntruhps2048677_sievecost = 144
ntruhps2048677_enumcost = 210
#ntruhps2048677_enumcost = 212

ntruhps4096701_bytes = 2100
ntruhps4096701_sievecost = 149
ntruhps4096701_enumcost = 226
#ntruhps4096701_enumcost = 229

ntruhps4096821_bytes = 2460
ntruhps4096821_sievecost = 178
ntruhps4096821_enumcost = 280
#ntruhps4096821_enumcost = 287

sntrup11923709_bytes = 2261
sntrup11923709_sievecost = 133
sntrup11923709_enumcost  = 202
#sntrup11923709_enumcost  = 206

sntrup12241727_bytes = 2325
sntrup12241727_sievecost = 136
sntrup12241727_enumcost  = 210
#sntrup12241727_enumcost  = 213

sntrup7541743_bytes = 2247
sntrup7541743_sievecost = 147
sntrup7541743_enumcost  = 228
#sntrup7541743_enumcost  = 232

sntrup4591761_bytes = 2165
sntrup4591761_sievecost = 151
sntrup4591761_enumcost  = 225
#sntrup4591761_enumcost  = 229

#sntrup877773_bytes = 1737
#sntrup877773_sievecost = 147
#sntrup877773_enumcost  = 116

sntrup5167857_bytes = 2474
sntrup5167857_sievecost = 172
sntrup5167857_enumcost  = 262
#sntrup5167857_enumcost  = 267

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
lc_arrow        = "#000000"
lc_hrss_prime   = "#009e73"
lc_hrss_pow2    = "#56b4e9"
lc_hrss_prime_u = "#9400d3"
lc_hrss_pow2_u  = "#e51e10"
lc_ntru_prime   = "#003366"
lc_ntru_pow2    = "#ff66cc"
lc_sntrup       = "#ff9f00"
lc_ees          = "#ff0000"

