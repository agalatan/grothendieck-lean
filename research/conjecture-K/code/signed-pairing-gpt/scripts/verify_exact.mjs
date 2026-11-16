// scripts/verify_exact.mjs
// C: exact BigInt replay, including every real rho in every certificate cell.
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
const root=path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const payload=JSON.parse(fs.readFileSync(path.join(root,'results/certificate.json'),'utf8'));
const fail=m=>{throw new Error(m);};
const gcd=(a,b)=>{a=a<0n?-a:a;b=b<0n?-b:b;while(b){[a,b]=[b,a%b];}return a;};
const rat=(n,d=1n)=>{if(!d)fail('zero denominator');if(d<0n){n=-n;d=-d;}const g=gcd(n,d);return [n/g,d/g];};
const add=(a,b)=>rat(a[0]*b[1]+b[0]*a[1],a[1]*b[1]);
const mul=(a,b)=>rat(a[0]*b[0],a[1]*b[1]);
const cmp=(a,b)=>a[0]*b[1]-b[0]*a[1];
const parse=a=>rat(BigInt(a[0]),BigInt(a[1]));
const fmt=a=>`${a[0]}/${a[1]}`;
const decimal=(a,digits=9)=>{
  const scale=10n**BigInt(digits);const n=(a[0]*scale+a[1]-1n)/a[1];
  return `${n/scale}.${String(n%scale).padStart(digits,'0')}`;
};
const fac=n=>{let r=1n;for(let k=2;k<=n;k++)r*=BigInt(k);return r;};
const bin=(n,k)=>fac(n)/(fac(k)*fac(n-k));
const key=i=>i.join(',');
const weight=i=>i.reduce((v,x)=>v*fac(x),1n);
function indices(D,ch){const out=[];for(let a=0;a<=D;a++)for(let b=0;b<=D-a;b++)for(let c=0;c<=D-a-b;c++)for(let d=0;d<=D-a-b-c;d++)if(a-b+c-d===ch)out.push([a,b,c,d]);return out;}
function productCore(i,j){
  const [a,b,c,d]=i,[e,f]=j,out=[];
  for(let r=0;r<=Math.min(a,f);r++)for(let s=0;s<=Math.min(b,e);s++)
    out.push([[a+e-r-s,b+f-r-s,c,d],bin(a,r)*bin(f,r)*fac(r)*bin(b,s)*bin(e,s)*fac(s)]);
  return out;
}
if(payload.format!=='wick-null-certificate-v1'||payload.degree!==14||payload.bits!==80)fail('unexpected certificate format');
const D=payload.degree,S=1n<<BigInt(payload.bits);
const cols=[...indices(D,0).map(i=>['A',i]),...indices(D,-2).map(i=>['B',i])];
const outs=indices(D+3,-1),loc=new Map(outs.map((i,j)=>[key(i),j])),weights=outs.map(weight);
const target=outs.map(()=>0n);
for(const [i,v] of [[[0,1,0,0],12n],[[1,2,0,0],16n],[[2,3,0,0],3n]])target[loc.get(key(i))]=v;
const op=cols.map(([typ,i])=>{
  const k=i.slice();k[typ==='A'?1:0]++;
  const rhs=[];
  for(const [j,factor,axis] of typ==='A'?[[[1,1],2n,3],[[0,2],1n,2]]:[[[2,0],1n,3],[[1,1],2n,2]])
    for(const [p,v] of productCore(i,j)){const kk=p.slice();kk[axis]++;rhs.push([loc.get(key(kk)),factor*v]);}
  return {left:loc.get(key(k)),rhs};
});
const normAt=(z0,z1,r)=>{
  const [n,d]=r;let sum=0n;
  for(let i=0;i<outs.length;i++){const z=d*z0[i]+n*z1[i];sum+=weights[i]*z*z;}
  return rat(sum,S*S*d*d);
};
const corr=r=>rat(1024n*r[0]*r[0],r[1]*r[1]+2n*r[0]*r[0]);
const thresholds=payload.thresholds.map(t=>({...t,cap:parse(t.rho_max),bound:parse(t.theta),max:rat(0n),count:0}));
const expected=[['0.80',11n,100n,7n,20n],['0.82',13n,100n,3n,5n],['0.84',1n,5n,13n,10n],['0.845',1n,4n,9n,5n],['0.85',1n,3n,12n,5n],['0.855',3n,5n,18n,5n]];
for(let i=0;i<expected.length;i++){const [row,n,d,tn,td]=expected[i];const t=thresholds[i];if(!t||t.row!==row||cmp(t.cap,rat(n,d))||cmp(t.bound,rat(tn,td)))fail('threshold mismatch');}
let previous=rat(0n);let smallestMargin=null;
for(const cell of payload.cells){
  const lo=parse(cell.lo),hi=parse(cell.hi);
  if(cmp(lo,previous)!==0n||cmp(hi,lo)<=0n)fail('cover gap or reversed cell');previous=hi;
  if(cell.coeff.length!==cols.length)fail('column count');
  const z0=target.map(t=>t*S),z1=target.map(()=>0n);
  cell.coeff.forEach((s,j)=>{const c=BigInt(s),o=op[j];z0[o.left]-=c;for(const [i,v]of o.rhs)z1[i]+=c*v;});
  const a=normAt(z0,z1,lo),b=normAt(z0,z1,hi),max=cmp(a,b)>0n?a:b;
  const upper=mul(add(max,corr(hi)),rat(1n,252n));
  for(const t of thresholds){
    if(cmp(hi,t.cap)<=0n){
      if(cmp(upper,t.bound)>0n)fail(`failed ${t.row} on [${fmt(lo)},${fmt(hi)}]: ${decimal(upper)}`);
      t.count++;if(cmp(upper,t.max)>0n)t.max=upper;
    }else if(cmp(lo,t.cap)<0n)fail('threshold not a cell boundary');
  }
}
if(cmp(previous,rat(3n,5n))!==0n)fail('cover endpoint');
// Independent exact pairing checks on polynomial functions of Q.
// These supplement, rather than replace, the universal integration-by-parts proof.
const poly=terms=>new Map(terms.map(([i,v])=>[key(i),v]));
const pconj=p=>new Map([...p].map(([k,v])=>{const [a,b,c,d]=k.split(',').map(Number);return[key([b,a,d,c]),v];}));
function product(p,q){
  const out=new Map();
  for(const [ik,iv]of p)for(const [jk,jv]of q){
    const i=ik.split(',').map(Number),j=jk.split(',').map(Number);
    for(const [x,vx]of productCore([i[0],i[1],0,0],[j[0],j[1]]))
      for(const [w,vw]of productCore([i[2],i[3],0,0],[j[2],j[3]])){
        const k=key([x[0],x[1],w[0],w[1]]);
        out.set(k,(out.get(k)??0n)+iv*jv*vx*vw);
      }
  }
  return new Map([...out].filter(([,v])=>v!==0n));
}
const pair=(p,q)=>{let out=0n;for(const [k,v]of p){const [a,b,c,d]=k.split(',').map(Number);out+=v*(q.get(key([b,a,d,c]))??0n)*weight([a,b,c,d]);}return out;};
const targetPoly=new Map(outs.map((i,j)=>[key(i),target[j]]).filter(([,v])=>v));
const xbar=poly([[[0,1,0,0],1n]]);
let nullChecks=0,wrongSignRejections=0;
for(const rho of [1n,2n]){
  const Q=poly([[[2,1,0,0],rho],[[0,0,1,0],1n]]),V=product(Q,pconj(Q));
  const QV=product(Q,V),QV2=product(QV,V),u=2n*rho*rho+1n;
  if(pair(xbar,QV)!==32n*rho**3n)fail('direct mixed-model h=v content');
  if(pair(xbar,QV2)!==rho*rho*(2n*pair(targetPoly,QV)+2n*u*pair(targetPoly,Q)))fail('mixed-model h=v^2 identity');
  for(const f of [Q,QV,QV2])for(const o of op){
    const left=pair(poly([[outs[o.left],1n]]),f);
    let right=0n;for(const [i,v]of o.rhs)right+=pair(poly([[outs[i],v]]),f);
    if(left-rho*right!==0n)fail('polynomial null identity');
    if(left+rho*right!==0n)wrongSignRejections++;
    nullChecks++;
  }
}
if(!wrongSignRejections)fail('null checks did not exercise a nonzero cancellation');
// Independent elementary moment checks, using rational univariate integration.
const pmul=(a,b)=>{const c=Array(a.length+b.length-1).fill(0n);a.forEach((v,i)=>b.forEach((w,j)=>c[i+j]+=v*w));return c;};
const moment=p=>p.reduce((v,c,i)=>v+c*fac(i),0n);
const T=[0n,1n],Tm2=[-2n,1n],R=[-2n,-2n,3n];
const f=pmul(T,pmul(Tm2,Tm2));
if(moment(f)!==2n||moment(pmul(f,f))!==176n)fail('Wick cubic moments');
if(moment(pmul(T,pmul(R,R)))!==764n)fail('C norm');
if(moment(pmul(T,pmul(R,Tm2)))!==32n)fail('C-p pairing');
if(moment(pmul(T,pmul(Tm2,f)))!==32n)fail('h(v)=v content');
const lower=rat(32n*32n,168n*3n*2n/4n);
if(cmp(lower,rat(256n,63n))!==0n)fail('monomial obstruction');
const results=thresholds.map(t=>{
  const energy=rat(2n*t.cap[0]**2n,t.cap[1]**2n+2n*t.cap[0]**2n);
  const chi=mul(rat(42n),mul(energy,energy));
  return {row:t.row,rho_max:fmt(t.cap),energy_fraction_max:fmt(energy),chi_max:fmt(chi),chi_max_decimal_ceiling:decimal(chi),theta:fmt(t.bound),verified_theta_upper_ceiling:decimal(t.max),cells:t.count};
});
const output={status:'C: PASS; all arithmetic in inequalities is BigInt rational',degree:D,columns:cols.length,cells:payload.cells.length,null_pairing_instance_checks:nullChecks,wrong_sign_mutations_rejected:wrongSignRejections,monomial_h_v_ratio:fmt(lower),results};
fs.writeFileSync(path.join(root,'results','exact_verification.json'),JSON.stringify(output,null,2)+'\n');
console.log(JSON.stringify(output,null,2));
