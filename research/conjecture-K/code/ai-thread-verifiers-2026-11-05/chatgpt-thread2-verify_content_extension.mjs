
// verify_content_extension.mjs
// Node.js 20+. No dependencies.
import assert from "node:assert/strict";

const U = 1n << 56n;
const max = (a, b) => a > b ? a : b;
const abs = x => x < 0n ? -x : x;
const floor = (n, d) =>
  n < 0n ? -((-n + d - 1n) / d) : n / d;
const ceil = (n, d) => -floor(-n, d);
const mulLo = (x, y) => floor(x * y, U);
const mulHi = (x, y) => ceil(x * y, U);
const ratLo = (n, d) => floor(BigInt(n) * U, BigInt(d));
const ratHi = (n, d) => ceil(BigInt(n) * U, BigInt(d));

// Outward bounds for exp(-x), 0 <= x <= 25.
// Divide x by 64, use alternating Taylor bounds, square six times.
function expMinus(x) {
  assert(x >= 0n && x <= 25n * U);
  let tLo = U, tHi = U, sLo = U, sHi = U, lo = 0n;
  for (let k = 1n; k <= 14n; k++) {
    tLo = floor(tLo * x, 64n * U * k);
    tHi = ceil(tHi * x, 64n * U * k);
    if (k % 2n) {
      sLo -= tHi;
      sHi -= tLo;
    } else {
      sLo += tLo;
      sHi += tHi;
    }
    if (k === 13n) lo = sLo;
  }
  let hi = sHi;
  assert(lo > 0n);
  for (let j = 0; j < 6; j++) {
    lo = mulLo(lo, lo);
    hi = mulHi(hi, hi);
  }
  return [lo, hi];
}

function projectedEnvelope(
  k,
  a = ratLo(5592, 10000),
  b = ratLo(1432, 10000)
) {
  const n = 512n;
  const radial = [];
  for (let j = 0n; j < 4n * n; j++) {
    const l = j * U / n;
    const r = (j + 1n) * U / n;
    const l2 = l * l / U;
    const r2 = r * r / U;
    radial.push({ r, l2, r2, exp: expMinus(l2)[1] });
  }

  let sum = 0n;
  for (const y of radial) {
    let height = 0n;
    for (const x of radial) {
      const den =
        a + mulLo(b, y.l2 + 3n * x.l2) - mulHi(2n * k, x.r);
      assert(den > 0n);
      const q = max(
        abs(x.l2 + y.l2 - U),
        abs(x.r2 + y.r2 - U)
      );
      height = max(
        height,
        ceil(mulHi(x.exp, y.exp) * q * q, U * den)
      );
    }
    sum += height;
  }
  return ceil(sum, n) + ceil(U, 100000n);
}

const knots = [0n, 5n, 10n, 20n, 30n, 40n, 42n];
const A = ratHi(1062, 1000);
const B = ratHi(220, 1000);
const C = 3n * U;
const bounds = [];

for (const k of knots) {
  const cap = projectedEnvelope(ratHi(k, 100));
  bounds.push(cap);
  console.log(`P(${k}/100) <= ${cap}/${U}`);
}

// Check that 1.062 + .220 k + 3 k^2 dominates every chord.
// Lower-rounded polynomial coefficients make this check conservative.
for (let i = 1; i < knots.length; i++) {
  const l = knots[i - 1], r = knots[i], d = r - l;
  const v = bounds[i - 1], dv = bounds[i] - v;
  const a = C * d;
  const b = ratLo(220, 1000) * d - 100n * dv;
  const c = (ratLo(1062, 1000) - v) * d + dv * l;
  const at = k => a * k * k + 100n * b * k + 10000n * c;

  assert(at(l) >= 0n && at(r) >= 0n);
  if (2n * a * l < -100n * b && -100n * b < 2n * a * r) {
    assert(4n * a * c >= b * b);
  }
}

// sqrt(w) < .107, w <= .0113.
// sqrt(pi)>1.77, sqrt(pi)<1.773, e>8/3.
const rho = ratHi(107, 1000);
const w = ratHi(113, 10000);
const k0 = ratLo(42, 100);
const exponent = floor(k0 * k0 * U, rho * rho);
const tail = ceil(
  4n * 1773n * 3n * U * expMinus(exponent)[1],
  1000n * 8n * rho
);
const cost =
  A +
  ceil(2n * B * rho * 100n, 531n * U) +
  ceil(C * w, 4n * U) +
  tail;

assert(cost + ratHi(24, 100) < ratLo(2500, 1891));
console.log(`A cost <= ${cost}/${U}`);
console.log("PASS: shell penalty 0.24");

// Polynomial certificate for the tensor constant .481.
// x=h/(1-h), z=2v-1, on the unit square.
const polynomial = terms =>
  new Map(terms.map(([i, j, c]) => [`${i},${j}`, BigInt(c)]));

const add = (...ps) => {
  const out = new Map();
  for (const p of ps) {
    for (const [ij, c] of p) out.set(ij, (out.get(ij) || 0n) + c);
  }
  return out;
};

const scale = (p, c) =>
  new Map([...p].map(([ij, a]) => [ij, a * BigInt(c)]));

function product(a, b) {
  const out = new Map();
  for (const [ij, c] of a) {
    for (const [kl, d] of b) {
      const [i, j] = ij.split(",").map(Number);
      const [k, l] = kl.split(",").map(Number);
      const key = `${i + k},${j + l}`;
      out.set(key, (out.get(key) || 0n) + c * d);
    }
  }
  return out;
}

function power(p, n) {
  let a = polynomial([[0, 0, 1]]);
  for (let i = 0; i < n; i++) a = product(a, p);
  return a;
}

const h = polynomial([[1, 0, 1]]);
const b = polynomial([[0, 0, 1], [1, 0, -1]]);
const z = polynomial([[0, 1, 2], [0, 0, -1]]);

const K = add(
  scale(power(h, 4), 168),
  scale(product(power(h, 2), power(b, 2)), 40),
  scale(product(product(h, power(b, 3)), z), 16),
  scale(power(b, 4), 4),
  scale(product(power(b, 4), power(z, 2)), 12)
);
const M = add(
  scale(power(h, 3), 32),
  scale(product(h, power(b, 2)), 6),
  scale(product(power(b, 3), z), 4)
);
const cert = add(
  scale(power(K, 3), 481n ** 2n),
  scale(power(M, 4), -1000000)
);

function choose(n, k) {
  if (k < 0 || k > n) return 0n;
  let r = 1n;
  for (let i = 1; i <= k; i++) {
    r = r * BigInt(n - i + 1) / BigInt(i);
  }
  return r;
}

const gcd = (a, b) => b === 0n ? a : gcd(b, a % b);
const lcm = (a, b) => a / gcd(a, b) * b;
const nx = 12, ny = 6;
const common =
  Array.from({ length: nx + 1 }, (_, i) => choose(nx, i))
    .reduce(lcm, 1n) *
  Array.from({ length: ny + 1 }, (_, j) => choose(ny, j))
    .reduce(lcm, 1n);

// Power-to-Bernstein conversion, with a common integer denominator.
const bern = Array.from({ length: nx + 1 }, (_, i) =>
  Array.from({ length: ny + 1 }, (_, j) => {
    let s = 0n;
    for (const [ij, a] of cert) {
      const [k, l] = ij.split(",").map(Number);
      if (k <= i && l <= j) {
        const d = choose(nx, k) * choose(ny, l);
        assert(common % d === 0n);
        s += a * choose(i, k) * choose(j, l) * (common / d);
      }
    }
    return s;
  })
);

// Exact subdivision at 1/2.
// Both children retain one common positive scaling factor.
function splitLine(a) {
  const n = a.length - 1;
  const left = [], right = [];
  let row = a;
  for (let j = 0; j <= n; j++) {
    left.push(row[0] << BigInt(n - j));
    right.push(row[row.length - 1] << BigInt(n - j));
    row = row.slice(0, -1).map((x, i) => x + row[i + 1]);
  }
  return [left, right.reverse()];
}

function splitBox(a, axis) {
  const out = Array.from({ length: 2 }, () =>
    Array.from({ length: nx + 1 }, () => Array(ny + 1))
  );
  if (axis === 0) {
    for (let j = 0; j <= ny; j++) {
      const sides = splitLine(a.map(row => row[j]));
      for (let k = 0; k < 2; k++) {
        for (let i = 0; i <= nx; i++) out[k][i][j] = sides[k][i];
      }
    }
  } else {
    for (let i = 0; i <= nx; i++) {
      const sides = splitLine(a[i]);
      out[0][i] = sides[0];
      out[1][i] = sides[1];
    }
  }
  return out;
}

let boxes = 0, depthMax = 0;
const stack = [{ coeff: bern, depth: 0 }];
while (stack.length) {
  const { coeff, depth } = stack.pop();
  depthMax = Math.max(depthMax, depth);
  if (coeff.every(row => row.every(c => c >= 0n))) {
    boxes++;
    continue;
  }
  assert(depth < 40, "Uncertified Bernstein box");
  for (const child of splitBox(coeff, depth % 2)) {
    stack.push({ coeff: child, depth: depth + 1 });
  }
}
console.log(
  `PASS: tensor constant .481; ${boxes} boxes; depth <= ${depthMax}`
);

// Exact lower example: c=8/5, three unit eigenvalues.
const an = 21484n, ad = 125n;
const kn = 973128n, kd = 625n;
assert(
  an ** 4n * kd ** 3n * 10000n ** 2n >
  4808n ** 2n * ad ** 4n * kn ** 3n
);
console.log("PASS: tensor ratio > .4808 > .4775");

// Vanishing cubic tensor, nonzero fifth tensor.
const factorial = n => {
  let v = 1n;
  for (let j = 2; j <= n; j++) v *= BigInt(j);
  return v;
};

function gammaCentered(shape, k) {
  let v = 0n;
  for (let j = 0; j <= k; j++) {
    v +=
      choose(k, j) *
      BigInt(-shape) ** BigInt(k - j) *
      factorial(shape + j - 1) / factorial(shape - 1);
  }
  return v;
}

// Returns 2^k E[S^r (-(S-2)/2 + P)^k],
// S~Exp(1), P~Gamma(4,1)-4, independently.
function centeredMoment(r, k) {
  let total = 0n;
  for (let j = 0; j <= k; j++) {
    let sj = 0n;
    for (let z = 0; z <= j; z++) {
      sj += choose(j, z) * (-2n) ** BigInt(j - z) * factorial(r + z);
    }
    total +=
      choose(k, j) *
      (-1n) ** BigInt(j) *
      2n ** BigInt(k - j) *
      sj *
      gammaCentered(4, k - j);
  }
  return total;
}

assert.equal(centeredMoment(1, 1), 0n);
assert.equal(centeredMoment(1, 2), 18n);   // variance 9/2
assert.equal(centeredMoment(2, 3), 0n);    // cubic tensor
assert.equal(centeredMoment(2, 4), 2736n); // fourth moment 171
assert.equal(centeredMoment(3, 5), -243n * 32n);
console.log("PASS: cubic tensor zero; fifth tensor -243");