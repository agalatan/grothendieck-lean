// verify_gaussian_factor_content.mjs  (as posted by the fresh ChatGPT thread, 5 Nov 2026; Node >= 20)
import assert from 'node:assert/strict';

const S = 1n << 56n;
const floor = (n, d) => n < 0n ? -((-n + d - 1n) / d) : n / d;
const ceil = (n, d) => -floor(-n, d);
const mulLo = (a, b) => floor(a * b, S);
const mulHi = (a, b) => ceil(a * b, S);

function expBounds(x) {
  assert(x >= 0n && x <= 25n * S);
  let l = S, h = S, L = S, H = S, bottom = 0n;
  for (let k = 1n; k <= 14n; k++) {
    l = floor(l * x, 64n * S * k);
    h = ceil(h * x, 64n * S * k);
    if (k % 2n) { L -= h; H -= l; } else { L += l; H += h; }
    if (k === 13n) bottom = L;
  }
  assert(bottom > 0n);
  for (let j = 0; j < 6; j++) { bottom = mulLo(bottom, bottom); H = mulHi(H, H); }
  return [bottom, H];
}

const aL = floor(699n * S, 1250n);
const aH = ceil(699n * S, 1250n);
const bL = floor(179n * S, 1250n);
const bH = ceil(179n * S, 1250n);
const N = 16384n;

function values(j) {
  const x = j * S / N;
  assert(x * x % S === 0n);
  const t = mulLo(x, x);
  const fL = aL + mulLo(bL, t);
  const fH = aH + mulHi(bH, t);
  const dL = aL + 3n * mulLo(bL, t);
  const dH = aH + 3n * mulHi(bH, t);
  const hL = S + floor(bL * S, fH) + floor(3n * bL * S, dH);
  const hH = S + ceil(bH * S, fL) + ceil(3n * bH * S, dL);
  const denL = 2n * mulLo(mulLo(fL, fL), dL);
  const denH = 2n * mulHi(mulHi(fH, fH), dH);
  const [eL, eH] = expBounds(t);
  return { t, jL: floor(mulLo(eL, hL) * S, denH), jH: ceil(mulHi(eH, hH) * S, denL), iH: ceil(eH * S, denL) };
}

let prev = values(0n);
let qLower = 0n;
let aUpper = 0n;
for (let j = 0n; j < 5n * N; j++) {
  const next = values(j + 1n);
  const c = S - prev.t;
  qLower += next.jL;
  aUpper += prev.iH + mulHi(c, c >= 0n ? prev.jH : next.jL);
  prev = next;
}
qLower = floor(qLower, N);
aUpper = ceil(aUpper, N);
assert(qLower > ceil(167n * S, 50n));
assert(aUpper < floor(108n * S, 25n));
assert(2n * 108n ** 2n * 50n * 5n < 56n * 25n ** 2n * 167n);
console.log(`Q(0) >= ${qLower}/${S} > 167/50`);
console.log(`A'(0) <= ${aUpper}/${S} < 108/25`);
console.log("PASS: 2 A'(0)^2 / Q(0) < 56/5");
