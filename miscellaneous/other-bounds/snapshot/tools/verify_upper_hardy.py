#!/usr/bin/env python3
"""Directed Gaussian Schur/Hardy cover for arbitrary exact odd P,Q.

Usage: python -I tools/verify_upper_hardy.py PACKAGE PROPOSAL_JSON OUTPUT_DIR
PACKAGE/inputs pins the inherited Schur proof and the smoothing parameters.
Only the exact algebra and contour cover are checked here; the Gaussian Schur
inequality remains the same documented analytic input as the main certificate.
"""
if not __debug__:raise RuntimeError('Run without -O: assertions are certificate checks')
from pathlib import Path
from fractions import Fraction as F
import hashlib,json,time
from flint import arb,acb,ctx
import sys
PKG=Path(sys.argv[1]);OUT=Path(sys.argv[3]);SOURCE=PKG/'inputs/contour_input.json';NEWPQ=Path(sys.argv[2])
PROOF=PKG/'inputs/GAUSSIAN_SCHUR_TAIL_PROOF.md'
assert hashlib.sha256(PROOF.read_bytes()).hexdigest()=='151feb4bd4f37ba19e6ec078b00f11b4fc6ffc01b715e971e2c1a34ed29557e3'
ctx.prec=224;source_bytes=SOURCE.read_bytes();d=json.loads(source_bytes);A=lambda f:arb(F(f).numerator)/F(f).denominator
newpq_bytes=NEWPQ.read_bytes();npq=json.loads(newpq_bytes);Pn=[F(x) for x in npq['P']];Qn=[F(x) for x in npq['Q']];assert sum(map(abs,Pn))<=1 and sum(map(abs,Qn))<=1 and Qn[0]==0
qs=[F(0)]+[x for c in Pn for x in (c,F(0))];qs=qs[:-1];assert all(q==0 for q in qs[::2]) and sum(map(abs,qs))<=1
a,b,eta=map(F,(d['a'],d['b'],d['eta']));bb=A(b);ee=A(eta);sm=ee.sqrt();j=A(F(9,20)); rad=F(4149,4000);r=A(rad)
M=[[1/(1+bb*bb)+sm*bb*bb/(1+bb*bb),(1-sm)*bb/(1+bb*bb)],[(1-sm)*bb/(1+bb*bb),bb*bb/(1+bb*bb)+sm/(1+bb*bb)]]
odd=list(map(A,qs[1::2]));I=[[arb(1),arb(0)],[arb(0),arb(1)]]
def det(a):return a[0][0]*a[1][1]-a[0][1]*a[1][0]
def mul(a,b):return [[sum(a[i][k]*b[k][j]for k in range(2))for j in range(2)]for i in range(2)]
def sub(a,b):return [[a[i][j]-b[i][j]for j in range(2)]for i in range(2)]
def add(a,b):return [[a[i][j]+b[i][j]for j in range(2)]for i in range(2)]
def scale(a,s):return [[s*a[i][j]for j in range(2)]for i in range(2)]
def inv(a):v=det(a);return [[a[1][1]/v,-a[0][1]/v],[-a[1][0]/v,a[0][0]/v]]
def pd(a):return a[0][0]>0 and det(a)>0

def bounds(lo,hi):
 th=arb.pi()*arb(A((lo+hi)/4),A((hi-lo)/4));t=r*acb(th.cos(),th.sin());t2=t*t;pp=acb(0)
 for q in reversed(odd):pp=pp*t2+q
 pp*=t;aux=acb(0)
 for q in reversed(Qn):aux=aux*t2+A(q)
 aux*=t;R=mul(mul(M,[[pp,acb(0)],[acb(0),aux]]),M);RR=[[x.real for x in row]for row in R]
 if not(pd(add(I,RR)) and pd(sub(I,RR))):return None
 D0=sub(I,mul(R,R));de=det(D0);absde2=de.real**2+de.imag**2
 if not(absde2>0):return None
 AP=inv(sub(I,R));AM=inv(add(I,R));C=scale(sub(AP,AM),arb(1)/2);Gp=sub([[x.real for x in row]for row in AP],scale(I,j));Gm=sub([[x.real for x in row]for row in AM],scale(I,j));Z=scale(add(Gp,Gm),arb(1)/2);Cr=scale(sub(Gp,Gm),arb(1)/2);Ci=[[x.imag for x in row]for row in C]
 if not(pd(Gp) and pd(Gm) and pd(Z)):return None
 zi=inv(Z);CrCr=mul(mul(Cr,zi),Cr);CiCi=mul(mul(Ci,zi),Ci);T=mul(mul(Gm,zi),Gp);E=scale(add(CrCr,CiCi),arb(1)/2);W=add(scale(T,2),E)
 if not(pd(T) and pd(W)):return None
 den=64*j**4*absde2*det(Z)*det(W)
 if not(den>0):return None
 val=(1/den).upper()
 if not(val<5):return None
 return val
st=time.time(); stack=[(F(k,1024),F(k+1,1024),10)for k in range(1024)];records=[];mean2=arb(0);maxdepth=0;count=0
while stack:
 lo,hi,depth=stack.pop();value=bounds(lo,hi)
 if value is not None and hi-lo<=F(1,65536):
  assert value.is_exact(); value_q=F(str(value.fmpq())); assert A(value_q)==value
  mean2+=A(hi-lo)*value;records.append([str(lo),str(hi),str(value_q)]);maxdepth=max(maxdepth,depth)
 else:
  assert depth<32,(lo,hi);mid=(lo+hi)/2;stack.extend([(lo,mid,depth+1),(mid,hi,depth+1)])
 count+=1
 if count%32768==0:print('calls',count,'arcs',len(records),'seconds',time.time()-st,flush=True)
ordered=sorted((F(x),F(y))for x,y,_ in records);assert ordered[0][0]==0 and ordered[-1][1]==1 and all(x[1]==y[0]for x,y in zip(ordered,ordered[1:]))
cap=F(7,4);assert mean2<A(cap),str(mean2); exact_mean=sum((F(hi)-F(lo))*F(v) for lo,hi,v in records); assert exact_mean<cap; N=501; tailcap=F(36748,10**12);assert cap*rad**(-2*N)/(rad**4-1)<tailcap**2
tail=A(cap).sqrt()*r**(-N)/(r**4-1).sqrt();out=dict(status='DIRECTED_GAUSSIAN_SCHUR_HARDY_TAIL_PASS',radius=str(rad),reference_precision='9/20',N=N,mean_square_upper=str(mean2.upper()),mean_square_upper_rational=str(exact_mean),serialization='Every accepted upper endpoint converted using exact arb.fmpq() and checked by exact Arb equality.',square_cap=str(cap),tail_upper=str(tail.upper()),tail_cap=str(tailcap),input_sha256=hashlib.sha256(source_bytes).hexdigest(),newpq_sha256=hashlib.sha256(newpq_bytes).hexdigest(),proof_sha256=hashlib.sha256(PROOF.read_bytes()).hexdigest(),script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),proof_scope='Universal bounded charge-one rounder; inherited Gaussian Schur inequality; fresh covariance cover.',arcs=len(records),max_depth=maxdepth,seconds=time.time()-st,accepted_arcs=records)
assert SOURCE.read_bytes()==source_bytes
(OUT/'fresh_hardy_result.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:v for k,v in out.items()if k!='accepted_arcs'},indent=2),flush=True)
