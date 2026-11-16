// phase_content/phase_split.mjs
// Exact phase split and certified rational upper bounds for rational Wick tensors.
import fs from 'node:fs';
import assert from 'node:assert/strict';
const gcd=(a,b)=>{a=a<0n?-a:a;b=b<0n?-b:b;while(b)[a,b]=[b,a%b];return a;};
const Q=(a,b=1n)=>{a=BigInt(a);b=BigInt(b);assert(b!==0n);if(b<0n){a=-a;b=-b;}const d=gcd(a,b);return[a/d,b/d];};
const parse=s=>{const [a,b='1']=String(s).split('/');return Q(a,b);};
const plus=(x,y)=>Q(x[0]*y[1]+y[0]*x[1],x[1]*y[1]);
const times=(x,y)=>Q(x[0]*y[0],x[1]*y[1]);
const square=x=>times(x,x);
const frac=x=>x[0].toString()+'/'+x[1].toString();
const le=(x,y)=>x[0]*y[1]<=y[0]*x[1];
const zero=Q(0);
function isqrt(n){assert(n>=0n);if(n<2n)return n;let x=1n<<BigInt(Math.ceil(n.toString(2).length/2));while(true){const y=(x+n/x)/2n;if(y>=x)return x;x=y;}}
function sqrtUpper(q){assert(q[0]>=0n);const scale=10n**12n,N=q[0]*scale*scale;let j=isqrt(N/q[1]);if(j*j*q[1]<N)j++;const answer=Q(j,scale);assert(le(q,square(answer)));return answer;}
const input=JSON.parse(fs.readFileSync(process.argv[2],'utf8'));
const {n,modulus:M,weights:w,terms}=input;
assert(Number.isSafeInteger(n)&&n>=1&&n<=1000);
assert(Number.isSafeInteger(M)&&M>=2&&M<=10**9);
assert(w.length===n&&w.every(x=>Number.isSafeInteger(x)&&x>0&&x<M));
const resonant=new Set([...w,...w.map(x=>M-x)]);
const merged=new Map;
for(const term of terms){let {i,j,k,re='0',im='0'}=term;assert([i,j,k].every(x=>Number.isInteger(x)&&x>=0&&x<n));if(i>j)[i,j]=[j,i];const key=[i,j,k].join(',');const old=merged.get(key)||{i,j,k,re:zero,im:zero};old.re=plus(old.re,parse(re));old.im=plus(old.im,parse(im));merged.set(key,old);}
let u0=zero,vProtected=zero,vResonant=zero;const rows=[];
for(const term of merged.values()){const{i,j,k,re,im}=term,charge=((w[i]+w[j]-w[k])%M+M)%M,energy=times(Q(i===j?2:1),plus(square(re),square(im)));let type;if(charge===0){type='invariant';u0=plus(u0,energy);}else if(resonant.has(charge)){type='resonant';vResonant=plus(vResonant,energy);}else{type='protected';vProtected=plus(vProtected,energy);}rows.push({i,j,k,charge,type,energy:frac(energy)});}
const v=plus(vProtected,vResonant),linear=sqrtUpper(times(Q(3,2),vResonant)),remainder=times(sqrtUpper(Q(11)),v),contentSquared=square(plus(linear,remainder)),eta=plus(Q(9,25000000),times(Q(189100,59009),contentSquared));
const output={status:'P+C consumer of PROOFS.md (4.4), ledger 3.3, 3.4, 11.30, 11.40',n,modulus:M,weights:w,energyInvariant:frac(u0),energyProtected:frac(vProtected),energyResonant:frac(vResonant),energyTotal:frac(plus(u0,v)),contentSquaredUpper:frac(contentSquared),retainedASectorExcessUpper:frac(eta),below_11e_minus6:le(eta,Q(11,1000000)),rows,passed:true};
process.stdout.write(JSON.stringify(output,null,2)+'\n');
