#!/usr/bin/env python3
"""Exact scalar checks for CONTENT.md. Agent-ID: codex-a7c4; Refs #398.

Run python3 -I this_file.py. Reads no saved numerical results, writes stdout
only. Reuses the audited rational interval/series arithmetic from ODD_COST.
"""
from fractions import Fraction as Q
from pathlib import Path
import json
import runpy

if not __debug__:
    raise RuntimeError('Assertions must be enabled; do not run with -O.')


old = Path(__file__).resolve().parent.parent / "audit-2026-11-15-codex-a7c4" / "odd_cost_check.py"
lib = runpy.run_path(str(old))
I, SP, radial = lib["Interval"], lib["SQRT_PI"], lib["radial_integrals"]
a, b, umax = Q(699, 1250), Q(179, 1250), Q(463, 10000)


def integrals(c, d):
    """I_k(c,d) = int_0^infinity exp(-s^2)/(c+d*s^2)^k ds, k=0..3."""
    vals = [SP/2, radial(c, d)[0]/2]
    for k in (1, 2):
        vals.append(((2*k-1-2*c/d)*vals[k]+2*vals[k-1]/d)/(2*k*c))
    return vals


def mul(p, q):
    r = [Q(0)]*(len(p)+len(q)-1)
    for j, x in enumerate(p):
        for k, y in enumerate(q):
            r[j+k] += x*y
    return r


def add(*polys):
    r = [Q(0)]*max(map(len, polys))
    for p in polys:
        for j, x in enumerate(p):
            r[j] += x
    return r


def scale(c, p):
    return [c*x for x in p]


A, B = [a, b], [a, 3*b]
K = mul(A, B)
Kprime = [K[1], 2*K[2]]
# Independently verify the partial fractions for the smooth M1 integral,
# after multiplication by the positive denominator 4*A^3*B^2.
coeffs = [-(a+b)/(8*a), -(a+b)/(8*a*b),
          9*(a+3*b)/(16*a*a),
          3*(a+3*b)*(2*a-3*b)/(32*a**3*b),
          -(a+3*b)*(2*a-3*b)/(32*a**3*b)]
denparts = [mul(B,B), mul(A,mul(B,B)), mul(A,mul(A,A)),
            mul(mul(A,mul(A,A)),B), mul(mul(A,A),mul(B,B))]
rhs = add(*(scale(4*c, p) for c, p in zip(coeffs, denparts)))
lhs = add(mul([Q(2),Q(-1)],K), scale(-1,mul([Q(-1),Q(1)],Kprime)))
assert add(lhs, scale(-1,rhs)) == [Q(0)]*len(rhs)

ia, ib = integrals(a,b), integrals(a,3*b)
m1 = sum((c*x for c,x in zip(coeffs, (ia[3],ia[2],ib[2],ib[1],ia[1]))), I(0))
j0, j1, _, _ = radial(a,b)
m0 = (j0-j1)/2
phi_prime = j0/2
assert 0 < m0.lo and m0.hi < Q(209,250)  # .836
assert 0 < m1.lo and m1.hi < Q(54,25)    # 2.16
assert phi_prime.hi < Q(179,125)          # 1.432

lip, hess, phib, bprime = Q(209,250), Q(336,125), Q(179,125), Q(49,50)
assert 4*lip*Q(54,25) < hess*hess
el2 = a*a+4*a*b+6*b*b
assert lib['PI'].lo > 4*bprime*bprime*(el2+umax)
assert Q(9,40)*phib*umax < Q(123,1000)**2
coefficient = lip*lip+2*hess*Q(123,1000)+Q(6,25)*(phib-bprime)
assert coefficient < Q(3,2)
assert Q(3,2)*Q(1,100) == Q(6,25)-Q(9,40)

# Meaningful rejection controls: the same uniform estimates do not certify
# e <= D0/90, or a cost below the sharp local derivative M0.
assert coefficient*Q(1,90) > Q(6,25)-Q(9,40)
assert m0.lo > Q(83,100)

print(json.dumps({
    'agent_id':'codex-a7c4', 'checks':'PASS',
    'arithmetic':'exact Fraction; outward 220-bit dyadic intervals; no saved scalar inputs',
    'bounds':{'minus_g0':m0.enclosure(), 'g_prime0':m1.enclosure(),
              'phi_prime0':phi_prime.enclosure()},
    'uniform_bounds':{'DG':str(lip), 'D2G':str(hess), 'phi_prime':str(phib),
                      'B_prime_lower':str(bprime), 'C_core_upper':'123/1000'},
    'extension_coefficient':str(coefficient),
    'certified_radius_relative_to_core_deficit':'1/100',
    'previous_radius':'3/500', 'radius_improvement_factor':'5/3',
    'negative_controls':['D0/90 fails this budget','DG < .83 rejected'],
    'scope':'Scalar certificate; CONTENT.md proves the conditional dimension-free implication.'
},indent=2,sort_keys=True))
