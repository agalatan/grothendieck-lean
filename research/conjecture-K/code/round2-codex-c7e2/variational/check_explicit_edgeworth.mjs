// Intended filepath: handoff/codex-c7e2-round2/variational/check_explicit_edgeworth.mjs
import assert from 'node:assert/strict';

function choose(n,k) {
  if (k<0 || k>n) return 0n;
  let out=1n;
  for(let j=1;j<=k;j++) out=out*BigInt(n-j+1)/BigInt(j);
  return out;
}
let terms=[{degree:3,coefficient:1n}];
for(let step=1;step<=4;step++) {
  const next=[];
  for(const {degree:m,coefficient:c} of terms) {
    if(m===0) continue;
    for(let r=1;r<=Math.min(3,m);r++) {
      next.push({degree:m+3-2*r,
        coefficient:c*3n*(r===3?2n:1n)*choose(2,r-1)*choose(m-1,r-1)});
    }
  }
  terms=next;
}
assert.equal(terms.length,22);
const sums={};
for(const {degree,coefficient} of terms) sums[degree]=(sums[degree]??0n)+coefficient;
assert.deepEqual(sums,{1:19440n,3:15714n,5:2268n,7:81n});
assert(6n*4n<25n);
assert(120n<121n);
assert(5040n<71n*71n);
const numeratorTwice=2n*sums[1]+5n*sums[3]+22n*sums[5]+142n*sums[7];
const denominator=7776n;
assert.equal(denominator,36n*36n*6n);
assert(numeratorTwice<24n*denominator);

const gamma5Terms=[];
for(const {degree:m,coefficient:c} of terms) {
  if(m===0)continue;
  for(let r=1;r<=Math.min(3,m);r++) {
    gamma5Terms.push({degree:m+3-2*r,
      coefficient:c*3n*(r===3?2n:1n)*choose(2,r-1)*choose(m-1,r-1)});
  }
}
assert.equal(gamma5Terms.length,50);
const sums5={};
for(const {degree,coefficient} of gamma5Terms)sums5[degree]=(sums5[degree]??0n)+coefficient;
assert.deepEqual(sums5,{0:94284n,2:328536n,4:108864n,6:9720n,8:243n});
assert(2n*4n<9n);
assert(24n<25n);
assert(720n<27n*27n);
assert(40320n<201n*201n);
const numerator5Twice=2n*sums5[0]+3n*sums5[2]+10n*sums5[4]+54n*sums5[6]+402n*sums5[8];
const denominator5=36n**3n;
assert.equal(denominator5,46656n);
assert(numerator5Twice<62n*denominator5);
// 31/6 + sqrt(2)/216 < 31/6 + 2/216 < 6.
assert(31n*36n+2n<6n*216n);

let derivativeTerms=new Map([['0,0,1',1n]]);
const add=(out,d,j,s,c)=>{
  if(c===0n)return;
  const key=`${d},${j},${s}`;
  out.set(key,(out.get(key)??0n)+c);
};
const totals=[];
for(let k=1;k<=4;k++) {
  const out=new Map();
  for(const [key,c] of derivativeTerms) {
    const [d,j,s]=key.split(',').map(Number);
    add(out,d+1,j,s+1,-2n*c);
    add(out,d-1,j,s+1,BigInt(d)*c);
    add(out,d+1,j+1,s+2,-6n*BigInt(s)*c);
  }
  derivativeTerms=new Map([...out].filter(([,c])=>c!==0n));
  const aggregate={};
  for(const [key,c] of derivativeTerms) {
    const [d,j,s]=key.split(',').map(Number);
    assert(d>=0 && d<=k);
    assert.equal(s,k+j+1);
    aggregate[j]=(aggregate[j]??0n)+(c<0n?-c:c);
  }
  totals[k]=aggregate;
}
assert.deepEqual(totals[3],{0:20n,1:264n,2:1440n,3:3240n});
assert.deepEqual(totals[4],{0:76n,1:1560n,2:14400n,3:68040n,4:136080n});

// Independently check the finite matching lemma used in the tensor proof.
function checkGraphMatching(n) {
 const edges=[];
 for(let i=0;i<n;i++)for(let j=i+1;j<n;j++)edges.push([i,j]);
 let connectedGraphs=0;
 function enumerateGraphs(k,adj,degree) {
  if(k===edges.length) {
    if(degree.some(d=>d===0))return;
    const seen=new Set([0]);
    for(let pass=0;pass<n;pass++) {
      for(const [i,j] of edges) {
        if(adj[i][j]&&(seen.has(i)||seen.has(j))) {
          seen.add(i);seen.add(j);
        }
      }
    }
    if(seen.size!==n)return;
    connectedGraphs++;
    const target=degree.reduce((mask,d,i)=>mask|(d===3?1<<i:0),0);
    let works=false;
    function matching(i,covered) {
      if((covered&target)===target){works=true;return;}
      if(i===n||works)return;
      matching(i+1,covered);
      if(!(covered>>i&1)) {
        for(let j=i+1;j<n;j++) {
          if(adj[i][j]&&!(covered>>j&1))matching(i+1,covered|1<<i|1<<j);
        }
      }
    }
    matching(0,0);
    assert(works);
    return;
  }
  const [i,j]=edges[k];
  for(let m=0;m<=Math.min(3-degree[i],3-degree[j]);m++) {
    adj[i][j]=adj[j][i]=m;
    degree[i]+=m;degree[j]+=m;
    enumerateGraphs(k+1,adj,degree);
    degree[i]-=m;degree[j]-=m;
  }
 }
 enumerateGraphs(0,Array.from({length:n},()=>Array(n).fill(0)),Array(n).fill(0));
 return connectedGraphs;
}
const connectedGraphs5=checkGraphMatching(5);
const connectedGraphs6=checkGraphMatching(6);
assert.equal(connectedGraphs5,1432);
assert.equal(connectedGraphs6,23590);
console.log(JSON.stringify({agent_id:'codex-c7e2',status:'PASS',gamma4_terms:22,
  gamma4_constant:12,integer_reserve:String((24n*denominator-numeratorTwice)/2n),
  gamma5_terms:50,gamma5_constant:31,
  gamma5_integer_reserve:String((62n*denominator5-numerator5Twice)/2n),
  smooth_edgeworth_constant:6,derivative_recursions:'PASS',
  five_vertex_graphs:connectedGraphs5,six_vertex_graphs:connectedGraphs6}));
