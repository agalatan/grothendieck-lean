// Intended filepath: /workspace/scratch/3efc7fe714fa/cum3_check.js
'use strict';

// Exact BigInt checks for cubic Wiener-chaos contraction and cumulant identities.
const assert = require('node:assert/strict');

function addTerm(p, exps, coeff) {
  const key = exps.join(',');
  p.set(key, (p.get(key) || 0n) + coeff);
}
function mul(p, q) {
  const r = new Map();
  for (const [x, a] of p) for (const [y, b] of q) {
    const u = x.split(',').map(Number), v = y.split(',').map(Number);
    addTerm(r, u.map((e, i) => e + v[i]), a * b);
  }
  return r;
}
function moment(p) {
  let ans = 0n;
  for (const [key, coeff] of p) {
    let m = coeff;
    for (const e of key.split(',').map(Number)) {
      if (e % 2) { m = 0n; break; }
      for (let k = 1; k < e; k += 2) m *= BigInt(k);
    }
    ans += m;
  }
  return ans;
}
function check(n, f, label) {
  const p = new Map();
  for (let i = 0; i < n; i++) for (let j = 0; j < n; j++) for (let k = 0; k < n; k++) {
    const a = f(i, j, k), e = Array(n).fill(0);
    e[i]++; e[j]++; e[k]++;
    addTerm(p, e, a);
    if (i === j) {
      const u = Array(n).fill(0); u[k] = 1;
      addTerm(p, u, -3n * a);
    }
  }
  const p2 = mul(p, p), p4 = mul(p2, p2), p6 = mul(p4, p2);
  const m2 = moment(p2), m4 = moment(p4), m6 = moment(p6);
  const k4 = m4 - 3n * m2 * m2;
  const k6 = m6 - 15n * m4 * m2 + 30n * m2 ** 3n;
  const M = Array.from({length:n}, () => Array(n).fill(0n));
  for (let a = 0; a < n; a++) for (let b = 0; b < n; b++)
    for (let i = 0; i < n; i++) for (let j = 0; j < n; j++)
      M[a][b] += f(a,i,j) * f(b,i,j);
  const contraction = (a,b,c,d) => {
    let z = 0n;
    for (let i = 0; i < n; i++) z += f(a,b,i) * f(c,d,i);
    return z;
  };
  let C = 0n, C1 = 0n, nineS = 0n;
  for (const row of M) for (const x of row) C += x*x;
  for (let a=0;a<n;a++) for(let b=0;b<n;b++) for(let c=0;c<n;c++) for(let d=0;d<n;d++) {
    const t = contraction(a,b,c,d);
    C1 += t*t;
    const sn = t + contraction(a,c,b,d) + contraction(a,d,b,c);
    nineS += sn*sn;
  }
  assert.equal(C1,C);
  assert.equal(k4,1296n*C+216n*nineS);
  assert(k6*k6*4n <= 485n*485n*k4**3n);
  console.log(label, {m2:String(m2),m4:String(m4),m6:String(m6),k4:String(k4),k6:String(k6),C:String(C),nineS:String(nineS)});
  return {m2,m4,m6,k4,k6,C,nineS};
}
const rankOne = check(1, () => 1n, 'He3');
assert.equal(rankOne.k4,3240n);
assert.equal(rankOne.k6,11314080n);
assert.equal(rankOne.k6*2n,485n*36n**3n);
check(2,(i,j,k)=>[1n,-2n,3n,1n][i+j+k],'integer symmetric n=2');
check(3,(i,j,k)=>BigInt(((i+1)*(j+1)*(k+1)+i+j+k)%5-2),'integer symmetric n=3');
const product=check(3,(i,j,k)=>(i!==j&&i!==k&&j!==k)?1n:0n,'6*g1*g2*g3');
assert.equal(product.k4,24n*product.m2**2n);
assert.equal(product.k6,3000n*product.m2**3n);
