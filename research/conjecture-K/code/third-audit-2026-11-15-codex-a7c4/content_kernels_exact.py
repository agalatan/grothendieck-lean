#!/usr/bin/env python3
"""Exact checks for CONTENT_KERNELS.md. Agent-ID: codex-a7c4. Refs #400.

Run python3 -I this_file.py. Standard library; no files written.
Reuses the old outward rational arithmetic, but computes new positive
derivative formulas and partial fractions, not saved scalar values.
"""
import sys
if not __debug__:
    raise SystemExit('This certificate requires assertions; do not use -O.')
from fractions import Fraction as Q
from math import comb
from pathlib import Path
import json
import runpy

old = Path(__file__).resolve().parent.parent/'audit-2026-11-15-codex-a7c4'/'odd_cost_check.py'
lib = runpy.run_path(str(old))
I, SP, PI, radial = lib['Interval'], lib['SQRT_PI'], lib['PI'], lib['radial_integrals']
SQ2 = I(2).sqrt()


def mul(p, q):
    r = [Q(0)]*(len(p)+len(q)-1)
    for j, x in enumerate(p):
        for k, y in enumerate(q):
            r[j+k] += x*y
    return r


def power(p, k):
    r = [Q(1)]
    for _ in range(k):
        r = mul(r, p)
    return r


def expand_recurrence(terms, b):
    """Positive -d/ds recurrence, exp(-t) A^-p B^-q, s=t A²."""
    out = {}
    for (p, q), v in terms.items():
        for key, coefficient in [((p+1, q+1), v),
                                 ((p+2, q+1), v*p*b),
                                 ((p+1, q+2), v*3*q*b)]:
            if coefficient:
                assert coefficient > 0
                out[key] = out.get(key, Q(0))+coefficient
    return out


def single_pole_integrals(a, b, n=14):
    # int exp(-r²)/(a+b r²)^k dr, k=0..n.
    out = [SP/2, radial(a, b)[0]/2]
    for k in range(1, n):
        out.append(((2*k-1-2*a/b)*out[k]+2*out[k-1]/b)/(2*k*a))
    assert all(x.lo > 0 for x in out)
    return out


def mixed_integral(p, q, a, ia, ib):
    if q == 0:
        return ia[p]
    if p == 0:
        return ib[q]
    # B=3A-2a. Expand at each pole; verify after clearing denominators.
    ca = {i: Q((-1)**q)*Q(comb(q+p-i-1, p-i))*3**(p-i)/(2*a)**(q+p-i)
          for i in range(1, p+1)}
    cb = {j: Q(3**p*(-1)**(q-j))*comb(p+q-j-1, q-j)/(2*a)**(p+q-j)
          for j in range(1, q+1)}
    poly = [Q(0)]*(p+q)
    for coeffs, which in [(ca, 'A'), (cb, 'B')]:
        for k, c in coeffs.items():
            term = mul(power([Q(0), Q(1)], p-k if which == 'A' else p),
                       power([-2*a, Q(3)], q if which == 'A' else q-k))
            for j, v in enumerate(term):
                poly[j] += c*v
    assert poly == [Q(1)]+[Q(0)]*(p+q-1)
    return sum((c*ia[i] for i,c in ca.items()), I(0))+sum((c*ib[j] for j,c in cb.items()), I(0))


def weighted_integral(terms, a, ia, ib):
    # Integral exp(-r²) B * sum c A^-p B^-q dr.
    total = I(0)
    for (p,q),c in terms.items():
        part = (3*ia[p-1]-2*a*ia[p]) if q == 0 else mixed_integral(p,q-1,a,ia,ib)
        total += c*part
    return total


rows = {'peak': (Q(699,1250), Q(179,1250)),
        'flank': (Q(14,25), Q(1467,10000)),
        'upper': (Q(573,1000), Q(19,125))}
results = {}
peak = None
for name,(a,b) in rows.items():
    ia, ib = single_pole_integrals(a,b), single_pole_integrals(a,3*b)
    ta, tb = {(2,0):Q(1)}, {(3,1):Q(1)}
    ma, mb = [], [(ia[0]-a*ia[1])/(b*SQ2)]
    for j in range(5):
        angular = Q(comb(2*j+2,j+1), 4**(j+1))
        ma.append(angular*weighted_integral(ta,a,ia,ib))
        if j:
            mb.append(angular*weighted_integral(tb,a,ia,ib)/SQ2)
            tb = expand_recurrence(tb,b)
        ta = expand_recurrence(ta,b)
    assert all(v.lo > 0 for v in ma+mb)
    assert all((x-SQ2*y).lo > 0 for x,y in zip(ma,mb))
    results[name] = {'M_j_A': [v.enclosure() for v in ma],
                     'M_j_B': [v.enclosure() for v in mb]}
    if name == 'peak':
        peak = a,b,ma,ia

a,b,ma,ia = peak
# Old constants independently recovered by the new positive integral formula.
assert Q('0.835135932614129') < ma[0].lo < ma[0].hi < Q('0.835135932614130')
assert Q('2.159180864970276') < ma[1].lo < ma[1].hi < Q('2.159180864970277')

# Exact first radial moments for all permitted occupancies of ell.
# Complex Hermite norms: ||H_pq||²=p!q!, total p+q<=2 here.
gamma = {0:Q(1,2), 1:Q(3,4), 2:Q(15,8)}  # Gamma(k+3/2)/sqrt(pi)
weights = {(0,0):gamma[0], (1,0):gamma[1], (0,1):gamma[1],
           (2,0):gamma[2]/2, (1,1):gamma[2]-2*gamma[1]+gamma[0]}
assert max(weights.values()) == Q(15,16)

lip, hess, phi, cp, bp, radial_weight = map(Q, ['.83514','2.6857','1.432','.12214','.98937','1.66168'])
assert ma[0].hi < lip
assert (4*ma[0]*ma[1]).hi < hess*hess
assert ia[1].hi < phi  # phi'(0)=int exp(-r²)/(a+b r²) dr.
u = Q(463,10000)
assert Q(9,40)*phi*u < cp*cp
assert PI.lo > 4*bp*bp*(a*a+4*a*b+6*b*b+u)
assert (Q(15,16)*SP).hi < radial_weight
coefficient = lip*lip+radial_weight*hess*cp+Q(6,25)*(phi-bp)
assert coefficient == Q(8429832706429,6250000000000)
assert coefficient < Q(27,20)
assert coefficient/Q(90) < Q(3,200)
assert coefficient/Q(89) > Q(3,200)  # This set of estimates does not certify /89.

# Atom Hessian polynomial certificates from the analytic proof.
# 3[1+2x+2x²+4x³/3 - x(3-2x)²] on [0,1/4] and [1/4,1/2].
def bernstein(poly, lo, hi):
    n = len(poly)-1
    shifted = [sum(poly[j]*comb(j,k)*lo**(j-k)*(hi-lo)**k
                   for j in range(k,n+1)) for k in range(n+1)]
    return [sum(shifted[k]*Q(comb(i,k),comb(n,k)) for k in range(i+1))
            for i in range(n+1)]

controls = [bernstein([Q(3),Q(-21),Q(42),Q(-8)], Q(0), Q(1,4)),
            bernstein([Q(3),Q(-21),Q(42),Q(-8)], Q(1,4), Q(1,2))]
assert controls == [[Q(3),Q(5,4),Q(3,8),Q(1,4)],
                    [Q(1,4),Q(1,8),Q(3,4),Q(2)]]
assert all(x>0 for row in controls for x in row)

print(json.dumps({'agent_id':'codex-a7c4', 'task':400, 'status':'PASS',
                  'arithmetic':'exact Fraction and inherited outward 220-bit arithmetic; new positive formulas',
                  'derivative_bounds':results,
                  'off_character_radial_weight':'15 sqrt(pi)/16',
                  'extension_coefficient':str(coefficient),
                  'certified_remainder_energy':'D(core)/90',
                  'previous_remainder_energy':'D(core)/100',
                  'negative_control':'same estimates do not certify D(core)/89',
                  'scope':'finite scalar acceptance; all-order CM, measure identities and chaos occupancy proved in CONTENT_KERNELS.md'},
                 indent=2,sort_keys=True))
