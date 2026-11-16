// scripts/verify.mjs
import assert from 'node:assert/strict';

const fraction = (n, d = 1n) => [BigInt(n), BigInt(d)];
const add = ([a, b], [c, d]) => [a*d + b*c, b*d];
const mul = ([a, b], [c, d]) => [a*c, b*d];
const equal = ([a, b], [c, d]) => a*d === b*c;

assert(42n**3n < 273n**2n);
assert((6n + 9n*42n)*100000n + 4045313n*273n < 12000n*100000n);
assert(7n**18n * 12000n**2n < 5n**18n * 4000n**3n);
assert(110n**2n > 12000n && 310n**2n > 8n*12000n);
assert(8n**2n >= 7n*8n && 3n**2n >= 8n);
assert(7n**2n > 44n && 29n**2n < 1024n);
assert.equal(2n*8n + 3n*7n, 37n);
assert(3n*4000n + 2n*(110n + 310n)*37n < 44000n);
assert(17n**2n > 2n*12n**2n);

function gammaMoment(shape, order) {
  let value = 1n;
  for (let j = 0n; j < order; j++) value *= shape + j;
  return value;
}
const sphereChecks = [];
for (const m of [2n, 3n, 7n, 32n, 1024n]) {
  const radiusMoments = [0n, 1n, 2n, 3n].map(k => gammaMoment(m, k));
  const radialError = add(fraction(radiusMoments[3], m**3n),
    add(fraction(-3n*radiusMoments[1], m), fraction(2n)));
  assert(equal(radialError, fraction(3n*m+2n, m*m)));
  assert(5n*(m+1n) + 2n*m <= 7n*(m+1n));

  // Independent direct computation for Y(|Y|^2-2).
  // Conditional on the norm of a row of M, the spherical linear projection
  // has scalar coefficient 2 sqrt(T) [T/(m+1)-1] and spherical energy /m.
  const directCubicDrop = mul(fraction(4n, m), add(
    fraction(radiusMoments[3], (m+1n)**2n),
    add(fraction(-2n*radiusMoments[2], m+1n), fraction(radiusMoments[1]))));
  assert(equal(directCubicDrop, fraction(4n, m+1n)));
  assert(equal(mul(fraction(radiusMoments[3], m**3n),fraction(m-1n,m+1n)),
    fraction((m-1n)*(m+2n),m*m)));

  const n = 120n;
  const traceVariance = gammaMoment(n*m, 2n) - (n*m)**2n;
  assert(equal(fraction(traceVariance, m*m*n), fraction(1n, m)));
  assert(equal(fraction(m*gammaMoment(n*m, 2n), m**4n*n), fraction(n*m+1n, m*m)));
  sphereChecks.push(String(m));
}

const sum = values => values.reduce((acc, value) => acc + value, 0n);
const indices = n => Array.from({length: n}, (_, i) => i);
const matrix = rows => rows.map(row => row.map(BigInt));
const matrixProduct = (A, B) => A.map(row => B[0].map((_, j) =>
  sum(row.map((entry, k) => entry*B[k][j]))));
const trace = A => sum(A.map((row, i) => row[i]));
function jordan(A, B) {
  const AB = matrixProduct(A,B);
  const BA = matrixProduct(B,A);
  return AB.map((row, i) => row.map((entry, j) => {
    const numerator = entry + BA[i][j];
    assert.equal(numerator % 2n, 0n);
    return numerator/2n;
  }));
}
function addition(...ps) {
  const out = new Map();
  for (const p of ps) for (const [k, v] of p) out.set(k, (out.get(k) ?? 0n) + v);
  return out;
}
const scale = (p, c) => new Map([...p].map(([k,v]) => [k,c*v]));
function product(p,q) {
  const out = new Map();
  for (const [a,x] of p) for (const [b,y] of q) {
    const key = a.split(',').map((v,i) => Number(v)+Number(b.split(',')[i])).join(',');
    out.set(key, (out.get(key) ?? 0n) + x*y);
  }
  return out;
}
function realGaussianMoment(n) {
  if (n % 2 === 1) return 0n;
  let value = 1n;
  for (let k = 1; k < n; k += 2) value *= BigInt(k);
  return value;
}
function moment(p) {
  return sum([...p].map(([key,value]) =>
    key.split(',').reduce((v,k) => v*realGaussianMoment(Number(k)),value)));
}
const productMoment = (...ps) => moment(ps.reduce(product));
const constant = (n,c) => new Map([[Array(n).fill(0).join(','), c]]);
function quadratic(A, centered) {
  let output = constant(A.length, centered ? -trace(A) : 0n);
  for (const i of indices(A.length)) for (const j of indices(A.length)) {
    const degrees = Array(A.length).fill(0);
    degrees[i]++;
    degrees[j]++;
    output = addition(output, new Map([[degrees.join(','),A[i][j]]]));
  }
  return output;
}
function audit(H) {
  const idx = indices(H.length);
  const P = H.map(A => quadratic(A,true));
  const S = H.map(A => H.map(B => jordan(A,B)));
  const B = S.map(row => row.map(A => scale(quadratic(A,false),2n)));
  const A = addition(...P.map(p => product(p,p)));
  const u = moment(A);
  const center = addition(A,constant(H[0].length,-u));
  let traceJ = 0n;
  for (const i of idx) {
    const vi = sum(idx.map(j => trace(matrixProduct(H[i],S[j][j]))));
    const BP = addition(...idx.map(j => product(B[i][j],P[j])));
    assert.equal(moment(BP),4n*vi);
    assert.equal(productMoment(center,P[i]),8n*vi);
    const numerator = addition(product(P[i],center),scale(BP,2n));
    assert.equal(moment(numerator),2n*productMoment(P[i],A));
    assert.equal(4n*productMoment(numerator,A)+2n*u*moment(numerator),
      6n*productMoment(P[i],A,A));
    for (const j of idx) {
      const Rij = sum(idx.map(k => trace(matrixProduct(S[k][k],S[i][j]))));
      const Tij = sum(idx.map(k => trace(matrixProduct(S[k][i],S[k][j]))));
      const M2ij = sum(idx.map(k => 4n*trace(S[i][k])*trace(S[k][j])));
      assert.equal(sum(idx.map(k => productMoment(B[i][k],B[k][j]))),M2ij+8n*Tij);
      assert.equal(productMoment(center,B[i][j]),16n*Rij);
      if (i === j) traceJ += M2ij + 8n*Rij + 16n*Tij;
    }
  }
  const variance = productMoment(center,center);
  assert.equal(variance,2n*traceJ);
  return {u,delta:2n*variance,firstContentForHofVEqualsV:2n*productMoment(P[0],A)};
}

// Real coefficient matrices for twice the correlated demonstration cubic.
const example = audit([
  matrix([[1,0],[0,1]]),
  matrix([[1,0],[0,-1]]),
  matrix([[0,1],[1,0]])
]);
assert.deepEqual(example, {u:12n,delta:1664n,firstContentForHofVEqualsV:96n});
const extra = audit([
  matrix([[4,2],[2,0]]),
  matrix([[0,0],[0,2]]),
  matrix([[2,-2],[-2,0]])
]);

console.log(JSON.stringify({
  status:'C PASS',
  sphereDimensions:sphereChecks,
  tests:'gamma and sphere identities, trace obstruction, real matrix moments, two polynomial profiles, arithmetic constants',
  correlatedExample:{u:3,delta:104,contentHofVEqualsV:12},
  extraMatrixAudit:extra
}, (_,value) => typeof value === 'bigint' ? value.toString() : value, 2));
