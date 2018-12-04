read("estimate.gp")

min_q_hrss(n,p,wtf,wtg,wtr) = {
  \\ Min q for NTRU-HRSS. Weight parameters wtf,wtg, wtf set
  \\ percentage of non-zero coefficients in f, g, and r.
  \\ All coefficients are assumed to be of worst-case magnitude, floor(p/2).
  ngr = floor(p/2)^2 * (n-1) * sqrt(wtg*wtr);
  nfm = floor(p/2)^2 * (n-1) * sqrt(wtf*1);
  q = ceil(2*sqrt(2)*(p*ngr + nfm));
};

min_q_ntru(n,p,wtf,wtg,wtr,wtm) = {
  \\ Min q for NTRU with g(0) = 0 and m(0) = 0.
  \\ Each of f,g,r,m assumed to be of degree at most n-2.
  \\ f has 2-norm sqrt(wtf*(n-1)), etc.
  \\ NOTE: May be able to do better using l_1*l_inf bound
  \\ when p > 3 and good l_1 bound is known.
  ngr = floor(p/2)^2 * (n-1) * sqrt(wtg*wtr);
  nfm = floor(p/2)^2 * (n-1) * sqrt(wtf*wtm);
  q = ceil(2*(p*ngr + nfm));
};

data_hrss_pow2q(n,costfn,hybrid=0) = {
  \\ NOTE: Assumes trinary distribution [5/16,6/16,5/16]
  my(q,coeffDist,cost,size);
  q = 2^ceil(log2(min_q_hrss(n,3,1,1,1)));
  size = 2*ceil((n-1)*log2(q)/8);
  coeffDist = cbdMod3(2);
  if(hybrid,
    cost = floor(RunHybrid(n-1, n-1, q, coeffDist, costfn)),
    cost = floor(RunPrimal(n-1, n-1, q, coeffDist, costfn, 1)));
  [n,q,1,cost,size];
};

data_hrss_primeq(n,costfn,hybrid=0) = {
  \\ NOTE: Assumes trinary distribution [5/16,6/16,5/16]
  my(q,coeffDist,cost,size);
  q = nextprime(min_q_hrss(n,3,1,1,1));
  while(!polisirreducible(Mod(polcyclo(n),q)), q = nextprime(q+1));
  coeffDist = cbdMod3(2);
  size = 2*ceil((n-1)*log2(q)/8);
  if(hybrid,
    cost = floor(RunHybrid(n-1, n-1, q, coeffDist, costfn)),
    cost = floor(RunPrimal(n-1, n-1, q, coeffDist, costfn, 1)));
  [n,q,1,cost,size];
};

data_hrss_pow2q_fixedwt(n,wt,costfn,hybrid=0) = {
  my(q,coeffDist,cost,size);
  q = 2^ceil(log2(min_q_hrss(n,3,wt,wt,wt)));
  coeffDist = fixedWtTri(n, floor(wt*n/2));
  size = 2*ceil((n-1)*log2(q)/8);
  if(hybrid,
    cost = floor(RunHybrid(n-1, n-1, q, coeffDist, costfn)),
    cost = floor(RunPrimal(n-1, n-1, q, coeffDist, costfn, 1)));
  [n,q,wt,cost,size];
};

data_hrss_primeq_fixedwt(n,wt,costfn,hybrid=0) = {
  my(q,coeffDist,cost,size);
  q = nextprime(min_q_hrss(n,3,wt,wt,wt));
  while(!polisirreducible(Mod(polcyclo(n),q)), q = nextprime(q+1));
  size = 2*ceil((n-1)*log2(q)/8);
  coeffDist = fixedWtTri(n, floor(wt*n/2));
  if(hybrid,
    cost = floor(RunHybrid(n-1, n-1, q, coeffDist, costfn)),
    cost = floor(RunPrimal(n-1, n-1, q, coeffDist, costfn, 1)));
  [n,q,wt,cost,size];
};

data_hrss_primeq_unifp(n,p,costfn,hybrid=0) = {
  \\ NOTE: assumes uniform mod p
  my(q,coeffDist,cost,size);
  q = nextprime(min_q_hrss(n,p,1,1,1));
  while(!polisirreducible(Mod(polcyclo(n),q)), q = nextprime(q+1));
  coeffDist = cUnif(p);
  size = 2*ceil((n-1)*log2(q)/8);
  if(hybrid,
    cost = floor(RunHybrid(n-1, n-1, q, coeffDist, costfn)),
    cost = floor(RunPrimal(n-1, n-1, q, coeffDist, costfn, 1)));
  [n,q,1,cost,size];
};

data_ntru_pow2q(n,wt,costfn,hybrid=0) = {
  my(q,coeffDist,cost,size);
  q = 2^ceil(log2(min_q_ntru(n,3,wt,wt,wt,wt)));
  coeffDist = fixedWtTri(n, floor(wt*n/2));
  size = 2*ceil((n-1)*log2(q)/8);
  if(hybrid,
    cost = floor(RunHybrid(n-1, n-1, q, coeffDist, costfn)),
    cost = floor(RunPrimal(n-1, n-1, q, coeffDist, costfn, 1)));
  [n,q,wt,cost,size];
};

data_ntru_primeq(n,wt,costfn,hybrid=0) = {
  my(q,coeffDist,cost,size);
  q = nextprime(min_q_ntru(n,3,wt,wt,wt,wt));
  while(!polisirreducible(Mod(polcyclo(n),q)), q = nextprime(q+1));
  size = 2*ceil((n-1)*log2(q)/8);
  coeffDist = fixedWtTri(n, floor(wt*n/2));
  if(hybrid,
    cost = floor(RunHybrid(n-1, n-1, q, coeffDist, costfn)),
    cost = floor(RunPrimal(n-1, n-1, q, coeffDist, costfn, 1)));
  [n,q,wt,cost,size];
};

data_sntrup(n,q,t,costfn,hybrid=0) = {
  my(coeffDist,cost,size);
  coeffDist=fixedWtTri(n,t);
  size = ceil(n*log2(q)/8)+ceil(n*log2(q/3)/8);
  if(hybrid,
    cost = floor(RunHybrid(n, n, q, coeffDist, costfn)),
    cost = floor(RunPrimal(n, n, q, coeffDist, costfn, 1)));
  [n,q,2*t,cost,size];
};

data_ees(n,q,d,costfn,hybrid=0) = {
  my(coeffDist,cost,size);
  size = 2*ceil(n*log2(q)/8);
  coeffDist = fixedWtTri(n, d);
  if(hybrid,
    cost = floor(RunHybrid(n, n, q, coeffDist, costfn)),
    cost = floor(RunPrimal(n, n, q, coeffDist, costfn, 1)));
  [n,q,d,cost,size];
};
