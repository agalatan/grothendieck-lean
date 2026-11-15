// codex-c7e2-round3/gaussian-core/check_weighted_polynomial.mjs; Agent-ID: codex-c7e2.
import assert from 'node:assert/strict';
const gcd = (a,b) => b ? gcd(b,a%b) : a;
const F = (a,b=1n) => { a=BigInt(a); b=BigInt(b); if(b<0n){a=-a;b=-b;} const g=gcd(a<0n?-a:a,b); return [a/g,b/g]; };
const add=(x,y)=>F(x[0]*y[1]+y[0]*x[1],x[1]*y[1]);
const sub=(x,y)=>F(x[0]*y[1]-y[0]*x[1],x[1]*y[1]);
const mul=(x,y)=>F(x[0]*y[0],x[1]*y[1]);
const lt=(x,y)=>x[0]*y[1]<y[0]*x[1];
const factorial=n=>{let p=1n;for(let j=2n;j<=n;j++)p*=j;return p;};
const m=16n;
const ratio=F(factorial(2n*m-4n),4n**(m-2n)*factorial(m-2n)*factorial(m-1n));
const CUpper=mul(F(22n*m**3n,7n),mul(ratio,ratio));
assert(lt(CUpper,F(32,25)));
const offset=add(F(1),F(3,8n*m));
const radicand=add(F(9,64n*m*m),F(9,4n*m));
const reserve=sub(F(7,5),offset);
assert(lt(F(0),reserve));
assert(lt(radicand,mul(reserve,reserve)));
assert.deepEqual(mul(F(32,25),mul(F(7,5),F(7,5))),F(1568,625));
// u>=1/25 and V<=1/126000 imply V u^(-3/2) C_m lambda_m^2 <1/400.
assert(lt(mul(F(125,126000),F(1568,625)),F(1,400)));
// The non-Gaussian normalized fourth excess for this conditional-Gaussian core.
assert.deepEqual(add(F(4,m),F(2,m*m)),F(33,128));
console.log(JSON.stringify({status:'PASS',m:16,C_bound:'32/25',lambda_bound:'7/5',weighted_bound:'1568/625',energy_cutoff:'1/126000',chi:'33/128'}));
