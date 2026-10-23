"""Exact fixed-point reproduction of the Lean short-head costs.

The generated radii are proposals until ComparisonMass checks them natively.
All operations here enclose coefficient intervals using integer arithmetic;
there is no floating-point arithmetic. The fixed scale matches GrotheKernel.Basic."""
from fractions import Fraction as Q
D=2**128
Z=(0,0)
def ofrat(x):
 x=Q(x)*D;lo=x.numerator//x.denominator;return lo,-((-x.numerator)//x.denominator)
def mul(a,b):
 v=[x*y for x in a for y in b];return min(v)//D,-((-max(v))//D)
def conv(a,b):
 out=[Z]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  if x==Z:continue
  for j,y in enumerate(b):
   v=mul(x,y);z=out[i+j];out[i+j]=(z[0]+v[0],z[1]+v[1])
 return out
class Weights:
 def __init__(self,p,q,L=21):
  self.L=L;self.pp=[[(D,D)]];self.qq=[[(D,D)]]
  for row,co,N in [(self.pp,p,501),(self.qq,q[1:],167)]:
   co=list(map(ofrat,co))
   for _ in range(N):row.append(conv(co,row[-1])[:L])
  self.cache={}
 def __call__(self,n,m):
  if (n,m) in self.cache:return self.cache[n,m]
  k=max(0,251-(n//2+m//2+m))
  if n<=501 and m<=167 and k<=self.L:
   co=conv(self.pp[n],self.qq[m])[:k]
   w=min(Q(1),max(Q(0),Q(sum(max(-a,b,0) for a,b in co),D)))
  else:w=Q(1)
  self.cache[n,m]=w;return w
