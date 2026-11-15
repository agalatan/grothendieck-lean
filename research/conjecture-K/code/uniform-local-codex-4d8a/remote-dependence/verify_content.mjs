// handoff/codex-4d8a-compensated-joint/remote-dependence/verify_content.mjs; Agent-ID: codex-4d8a.
// Exact finite polynomial checks of UNIFORM_LOCAL_K.md §2; not a proof of the universal theorem.
import assert from 'node:assert/strict';

const add = (p, q, c = 1n) => {
  const out = new Map(p);
  for (const [k, v] of q) {
    const t = (out.get(k) ?? 0n) + c * v;
    if (t) out.set(k, t); else out.delete(k);
  }
  return out;
};
const scale = (p, c) => new Map([...p].map(([k,v]) => [k,v*c]).filter(([,v]) => v));
const mul = (p,q) => {
  const out = new Map();
  for (const [a,x] of p) for (const [b,y] of q) {
    const aa=a.split(',').map(Number), bb=b.split(',').map(Number);
    const k=aa.map((v,i)=>v+bb[i]).join(',');
    out.set(k,(out.get(k)??0n)+x*y);
  }
  for (const [k,v] of out) if(!v) out.delete(k);
  return out;
};
const derivative=(p,i)=>{
  const out=new Map();
  for(const [k,v] of p){
    const e=k.split(',').map(Number);
    if(e[i]){ const c=BigInt(e[i]); e[i]--; out.set(e.join(','),v*c); }
  }
  return out;
};
const directional=(p,h)=>h.reduce((s,v,i)=>add(s,derivative(p,i),v),new Map());
const expect=p=>{
  let out=0n;
  for(const [k,v] of p){
    let m=1n;
    for(const e of k.split(',').map(Number)){
      if(e%2){m=0n;break;}
      for(let j=1;j<e;j+=2)m*=BigInt(j);
    }
    out+=v*m;
  }
  return out;
};
const equal=(p,q)=>assert.equal(add(p,q,-1n).size,0);

function check(n,seed){
  const zero=Array(n).fill(0).join(','), one=new Map([[zero,1n]]);
  const monomial=(indices,c=1n)=>{
    const e=Array(n).fill(0); for(const i of indices)e[i]++;
    return new Map([[e.join(','),c]]);
  };
  const X=Array.from({length:n},(_,i)=>monomial([i]));
  const f=(i,j,k)=>{
    const z=[i,j,k].sort((a,b)=>a-b);
    return BigInt(((7*z[0]+5*z[1]+3*z[2]+seed)%5)-2);
  };
  let F=new Map();
  for(let i=0;i<n;i++)for(let j=0;j<n;j++)for(let k=0;k<n;k++)
    F=add(F,monomial([i,j,k]),f(i,j,k));
  for(let i=0;i<n;i++)for(let j=0;j<n;j++)F=add(F,X[i],-3n*f(i,j,j));
  if(!F.size)return;
  const A=Array.from({length:n},(_,i)=>Array.from({length:n},(_,j)=>{
    let v=0n;for(let a=0;a<n;a++)for(let b=0;b<n;b++)v+=f(i,a,b)*f(j,a,b);
    return v;
  }));
  const S3=(i,j,k,l)=>{
    let v=0n;for(let r=0;r<n;r++)v+=f(r,i,j)*f(r,k,l)+f(r,i,k)*f(r,j,l)+f(r,i,l)*f(r,j,k);
    return v;
  };
  const I2=g=>{
    let out=new Map();
    for(let i=0;i<n;i++)for(let j=0;j<n;j++){
      out=add(out,monomial([i,j]),g(i,j));
      if(i===j)out=add(out,one,-g(i,j));
    }
    return out;
  };
  const D=X.map((_,i)=>derivative(F,i));
  const Gamma=D.reduce((s,p)=>add(s,mul(p,p)),new Map());
  const Gamma2=scale(I2((i,j)=>A[i][j]),36n);
  const Gamma4=add(add(Gamma,Gamma2,-1n),one,-expect(Gamma));
  const powers=[one];for(let k=1;k<=6;k++)powers.push(mul(powers[k-1],F));
  const variance=expect(powers[2]), kappa=expect(powers[4])-3n*variance**2n;
  const a2=A.flat().reduce((s,v)=>s+v*v,0n);
  let s3sq=0n;
  for(let i=0;i<n;i++)for(let j=0;j<n;j++)for(let k=0;k<n;k++)for(let l=0;l<n;l++)s3sq+=S3(i,j,k,l)**2n;
  assert.equal(kappa,1296n*a2+216n*s3sq);
  assert(kappa>0n);
  let tests=0;
  for(const h of [Array.from({length:n},(_,i)=>i===0?1n:0n),Array.from({length:n},(_,i)=>BigInt(i%2?-(i+1):i+1))]){
    const Dh2=directional(Gamma2,h),Dh4=directional(Gamma4,h);
    let P12=new Map();
    for(let i=0;i<n;i++){
      P12=add(P12,mul(D[i],derivative(Dh2,i)),3n);
      P12=add(P12,mul(D[i],derivative(Dh4,i)));
    }
    const Ah=A.map(row=>row.reduce((s,v,i)=>s+v*h[i],0n));
    let explicit=scale(I2((i,j)=>Ah.reduce((s,v,k)=>s+v*f(k,i,j),0n)),648n);
    for(let j=0;j<n;j++)explicit=add(explicit,mul(I2((a,b)=>f(j,a,b)),I2((a,b)=>h.reduce((s,v,k)=>s+v*S3(k,j,a,b),0n))),108n);
    equal(P12,explicit);
    const Xh=h.reduce((s,v,i)=>add(s,X[i],v),new Map());
    for(let k=0;k<=6;k++){
      const lhs=12n*expect(mul(Xh,powers[k]));
      const rhs=k<3?0n:BigInt(k*(k-1)*(k-2))*expect(mul(powers[k-3],P12));
      assert.equal(lhs,rhs);tests++;
    }
    const pnorm12=expect(mul(P12,P12)),h2=h.reduce((s,v)=>s+v*v,0n);
    assert(pnorm12**2n <= (144n*72900n)**2n*a2**3n*h2**2n);
    assert(16n**2n*pnorm12**2n <= 625n*kappa**3n*144n**2n*h2**2n);
  }
  return {dimension:n,seed,polynomial_identity_tests:tests,kappa:String(kappa)};
}
const cases=[];
for(const n of [1,2,3])for(const seed of [0,1,3]){
  const c=check(n,seed);if(c)cases.push(c);
}
console.log(JSON.stringify({agent_id:'codex-4d8a',status:'PASS',arithmetic:'BigInt, exact',cases,
  scope:'Finite tensor tests: cumulant identity, P_h formula, Gaussian integration by parts for powers 0 through 6, and the 5/4 content constant. Existential local-K thresholds are not numerically evaluated.'},null,2));
