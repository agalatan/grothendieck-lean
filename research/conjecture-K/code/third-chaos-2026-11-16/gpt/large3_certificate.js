// Intended filepath: /workspace/scratch/3efc7fe714fa/large3_certificate.js
'use strict';

// Exact rational certificate for the dimension-free kappa_4 >= 88 argument.
function gcd(a, b) { a = a < 0n ? -a : a; while (b) [a, b] = [b, a % b]; return a; }
function rat(n, d = 1n) {
  n = BigInt(n); d = BigInt(d);
  if (!d) throw new Error('Zero denominator');
  if (d < 0n) { n = -n; d = -d; }
  const g = gcd(n, d); return [n / g, d / g];
}
function add([a,b],[c,d]) { return rat(a*d+c*b,b*d); }
function mul([a,b],[c,d]) { return rat(a*c,b*d); }
function square(x) { return mul(x,x); }
function lt([a,b],[c,d]) { return a*d<c*b; }
function equal([a,b],[c,d]) { return a*d===c*b; }
function assert(value, message) { if (!value) throw new Error(message); console.log(`PASS ${message}`); }

assert(lt(square(rat(293,300)),rat(43,45)), 'v > 193/200 from delta >= 88');
assert(equal(add(rat(-1,2),mul(rat(3,2),rat(293,300))),rat(193,200)), 'variance threshold arithmetic');
assert(lt(rat(25,8),rat(223,71)), 'classical lower bound pi > 223/71 implies c < 4/5');
assert(lt(rat(1),mul(rat(6),square(rat(4083,10000)))), '1/sqrt(6) < 4083/10000');
let term=rat(1), exponentialTaylor=term;
for(let k=1;k<=8;k++) { term=mul(term,rat(3,k)); exponentialTaylor=add(exponentialTaylor,term); }
assert(lt(rat(20),exponentialTaylor), 'positive Taylor sum gives exp(3) > 20');
assert(lt(rat(1,20),square(rat(28,125))), '1/sqrt(20) < 28/125');
const m3Upper=mul(mul(rat(4,5),rat(4083,10000)),add(rat(1),mul(rat(4),rat(28,125))));
assert(lt(m3Upper,rat(31,50)), 'exact Hermite L1 ratio is below 31/50');
assert(lt(rat(193,200),square(rat(983,1000))), 'sqrt(193/200) < 983/1000');
assert(lt(rat(7,200),square(rat(1871,10000))), 'sqrt(7/200) < 1871/10000');
assert(equal(add(mul(rat(31,50),rat(983,1000)),rat(1871,10000)),rat(9957,12500)), 'L1 upper certificate equals 9957/12500');
assert(lt(square(rat(9957,12500)),rat(7,11)), 'upper certificate < sqrt(7/11) < sqrt(2/pi)');
console.log('All large-cumulant rational checks passed. Classical 223/71 < pi < 22/7 is assumed.');
