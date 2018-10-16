read("estimate.gp")

output_dir = "~/tmp/data/"

PRIMAL = 0;
HYBRID = 1;


\\ n with Phi_n irreducible mod 2
ns_ntru_2ok = [];
forprime(n=500,1024,if(znorder(Mod(2,n)) == n-1, ns_ntru_2ok = concat(ns_ntru_2ok,n)))

\\ n with Phi_n irreducible mod 3
ns_ntru_3ok = [];
forprime(n=500,1024,if(znorder(Mod(3,n)) == n-1, ns_ntru_3ok = concat(ns_ntru_3ok,n)))

\\ n with Phi_n irreducible mod 2 and 3
ns_ntru_pow2q = setintersect(ns_ntru_2ok, ns_ntru_3ok); 
ns_ntru_primeq_p2 = ns_ntru_2ok;
ns_ntru_primeq_p3 = ns_ntru_3ok;

\\ Weight parameters for fixed weight ntru
wts = [3/8,1/2,3/5,2/3]

\\ All sntrup params, as in ntruprime paper
sntrup_params_all = [467, 3911, 122, 130, 5573; 479, 5689, 159, 132, 5976; 479, 6089, 159, 130, 6022; 491, 6287, 163, 135, 6196; 491, 8627, 163, 130, 6420; 491, 9277, 163, 129, 6472; 499, 8243, 166, 134, 4692; 499, 9029, 166, 132, 6558; 503, 2879, 89, 137, 5781; 503, 8663, 167, 134, 6580; 509, 10939, 169, 133, 6830; 509, 11087, 169, 133, 6840; 521, 15271, 173, 132, 7242; 521, 15359, 173, 132, 7246; 521, 16001, 173, 132, 7277; 523, 3331, 104, 147, 6121; 523, 7151, 174, 146, 6697; 523, 7159, 174, 146, 6698; 523, 11003, 174, 138, 7022; 523, 19853, 174, 129, 7467; 541, 2297, 71, 140, 6041; 541, 2437, 76, 150, 6087; 541, 17789, 180, 137, 7639; 557, 4759, 148, 164, 6805; 557, 9323, 185, 155, 7345; 557, 13339, 185, 148, 7633; 557, 13963, 185, 148, 7669; 557, 14827, 185, 147, 7718; 557, 18719, 185, 143, 7906; 563, 10627, 187, 155, 7531; 569, 1579, 49, 129, 6046; 569, 3929, 122, 166, 6794; 569, 11489, 189, 156, 7675; 569, 12781, 189, 154, 7763; 569, 16193, 189, 150, 7957; 571, 4201, 131, 168, 6873; 571, 7177, 190, 166, 7315; 577, 1861, 58, 141, 6268; 577, 19081, 192, 150, 8205; 587, 5233, 163, 176, 7252; 587, 8263, 195, 170, 7639; 593, 1381, 43, 131, 6186; 593, 14423, 197, 161, 8193; 593, 19697, 197, 156, 8460; 599, 7001, 199, 178, 7652; 599, 9551, 199, 171, 7920; 601, 17257, 200, 161, 8460; 601, 18701, 200, 159, 8529; 607, 6317, 197, 184, 7664; 607, 17747, 202, 163, 8568; 607, 18749, 202, 162, 8617; 613, 1459, 45, 137, 6444; 613, 3319, 103, 174, 7170; 613, 4363, 136, 183, 7412; 613, 9157, 204, 178, 8068; 613, 10529, 204, 175, 8191; 613, 11867, 204, 173, 8297; 613, 12109, 204, 173, 8315; 613, 13799, 204, 170, 8431; 613, 19469, 204, 164, 8735; 617, 1511, 47, 140, 6517; 617, 12829, 205, 173, 8421; 617, 16007, 205, 169, 8618; 617, 16073, 205, 169, 8621; 619, 2297, 71, 160, 6912; 619, 6907, 206, 187, 7895; 619, 9397, 206, 180, 8170; 619, 9679, 206, 180, 8196; 619, 12203, 206, 175, 8403; 619, 13933, 206, 172, 8522; 619, 14173, 206, 172, 8537; 631, 2081, 65, 158, 6956; 631, 2693, 84, 171, 7191; 631, 11287, 210, 182, 8495; 631, 16481, 210, 174, 8840; 641, 13691, 213, 182, 8808; 643, 6247, 195, 199, 8108; 643, 14737, 214, 181, 8904; 643, 15797, 214, 180, 8969; 643, 17189, 214, 178, 9047; 647, 3559, 111, 188, 7633; 647, 16573, 215, 180, 9069; 647, 16883, 215, 180, 9086; 647, 18461, 215, 178, 9170; 653, 2311, 72, 169, 7297; 653, 4621, 144, 199, 7950; 653, 8419, 217, 197, 8515; 653, 17477, 217, 182, 9203; 653, 17627, 217, 182, 9211; 653, 19163, 217, 180, 9290; 653, 19507, 217, 179, 9307; 659, 2137, 66, 166, 7290; 659, 6781, 211, 205, 8388; 659, 7481, 219, 203, 8481; 659, 19571, 219, 182, 9395; 661, 13327, 220, 191, 9058; 661, 15907, 220, 187, 9226; 673, 1493, 46, 149, 7097; 673, 9413, 224, 204, 8884; 673, 17123, 224, 190, 9465; 677, 3251, 101, 192, 7899; 683, 5623, 175, 214, 8509; 683, 13313, 227, 200, 9358; 691, 1499, 46, 147, 7290; 691, 5471, 170, 217, 8581; 691, 6449, 201, 219, 8745; 691, 12281, 230, 205, 9387; 701, 17921, 233, 201, 9905; 709, 10337, 236, 217, 9455; 709, 11923, 236, 214, 9601; 719, 2087, 65, 179, 7929; 719, 2351, 73, 185, 8053; 719, 5153, 161, 226, 8867; 719, 9133, 239, 225, 9460; 719, 10531, 239, 221, 9608; 719, 10739, 239, 221, 9628; 719, 14831, 239, 213, 9963; 719, 19079, 239, 208, 10224; 727, 5827, 182, 232, 9094; 727, 12241, 242, 221, 9873; 727, 17317, 242, 213, 10236; 739, 9829, 246, 232, 9802; 739, 10859, 246, 229, 9908; 739, 12713, 246, 225, 10076; 739, 17183, 246, 218, 10397; 739, 19429, 246, 216, 10528; 743, 7541, 235, 240, 9571; 743, 11251, 247, 231, 10000; 743, 16451, 247, 221, 10407; 743, 17959, 247, 219, 10501; 751, 3067, 95, 211, 8699; 751, 3823, 119, 223, 8938; 757, 1193, 37, 138, 7737; 757, 3727, 116, 224, 8981; 757, 6869, 214, 247, 9649; 757, 7879, 246, 246, 9799; 757, 10979, 252, 237, 10161; 757, 12973, 252, 233, 10344; 757, 13789, 252, 231, 10410; 757, 14737, 252, 230, 10483; 761, 1619, 50, 170, 8113; 761, 4091, 127, 229, 9131; 761, 4591, 143, 248, 9258; 761, 7883, 246, 248, 9851; 761, 13829, 253, 233, 10468; 761, 14107, 253, 232, 10490; 761, 19001, 253, 225, 10817; 769, 1433, 44, 162, 8063; 769, 6599, 206, 251, 9758; 769, 17729, 256, 231, 10854; 773, 877, 27, 131, 7558; 773, 2099, 65, 190, 8531; 773, 8317, 257, 252, 10066; 773, 9811, 257, 247, 10251; 773, 13757, 257, 239, 10628; 787, 4243, 132, 240, 9485; 797, 1259, 39, 158, 8208; 809, 1801, 56, 187, 8749; 809, 6113, 191, 265, 10176; 809, 14107, 269, 254, 11152; 811, 8543, 266, 269, 10593; 811, 10457, 270, 263, 10829; 811, 11831, 270, 260, 10974; 811, 14083, 270, 255, 11177; 823, 4513, 141, 255, 9992; 823, 8069, 252, 275, 10681; 823, 11197, 274, 267, 11070; 827, 7219, 225, 276, 10601; 827, 9767, 275, 273, 10961; 827, 13159, 275, 264, 11317; 827, 19081, 275, 254, 11760; 829, 1657, 51, 183, 8866; 829, 12227, 276, 267, 11256; 829, 13037, 276, 265, 11333; 829, 14107, 276, 263, 11427; 853, 9721, 284, 285, 11300; 853, 12377, 284, 278, 11597; 853, 15511, 284, 272, 11875; 857, 5167, 161, 274, 10572; 857, 13367, 285, 278, 11747; 857, 14797, 285, 275, 11872; 859, 12487, 286, 280, 11690; 859, 17203, 286, 272, 12087; 863, 1523, 47, 182, 9125; 863, 4111, 128, 263, 10361; 863, 8779, 274, 293, 11306; 881, 3217, 100, 248, 10265; 881, 7673, 239, 300, 11370; 881, 15733, 293, 284, 12283; 883, 8089, 252, 302, 11463; 883, 14639, 294, 287, 12219; 887, 13007, 295, 292, 12123; 907, 7727, 241, 311, 11715; 907, 8807, 275, 313, 11886; 907, 12109, 302, 304, 12303; 907, 15467, 302, 297, 12622; 907, 17389, 302, 293, 12776; 919, 11827, 306, 311, 12434; 919, 13933, 306, 306, 12652; 919, 14771, 306, 304, 12729; 929, 12953, 309, 313, 12692; 929, 14011, 309, 310, 12797; 929, 18229, 309, 302, 13149; 937, 1823, 56, 206, 10150; 937, 12401, 312, 318, 12742; 941, 2521, 78, 239, 10634; 941, 10781, 313, 324, 12606; 947, 3917, 122, 282, 11303; 953, 6343, 198, 322, 12038; 953, 8237, 257, 333, 12397; 953, 16693, 317, 316, 13367; 967, 8243, 257, 338, 12580]

\\ Pruned set of sntrup params with q in [3n, 18n]
sntrup_params_pruned = [467, 3911, 122; 479, 5689, 159; 479, 6089, 159; 491, 6287, 163; 491, 8627, 163; 499, 8243, 166; 503, 2879, 89; 503, 8663, 167; 523, 3331, 104; 523, 7151, 174; 523, 7159, 174; 541, 2297, 71; 541, 2437, 76; 557, 4759, 148; 557, 9323, 185; 569, 3929, 122; 571, 4201, 131; 571, 7177, 190; 577, 1861, 58; 587, 5233, 163; 587, 8263, 195; 599, 7001, 199; 599, 9551, 199; 607, 6317, 197; 613, 3319, 103; 613, 4363, 136; 613, 9157, 204; 613, 10529, 204; 619, 2297, 71; 619, 6907, 206; 619, 9397, 206; 619, 9679, 206; 631, 2081, 65; 631, 2693, 84; 631, 11287, 210; 643, 6247, 195; 647, 3559, 111; 653, 2311, 72; 653, 4621, 144; 653, 8419, 217; 659, 2137, 66; 659, 6781, 211; 659, 7481, 219; 673, 9413, 224; 677, 3251, 101; 683, 5623, 175; 691, 5471, 170; 691, 6449, 201; 691, 12281, 230; 709, 10337, 236; 709, 11923, 236; 719, 2351, 73; 719, 5153, 161; 719, 9133, 239; 719, 10531, 239; 719, 10739, 239; 727, 5827, 182; 727, 12241, 242; 739, 9829, 246; 739, 10859, 246; 739, 12713, 246; 743, 7541, 235; 743, 11251, 247; 751, 3067, 95; 751, 3823, 119; 757, 3727, 116; 757, 6869, 214; 757, 7879, 246; 757, 10979, 252; 757, 12973, 252; 761, 4091, 127; 761, 4591, 143; 761, 7883, 246; 769, 6599, 206; 773, 8317, 257; 773, 9811, 257; 773, 13757, 257; 787, 4243, 132; 809, 6113, 191; 809, 14107, 269; 811, 8543, 266; 811, 10457, 270; 811, 11831, 270; 811, 14083, 270; 823, 4513, 141; 823, 8069, 252; 823, 11197, 274; 827, 7219, 225; 827, 9767, 275; 827, 13159, 275; 829, 12227, 276; 829, 13037, 276; 829, 14107, 276; 853, 9721, 284; 853, 12377, 284; 857, 5167, 161; 857, 13367, 285; 857, 14797, 285; 859, 12487, 286; 863, 4111, 128; 863, 8779, 274; 881, 3217, 100; 881, 7673, 239; 881, 15733, 293; 883, 8089, 252; 883, 14639, 294; 887, 13007, 295; 907, 7727, 241; 907, 8807, 275; 907, 12109, 302; 907, 15467, 302; 919, 11827, 306; 919, 13933, 306; 919, 14771, 306; 929, 12953, 309; 929, 14011, 309; 937, 12401, 312; 941, 10781, 313; 947, 3917, 122; 953, 6343, 198; 953, 8237, 257; 953, 16693, 317; 967, 8243, 257]

\\ NTRU EES parameters
ees_params = [443, 2048, 143; 743, 2048, 247]

min_q(n,p,wtf,wtg,wtr) = {
  \\ weight parameters wtf,wtg, wtf set percentage of non-zero
  \\ coefficients in f, g, and r. Coefficients are at most
  \\ floor(p/2) in magnitude.
  ngr = floor(p/2)^2 * sqrt(wtg*(n-1)) * sqrt(wtr*(n-1));
  nfm = floor(p/2)^2 * sqrt(wtf*(n-1)) * sqrt(n-1);
  q = ceil(2*sqrt(2)*(p*ngr + nfm));
}

data_ntru_hrss(n,costfn,hybrid=0) = {
  my(q,coeffDist,cost,size);
  q = 2^ceil(log2(min_q(n,3,1,1,1)));
  size = ceil((n-1)*log2(q)/8);
  coeffDist = cbdMod3(2);
  if(hybrid,
    cost = floor(RunHybrid(n-1, n-1, q, coeffDist, costfn)),
    cost = floor(RunPrimal(n-1, n-1, q, coeffDist, costfn, 1)));
  [n,q,cost,size];
}

data_ntru_primeq_fixedwt(n,wt,costfn,hybrid=0) = {
  my(q,coeffDist,cost,size);
  q = nextprime(min_q(n,3,wt,wt,wt));
  while(!polisirreducible(Mod(polcyclo(n),q)), q = nextprime(q+1));
  size = ceil((n-1)*log2(q)/8);
  coeffDist = fixedWtTri(n, floor(wt*n/2));
  if(hybrid,
    cost = floor(RunHybrid(n-1, n-1, q, coeffDist, costfn)),
    cost = floor(RunPrimal(n-1, n-1, q, coeffDist, costfn, 1)));
  [n,q,wt,cost,size];
}

data_ntru_pow2q_fixedwt(n,wt,costfn,hybrid=0) = {
  my(q,coeffDist,cost,size);
  q = 2^ceil(log2(min_q(n,3,wt,wt,wt)));
  coeffDist = fixedWtTri(n, floor(wt*n/2));
  size = ceil((n-1)*log2(q)/8);
  if(hybrid,
    cost = floor(RunHybrid(n-1, n-1, q, coeffDist, costfn)),
    cost = floor(RunPrimal(n-1, n-1, q, coeffDist, costfn, 1)));
  [n,q,wt,cost,size];
}

data_ntru_primeq_uniform(n,p,costfn,hybrid=0) = {
  my(q,coeffDist,cost,size);
  q = nextprime(min_q(n,p,1,1,1));
  while(!polisirreducible(Mod(polcyclo(n),q)), q = nextprime(q+1));
  coeffDist = cUnif(p);
  size = ceil((n-1)*log2(q)/8);
  if(hybrid,
    cost = floor(RunHybrid(n-1, n-1, q, coeffDist, costfn)),
    cost = floor(RunPrimal(n-1, n-1, q, coeffDist, costfn, 1)));
  [n,q,cost,size];
}

data_sntrup(n,q,t,costfn,hybrid=0) = {
  my(coeffDist,cost,size);
  coeffDist=fixedWtTri(n,t);
  size = ceil(n*log2(q)/8)+ceil(n*log2(q/3)/8);
  if(hybrid,
    cost = floor(RunHybrid(n, n, q, coeffDist, costfn)),
    cost = floor(RunPrimal(n, n, q, coeffDist, costfn, 1)));
  [n,q,2*t,cost,size];
}

data_ntru_ees(n,q,d,costfn,hybrid=0) = {
  my(coeffDist,cost,size);
  size = ceil(n*log2(q)/8);
  coeffDist = fixedWtTri(n, d);
  if(hybrid,
    cost = floor(RunHybrid(n, n, q, coeffDist, costfn)),
    cost = floor(RunPrimal(n, n, q, coeffDist, costfn, 1)));
  [n,q,d,cost,size];
}

\\ enum_hrss.dat
data = [];
for(i=1, #ns_ntru_pow2q, n = ns_ntru_pow2q[i]; \
  data = matconcat([data; data_ntru_hrss(n,EnumCN11Simple,HYBRID)]));
write(concat(output_dir,"enum_hrss.dat"), data)

\\ sieve_hrss.dat
data = [];
for(i=1, #ns_ntru_pow2q, n = ns_ntru_pow2q[i]; \
  data = matconcat([data; data_ntru_hrss(n,SieveBDGL16,PRIMAL)]));
write(concat(output_dir,"sieve_hrss.dat"), data)

\\ enum_pow2.dat
data = [];
for(i=1, #ns_ntru_pow2q, n = ns_ntru_pow2q[i]; \
  for(j=1, #wts, wt = wts[j]; \
    data = matconcat([data; data_ntru_pow2q_fixedwt(n,wt,EnumCN11Simple,HYBRID)])));
write(concat(output_dir,"enum_pow2.dat"), data)

\\ sieve_pow2.dat
data = [];
for(i=1, #ns_ntru_pow2q, n = ns_ntru_pow2q[i]; \
  for(j=1, #wts, wt = wts[j]; \
    data = matconcat([data; data_ntru_pow2q_fixedwt(n,wt,SieveBDGL16,PRIMAL)])));
write(concat(output_dir,"sieve_pow2.dat"), data)

\\ enum_prime.dat
data = [];
for(i=1, #ns_ntru_primeq_p3, n = ns_ntru_primeq_p3[i]; \
  for(j=1, #wts, wt = wts[j]; \
    data = matconcat([data; data_ntru_primeq_fixedwt(n,wt,EnumCN11Simple,HYBRID)])));
write(concat(output_dir,"enum_prime.dat"), data)

\\ sieve_prime.dat
data = [];
for(i=1, #ns_ntru_primeq_p3, n = ns_ntru_primeq_p3[i]; \
  for(j=1, #wts, wt = wts[j]; \
    data = matconcat([data; data_ntru_primeq_fixedwt(n,wt,SieveBDGL16,PRIMAL)])));
write(concat(output_dir,"sieve_prime.dat"), data)

\\ enum_hrss_prq.dat
data = [];
for(i=1, #ns_ntru_primeq_p3, n = ns_ntru_primeq_p3[i]; \
  data = matconcat([data; data_ntru_primeq_uniform(n,3,EnumCN11Simple,HYBRID)]));
write(concat(output_dir,"enum_hrss_prq.dat"), data)

\\ sieve_hrss_prq.dat
data = [];
for(i=1, #ns_ntru_primeq_p3, n = ns_ntru_primeq_p3[i]; \
  data = matconcat([data; data_ntru_primeq_uniform(n,3,SieveBDGL16,PRIMAL)]));
write(concat(output_dir,"sieve_hrss_prq.dat"), data)

\\ enum_sntrup.dat
data = [];
for(i=1, matsize(sntrup_params_pruned)[1], \
  [n,q,t] = sntrup_params_pruned[i,]; \
  data = matconcat([data; data_sntrup(n,q,t,EnumCN11Simple,HYBRID)]));
write(concat(output_dir,"enum_sntrup.dat"), data)

\\ sieve_sntrup.dat
data = [];
for(i=1, matsize(sntrup_params_pruned)[1], \
  [n,q,t] = sntrup_params_pruned[i,]; \
  data = matconcat([data; data_sntrup(n,q,t,SieveBDGL16,PRIMAL)]));
write(concat(output_dir,"sieve_sntrup.dat"), data)

\\ enum_ees.dat
data = [];
for(i=1, matsize(ees_params)[1], \
  [n,q,d] = ees_params[i,]; \
  data = matconcat([data; data_ntru_ees(n,q,d,EnumCN11Simple,HYBRID)]));
write(concat(output_dir,"enum_ees.dat"), data)

\\ sieve_ees.dat
data = [];
for(i=1, matsize(ees_params)[1], \
  [n,q,d] = ees_params[i,]; \
  data = matconcat([data; data_ntru_ees(n,q,d,SieveBDGL16,PRIMAL)]));
write(concat(output_dir,"sieve_ees.dat"), data)


quit();
