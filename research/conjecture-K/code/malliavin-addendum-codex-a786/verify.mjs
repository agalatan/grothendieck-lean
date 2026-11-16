// malliavin_addendum/verify.mjs
// Exact Pauli/Clifford and Gaussian moment checks. Node.js >=20; no dependencies.
import assert from 'node:assert/strict';
import fs from 'node:fs';

const zero = [0n, 0n];
const cadd = (a,b) => [a[0]+b[0],a[1]+b[1]];
const cmul = (a,b) => [a[0]*b[0]-a[1]*b[1],a[0]*b[1]+a[1]*b[0]];
const cneg = a => [-a[0],-a[1]];
const cconj = a => [a[0],-a[1]];
const entry = n => [BigInt(n),0n];
const mat = rows => rows.map(row=>row.map(entry));
const I = n => Array.from({length:n},(_,i)=>Array.from({length:n},(_,j)=>entry(i===j?1:0)));
const add = (A,B) => A.map((row,i)=>row.map((v,j)=>cadd(v,B[i][j])));
const neg = A => A.map(row=>row.map(cneg));
const transpose = A => A[0].map((_,j)=>A.map(row=>row[j]));
const adjoint = A => transpose(A).map(row=>row.map(cconj));
const trace = A => A.reduce((s,row,i)=>cadd(s,row[i]),zero);
function multiply(A,B) {
  return A.map(row=>B[0].map((_,j)=>row.reduce((s,v,k)=>cadd(s,cmul(v,B[k][j])),zero)));
}
function kron(A,B) {
  return A.flatMap(row=>B.map(brow=>row.flatMap(a=>brow.map(b=>cmul(a,b)))) );
}
const equal = (A,B) => assert.deepEqual(A,B);
const realTrace = A => {const t=trace(A);assert.equal(t[1],0n);return t[0];};
const pauli = {
  I:I(2), X:mat([[0,1],[1,0]]), Z:mat([[1,0],[0,-1]]),
  Y:[[entry(0),[0n,-1n]],[[0n,1n],entry(0)]]
};
const words = ['IIY','IYX','XYZ','YIZ','YXX','YZX','ZYZ'];
const A = words.map(word=>[...word].reduce((p,x)=>kron(p,pauli[x]),[[entry(1)]]));
for (let i=0;i<A.length;i++) {
  equal(adjoint(A[i]),A[i]);
  equal(transpose(A[i]),neg(A[i]));
  assert(A[i].every(row=>row.every(z=>z[0]===0n)));
  assert.equal(realTrace(A[i]),0n);
  equal(multiply(A[i],A[i]),I(8));
  for(let j=0;j<i;j++) equal(add(multiply(A[i],A[j]),multiply(A[j],A[i])),mat(Array.from({length:8},()=>Array(8).fill(0))));
  // The transformations proving zero content:
  equal(multiply(transpose(A[i]),A[i]),neg(I(8)));
  for(let j=0;j<A.length;j++) equal(multiply(multiply(A[i],A[j]),A[i]),j===i?A[j]:neg(A[j]));
}

// G=(u,v), Y=(u+i v)/sqrt(2). Q_j=G^T P_j G/2.
// P_0,P_1 represent Re(sum Y_k^2), Im(sum Y_k^2).
// The remaining seven represent Y^* A_i Y.
const P=[kron(pauli.Z,I(8)),kron(pauli.X,I(8)),...A.map(a=>neg(kron(pauli.Y,a)))];
for(let i=0;i<P.length;i++) {
  assert(P[i].every(row=>row.every(z=>z[1]===0n)));
  equal(transpose(P[i]),P[i]);
  assert.equal(realTrace(P[i]),0n);
  equal(multiply(P[i],P[i]),I(16));
  for(let j=0;j<i;j++) equal(add(multiply(P[i],P[j]),multiply(P[j],P[i])),mat(Array.from({length:16},()=>Array(16).fill(0))));
}
for(let i=0;i<7;i++) {
  // If A_i=i S_i, then P_{i+2}=[[0,-S_i],[S_i,0]].
  const S=A[i].map(row=>row.map(z=>entry(z[1])));
  for(let r=0;r<8;r++)for(let s=0;s<8;s++){
    assert.deepEqual(P[i+2][r][s],zero);
    assert.deepEqual(P[i+2][r+8][s+8],zero);
    assert.deepEqual(P[i+2][r][s+8],cneg(S[r][s]));
    assert.deepEqual(P[i+2][r+8][s],S[r][s]);
  }
}

// Direct polynomial control of the quadratic map:
// sum_a (G^T P_a G)^2 = (sum_j G_j^2)^2, coefficient by coefficient.
const addTerm=(p,key,c)=>{const v=(p.get(key)||0n)+c;if(v)p.set(key,v);else p.delete(key);};
function quadratic(M){
  const p=new Map();
  for(let i=0;i<M.length;i++)for(let j=0;j<M.length;j++){
    assert.equal(M[i][j][1],0n);
    addTerm(p,[i,j].sort((a,b)=>a-b).join(','),M[i][j][0]);
  }
  return p;
}
function squarePolynomial(p){
  const out=new Map();
  for(const [a,c]of p)for(const[b,e]of p)
    addTerm(out,[...a.split(',').map(Number),...b.split(',').map(Number)].sort((x,y)=>x-y).join(','),c*e);
  return out;
}
const squaredMap=new Map();
for(const matrix of P)for(const[key,c]of squarePolynomial(quadratic(matrix)))addTerm(squaredMap,key,c);
const squaredRadius=squarePolynomial(quadratic(I(16)));
assert.deepEqual([...squaredMap].sort(),[...squaredRadius].sort());

// Independent trace-cumulant control of E[Q_i^2 Q_j^2].
// For Q_i=G^T P_i G/2, kappa_2=tr(P_iP_j)/2 and
// kappa_4(i,j,k,l)=1/2 sum_{six permutations of j,k,l} tr(P_i P_j P_k P_l).
const products=P.map(p=>P.map(q=>multiply(p,q)));
const tr4=(i,j,k,l)=>realTrace(multiply(products[i][j],products[k][l]));
const permutations3=(a,b,c)=>[[a,b,c],[a,c,b],[b,a,c],[b,c,a],[c,a,b],[c,b,a]];
const m=9n,d=8n;
let ES=0n,ES2=0n;
for(let i=0;i<9;i++){
  const vi=realTrace(products[i][i])/2n;
  assert.equal(vi,d);ES+=vi;
  for(let j=0;j<9;j++){
    const vj=realTrace(products[j][j])/2n,cij=realTrace(products[i][j])/2n;
    const trsum=permutations3(i,j,j).reduce((s,[a,b,c])=>s+tr4(i,a,b,c),0n);
    assert.equal(trsum%2n,0n);
    const fourth=trsum/2n+vi*vj+2n*cij*cij;
    assert.equal(fourth,(i===j?3n:1n)*d*(d+2n));
    ES2+=fourth;
  }
}
assert.equal(ES,m*d);
assert.equal(ES2,m*(m+2n)*d*(d+2n));
const ER=d,ER2=d*(d+1n),EH=m,EH2=m*(m+2n);
const ERS=(d+2n)*ES;
const u=ES,m4=2n*ES2,delta=m4-2n*u*u;
const EGradient=ES+2n*ER*EH;
const EGradient2=ES2+4n*ER2*EH2+4n*ERS*EH;
const varGradient=EGradient2-EGradient**2n;
const budget=2n*varGradient;
assert.equal(u,72n);assert.equal(m4,15840n);assert.equal(delta,5472n);
assert.equal(EGradient,3n*u);assert.equal(budget,31392n);
assert.equal(19n*budget,109n*delta);
assert.equal(18n*delta,19n*u*u);
assert.equal(6n*delta-budget,1440n);
assert.equal(114000n<1046n*109n,true); // 114/109 < 1.046.
assert.equal(2500n*100n-101n*1891n,59009n); // p-9/25-13/20.

// Spectral identity: beta=6 delta-R. Algebra with nonnegative real-chaos
// channel energies v2=||J2 Gamma(F,F)||², v4=||J4 Gamma(F,F)||².
for(const v2 of [0n,1n,7n])for(const v4 of [0n,1n,11n]){
  const twiceKappa= v2+2n*v4;
  assert.equal(2n*twiceKappa-2n*(v2+v4),2n*v4);
}
const result={
  status:'C: exact Gaussian-integer matrices and rational/integer moment arithmetic',
  passed:true,pauliWords:words,complexVariables:{X:8,Y:8},
  clifford:{realDimension:16,matrices:9,allRelationsVerified:true},
  quadraticMapNormIdentity:'sum_a (G^T P_a G)^2 = |G|^4, verified coefficient by coefficient',
  exactLaw:'q has the law R W, with R Gamma(shape=8, scale=1) independent of standard complex Gaussian W',
  moments:{u,m4,delta,ES2,ERS,EGradient,EGradient2,varGradient,budget},
  normalized:{u:'1',delta:'19/18',budget:'109/18',spectralCorrection:'5/18'},
  budgetRatio:'109/19',maximumImprovementFactorForCoefficientSix:'114/109',
  zeroContent:'P: matrix sign symmetries, checked above and proved in PROOFS.md',
  scope:'This does not prove the general content/deficit inequality or a new Grothendieck endpoint.'
};
const text=JSON.stringify(result,(_,v)=>typeof v==='bigint'?v.toString():v,2)+'\n';
if(process.argv[2])fs.writeFileSync(process.argv[2],text);
process.stdout.write(text);
