// Intended filepath: grothendieck-literature-1402/paper07000/verify_response_constants.mjs
// Exact rational checks for the phase penalty and local-good-set measure.
const gcd = (a,b) => { while (b) [a,b]=[b,a%b]; return a<0n?-a:a; };
const f = (n,d=1n) => { const g=gcd(n,d); return [n/g,d/g]; };
const add = (a,b) => f(a[0]*b[1]+b[0]*a[1],a[1]*b[1]);
const sub = (a,b) => add(a,[-b[0],b[1]]);
const mul = (a,b) => f(a[0]*b[0],a[1]*b[1]);
const div = (a,b) => f(a[0]*b[1],a[1]*b[0]);
const sq = a => mul(a,a);
const lt = (a,b) => a[0]*b[1]<b[0]*a[1];
const e=f(1891n,2500n), beta=f(179n,1250n);
const tmax=f(863n,1000n), energymax=f(80051n,1000000n);
const coefficient=div(div(mul(f(2n),sq(beta)),sq(e)),add(sq(tmax),div(energymax,e)));
if (coefficient[0]!==256328000000n || coefficient[1]!==3041646418989n) throw new Error('Unexpected coefficient');
if (!lt(f(337n,4000n),coefficient)) throw new Error('Phase coefficient insufficient');
const penalty=mul(f(337n,4000n),sq(f(1n,25n)));
if (penalty[0]!==337n || penalty[1]!==2500000n) throw new Error('Explicit subregion penalty failed');
// pi<22/7 gives R^2<11/14; this is less than (336/379)^2.
if (!lt(f(11n,14n),sq(f(336n,379n)))) throw new Error('Radial measure comparison failed');
const good=add(div(mul(f(4n),f(21n,25n)),f(336n,379n)),f(-3n));
if (good[0]!==79n || good[1]!==100n) throw new Error('Good measure target failed');
console.log(JSON.stringify({
  status:'PROVED', arithmetic:'exact BigInt rational',
  phaseCoefficient:coefficient.map(String).join('/'),
  simplerPhaseCoefficient:'337/4000',
  penaltyForAbsImNuAtLeastOneOver25:penalty.map(String).join('/'),
  radialGoodMeasureLower:'79/100 (using pi<22/7)',
},null,2));

const ell=f(1057n,1250n), supper=f(1717441907077n,1250000000000n);
const target=f(500n,701n);

// This shell-free consumer uses the remote cap and shell-free odd theorem
// already supplied as proved in the research problem; no new all-sector premise.
const oddPrice=sub(div(f(1n),e),f(32n,25n));
const combinedPrice=add(oddPrice,f(337n,4000n));
if (combinedPrice[0]!==955347n || combinedPrice[1]!==7564000n) throw new Error('Combined shell-free price failed');
const shellFreeCap=t=>sub(add(add(sub(sq(t),mul(f(2n),mul(ell,t))),div(mul(f(2n),sq(beta)),e)),add(supper,f(36n,100000000n))),mul(combinedPrice,sq(f(37n,1000n))));
const shellLeft=shellFreeCap(f(4141n,5000n));
const shellRight=shellFreeCap(f(863n,1000n));
if (lt(shellLeft,shellRight)||lt(shellRight,shellLeft)) throw new Error('Shell-free endpoint symmetry failed');
const shellMargin=sub(target,shellRight);
if (shellMargin[0]!==5830268974361n || shellMargin[1]!==3313977500000000000n) throw new Error('Shell-free margin failed');
console.log(JSON.stringify({
  status:'PROVED DEDUCTION FROM SUPPLIED LEMMAS',
  premises:'Remote raw cap and shell-free odd theorem supplied as proved; phase-normalized actual response; A=B=0; u<=.0463; total energy<=.080051',
  globalTInterval:['4141/5000','863/1000'],
  absImNuMinimum:'37/1000',
  exactMarginBelow500Over701:shellMargin.map(String).join('/'),
},null,2));
