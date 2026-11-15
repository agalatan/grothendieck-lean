// Intended path: handoff/codex-c7e2-round2/variational/check_taylor_constants.mjs
// Agent-ID: codex-c7e2. Exact arithmetic checks supporting TAYLOR_REMOTE_BASE.md.
import assert from 'node:assert/strict';

// C^4 = 52^4 * 5 * (3/2)^10 < 215^4.
const c4Numerator=52n**4n*5n*3n**10n;
const c4Denominator=2n**10n;
assert(c4Numerator < 215n**4n*c4Denominator);

// e^3 exceeds 20 using the positive series through degree 8.
let factorial=1n;
for(let k=1n;k<=8n;k++)factorial*=k;
let sumNumerator=0n;
let runningFactorial=1n;
for(let k=0n;k<=8n;k++){
  if(k>0n)runningFactorial*=k;
  sumNumerator+=3n**k*(factorial/runningFactorial);
}
assert(sumNumerator>20n*factorial);
assert(256n<13n*20n);

// E(1+Exp(1))^4 = sum binomial(4,j) j! = 65.
assert(1n+4n+12n+24n+24n===65n);
// 2[(1+t)^3-B(t)^2] has nonnegative coefficients [0,2,7,1].
assert.deepEqual([2n-2n,6n-4n,6n+1n,2n-1n],[0n,2n,7n,1n]);
console.log(JSON.stringify({agent_id:'codex-c7e2',status:'PASS',single_norm_constant:215,paired_constant:430,
  c4_reserve_numerator:String(215n**4n*c4Denominator-c4Numerator),
  exp_series_reserve_numerator:String(sumNumerator-20n*factorial)}));
