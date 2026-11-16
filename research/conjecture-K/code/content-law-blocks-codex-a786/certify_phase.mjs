// content_law_blocks_a786/certify_phase.mjs
// Directed fixed-point interval arithmetic using BigInt; no floating-point bounds.
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {fileURLToPath} from 'node:url';

const BITS=256n,S=1n<<BITS,N=8192,TERMS=128,MAX_EXP=60n;
const ceil=(n,d)=>(n+d-1n)/d;
const I=(n,d=1n)=>{n=BigInt(n);d=BigInt(d);assert(n>=0n&&d>0n);return [n*S/d,ceil(n*S,d)];};
const add=(a,b)=>[a[0]+b[0],a[1]+b[1]];
const mul=(a,b)=>[a[0]*b[0]/S,ceil(a[1]*b[1],S)];
const div=(a,b)=>{assert(b[0]>0n);return [a[0]*S/b[1],ceil(a[1]*S,b[0])];};
const byInt=(a,d)=>[a[0]/BigInt(d),ceil(a[1],BigInt(d))];
function pow(a,n){let r=I(1);for(let j=0;j<n;j++)r=mul(r,a);return r;}
function factorial(n){let r=1n;for(let j=2;j<=n;j++)r*=BigInt(j);return r;}
function expInterval(x){
  assert(x[0]>=0n&&x[1]<=MAX_EXP*S);
  let term=I(1),total=I(1);
  for(let j=1;j<=TERMS;j++){term=byInt(mul(term,x),j);total=add(total,term);}
  const next=byInt(mul(term,x),TERMS+1);
  // All ratios in the remainder after term TERMS+1 are at most 60/(TERMS+2).
  const tail=ceil(next[1]*BigInt(TERMS+2),BigInt(TERMS+2)-MAX_EXP);
  return [total[0],total[1]+tail];
}
function endpoint(m,j){
  const t=I(BigInt(m*j),BigInt(N)),e=expInterval(t);
  const plus=I(BigInt(m*(N+j)),BigInt(N)),minus=I(BigInt(m*(N-j)),BigInt(N));
  return {A:div(pow(plus,m-1),e),B:mul(pow(minus,m-1),e)};
}
function phiPoint(x,y){assert(x+y>0n);const d=x-y,n=d*d;return [n/(x+y),ceil(n,x+y)];}
function phiBox(A,B){
  let low=0n;
  if(A[0]>B[1])low=phiPoint(A[0],B[1])[0];
  else if(B[0]>A[1])low=phiPoint(A[1],B[0])[0];
  const vals=[phiPoint(A[0],B[0])[1],phiPoint(A[0],B[1])[1],phiPoint(A[1],B[0])[1],phiPoint(A[1],B[1])[1]];
  return [low,vals.reduce((a,b)=>a>b?a:b)];
}
function decimal(n,up=false){const scale=10000000000n;let v=up?ceil(n*scale,S):n*scale/S;const s=v.toString().padStart(11,'0');return s.slice(0,-10)+'.'+s.slice(-10);}
function certifyOne(m,target){
  assert(m>=2&&2*m<=Number(MAX_EXP));
  let total=I(0),left=endpoint(m,0);
  const peakB=mul(pow(I(m-1),m-1),expInterval(I(1)));
  for(let j=1;j<=N;j++){
    const right=endpoint(m,j);
    // A decreases on [0,m]; B increases up to 1 and decreases afterwards.
    const A=[right.A[0],left.A[1]],B=[left.B[0]<right.B[0]?left.B[0]:right.B[0],left.B[1]>right.B[1]?left.B[1]:right.B[1]];
    if(m*(j-1)<=N&&N<=m*j&&peakB[1]>B[1])B[1]=peakB[1];
    total=add(total,phiBox(A,B));left=right;
  }
  const integral=mul(total,I(m,N));
  const densityFactor=byInt(div(I(1),expInterval(I(m))),factorial(m-1));
  let poisson=I(0);for(let j=0;j<m;j++)poisson=add(poisson,I(BigInt(2*m)**BigInt(j),factorial(j)));
  const tail=div(poisson,expInterval(I(2*m)));
  const bound=add(mul(densityFactor,integral),tail);
  assert(bound[1]*BigInt(target[1])<=BigInt(target[0])*S,`alpha_${m} interval exceeds target`);
  return {m,target:target.join('/'),lowerNumerator:bound[0].toString(),upperNumerator:bound[1].toString(),denominator:S.toString(),decimalLower:decimal(bound[0]),decimalUpper:decimal(bound[1],true),status:'PASS'};
}
export function certifyPhase(){
  const targets=[[2,[21,100]],[3,[21,100]],[4,[11,100]],[5,[11,100]],[6,[11,100]],[12,[11,250]],[13,[1,20]],[23,[3,125]],[24,[3,125]],[25,[3,125]],[26,[3,125]],[27,[3,125]]];
  const result={label:'C: outward interval integration, all arithmetic BigInt',bits:Number(BITS),panels:N,exponentialTaylorTerms:TERMS,exponentialArgumentCap:Number(MAX_EXP),bounds:targets.map(([m,target])=>certifyOne(m,target))};
  fs.writeFileSync(new URL('./phase_intervals.json',import.meta.url),JSON.stringify(result,null,2)+'\n');
  return result;
}
if(process.argv[1]&&fileURLToPath(import.meta.url)===fs.realpathSync(process.argv[1])){
  const r=certifyPhase();console.log(JSON.stringify({status:'PASS',label:'C',panels:N,bounds:r.bounds.map(({m,target,decimalLower,decimalUpper})=>({m,target,decimalLower,decimalUpper}))},null,2));
}
