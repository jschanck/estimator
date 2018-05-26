read("bkzsim.gp");
read("search.gp");
log2(x) = {if(x == 0, 0, log(x)/log(2))};

/* Parameters */
USE_SIMULATOR = 0;
IGNORE_TOURS = 1;
TOUR_CAP = 5;
OPTIMIZE_M = 1;
USVP = 1; /* TODO: Make this an argument to RUN
             Controls whether we use d=n+m (USVP, NTRU key)
                                  or d=n+m+1 (BDD, LWE, NTRU msg) */
MAXDEPTH = -1; /* Infinite */

UseSimulator(b) = {
  global(USE_SIMULATOR);
  USE_SIMULATOR = b;
}

IgnoreTours(b) = {
  global(IGNORE_TOURS);
  IGNORE_TOURS = b;
}

TourCap(count) = {
  global(TOUR_CAP);
  TOUR_CAP = count;
}

MaxDepth(depth) = {
  global(TOUR_CAP);
  MAXDEPTH = depth;
}


/* Wrappers around CN11 simulator */
CN11SimHermite(d, b) = {
  /* Simulate BKZ-b in dimension d and return resulting root hermite factor */
  simulate(d,b,0,TOUR_CAP)[2];
}

CN11SimIter(d, b, h) = {
  /* Simulate BKZ-b in dimension d and return number of tours required to
   * reach root hermite factor h */
  if(IGNORE_TOURS,
    0,
    if(!USE_SIMULATOR,
      1,
      simulate(d, b, h, TOUR_CAP)[3]));
}


/* Cost Functions */
QuadEnumCN11(b) = { 0.000784314*b^2 + 0.366078*b - 6.125; }
EnumCN11(b) = { 0.270189*log(2)*b*log2(b) - 1.0192*b + 16.10; }
EnumCN11Simple(b) = { b*log2(b)/(2*exp(1)) - b + 16; }
QEnumCN11(b) = {
  my(C);
  C = 1/2 * EnumCN11(b);
  if(MAXDEPTH < 0 || C < MAXDEPTH,
    return(C),
    return(MAXDEPTH + 2*(C-MAXDEPTH)));
}

SieveBDGL16(b) = { b*log2(sqrt(3/2)); }
QSieveLaa15(b) = { b*log2(sqrt(13/9)); }

SieveSpace(b) = { b*log2(sqrt(4/3)); }

/* Table indicating which cost functions will be used */
COSTFNS =                                  /* enabled? */
[["Quad Enum [CN11]",         QuadEnumCN11,     0],\
 ["Enum [CN11]",                  EnumCN11,     0],\
 ["Enum [CN11]",            EnumCN11Simple,     1],\
 ["Quantum CN11Enum",             QEnumCN11,    0],\
 ["LSF Sieve",                    SieveBDGL16,  1],\
 ["Quantum LSF Sieve",            QSieveLaa15,  1],\
 ["Sieve vectors",                SieveSpace,   0]];

ExpectedCoeffSize(coeffDist) = {
  my(len, low);
  \\ standard deviation of coeffDist (assumes coeffDist is mean centered)
  len = length(coeffDist);
  low = -floor(len/2);
  sqrt(coeffDist * vector(len, i, (low + i - 1)^2)~);
}

MaxCoeffSize(coeffDist) = {
  len = length(coeffDist);
  low = -floor(len/2);
  vecmax(vector(#coeffDist, i, if(coeffDist[i] != 0, abs(low + i - 1), 0)));
}

/* MITM / Quantum Search cost */

MITM(coeffDist, k) = {
  my(h,C);
  \\ Assume we can MITM (or quantum search) k coeffs using
  \\ 2^{.5 * entropy(coeffDist)} queries
  plogp = coeffDist * vector(#coeffDist, i, log2(coeffDist[i]))~;
  C = floor(0.5 * k * (-plogp));
  if(MAXDEPTH < 0 || C < MAXDEPTH,
    return([C,0]),
    return([MAXDEPTH, 2*(C-MAXDEPTH)]));
};

/* Lattice Reduction */

GSAHermite(b,useStirling=1) = {
  \\ Root hermite factor achieved by BKZ-b under
  \\ Geometric Series Assumption
  if(useStirling,
    ((Pi*b)^(1/b) * b / (2*Pi*exp(1)))^(1/(2*b-2)),
    exp((1/(b*(b-1)) * lngamma(b/2 + 1) - log(Pi)/(2*b-2))));
};

GSAHeight(d, m, q, h, i) = {
  \\ q^(m/d) * h^(d - 2*i - 1);
  q^(m/d) * h^(d - 2*d*(i-1)/(d-1))
}

GSAEnsureHeight(d,m,q,height,index) = {
  my(h,g);

  \\ Find the largest root Hermite factor for which
  \\ the "index"-th gram schmidt norm would be greater
  \\ than "height"

  g = 10e6;
  h = MaxLT((x)->(-GSAHeight(d, m, q, x/g, index)), -height, g, 2*g);
  1.0*h/g;
}


/* Hybrid Attack
 *  d: dimension
 *  q: modulus
 *  m: log base q of lattice volume
 *  coeffDist: coefficient distribution of target vector */

HybridHermite(d,m,q,coeffDist) = {
  my(minGS, ld);

  \\ Set the hermite requirement so that the last
  \\ gram schmidt vector (in the reduced block) has length
  \\ greater than twice the max coefficient size.

  minGS = 2 * MaxCoeffSize(coeffDist);
  ld = ((m/d)*log2(q) - log2(minGS))/d;
  2^ld
};

HybridBlocksize(d, delta) = {
  my(bs, iter, low, high);

  /* Do a quick search to narrow range for simulator, if we're using it */
  bs = MaxLT((x)->(-GSAHermite(x)), -delta, 2, d);
  if(USE_SIMULATOR,
    low = max(0, bs - 15);
    high = min(d, bs + 15);
    bs = MaxLT((x)->(-CN11SimHermite(d, x)), -delta, low, high));
  bs + 1;
}

HybridCostEstimate(CostFn,n,maxm,q,coeffDist,k,summarize=0) = {
  my(s,m,d,h,bs,iter,cost,costMITM);
  s = ExpectedCoeffSize(coeffDist);
  m = MaxLT((x)->(/* max-max (m, h). m s.t. b*_1 < q; h s.t. b*_{m+(n-k)} > s */
        GSAHeight(x+(n-k), x, q, HybridHermite(x+(n-k), x, q, coeffDist), 1)),
        q, 2, maxm);

  d = m+(n-k);
  h = HybridHermite(d, m, q, coeffDist);
  bs = HybridBlocksize(d, h);

  iter = CN11SimIter(d,bs,h);
  cost = CostFn(bs) + log2(d*iter);

  costMITM = MITM(coeffDist, k);

  if(summarize,
    printf("\tn=%d, m=%d, d=%d, k=%d\n", n, m, d, k);
    SummarizeBKZ(CostFn, d, m, q, s, h, bs, iter);
    printf("\tCost of MITM-%-4d\t%s\n", k, costMITM));

  cost;
}

HybridTradeoff(CostFn,n,maxm,q,coeffDist) = {
  MaxLT((k)->(vecsum(MITM(coeffDist,k)) - HybridCostEstimate(CostFn,n,maxm,q,coeffDist,k)), 0, 0, n);
}


/* Primal attack */

PrimalBlocksize(n,m,q,s) = {
  my(d,bs);
  if(USVP, d=n+m, d=n+m+1);
  bs = MaxLT(/* max blocksize with b*_{d-bs} < s*sqrt{bs} */
         (x)->(GSAHeight(d, m, q, GSAHermite(x), d-x)/sqrt(x)), s, 2, d);
  if(USE_SIMULATOR, /* Same search using simulator */
    low = max(0, bs - 15);
    high = min(d, bs + 15);
    bs = MaxLT((x)->(GSAHeight(d, m, q, CN11SimHermite(d,x), d-x)/sqrt(x)), s, low, high));
  bs + 1; /* Increment bs by 1 to tip height @ d-bs _above_ s*sqrt{bs} */
}


OptimalDim(n,q,h) = { floor(sqrt(n*log(q)/log(h))); }

PrimalCostEstimate(CostFn,n,m,q,coeffDist,summarize=0) = {
  my(s,bs,d,h,iter,cost);
  s = ExpectedCoeffSize(coeffDist);

  \\ Search for b such that s*sqrt(b) < GSAHermite(b)^(2b - d - 1) Vol(L) 
  bs = PrimalBlocksize(n,m,q,s);
  if(OPTIMIZE_M, /* Try to decrease number of samples */
    /* TODO: be smarter here */
    m = -n-1 + OptimalDim(n,q,GSAHermite(bs));
    bs = PrimalBlocksize(n,m,q,s);
    m = -n-1 + OptimalDim(n,q,GSAHermite(bs));
    bs = PrimalBlocksize(n,m,q,s));

  if(USVP, d=n+m, d=n+m+1);
  h = GSAEnsureHeight(d, m, q, s*sqrt(bs), d-bs);

  iter = CN11SimIter(d,bs,h);
  cost = CostFn(bs) + log2(d*iter);

  if(summarize,
    printf("\tn=%d, m=%d, d=%d\n", n, m, n+m+1, h);
    SummarizeBKZ(CostFn, d, m, q, s, h, bs, iter));

  cost;
}

SummarizeBKZ(CostFn, d, m, q, s, h, bs, iter) = {
  my(cost);
  cost = CostFn(bs);
  if(USE_SIMULATOR,
    printf("\tSimulator suggests %d tours, BKZ-%d → %.5f.\n", iter, bs, h),
  /* else */
    printf("\tGSA suggests BKZ-%d → %.5f\n", bs, h));
  /* endif */
  printf("\tFirst block\t\t%8.2f ... %5.2f\n", GSAHeight(d, m, q, h, 1), GSAHeight(d, m, q, h, bs));
  printf("\tLast block\t\t%8.2f ... %5.2f\n", GSAHeight(d, m, q, h, d-bs), GSAHeight(d, m, q, h, d));
  printf("\tProj. last block\t%8.2f ... %5.2f\n", sqrt(bs)*s, s);
  printf("\tCost of SVP-%-5d\t%8d\n", bs, cost);
  if(!IGNORE_TOURS,
    printf("\t... with %d tour(s)\t%8d\n", iter, cost+log2(d*iter)));
}


/* Main */
Run(n, maxm, q, coeffDist, verbose=0) = {
  my(costFn, k);

  if(verbose,
  printf("Cost functions:\n");
  j=0;
  for(i=1, #COSTFNS, if(COSTFNS[i][3], j+=1;
    printf("\t%d) %s : %s\n", j, COSTFNS[i][1], COSTFNS[i][2])));

  if(USE_SIMULATOR,
  printf("\n- Using BKZ Simulator. "),
  printf("\n- Using Gaussian Heuristic and Geometric Series Assumption. "));
  printf("(USE_SIMULATOR = %d)\n", USE_SIMULATOR);

  if(IGNORE_TOURS,
  printf("- Ignoring tour cost. Assuming a single SVP call will suffice. "),
  printf("- Including tour cost. Max of %d tour(s). ", TOUR_CAP));
  printf("(IGNORE_TOURS = %d)\n\n", IGNORE_TOURS)); 

  for(i=1, #COSTFNS, if(COSTFNS[i][3],
    costFn = COSTFNS[i][2];
    printf("\n----------------%s-------------------\n", COSTFNS[i][1]);
    printf("\nPrimal");
    PrimalCostEstimate(costFn,n,maxm,q,coeffDist,summarize=1);

    printf("\nHybrid", COSTFNS[i][1]);
    k = HybridTradeoff(costFn,n,maxm,q,coeffDist);
    HybridCostEstimate(costFn,n,maxm,q,coeffDist,k,summarize=1)
));
}

RunPrimal(n,maxm,q,coeffDist,costFn) = {
  PrimalCostEstimate(costFn,n,maxm,q,coeffDist,summarize=0)
}

RunHybrid(n,maxm,q,coeffDist,costFn) = {
  k = HybridTradeoff(costFn,n,maxm,q,coeffDist);
  HybridCostEstimate(costFn,n,maxm,q,coeffDist,k,summarize=0)
}


/* Distributions */

cbdMod3(k) = {
  my(p);
  p = floor(2^(2*k)/3);
  [p, p+1, p]/2^(2*k);
};

cbd(k) = { vector(2*k+1, i, binomial(2*k, i-1))/2^(2*k) };

cUnif(k) = { vector(k, i, 1/k) };

fixedWtTri(n,d) = { [d/n, 1-2*d/n, d/n]; }

tailcutDG(t, s) = {
  my(v);
  v = vector(2*t+1, i, j = (t-i+1); exp(-j^2/(2*s^2)));
  v /= vecsum(v);
}

fixedWtDG(n,t,s) = {
  my(v);
  v = tailcutDG(t,s);
  v = round(n*v);
  v[t+1] += n - vecsum(v); /* add zeros */
  v /= n;
}

/* NTRU-like */

NTRUKEM(n=701) = {
  my(q,coeffDist);
  q = 2^ceil(3.5 + log2(n));
  coeffDist = cbdMod3(2);
  Run(n-1, n-1, q, coeffDist);
}

NTRUEES(n,q,t) = { Run(n, n, q, fixedWtTri(n,t)); }
NTRUEES443EP1() = { NTRUEES(443, 2048, 148) };
NTRUEES509EP1() = { NTRUEES(509, 2048, 170) };
NTRUEES587EP1() = { NTRUEES(587, 2048, 196) };
NTRUEES743EP1() = { NTRUEES(743, 2048, 247) };

NTRUPrime(n,q,t) = { Run(n, n, q, fixedWtTri(n,t)); }
StreamlinedNTRUPrime739() = { NTRUPrime(739, 9829, 204); }
StreamlinedNTRUPrime761() = { NTRUPrime(761, 4591, 143); }

/* New Hope */
ADPS16(n,q,k) = { Run(n, 2*n, q, cbd(k)); }
JarJar()  = { ADPS16( 512, 12289, 24) }
NewHope() = { ADPS16(1024, 12289, 16) }

/* Kyber */
Kyber(n,d,q,ks) = {
  coeffDist = cbd(ks);
  Run(n*d, n*d, q, coeffDist);
}

Kyber512() = { Kyber(256, 2, 7681, 5) };
Kyber768() = { Kyber(256, 3, 7681, 4) };
Kyber1024() = { Kyber(256, 4, 7681, 3) };


printf("UseSimulator(%d); IgnoreTours(%d); TourCap(%d); MaxDepth(%d)\n", USE_SIMULATOR, IGNORE_TOURS, TOUR_CAP, MAXDEPTH);
