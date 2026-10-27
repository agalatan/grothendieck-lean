#!/usr/bin/env python3
"""One shared centered-series radial panel; external Arb experiment only.

Uses the actual phase inputs, four auxiliary Hermite modes and m=0 on
[1, 1.001]. This does not certify a whole coefficient, band or Lean theorem.
"""
if not __debug__:
    raise SystemExit('optimized Python is unsupported: checks must remain enabled')
import flint
import ast,json,math,time,sys
from collections import defaultdict
from fractions import Fraction as Q
from pathlib import Path
from flint import arb,acb,acb_series,ctx
ctx.prec=200;ctx.cap=21
assert flint.__version__=='0.9.0'
R=Path(__file__).resolve().parents[2]; d=json.loads((R/'data/upper-preprocess/certificate.json').read_text())
def A(x):
 q=Q(x);return arb(q.numerator)/q.denominator
src=(R/'tools/q0_cert/softened_q0_cover.py').read_text();env={'__file__':str(R/'tools/q0_cert/softened_q0_cover.py'),'__name__':'__pilot__'}
exec(src.split('mlo,mhi=int(sys.argv[1])',1)[0],env);ctx.prec=200;ctx.cap=21
# Gather exact phase coefficients for powers s^a r^c w^i wbar^j.
raw=defaultdict(Q)
for z in d['phase']:
 a,b,c=z['powers']
 for k in range(c+1):raw[a,c,b+k,b+c-k]+=Q(z['coefficient'])*Q(math.comb(c,k),2**c)
raw={key:q for key,q in raw.items() if q}
assert len(raw)==5985
alpha=1+A(d['phaseEpsQ']);t=arb(1);eta2=arb(1)/10**28
weight=(arb(3)/10)/(arb.pi().sqrt()*(1+arb(15)/10**15))*(-eta2).exp()
def value(s):
 r=s.sqrt();k=0
 for coeff in reversed(env['power']):k=k*s+coeff
 beta=alpha+t*k*k
 if isinstance(beta,acb): assert beta.is_finite() and not beta.contains(0)
 mu=-t*k*r/beta;v=1/beta
 D=(-(alpha-1)*s-alpha*t*s/beta).exp()/beta
 sp=[s**i for i in range(18)];rp=[r**i for i in range(35)]
 P={}
 for (a,c,i,j),q in raw.items():
  x=A(q)*sp[a]*rp[c+1]/2
  for key,term in (((i+1,j),x*r),((i,j+1),-x*r),((i+2,j),x*k),((i+1,j+1),-x*k)):
   P[key]=P.get(key,0)+term
 # Moment shifts adequate for a,b <= 25.
 imax=max(i for i,j in P)+25;jmax=max(j for i,j in P)+25
 M=[[0 for _ in range(jmax+1)] for _ in range(imax+1)];M[0][0]=D
 for i in range(1,imax+1):M[i][0]=mu*M[i-1][0]
 for j in range(1,jmax+1):
  for i in range(imax+1):M[i][j]=mu*M[i][j-1]+(i*v*M[i-1][j-1] if i else 0)
 S=[[sum((c*M[i+a][j+b] for (i,j),c in P.items()),0) for b in range(26)] for a in range(26)]
 common=weight*(-s).exp()*r
 vals={}
 for a,b in ((0,0),(0,2),(5,5),(25,25)):
  val=sum(((-1)**j*math.factorial(j)*math.comb(a,j)*math.comb(b,j)*S[a-j][b-j] for j in range(min(a,b)+1)),0)
  vals[a,b]=common*val/(arb(math.factorial(a))*math.factorial(b)).sqrt()
 return vals
start=time.perf_counter();disc=acb(arb(1,'1/8'),arb(0,'1/8'))
# Re(s)>0 on the enclosing square, so the principal sqrt is analytic there.
assert disc.real>0
sup=value(disc)
assert all(z.is_finite() for z in sup.values())
series=value(acb_series([1,1]));dx=arb(1)/10**3;rho=arb(1)/8
for key,f in series.items():
 assert f.prec>=21
 integ=sum((f[n]*dx**(n+1)/(n+1) for n in range(21)),acb(0))
 rem=dx*abs(sup[key]).abs_upper()*(dx/rho)**21/(1-dx/rho)
 assert integ.is_finite() and rem.is_finite() and integ.imag.contains(0)
 result=integ.real+arb(0,rem.abs_upper())
 assert result.is_finite()
 print('mode H',key,'M',abs(sup[key]).str(6),'Taylor remainder',rem.str(6),'integral',result.str(16),'radius',result.rad().str(6))
 if key==(0,0):
  # Existing cover integrand, same Taylor/Cauchy enclosure algorithm.
  tree=ast.parse(src);loop=next(n for n in tree.body if isinstance(n,ast.For) and getattr(n.target,'id',None)=='m')
  fun=next(n for n in loop.body if isinstance(n,ast.FunctionDef) and n.name=='evaluate')
  exec(compile(ast.Module(body=[fun],type_ignores=[]),'q0-cover','exec'),env)
  env['t']=arb(1);env['fac']=-env['h']/env['pi'].sqrt()*(-env['eta2']).exp()/(1+env['scale'])
  def prior(x):
   k=0
   for a in reversed(env['power']):k=k*x+a
   return env['evaluate'](x,k)
  qdisc=prior(disc);qseries=prior(acb_series([1,1]));assert qdisc.is_finite() and qseries.prec>=21
  qint=sum((qseries[n]*dx**(n+1)/(n+1) for n in range(21)),acb(0))
  qrem=dx*abs(qdisc).abs_upper()*(dx/rho)**21/(1-dx/rho)
  qres=qint.real+arb(0,qrem.abs_upper())
  assert qint.imag.contains(0) and qres.is_finite() and result.overlaps(qres)
  print('q0 existing cover panel',qres.str(16),'radius',qres.rad().str(6),'remainder',qrem.str(6),'overlaps',result.overlaps(qres))
print('elapsed',round(time.perf_counter()-start,3),'s')
print('One external Arb panel. No complete band, numerical tail, or Lean theorem.')
