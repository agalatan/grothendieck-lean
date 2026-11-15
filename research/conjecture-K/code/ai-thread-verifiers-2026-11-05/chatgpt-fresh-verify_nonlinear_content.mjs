// /workspace/scratch/0a5cdb105103/verify_nonlinear_content.mjs
// Node >= 20; no dependencies. Run: node verify_nonlinear_content.mjs
// Certifies scalar constants used in the accompanying nonlinear-content proof.
// Does NOT certify the requested full amplitude range u <= 0.0463.
// Every asserted inequality uses outward-rounded BigInt interval arithmetic.
import assert from 'node:assert/strict';

const SCALE = 1n << 96n;
const ZERO = [0n, 0n];
const ONE = [SCALE, SCALE];

function floorDiv(a, b) {
  assert(b > 0n);
  const q = a / b;
  return a < 0n && a % b !== 0n ? q - 1n : q;
}
function ceilDiv(a, b) { return -floorDiv(-a, b); }
function rat(a, b = 1n) {
  a = BigInt(a); b = BigInt(b);
  assert(b > 0n);
  return [floorDiv(a * SCALE, b), ceilDiv(a * SCALE, b)];
}
function add(x, y) { return [x[0] + y[0], x[1] + y[1]]; }
function sub(x, y) { return [x[0] - y[1], x[1] - y[0]]; }
function mul(x, y) {
  const products = [x[0] * y[0], x[0] * y[1], x[1] * y[0], x[1] * y[1]];
  let lo = products[0], hi = products[0];
  for (const p of products) { if (p < lo) lo = p; if (p > hi) hi = p; }
  return [floorDiv(lo, SCALE), ceilDiv(hi, SCALE)];
}
function div(x, y) {
  assert(y[0] > 0n);
  return mul(x, [floorDiv(SCALE * SCALE, y[1]), ceilDiv(SCALE * SCALE, y[0])]);
}
function scale(x, a, b = 1n) {
  a = BigInt(a); b = BigInt(b);
  assert(a >= 0n && b > 0n);
  return [floorDiv(x[0] * a, b), ceilDiv(x[1] * a, b)];
}
function square(x) { return mul(x, x); }
function integerSqrt(n) {
  assert(n >= 0n);
  if (n < 2n) return n;
  let x = 1n << BigInt(Math.ceil(n.toString(2).length / 2));
  while (true) {
    const y = (x + n / x) / 2n;
    if (y >= x) return x;
    x = y;
  }
}
function sqrt(x) {
  assert(x[0] >= 0n);
  const lo = integerSqrt(x[0] * SCALE);
  const r = integerSqrt(x[1] * SCALE);
  return [lo, r * r === x[1] * SCALE ? r : r + 1n];
}
function expNeg(x) {
  assert(x[0] >= 0n);
  // e > 2 gives e^-x < 2^-64 for x >= 64.
  if (x[0] >= 64n * SCALE) return [0n, SCALE >> 64n];
  assert(x[1] < 65n * SCALE);
  const u = scale(x, 1, 128);
  let term = ONE, sum = ONE;
  // The even partial sum is above e^-u. The following odd sum is below it.
  for (let k = 1; k <= 24; k++) {
    term = scale(mul(term, u), 1, k);
    sum = k % 2 ? sub(sum, term) : add(sum, term);
  }
  const next = scale(mul(term, u), 1, 25);
  let result = [sub(sum, next)[0], sum[1]];
  assert(result[0] > 0n);
  for (let k = 0; k < 7; k++) result = square(result);
  return [result[0] < 0n ? 0n : result[0], result[1] > SCALE ? SCALE : result[1]];
}
function atanSmall(x) {
  const xx = square(x);
  let power = x, sum = x;
  for (let k = 1; k <= 80; k++) {
    power = mul(power, xx);
    const term = scale(power, 1, 2 * k + 1);
    sum = k % 2 ? sub(sum, term) : add(sum, term);
  }
  const next = scale(mul(power, xx), 1, 163);
  return [sub(sum, next)[0], sum[1]];
}
const PI = sub(scale(atanSmall(rat(1, 5)), 16), scale(atanSmall(rat(1, 239)), 4));
const SQRT_PI = sqrt(PI);


function display(x){return x.map(y=>Number(y)/Number(SCALE));}
function pow(x,n){let r=ONE;for(let j=0;j<n;j++)r=mul(r,x);return r;}
const a=rat(699,1250),b=rat(179,1250);
const H=65536, cutoff=8;
const h=rat(1,H), h2=rat(1,BigInt(H)**2n);
let expY=ONE, expStep=expNeg(h2);
const expStepRatio=expNeg(scale(h2,2));
let I0=ZERO,I1=ZERO,I6=ZERO;
for(let j=0;j<H*cutoff;j++){
  const nextExp=mul(expY,expStep);
  const e=[nextExp[0],expY[1]];
  const t=[rat(BigInt(j)**2n,BigInt(H)**2n)[0],rat(BigInt(j+1)**2n,BigInt(H)**2n)[1]];
  const c=add(a,mul(b,t)), inv=div(ONE,c), v=mul(b,inv);
  // -D0 = 4 int_0^infty e^-y2 (1+3b/c)c^-3 dy.
  I0=add(I0,mul(e,mul(add(ONE,scale(v,3)),pow(inv,3))));
  // D1 = 4 int e^-y2 [1+(1-y2)(1+3b/c)]c^-3 dy.
  I1=add(I1,mul(e,mul(add(ONE,mul(sub(ONE,t),add(ONE,scale(v,3)))),pow(inv,3))));
  // Phi^(6)(0) = 96 int e^-y2 [1/2+5b/c+15b2/c2]c^-5 dy.
  I6=add(I6,mul(e,mul(add(add(rat(1,2),scale(v,5)),scale(square(v),15)),pow(inv,5))));
  expY=nextExp; expStep=mul(expStep,expStepRatio);
}
I0=scale(mul(h,I0),4);I1=scale(mul(h,I1),4);I6=scale(mul(h,I6),96);
// e^-64 < 2^-64. For y>=8, int e^-y2 <= 2^-64/16 and
// int y2 e^-y2 <= (129/32) 2^-64. These bound every omitted tail.
const e64=rat(1,1n<<64n), tail0=scale(e64,1,16),tail2=scale(e64,129,32);
const va=div(b,a),ia=div(ONE,a);
const tailD0=scale(mul(tail0,mul(add(ONE,scale(va,3)),pow(ia,3))),4);
const tailD1=scale(mul(add(mul(add(rat(2),scale(va,3)),tail0),mul(add(ONE,scale(va,3)),tail2)),pow(ia,3)),4);
const tailM6=scale(mul(tail0,mul(add(add(rat(1,2),scale(va,5)),scale(square(va),15)),pow(ia,5))),96);
I0=[I0[0],I0[1]+tailD0[1]];
I1=[I1[0]-tailD1[1],I1[1]+tailD1[1]];
I6=[I6[0],I6[1]+tailM6[1]];
console.log('-D0 enclosure:',display(I0));
console.log('D1 enclosure:',display(I1));
console.log('Phi^(6)(0) enclosure:',display(I6));
assert(I0[0] > rat(267,10)[1]);
assert(I1[1] < rat(691,20)[0]);
assert(I6[1] < rat(2750)[0]);
// Exact product-formula constants ||I_3(f) I_r(g)||_2^2 <= K_r ||I_3(f)||_2^2 ||I_r(g)||_2^2.
function factorial(n){let v=1n;for(let j=2n;j<=BigInt(n);j++)v*=j;return v;}
function choose(n,k){return factorial(n)/(factorial(k)*factorial(n-k));}
function productConstant(q,r){let v=0n;for(let k=0;k<=Math.min(q,r);k++){let c=factorial(k)*choose(q,k)*choose(r,k);v+=c*c*factorial(q+r-2*k);}return v/(factorial(q)*factorial(r));}
assert.equal(productConstant(3,2),31n);
assert.equal(productConstant(3,4),213n);
// Admissible complex Wick pairings: E[|Z|^4 (|Z|^2-2)^4] = 176;
// the variance is 2, so E|q|^4 <= 44(E|q|^2)^2.
const pairings=factorial(6)-8n*factorial(5)+24n*factorial(4)-32n*factorial(3)+16n*factorial(2);
assert.equal(pairings,176n);
// The matrix inequality H(a2,a4) <= (5/8)((9/2)a2^2+9a4^2).
// Young with t=1/9; sqrt(6603) < 813/10.
assert(rat(6603)[1] < square(rat(813,10))[0]);
const r=rat(11,240),s=rat(5,48);
const aa=add(add(rat(31,60),scale(square(r),9,2)),rat(1,18));
const bb=add(add(rat(213,48),scale(square(s),9,2)),rat(1,18));
const off=scale(add(scale(rat(813,10),3,80),scale(mul(r,s),9)),1,2);
const d2=sub(rat(45,16),aa),d4=sub(rat(45,8),bb);
assert(d2[0]>0n && d4[0]>0n);
assert(sub(mul(d2,d4),square(off))[0]>0n);
// Nonlinear content: K = (3+2 sqrt(2))*D1^2/32*(3/8)^(3/2) < 50.
const K=scale(mul(mul(add(rat(3),scale(sqrt(rat(2)),2)),square(rat(691,20))),mul(rat(3,8),sqrt(rat(3,8)))),1,32);
assert(K[1] < rat(50)[0]);
// D >= (267/320 - (61875/128)u) kappa, where kappa=E|q|^4-2u^2.
// Since kappa <= 42u^2, |C|^2 <= 50 sqrt(42) u kappa.
const umax=rat(19,50000);
const deficitCoefficient=sub(rat(267,320),mul(rat(61875,128),umax));
const contentCoefficient=mul(scale(sqrt(rat(42)),50),umax);
const margin=sub(scale(deficitCoefficient,19,100),contentCoefficient);
assert(margin[0]>0n);
const uWeak=rat(1,1000);
const weakMargin=sub(sub(rat(267,320),mul(rat(61875,128),uWeak)),mul(scale(sqrt(rat(42)),50),uWeak));
assert(weakMargin[0]>0n);
console.log('Universal nonlinear content constant:',display(K));
console.log('Margin at u=19/50000:',display(margin));
console.log('Margin for |C|^2 <= D at u=1/1000:',display(weakMargin));
console.log('CERTIFIED SCALARS: |C_X(q)|^2 <= .19 D(q) for 0 <= u <= 19/50000, using the analytic proof.');