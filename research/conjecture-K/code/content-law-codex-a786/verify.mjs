// content_law_codex_a786/verify.mjs
// codex-a786. Exact rational replay, Node.js >=20, no dependencies.
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {fileURLToPath} from 'node:url';
import path from 'node:path';
const gcd=(a,b)=>{a=a<0n?-a:a;b=b<0n?-b:b;while(b){[a,b]=[b,a%b];}return a;};
class Q {
  constructor(n,d=1n){n=BigInt(n);d=BigInt(d);assert(d!==0n);if(d<0n){n=-n;d=-d;}const g=gcd(n,d);this.n=n/g;this.d=d/g;}
  static of(x){return x instanceof Q?x:new Q(x);}
  add(x){x=Q.of(x);return new Q(this.n*x.d+x.n*this.d,this.d*x.d);}
  neg(){return new Q(-this.n,this.d);}
  sub(x){return this.add(Q.of(x).neg());}
  mul(x){x=Q.of(x);return new Q(this.n*x.n,this.d*x.d);}
  div(x){x=Q.of(x);return new Q(this.n*x.d,this.d*x.n);}
  pow(n){assert(n>=0&&Number.isInteger(n));return new Q(this.n**BigInt(n),this.d**BigInt(n));}
  le(x){x=Q.of(x);return this.n*x.d<=x.n*this.d;}
  lt(x){x=Q.of(x);return this.n*x.d<x.n*this.d;}
  eq(x){x=Q.of(x);return this.n===x.n&&this.d===x.d;}
  toString(){return this.d===1n?String(this.n):this.n+'/'+this.d;}
}
const z=()=>new Q(0), q=(n,d=1)=>new Q(n,d);
const fact=n=>{let a=1n;for(let j=2;j<=n;j++)a*=BigInt(j);return a;};
const choose=(n,k)=>fact(n)/(fact(k)*fact(n-k));
const sum=xs=>xs.reduce((a,b)=>a.add(b),z());
const eq=(a,b,label)=>assert(Q.of(a).eq(b),label+': '+a+' != '+b);
const rise=(m,k)=>{let r=1n;for(let j=0;j<k;j++)r*=BigInt(m+j);return r;};
function gammaCentered(m,k) {
  return new Q(Array.from({length:k+1},(_,j)=>choose(k,j)*((-BigInt(m))**BigInt(k-j))*rise(m,j)).reduce((a,b)=>a+b,0n));
}
function convolveMoments(a,b,K) {
  return Array.from({length:K+1},(_,k)=>sum(Array.from({length:k+1},(_,j)=>q(choose(k,j)).mul(a[j]).mul(b[k-j]))));
}
function bulkMoments(N,K) {
  let v=[q(1),...Array.from({length:K},z)];
  const one=Array.from({length:K+1},(_,k)=>q(fact(2*k)));
  for(let n=0;n<N;n++)v=convolveMoments(v,one,K);
  return v;
}
function profileDerivative(h,u) {
  const k=Array.from({length:h.length},z);
  for(let d=0;d<h.length;d++)for(let j=0;j<=d;j++)
    k[j]=k[j].add(h[d].mul(q(fact(d),fact(j))).mul(u.pow(d-j)));
  const kp=k.slice(1).map((v,j)=>v.mul(j+1));
  for(let j=0;j<h.length;j++)eq(k[j].sub((kp[j]??z()).mul(u)),h[j],'k - u kprime');
  return kp;
}
function polynomialValueExpectation(coeffs,moment) {
  return sum(coeffs.map((a,j)=>a.mul(moment(j))));
}
function omega(kp,u,momV) {
  const first=sum(kp.flatMap((a,i)=>kp.map((b,j)=>a.mul(b).mul(momV(i+j+1)))));
  const second=sum(kp.map((a,i)=>a.mul(momV(i+1))));
  return first.mul(q(3,2)).sub(second.pow(2).mul(q(3,4)).div(u));
}
// Integer-coefficient cubics: q = X G + b sum_{j=1}^N U_j^2 conjugate(Z_j),
// G = Gamma(m,1)-m. This is the main class with rho=m/(m+2 b^2 N).
function instance(m,N,b,h) {
  const maxD=h.length-1,K=2*maxD+4;
  const gm=Array.from({length:2*K+5},(_,k)=>gammaCentered(m,k));
  const dm=bulkMoments(N,K).map((v,k)=>v.mul(q(b).pow(2*k)));
  // S=G^2 + b^2 D; mixed(a,k,l) = E[G^a S^k (b^2 D)^l].
  const mixed=(a,k,l=0)=>{
    assert(k>=0);
    return sum(Array.from({length:k+1},(_,j)=>
      q(choose(k,j)).mul(gm[a+2*j]).mul(dm[k-j+l])));
  };
  const u=q(m+2*b*b*N);
  const delta=q(4*m*m+12*m+40*b**4*N);
  const mv=k=>q(fact(k)).mul(mixed(0,k));
  eq(mv(1),u,'variance');
  eq(mv(2).sub(u.pow(2).mul(2)),delta,'fourth cumulant');
  const c=sum(h.map((v,j)=>v.mul(fact(j+1)).mul(mixed(1,j))));
  const kp=profileDerivative(h,u);
  // Independently evaluate conditional regression in 6.3.23.
  const rhs=sum(kp.map((v,n)=>{
    let first;
    if(n===0) first=q(4).mul(gm[2].add(gm[1].mul(m)));
    else {
      const gPart=mixed(4,n-1).add(mixed(3,n-1).mul(m)).mul(fact(n+2));
      const dPart=mixed(2,n-1,1).add(mixed(1,n-1,1).mul(m)).mul(2n*fact(n+1));
      first=gPart.add(dPart).mul(2);
    }
    const second=mixed(1,n,1).sub(mixed(1,n).mul(u)).mul(fact(n+1));
    return first.add(second).mul(v);
  }));
  eq(c,rhs,'direct content equals Stein/regression representation');
  const om=omega(kp,u,mv);
  assert(z().le(om));
  const theta=N===0?q(77,9*(m+3)):m===1?q(55,16):m===8?q(11009947,8553600):q(253,18*(m+3)).add(q(2,9*m));
  assert(c.pow(2).le(theta.mul(delta).mul(om)),'content-law inequality on polynomial instance');
  return {m,N,b,u:String(u),delta:String(delta),degree:maxD,content:String(c),omega:String(om),
    ratio:om.n===0n?'0/0 (both zero)':String(c.pow(2).div(delta.mul(om))),theta:String(theta)};
}
const report={label:'C: exact integer/rational arithmetic; instances are checks, not the all-profile proof',agent:'codex-a786',checks:[],rowComparisons:[],instances:[]};
// Question's normalization check, evaluated as exponential polynomial moments.
const exppoly=cs=>sum(cs.map((a,j)=>q(a).mul(fact(j))));
const uStar=exppoly([0,4,-4,1]);
const m4Star=exppoly([0,0,16,-32,24,-8,1]);
const cStar=exppoly([0,0,-8,12,-6,1]);
eq(uStar,2,'Wick star u');eq(m4Star,176,'Wick star m4');eq(cStar,32,'Wick star content');
const dStar=m4Star.sub(uStar.pow(2).mul(2)),oStar=uStar.mul(q(3,4));
eq(dStar,168,'Wick star delta');
eq(cStar.pow(2).div(dStar.mul(oStar)),q(256,63),'1024/252 check');
report.checks.push({name:'question h(v)=v control',u:String(uStar),m4:String(m4Star),delta:String(dStar),content:String(cStar),omega:String(oStar),ratio:String(q(256,63))});
// Exact exponential moments in the folded dual norm.
const ES=n=>q(fact(n));
eq(ES(3).mul(4).sub(ES(2).mul(4)).add(ES(1)),17,'E S(2S-1)^2');
eq(ES(3).mul(4),24,'E S (2S)^2');
eq(ES(2).mul(2),4,'dual mean');
eq(q(3,2).mul(q(2,3)),1,'dual normalization');
assert(q(17).lt(q(33,8).pow(2)));
assert(q(204).lt(q(15).pow(2)));
assert(q(49,18).pow(2).lt(8));
eq(q(77,9).add(q(4,3).mul(q(33,8))),q(253,18),'rational root bound');
eq(q(157,48).add(q(1,6)),q(55,16),'m=1 improvement');
const alpha8=q(2,24).sub(q(2,9*64)).add(q(4,81*512));
eq(alpha8,q(829,10368),'m=8 Taylor bound');
assert(alpha8.mul(51).lt(q(101,50).pow(2)));
const theta8=q(4,33).mul(alpha8.mul(17).add(5).add(q(101,25))).add(alpha8.div(3));
eq(theta8,q(11009947,8553600),'m=8 improved constant');
assert(theta8.lt(q(13,10)));
report.checks.push({name:'m=8 refinement',alphaSquaredUpper:String(alpha8),theta:String(theta8),status:'passed'});
report.checks.push({name:'folded exponential constants and square-root bounds',status:'passed'});
const rows=[
 ['0.80',q(37,100),21,36],['0.82',q(16,25),11,20],['0.84',q(133,100),4,8],
 ['0.845',q(47,25),2,5],['0.85',q(5,2),1,3],['0.855',q(37,10),1,1]];
for(const[t,target,mp,mb]of rows){
  const tp=q(77,9*(mp+3)),tb=mb===1?q(55,16):mb===8?theta8:q(253,18*(mb+3)).add(q(2,9*mb));
  assert(tp.lt(target)&&tb.lt(target));
  report.rowComparisons.push({t,comparisonTarget:String(target),pure_m:mp,pure_theta:String(tp),bulk_m:mb,bulk_theta:String(tb)});
}
assert(q(77,63).lt(q(13,10)));
assert(q(253,216).add(q(2,81)).lt(q(13,10)));
// All requested decimals interpreted exactly; no row approximation is needed.
const rowData=JSON.parse(fs.readFileSync(new URL('./rows.json',import.meta.url),'utf8'));
for(const row of rowData){
  const decimal=s=>{const[a,b='']=s.split('.');return q(BigInt(a+b),10n**BigInt(b.length));};
  assert(!q(1).add(decimal(row.bA)).eq(0),'profile is not identically zero');
  assert(q(0).lt(decimal(row.sigma)));
}
let count=0;
for(const m of [1,2,3,4,5,8,9,11,20,21,36,64]){
  for(let d=0;d<=7;d++){
    const h=Array.from({length:d+1},z);h[d]=q(1);
    const r=instance(m,0,0,h);count++;
    if(d===1) {
      eq(q(r.content).pow(2).div(q(r.delta).mul(new Q(...r.omega.split('/')))),q(16,3*(m+3)),'nonzero control ratio');
      report.instances.push(r);
    }
  }
}
for(const m of [1,2,4,9,36])for(const N of [1,3,7])for(const b of [1,2]){
  for(let d=1;d<=4;d++){
    const h=Array.from({length:d+1},z);h[d]=q(1);const r=instance(m,N,b,h);count++;
    if(d===2&&b===1&&N===3)report.instances.push(r);
  }
  instance(m,N,b,[q(3),q(-2),q(1,7),q(-1,1000)]);count++;
}
report.polynomialInstances=count;
report.checks.push({name:'all polynomial instance identities and inequalities',count,status:'passed'});
const out=path.join(path.dirname(fileURLToPath(import.meta.url)),'results_exact.json');
fs.writeFileSync(out,JSON.stringify(report,null,2)+'\n');
console.log(JSON.stringify({status:'PASS',label:'C',polynomialInstances:count,rowComparisons:report.rowComparisons,output:out},null,2));

