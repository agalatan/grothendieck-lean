// content_law_blocks_a786/verify.mjs
// Exact rational arithmetic only. Node.js >=20; no packages required.
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {certifyPhase} from './certify_phase.mjs';

function gcd(a,b){a=a<0n?-a:a;b=b<0n?-b:b;while(b)[a,b]=[b,a%b];return a;}
class Q{
  constructor(n,d=1n){if(n instanceof Q){this.n=n.n;this.d=n.d;return;}n=BigInt(n);d=BigInt(d);assert(d);if(d<0n){n=-n;d=-d;}const g=gcd(n,d);this.n=n/g;this.d=d/g;}
  add(x){x=q(x);return q(this.n*x.d+x.n*this.d,this.d*x.d);}
  neg(){return q(-this.n,this.d);}
  sub(x){return this.add(q(x).neg());}
  mul(x){x=q(x);return q(this.n*x.n,this.d*x.d);}
  div(x){x=q(x);return q(this.n*x.d,this.d*x.n);}
  pow(n){assert(n>=0&&Number.isInteger(n));return q(this.n**BigInt(n),this.d**BigInt(n));}
  le(x){x=q(x);return this.n*x.d<=x.n*this.d;}
  lt(x){x=q(x);return this.n*x.d<x.n*this.d;}
  eq(x){x=q(x);return this.n===x.n&&this.d===x.d;}
  toString(){return this.d===1n?String(this.n):this.n+'/'+this.d;}
  toJSON(){return this.toString();}
}
const q=(n,d=1)=>new Q(n,d),zero=q(0),one=q(1);
const sum=xs=>xs.reduce((a,b)=>a.add(b),zero);
const max=xs=>xs.reduce((a,b)=>a.le(b)?b:a,zero);
const fact=n=>{let v=1n;for(let j=2;j<=n;j++)v*=BigInt(j);return v;};
const choose=(n,k)=>fact(n)/(fact(k)*fact(n-k));
function eq(a,b,label){assert(q(a).eq(b),`${label}: ${a} != ${b}`);}
function isqrt(n){assert(n>=0n);if(n<2n)return n;let x=1n<<BigInt(((n.toString(2).length+1)>>1));for(;;){let y=(x+n/x)/2n;if(y>=x)return x;x=y;}}
function rootUpper(x){x=q(x);const scale=1000000n;let n=isqrt(x.n*scale*scale/x.d);if(n*n*x.d<x.n*scale*scale)n++;const b=q(n,scale);assert(x.le(b.pow(2)));return b;}

// Moments from exponential cumulants, with an independent formula for P^n B.
function factor(lambda,label,rank=null){
  lambda=lambda.map(x=>q(x));eq(sum(lambda.map(x=>x.pow(2))),1,'factor variance');
  const power=j=>sum(lambda.map(x=>x.pow(j)));
  const moments=[one,zero];
  function moment(n){
    while(moments.length<=n){const d=moments.length;moments.push(sum(Array.from({length:d-1},(_,i)=>{
      const k=i+2;return q(choose(d-1,k-1)*fact(k-1)).mul(power(k)).mul(moments[d-k]);
    })));}return moments[n];
  }
  function mixed(n,b=0){
    if(b===0)return moment(n);assert(b===1);
    return sum(Array.from({length:n+1},(_,j)=>q(fact(n)/fact(n-j)).mul(power(j+2)).mul(moment(n-j))));
  }
  const kappa=power(4),s=power(3),chi=q(4).add(kappa.mul(12));
  eq(moment(4),q(3).add(kappa.mul(6)),'factor fourth moment');
  eq(mixed(1,1),s,'E PB');
  return {lambda,label,rank,kappa,s,chi,mixed};
}
function equalFactor(m){const a=isqrt(BigInt(m));assert(a*a===BigInt(m));return factor(Array(m).fill(q(1,a)),`equal-${m}`,m);}
function generalTheta(factors){
  const data=factors.map(F=>{const raw=rootUpper(F.kappa).mul(2),alpha2=raw.le(1)?raw:one;
    return {alpha2,K:rootUpper(alpha2.mul(17)).add(rootUpper(F.kappa.mul(24))).pow(2).div(F.chi),M:F.s.pow(2).div(F.chi)};});
  return max(data.map(x=>x.K)).add(max(data.map(x=>x.M)).mul(16)).mul(q(2,3)).add(max(data.map(x=>x.alpha2)).div(3));
}
function analyticEqualTheta(m){if(m===1)return q(39,16);return q(29,3*(m+3)).add(q(2,9*m));}
function equalTheta(m){
  const candidates=[analyticEqualTheta(m)];
  if(m>=2)candidates.push(q(1361,750));if(m>=4)candidates.push(q(8153,6300));
  if(m>=12)candidates.push(q(91,144));if(m>=23)candidates.push(q(16226,43875));
  return candidates.reduce((a,b)=>a.le(b)?a:b);
}
function provenTheta(factors){
  if(factors.every(x=>x.rank!==null))return equalTheta(Math.min(...factors.map(x=>x.rank)));
  if(factors.every(x=>x.kappa.le(q(1,576))))return q(2465,6948);
  if(factors.every(x=>x.kappa.le(q(1,64))))return q(1015,804);
  return generalTheta(factors);
}
function compositions(n,k){if(k===1)return [[n]];const out=[];for(let i=0;i<=n;i++)for(const tail of compositions(n-i,k-1))out.push([i,...tail]);return out;}

// Conditional variance S = sum a_i^2 P_i^2 + a_0^2 D.
// D=|U|^2 |V|^2, a genuine holomorphic-quadratic/antiholomorphic cubic bulk.
function model(factors,amps,bulkAmp=zero){
  amps=amps.map(x=>q(x));bulkAmp=q(bulkAmp);const weights=amps.map(x=>x.pow(2)),w0=bulkAmp.pow(2);
  const u=sum(weights).add(w0),cache=new Map();
  function mixedS(n,i=-1,powerP=0,powerB=0){
    const key=[n,i,powerP,powerB].join('/');if(cache.has(key))return cache.get(key);
    const value=sum(compositions(n,factors.length+1).map(cs=>{
      let v=q(fact(n));for(const a of cs)v=v.div(fact(a));
      for(let j=0;j<factors.length;j++)v=v.mul(weights[j].pow(cs[j])).mul(factors[j].mixed(2*cs[j]+(i===j?powerP:0),i===j?powerB:0));
      return v.mul(w0.pow(cs.at(-1))).mul(q(fact(cs.at(-1))).pow(2));
    }));cache.set(key,value);return value;
  }
  const momentV=n=>mixedS(n).mul(fact(n));
  const delta=momentV(2).sub(u.pow(2).mul(2));
  eq(momentV(1),u,'variance of whole sum');
  eq(delta,sum(factors.map((F,i)=>weights[i].pow(2).mul(F.chi))).add(w0.pow(2).mul(6)),'same-law deficit budget');
  return {factors,amps,bulkAmp,weights,u,delta,mixedS,momentV,theta:provenTheta(factors)};
}
function resolvent(h,u){const k=h.map(()=>zero);for(let d=0;d<h.length;d++)for(let j=0;j<=d;j++)k[j]=k[j].add(h[d].mul(q(fact(d),fact(j))).mul(u.pow(d-j)));
  const kp=k.slice(1).map((x,j)=>x.mul(j+1));for(let j=0;j<h.length;j++)eq(k[j].sub((kp[j]??zero).mul(u)),h[j],'resolvent equation');return kp;
}
function evaluate(M,h){
  h=h.map(x=>q(x));const {factors,amps,weights,u,mixedS,delta,momentV}=M,kp=resolvent(h,u);
  const content=factors.map((_,i)=>amps[i].mul(sum(h.map((x,n)=>x.mul(fact(n+1)).mul(mixedS(n,i,1))))));
  const balanced=factors.map((_,i)=>{
    const rho=weights[i].div(u);
    return u.mul(amps[i]).mul(sum(kp.map((x,n)=>{
      let v=mixedS(n,i,1,1).mul(rho.mul(4)).add(mixedS(n+1,i,1).sub(mixedS(n,i,3).mul(weights[i])).div(u)).sub(mixedS(n,i,1));
      if(n>0)v=v.add(mixedS(n-1,i,3,1).mul(rho.mul(weights[i]).mul(2*n)));
      return x.mul(fact(n+1)).mul(v);
    })));
  });
  content.forEach((x,i)=>eq(x,balanced[i],'new multi-block balanced identity'));
  const vk2=sum(kp.flatMap((a,i)=>kp.map((b,j)=>a.mul(b).mul(momentV(i+j+1))))),vk=sum(kp.map((a,i)=>a.mul(momentV(i+1))));
  const omega=vk2.mul(q(3,2)).sub(vk.pow(2).mul(q(3,4)).div(u)),norm2=sum(content.map(x=>x.pow(2)));
  assert(zero.le(omega));assert(norm2.le(M.theta.mul(delta).mul(omega)),'theorem inequality on polynomial instance');
  if(h.length===2&&h[0].eq(0)&&h[1].eq(1)){
    content.forEach((x,i)=>eq(x,amps[i].pow(3).mul(factors[i].s).mul(4),'nonzero content control'));
  }
  return {profile:h,content,omega,norm2,ratio:omega.n?norm2.div(delta.mul(omega)):null};
}

// Independent complex-Wick engine. A monomial is y^a conjugate(y)^b.
function polynomial(n){
  const empty=()=>new Map();
  function term(exps,c=one){return new Map([[exps.join(','),{exps,c:q(c)}]]);}
  const unit=()=>term(Array(2*n).fill(0));
  function add(A,B){const C=new Map(A);for(const [k,v]of B){const old=C.get(k);const c=(old?.c??zero).add(v.c);if(c.n)C.set(k,{exps:v.exps,c});else C.delete(k);}return C;}
  function scale(A,c){return new Map([...A].map(([k,v])=>[k,{exps:v.exps,c:v.c.mul(c)}]));}
  function mul(A,B){let C=empty();for(const v of A.values())for(const w of B.values()){
    const exps=v.exps.map((x,j)=>x+w.exps[j]),key=exps.join(','),c=(C.get(key)?.c??zero).add(v.c.mul(w.c));
    if(c.n)C.set(key,{exps,c});else C.delete(key);
  }return C;}
  const variable=(j,bar=false)=>{const e=Array(2*n).fill(0);e[j+(bar?n:0)]=1;return term(e);};
  function inner(A,B){let out=zero;const groups=new Map();
    for(const v of B.values()){const key=Array.from({length:n},(_,j)=>v.exps[j]-v.exps[n+j]).join(',');if(!groups.has(key))groups.set(key,[]);groups.get(key).push(v);}
    for(const v of A.values()){
      const key=Array.from({length:n},(_,j)=>v.exps[j]-v.exps[n+j]).join(',');
      for(const w of groups.get(key)??[]){let a=v.c.mul(w.c);for(let j=0;j<n;j++)a=a.mul(fact(v.exps[n+j]+w.exps[j]));out=out.add(a);}
    }return out;
  }
  return {empty,term,unit,add,scale,mul,variable,inner};
}
function wickCheck(M){
  const n=M.factors.length+M.factors.reduce((s,F)=>s+F.lambda.length,0)+(M.bulkAmp.n?3:0);
  const P=polynomial(n);let Qpoly=P.empty(),next=M.factors.length;
  for(let i=0;i<M.factors.length;i++)for(const lam of M.factors[i].lambda){
    const x=P.variable(i),y=P.variable(next),yb=P.variable(next,true);next++;
    Qpoly=P.add(Qpoly,P.scale(P.add(P.mul(x,P.mul(y,yb)),P.scale(x,-1)),M.amps[i].mul(lam)));
  }
  if(M.bulkAmp.n)Qpoly=P.add(Qpoly,P.scale(P.mul(P.mul(P.variable(next),P.variable(next+1)),P.variable(next+2,true)),M.bulkAmp));
  const powers=[P.unit()];for(let k=1;k<=3;k++)powers.push(P.mul(powers.at(-1),Qpoly));
  for(let k=1;k<=3;k++)eq(P.inner(powers[k],powers[k]),M.momentV(k),'independent complex Wick absolute moment');
  for(let d=0;d<=2;d++){
    const h=Array(d+1).fill(zero);h[d]=one;const E=evaluate(M,h);
    for(let j=0;j<n;j++)eq(P.inner(P.mul(P.variable(j),powers[d]),powers[d+1]),j<M.factors.length?E.content[j]:zero,'independent complex Wick content and zero coordinates');
  }
  return {coordinates:n,blocks:M.factors.length,bulk:!!M.bulkAmp.n,degreeChecked:2,polynomialTerms:Qpoly.size};
}

const report={label:'C: exact arithmetic; finite checks do not replace the P proof',constants:{},rows:[],polynomialInstances:0,examples:[],independentWick:[]};
const expPoly=cs=>sum(cs.map((c,j)=>q(c).mul(fact(j))));
const starU=expPoly([0,4,-4,1]),starM4=expPoly([0,0,16,-32,24,-8,1]),starC=expPoly([0,0,-8,12,-6,1]);
eq(starU,2,'self-interaction control variance');eq(starM4,176,'self-interaction control fourth moment');eq(starC,32,'self-interaction control content');
const starDelta=starM4.sub(starU.pow(2).mul(2)),starOmega=starU.mul(q(3,4));
eq(starC.pow(2).div(starDelta.mul(starOmega)),q(256,63),'question normalization 1024/252');
report.selfInteractionControl={u:starU,delta:starDelta,content:starC,omega:starOmega,ratio:q(256,63)};
assert(q(49,18).pow(2).lt(8));assert(q(2,3).lt(q(5,6).pow(2)));assert(q(2).lt(q(3,2).pow(2)));
eq(q(17).mul(q(2,3)).add(24).add(q(8).mul(q(5,6))),42,'retained cross-term norm bound');
eq(q(77,32).add(1).mul(q(2,3)).add(q(1,6)),q(39,16),'rank-one refinement');
assert(q(42,20).le(q(77,32)));assert(q(1,3).le(q(1,2)));
eq(analyticEqualTheta(5),q(451,360),'rank 5 analytic bound');eq(analyticEqualTheta(24),q(119,324),'rank 24 analytic bound');
assert(analyticEqualTheta(5).lt(q(13,10)));assert(analyticEqualTheta(24).lt(q(37,100)));assert(equalTheta(1).lt(q(5,2)));
// Symbolically integrate T times the three coefficients in the square of U.
const pa=(a,b)=>Array.from({length:Math.max(a.length,b.length)},(_,j)=>(a[j]??zero).add(b[j]??zero));
const ps=(a,c)=>a.map(x=>x.mul(c));
const pm=(a,b)=>{const r=Array(a.length+b.length-1).fill(zero);for(let i=0;i<a.length;i++)for(let j=0;j<b.length;j++)r[i+j]=r[i+j].add(a[i].mul(b[j]));return r;};
const tm=(A,B)=>{const r=Array.from({length:A.length+B.length-1},()=>[zero]);for(let i=0;i<A.length;i++)for(let j=0;j<B.length;j++)r[i+j]=pa(r[i+j],pm(A[i],B[j]));return r;};
const integrateT=A=>A.reduce((p,a,j)=>pa(p,ps(a,fact(j+1))),[zero]);
const H=[[q(2),q(-2)],[zero,one]],twoHm1=[[q(3),q(-4)],[zero,q(2)]];
const expectedSquares=[[[9,0,8],tm(twoHm1,twoHm1)],[[24,0,16],tm(H,twoHm1).map(x=>ps(x,4))],[[16,0,8],tm(H,H).map(x=>ps(x,4))]];
for(const [expected,poly]of expectedSquares){const actual=integrateT(poly);expected.forEach((x,j)=>eq(actual[j],x,'symbolic cross-term expansion (31a)'));}
assert(q(51,8).lt(q(81,32).pow(2)));assert(q(17,72).lt(q(35,72).pow(2)));
eq(q(79,67).add(q(1,12)),q(1015,804),'unequal spectra 1/64');
eq(q(568,1737).add(q(1,36)),q(2465,6948),'unequal spectra 1/576');
assert(q(1015,804).lt(q(13,10)));assert(q(2465,6948).lt(q(37,100)));
// Recompute all scalar phase enclosures; never trust a saved JSON certificate.
const phase=certifyPhase();report.certifiedPhaseRanks=phase.bounds.map(x=>x.m);
assert(q(21,200).lt(q(13,40).pow(2)));assert(q(11,100).lt(q(1,3).pow(2)));
assert(q(11,3000).lt(q(1,16).pow(2)));assert(q(3,2875).lt(q(1,30).pow(2)));
assert(q(7,4).le(q(1817,1000)));assert(q(1,6).le(q(21,100)));
assert(q(21,16).le(q(2761,2100)));assert(q(2,21).le(q(11,100)));
assert(q(406,625).le(q(21,32)));assert(q(1,21).le(q(1,20)));
assert(q(51,125).add(q(24,23)).add(q(4,15)).div(q(104,23)).le(q(7,18)));assert(q(1,42).le(q(3,125)));
eq(q(1817,1000).add(q(4,5)).mul(q(2,3)).add(q(7,100)),q(1361,750),'rank 2 interval consequence');
eq(q(2761,2100).add(q(4,7)).mul(q(2,3)).add(q(11,300)),q(8153,6300),'rank 4 interval consequence');
eq(q(21,32).add(q(4,15)).mul(q(2,3)).add(q(1,60)),q(91,144),'rank 12 interval consequence');
eq(q(7,18).add(q(2,13)).mul(q(2,3)).add(q(1,125)),q(16226,43875),'rank 23 interval consequence');
assert(q(8153,6300).lt(q(13,10)));
report.constants={theta1:equalTheta(1),theta4:equalTheta(4),theta23:equalTheta(23),analyticTheta5:analyticEqualTheta(5),analyticTheta24:analyticEqualTheta(24),kappa64theta:q(1015,804),kappa576theta:q(2465,6948)};
const rows=[['0.80',q(37,100),23],['0.82',q(16,25),12],['0.84',q(133,100),4],['0.845',q(47,25),2],['0.85',q(5,2),1],['0.855',q(37,10),1]];
for(const[t,target,m]of rows){const theta=equalTheta(m);assert(theta.lt(target));report.rows.push({t,target,minBlockRank:m,theta});}
const decimal=s=>{const negative=s.startsWith('-');if(negative)s=s.slice(1);const [a,b='']=s.split('.');const v=q(BigInt(a+b),10n**BigInt(b.length));return negative?v.neg():v;};
for(const row of JSON.parse(fs.readFileSync(new URL('./rows.json',import.meta.url),'utf8'))){assert(!one.add(decimal(row.bA)).eq(0));assert(zero.lt(decimal(row.sigma)));}

const F1=equalFactor(1),F4=equalFactor(4),F9=equalFactor(9),F64=equalFactor(64),F576=equalFactor(576);
const Fplus=factor([q(3,5),q(4,5)],'3/5,4/5'),Fminus=factor([q(3,5),q(-4,5)],'3/5,-4/5');
const families=[
 [[F1,F1],[one,one],zero], [[F1,F1],[q(2),q(1,3)],q(1,2)],
 [[F1,F4],[q(1,2),q(3,2)],one], [[Fplus,Fminus],[one,q(2)],one],
 [[F1,Fplus,Fminus],[q(1,2),one,q(3,4)],q(2,3)],
 [[F9,F9,F9],[one,q(2,3),q(1,5)],q(1,2)],
 [[F64,F64],[one,q(2)],q(1,3)], [[F576,F576],[one,one],one],
 [Array(7).fill(F4),Array(7).fill(one),q(2)],
];
for(const [factors,amps,bulkAmp]of families){
  const M=model(factors,amps,bulkAmp);
  for(let d=0;d<=4;d++){const h=Array(d+1).fill(zero);h[d]=one;const R=evaluate(M,h);report.polynomialInstances++;
    if(d===1)report.examples.push({factors:factors.map(F=>F.label),amplitudes:amps,bulkAmp,u:M.u,delta:M.delta,theta:M.theta,...R});}
  for(const h of [[q(3),q(-2),q(1,7)],[zero,q(1),q(-1,10),q(1,300)],[q(-1),q(2),q(-3),q(1,2),q(1,1000)]]){evaluate(M,h);report.polynomialInstances++;}
}
for(const [factors,amps,bulkAmp]of families.slice(0,5))report.independentWick.push(wickCheck(model(factors,amps,bulkAmp)));

// A rational proof witness for the one-coordinate projection maximum.
// 8/27 - 2 c(1-c)^2 = 2(c-1/3)^2(4/3-c), valid for 0<=c<=1.
for(const c of [zero,q(1,7),q(1,3),q(3,4),one])eq(q(8,27).sub(c.mul(one.sub(c).pow(2)).mul(2)),c.sub(q(1,3)).pow(2).mul(q(4,3).sub(c)).mul(2),'projection maximum polynomial identity');
report.projectionConstant=q(8,27);
fs.writeFileSync(new URL('./results_exact.json',import.meta.url),JSON.stringify(report,null,2)+'\n');
console.log(JSON.stringify({status:'PASS',label:'C',polynomialInstances:report.polynomialInstances,independentWickModels:report.independentWick.length,constants:report.constants,rows:report.rows},null,2));
