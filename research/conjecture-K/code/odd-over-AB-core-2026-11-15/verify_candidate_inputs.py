#!/usr/bin/env python3
"""codex-91d4 #430. C: exact Phase1 witness inputs only, not payoff integrals."""
from fractions import Fraction as F
from math import isqrt
import json,sys
if not __debug__:raise SystemExit('Assertions required; no -O/-OO.')
C,A,B,D,E,N=F(57,5000),F(133,1000),F(21,200),F(63,1000),F(53,10000),F(7,5000)
rho=F(5053,10000)
energies=[2*C*C,A*A,2*B*B,D*D,2*E*E,2*N*N]
weights=[F(1,2),F(2,3),F(4,3),F(1),F(1),F(8,7)]
total=sum(energies);weighted=sum(x*y for x,y in zip(weights,energies));W=sum(energies[3:])
assert total==F(2201401,50000000)
assert weighted==F(6802843,150000000)
assert energies[0]<F(463,10000) and total<F(80051,10**6)
def atan(x,n=30):
 v=sum(((-1)**k*x**(2*k+1)/F(2*k+1) for k in range(n)),F(0));r=(-1)**n*x**(2*n+1)/F(2*n+1)
 return min(v,v+r),max(v,v+r)
l5,h5=atan(F(1,5));l239,h239=atan(F(1,239));plo,phi=16*l5-4*h239,16*h5-4*l239
assert plo>F(3141592653589793,10**15)
caplo=F(1891,2500)**2*(plo/4-F(21,25)**2)
assert caplo-weighted>F(3035,10**7)
scale=10**35;rt=isqrt(2*scale**2);lo,hi=F(rt,scale),F(rt+1,scale)
assert lo*lo<2<hi*hi
Ulo=2*B*B+rho*rho*A*A-2*rho*A*B*hi
Uhi=2*B*B+rho*rho*A*A-2*rho*A*B*lo
Rlo=A*A+2*rho*rho*B*B+2*rho*A*B*lo
Rhi=A*A+2*rho*rho*B*B+2*rho*A*B*hi
allowhi=Uhi/100+F(1,20000)
assert allowhi<F(116077,10**9)
print(json.dumps({'agent_id':'codex-91d4','issue':430,'status':'C exact rational/algebraic inputs; no payoff claim',
 'polynomial_coefficients':dict(zip(['c0','a0','b0','d0','e0','n0'],map(str,[C,A,B,D,E,N]))),
 'energies':list(map(str,energies)),'total':str(total),'weighted':str(weighted),'W':str(W),
 'weighted_cap_slack_lower_decimal_N':float(caplo-weighted),'U_squared_interval':list(map(str,[Ulo,Uhi])),
 'R_squared_interval':list(map(str,[Rlo,Rhi])),'U_squared_decimal_N':float(Ulo),
 'allowance_upper_exact':str(allowhi),'allowance_upper_decimal_N':float(allowhi)},indent=2))
