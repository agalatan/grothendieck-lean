// scripts/verify_gamma_exact.mjs
// C: exact polynomial moment checks and the infinite-m rational inequalities.
import fs from 'node:fs';
import path from 'node:path';
import {fileURLToPath} from 'node:url';
const root=path.resolve(path.dirname(fileURLToPath(import.meta.url)),'..');
const assert=(ok,msg)=>{if(!ok)throw new Error(msg);};
const fac=n=>{let v=1n;for(let i=2;i<=n;i++)v*=BigInt(i);return v;};
const add=(p,q)=>{const out=p.slice();q.forEach((v,i)=>out[i]=(out[i]??0n)+v);return out;};
const scale=(p,c)=>p.map(v=>v*c);
const mul=(p,q)=>{const r=Array(p.length+q.length-1).fill(0n);p.forEach((v,i)=>q.forEach((w,j)=>r[i+j]+=v*w));return r;};
const eq=(a,b)=>{for(let i=0;i<Math.max(a.length,b.length);i++)if((a[i]??0n)!==(b[i]??0n))return false;return true;};
const rise=n=>{let p=[1n];for(let i=0;i<n;i++)p=mul(p,[BigInt(i),1n]);return p;};
// A polynomial in S,R is a list of [power S, power R, coefficient].
const polyMul=(p,q)=>p.flatMap(([a,b,c])=>q.map(([d,e,f])=>[a+d,b+e,c*f]));
// E[S * polynomial(S,R)], S~Exp(1), R~Gamma(m,1), as a polynomial in m.
const E=p=>p.reduce((out,[a,b,c])=>add(out,scale(rise(b),c*fac(a+1))),[]);
// Use m*z = 2 S R - m and n = 2(R-m)^2+4R-4SR. Expand m-symbolically.
const z=[[1,1,2n,0],[0,0,-1n,1]];
const n=[[0,2,2n,0],[0,1,-4n,1],[0,0,2n,2],[0,1,4n,0],[1,1,-4n,0]];
const EP=p=>p.reduce((out,[a,b,c,k])=>add(out,[...Array(k).fill(0n),...scale(rise(b),c*fac(a+1))]),[]);
const multP=(p,q)=>p.flatMap(([a,b,c,k])=>q.map(([d,e,f,l])=>[a+d,b+e,c*f,k+l]));
assert(eq(EP(multP(z,z)),[0n,24n,17n]),'m^2 E|Z|^2');
assert(eq(EP(multP(z,n)),[0n,-16n,-22n]),'m E[Z N]');
assert(eq(EP(multP(n,n)),[0n,40n,44n]),'E|N|^2');
// Pure scalar algebra: theta_poly <= 5/3 for every integer m>=1.
// Its numerator difference is 22m^2 - 2m - 18 = 2 + 42(m-1)+22(m-1)^2.
const shiftedPoly=add(scale(mul([1n,1n],[1n,1n]),22n),[-20n,-2n]);
assert(eq(shiftedPoly,[2n,42n,22n]),'polynomial theta shifted coefficients');
assert(!eq(EP(multP(z,n)),[0n,-16n,-23n]),'reject altered pairing coefficient');
// General Hermitian spectra: verify the kappa rational function identically.
const generalNum=add(add(mul([17n,24n],[44n,40n]),scale(mul([22n,16n],[22n,16n]),-1n)),mul([0n,16n],[44n,40n]));
const generalDen=mul([6n,18n],[44n,40n]);
assert(eq(generalNum,scale([33n,217n,168n],8n)),'general Hermitian numerator');
assert(eq(generalDen,scale(mul([1n,3n],[11n,10n]),24n)),'general Hermitian denominator');
assert(eq(add([2n],scale(mul([1n,-1n],[10n,9n]),2n)),[22n,-2n,-18n]),'uniform 5/3 factorization');
assert(99n*36n-493n*6n-510n===96n,'13/10 at kappa=1/6');
// theta_I=(37m-40)/(3(m-2)(m+3)). Exact shifted coefficients for each infinite tail.
const tails=[{start:34n,num:7n,den:20n},{start:19n,num:3n,den:5n},{start:8n,num:13n,den:10n}];
for(const {start:M,num:a,den:b}of tails){
  const c2=3n*a,c1=3n*a-37n*b,c0=40n*b-18n*a;
  const shifted=[c2*M*M+c1*M+c0,2n*c2*M+c1,c2];
  assert(shifted.every(x=>x>=0n),'infinite tail inequality');
}
const decimal=s=>{const neg=s.startsWith('-');const t=neg?s.slice(1):s;const [a,b='']=t.split('.');return[(neg?-1n:1n)*BigInt(a+b),10n**BigInt(b.length)];};
const cmp=(a,b)=>a[0]*b[1]-b[0]*a[1];
const radd=(a,b)=>[a[0]*b[1]+b[0]*a[1],a[1]*b[1]];
const rmul=(a,b)=>[a[0]*b[0],a[1]*b[1]];
const rows=JSON.parse(fs.readFileSync(path.join(root,'rows.json'),'utf8'));
for(const row of rows){
  const l=decimal(row.l),beta=decimal(row.beta),nu=decimal(row.nu5),bA=decimal(row.bA),bB=decimal(row.bB);
  assert(cmp(radd(l,rmul(beta,[-2n,1n])),[1n,2n])>0n,'positive constant term of L');
  assert(cmp(radd(beta,rmul(nu,[-7n,4n])),[0n,1n])>0n,'positive linear term of L');
  assert(cmp(nu,[0n,1n])>0n,'positive quintic coefficient');
  assert(cmp([-bA[0],bA[1]],[3n,50n])<0n&&bA[0]<0n,'A row bound');
  assert(cmp([-bB[0],bB[1]],[3n,100n])<0n&&bB[0]<0n,'B row bound');
}
const output={status:'C: PASS',symbolic_moments:'identities in the indeterminate m, exact integer coefficients',general_hermitian_bounds:'5/3 for all spectra; 13/10 when kappa <= 1/6',infinite_tails:tails.map(t=>({m_min:String(t.start),theta:`${t.num}/${t.den}`})),polynomial_all_m_theta:'5/3',profile_rows_checked:rows.length};
fs.writeFileSync(path.join(root,'results','gamma_exact.json'),JSON.stringify(output,null,2)+'\n');
console.log(JSON.stringify(output,null,2));
