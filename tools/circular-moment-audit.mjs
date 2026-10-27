// tools/circular-moment-audit.mjs
// Agent-ID: codex-8785
// Exact arithmetic diagnostics for the Wick-cubic extremizer and the existing cover.
// This does not replace the analytic or Lean proofs.

import { readFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';

const coverUrl = new URL('../data/lower-unshifted/cover.json', import.meta.url);
const cover = JSON.parse(readFileSync(fileURLToPath(coverUrl), 'utf8'));

function factorial(n) {
  let result = 1n;
  for (let i = 2n; i <= n; i++) result *= i;
  return result;
}

function choose(n, k) {
  return factorial(n) / (factorial(k) * factorial(n - k));
}

// For H=Z(|Z|²−2)/sqrt(2), T=|Z|² is Exp(1).
function wickMoment(m) {
  let numerator = 0n;
  for (let k = 0n; k <= 2n * m; k++) {
    numerator += choose(2n * m, k) * (-2n) ** (2n * m - k) * factorial(m + k);
  }
  const denominator = 2n ** m;
  if (numerator % denominator !== 0n) throw new Error('Unexpected nonintegral moment');
  return numerator / denominator;
}

function fraction(value) {
  const [numerator, denominator = '1'] = value.split('/');
  const pair = [BigInt(numerator), BigInt(denominator)];
  if (pair[1] <= 0n) throw new Error(`Invalid denominator: ${value}`);
  return pair;
}

function compare([a, b], [c, d]) {
  const difference = a * d - c * b;
  return difference < 0n ? -1 : difference > 0n ? 1 : 0;
}

// Compare a rational x with sqrt(42) without rounding the irrational cutoff.
function compareToSqrt42([numerator, denominator]) {
  if (numerator < 0n) return -1;
  return compare([numerator * numerator, denominator * denominator], [42n, 1n]);
}

const target = [35671n, 50000n]; // 0.71342
let excluded = 0;
let crossing = 0;
let crossingBlocked = 0;
let blocked = 0;
let excludedBlocked = 0;
let maximum = null;
let retainedMaximum = null;

for (const box of cover.boxes) {
  const lo = fraction(box.bounds[4]);
  const hi = fraction(box.bounds[5]);
  const upper = fraction(box.upper);
  const isBlocked = compare(upper, target) > 0;
  if (isBlocked) blocked++;
  if (maximum === null || compare(upper, maximum) > 0) maximum = upper;
  if (compareToSqrt42(lo) >= 0) {
    excluded++;
    if (isBlocked) excludedBlocked++;
  } else {
    if (compareToSqrt42(hi) > 0) {
      crossing++;
      if (isBlocked) crossingBlocked++;
    }
    if (retainedMaximum === null || compare(upper, retainedMaximum) > 0) retainedMaximum = upper;
  }
}

const moments = [1n, 2n, 3n].map(wickMoment);
if (moments[0] !== 1n || moments[1] !== 44n || moments[2] !== 11352n) {
  throw new Error('Wick-cubic moment calculation failed');
}

console.log(`Wick-cubic moments E|H|², E|H|⁴, E|H|⁶: ${moments.join(', ')}`);
console.log(`Cover: ${cover.boxes.length} boxes; ${excluded} above sqrt(42); ${crossing} cross it`);
console.log(`Boxes above 0.71342: ${blocked}; excluded: ${excludedBlocked}; crossing: ${crossingBlocked}`);
console.log(`The original maximum remains in the retained region: ${compare(maximum, retainedMaximum) === 0}`);
