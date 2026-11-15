// handoff/codex-4d8a-compensated-joint/matrix/verify_tradeoff.mjs — Agent-ID: codex-4d8a
// Exact integer polynomial identity underlying SHARP_TRADEOFF.md, variables (r,t,z).
import assert from 'node:assert/strict';
const clean = p => new Map([...p].filter(([,v]) => v !== 0n));
const constant = n => new Map([['0,0,0', BigInt(n)]]);
const variable = j => new Map([[Array.from({length:3},(_,k)=>+(k===j)).join(','),1n]]);
const add = (...ps) => clean(ps.reduce((r,p)=>{for(const [k,v] of p)r.set(k,(r.get(k)||0n)+v);return r;},new Map()));
const neg = p => new Map([...p].map(([k,v])=>[k,-v]));
const sub = (a,b) => add(a,neg(b));
const mul = (...ps) => ps.reduce((a,b)=>{const r=new Map();for(const [ka,va] of a)for(const [kb,vb] of b){const aa=ka.split(',').map(Number),bb=kb.split(',').map(Number);const k=aa.map((x,i)=>x+bb[i]).join(',');r.set(k,(r.get(k)||0n)+va*vb);}return clean(r);},constant(1));
const sq = x => mul(x,x);
const one=constant(1),two=constant(2),r=variable(0),t=variable(1),z=variable(2);
const lhs=add(mul(sub(one,r),sq(sub(mul(t,z),one))),mul(sq(t),sub(one,sq(z))),mul(sub(one,sq(t)),add(mul(add(one,r),sub(one,sq(z))),sq(z))),mul(two,t,z),neg(two));
const rhs=neg(mul(r,sq(sub(t,z))));
assert.equal(sub(lhs,rhs).size,0,'Exact dual identity');
// The same parameterization enforces the necessary sharp radial relation.
// α⁻¹=1−r and β⁻¹=1+r, so their sum equals 2 identically.
assert.equal(sub(add(sub(one,r),add(one,r)),two).size,0,'Sharp reciprocal relation');
console.log('PASS: exact convex-dual polynomial identity and sharp reciprocal relation.');
console.log('Analytic support/convexity arguments in SHARP_TRADEOFF.md complete the proof.');
