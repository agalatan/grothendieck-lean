// cubic_l1_certificate/verify.mjs
// Exact verifier: Node.js 20+, built-in modules only. No floating-point proof steps.
import fs from 'node:fs';
import assert from 'node:assert/strict';

const gcd = (a, b) => {
  a = a < 0n ? -a : a; b = b < 0n ? -b : b;
  while (b) [a, b] = [b, a % b];
  return a;
};
class Rational {
  constructor(n, d = 1n) {
    n = BigInt(n); d = BigInt(d);
    assert(d !== 0n);
    if (d < 0n) { n = -n; d = -d; }
    const g = gcd(n, d); this.n = n / g; this.d = d / g;
  }
  add(y) { y = q(y); return new Rational(this.n*y.d+y.n*this.d, this.d*y.d); }
  sub(y) { return this.add(q(y).neg()); }
  mul(y) { y = q(y); return new Rational(this.n*y.n, this.d*y.d); }
  div(y) { y = q(y); return new Rational(this.n*y.d, this.d*y.n); }
  neg() { return new Rational(-this.n, this.d); }
  cmp(y) { y = q(y); const a = this.n*y.d-y.n*this.d; return a<0n?-1:a>0n?1:0; }
  toString() { return this.d===1n?`${this.n}`:`${this.n}/${this.d}`; }
}
function q(x) {
  if (x instanceof Rational) return x;
  const s = String(x);
  if (s.includes('/')) { const [a,b]=s.split('/'); return new Rational(a,b); }
  if (s.includes('.')) {
    const [a,b]=s.split('.');
    return new Rational(BigInt(a+b), 10n**BigInt(b.length));
  }
  return new Rational(s);
}
const zero=q(0), one=q(1);
const trim = p => { while(p.length>1 && p.at(-1).n===0n) p.pop(); return p; };
function add(a,b) {
  const c=Array(Math.max(a.length,b.length)).fill(zero);
  a.forEach((x,i)=>c[i]=c[i].add(x));b.forEach((x,i)=>c[i]=c[i].add(x));return trim(c);
}
const scale=(a,b)=>trim(a.map(x=>x.mul(b)));
function mul(a,b) {
  const c=Array(a.length+b.length-1).fill(zero);
  a.forEach((x,i)=>b.forEach((y,j)=>c[i+j]=c[i+j].add(x.mul(y))));return trim(c);
}
function pow(a,n) { let p=[one];for(let i=0;i<n;i++)p=mul(p,a);return p; }
const sum=(...ps)=>ps.reduce(add,[zero]);
const deriv=p=>p.length>1?p.slice(1).map((x,i)=>x.mul(i+1)):[zero];
function choose(n,k) { let x=1n;for(let i=1;i<=k;i++)x=x*BigInt(n-i+1)/BigInt(i);return x; }

function segmentPolynomial(x,j) {
  const knots=x.knots.map(q), co=x.coef.map(r=>r.map(q)), ww=x.ww.map(r=>r.map(q));
  const tail=j===knots.length-1;
  let r,gs,ks,ws;
  if(tail) {
    const R=knots.at(-1);r=[R,one];const r2=mul(r,r);
    gs=[0,1].map(k=>add([co.at(-2)[k]],scale(add(r2,[R.mul(R).neg()]),co.at(-1)[k].div(R.mul(2)))));
    ks=gs.map(g=>scale(mul(r,deriv(g)),q('1/2')));
    ws=ww.at(-1).map(w=>[w]);
  } else {
    const a=knots[j], length=knots[j+1].sub(a);r=[a,length];
    const hb=[[q(1),q(0),q(-3),q(2)],[q(0),length,length.mul(-2),length],
      [q(0),q(0),q(3),q(-2)],[q(0),q(0),length.neg(),length]];
    gs=[0,1].map(k=>sum(...hb.map((p,i)=>scale(p,co[2*j+i][k]))));
    ks=gs.map(g=>scale(mul(r,deriv(g)),one.div(length.mul(2))));
    ws=[0,1,2].map(k=>[ww[j][k],ww[j+1][k].sub(ww[j][k])]);
  }
  const r2=mul(r,r), hs=gs.map((g,i)=>add(g,ks[i]));
  const la=x.la.map(q), alpha=x.alpha.map(q), d=x.d.map(q);
  const rates=[la[0].mul(3),la[1].mul(2).add(la[3]),
    la[0].mul(q('2/3')).add(la[1]).add(la[2]).add(la[4])];
  assert(rates.every(z=>z.cmp(0)>0));assert(la.every(z=>z.cmp(0)>=0));assert(d[3].cmp(0)>=0);
  const xd=sum(hs[0],[alpha[0].neg()],scale(ws[1],3));
  const xc=sum(hs[1],[alpha[1].neg()],scale(add(r2,[q(-1)]),la[3].sub(la[2].mul(2))),ws[0],scale(ws[1],-1));
  const xb=sum(scale(ks[0],q('2/3')),ks[1],scale(r2,la[4]),scale(ws[2],2));
  let p=sum(...d.map((v,k)=>scale(pow(r2,k),v)),mul(r2,add(...gs)),scale(add(...hs),-1),scale(r,-1),scale(ws[0],-1),scale(ws[1],-2));
  [xd,xc,xb].forEach((v,i)=>p=add(p,scale(mul(v,v),q(-1).div(rates[i].mul(4)))));
  assert(p.length<=7);return {p,tail};
}

function proveNonnegative(p,tail) {
  const n=p.length-1;
  let b;
  if(tail) b=p.map((v,i)=>v.div(choose(n,i)));
  else b=Array.from({length:n+1},(_,i)=>p.slice(0,i+1).reduce((s,v,j)=>s.add(v.mul(new Rational(choose(i,j),choose(n,j)))),zero));
  const stack=[[b,0]];let leaves=0;
  while(stack.length) {
    let [row,depth]=stack.pop();
    if(row.every(z=>z.cmp(0)>=0)) { leaves++;continue; }
    assert(row[0].cmp(0)>=0 && row.at(-1).cmp(0)>=0,'Negative polynomial endpoint');
    assert(depth<45,'Subdivision limit reached');
    const left=[row[0]],right=[row.at(-1)];
    while(row.length>1) {
      row=row.slice(0,-1).map((v,i)=>v.add(row[i+1]).div(2));left.push(row[0]);right.push(row.at(-1));
    }
    stack.push([left,depth+1],[right.reverse(),depth+1]);
  }
  return leaves;
}
function isqrt(n) {
  assert(n>=0n);if(n<2n)return n;
  let x=1n<<BigInt(Math.ceil(n.toString(2).length/2));
  for(;;) { const y=(x+n/x)/2n;if(y>=x)return x;x=y; }
}
function sqrtUpper(x) {
  x=q(x);assert(x.cmp(0)>=0);const D=10n**12n;
  let n=isqrt(x.n*D*D/x.d);
  if(n*n*x.d<x.n*D*D)n++;
  return new Rational(n,D);
}
function bound(x,s) {
  s=q(s);const d=x.d.map(q),la=x.la.map(q);
  const m3=q(6).add(s.mul(9)).add(q('4045313/100000').mul(s).mul(sqrtUpper(s)));
  return d[0].add(d[1]).add(d[2].mul(s.add(2))).add(d[3].mul(m3)).add(la[0].add(la[1]).add(la[2]).mul(s));
}
function upperDecimal(x,places=12) {
  assert(x.cmp(0)>=0);const D=10n**BigInt(places),n=(x.n*D+x.d-1n)/x.d;
  const s=n.toString().padStart(places+1,'0');return s.slice(0,-places)+'.'+s.slice(-places);
}
function verify(x) {
  const knots=x.knots.map(q);assert.equal(knots[0].cmp(0),0);
  assert(knots.slice(1).every((v,i)=>v.cmp(knots[i])>0));
  assert.equal(x.coef.length,2*knots.length);assert.equal(x.ww.length,knots.length);
  assert(x.coef.every(r=>r.length===2));assert(x.ww.every(r=>r.length===3));
  assert.equal(x.d.length,4);assert.equal(x.la.length,5);assert.equal(x.alpha.length,2);
  assert(x.coef.slice(0,2).flat().every(v=>q(v).cmp(0)===0));
  x.ww.forEach(row=>{const [a,b,c]=row.map(q);assert(a.cmp(0)>=0&&b.cmp(0)>=0&&a.mul(b).cmp(c.mul(c))>=0,'Matrix is not positive semidefinite');});
  return knots.reduce((total,_,j)=>{
    const {p,tail}=segmentPolynomial(x,j);return total+proveNonnegative(p,tail);
  },0);
}

const file=process.argv[2]??new URL('./certificates.json',import.meta.url);
const pack=JSON.parse(fs.readFileSync(file,'utf8'));
assert.equal(pack.format,'cubic-l1-radial-stein-v1');
assert.equal(q(pack.rho).cmp(q('9359/10000')),0);assert.equal(q(pack.C6).cmp(q('4045313/100000')),0);
assert.deepEqual(pack.s_range,['0','42']);
const rho=q(pack.rho);let last=zero,total=0;
for(const x of pack.certificates) {
  const [lo,hi]=x.interval.map(q);assert(lo.cmp(0)>=0 && lo.cmp(last)<=0 && hi.cmp(last)>0 && hi.cmp(42)<=0);
  const blo=bound(x,lo),bhi=bound(x,hi);assert(blo.cmp(rho)<=0 && bhi.cmp(rho)<=0,'Endpoint bound exceeds rho');
  const leaves=verify(x);total+=leaves;last=hi;
  console.log(`${x.id}: s in [${lo}, ${hi}], bound <= ${upperDecimal(blo.cmp(bhi)>0?blo:bhi)}, ${leaves} exact Bernstein leaves`);
}
assert.equal(last.cmp(42),0);
console.log(`PASS: rho = ${rho}; all s in [0,42] and all r >= 0; ${total} exact Bernstein leaves.`);
