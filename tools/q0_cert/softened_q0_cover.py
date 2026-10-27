#!/usr/bin/env python3
"""Resumable full softened q=0 radial cover; outside Lean, external Arb.

Usage: python softened_q0_cover.py FIRST LAST OUTPUT.json
Indices included, bounded by -220...235.  A complete certificate requires
all 456 indices, verified cover, two separately budgeted omissions, and audit.
"""

if not __debug__:
    raise SystemExit("optimized Python is unsupported: checks must remain enabled")
import flint
from flint import arb, acb, acb_series, ctx
from fractions import Fraction as Q
from collections import defaultdict
from math import comb, factorial, prod
from pathlib import Path
from time import perf_counter
import json,sys,re,hashlib
ctx.prec=160
assert flint.__version__=='0.9.0', 'this external replay is pinned to python-flint 0.9.0'
root=Path(__file__).resolve().parents[2]
data=json.loads((root/'data/upper-preprocess/certificate.json').read_text())
lean=(root/'Grothe/Upper/Data.lean').read_text()
phaseblock=lean.split('def phaseStrs : List String :=',1)[1].split('/--',1)[0]
parsed=re.findall(r'"(\d+),(\d+),(\d+):([^"]+)"',phaseblock)
lean_phase={(int(a),int(b),int(c)):Q(q) for a,b,c,q in parsed}
json_phase={tuple(x['powers']):Q(x['coefficient']) for x in data['phase']}
assert len(parsed)==len(lean_phase)==len(json_phase)==len(data['phase'])==1140 and lean_phase==json_phase
profileblock=lean.split('def profileQ : List ℚ :=',1)[1].split('/--',1)[0]
profile=[Q(int(n),int(d)) for n,d in re.findall(r'\((-?\d+)\s*:\s*ℚ\)\s*/\s*(\d+)',profileblock)]
assert profile==list(map(Q,data['profileQ'])) and len(profile)==12
for key in ('aQ','phaseEpsQ'):
 block=lean.split(f'def {key} : ℚ :=',1)[1].split('/--',1)[0]
 match=re.fullmatch(r'\s*\((-?\d+)\s*:\s*ℚ\)\s*/\s*(\d+)\s*',block)
 assert match and Q(int(match[1]),int(match[2]))==Q(data[key])
def A(q):
 q=Q(q); return arb(q.numerator)/q.denominator
raw=defaultdict(Q)
for v in data['phase']:
 a,b,c=v['powers'];d=Q(v['coefficient'])
 for j in range(b+1):
  for k in range((2*j+c)//2+1):
   n=2*j+c-2*k;key=(a+j+c-k,b-j+1+k,n)
   raw[key]+=d*comb(b,j)*prod(range(1,2*(b-j)+2,2))*comb(2*j+c,2*k)*prod(range(1,2*k,2))*(-1)**n/2**key[1]
poly=[(i,j,k,A(c)) for (i,j,k),c in raw.items() if c]
assert len(poly)==2109
groups={}
for i,j,k,c in poly: groups.setdefault((i,j),[]).append((k,c))
assert Q(data['phaseEpsQ'])==Q(21,20)
pi=arb.pi(); h=A('3/10'); alpha=1+A(data['phaseEpsQ']); eta2=A(Q(1,10**28)); scale=A(Q(15,10**15)); factor=(1+A(data['aQ'])**2).sqrt()
power=[arb(0) for _ in range(12)]
for j,x in enumerate(data['profileQ']):
 norm=(pi.sqrt()*arb(comb(2*j,j))/4**j).sqrt()
 for k in range(j+1):
  bh=prod((Q(2*k+1+2*i,2*(i+1)) for i in range(j-k)),start=Q(1))
  power[k]+=factor*A(x)*(-1)**k*A(bh)/factorial(k)/norm
bounds=list(map(Q,['0','4','8','9','10','11','12','15','16','17','18','19','20','83/4','522/25','21','22','23','24','25','126/5','2521/100','26','27','28','29','30','35']))
J={(Q(12),Q(15)),(Q(83,4),Q(522,25)),(Q(126,5),Q(2521,100))}
assert bounds==sorted(bounds) and bounds[0]==0 and bounds[-1]==35
mlo,mhi=int(sys.argv[1]),int(sys.argv[2]);assert -220<=mlo<=mhi<=235
path=Path(sys.argv[3]);budget=A(Q(1,10**17));total=arb(0);fails=[];count=0;calls=0; start=perf_counter()
suppressed=taylored=adaptive=0; suppression_total=arb(0)
for m in range(mlo,mhi+1):
 t=(m*h).exp();fac=-h/pi.sqrt()*(m*h/2-eta2*t).exp()/(1+scale)
 def evaluate(s,k):
  beta=alpha+k*k*t;b=1/beta;v=k*t*b
  sp=[1];bp=[1];vp=[1]
  for _ in range(17):sp.append(sp[-1]*s)
  for _ in range(18):bp.append(bp[-1]*b)
  for _ in range(34):vp.append(vp[-1]*v)
  w=sum((sp[i]*bp[j]*sum((c*vp[k] for k,c in terms),0) for (i,j),terms in groups.items()),0)
  return fac*(-alpha*s-alpha*s*t*b).exp()*k*s*b*w
 def f(s,analytic):
  global calls
  calls+=1; k=acb(0)
  for c in reversed(power):k=k*s+c
  return evaluate(s,k)
 for l,r in zip(bounds,bounds[1:]):
  if (l,r) in J and m>=6:continue # >=9 is response omission; 6..8 has separate <3e-21 q0 bound
  print(f'panel m={m} [{l},{r}]',flush=True)
  stack=[(l,r,0)]
  while stack:
   a,b,depth=stack.pop(); allowed=budget*A((b-a)/35)
   center=A((a+b)/2); half=A((b-a)/2); S=A(b)
   shift=[sum((power[k]*comb(k,j)*center**(k-j) for k in range(j,12)),arb(0)) for j in range(12)]
   variation=sum((abs(shift[j])*half**j for j in range(1,12)),arb(0))
   K=abs(shift[0])+variation; L=abs(shift[0])-variation
   if a>0 and K.is_finite():
    bmin=alpha+L*L*t if L>0 else alpha
    vmax=t.sqrt()/(2*alpha.sqrt())
    if L>0 and 1/L<vmax:vmax=1/L
    boundW=sum((abs(c)*S**i/bmin**j*vmax**k for i,j,k,c in poly),arb(0))
    damp=(-alpha*A(a)-alpha*A(a)*t/(alpha+K*K*t)).exp()
    sup=abs(fac)*K*S/bmin*boundW*damp*A(b-a)
    if sup.is_finite() and sup<allowed/4:
     radius=sup.abs_upper();total+=arb(0,radius);suppression_total+=radius
     count+=1;suppressed+=1;continue
   # Cauchy disc: the complex square of half-width b-a contains the disc.
   delta=acb(arb(0,str(b-a)),arb(0,str(b-a)));kd=acb(0)
   for c in reversed(shift):kd=kd*delta+c
   beta_disc=alpha+kd*kd*t
   # A guard failure is not evidence of a real singularity. Subdivide before
   # spending the adaptive integrator's budget on an excessively wide disc.
   if (not beta_disc.is_finite() or beta_disc.contains(0)) and depth<16:
    c=(a+b)/2;stack.extend([(a,c,depth+1),(c,b,depth+1)]);continue
   if beta_disc.is_finite() and not beta_disc.contains(0):
    disc=evaluate(acb(center)+delta,kd)
    if disc.is_finite():
     M=abs(disc).abs_upper(); rem=A(b-a)*M/2**80
     if rem.is_finite() and rem<allowed/4:
      ctx.cap=81;x=acb_series([0,1]);ss=acb_series(center)+x;ks=acb_series(0)
      for c in reversed(shift):ks=ks*x+c
      polyseries=evaluate(ss,ks)
      integ=sum((polyseries[n]*(2*half**(n+1)/(n+1)) for n in range(0,81,2)),acb(0))
      if polyseries.prec>=81 and integ.is_finite() and integ.imag.contains(0):
       enclosure=integ.real+arb(0,rem.abs_upper())
       if enclosure.is_finite() and enclosure.rad()<allowed:
        total+=enclosure;count+=1;taylored+=1;continue
   y=acb.integral(f,acb(A(a)),acb(A(b)),abs_tol=allowed/4,rel_tol=A(Q(1,10**12)),eval_limit=400,deg_limit=100,depth_limit=20)
   if y.is_finite() and y.imag.contains(0) and y.real.rad()<allowed:
    total+=y.real;count+=1;adaptive+=1;continue
   if depth>=16:
    fails.append({'m':m,'left':str(a),'right':str(b),'reason':'no sufficiently narrow finite interval'});continue
   c=(a+b)/2;stack.extend([(a,c,depth+1),(c,b,depth+1)])
 print(f'm={m} leaves={count} calls={calls} failures={len(fails)} secs={perf_counter()-start:.2f}',flush=True)
 if fails: break
mid,rad=tuple(map(int,total.mid().man_exp())),tuple(map(int,total.rad().man_exp()))
result={'scope':'external Arb partial softened q0 sum; not Lean', 'first':mlo,'last':m,'expected_last':mhi,'successful':not fails and m==mhi,'mid_mantissa_exp':list(mid),'rad_mantissa_exp':list(rad),'scale_budget':'1e-17','leaves':count,'calls':calls,'suppressed':suppressed,'taylored':taylored,'adaptive':adaptive,'suppression_bound_mantissa_exp':list(map(int,suppression_total.abs_upper().man_exp())),'failures':fails,'seconds':perf_counter()-start,'flint_version':flint.__version__,'eta':'1e-14','h':'3/10','lower_index':-220,'upper_index':235,'normalization':'1+15e-15','omitted_root_rule':'m>=9 on J','q0_omitted_root_m6to8_budget':'3e-21','outer_s_tail_budget':'1e-16','input_sha256':hashlib.sha256((root/'data/upper-preprocess/certificate.json').read_bytes()).hexdigest(),'lean_data_sha256':hashlib.sha256((root/'Grothe/Upper/Data.lean').read_bytes()).hexdigest(),'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
path.write_text(json.dumps(result,indent=2)+'\n')
print('OUTPUT',path,'sum',total,'successful',result['successful'])
if not result['successful']:sys.exit(1)
