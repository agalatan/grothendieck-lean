#!/usr/bin/env python3
"""Exact rational interval replay of centered profile-root cover.

Only tracked certificate.json is input; the pi bracket is Mathlib's d20
bracket. Square-root brackets are proved by integer squaring. This is a
research checker, not a Lean theorem.
Agent-ID: codex-e4b7.
"""

if not __debug__:
    raise SystemExit("optimized Python is unsupported: checks must remain enabled")
from fractions import Fraction as Q
from math import comb, factorial, isqrt
from pathlib import Path
import json

root = Path(__file__).resolve().parents[1]
data = json.loads((root/'data/upper-preprocess/certificate.json').read_text())
shape_a=Q(data['aQ']); profile=list(map(Q,data['profileQ']))
assert len(profile)==12

# Exact endpoint operations; interval representation is a closed pair.
def add(x,y): return (x[0]+y[0],x[1]+y[1])
def mul(x,y):
 t=[v*w for v in x for w in y]
 return min(t),max(t)
def scale(x,q): return mul(x,(q,q))
def inv_pos(x):
 assert x[0]>0
 return (1/x[1],1/x[0])
def sqrti(x,bits=90):
 assert x[0]>0
 def low(v): return Q(isqrt((v.numerator << (2*bits))//v.denominator),1<<bits)
 l=low(x[0]); h=low(x[1])+Q(1,1<<bits)
 assert l*l<=x[0] and x[1]<=h*h
 return l,h

pi=(Q('3.14159265358979323846'),Q('3.14159265358979323847'))
sqrt_pi=sqrti(pi)
a_fac=sqrti((1+shape_a*shape_a,1+shape_a*shape_a))
coeff=[(Q(),Q()) for _ in range(12)]
gamma=[]
for j,xj in enumerate(profile):
 norm=sqrti(scale(sqrt_pi,Q(comb(2*j,j),4**j)))
 g=mul(a_fac,inv_pos(norm))
 G=1<<120
 glo=(g[0]*G).numerator//(g[0]*G).denominator
 ghi=-((-g[1]*G).numerator//(-g[1]*G).denominator)
 g=(Q(glo,G),Q(ghi,G)); gamma.append(g)
 common=scale(g,xj)
 for k in range(j+1):
  lag=Q((-1)**k,factorial(k))
  for i in range(j-k): lag*=Q(2*k+1+2*i,2*(i+1))
  coeff[k]=add(coeff[k],scale(common,lag))

# Round the final coefficient enclosures outward to a compact dyadic grid.
# They can be encoded exactly in the existing fixed-precision interval kernel.
D=1<<100
def dyadic_out(x):
 lo=(x[0]*D).numerator//(x[0]*D).denominator
 hi=-((-x[1]*D).numerator//(-x[1]*D).denominator)
 assert Q(lo,D)<=x[0] and x[1]<=Q(hi,D)
 return Q(lo,D),Q(hi,D)
coeff=list(map(dyadic_out,coeff))

regions=[(Q(12),Q(15)),(Q(83,4),Q(522,25)),(Q(126,5),Q(2521,100))]
outer=[]; left=Q(0)
for lo,hi in regions:
 outer.append((left,lo));left=hi
outer.append((left,Q(80)))

def range_centered(lo,hi):
 c=(lo+hi)/2; r=(hi-lo)/2
 sh=[]
 for j in range(12):
  v=(Q(),Q())
  for k in range(j,12):v=add(v,scale(coeff[k],Q(comb(k,j))*c**(k-j)))
  sh.append(v)
 rad=sum((max(abs(v[0]),abs(v[1]))*r**j for j,v in enumerate(sh) if j),Q())
 return sh[0][0]-rad,sh[0][1]+rad

accepted=[]; nodes=0
for lo,hi,inside in [(a,b,False) for a,b in outer]+[(a,b,True) for a,b in regions]:
 stack=[(lo,hi,0)]
 while stack:
  a,b,d=stack.pop(); low,high=range_centered(a,b); nodes+=1
  ok=(low>-Q(1,5) and high<Q(1,5)) if inside else (low>Q(1,1000) or high<-Q(1,1000))
  if ok:
   accepted.append((a,b,inside));continue
  if d>=30:raise ArithmeticError((a,b,d,float(low),float(high)))
  mid=(a+b)/2
  stack.extend(((a,mid,d+1),(mid,b,d+1)))
print('coefficient enclosures:',len(coeff),'pi bracket:',pi)
print('accepted boxes:',len(accepted),'visited nodes:',nodes)
for lo,hi,inside in sorted(accepted):print(str(lo),str(hi),'inner' if inside else 'outer')
print('PASS exact rational intervals; pi bracket and soundness not Lean checked')
