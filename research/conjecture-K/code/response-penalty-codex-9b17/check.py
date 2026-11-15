# research/conjecture-K/code/response-penalty-codex-9b17/check.py
"""Exact scalar checks for the response-penalty theorem; not a Gaussian proof."""
from fractions import Fraction as F
import sys
if not __debug__:
    raise SystemExit('Run without -O: acceptance uses assertions')

def atan_bounds(x, n):
    s = sum(((-1)**k * x**(2*k+1)/ (2*k+1) for k in range(n)), F(0))
    nxt = (-1)**n * x**(2*n+1)/(2*n+1)
    return min(s, s+nxt), max(s, s+nxt)
a,b=atan_bounds(F(1,5),40)
c,d=atan_bounds(F(1,239),12)
plo,phi=16*a-4*d,16*b-4*c  # Machin's identity
assert F(3141592653589793238,10**18)<plo<phi<F(3141592653589793240,10**18)
e,t,beta=F(1891,2500),F(1057,1250),F(179,1250)
eq,ea=F(1,25),F(3,100)
assert eq/2+2*ea/3 < e*e*(plo/4-t*t)
assert eq+ea < F(70564,10**6)
assert eq < F(46266,10**6)
lam=F(1)
ca=2*(lam+2)/(3*lam+4)
cn=8*(lam+1)/(7*lam+6)
assert ca == F(6,7) and cn == F(16,13)
j=lam*((eq/2+ca*ea)/e**2-(phi/4-t*t)) + e*lam/(2*(3*e+4*lam))*(t-4*beta/e)**2
assert j > F(9,1000)
# Complete-square coefficients, using independent exact probes for algebra transcription.
for lam in (F(0),F(1,10),F(1),F(7),F(100)):
    ca=2*(lam+2)/(3*lam+4)
    cn=8*(lam+1)/(7*lam+6)
    assert lam-lam**2/(4*(1+3*lam/4)) == lam*ca
    assert 4*lam/3-(2*lam/3)**2/(2*(1+7*lam/6)) == lam*cn
    assert e*(4*lam/3)/(e+4*lam/3)/8 == e*lam/(2*(3*e+4*lam))
print('PASS: old feasible energy tuple; new discarded-square penalty > 9/1000')
print('PASS: exact scalar square-completion coefficients and outward pi enclosure')
print('Gaussian Gram proof is in MONOGRAPH.md; no endpoint or Lean check is claimed.')
