#!/usr/bin/env python3
"""Exact scalar comparisons for the secant route. Agent-ID: codex-6e2b.

Analytic implications are proved in secant_proof.md. This file does not
replace the theta cover, radial table regeneration, or compact secant cover.
"""
from fractions import Fraction as F
from math import factorial
from pathlib import Path

a,b,d=F(699,1250),F(179,1250),F(2,5)
p,s=F(2500,1891),F(3,5)
P=p-s*s
Sec=F(13,20)
assert P-Sec==F(59009,189100)>0

# Large amplitude, with M=2 exp(-2/5)-3/5.
e04=sum((d**k/F(factorial(k)) for k in range(4)),F(0))
assert e04==F(559,375)>F(40,27)
assert 2/e04-F(3,5)<F(3,4)
assert Sec*F(60,13)==3

# Exterior |w|>=6, all amplitudes.
assert 2*(a+4*b)==F(283,125)
assert F(6925000,805701)<F(47,16)**2
e4=sum((F(4)**k/F(factorial(k)) for k in range(12)),F(0))
assert e4==F(340217,6237)>F(600,11)
coef=F(36,5)*F(47,16)-F(2770,467)
assert coef>0
ext=F(170,467)+F(11,600)*coef
assert ext==F(3603551,5604000)<Sec

# Small amplitudes: scalar target row + uniform projection exterior.
row=[line.split() for line in (Path(__file__).parent/'theta_candidates.txt').read_text().splitlines()
     if line.strip() and not line.startswith('#')]
assert ['161','165138','377064','373547','649660','551070','649660'] in row
K=F(33,200)
assert K<F(165138,10**6)
assert a-K*K/(3*b)>F(49,100)
assert F(8,3)**2>7
assert F(8,3)*(a+7*b)+K*F(33,5)<F(23,4)
e3=sum((F(3)**k/F(factorial(k)) for k in range(9)),F(0))
assert e3==F(89641,4480)>20
assert sum((F(1,factorial(k)) for k in range(4)),F(0))>F(5,2)
assert F(3)*F(33,5)**2/F(490)+F(19,96000)/b<F(27,100)<F(649660,10**6)<Sec

# Exact angular-polynomial certificate for the central content estimate.
angular_bernstein=[F(15),F(12),F(19,3),F(0),F(3)]
assert min(angular_bernstein)>=0
content=F(11,108)*F(313,500)**2
assert content==F(1077659,27000000)<F(1,25)

# Dimension-free corollaries, using the separately replayed content bounds.
k=P-Sec
u0=F(196979,100000000)
delta0=F(2037,12500000)
assert 126**2*42*u0**6<(k/50000)**2
assert 9*delta0**3<(k/50000)**2
D0=F(20,19)*(F(1,2500)/k-F(1,50000))
assert D0==F(3722991,2802927500)<F(133,100000)
assert F(3,10)/k==F(56730,59009)<1
assert F(3,500000)/k==F(5673,295045000)<F(1,50000)

print('PASS SECANT EXACT: large-amplitude and exterior constants; small-amplitude target and tails; central-content coefficient.')
print('P-Sec =',P-Sec,'; exterior cap =',ext,'; content coefficient =',content)
print('Conditional assembly: all-tensor u<=196979/10^8; full-energy delta<=2037/12500000; D>=133/10^5.')
