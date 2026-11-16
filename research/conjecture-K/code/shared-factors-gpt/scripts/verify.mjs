// scripts/verify.mjs
import fs from 'node:fs';
import assert from 'node:assert/strict';

const complex = x => [BigInt(x), 0n];
const cadd = ([a, b], [c, d]) => [a + c, b + d];
const cmul = ([a, b], [c, d]) => [a * c - b * d, a * d + b * c];
const cscale = ([a, b], k) => [a * k, b * k];
const csum = xs => xs.reduce(cadd, complex(0));
const real = ([a, b]) => {
  assert.equal(b, 0n);
  return a;
};
const factorial = n => {
  let f = 1n;
  for (let j = 2n; j <= BigInt(n); j++) f *= j;
  return f;
};
const nsum = xs => xs.reduce((a, b) => a + b, 0n);
const transposeMul = (A, B) => A.map(row => B[0].map((_, j) =>
  csum(row.map((value, k) => cmul(value, B[k][j])))));
const trace = A => real(csum(A.map((row, i) => row[i])));
const jordan = (A, B) => {
  const AB = transposeMul(A, B);
  const BA = transposeMul(B, A);
  return AB.map((row, i) => row.map((value, j) => cadd(value, BA[i][j]).map(x => {
    assert.equal(x % 2n, 0n);
    return x / 2n;
  })));
};
const zeroKey = n => '0'.repeat(2 * n);
function quadratic(A, centered) {
  const n = A.length;
  const terms = new Map();
  if (centered) terms.set(zeroKey(n), complex(-trace(A)));
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n; j++) {
      const powers = Array(2 * n).fill(0);
      powers[i] = 1;
      powers[n + j] = 1;
      terms.set(powers.join(''), A[i][j]);
    }
  }
  return terms;
}
function addPolynomials(...ps) {
  const out = new Map();
  for (const p of ps) {
    for (const [key, value] of p) out.set(key, cadd(out.get(key) ?? complex(0), value));
  }
  return out;
}
function scalePolynomial(p, scalar) {
  return new Map([...p].map(([key, val]) => [key, cscale(val, scalar)]));
}
function multiply(p, q) {
  const out = new Map();
  for (const [kp, vp] of p) {
    for (const [kq, vq] of q) {
      const key = [...kp].map((power, i) => Number(power) + Number(kq[i])).join('');
      const val = cmul(vp, vq);
      out.set(key, cadd(out.get(key) ?? complex(0), val));
    }
  }
  return out;
}
function moment(p) {
  const terms = [];
  for (const [key, coefficient] of p) {
    const n = key.length / 2;
    if (key.slice(0, n) !== key.slice(n)) continue;
    const weight = [...key.slice(0, n)].reduce((acc, pow) => acc * factorial(Number(pow)), 1n);
    terms.push(cscale(coefficient, weight));
  }
  return real(csum(terms));
}
const prodMoment = (...ps) => moment(ps.reduce(multiply));
function auditMatrices(H) {
  const indices = H.map((_, i) => i);
  const S = H.map(A => H.map(B => jordan(A, B)));
  const B = S.map(row => row.map(A => quadratic(A, false)));
  const P = H.map(A => quadratic(A, true));
  const A = addPolynomials(...P.map(p => multiply(p, p)));
  const u = moment(A);
  const centered = addPolynomials(A, new Map([[zeroKey(H[0].length), complex(-u)]]));
  const Jdiag = i => nsum(indices.map(j =>
    trace(S[i][j]) ** 2n +
    trace(transposeMul(S[i][i], S[j][j])) +
    2n * trace(transposeMul(S[i][j], S[i][j]))));
  const v = indices.map(i => nsum(indices.map(j => trace(transposeMul(H[i], S[j][j])))));
  assert.equal(prodMoment(centered, centered), 2n * nsum(indices.map(Jdiag)), 'Var A');
  for (const i of indices) {
    const BP = addPolynomials(...indices.map(j => multiply(B[i][j], P[j])));
    assert.equal(prodMoment(centered, P[i]), 2n * v[i], 'E[P(A-u)]');
    assert.equal(moment(BP), v[i], 'E[BP]');
    const numerator = addPolynomials(multiply(P[i], centered), scalePolynomial(BP, 2n));
    assert.equal(moment(numerator), 2n * prodMoment(P[i], A), 'h(v)=v');
    assert.equal(4n * prodMoment(numerator, A) + 2n * u * moment(numerator),
      6n * prodMoment(P[i], A, A), 'h(v)=v^2');
    for (const j of indices) {
      const Tij = nsum(indices.map(k => trace(transposeMul(S[k][i], S[k][j]))));
      const Rij = nsum(indices.map(k => trace(transposeMul(S[k][k], S[i][j]))));
      const gramSquare = nsum(indices.map(k => trace(S[i][k]) * trace(S[k][j])));
      assert.equal(nsum(indices.map(k => prodMoment(B[i][k], B[k][j]))),
        gramSquare + Tij, 'E[B^2]');
      assert.equal(prodMoment(centered, B[i][j]), 2n * Rij, 'E[B(A-u)]');
    }
  }
  return { factors: H.length, dimension: H[0].length, varianceOfConditionalVariance: String(2n * nsum(indices.map(Jdiag))) };
}
const castMatrix = rows => rows.map(row => row.map(x => Array.isArray(x) ? x.map(BigInt) : complex(x)));
const noncommuting = [
  [[4, [2, 2]], [[2, -2], 2]],
  [[0, [0, -2]], [[0, 2], 0]],
  [[2, 2], [2, -2]]
].map(castMatrix);
assert.notDeepEqual(transposeMul(noncommuting[0], noncommuting[1]),
  transposeMul(noncommuting[1], noncommuting[0]));
const moments = [auditMatrices(noncommuting),
  auditMatrices([[[2, 0], [0, 4]], [[0, 0], [0, 2]]].map(castMatrix))];

const add = ([a, b], [c, d]) => [a * d + b * c, b * d];
const sub = (a, [c, d]) => add(a, [-c, d]);
const mul = ([a, b], [c, d]) => [a * c, b * d];
const less = ([a, b], [c, d]) => a * d < b * c;
const eq = ([a, b], [c, d]) => a * d === b * c;
const frac = (a, b = 1) => [BigInt(a), BigInt(b)];
const decimal = s => {
  const [numerator, rest] = s.split('.');
  return [BigInt(numerator + rest), 10n ** BigInt(rest.length)];
};

const room = sub(frac(500, 701), mul(frac(81, 100), mul(frac(9359, 10000), frac(9359, 10000))));
assert(eq(room, frac(26502185939n, 7010000000000n)));
assert(less(frac(0), room));

const boundE = add(Array.from({length: 6}, (_, i) => frac(1, factorial(i))).reduce(add),
  frac(7, 4320));
assert(less(boundE, frac(68, 25)));
assert(less(mul(frac(68, 25), frac(68, 25)), frac(200, 27)));
const theta = n => mul(frac(1, 3), add(frac(23, 50), mul(frac(1, n), sub(frac(5), frac(23, 50)))));
assert(eq(theta(7), frac(194, 525)));
assert(less(theta(7), frac(37, 100)));
assert(eq(theta(8), frac(137, 400)));
assert(less(theta(8), frac(7, 20)));

const poly = x => 22n*x**3n + 11n*x*x - 1389n*x - 200n;
const shifted = [poly(8n), 66n*8n**2n + 22n*8n - 1389n, 66n*8n + 11n, 22n];
assert(shifted.every(x => x > 0n));
assert(eq(mul(frac(1, 3), add(frac(1), frac(114, 1096))), frac(605, 1644)));

assert(less(frac(30), mul(frac(11, 2), frac(11, 2))));
assert(less(frac(3, 8), mul(frac(49, 80), frac(49, 80))));
assert(less(mul(frac(28), mul(frac(3, 8), frac(49, 80))), frac(13, 2)));
assert(less(frac(9, 2), mul(frac(9, 4), frac(9, 4))));
assert(eq(mul(frac(64), mul(frac(3, 8), mul(frac(3, 8), frac(3, 8)))), frac(27, 8)));

const rows = JSON.parse(fs.readFileSync(new URL('../rows.json', import.meta.url), 'utf8'));
for (const row of rows) {
  const ell = decimal(row.l);
  const beta = decimal(row.beta);
  const nu = decimal(row.nu5);
  const b = mul(frac(-1), decimal(row.bA));
  const cUpper = mul(frac(-1), decimal(row.bB));
  const d = sub(frac(1), b);
  const p0Lower = sub(ell, mul(frac(2), beta));
  const p0Upper = add(p0Lower, mul(frac(7, 4), nu));
  const p1Lower = sub(beta, mul(frac(7, 4), nu));
  assert(less(frac(1, 2), p0Lower) && less(p0Upper, frac(1)), 'p0');
  assert(less(frac(1, 10), p1Lower) && less(frac(0), nu), 'p1,p2');
  assert(less(frac(47, 50), d) && less(frac(0), cUpper) && less(cUpper, b), 'denominator coefficients');
  assert(less(add(b, cUpper), frac(9, 100)), 'b+c');
}
console.log(JSON.stringify({
  status: 'C PASS',
  momentInstances: moments,
  radiusRoomAt81Over100: '26502185939/7010000000000',
  rankOneBounds: { seven: '194/525', eight: '137/400' },
  basisBoundAtDimensionEight: '605/1644',
  basisShiftedPolynomial: shifted.map(String),
  verifiedProfileRows: rows.length,
  arithmetic: 'Gaussian integers, integers and rational comparisons'
}, null, 2));
