// Intended filepath: handoff/codex-c7e2-round3/odd-taylor/check_odd_region.mjs
import assert from 'node:assert/strict';

const abs=n=>n<0n?-n:n;
const gcd=(a,b)=>{a=abs(a);b=abs(b);while(b)[a,b]=[b,a%b];return a;};
class Q {
  constructor(n,d=1n){n=BigInt(n);d=BigInt(d);assert(d!==0n);if(d<0n){n=-n;d=-d;}const g=gcd(n,d);this.n=n/g;this.d=d/g;}
  add(x){x=q(x);return new Q(this.n*x.d+x.n*this.d,this.d*x.d);}
  sub(x){x=q(x);return new Q(this.n*x.d-x.n*this.d,this.d*x.d);}
  mul(x){x=q(x);return new Q(this.n*x.n,this.d*x.d);}
  div(x){x=q(x);return new Q(this.n*x.d,this.d*x.n);}
  pow(k){assert(k>=0);return new Q(this.n**BigInt(k),this.d**BigInt(k));}
  cmp(x){x=q(x);const n=this.n*x.d-x.n*this.d;return n<0n?-1:n>0n?1:0;}
  str(){return `${this.n}/${this.d}`;}
  num(){return Number(this.n)/Number(this.d);}
}
const q=x=>x instanceof Q?x:new Q(x);
function binom(n,k){if(k<0||k>n)return 0n;let r=1n;for(let j=1;j<=k;j++)r=r*BigInt(n-j+1)/BigInt(j);return r;}
const zero=()=>new Q(0n);
function mul(a,b){const c=Array.from({length:a.length+b.length-1},zero);a.forEach((x,i)=>b.forEach((y,j)=>c[i+j]=c[i+j].add(x.mul(y))));return c;}
function shiftedPower(p,a,width=new Q(1n)){
  return p.map((_,k)=>p.reduce((s,c,j)=>j<k?s:s.add(c.mul(binom(j,k)).mul(a.pow(j-k))),zero()).mul(width.pow(k)));
}
function bernstein(p,a,b){const n=p.length-1,c=shiftedPower(p,a,b.sub(a));return c.map((_,i)=>c.reduce((s,x,k)=>k>i?s:s.add(x.mul(binom(i,k)).div(binom(n,k))),zero()));}

const a=new Q(699n,1250n),b=new Q(179n,1250n);
const densityCap=new Q(14n,25n),massCap=new Q(34n,25n),evenCap=new Q(7n,4n);
const D=[a.mul(a),a.mul(b).mul(4n),b.mul(b).mul(3n)];
let factorial=1n;
const expLower=Array.from({length:13},(_,j)=>{if(j)factorial*=BigInt(j);return new Q(1n,factorial);});
const polynomial=mul(D,expLower).map(c=>c.mul(densityCap));
const W=[new Q(4n,25n),new Q(-4n,5n),new Q(3n,2n)];
W.forEach((c,j)=>polynomial[j]=polynomial[j].sub(c));
let minimum=null;
const cells=128;
for(let i=0;i<cells;i++){
  const coefficients=bernstein(polynomial,new Q(BigInt(i),32n),new Q(BigInt(i+1),32n));
  for(const c of coefficients){assert(c.cmp(0n)>0);if(minimum===null||c.cmp(minimum)<0)minimum=c;}
}
const tail=shiftedPower(polynomial,new Q(4n));
assert(tail.every(c=>c.cmp(0n)>0));
assert(evenCap.pow(2).cmp(densityCap.mul(massCap).mul(4n))>0);

const p=new Q(2500n,1891n),oddCap=new Q(32n,25n),margin=p.sub(oddCap);
const theta=margin.div(p),penaltyConstant=evenCap.mul(p).div(margin);
assert.equal(theta.str(),'497/15625');
assert.equal(penaltyConstant.str(),'15625/284');
const eta=new Q(1n,20000n).sub(new Q(9n,25000000n));
const exactCutoff=eta.div(penaltyConstant);
const simpleCutoff=new Q(9n,10000000n);
assert(simpleCutoff.cmp(exactCutoff)<0);
const slack=eta.sub(penaltyConstant.mul(simpleCutoff));
const Wcap=new Q(1n,50n);
const evenThreshold=margin.pow(2).mul(Wcap).div(oddCap);
const rows=[
  {u:new Q(1n,100n),allowance:new Q(23n,20000n),V:new Q(213n,10000000n),capped:true},
  {u:new Q(1n,50n),allowance:new Q(27n,50000n),V:new Q(981n,100000000n),capped:false},
  {u:new Q(3n,100n),allowance:new Q(3n,20000n),V:new Q(2726n,1000000000n),capped:false},
  {u:new Q(463n,10000n),allowance:eta,V:simpleCutoff,capped:false}
];
const rowChecks=[];
for(const row of rows){
  const e=evenCap.mul(row.V);
  if(row.capped){
    assert(e.cmp(evenThreshold)>0);
    const residual=row.allowance.add(margin.mul(Wcap)).sub(e);
    assert(residual.cmp(0n)>0);
    const reserve=residual.pow(2).sub(oddCap.mul(e).mul(Wcap).mul(4n));
    assert(reserve.cmp(0n)>0);
    rowChecks.push({u:row.u.str(),V:row.V.str(),branch:'W=1/50',squared_reserve:reserve.str()});
  }else{
    const reserve=row.allowance.sub(penaltyConstant.mul(row.V));
    assert(reserve.cmp(0n)>0);
    rowChecks.push({u:row.u.str(),V:row.V.str(),branch:'unconstrained maximum',reserve:reserve.str()});
  }
}
const oneMinusTheta=new Q(1n).sub(theta);
const exactNuCredit=new Q(9n,100n).div(oneMinusTheta.mul(oneMinusTheta.add(oddCap)));
const uniformNuCredit=new Q(3n,76n);
assert.equal(uniformNuCredit.str(),new Q(9n,100n).div(new Q(1n).add(oddCap)).str());
assert(exactNuCredit.cmp(uniformNuCredit)>0);
// Assembly only: the sharp 11/10 even-potential input is certified separately
// by ../odd-perturb/verify_recentered.py, not by this scalar checker.
const sharpEvenCap=new Q(11n,10n);
const sharpPenalty=sharpEvenCap.mul(p).div(margin);
assert.equal(sharpPenalty.str(),'34375/994');
const sharpExactCutoff=eta.div(sharpPenalty);
const sharpRows=[
  {u:new Q(1n,100n),allowance:new Q(23n,20000n),V:new Q(33888n,1000000000n),capped:true},
  {u:new Q(1n,50n),allowance:new Q(27n,50000n),V:new Q(15614n,1000000000n),capped:false},
  {u:new Q(3n,100n),allowance:new Q(3n,20000n),V:new Q(4337n,1000000000n),capped:false},
  {u:new Q(463n,10000n),allowance:eta,V:new Q(1435n,1000000000n),capped:false}
];
const sharpChecks=[];
for(const row of sharpRows){
  const e=sharpEvenCap.mul(row.V);
  if(row.capped){
    assert(e.cmp(evenThreshold)>0);
    const residual=row.allowance.add(margin.mul(Wcap)).sub(e);
    assert(residual.cmp(0n)>0);
    const reserve=residual.pow(2).sub(oddCap.mul(e).mul(Wcap).mul(4n));
    assert(reserve.cmp(0n)>0);
    sharpChecks.push({u:row.u.str(),V:row.V.str(),branch:'W=1/50',squared_reserve:reserve.str()});
  }else{
    const reserve=row.allowance.sub(sharpPenalty.mul(row.V));
    assert(reserve.cmp(0n)>0);
    sharpChecks.push({u:row.u.str(),V:row.V.str(),branch:'unconstrained maximum',reserve:reserve.str()});
  }
}
console.log(JSON.stringify({agent_id:'codex-c7e2',status:'PASS',
  density_polynomial_degree:polynomial.length-1,compact_cells:cells,
  minimum_bernstein_coefficient:minimum.str(),tail:'all shifted coefficients positive',
  even_inverse_potential:evenCap.str(),odd_margin:margin.str(),theta:theta.str(),
  penalty_constant:penaltyConstant.str(),exact_V_cutoff:exactCutoff.str(),
  exact_V_cutoff_decimal:exactCutoff.num(),simple_V_cutoff:simpleCutoff.str(),
  simple_cutoff_reserve:slack.str(),W_capped_rows:rowChecks,
  theta_fixed_nu_real_credit:exactNuCredit.str(),
  theta_fixed_nu_imag_credit:exactNuCredit.mul(4n).str(),
  uniform_nu_credit:uniformNuCredit.str(),
  sharp_assembly:{even_input:sharpEvenCap.str(),
    even_input_checker:'../odd-perturb/verify_recentered.py',
    local_scope:'scalar assembly only; this script does not certify the sharp potential',
    penalty_constant:sharpPenalty.str(),exact_V_cutoff:sharpExactCutoff.str(),
    exact_V_cutoff_decimal:sharpExactCutoff.num(),W_capped_rows:sharpChecks}}));
