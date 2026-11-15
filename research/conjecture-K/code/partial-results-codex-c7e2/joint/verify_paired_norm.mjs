// /workspace/scratch/f307e93b3610/codex-c7e2-research/joint/verify_paired_norm.mjs
// Agent-ID: codex-c7e2. Exact algebra supporting SHARP_PAIRED_NORM.md.
// This checks identities/constants; the domain reductions are proved in the note.
import assert from 'node:assert/strict';

const add = (a,b) => Array.from({length:Math.max(a.length,b.length)},(_,i)=>(a[i]??0n)+(b[i]??0n));
const mul = (a,b) => {
  const c=Array(a.length+b.length-1).fill(0n);
  a.forEach((x,i)=>b.forEach((y,j)=>{c[i+j]+=x*y;}));
  return c;
};
assert.deepEqual(mul(mul([-4n,3n],[-4n,3n]),[16n,8n,3n]),[256n,-256n,0n,0n,27n]);
assert.deepEqual(mul(mul([-1n,1n],[-1n,1n]),[2n,2n,1n]),[2n,-2n,-1n,0n,1n]);
assert.deepEqual(mul(mul([1n,3n],[1n,3n]),[5n,-3n]),[5n,27n,27n,-27n]);
// 1 - 5/27 (58/25)^2 = 11/3375.
assert.equal(27n*25n**2n-5n*58n**2n,55n);
assert.equal(55n*3375n,11n*27n*25n**2n);
// 1 - 37/64 (33/25)^2 = -293/40000.
assert.equal(64n*25n**2n-37n*33n**2n,-293n);
// Exact strict comparison used in the radial example.
assert(205n**2n<5n*92n**2n);
// Equality at ||h||/||x|| = 4/3: C*(4/3)^4 = 2/3.
assert.equal(27n*4n**4n*3n,2n*128n*3n**4n);
// One-sided equality at ||h||/||x||=3/2, h opposite x.
assert.equal(16n*3n**3n,2n*27n*2n**3n);
console.log('PASS: paired and one-sided factorizations, split thresholds, sharpness, and radial comparison.');
