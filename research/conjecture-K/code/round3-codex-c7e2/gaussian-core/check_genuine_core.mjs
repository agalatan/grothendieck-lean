// /workspace/scratch/f307e93b3610/codex-c7e2-round3/gaussian-core/check_genuine_core.mjs
// Exact checks for the finite genuine core and explicit shared-driver cutoffs.
import assert from 'node:assert/strict';
const gcd=(a,b)=>b?gcd(b,a%b):a;
const F=(a,b=1n)=>{a=BigInt(a);b=BigInt(b);const d=gcd(a<0n?-a:a,b);return[a/d,b/d];};
const add=(a,b)=>F(a[0]*b[1]+b[0]*a[1],a[1]*b[1]);
const sub=(a,b)=>F(a[0]*b[1]-b[0]*a[1],a[1]*b[1]);
const mul=(a,b)=>F(a[0]*b[0],a[1]*b[1]);
const lt=(a,b)=>a[0]*b[1]<b[0]*a[1];
const fact=n=>{let p=1n;for(let k=2n;k<=n;k++)p*=k;return p;};
const str=a=>`${a[0]}/${a[1]}`;
function lagrange(m){
  const terms=new Map();
  const put=(h,a,c)=>{h.sort((x,y)=>x-y);a.sort((x,y)=>x-y);const k=h.join(',')+'|'+a.join(',');terms.set(k,(terms.get(k)||0n)+c);};
  const norm=p=>{for(const x of p)for(const y of p)put([...x.h,...y.a],[...x.a,...y.h],x.c*y.c);};
  norm(Array.from({length:m},(_,i)=>({h:[i],a:[m+i],c:1n})));
  for(let i=0;i<m;i++)for(let j=i+1;j<m;j++)norm([{h:[i,m+j],a:[],c:1n},{h:[j,m+i],a:[],c:-1n}]);
  for(let i=0;i<m;i++)for(let j=0;j<m;j++)put([i,m+j],[i,m+j],-1n);
  assert([...terms.values()].every(x=>x===0n),'Complex Lagrange identity');
}
const rows=[
  {m:4,C:F(22,7),lambda:F(37,20),shared:540000n,independent:160000n},
  {m:8,C:F(42,25),lambda:F(79,50),shared:210000n,independent:84000n},
  {m:16,C:F(32,25),lambda:F(7,5),shared:126000n,independent:64000n},
];
const output=[];
for(const row of rows){
  const m=BigInt(row.m);lagrange(row.m);
  const ratio=F(fact(2n*m-4n),4n**(m-2n)*fact(m-2n)*fact(m-1n));
  const piCoefficient=mul(F(m**3n),mul(ratio,ratio));
  assert(!lt(row.C,mul(F(22,7),piCoefficient)),'C upper bound using pi<22/7');
  const offset=add(F(1),F(3,8n*m));
  const radicand=add(F(9,64n*m*m),F(9,4n*m));
  const reserve=sub(row.lambda,offset);
  assert(lt(F(0),reserve)&&lt(radicand,mul(reserve,reserve)),'lambda upper bound');
  const factor=mul(row.C,mul(row.lambda,row.lambda));
  assert(lt(mul(F(125,row.shared),factor),F(1,400)),'shared threshold');
  assert(!lt(F(1,400),mul(F(125,row.independent),row.C)),'independent threshold');
  output.push({m:row.m,core_complex_coordinates:row.m*(row.m+3)/2+1,C_pi_coefficient:str(piCoefficient),C_upper:str(row.C),lambda_upper:str(row.lambda),shared_V_cap:`1/${row.shared}`,independent_V_cap:`1/${row.independent}`,normalized_fourth_excess:str(add(F(4,m),F(2,m*m)))});
}
// Joint total-degree refinement: only one radial excitation can occur.
const jointOffset=add(F(1),F(3,32));
const jointRadicand=add(F(9,1024),F(9,32));
const jointReserve=sub(F(49,30),jointOffset);
assert(lt(F(0),jointReserve)&&lt(jointRadicand,mul(jointReserve,jointReserve)));
assert.deepEqual(mul(F(32,25),F(49,30)),F(784,375));
assert(lt(mul(F(125,105000),F(784,375)),F(1,400)));
console.log(JSON.stringify({status:'PASS',exact_complex_Lagrange_identity:true,u_min:'1/25',rows:output,joint_degree_refinement:{m:16,Lambda_upper:'49/30',weighted_upper:'784/375',shared_V_cap:'1/105000'}},null,2));
