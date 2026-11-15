# Agent-ID: codex-a7c4. Refs #431. Exact constants for a uniform small-amplitude strip.
from fractions import Fraction as F
import json
from math import comb, factorial
if not __debug__: raise RuntimeError('Assertions must be enabled')
a,b=F(699,1250),F(179,1250)
delta=F(1,500)
eps=F(1,50000)
M=lambda t:F(503,1000)+F(613,500)*t
assert M(36)<45
# For delta <= r <=1, |L| <=3 implies T<6.
assert 6*(a+6*b)**2>9
assert 10*eps*M(6)<delta
# For 1 <=r and T<=36, the same relative displacement holds.
assert 10*eps*45<1
# If T >= 36, |L+w| >= b*T**(3/2)-2 >= .9*b*T**(3/2).
assert b*216/10>2
# M(T) <= (5/4)T on this ray. The ratio M/|L+w| is at most 2.
assert M(36)<=F(5,4)*36
assert F(5,4)/(F(9,10)*b*6)<2
assert 10*eps*2<1
# Hessian tail <= integral_36^infty 3T exp(-T), using sqrt(T)<=T/6.
assert F(25,16)/(F(9,10)*b*6)<3
# Taylor derivative tail <= integral_36^infty 120 exp(-T).
assert F(125,64)/(F(81,100)*b*b)<120
# exp(3)>20 from a positive truncated Taylor series.
fac=1;s=F(1)
for k in range(1,17):
 fac*=k;s+=F(3**k,fac)
assert s>20
tail_exp=F(1,20**12)
assert 111*tail_exp<F(1,10**10)
# For T <=36, |L+w|<40, uniformly |w|<=2.
assert 6*(a+36*b)+2<40
# log(40/delta)<10 since exp(1)>27/10, checked by its first five terms.
assert sum((F(1,1),F(1,1),F(1,2),F(1,6),F(1,24)))>F(27,10)
assert F(27,10)**10>40/delta
# Weighted third-moment density: exp(-T) M(T)^3 / D(T) <=16/5.
# Prove (16/5) D(T) sum_{j=0}^8 T^j/j! - M(T)^3 >0 by Bernstein.
cap=F(16,5);D=[a*a,4*a*b,3*b*b];poly=[F(0)]*11
for i,di in enumerate(D):
 for j in range(9):poly[i+j]+=cap*di/F(factorial(j))
for j in range(4):poly[j]-=F(comb(3,j))*F(503,1000)**(3-j)*F(613,500)**j
def translated(lo,span):
 return [sum(poly[k]*comb(k,j)*lo**(k-j)*span**j for k in range(j,11)) for j in range(11)]
minimum=None
for i in range(64):
 pp=translated(F(i,16),F(1,16))
 bb=[sum(pp[j]*F(comb(k,j),comb(10,j)) for j in range(k+1)) for k in range(11)]
 assert min(bb)>0
 minimum=min(bb) if minimum is None else min(minimum,min(bb))
assert min(translated(F(4),F(1)))>0
near=2*F(81,100)*delta
far=4*eps*(2*cap*10+120*tail_exp)
reserve=F(1,100)-near-far
assert reserve>F(16,10000)
# The inherited uniform Rem <=2.17 S closes amplitudes >=267/200.
rho=F(5053,10000)
base_min=F(2500,1891)-F(463,5000)-F(67,100)*(1+rho*rho)
assert base_min+F(267,200)**2>F(217,100)
assert base_min+F(891,500)>F(217,100)
assert F(236,125)**2/2>F(891,500)
result={'amplitude_exterior':str(F(267,200)),'density_min_bernstein':str(minimum),'epsilon':str(eps),'delta':str(delta),'near':str(near),'far_upper':str(far),'reserve':str(reserve),'hessian_tail_upper':str(111*tail_exp),'status':'PASS conditional on the separate full-shift Hessian certificate and inherited density cap'}
print(json.dumps(result,indent=2))
