# /workspace/scratch/a2f683456ed1/grothendieck-literature-1402/existing-program/exterior_transfer.py
"""Exact old-row transfer diagnostics. Sharp radius use is conditional until its source is audited."""
if not __debug__:
 raise RuntimeError('Run without -O; assertions are required.')
import re,json
from pathlib import Path
from fractions import Fraction as F
DATA=json.loads((Path(__file__).resolve().parent/'inherited_rows.json').read_text())
e=F(1891,2500);old=F(149,200);de=e-old;target=F(500,701);pad=F(1,10**11)
def atan_sum(inv,n):return sum((F((-1)**j,(2*j+1)*inv**(2*j+1)) for j in range(n)),F(0))
# Alternating-series bounds and Machin's identity: pi=16 atan(1/5)-4 atan(1/239).
pi_hi=16*atan_sum(5,7)-4*atan_sum(239,6)
assert pi_hi<F(355,113)
RiceA=F(886762780,10**9);RiceB=F(432306903,10**9)
rows=[(r['name'],F(r['ell']),F(r['beta']),F(r['cap'])) for r in DATA['rows']]
assert len(rows)==19

def maxconvex(fn,lo,hi):return max(fn(lo),fn(hi))
def oldcell(row,lo,hi,rho):
 _,ell,beta,cap=row
 def base(t):return t*t-2*ell*t+2*beta*beta/e+cap+pad
 via_radius=maxconvex(lambda t:base(t)+de*rho*rho,lo,hi)
 via_energy=maxconvex(lambda t:base(t)+de*(F(3,2)*(pi_hi/4-t*t)+RiceB*(RiceA-t)),lo,hi)
 return min(via_radius,via_energy)

def cover(rho):
 passed=[];gaps=[];previous=False
 for j in range(1773):
  lo=F(j,2000);hi=F(j+1,2000)
  caps=[('crude',hi*hi+e*rho*rho)]+[(r[0],oldcell(r,lo,hi,rho)) for r in rows]
  name,cap=min(caps,key=lambda x:x[1])
  ok=cap<target
  if not ok:
   if previous:gaps[-1][1]=str(hi)
   else:gaps.append([str(lo),str(hi)])
  previous=not ok
  if ok:passed.append({'lo':str(lo),'hi':str(hi),'bound':str(cap),'source':name})
 return {'rho':str(rho),'gaps':gaps,'accepted_cells':len(passed),'cells':passed}

def mixcover(rho):
 passed=[];gaps=[];previous=False
 for j in range(1773):
  lo=F(j,2000);hi=F(j+1,2000);mid=(lo+hi)/2
  ordinary=[('crude',hi*hi+e*rho*rho)]+[(r[0],oldcell(r,lo,hi,rho)) for r in rows]
  name,cap=min(ordinary,key=lambda x:x[1])
  if cap<target:
   passed.append({'lo':str(lo),'hi':str(hi),'bound':str(cap),'source':name,'theta':'0'})
   previous=False
   continue
  # Each tuple is a retained h-square row at the same new epsilon.
  data=[('crude',F(0),F(0),e*rho*rho,F(0))]
  for name,ell,beta,cap in rows:
   data.append((name,ell,beta,2*beta*beta/e+cap+pad,de))
  def at(row,t):
   _,ell,beta,cost,charge=row
   U=min(rho*rho,F(3,2)*(pi_hi/4-t*t)+RiceB*(RiceA-t))
   return t*t-2*ell*t+cost+charge*U
  best=('none',F(10),F(0))
  for i,a in enumerate(data):
   for b in data[i:]:
    K=2*(a[2]-b[2])**2/e
    theta=max(F(0),min(F(1),(at(a,mid)-at(b,mid)+K)/(2*K))) if K else F(0)
    # Round to a rational mixture, not used until endpoints are verified.
    theta=F(round(float(theta)*10**6),10**6)
    # U is a minimum of two convex-branch envelopes. Fix its chosen branch
    # for the whole cell before applying convexity.
    ell=(1-theta)*a[1]+theta*b[1]
    cost=(1-theta)*a[3]+theta*b[3]-K*theta*(1-theta)
    charge=(1-theta)*a[4]+theta*b[4]
    def rowval(t,U):return t*t-2*ell*t+cost+charge*U
    rad=max(rowval(t,rho*rho) for t in [lo,hi])
    energy=max(rowval(t,F(3,2)*(pi_hi/4-t*t)+RiceB*(RiceA-t)) for t in [lo,hi])
    cap=min(rad,energy)
    if cap<best[1]:best=(a[0]+'+'+b[0],cap,theta)
  ok=best[1]<target
  if not ok:
   if previous:gaps[-1][1]=str(hi)
   else:gaps.append([str(lo),str(hi)])
  previous=not ok
  if ok:passed.append({'lo':str(lo),'hi':str(hi),'bound':str(best[1]),'source':best[0],'theta':str(best[2])})
 return {'rho':str(rho),'mixtures':True,'gaps':gaps,'accepted_cells':len(passed),'cells':passed}

if __name__=='__main__':
 import sys
 if '--mix' in sys.argv:out=[mixcover(F(973612157,10**9)),mixcover(F(95133,10**5))]
 else:out=[cover(F(973612157,10**9)),cover(F(95133,10**5))]
 Path('exterior_transfer.json').write_text(json.dumps(out,indent=2))
 for r in out:print({k:v for k,v in r.items() if k!='cells'})
