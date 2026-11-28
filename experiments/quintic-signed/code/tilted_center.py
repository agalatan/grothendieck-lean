"""Tilted central estimate for the signed fifth witness. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
from math import isqrt
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parent))
from one_coordinate_multiplier import ALPHA, BETA, NU, pi_interval, require
from tilted_radial_prices import check_prices

s,u,d,gamma=Q(".095"),Q(".91"),Q(".02"),Q(".475")
bounds=check_prices(s,u,d,gamma)
print({k:float(v) for k,v in bounds.items()})
pi_lo,pi_hi=pi_interval()
m=10**25
mu_lo=Q(isqrt(pi_lo.numerator*m*m//(4*pi_lo.denominator)),m)
mu_hi=Q(isqrt(pi_hi.numerator*m*m//(4*pi_hi.denominator))+1,m)
require(mu_lo**2<=pi_lo/4<pi_hi/4<=mu_hi**2,"outward mu")

def cost(t,tau2):
 dhi=mu_hi-t;dlo=mu_lo-t
 require(dlo>=0,'wrong outward signs')
 return NU+(pi_hi/4)*(ALPHA-BETA/8-3*d/64)+ALPHA*dhi**2-2*mu_lo*s*dlo+BETA*pi_hi/32*(1-u)**2+(BETA-gamma)*tau2+Q(1,10**52)
t=Q('.83835');raw=cost(t,0);lim=Q(10000,14023)
k=isqrt((lim-raw).numerator*(BETA-gamma).denominator*10**18//((lim-raw).denominator*(BETA-gamma).numerator))
tau=Q(k,10**9)
require(cost(t,tau**2)<lim<=cost(t,(tau+Q(1,10**9))**2),'central radius enclosure')
print('central cap without remote',float(raw),'tau',float(tau),'maximum charged cubic energy',float(tau**2))
require(tau == Q(137624483,10**9), 'certified central radius changed')
