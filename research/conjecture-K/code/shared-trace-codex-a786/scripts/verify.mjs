// content_law_shared_trace_a786/scripts/verify.mjs
// Node >=20, built-ins only. All acceptance arithmetic is exact.
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import {fileURLToPath} from 'node:url';
const root=path.resolve(path.dirname(fileURLToPath(import.meta.url)),'..');
const gcd=(a,b)=>{a=a<0n?-a:a;b=b<0n?-b:b;while(b)[a,b]=[b,a%b];return a;};
class Q {
 constructor(n,d=1n){if(n instanceof Q){this.n=n.n;this.d=n.d;return;}n=BigInt(n);d=BigInt(d);assert(d);if(d<0n){n=-n;d=-d;}let g=gcd(n,d);this.n=n/g;this.d=d/g;}
 add(x){x=q(x);return q(this.n*x.d+x.n*this.d,this.d*x.d);}
 neg(){return q(-this.n,this.d);} sub(x){return this.add(q(x).neg());}
 mul(x){x=q(x);return q(this.n*x.n,this.d*x.d);} div(x){x=q(x);return q(this.n*x.d,this.d*x.n);}
 pow(n){return q(this.n**BigInt(n),this.d**BigInt(n));}
 eq(x){x=q(x);return this.n===x.n&&this.d===x.d;}
 le(x){x=q(x);return this.n*x.d<=x.n*this.d;} lt(x){x=q(x);return this.n*x.d<x.n*this.d;}
 toString(){return this.d===1n?String(this.n):this.n+'/'+this.d;} toJSON(){return this.toString();}
}
const q=(n,d=1n)=>new Q(n,d), z=q(0),one=q(1);
const fact=n=>{let a=1n;for(let j=2;j<=n;j++)a*=BigInt(j);return a;};
const sum=a=>a.reduce((x,y)=>x.add(y),z);
const eq=(a,b,label)=>assert(q(a).eq(b),label+': '+a+' != '+b);
const choose=(n,k)=>fact(n)/(fact(k)*fact(n-k));

// Sparse exact polynomials in any number of variables.
function algebra(n) {
 const term=(e,c=one)=>q(c).n?new Map([[e.join(','),{e,c:q(c)}]]):new Map();
 const C=c=>term(Array(n).fill(0),c);
 const X=j=>{let e=Array(n).fill(0);e[j]=1;return term(e);};
 function add(...ps){const r=new Map();for(const p of ps)for(const [k,{e,c}]of p){const v=(r.get(k)?.c??z).add(c);if(v.n)r.set(k,{e,c:v});else r.delete(k);}return r;}
 const scale=(p,c)=>new Map([...p].map(([k,v])=>[k,{e:v.e,c:v.c.mul(c)}]).filter(([,v])=>v.c.n));
 function mul(...ps){let r=C(1);for(const p of ps){let t=new Map();for(const a of r.values())for(const b of p.values()){const e=a.e.map((v,j)=>v+b.e[j]),key=e.join(',');const c=(t.get(key)?.c??z).add(a.c.mul(b.c));if(c.n)t.set(key,{e,c});else t.delete(key);}r=t;}return r;}
 const pow=(p,k)=>{let r=C(1);for(let j=0;j<k;j++)r=mul(r,p);return r;};
 const sub=(a,b)=>add(a,scale(b,-1));
 const deriv=(p,j)=>add(...[...p.values()].filter(v=>v.e[j]).map(v=>{const e=[...v.e],c=v.c.mul(e[j]);e[j]--;return term(e,c);}));
 const evalAt=(p,values)=>sum([...p.values()].map(v=>v.e.reduce((c,k,j)=>c.mul(q(values[j]).pow(k)),v.c)));
 const assertEq=(a,b,label)=>assert.equal(sub(a,b).size,0,label);
 return {term,C,X,add,scale,mul,pow,sub,deriv,evalAt,assertEq};
}

const P=algebra(2), {C,X,add,scale,mul,pow,sub,deriv,assertEq}=P;
const d=X(0),s=X(1),dp=n=>add(d,C(n));
const rising=k=>{let p=C(1);for(let j=0;j<k;j++)p=mul(p,dp(j));return p;};
function E(poly){return add(...[...poly.values()].map(v=>scale(mul(pow(d,v.e[0]),rising(v.e[1])),v.c)));}
const R=add(pow(s,2),scale(s,-2),d);
const L=scale(mul(d,add(scale(pow(d,2),2),d,C(1))),2);
const N=add(mul(sub(s,d),sub(R,pow(d,2))),mul(s,deriv(R,1)));
assertEq(E(R),pow(d,2),'ER');
assertEq(sub(E(pow(R,2)),pow(d,4)),L,'Var R');
assertEq(E(N),scale(pow(d,2),4),'EN');
assertEq(E(pow(N,2)),scale(mul(d,add(scale(pow(d,3),12),scale(pow(d,2),81),scale(d,109),C(50))),2),'EN2');
const Qdiv=add(pow(s,4),mul(sub(C(2),scale(d,2)),pow(s,3)),mul(sub(d,pow(d,2)),pow(s,2)),
 mul(add(scale(pow(d,3),4),scale(pow(d,2),-8),scale(d,4)),s),
 scale(pow(d,4),-1),scale(pow(d,3),5),scale(pow(d,2),-4),scale(d,-4),C(4));
const rem=mul(dp(-1),pow(sub(pow(d,2),C(2)),2),sub(d,scale(s,2)));
assertEq(pow(N,2),add(mul(R,Qdiv),rem),'division with signed remainder');
const Bpol=add(pow(d,4),scale(pow(d,3),-1),scale(pow(d,2),14),scale(d,6),C(4));
assertEq(E(Qdiv),Bpol,'E quotient');
assertEq(pow(sub(s,d),2),add(R,mul(dp(-1),sub(d,scale(s,2)))),'b remainder');
assertEq(add(R,deriv(R,1)),add(pow(s,2),d,C(-2)),'sign in Gamma identity');
assertEq(sub(mul(d,R),mul(dp(-1),pow(s,2))),pow(sub(s,d),2),'inverse denominator bound');
// D0 * E[p(S)/S^2], with D0=(d-1)(d-2); no rational function operations.
const D0=mul(dp(-1),dp(-2));
function EdivS2(poly){return add(...[...poly.values()].map(v=>{
 const k=v.e[1],mom=k===0?C(1):k===1?dp(-2):mul(D0,rising(k-2));
 return scale(mul(pow(d,v.e[0]),mom),v.c);
}));}
const Bnum=add(scale(pow(d,3),12),scale(pow(d,2),-27),scale(d,12),C(-4));
assertEq(EdivS2(pow(N,2)),scale(mul(dp(-1),Bnum),2),'inverse B moment');
assertEq(EdivS2(pow(sub(s,d),2)),dp(2),'inverse b moment');
const polNum=add(Bpol,scale(pow(d,2),16)),polDen=scale(mul(d,L),3);
const invNum=add(scale(pow(d,3),20),scale(pow(d,2),-51),scale(d,28),C(-4));
const invDen=scale(mul(d,dp(-2),dp(-1),add(scale(pow(d,2),2),d,C(1))),3);
assertEq(add(scale(mul(d,Bnum),2),scale(mul(pow(d,2),D0),16)),scale(mul(d,invNum),2),'inverse theta');
function shiftedPositive(poly,shift,label){
 let out=Array(16).fill(z);
 for(const v of poly.values()){assert.equal(v.e[1],0);for(let j=0;j<=v.e[0];j++)out[j]=out[j].add(v.c.mul(choose(v.e[0],j)).mul(q(shift).pow(v.e[0]-j)));}
 while(out.length>1&&!out.at(-1).n)out.pop();
 assert(out.every(c=>z.le(c)),label);return out;
}
const shifted={};
shifted.uniformFrom3=shiftedPositive(sub(scale(polDen,173),scale(polNum,594)),3,'uniform bound at d>=3');
shifted.polDominatesBulk=shiftedPositive(sub(scale(mul(d,polNum),3),polDen),2,'pol bulk');
shifted.invDominatesBulk=shiftedPositive(sub(mul(invNum,dp(-1)),mul(dp(2),d,add(scale(pow(d,2),2),d,C(1)))),4,'inverse bulk');
const rat=(a,b,k)=>P.evalAt(a,[k,0]).div(P.evalAt(b,[k,0]));
function theta(k){let a=rat(polNum,polDen,k);if(k>=4){const b=rat(invNum,invDen,k);if(b.lt(a))a=b;}return a;}
eq(theta(2),q(6,11),'theta2');eq(theta(3),q(173,594),'theta3');eq(theta(4),q(175,888),'theta4');
assert(theta(2).lt(q(3,5)));assert(theta(3).lt(q(3,10)));
assert(q(3,10).lt(q(7,20)));assert(q(7,20).lt(q(37,100)));

// Tangent obstruction: exact elementary constants and the polynomial identity
// proving monotonicity of log(1+x)-2x/(2+x).
const A1=algebra(1),xx=A1.X(0);
A1.assertEq(A1.sub(A1.pow(A1.add(xx,A1.C(2)),2),A1.scale(A1.add(xx,A1.C(1)),4)),A1.pow(xx,2),'log derivative numerator');
const exp5=sum(Array.from({length:6},(_,j)=>q(1,fact(j))));
const eUpper=exp5.add(q(7,6*720));
assert(eUpper.lt(q(68,25)));assert(q(68,25).pow(2).lt(q(15,2)));
assert(q(6).div(q(68,25).pow(2)).lt(1));
assert(q(4,5).lt(q(6).div(q(68,25).pow(2))));
assert(q(32).sub(q(108,4)).n>0n);

// Theorem 3: exact continuum certificates in d and lambda.
function sharedHolomorphicCertificates(){
 const T=algebra(3),{C,X,add,scale,mul,pow,sub,deriv,assertEq}=T;
 const d=X(0),s=X(1),t=X(2),dp=k=>add(d,C(k));
 const rising=k=>{let r=C(1);for(let j=0;j<k;j++)r=mul(r,dp(j));return r;};
 const E=p=>add(...[...p.values()].map(v=>scale(mul(pow(d,v.e[0]),pow(t,v.e[2]),rising(v.e[1])),v.c)));
 const R=add(pow(s,2),scale(s,-2),d),A=add(R,mul(t,pow(s,2)));
 const u=add(pow(d,2),mul(t,d,dp(1))),L=sub(E(pow(A,2)),pow(u,2));
 const N=add(mul(sub(s,d),sub(A,u)),mul(s,deriv(A,1)));
 assertEq(E(A),u,'shared u');assertEq(E(N),scale(u,4),'shared EN');
 const Lexp=scale(mul(d,add(add(scale(pow(d,2),2),d,C(1)),
   mul(t,add(scale(pow(d,2),4),scale(d,6),C(2))),
   mul(pow(t,2),add(scale(pow(d,2),2),scale(d,5),C(3))))),2);
 assertEq(L,Lexp,'shared L');
 let remainder=pow(N,2),quot=C(0);
 while(remainder.size){
  const k=Math.max(...[...remainder.values()].map(v=>v.e[1]));if(k<2)break;
  const lead=add(...[...remainder.values()].filter(v=>v.e[1]===k).map(v=>{const e=[...v.e];e[1]-=2;return T.term(e,v.c);}));
  quot=add(quot,lead);remainder=sub(remainder,mul(lead,R));
 }
 const b0=add(pow(d,4),scale(pow(d,3),-1),scale(pow(d,2),14),scale(d,6),C(4));
 const b1=add(scale(pow(d,4),2),scale(pow(d,3),6),scale(pow(d,2),16),scale(d,24),C(32));
 const b2=add(pow(d,4),scale(pow(d,3),7),scale(pow(d,2),14),scale(d,-14),C(64));
 const B=add(b0,mul(t,b1),mul(pow(t,2),b2));
 assertEq(E(quot),B,'shared E quotient');
 const c1=add(pow(d,2),C(-2),mul(t,add(pow(d,2),scale(d,4),C(-8))));
 const c2=add(mul(dp(-1),sub(pow(d,2),C(2))),mul(t,add(pow(d,3),pow(d,2),scale(d,-8),C(8))));
 const c3=add(pow(d,2),C(-2),mul(t,add(pow(d,2),scale(d,2),C(-4))));
 const rem0=scale(mul(pow(d,2),t,dp(-2),c3),-2);
 assertEq(remainder,add(mul(c1,c2,sub(d,scale(s,2))),rem0),'shared signed remainder');
 function positiveShift(p,shift,label){
  let pp=C(0);
  for(const v of p.values()){assert.equal(v.e[1],0);for(let j=0;j<=v.e[0];j++)pp=add(pp,T.term([j,0,v.e[2]],v.c.mul(choose(v.e[0],j)).mul(q(shift).pow(v.e[0]-j))));}
  assert([...pp.values()].every(v=>z.le(v.c)),label);
  return {terms:pp.size,minCoefficient:[...pp.values()].reduce((a,v)=>v.c.lt(a)?v.c:a,[...pp.values()][0]?.c??z)};
 }
 for(const p of [c1,c2,c3])positiveShift(p,2,'nonnegative shared remainder bracket');
 const numerator=add(B,scale(u,16)),den=scale(mul(d,L),3);
 const checks={uniformD3:positiveShift(sub(scale(den,173),scale(numerator,594)),3,'shared uniform d>=3')};
 for(const [dim,num,dd] of [[2,6,11],[3,173,594],[4,175,888]]){
  const p=sub(scale(den,num),scale(numerator,dd));
  const at=add(...[...p.values()].map(v=>T.term([0,0,v.e[2]],v.c.mul(q(dim).pow(v.e[0])))));
  checks['dimension'+dim]=positiveShift(at,0,'fixed dimension continuum');
 }
 const D0=mul(dp(-1),dp(-2));
 const Ediv=p=>add(...[...p.values()].map(v=>{
  const k=v.e[1],mom=k===0?C(1):k===1?dp(-2):mul(D0,rising(k-2));
  return scale(mul(pow(d,v.e[0]),pow(t,v.e[2]),mom),v.c);
 }));
 const raw=Ediv(pow(N,2));
 const ep0=add(scale(pow(d,4),24),scale(pow(d,3),-78),scale(pow(d,2),78),scale(d,-32),C(8));
 const ep1=add(scale(pow(d,4),48),scale(pow(d,3),-108),scale(pow(d,2),36),scale(d,24));
 const ep2=add(scale(pow(d,4),24),scale(pow(d,3),-30),scale(pow(d,2),-18),scale(d,36));
 assertEq(raw,add(ep0,mul(t,ep1),mul(pow(t,2),ep2)),'shared inverse moments');
 const ivN=add(scale(pow(d,3),20),scale(pow(d,2),-51),scale(d,28),C(-4));
 const ivD=scale(mul(d,D0,add(scale(pow(d,2),2),d,C(1))),3);
 const n2=add(mul(d,raw),scale(mul(u,D0,add(dp(-1),mul(d,t))),16));
 const d2=mul(den,D0,add(dp(-1),mul(d,t)));
 const cross=sub(mul(ivN,d2),mul(ivD,n2));
 const make=cs=>add(...cs.map((c,k)=>scale(pow(d,k),c)));
 const F=add(make([24,-64,-40,161,-67,-82,40]),
  mul(t,make([12,-118,100,148,-246,-84,80])),
  mul(pow(t,2),make([0,-12,64,-21,-139,-2,40])));
 assertEq(cross,scale(mul(pow(d,2),t,D0,F),6),'shared inverse factorization');
 checks.inverseFactor=positiveShift(F,4,'positive inverse factor');
 checks.inverseContinuum=positiveShift(cross,4,'shared inverse decreases vs lambda0');
 const pn=add(pow(d,4),scale(pow(d,3),-1),scale(pow(d,2),30),scale(d,6),C(4));
 const pd=scale(mul(pow(d,2),add(scale(pow(d,2),2),d,C(1))),6);
 checks.inverseFrom5=positiveShift(sub(mul(pn,ivD),mul(ivN,pd)),5,'inverse is min at d>=5');
 return checks;
}
const sharedContinuum=sharedHolomorphicCertificates();

// Conditional gamma/exponential moment implementation.
const gammaMoment=(d,k)=>{let a=1n;for(let j=0;j<k;j++)a*=BigInt(d+j);return q(a);};
function uniMul(a,b){let r=Array(a.length+b.length-1).fill(z);a.forEach((x,i)=>b.forEach((y,j)=>r[i+j]=r[i+j].add(x.mul(y))));return r;}
const uniPow=(p,n)=>{let r=[one];for(let j=0;j<n;j++)r=uniMul(r,p);return r;};
function momentsModel(blocks,bulk=0){
 blocks=blocks.map(([d,a,c=0])=>({d,a:q(a),holo:q(c),lambda:q(c).pow(2)}));bulk=q(bulk);
 const baseMoment=(j,k,mark=0)=>{const B=blocks[j],r=uniPow([q(B.d),q(-2),one.add(B.lambda)],k);return sum(r.map((c,l)=>c.mul(gammaMoment(B.d,l+mark))));};
 function conv(a,b,n){let r=Array(n+1).fill(z);for(let k=0;k<=n;k++)for(let j=0;j<=k;j++)r[k]=r[k].add(q(choose(k,j)).mul(a[j]).mul(b[k-j]));return r;}
 function mixed(n,j=-1,mark=0){
  let vals=Array(n+1).fill(z);vals[0]=one;
  for(let i=0;i<blocks.length;i++)vals=conv(vals,Array.from({length:n+1},(_,k)=>baseMoment(i,k,i===j?mark:0).mul(blocks[i].a.pow(2*k))),n);
  vals=conv(vals,Array.from({length:n+1},(_,k)=>q(fact(k)).pow(2).mul(bulk.pow(2*k))),n);return vals[n];
 }
 const u=mixed(1),delta=mixed(2).sub(u.pow(2)).mul(2);
 const localU=B=>q(B.d*B.d).add(B.lambda.mul(B.d*(B.d+1)));
 const localL=B=>q(2*B.d).mul(q(2*B.d*B.d+B.d+1).add(B.lambda.mul(4*B.d*B.d+6*B.d+2)).add(B.lambda.pow(2).mul(2*B.d*B.d+5*B.d+3)));
 eq(delta,sum(blocks.map(B=>B.a.pow(4).mul(localL(B)).mul(2))).add(bulk.pow(4).mul(6)),'same-law delta of sum');
 const vMoment=k=>mixed(k).mul(fact(k));
 const cMoment=(k,j)=>mixed(k,j,1).sub(mixed(k).mul(blocks[j].d));
 function profile(h){
  h=h.map(x=>q(x));const k=h.map(()=>z);
  for(let n=0;n<h.length;n++)for(let j=0;j<=n;j++)k[j]=k[j].add(h[n].mul(q(fact(n),fact(j))).mul(u.pow(n-j)));
  const f=k.slice(1).map((a,j)=>a.mul(j+1));
  const content=blocks.map((B,j)=>B.a.div(B.d).mul(sum(h.map((a,k)=>a.mul(fact(k+1)).mul(cMoment(k,j))))));
  const viaPairing=blocks.map((B,j)=>B.a.div(B.d).mul(sum(f.map((a,k)=>a.mul(fact(k+1)).mul(
   cMoment(k+1,j).sub(cMoment(k,j).mul(u)).add(B.a.pow(2).mul(mixed(k,j,2).mul(one.add(B.lambda)).sub(mixed(k,j,1)).mul(2)))
  )))));
  content.forEach((a,j)=>eq(a,viaPairing[j],'signed pairing, diagonal matrix coordinate'));
  const norm2=sum(content.map((c,j)=>c.pow(2).mul(blocks[j].d)));
  const g=sum(f.flatMap((a,i)=>f.map((b,j)=>a.mul(b).mul(vMoment(i+j+1))))),mean=sum(f.map((a,i)=>a.mul(vMoment(i+1))));
  const omega=g.mul(q(3,2)).sub(mean.pow(2).div(u).mul(q(3,4)));
  const bound=blocks.filter(B=>B.a.n).map(B=>theta(B.d)).reduce((a,b)=>a.le(b)?b:a,z);
  assert(norm2.le(bound.mul(delta).mul(omega)),'content-law on polynomial instance');
  if(h.length===2&&h[0].eq(0)&&h[1].eq(1)){
   eq(norm2,sum(blocks.map(B=>B.a.pow(6).mul(localU(B).pow(2)).mul(q(16,B.d)))),'nonzero content formula');
   eq(omega,u.mul(q(3,4)),'Omega of v');
  }
  return {content,norm2,omega};
 }
 return {blocks,bulk,u,delta,vMoment,profile};
}

// Independent Gaussian monomial/Wick engine, using the Ginibre-entry form.
function wickAudit(M){
 const n=M.blocks.reduce((a,B)=>a+B.d*B.d+B.d+(B.holo.n?B.d*B.d:0),0)+(M.bulk.n?3:0);
 const W=algebra(2*n),variable=(i,bar=false)=>W.X(i+(bar?n:0));
 let Qp=W.C(0),next=0,diagonals=new Map();
 for(let j=0;j<M.blocks.length;j++){
  const B=M.blocks[j],start=next,ys=next+B.d*B.d;
  for(let a=0;a<B.d;a++)for(let b=0;b<B.d;b++){
   const xi=start+a*B.d+b;
   Qp=W.add(Qp,W.scale(W.mul(variable(xi),variable(ys+a,true),variable(ys+b)),B.a));
   if(a===b){Qp=W.add(Qp,W.scale(variable(xi),B.a.neg()));diagonals.set(xi,j);}
  }next+=B.d*B.d+B.d;
  if(B.holo.n){
   for(let a=0;a<B.d;a++)for(let b=0;b<B.d;b++)Qp=W.add(Qp,W.scale(W.mul(variable(next+a*B.d+b,true),variable(ys+a),variable(ys+b)),B.a.mul(B.holo)));
   next+=B.d*B.d;
  }
 }
 if(M.bulk.n)Qp=W.add(Qp,W.scale(W.mul(variable(next,true),variable(next+1),variable(next+2)),M.bulk));
 function inner(A,B){
  const groups=new Map();
  for(const v of B.values()){const key=v.e.slice(0,n).map((a,j)=>a-v.e[n+j]).join(',');if(!groups.has(key))groups.set(key,[]);groups.get(key).push(v);}
  let result=z;
  for(const v of A.values()){
   const key=v.e.slice(0,n).map((a,j)=>a-v.e[n+j]).join(',');
   for(const w of groups.get(key)??[]){let value=v.c.mul(w.c);for(let j=0;j<n;j++)value=value.mul(fact(v.e[n+j]+w.e[j]));result=result.add(value);}
  }return result;
 }
 const powers=[W.C(1),Qp,W.pow(Qp,2),W.pow(Qp,3)];
 for(let k=1;k<=3;k++)eq(inner(powers[k],powers[k]),M.vMoment(k),'independent Wick radial moment');
 for(let k=0;k<=2;k++){
  const h=Array(k+1).fill(0);h[k]=1;const prof=M.profile(h);
  for(let j=0;j<n;j++)eq(inner(W.mul(variable(j),powers[k]),powers[k+1]),diagonals.has(j)?prof.content[diagonals.get(j)]:z,'independent Wick content, including zeros');
 }
 return {dimensions:M.blocks.map(B=>B.d),amplitudes:M.blocks.map(B=>B.a),sharedHolomorphicLambda:M.blocks.map(B=>B.lambda),bulk:M.bulk,gaussianCoordinates:n,terms:Qp.size,u:M.u,delta:M.delta};
}
const models=[
 momentsModel([[2,1]]),
 momentsModel([[3,1]]),
 momentsModel([[2,1],[3,q(1,2)]],q(2,3)),
 momentsModel([[4,q(2,3)]],q(1,4)),
 momentsModel([[3,q(1,2)],[3,q(3,2)]],q(1,3)),
 momentsModel([[2,1,1]]),
 momentsModel([[3,1,2]]),
 momentsModel([[3,1,q(1,2)],[4,q(1,3),1]],q(1,2)),
];
const wick=models.map(wickAudit);
let profileChecks=0;
for(const M of models)for(const h of [[1],[0,1],[0,0,1],[1,-2,3],[0,1,0,-1],[1,0,0,0,1]]){M.profile(h);profileChecks++;}
eq(models[0].profile([0,1]).norm2.div(models[0].delta.mul(models[0].profile([0,1]).omega)),q(16,33),'d2 profile-free lower bound');
eq(models[1].profile([0,1]).norm2.div(models[1].delta.mul(models[1].profile([0,1]).omega)),q(8,33),'d3 profile-free lower bound');

// Exact decimal sufficient inequalities for profile regularity, inherited
// from the signed-pairing packet. sqrt(3) is enclosed rationally.
const dec=s=>{const neg=s.startsWith('-');if(neg)s=s.slice(1);const [a,b='']=s.split('.');return q((neg?-1n:1n)*BigInt(a+b),10n**BigInt(b.length));};
const rows=JSON.parse(fs.readFileSync(path.join(root,'rows.json'),'utf8'));
const rowList=Array.isArray(rows)?rows:rows.rows;
assert(q(5,3).pow(2).lt(3));assert(q(3).lt(q(7,4).pow(2)));assert(q(7,5).pow(2).lt(2));
let rowChecks=0;
for(const row of rowList){
 const l=dec(row.l??row.ell),beta=dec(row.beta),nu=dec(row.nu5),bA=dec(row.bA),bB=dec(row.bB);
 // The simple bounds below avoid all square roots: sqrt(3)<7/4,
 // sqrt(3)>5/3 and sqrt(2)>7/5.
 const p0lo=l.sub(beta.mul(2)).add(nu.mul(q(5,3)));
 const p1lo=beta.sub(nu.mul(q(7,4)));
 assert(q(1,2).lt(p0lo));assert(q(1,10).lt(p1lo));assert(z.lt(nu));
 assert(q(47,50).lt(one.add(bA)));assert(bA.lt(0));assert(bB.lt(0));
 assert(bB.neg().mul(q(5,7)).lt(bA.neg()));
 rowChecks++;
}
const report={status:'C PASS',arithmetic:'BigInt exact rational and polynomial arithmetic',symbolicChecks:'all d and all lambda>=0; shifted polynomial proofs, not samples',thetaAtDimensions:Object.fromEntries([2,3,4,5,8,16].map(d=>[d,theta(d)])),shifted,sharedContinuum,expUpper:eUpper,tangentFloorStrictlyAbove:'4/5',wickModels:wick,polynomialProfileChecks:profileChecks,verifiedProfileRows:rowChecks};
fs.mkdirSync(path.join(root,'results'),{recursive:true});
fs.writeFileSync(path.join(root,'results','replay.json'),JSON.stringify(report,null,2)+'\n');
console.log(JSON.stringify(report,null,2));
