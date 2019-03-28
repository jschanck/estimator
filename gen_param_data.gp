read("params.gp")

default_config() = {
output_dir = "~/tmp/ntru_data/";

MODEL = "d18";
HYBRID_MODEL = SieveD18;
CORE_MODEL = SieveD18;

N_LOW = 443;
N_HIGH = 941;

ns_2ok = []; \\ n with Phi_n irreducible mod 2
forprime(n=N_LOW,N_HIGH,if(znorder(Mod(2,n)) == n-1, ns_2ok = concat(ns_2ok,n)));

ns_3ok = []; \\ ... mod 3
forprime(n=N_LOW,N_HIGH,if(znorder(Mod(3,n)) == n-1, ns_3ok = concat(ns_3ok,n)));

ns_5ok = []; \\ ... mod 5
forprime(n=N_LOW,N_HIGH,if(znorder(Mod(5,n)) == n-1, ns_5ok = concat(ns_5ok,n)));

ns_pow2q = setintersect(ns_2ok, ns_3ok); 
ns_primeq_p2 = ns_2ok;
ns_primeq_p3 = ns_3ok;
ns_primeq_p5 = ns_5ok;

\\ Weight parameters for fixed weight ntru
wts = [3/8,1/2,3/5,2/3];

\\ Values of q for fixed q ntru
qs = [1024,2048,4096,8192];

\\ All sntrup params, as in ntruprime paper
sntrup_params_all = [467, 3911, 122, 130, 5573; 479, 5689, 159, 132, 5976; 479, 6089, 159, 130, 6022; 491, 6287, 163, 135, 6196; 491, 8627, 163, 130, 6420; 491, 9277, 163, 129, 6472; 499, 8243, 166, 134, 4692; 499, 9029, 166, 132, 6558; 503, 2879, 89, 137, 5781; 503, 8663, 167, 134, 6580; 509, 10939, 169, 133, 6830; 509, 11087, 169, 133, 6840; 521, 15271, 173, 132, 7242; 521, 15359, 173, 132, 7246; 521, 16001, 173, 132, 7277; 523, 3331, 104, 147, 6121; 523, 7151, 174, 146, 6697; 523, 7159, 174, 146, 6698; 523, 11003, 174, 138, 7022; 523, 19853, 174, 129, 7467; 541, 2297, 71, 140, 6041; 541, 2437, 76, 150, 6087; 541, 17789, 180, 137, 7639; 557, 4759, 148, 164, 6805; 557, 9323, 185, 155, 7345; 557, 13339, 185, 148, 7633; 557, 13963, 185, 148, 7669; 557, 14827, 185, 147, 7718; 557, 18719, 185, 143, 7906; 563, 10627, 187, 155, 7531; 569, 1579, 49, 129, 6046; 569, 3929, 122, 166, 6794; 569, 11489, 189, 156, 7675; 569, 12781, 189, 154, 7763; 569, 16193, 189, 150, 7957; 571, 4201, 131, 168, 6873; 571, 7177, 190, 166, 7315; 577, 1861, 58, 141, 6268; 577, 19081, 192, 150, 8205; 587, 5233, 163, 176, 7252; 587, 8263, 195, 170, 7639; 593, 1381, 43, 131, 6186; 593, 14423, 197, 161, 8193; 593, 19697, 197, 156, 8460; 599, 7001, 199, 178, 7652; 599, 9551, 199, 171, 7920; 601, 17257, 200, 161, 8460; 601, 18701, 200, 159, 8529; 607, 6317, 197, 184, 7664; 607, 17747, 202, 163, 8568; 607, 18749, 202, 162, 8617; 613, 1459, 45, 137, 6444; 613, 3319, 103, 174, 7170; 613, 4363, 136, 183, 7412; 613, 9157, 204, 178, 8068; 613, 10529, 204, 175, 8191; 613, 11867, 204, 173, 8297; 613, 12109, 204, 173, 8315; 613, 13799, 204, 170, 8431; 613, 19469, 204, 164, 8735; 617, 1511, 47, 140, 6517; 617, 12829, 205, 173, 8421; 617, 16007, 205, 169, 8618; 617, 16073, 205, 169, 8621; 619, 2297, 71, 160, 6912; 619, 6907, 206, 187, 7895; 619, 9397, 206, 180, 8170; 619, 9679, 206, 180, 8196; 619, 12203, 206, 175, 8403; 619, 13933, 206, 172, 8522; 619, 14173, 206, 172, 8537; 631, 2081, 65, 158, 6956; 631, 2693, 84, 171, 7191; 631, 11287, 210, 182, 8495; 631, 16481, 210, 174, 8840; 641, 13691, 213, 182, 8808; 643, 6247, 195, 199, 8108; 643, 14737, 214, 181, 8904; 643, 15797, 214, 180, 8969; 643, 17189, 214, 178, 9047; 647, 3559, 111, 188, 7633; 647, 16573, 215, 180, 9069; 647, 16883, 215, 180, 9086; 647, 18461, 215, 178, 9170; 653, 2311, 72, 169, 7297; 653, 4621, 144, 199, 7950; 653, 8419, 217, 197, 8515; 653, 17477, 217, 182, 9203; 653, 17627, 217, 182, 9211; 653, 19163, 217, 180, 9290; 653, 19507, 217, 179, 9307; 659, 2137, 66, 166, 7290; 659, 6781, 211, 205, 8388; 659, 7481, 219, 203, 8481; 659, 19571, 219, 182, 9395; 661, 13327, 220, 191, 9058; 661, 15907, 220, 187, 9226; 673, 1493, 46, 149, 7097; 673, 9413, 224, 204, 8884; 673, 17123, 224, 190, 9465; 677, 3251, 101, 192, 7899; 683, 5623, 175, 214, 8509; 683, 13313, 227, 200, 9358; 691, 1499, 46, 147, 7290; 691, 5471, 170, 217, 8581; 691, 6449, 201, 219, 8745; 691, 12281, 230, 205, 9387; 701, 17921, 233, 201, 9905; 709, 10337, 236, 217, 9455; 709, 11923, 236, 214, 9601; 719, 2087, 65, 179, 7929; 719, 2351, 73, 185, 8053; 719, 5153, 161, 226, 8867; 719, 9133, 239, 225, 9460; 719, 10531, 239, 221, 9608; 719, 10739, 239, 221, 9628; 719, 14831, 239, 213, 9963; 719, 19079, 239, 208, 10224; 727, 5827, 182, 232, 9094; 727, 12241, 242, 221, 9873; 727, 17317, 242, 213, 10236; 739, 9829, 246, 232, 9802; 739, 10859, 246, 229, 9908; 739, 12713, 246, 225, 10076; 739, 17183, 246, 218, 10397; 739, 19429, 246, 216, 10528; 743, 7541, 235, 240, 9571; 743, 11251, 247, 231, 10000; 743, 16451, 247, 221, 10407; 743, 17959, 247, 219, 10501; 751, 3067, 95, 211, 8699; 751, 3823, 119, 223, 8938; 757, 1193, 37, 138, 7737; 757, 3727, 116, 224, 8981; 757, 6869, 214, 247, 9649; 757, 7879, 246, 246, 9799; 757, 10979, 252, 237, 10161; 757, 12973, 252, 233, 10344; 757, 13789, 252, 231, 10410; 757, 14737, 252, 230, 10483; 761, 1619, 50, 170, 8113; 761, 4091, 127, 229, 9131; 761, 4591, 143, 248, 9258; 761, 7883, 246, 248, 9851; 761, 13829, 253, 233, 10468; 761, 14107, 253, 232, 10490; 761, 19001, 253, 225, 10817; 769, 1433, 44, 162, 8063; 769, 6599, 206, 251, 9758; 769, 17729, 256, 231, 10854; 773, 877, 27, 131, 7558; 773, 2099, 65, 190, 8531; 773, 8317, 257, 252, 10066; 773, 9811, 257, 247, 10251; 773, 13757, 257, 239, 10628; 787, 4243, 132, 240, 9485; 797, 1259, 39, 158, 8208; 809, 1801, 56, 187, 8749; 809, 6113, 191, 265, 10176; 809, 14107, 269, 254, 11152; 811, 8543, 266, 269, 10593; 811, 10457, 270, 263, 10829; 811, 11831, 270, 260, 10974; 811, 14083, 270, 255, 11177; 823, 4513, 141, 255, 9992; 823, 8069, 252, 275, 10681; 823, 11197, 274, 267, 11070; 827, 7219, 225, 276, 10601; 827, 9767, 275, 273, 10961; 827, 13159, 275, 264, 11317; 827, 19081, 275, 254, 11760; 829, 1657, 51, 183, 8866; 829, 12227, 276, 267, 11256; 829, 13037, 276, 265, 11333; 829, 14107, 276, 263, 11427; 853, 9721, 284, 285, 11300; 853, 12377, 284, 278, 11597; 853, 15511, 284, 272, 11875; 857, 5167, 161, 274, 10572; 857, 13367, 285, 278, 11747; 857, 14797, 285, 275, 11872; 859, 12487, 286, 280, 11690; 859, 17203, 286, 272, 12087; 863, 1523, 47, 182, 9125; 863, 4111, 128, 263, 10361; 863, 8779, 274, 293, 11306; 881, 3217, 100, 248, 10265; 881, 7673, 239, 300, 11370; 881, 15733, 293, 284, 12283; 883, 8089, 252, 302, 11463; 883, 14639, 294, 287, 12219; 887, 13007, 295, 292, 12123; 907, 7727, 241, 311, 11715; 907, 8807, 275, 313, 11886; 907, 12109, 302, 304, 12303; 907, 15467, 302, 297, 12622; 907, 17389, 302, 293, 12776; 919, 11827, 306, 311, 12434; 919, 13933, 306, 306, 12652; 919, 14771, 306, 304, 12729; 929, 12953, 309, 313, 12692; 929, 14011, 309, 310, 12797; 929, 18229, 309, 302, 13149; 937, 1823, 56, 206, 10150; 937, 12401, 312, 318, 12742; 941, 2521, 78, 239, 10634; 941, 10781, 313, 324, 12606; 947, 3917, 122, 282, 11303; 953, 6343, 198, 322, 12038; 953, 8237, 257, 333, 12397; 953, 16693, 317, 316, 13367; 967, 8243, 257, 338, 12580];
\\ Parameters for pruning the sntrup parameters.
\\ Data will only be generated if LOW*n < q < HIGH*n.
SNTRUP_PRUNE_Q_LOW = 16/3;
SNTRUP_PRUNE_Q_HIGH = 18;

\\ NTRU EES parameters
ees_params = [443, 2048, 143; 743, 2048, 247];

VERSION = "20181204";
}

write_config() = {
  s = Strprintf("VERSION = %s\n", VERSION);
  s = concat(s, Strprintf("DEFAULT_CONFIG=0\n"));
  s = concat(s, Strprintf("output_dir = \"%s\"\n", output_dir));
  s = concat(s, Strprintf("USE_SIMULATOR = %s\n", USE_SIMULATOR));
  s = concat(s, Strprintf("IGNORE_TOURS = %s\n", IGNORE_TOURS));
  s = concat(s, Strprintf("TOUR_CAP = %s\n", TOUR_CAP));
  s = concat(s, Strprintf("MAXDEPTH = %s\n", MAXDEPTH));
  s = concat(s, Strprintf("N_LOW = %s\n", N_LOW));
  s = concat(s, Strprintf("N_HIGH = %s\n", N_HIGH));
  s = concat(s, Strprintf("SNTRUP_PRUNE_Q_LOW = %s\n", SNTRUP_PRUNE_Q_LOW));
  s = concat(s, Strprintf("SNTRUP_PRUNE_Q_HIGH = %s\n", SNTRUP_PRUNE_Q_HIGH));
  s = concat(s,Strprintf("HYBRID_MODEL = %s\n", HYBRID_MODEL));
  s = concat(s,Strprintf("CORE_MODEL = %s\n", CORE_MODEL));
  s = concat(s,Strprintf("wts = %s\n", wts));
  s = concat(s,Strprintf("ns_pow2q = %s\n", ns_pow2q));
  s = concat(s,Strprintf("ns_primeq_p2 = %s\n", ns_primeq_p2));
  s = concat(s,Strprintf("ns_primeq_p3 = %s\n", ns_primeq_p3));
  s = concat(s,Strprintf("ns_primeq_p5 = %s\n", ns_primeq_p5));
  s = concat(s,Strprintf("sntrup_params_all = %s\n", sntrup_params_all));
  write(concat([output_dir,"config"]), s);
}

if(DEFAULT_CONFIG, default_config());

write_config();

data_to_string(data) = {
  s = "";
  start = 1;
  while(start < matsize(data)[1] && data[start,1] == 0, start += 1);
  prevn = data[start,1];
  for(i=start, matsize(data)[1],
    if(data[i,1] != prevn, s = concat(s,"\n"));
    prevn = data[i,1];
    for(j=1,#data[i,]-1,s = concat([s, data[i,j], ", "]));
    s = concat([s, data[i,#data[i,]], "\n"]));
  s;
}

data_filter_wt(data, wt) = {
  data_out = [];
  for(i=1, matsize(data)[1],
    if(data[i,3] == wt, data_out = matconcat([data_out; data[i,]])));
  data_out;
}

data_filter_q(data, q) = {
  data_out = [];
  for(i=1, matsize(data)[1],
    if(data[i,2] == q, data_out = matconcat([data_out; data[i,]])));
  data_out;
}

xx_data_best(x) = { atan(x[4]/x[5]); };
data_filter_best(data) = {
  for(i=1, matsize(data)[1],
    if(data[i,3] == wt, data_out = matconcat([data_out; data[i,]])));
  data_out;

  start = 1;
  while(start < matsize(data)[1] && data[start,1] == 0, start += 1);
  data_out = [];
  best = data[start,];
  for(i=start, matsize(data)[1],
    if(xx_data_best(best) < xx_data_best(data[i,]), best = data[i,]));
  data_out = matconcat([data_out; best]);
}

write_data(fn, data) = {
  write(concat([output_dir,fn,".dat"]), data_to_string(data));
}

write_wt_filtered(fn, wts, data) = {
  for(j=1, #wts, wt=wts[j];
    datawt = data_filter_wt(data, wt);
    datawtbest = data_filter_best(datawt);
    fnwt = concat([fn, "_", numerator(wt), denominator(wt)]);
    write(concat([output_dir,fnwt,".dat"]), data_to_string(datawt));
    write(concat([output_dir,fnwt,"_best.dat"]), data_to_string(datawtbest)));
}

write_q_filtered(fn, qs, data) = {
  for(j=1, #qs, q=qs[j];
    dataq = data_filter_q(data, q);
    if(dataq != [],
    fnq = concat([fn, "_", q]);
    write(concat([output_dir,fnq,".dat"]), data_to_string(dataq))));
}


write_best(fn, data) = {
  write(concat([output_dir,fn,"_best.dat"]), data_to_string(data_filter_best(data)));
}

run() = {
  C1 = 1/7;
  C2 = 1;
  fn = "hrss_pow2q";
  hybrid_data = [];
  core_data = [];
  for(i=1, #ns_pow2q, n = ns_pow2q[i];
    hybrid_data  = matconcat([hybrid_data;  data_hrss_pow2q(n,HYBRID_MODEL,hybrid=1)]);
    core_data = matconcat([core_data; data_hrss_pow2q(n,CORE_MODEL,hybrid=0)]));
  write_data(Str("hybrid_",MODEL,"_",fn), hybrid_data);
  write_data(Str("core_",MODEL,"_",fn), core_data);
  \\ write_best(Str("hybrid_",MODEL,"_",fn), hybrid_data);
  \\ write_best(Str("core_",MODEL,"_",fn), core_data);

  fn = "hrss_primeq";
  hybrid_data = [];
  core_data = [];
  for(i=1, #ns_primeq_p3, n = ns_primeq_p3[i];
    hybrid_data  = matconcat([hybrid_data;  data_hrss_primeq(n,HYBRID_MODEL,hybrid=1)]);
    core_data = matconcat([core_data; data_hrss_primeq(n,CORE_MODEL,hybrid=0)]));
  write_data(Str("hybrid_",MODEL,"_",fn), hybrid_data);
  write_data(Str("core_",MODEL,"_",fn), core_data);
  \\ write_best(Str("hybrid_",MODEL,"_",fn), hybrid_data);
  \\ write_best(Str("core_",MODEL,"_",fn), core_data);

  \\ fn = "hrss_pow2q_fw";
  \\ hybrid_data = [];
  \\ core_data = [];
  \\ for(i=1, #ns_pow2q, n = ns_pow2q[i];
  \\   for(j=1, #wts, wt = wts[j];
  \\     hybrid_data  = matconcat([hybrid_data;  data_hrss_pow2q_fixedwt(n,wt,HYBRID_MODEL,hybrid=1)]);
  \\     core_data = matconcat([core_data; data_hrss_pow2q_fixedwt(n,wt,CORE_MODEL,hybrid=0)])));
  \\ write_data(Str("hybrid_",MODEL,"_",fn), hybrid_data);
  \\ write_data(Str("core_",MODEL,"_",fn), core_data);
  \\ write_wt_filtered(Str("hybrid_",MODEL,"_",fn), wts, hybrid_data);
  \\ write_wt_filtered(Str("core_",MODEL,"_",fn), wts, core_data);

  \\ fn = "hrss_primeq_fw";
  \\ hybrid_data = [];
  \\ core_data = [];
  \\ for(i=1, #ns_primeq_p3, n = ns_primeq_p3[i];
  \\   for(j=1, #wts, wt = wts[j];
  \\     hybrid_data  = matconcat([hybrid_data;  data_hrss_primeq_fixedwt(n,wt,HYBRID_MODEL,hybrid=1)]);
  \\     core_data = matconcat([core_data; data_hrss_primeq_fixedwt(n,wt,CORE_MODEL,hybrid=0)])));
  \\ write_data(Str("hybrid_",MODEL,"_",fn), hybrid_data);
  \\ write_data(Str("core_",MODEL,"_",fn), core_data);
  \\ write_wt_filtered(Str("hybrid_",MODEL,"_",fn), wts, hybrid_data);
  \\ write_wt_filtered(Str("core_",MODEL,"_",fn), wts, core_data);

  \\ fn = "hrss_primeq_p2";
  \\ hybrid_data = [];
  \\ core_data = [];
  \\ for(i=1, #ns_primeq_p2, n = ns_primeq_p2[i];
  \\   hybrid_data  = matconcat([hybrid_data;  data_hrss_primeq_unifp(n,2,HYBRID_MODEL,hybrid=1)]);
  \\   core_data = matconcat([core_data; data_hrss_primeq_unifp(n,2,CORE_MODEL,hybrid=0)]));
  \\ write_data(Str("hybrid_",MODEL,"_",fn), hybrid_data);
  \\ write_data(Str("core_",MODEL,"_",fn), core_data);

  \\ fn = "hrss_primeq_p3";
  \\ hybrid_data = [];
  \\ core_data = [];
  \\ for(i=1, #ns_primeq_p3, n = ns_primeq_p3[i];
  \\   hybrid_data  = matconcat([hybrid_data;  data_hrss_primeq_unifp(n,3,HYBRID_MODEL,hybrid=1)]);
  \\   core_data = matconcat([core_data; data_hrss_primeq_unifp(n,3,CORE_MODEL,hybrid=0)]));
  \\ write_data(Str("hybrid_",MODEL,"_",fn), hybrid_data);
  \\ write_data(Str("core_",MODEL,"_",fn), core_data);

  \\ fn = "hrss_primeq_p5";
  \\ hybrid_data = [];
  \\ core_data = [];
  \\ for(i=1, #ns_primeq_p5, n = ns_primeq_p5[i];
  \\   hybrid_data  = matconcat([hybrid_data;  data_hrss_primeq_unifp(n,5,HYBRID_MODEL,hybrid=1)]);
  \\   core_data = matconcat([core_data; data_hrss_primeq_unifp(n,5,CORE_MODEL,hybrid=0)]));
  \\ write_data(Str("hybrid_",MODEL,"_",fn), hybrid_data);
  \\ write_data(Str("core_",MODEL,"_",fn), core_data);

  \\ fn = "ntru_pow2q_ft";
  \\ hybrid_data = [];
  \\ core_data = [];
  \\ for(i=1, #ns_pow2q, n = ns_pow2q[i];
  \\   for(j=1, #wts, wt = wts[j];
  \\     hybrid_data  = matconcat([hybrid_data;  data_ntru_pow2q(n,wt,HYBRID_MODEL,hybrid=1)]);
  \\     core_data = matconcat([core_data; data_ntru_pow2q(n,wt,CORE_MODEL,hybrid=0)])));
  \\ write_data(Str("hybrid_",MODEL,"_",fn), hybrid_data);
  \\ write_data(Str("core_",MODEL,"_",fn), core_data);
  \\ write_wt_filtered(Str("hybrid_",MODEL,"_",fn), wts, hybrid_data);
  \\ write_wt_filtered(Str("core_",MODEL,"_",fn), wts, core_data);

  \\ fn = "ntru_primeq_ft";
  \\ hybrid_data = [];
  \\ core_data = [];
  \\ for(i=1, #ns_primeq_p3, n = ns_primeq_p3[i];
  \\   for(j=1, #wts, wt = wts[j];
  \\     hybrid_data  = matconcat([hybrid_data;  data_ntru_primeq(n,wt,HYBRID_MODEL,hybrid=1)]);
  \\     core_data = matconcat([core_data; data_ntru_primeq(n,wt,CORE_MODEL,hybrid=0)])));
  \\ write_data(Str("hybrid_",MODEL,"_",fn), hybrid_data);
  \\ write_data(Str("core_",MODEL,"_",fn), core_data);
  \\ write_wt_filtered(Str("hybrid_",MODEL,"_",fn), wts, hybrid_data);
  \\ write_wt_filtered(Str("core_",MODEL,"_",fn), wts, core_data);

  fn = "hps_pow2q";
  hybrid_data = [];
  core_data = [];
  for(i=1, #ns_pow2q, n = ns_pow2q[i];
    for(j=1, #qs, q = qs[j];
      if((C1*n < (q/8 - 2)) && ((q/8-2) < C2*n),
      hybrid_data  = matconcat([hybrid_data;  data_hps_fixedq(n,q,HYBRID_MODEL,hybrid=1)]);
      core_data = matconcat([core_data; data_hps_fixedq(n,q,CORE_MODEL,hybrid=0)]))));
  write_data(Str("hybrid_",MODEL,"_",fn), hybrid_data);
  write_data(Str("core_",MODEL,"_",fn), core_data);
  write_q_filtered(Str("hybrid_",MODEL,"_",fn), qs, hybrid_data);
  write_q_filtered(Str("core_",MODEL,"_",fn), qs, core_data);

  fn = "hps_primeq";
  hybrid_data = [];
  core_data = [];
  for(i=1, #ns_3ok, n = ns_3ok[i];
    forprime(q=8*C1*n + 16, 8*C2*n + 16,
      if(znorder(Mod(q,n)) == n-1,
      hybrid_data  = matconcat([hybrid_data;  data_hps_fixedq(n,q,HYBRID_MODEL,hybrid=1)]);
      core_data = matconcat([core_data; data_hps_fixedq(n,q,CORE_MODEL,hybrid=0)]))));
  write_data(Str("hybrid_",MODEL,"_",fn), hybrid_data);
  write_data(Str("core_",MODEL,"_",fn), core_data);

  fn = "hps_pow2q_fatf";
  hybrid_data = [];
  core_data = [];
  for(i=1, #ns_pow2q, n = ns_pow2q[i];
    for(j=1, #qs, q = qs[j];
      if((C1*n < (q/12 - 2)) && ((q/12-2) < C2*n),
      hybrid_data  = matconcat([hybrid_data;  data_hps_fixedq_fatf(n,q,HYBRID_MODEL,hybrid=1)]);
      core_data = matconcat([core_data; data_hps_fixedq_fatf(n,q,CORE_MODEL,hybrid=0)]))));
  write_data(Str("hybrid_",MODEL,"_",fn), hybrid_data);
  write_data(Str("core_",MODEL,"_",fn), core_data);
  write_q_filtered(Str("hybrid_",MODEL,"_",fn), qs, hybrid_data);
  write_q_filtered(Str("core_",MODEL,"_",fn), qs, core_data);

  fn = "hps_primeq_fatf";
  hybrid_data = [];
  core_data = [];
  for(i=1, #ns_pow2q, n = ns_pow2q[i];
    \\ d = q/12 - 2; consider n/3 < d < 2n
    forprime(q=12*C1*n + 24, 12*C2*n + 24,
      if(znorder(Mod(q,n)) == n-1,
      hybrid_data  = matconcat([hybrid_data;  data_hps_fixedq_fatf(n,q,HYBRID_MODEL,hybrid=1)]);
      core_data = matconcat([core_data; data_hps_fixedq_fatf(n,q,CORE_MODEL,hybrid=0)]))));
  write_data(Str("hybrid_",MODEL,"_",fn), hybrid_data);
  write_data(Str("core_",MODEL,"_",fn), core_data);
  write_q_filtered(Str("hybrid_",MODEL,"_",fn), qs, hybrid_data);
  write_q_filtered(Str("core_",MODEL,"_",fn), qs, core_data);

  \\ fn = "sntrup";
  \\ hybrid_data = [];
  \\ core_data = [];
  \\ for(i=1, matsize(sntrup_params_all)[1],
  \\   [n,q,t] = sntrup_params_all[i,];
  \\   if(q > SNTRUP_PRUNE_Q_LOW*n && q < SNTRUP_PRUNE_Q_HIGH*n,
  \\   hybrid_data  = matconcat([hybrid_data;  data_sntrup(n,q,t,HYBRID_MODEL,hybrid=1)]);
  \\   core_data = matconcat([core_data; data_sntrup(n,q,t,CORE_MODEL,hybrid=0)])));
  \\ write_data(concat(["hybrid_",fn,"_pruned"]), hybrid_data);
  \\ write_data(concat(["core_",fn,"_pruned"]), core_data);

  \\ fn = "sntrup";
  \\ hybrid_data = [];
  \\ core_data = [];
  \\ for(i=1, matsize(sntrup_params_all)[1],
  \\   [n,q,t] = sntrup_params_all[i,];
  \\   hybrid_data  = matconcat([hybrid_data;  data_sntrup(n,q,t,HYBRID_MODEL,hybrid=1)]);
  \\   core_data = matconcat([core_data; data_sntrup(n,q,t,CORE_MODEL,hybrid=0)]));
  \\ write_data(Str("hybrid_",MODEL,"_",fn), hybrid_data);
  \\ write_data(Str("core_",MODEL,"_",fn), core_data);

  fn = "ees";
  hybrid_data = [];
  core_data = [];
  for(i=1, matsize(ees_params)[1],
    [n,q,d] = ees_params[i,];
    hybrid_data  = matconcat([hybrid_data;  data_ees(n,q,d,HYBRID_MODEL,hybrid=1)]);
    core_data = matconcat([core_data; data_ees(n,q,d,CORE_MODEL,hybrid=0)]));
  write_data(Str("hybrid_",MODEL,"_",fn), hybrid_data);
  write_data(Str("core_",MODEL,"_",fn), core_data);
}

run();
quit();
