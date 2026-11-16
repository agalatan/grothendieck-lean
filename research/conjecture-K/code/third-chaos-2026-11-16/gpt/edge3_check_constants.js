// Intended filepath: /workspace/scratch/3efc7fe714fa/edge3_check_constants.js
'use strict';

const assert = require('node:assert/strict');
const binomial = (n, k) => {
  let value = 1n;
  for (let j = 1; j <= k; j++) value = value * BigInt(n - j + 1) / BigInt(j);
  return value;
};

// E|Z|^k = even[k] + odd[k] * sqrt(2/pi).
const moments = [[1n, 0n], [0n, 1n]];
for (let k = 2; k <= 9; k++) {
  moments[k] = moments[k - 2].map(value => BigInt(k - 1) * value);
}
const weightedMoments = [];
for (let d = 0; d <= 9; d++) {
  weightedMoments[d] = [0n, 0n];
  for (let k = 0; k <= d; k++) {
    for (let parity = 0; parity < 2; parity++) {
      weightedMoments[d][parity] += binomial(d, k) * moments[k][parity];
    }
  }
}
const expected = {
  5: [26n, 33n], 6: [76n, 94n], 7: [232n, 293n],
  8: [764n, 952n], 9: [2620n, 3297n],
};
for (const [d, pair] of Object.entries(expected)) assert.deepEqual(weightedMoments[d], pair);

const upperM = d => weightedMoments[d][0] + weightedMoments[d][1];
const A5 = 1n + upperM(5) + 2n * upperM(6);
const D6 = 3n * upperM(7) ** 2n;
const A7 = 1n + upperM(7) + 2n * upperM(8);
const D8 = 3n * upperM(9) ** 2n;
assert.equal(A5, 400n);
assert.equal(D6, 826875n);
assert.equal(A7, 3958n);
assert.equal(D8, 105032667n);

const operatorConstant = 200n * A5 * 121n * D6 * A7 * (5n * 362881n) * D8;
const randomFactorConstant = 3n ** 10n * 4n ** 4n * 8n ** 8n;
const weightConstant = 72n ** 9n;
assert(17n ** 3n < 71n ** 2n); // 1+17^(3/2) < 72.
// 45 summands, factor 1/3 from Stein, and 2^(3/2)<3 from v<=2δ.
const remainderConstant = 45n * operatorConstant * randomFactorConstant * weightConstant;
assert(remainderConstant < 10n ** 64n);
// c*(485/2)/240 < 2, so the final fourth-cumulant expansion constant is <10^65.
assert(remainderConstant + 2n < 10n ** 65n);
// For δ<=10^-140, 10^65 sqrt(δ)<=10^-5<1/96<c/48 since c>1/2.
assert(96n < 100000n);

console.log(JSON.stringify({
  weightedMoments: Object.fromEntries(Object.keys(expected).map(d => [d, weightedMoments[d].map(String)])),
  A5: String(A5), D6: String(D6), A7: String(A7), D8: String(D8),
  operatorConstant: String(operatorConstant),
  randomFactorConstant: String(randomFactorConstant),
  weightConstant: String(weightConstant),
  remainderConstant: String(remainderConstant),
  remainderPower10: 64,
  totalErrorPower10: 65,
  delta0: '10^-140',
  status: 'all exact-integer checks passed'
}, null, 2));
