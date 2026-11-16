// phase_content/verify_exact.mjs
// Exact Gaussian polynomial certificates. Node.js >= 20; no dependencies.
import assert from 'node:assert/strict';
import fs from 'node:fs';
const addC=(a,b)=>[a[0]+b[0],a[1]+b[1]];
const mulC=(a,b)=>[a[0]*b[0]-a[1]*b[1],a[0]*b[1]+a[1]*b[0]];
const conjC=a=>[a[0],-a[1]];
const fact=n=>{let p=1n;for(let j=2;j<=n;j++)p*=BigInt(j);return p;};
function term(n,hol=[],anti=[],c=[1n,0n]){const a=Array(n).fill(0),b=Array(n).fill(0);for(const i of hol)a[i]++;for(const i of anti)b[i]++;return new Map([[JSON.stringify([a,b]),c]]);}
function add(...ps){const p=new Map();for(const q of ps)for(const[k,c]of q){const z=addC(p.get(k)||[0n,0n],c);if(z[0]||z[1])p.set(k,z);else p.delete(k);}return p;}
const scale=(p,s)=>new Map([...p].map(([k,c])=>[k,mulC(c,Array.isArray(s)?s:[s,0n])]));
function multiply(p,q){const out=new Map;for(const[k,c]of p){const[a,b]=JSON.parse(k);for(const[l,d]of q){const[x,y]=JSON.parse(l),key=JSON.stringify([a.map((v,i)=>v+x[i]),b.map((v,i)=>v+y[i])]);const z=addC(out.get(key)||[0n,0n],mulC(c,d));if(z[0]||z[1])out.set(key,z);else out.delete(key);}}return out;}
function conjugate(p){return new Map([...p].map(([k,c])=>{const[a,b]=JSON.parse(k);return[JSON.stringify([b,a]),conjC(c)];}));}
function derivative(p,kind,i){const out=new Map;for(const[k,c]of p){const ab=JSON.parse(k),m=ab[kind][i];if(!m)continue;ab[kind][i]--;out.set(JSON.stringify(ab),mulC(c,[BigInt(m),0n]));}return out;}
function expect(p){let out=[0n,0n];for(const[k,c]of p){const[a,b]=JSON.parse(k);if(a.some((v,i)=>v!==b[i]))continue;out=addC(out,mulC(c,[a.reduce((z,v)=>z*fact(v),1n),0n]));}return out;}
function realExpect(p){const[x,y]=expect(p);assert.equal(y,0n);return x;}
const abs2=p=>multiply(p,conjugate(p));
function moments(q,n){const u=realExpect(abs2(q)),m4=realExpect(abs2(multiply(q,q)));let A=new Map,B=new Map;
 for(let j=0;j<n;j++){const dz=derivative(q,0,j),db=derivative(q,1,j);A=add(A,abs2(dz),abs2(db));B=add(B,scale(multiply(dz,db),2n));}
 assert.equal(realExpect(A),3n*u);
 const centered=add(A,term(n,[],[],[-3n*u,0n]));
 const budget=2n*realExpect(multiply(centered,centered))+realExpect(abs2(B));
 return{u,m4,delta:m4-2n*u*u,budget};
}
function cycle(n){return add(...Array.from({length:n},(_,j)=>term(n,[j,j],[(j+1)%n])));}
function phaseCertificate(n,M,weights,triples){assert.equal(weights.length,n);assert(weights.every(x=>x%M!==0));for(const[i,j,k]of triples)assert.equal((weights[i]+weights[j]-weights[k]+M)%M,0);}
const report={status:'C: all comparisons and moments use integers or rational cross-products',cycles:[],phaseCounts:[],controls:[]};
for(let n=2;n<=12;n++){
 const M=2**n-1,w=Array.from({length:n},(_,j)=>2**j),triples=Array.from({length:n},(_,j)=>[j,j,(j+1)%n]);phaseCertificate(n,M,w,triples);
 const m=moments(cycle(n),n),N=BigInt(n);assert.equal(m.u,2n*N);assert.equal(m.delta,n===2?208n:72n*N);assert.equal(m.budget,5n*m.delta);report.cycles.push({n,M,weights:w,...m});
}
for(const n of[3,4,5,6,7]){const M=2**n-1,w=Array.from({length:n},(_,j)=>2**j),bad=new Set([...w,...w.map(x=>M-x)]);let invariant=0,protectedCount=0,resonant=0;const protectedTriples=[];
 for(let i=0;i<n;i++)for(let j=i;j<n;j++)for(let k=0;k<n;k++){const r=(w[i]+w[j]-w[k]+M)%M;if(r===0)invariant++;else if(bad.has(r))resonant++;else{protectedCount++;protectedTriples.push([i,j,k]);}}
 assert.equal(invariant,n);assert.equal(resonant,n*(n+2));assert.equal(protectedCount,n*(n-3)*(n+2)/2);report.phaseCounts.push({n,M,invariant,protectedCount,resonant,...(n===5?{protectedTriples}:{})});
}
const p=cycle(5),h=term(5,[0,2],[1]);
assert.equal(realExpect(abs2(h)),1n);assert.equal(realExpect(abs2(multiply(h,h))),8n);assert.equal(realExpect(abs2(multiply(multiply(h,h),h))),216n);
let h5=h;for(let j=1;j<5;j++)h5=multiply(h5,h);assert.equal(realExpect(abs2(h5)),1728000n);
assert.equal(realExpect(multiply(abs2(p),abs2(h))),36n);
for(const a of[0n,1n,2n])for(const z of[[0n,0n],[1n,0n],[0n,1n],[1n,2n]]){const v=z[0]*z[0]+z[1]*z[1],q=add(scale(p,a),scale(h,z)),m=moments(q,5);assert.equal(m.u,10n*a*a+v);assert.equal(m.delta,360n*a**4n+104n*a*a*v+6n*v*v);}
const W=new Set([1,2,4,8,16]),orders=[];for(let k=0;k<=5;k++){const chars=new Set;for(let a=0;a<=k;a++)chars.add(((2*a-k)*3%31+31)%31);orders.push({k,characters:[...chars],firstChaosResonance:[...chars].some(x=>W.has(x))});if(k<=4)assert(!orders[k].firstChaosResonance);}assert(orders[5].firstChaosResonance);report.fiveCycle={perturbation:[0,2,1],character:3,orders,u_h:1n,m4_h:8n,m6_h:216n,m10_h:1728000n,cross_moment:36n};
// Rejection controls: the Wick star has coordinate character 1; a false
// claim that its phase is invariant must be rejected by the same checker.
let rejected=false;try{phaseCertificate(1,31,[1],[[0,0,0]]);}catch{rejected=true;}assert(rejected);report.controls.push('rejected Wick-star zero-content certificate');
assert(W.has(1));assert(!W.has(3)&&!W.has(28));report.controls.push('distinguished resonant character 1 from protected character 3');
const star=add(term(1,[0,0],[0]),scale(term(1,[0]),-2n));const sm=moments(star,1);assert.equal(sm.u,2n);assert.equal(sm.m4,176n);assert.equal(sm.delta,168n);assert.equal(sm.budget,712n);report.controls.push({wickStar:sm});
const mon=term(2,[0,0],[1]);assert.equal(realExpect(abs2(mon)),2n);assert.equal(realExpect(abs2(multiply(mon,mon))),48n);assert.equal(moments(mon,2).budget,200n);report.controls.push('independent monomial factorial normalization and budget 200');
// Rational comparisons a/b < c/d use cross-multiplication only.
const lt=(a,b,c,d)=>assert(a*d<c*b);
const kNum=59009n,kDen=189100n;
const quotient=[4n,0n,-4n,0n,5n,-4n,1n],numerator=Array(9).fill(0n);
quotient.forEach((x,i)=>{numerator[i]+=x;numerator[i+2]+=x;});numerator[0]-=4n;
assert.deepEqual(numerator,[0n,0n,0n,0n,1n,-4n,6n,-4n,1n]);
assert.equal(4n*210n-4n*70n+5n*42n-4n*35n+30n,22n*30n);
assert(484n<490n);
assert(375000000n*484n<30000000n*128n*49n);
// Fifth-order consumer: eta < 23/50,000,000.
lt(9n*1000000000000000n*kNum+30000000n*kDen*25000000n,
   25000000n*1000000000000000n*kNum,23n,50000000n);
assert.equal(2500n*100n-101n*1891n,59009n); // p - 9/25 - 13/20
// eta=9/25,000,000 + (1352/3)*(1/1000)^3/k < 181/100,000,000.
const eDen=25000000n*3n*1000000000n*kNum;
const eNum=9n*3n*1000000000n*kNum+1352n*kDen*25000000n;
lt(eNum,eDen,181n,100000000n);
lt(9n*4000000n*kNum+11n*kDen*25000000n,25000000n*4000000n*kNum,92n,10000000n);
lt(3n,200000000n,123n**2n,1000000n**2n);
lt(11n,4000000n,1659n**2n,1000000n**2n);
lt(9n*1000000000000n*kNum+1782n**2n*kDen*25000000n,25000000n*1000000000000n*kNum,11n,1000000n);
// For c²=39/10000 and v in [0,1/1000], chi increases from 18/5 to
// 7359/2000. Its derivative numerator is 320 c^4 + 16 c² v > 0.
assert.equal(360n*39n*39n+104n*39n*10n+6n*100n,588720n);
assert.equal(588720n*2000n,7359n*160000n);
report.rationalBudgets={fifthOrder:{energyUpper:'1/1000',contentSquaredUpper:'3/100000000',etaUpper:'23/50000000'},thirdOrder:{etaNumerator:eNum,etaDenominator:eDen,etaUpper:'181/100000000'},generalProtectedEnergy:'1/2000',generalProtectedEtaUpper:'92/10000000',fiveCycleChi:['18/5','7359/2000']};
report.passed=true;
const output=JSON.stringify(report,(_,v)=>typeof v==='bigint'?v.toString():v,2)+'\n';
if(process.argv[2])fs.writeFileSync(process.argv[2],output);else process.stdout.write(output);
