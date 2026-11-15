// output/r456/verify_core.mjs
// Node.js 20+. All bounds and acceptance decisions use integer arithmetic.
import assert from "node:assert/strict";

const unit = 1n << 40n;
const abs = x => x < 0n ? -x : x;
const min = (a, b) => a < b ? a : b;
const max = (a, b) => a > b ? a : b;
function down(n, d) {
  assert(d > 0n);
  return n < 0n ? -((-n + d - 1n) / d) : n / d;
}
const up = (n, d) => -down(-n, d);
function sqrtFloor(n) {
  let r = BigInt(Math.floor(Math.sqrt(Number(n))));
  while (r * r > n) r--;
  while ((r + 1n) ** 2n <= n) r++;
  return r;
}
function sqrtCeil(n) {
  const r = sqrtFloor(n);
  return r * r === n ? r : r + 1n;
}

// Intervals are pairs of numerators, each with the common denominator unit.
const exact = k => [BigInt(k) * unit, BigInt(k) * unit];
const rat = (n, d) => [down(n * unit, d), up(n * unit, d)];
const add = (a, b) => [a[0] + b[0], a[1] + b[1]];
const sub = (a, b) => [a[0] - b[1], a[1] - b[0]];
function mul(a, b) {
  const p = [a[0]*b[0], a[0]*b[1], a[1]*b[0], a[1]*b[1]];
  return [down(p.reduce(min), unit), up(p.reduce(max), unit)];
}
const sc = (k, a) => k >= 0 ? [BigInt(k)*a[0], BigInt(k)*a[1]] : [BigInt(k)*a[1], BigInt(k)*a[0]];
const sum = (...a) => a.reduce(add, exact(0));
const ipow = (a, n) => n === 0 ? exact(1) : mul(a, ipow(a, n-1));

// A one-sided bound for exp(-x): the reciprocal of a positive Taylor partial
// sum for exp(x). Each term is rounded down, then the reciprocal rounds up.
function expMinusUpper(x, terms) {
  let term = unit;
  let total = unit;
  for (let k = 1; k <= terms; k++) {
    term = down(term * x, BigInt(k) * unit);
    total += term;
  }
  return up(unit * unit, total);
}

function potentialBound(a, b) {
  const n = 128n;
  let envelope = 0n;
  let integralHi = up(unit, 1000n); // tail for x >= 4
  for (let j = 4n*n-1n; j >= 0n; j--) {
    const l = j*unit/n;
    const r = (j+1n)*unit/n;
    const lsq = l*l/unit;
    const rsq = r*r/unit;
    const qMax = max(abs(lsq-unit), abs(rsq-unit));
    const fLo = a[0] + down(b[0]*lsq,unit);
    const slopeLo = a[0] + down(3n*b[0]*lsq,unit);
    const height = up(qMax*qMax*expMinusUpper(lsq, 48), fLo*slopeLo);
    envelope = max(envelope, height);
    const deltaR = up(a[1]*(r-l),unit) + up(b[1]*(r**3n-l**3n),unit**3n);
    integralHi += up(2n*envelope*deltaR,unit);
  }
  assert(100n*integralHi < 214n*unit);
  return integralHi;
}

const rows = [
  [5592n,1432n], [5600n,1467n], [5730n,1520n],
];
for (const [a,b] of rows) {
  const hi = potentialBound(rat(a,10000n),rat(b,10000n));
  console.log("Potential envelope", String(a),String(b),String(hi),"/",String(unit));
}

// H_j(z) = E[(1+zY)^(1/2-j)], Y ~ Gamma(3,1).
// Composite Simpson on [0,32], mesh 1/128. |fourth derivative| < 2000,
// giving error < 1/750000; the integral from 32 onward is < 1e-8.
const mesh = 128n;
const last = Number(32n*mesh);
const quadratureWeights = [];
function prepareWeights() {
  let term = rat(1n,1n), partial = term, left;
  for (let k=1n;k<=8n;k++) {
    term = [down(term[0],mesh*k), up(term[1],mesh*k)];
    partial = k%2n ? sub(partial,term) : add(partial,term);
    if (k===7n) left = partial[0];
  }
  const step = [left, partial[1]]; // exp(-1/128)
  let exp = exact(1);
  for (let i=0;i<=last;i++) {
    const y = BigInt(i)*unit/mesh;
    const coef = i===0 || i===last ? 1 : i%2 ? 4 : 2;
    quadratureWeights.push(sc(coef,mul(exp,rat(y*y,2n*unit*unit))));
    exp = mul(exp,step);
  }
}
prepareWeights();

function momentBounds(index, cells) {
  const zNum = 2n * (cells + index);
  const zDen = 11n * cells;
  const lo = Array(5).fill(0n), hi = Array(5).fill(0n);
  for (let i=1;i<=last;i++) {
    const denominator = zDen * mesh;
    const offset = zNum * BigInt(i) * unit;
    const kLo = unit + offset / denominator;
    const kHi = unit + up(offset,denominator);
    let pLo = sqrtFloor(kLo*unit), pHi = sqrtCeil(kHi*unit);
    const [wLo,wHi] = quadratureWeights[i];
    for (let j=0;j<5;j++) {
      lo[j] += wLo*pLo;
      hi[j] += wHi*pHi;
      pLo = pLo*unit/kHi;
      pHi = up(pHi*unit,kLo);
    }
  }
  const denominator = 3n*mesh*unit;
  const error = up(unit,750000n);
  const tail = up(unit,100000000n);
  return lo.map((v,j)=>[down(v,denominator)-error,up(hi[j],denominator)+error+tail]);
}

function momentShells(left, right) {
  const h = left.map((v,j)=> j===0 ? [v[0],right[j][1]] : [right[j][0],v[1]]);
  const mon = [sc(-2,h[0]),h[1],mul(rat(1n,2n),h[2]),mul(rat(3n,4n),h[3]),mul(rat(15n,8n),h[4])];
  const [m0,m1,m2,m3,m4] = mon;
  return [m0,sub(m1,m0),sum(m0,sc(-2,m1),m2),
    sum(sc(-1,m0),sc(3,m1),sc(-3,m2),m3),
    sum(m0,sc(-4,m1),sc(6,m2),sc(-4,m3),m4)];
}

// Sufficient Gram determinant for the first shared, matched-variance case.
function matchedSign(j) {
  const [j0,j1,j2,j3,j4] = j;
  const d = sc(-1,j2);
  const A = sum(sc(168,mul(j0,d)),sc(128,mul(j1,j1)));
  const B = sum(mul(sub(sc(16,j2),sc(8,j0)),d),sc(16,mul(j3,j1)));
  const C = sum(sc(2,mul(sub(j4,j0),d)),mul(rat(1n,2n),mul(j3,j3)));
  return A[1]<0n && C[1]<0n && sub(sc(4,mul(A,C)),mul(B,B))[0]>0n;
}

function evaluate(poly, x) {
  let value = exact(0);
  for (let i=poly.length-1;i>=0;i--) value=add(mul(value,x),poly[i]);
  return value;
}
const choose = [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]];

// Prove positivity on [0,L] by its degree-four Bernstein coefficients.
// Strictly negative nonconstant coefficients of P(L+x) make P decreasing
// on the remaining positive ray. On the negative ray the power signs suffice.
function literalRoots(poly, L, H, farNegative, nearNegative) {
  const [constant,linear,quadratic,cubic,quartic]=poly;
  if (constant[0]<=0n || linear[0]<0n || quadratic[1]>=0n || cubic[0]<=0n || quartic[1]>=0n) return false;
  for (let i=0;i<=4;i++) {
    let b=exact(0);
    for (let k=0;k<=i;k++) {
      b=add(b,mul(mul(poly[k],ipow(L,k)),rat(BigInt(choose[i][k]),BigInt(choose[4][k]))));
    }
    if (b[0]<=0n) return false;
  }
  for (let i=1;i<=4;i++) {
    let coef=exact(0);
    for (let k=i;k<=4;k++) coef=add(coef,sc(choose[k][i],mul(poly[k],ipow(L,k-i))));
    if (coef[1]>=0n) return false;
  }
  return evaluate(poly,H)[1]<0n && evaluate(poly,farNegative)[1]<0n && evaluate(poly,nearNegative)[0]>0n;
}

function signsHold(j) {
  const [j0,j1,j2,j3,j4]=j;
  const constant=sc(2,sub(j4,sc(4,j0)));
  const p1=[constant,sc(8,j3),sub(sc(48,j2),sc(16,j0)),sc(128,j1),sc(168,j0)];
  const p2=[constant,exact(0),sub(sc(12,j2),sc(8,j0)),sc(16,j1),sc(16,j0)];
  return matchedSign(j)
    && literalRoots(p1,rat(7n,10n),rat(4n,5n),rat(-1n,5n),rat(-1n,10n))
    && literalRoots(p2,rat(9n,10n),exact(1),rat(-1n,2n),rat(-2n,5n));
}

// Adaptively cover z=beta/a in [2/11,4/11]. Endpoint integrals are cached.
const cache = new Map();
function endpoint(i,n) {
  while (n>1n && i%2n===0n) { i/=2n; n/=2n; }
  const key=String(i)+"/"+String(n);
  if (!cache.has(key)) cache.set(key,momentBounds(i,n));
  return cache.get(key);
}
const pending=[[0n,1n]];
let passed=0,finest=1n;
while (pending.length) {
  const [i,n]=pending.pop();
  const j=momentShells(endpoint(i,n),endpoint(i+1n,n));
  if (signsHold(j)) {passed++;finest=max(finest,n);continue;}
  assert(n < 8192n, "unverified profile interval");
  pending.push([2n*i,2n*n],[2n*i+1n,2n*n]);
}
console.log("Quartic signs certified on",passed,"profile intervals; finest dyadic denominator",String(finest));

// Full-box disjoint comparison. Lengths have been divided by ell.
// C is a uniform bound for r K_w(r). Check the two finite Bessel values
// used in the proof of the additional bound r K_w(r) <= 1+w/(2r²).
const C = rat(237n,200n);
for (const [num,den,boundNum,boundDen] of [[4n,3n,8n,7n],[7n,4n,10n,9n]]) {
  const x=rat(num,den);
  const y=mul(mul(x,x),rat(1n,4n));
  let term=exact(1),total=term;
  for (let j=1;j<=15;j++) {
    term=mul(mul(term,y),rat(1n,BigInt(j*j)));
    total=add(total,term);
  }
  // Every remaining term ratio is less than 1/2.
  const i0Hi=total[1]+term[1];
  const sqrtHi=sqrtCeil(up(44n*x[1]*unit,7n)); // pi < 22/7
  const uHi=up(sqrtHi*expMinusUpper(x[0],30)*i0Hi,unit*unit);
  assert(boundDen*uHi < boundNum*unit);
}

const nRadius=1024n;
const radialCells=[];
for (let j=0n;j<4n*nRadius;j++) {
  const l=j*unit/nRadius, r=(j+1n)*unit/nRadius;
  const l2=l*l/unit,r2=r*r/unit;
  radialCells.push({r,r2,l2,
    weight: max(abs(l2-unit),abs(r2-unit))**2n*expMinusUpper(l2,48)});
}

function disks(pLo,pHi) {
  let last=0n;
  const layers=[];
  for (let i=radialCells.length-1;i>=0;i--) {
    const {r,r2,l2,weight}=radialCells[i];
    const f=unit+down(min(pLo*(l2-2n*unit),pHi*(l2-2n*unit)),unit);
    const g=unit+down(min(pLo*(3n*l2-2n*unit),pHi*(3n*l2-2n*unit)),unit);
    const hi=up(weight,f*g);
    if (hi<=last) continue;
    const fMax=unit+up(max(pLo*(r2-2n*unit),pHi*(r2-2n*unit)),unit);
    layers.push({mass:hi-last,radius:up(r*fMax,unit),
      inner:max(0n,unit-r2),outer:max(unit,r2-unit)});
    last=hi;
  }
  return layers;
}

function diskPotentialUpper(layers,dLo,dHi) {
  let bound=0n;
  for (const {mass,radius,inner,outer} of layers) {
    const z=down(dLo*inner,unit);
    const m=min(radius,down(17n*z,20n));
    let integral=up(C[1]*(radius-m),unit)
      +up(1773n*(sqrtCeil(z*z+m*m)-z),1000n);
    if (dHi!==null) {
      const far=up(5n*dHi*outer,3n*unit);
      const excess=max(0n,radius-far);
      integral-=down((C[0]-unit)*excess*excess,unit*radius);
    }
    bound+=mass*integral;
  }
  return up(2n*bound,unit)+up(unit,5000n);
}

let boxes=0,profiles=0,largest=0n;
function profilePasses(pLo,pHi) {
  const layers=disks(pLo,pHi);
  const tailBound=diskPotentialUpper(layers,unit,null);
  if (100n*tailBound>=199n*unit) return false;
  const pending=[[0n,unit]];
  let count=1,worst=tailBound;
  while (pending.length) {
    const [lo,hi]=pending.pop();
    const b=diskPotentialUpper(layers,lo,hi);
    if (100n*b<199n*unit) {count++;worst=max(worst,b);continue;}
    if (hi-lo<=unit/4096n) return false;
    const mid=(lo+hi)/2n;
    pending.push([lo,mid],[mid,hi]);
  }
  profiles++;boxes+=count;largest=max(largest,worst);
  return true;
}
const profileQueue=[[rat(2n,15n)[0],rat(4n,19n)[1],0]];
while (profileQueue.length) {
  const [lo,hi,depth]=profileQueue.pop();
  if (profilePasses(lo,hi)) continue;
  assert(depth<11,"unverified full-box potential");
  const mid=(lo+hi)/2n;
  profileQueue.push([lo,mid,depth+1],[mid,hi,depth+1]);
}
console.log("Full-box potential",String(largest),"/",String(unit),
  "on",profiles,"profile intervals and",boxes,"variance intervals");