// output/r789/verify_shared.mjs
// Node.js 20+. Exact enclosures for the two content inequalities and the A cost.
import assert from "node:assert/strict";

const U = 1n << 56n;
const min = (a,b) => a<b?a:b;
const max = (a,b) => a>b?a:b;
const abs = x => x<0n?-x:x;
const floor = (n,d) => n<0n ? -((-n+d-1n)/d) : n/d;
const ceil = (n,d) => -floor(-n,d);
const mulLo = (x,y) => floor(x*y,U);
const mulHi = (x,y) => ceil(x*y,U);
const ratLo = (n,d) => floor(BigInt(n)*U,BigInt(d));
const ratHi = (n,d) => ceil(BigInt(n)*U,BigInt(d));
function sqrtFloor(n) {
  let r=BigInt(Math.floor(Math.sqrt(Number(n))));
  while (r*r>n) r--;
  while ((r+1n)**2n<=n) r++;
  return r;
}
function sqrtCeil(n) {
  const r=sqrtFloor(n);
  return r*r===n ? r : r+1n;
}

// exp(-x) for 0 <= x <= 25. Scale by 64, use alternating Taylor bounds,
// then square six times. Inputs and outputs have denominator U.
function expMinus(x) {
  let tLo=U,tHi=U,sLo=U,sHi=U,lo=0n;
  for (let k=1n;k<=14n;k++) {
    tLo=floor(tLo*x,64n*U*k);
    tHi=ceil(tHi*x,64n*U*k);
    if (k%2n) {sLo-=tHi;sHi-=tLo;} else {sLo+=tLo;sHi+=tHi;}
    if (k===13n) lo=sLo;
  }
  let hi=sHi;
  assert(lo>0n);
  for (let j=0;j<6;j++) {lo=mulLo(lo,lo);hi=mulHi(hi,hi);}
  return [lo,hi];
}

// Logarithmic grid with base 1025/1024. Index guesses are corrected using
// rigorous bounds on the powers. Floating point only supplies initial guesses.
const LIMIT=30000, logBase=Math.log1p(1/1024);
const powerLo=Array(2*LIMIT+1),powerHi=Array(2*LIMIT+1);
powerLo[LIMIT]=powerHi[LIMIT]=U;
for (let i=1;i<=LIMIT;i++) {
  powerLo[LIMIT+i]=floor(1025n*powerLo[LIMIT+i-1],1024n);
  powerHi[LIMIT+i]=ceil(1025n*powerHi[LIMIT+i-1],1024n);
  powerLo[LIMIT-i]=floor(1024n*powerLo[LIMIT-i+1],1025n);
  powerHi[LIMIT-i]=ceil(1024n*powerHi[LIMIT-i+1],1025n);
}
function gridIndex(x,upper) {
  assert(x>0n);
  let j=Math.round(Math.log(Number(x)/Number(U))/logBase);
  assert(j>-LIMIT+2 && j<LIMIT-2);
  if (upper) {
    while (powerLo[LIMIT+j]<x) j++;
    while (powerLo[LIMIT+j-1]>=x) j--;
  } else {
    while (powerHi[LIMIT+j]>x) j--;
    while (powerHi[LIMIT+j+1]<=x) j++;
  }
  return j;
}

// Histograms on integer log indices. Positive polynomial convolutions are
// performed by packing coefficients into 128-bit digits. The bound on carries
// is checked before each product. This is ordinary exact integer multiplication.
const poly=(start,values)=>({start,values});
const last=p=>p.start+p.values.length-1;
const reverse=p=>poly(-last(p),[...p.values].reverse());
const packCache=new WeakMap();
function pack(p) {
  if (!packCache.has(p)) {
    const hex=[...p.values].reverse().map(v=>v.toString(16).padStart(32,"0")).join("");
    packCache.set(p,BigInt("0x"+hex));
  }
  return packCache.get(p);
}
function conv(a,b,upper,from=a.start+b.start,to=last(a)+last(b)) {
  const sum=v=>v.reduce((x,y)=>x+y,0n), top=v=>v.reduce(max,0n);
  assert(min(sum(a.values)*top(b.values),sum(b.values)*top(a.values)) < (1n<<128n));
  const hex=(pack(a)*pack(b)).toString(16),out=[];
  for (let j=from;j<=to;j++) {
    const end=hex.length-32*(j-a.start-b.start);
    let v=0n;
    if (end>0 && end<=hex.length) v=BigInt("0x"+hex.slice(Math.max(0,end-32),end));
    out.push(upper?ceil(v,U):floor(v,U));
  }
  return poly(from,out);
}
function histogram() {return new Map();}
function place(map,index,mass) {
  if (mass>0n) map.set(index,(map.get(index)||0n)+mass);
}
function arrayOf(map) {
  const keys=[...map.keys()],l=Math.min(...keys),r=Math.max(...keys);
  assert(Number.isFinite(l));
  return poly(l,Array.from({length:r-l+1},(_,i)=>map.get(l+i)||0n));
}

// The two kernels are j(s)=(E|1+sW_0|-1)/s and h(s)=d E|1+sW_0|/ds,
// where W_0 is uniform on the unit circle. They both increase from 0 to 1.
// Positive series A,C,D and their known sums at 1 enclose the omitted tails.
const terms=64;
const al=[0n,U/4n],ah=[0n,U/4n];
for (let k=1;k<terms;k++) {
  const n=BigInt(2*k-1)**2n,d=BigInt(2*k+2)**2n;
  al.push(floor(al[k]*n,d));ah.push(ceil(ah[k]*n,d));
}
const coefs=[1,2,3].map((which)=>{
  const factor=k=>BigInt(which===1?1:which===2?2*k:2*k-1);
  const low=al.map((v,k)=>v*factor(k)),high=ah.map((v,k)=>v*factor(k));
  const cap=[0n,ratHi(273240,1000000),ratHi(636620,1000000),ratHi(363381,1000000)][which];
  return {low,high,tail:cap-low.reduce((a,b)=>a+b,0n)};
});
function makeKernels() {
  const tables=Array.from({length:4},()=>Array(2*LIMIT+1));
  for (let i=0;i<=LIMIT;i++) {
    const zL=powerLo[LIMIT-i],zH=powerHi[LIMIT-i];
    const xL=mulLo(zL,zL),xH=mulHi(zH,zH);
    const ranges=coefs.map(({low,high,tail})=>{
      let L=0n,H=tail;
      for (let k=terms;k>=1;k--) {L=low[k]+mulLo(xL,L); H=high[k]+mulHi(xH,H);}
      return [L,H];
    });
    const [A,C,D]=ranges;
    const set=(idx,j0,j1,h0,h1)=>{
      tables[0][idx]=max(0n,j0);tables[1][idx]=min(U,j1);
      tables[2][idx]=max(0n,h0);tables[3][idx]=min(U,h1);
    };
    set(LIMIT-i,mulLo(zL,A[0]),mulHi(zH,A[1]),mulLo(zL,C[0]),mulHi(zH,C[1]));
    set(LIMIT+i,U-zH+mulLo(xL,A[0]),U-zL+mulHi(xH,A[1]),
        U-mulHi(xH,D[1]),U-mulLo(xL,D[0]));
  }
  return tables.map(a=>poly(-LIMIT,a));
}
const kernels=makeKernels();

const steps=1024n;
const cells=[];
let eLeft=[U,U];
for (let i=0n;i<5n*steps;i++) {
  const l=i*U/steps,r=(i+1n)*U/steps,l2=l*l/U,r2=r*r/U;
  const eRight=expMinus(r2);
  const mass=[max(0n,eLeft[0]-eRight[1]),eLeft[1]-eRight[0]];
  const below=l2<U;
  const left=[mulLo(l2,eLeft[0]),mulHi(l2,eLeft[1])];
  const right=[mulLo(r2,eRight[0]),mulHi(r2,eRight[1])];
  const signed=below?[max(0n,right[0]-left[1]),right[1]-left[0]]:
                     [max(0n,left[0]-right[1]),left[1]-right[0]];
  cells.push({l,r,l2,r2,mass,signed,below});
  eLeft=eRight;
}
const sqrt2lo=sqrtFloor(2n*U*U),sqrt2hi=sqrtCeil(2n*U*U);
function makeRemote(hi) {
  const xMap=histogram(),first=Array.from({length:3},histogram),second=Array.from({length:3},histogram);
  const put=(map,z,mass)=>{
    if (z>0n && mass>0n) place(map,gridIndex(z,!!hi),mass);
  };
  const mult=hi?mulHi:mulLo;
  for (const {l,r,l2,r2,mass} of cells) {
    const x=hi?r:l;
    put(xMap,x,mult(x,mass[hi]));
    for (const [n,group] of [[2n,first],[1n,second]]) {
      const v=l2-n*U,w=r2-n*U;
      const b=hi?max(abs(v),abs(w)):v<=0n&&w>=0n?0n:min(abs(v),abs(w));
      const z=n===1n?b:hi?ceil(x*b,sqrt2lo):floor(x*b,sqrt2hi);
      put(group[0],z,mult(z,mass[hi]));
      const weight=n===1n?mass[hi]:mult(x,mass[hi]);
      if (hi ? w>0n : v>=0n) put(group[1],z,weight);
      if (hi ? v<0n : w<=0n) put(group[2],z,weight);
    }
  }
  const x=arrayOf(xMap);
  return [[x],first.map(arrayOf),second.map(m=>conv(x,arrayOf(m),hi))];
}
const lowN=-2600, highN=-1250, gaussianHigh=-950;
const innerL=-8500,innerH=10000;
function makeInner(hi) {
  return makeRemote(hi).map(group=>group.map((m,i)=>{
    const kernel=kernels[(i===0?0:2)+hi];
    assert(innerL+m.start>=kernel.start && innerH+last(m)<=last(kernel));
    return conv(reverse(m),kernel,hi,innerL,innerH);
  }));
}
const inner=[makeInner(0),makeInner(1)];
function visible(p0,p1,hi) {
  const maps=Array.from({length:3},histogram);
  for (const {l,r,l2,r2,mass,signed,below} of cells) {
    // For upper integral bounds put the radius at the lower endpoint.
    const x=hi?l:r, t=hi?l2:r2;
    if (x===0n) continue; // budgeted as missing mass
    const A=p0*(t-2n*U),B=p1*(t-2n*U);
    const f=U+(hi?floor(min(A,B),U):ceil(max(A,B),U));
    const rad=hi?mulLo(x,f):mulHi(x,f);
    const j=gridIndex(rad,!hi);
    place(maps[0],j,mass[hi]);
    place(maps[below?2:1],j,signed[hi]);
  }
  return maps.map(arrayOf);
}
function valuesAt(hi,p0,p1) {
  const vis=visible(p0,p1,hi);
  return inner[hi].map(group=>{
    const out=[];
    for (let i=0;i<group.length;i++) {
      if ((group.length===1 && hi) || (group.length>1 && i===0 && !hi)) continue;
      for (const v of i===0?[vis[0]]:[vis[1],vis[2]]) {
        assert(lowN+hi-last(v)>=innerL && highN+hi-v.start<=innerH);
        out.push(conv(group[i],v,hi,lowN+hi,(group.length===1?gaussianHigh:highN)+hi).values);
      }
    }
    return out;
  });
}
const missing=ceil(U,100000n);
const lowMatch=-2560,highMatch=-1280;
const firstP=ratLo(2,15),lastP=ratHi(4,19);
const shells=404; // radius 404/2048 > sqrt(.0223)/.76 and < .198
const shellR=Array.from({length:shells+1},(_,j)=>BigInt(j)*U/2048n);
// The coefficient estimate .940--1.045 is proved for rho <= .197. Use
// an exact endpoint at .197 in the last bin.
shellR[shells]=ratHi(197,1000);
assert(76n**2n*197n**2n*10000n>223n*100n**2n*1000n**2n);
const matchIndices=Array.from({length:highMatch-lowMatch+1},(_,i)=>{
  const nu=powerLo[LIMIT+lowMatch+i];
  return Int16Array.from(shellR,h=>gridIndex(sqrtFloor(nu*nu+h*h),false));
});
let best=null,bestMatched=null,passes=0;
function checkProfile(p0,p1) {
  const L=valuesAt(0,p0,p1),H=valuesAt(1,p0,p1);
  const K=ratHi(940,1000)+ceil(ratHi(105,1000)*(p1-firstP+1n),lastP-firstP-2n);
  const benchmark=L[0][0].map((x,i)=>mulLo(2n*powerLo[LIMIT+lowN+i],x));
  let margin=null,matched=null;
  for (let i=1;i<=2;i++) {
    const [positiveA,negativeA,negativeB,positiveB]=L[i];
    const [gain,upperA,upperNegA,upperNegB,upperB]=H[i];
    for (let n=lowN;n<=highN;n++) {
      const j=n-lowN;
      const cLo=positiveA[j]+positiveB[j]-upperNegA[j]-upperNegB[j]-missing;
      const cHi=upperA[j]+upperB[j]-negativeA[j]-negativeB[j]+missing;
      const c=max(abs(cLo),abs(cHi));
      const difference=L[0][0][j]-gain[j]-missing;
      if (difference<=0n) return false;
      // The remote same-variance deficit is at least 2 ell nu * difference.
      const rhs=floor(2n*19n*76n*powerLo[LIMIT+n]*difference,10000n*U);
      const gap=rhs-mulHi(c,c);
      if (gap<=0n) return false;
      margin=margin===null?gap:min(margin,gap);
      if (n<lowMatch || n>highMatch) continue;
      const gainHi=mulHi(2n*powerHi[LIMIT+n+1],gain[j]+missing);
      const indices=matchIndices[n-lowMatch];
      const pending=[[0,shells]];
      while (pending.length) {
        const [l,r]=pending.pop();
        const h=shellR[r],m=indices[l];
        assert(m>=lowN && m<=gaussianHigh);
        const lower=benchmark[m-lowN]-gainHi-mulHi(2n*h,c)-ceil(K*h*h,U*U);
        if (lower>ceil(U,1000000n)) {matched=matched===null?lower:min(matched,lower);continue;}
        if (r-l<=1) return false;
        const mid=Math.floor((l+r)/2);
        pending.push([l,mid],[mid,r]);
      }
    }
  }
  best=best===null?margin:min(best,margin);
  bestMatched=bestMatched===null?matched:min(bestMatched,matched);passes++;
  return true;
}
// The enlarged amplitude index range contains sqrt(u)/ell for the target.
assert(81n*powerHi[LIMIT+lowN]**2n * 100000n < 100n*551n*U*U);
assert(76n**2n*powerLo[LIMIT+highN+1]**2n * 10000n > 10000n*463n*U*U);
assert(81n*powerHi[LIMIT+lowMatch]**2n * 100000n < 100n*551n*U*U);
assert(76n**2n*powerLo[LIMIT+highMatch+1]**2n * 10000n > 10000n*463n*U*U);
const profiles=[[firstP,lastP,0]];
while (profiles.length) {
  const [p0,p1,depth]=profiles.pop();
  if (checkProfile(p0,p1)) continue;
  assert(depth<8,"unverified content interval");
  const mid=(p0+p1)/2n;
  profiles.push([p0,mid,depth+1],[mid,p1,depth+1]);
}
assert(1000000n*best>3n*U);
assert(1000000n*bestMatched>U);
console.log("Two content bounds:",passes,"profile intervals;",highN-lowN+1,
  "amplitude intervals each; gap >=",String(best),"/",String(U));
console.log("Two matched-variance bounds: positive minimum enclosure",String(bestMatched),"/",String(U));

// Project onto a real line. P(k) is the upper envelope of the weighted
// real marginal density, with its normalizing constant stripped off.
function projectedEnvelope(k,a=ratLo(5592,10000),b=ratLo(1432,10000)) {
  const n=256n;
  const radial=[];
  for (let j=0n;j<4n*n;j++) {
    const l=j*U/n,r=(j+1n)*U/n,l2=l*l/U,r2=r*r/U;
    radial.push({r,l2,r2,exp:expMinus(l2)[1]});
  }
  let sum=0n;
  for (const y of radial) {
    let height=0n;
    for (const x of radial) {
      const den=a+mulLo(b,y.l2+3n*x.l2)-mulHi(2n*k,x.r);
      assert(den>0n);
      const q=max(abs(x.l2+y.l2-U),abs(x.r2+y.r2-U));
      height=max(height,ceil(mulHi(x.exp,y.exp)*q*q,U*den));
    }
    sum+=height;
  }
  return ceil(sum,n)+ceil(U,100000n);
}
for (const [n,cap] of [[0,107],[20,118],[42,174]]) {
  const b=projectedEnvelope(ratHi(n,100));
  assert(100n*b<BigInt(cap)*U);
  console.log("Projected envelope at",n+"/100 <=",String(b),"/",String(U));
}
for (const row of [
  {p:[2,15],caps:[856,925,1170,1750],A:856,B:400,C:3300},
  {p:[4,19],caps:[982,1044,1220,1430],A:982,B:320,C:1600},
]) {
  const pl=ratLo(...row.p),ph=ratHi(...row.p);
  const knots=[0,2,4,5];
  for (let i=0;i<knots.length;i++) {
    const b=projectedEnvelope(ratHi(knots[i],10),U-2n*ph,pl);
    assert(1000n*b<BigInt(row.caps[i])*U);
    if (!i) continue;
    // A+B k+C k² majorizes the chord through adjacent upper bounds.
    // Coefficients are in units 1/1000, and k is in tenths at the knots.
    const l=BigInt(knots[i-1]),r=BigInt(knots[i]),width=r-l;
    const v=BigInt(row.caps[i-1]),dw=BigInt(row.caps[i])-v;
    const a=BigInt(row.C)*width, b1=BigInt(row.B)*width-10n*dw;
    const c=(BigInt(row.A)-v)*width+dw*l;
    const at=j=>a*j*j+10n*b1*j+100n*c;
    assert(at(l)>=0n && at(r)>=0n);
    if (2n*a*l < -10n*b1 && -10n*b1 < 2n*a*r) assert(4n*a*c>=b1*b1);
  }
}
console.log("Normalized projected-cost endpoint bounds verified");

// The normal tail term in the quadratic cost is at most
// (4 sqrt(pi)/(e rho)) exp(-k0²/rho²). It increases on the ranges used.
function tailCost(rho,k0) {
  const exponent=floor(k0*k0*U,rho*rho);
  return ceil(4n*1773n*3n*U*expMinus(exponent)[1],1000n*8n*rho);
}
const rho=ratHi(197,1000),tail=tailCost(rho,U/2n);
assert(1000n*tail<22n*U);
for (const [a,b,c,cap] of [[856,400,3300,940],[982,320,1600,1045]]) {
  const coeff=ratHi(a,1000)+ceil(BigInt(b)*rho*200n,1000n*531n)
    +ceil(BigInt(c)*rho*rho,4000n*U)+tail;
  assert(1000n*coeff<BigInt(cap)*U);
}
const rhoRow=ratHi(15,100);
const costRow=ratHi(107,100)+ceil(55n*rhoRow*200n,100n*531n)
  +ceil(3n*rhoRow*rhoRow,4n*U)+tailCost(rhoRow,ratLo(42,100));
assert(costRow+ratHi(19,100) < ratLo(2500,1891));
console.log("Gaussian-tail and 0.19 row-cost constants verified");
