#!/usr/bin/env python3
"""Arb interval cover: profile root neighborhoods and separation on [0,80]."""

if not __debug__:
    raise SystemExit("optimized Python is unsupported: checks must remain enabled")
from flint import arb,ctx
from fractions import Fraction as Q
import contextlib,io,runpy,time
from pathlib import Path
ctx.prec=160
with contextlib.redirect_stdout(io.StringIO()): m=runpy.run_path(str(Path(__file__).with_name('arb_centered_probe.py')))
p=m['power']; A=m['A']
regions=[(Q(12),Q(15)),(Q(83,4),Q(522,25)),(Q(126,5),Q(2521,100))]
accepted=[]
# Centered Taylor model: bound variation around midpoint using actual derivative coefficients.
def ball(l,r):
 c=A((l+r)/2); rad=A((r-l)/2)
 sh=[sum((p[k]*m['comb'](k,j)*c**(k-j) for k in range(j,12)),arb(0)) for j in range(12)]
 delta=sum((abs(sh[j])*rad**j for j in range(1,12)),arb(0))
 return abs(sh[0]),delta

def verify(l,r,inner):
 stack=[(l,r,0)]; count=0; maxdepth=0
 while stack:
  a,b,d=stack.pop(); mid=(a+b)/2
  z,err=ball(a,b); count+=1;maxdepth=max(maxdepth,d)
  ok=(z+err<A(Q(1,5))) if inner else (z-err>A(Q(1,1000)))
  if ok:
   accepted.append((a,b,inner))
   continue
  if d>=30: raise ArithmeticError((a,b,d,str(z),str(err)))
  stack.extend([(a,mid,d+1),(mid,b,d+1)])
 return count,maxdepth
start=time.perf_counter(); outside=[]; cursor=Q(0)
for l,r in regions:
 outside.append((cursor,l)); cursor=r
outside.append((cursor,Q(80)))
for a,b in outside:
 n,d=verify(a,b,False); print('outside',a,b,'subboxes',n,'depth',d,flush=True)
for a,b in regions:
 n,d=verify(a,b,True); print('inside',a,b,'subboxes',n,'depth',d,flush=True)
print('PASS |κ|>1/1000 outside, |κ|<1/5 inside on [0,80]; seconds',round(time.perf_counter()-start,2))
print('No Lean proof; exclusion outside [0,80] is not claimed.')
