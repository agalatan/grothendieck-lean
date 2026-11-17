#!/usr/bin/env python3
"""Endpoint and elementary audit certificates. Agent-ID: codex-a7c4. Refs #509.

Acceptance uses outward rational intervals, not diagnostic floating point.
The positive recurrence and integral reduction are documented in NOTE.md.
Run: python3 -I constants_exact.py
"""
import contextlib
from fractions import Fraction as Q
import io
import json
from math import factorial
from pathlib import Path
import runpy
import sys

sys.dont_write_bytecode = True
if not __debug__:
    raise SystemExit('Assertions are required; do not run with -O.')
ROOT = Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):
    old = runpy.run_path(str(ROOT.parent / 'third-audit-2026-11-15-codex-a7c4' / 'content_kernels_exact.py'))
I, SP, PI = old['I'], old['SP'], old['PI']
a, b, eps = Q(699, 1250), Q(179, 1250), Q(1891, 2500)
ia = old['single_pole_integrals'](a, b)
ib = old['single_pole_integrals'](a, 3*b)
terms = {(1, 1): Q(1)}
phi = [SP * (a + Q(3, 2)*b)]
poch = Q(1)
for k in range(1, 5):
    value = old['weighted_integral'](terms, a, ia, ib) * (poch / factorial(k))
    assert value.lo > 0
    phi.append(value * (-1)**(k-1))
    terms = old['expand_recurrence'](terms, b)
    poch *= Q(2*k-1, 2)
g = [x * (-1)**(j+1) for j, x in enumerate(old['peak'][2][:4])]

# Two independent k=0/1 reductions to the signed radial definition of g.
j0, j1 = old['radial'](a, b)[:2]
assert (g[0] - (j1-j0)/2).lo <= 0 <= (g[0] - (j1-j0)/2).hi
assert (phi[1] - ia[1]).lo <= 0 <= (phi[1] - ia[1]).hi

# Exact exponential moments of the normalized Wick cubic.
def exp_moment(coeffs):
    return sum(c * factorial(k) for k, c in enumerate(coeffs))
u0 = exp_moment([0,4,-4,1])
m4 = exp_moment([0,0,16,-32,24,-8,1])
m6 = exp_moment([0,0,0,64,-192,240,-160,60,-12,1])
v = exp_moment([0,0,-8,12,-6,1])
assert (u0, m4, m6, v) == (2, 176, 90816, 32)
assert Q(m4, u0*u0)-2 == 42
assert Q(m6, u0**3) == 11352
assert Q(v*v, u0*(m4-2*u0*u0)) == Q(64,21)

# Analytic CM/Jensen lemmas in NOTE.md give these global rational envelopes.
mu_safe=g[1]/(-2*g[0])
lambda_safe=phi[3]/(-2*phi[2])
lambda_necessary=phi[3]/(-3*phi[2])
assert mu_safe.lo>Q(129,100)
assert lambda_safe.hi<Q(107,50)

out = {
    'agent_id': 'codex-a7c4', 'status': 'exact outward rational intervals; author replay only',
    'Phi_derivatives_0_to_4': [x.enclosure(18) for x in phi],
    'g_derivatives_0_to_3': [x.enclosure(18) for x in g],
    'M_g_lin': g[1].enclosure(18), 'M_g_quad': (-g[2]/2).enclosure(18),
    'M_g_cap': (-g[0]).enclosure(18), 'M_Phi3': (phi[3]/6).enclosure(18),
    'globally_valid_mu': mu_safe.enclosure(18),
    'necessary_mu_upper_bound_at_infinity': (2*mu_safe).enclosure(18),
    'globally_valid_lambda': lambda_safe.enclosure(18),
    'necessary_lambda_lower_bound': lambda_necessary.enclosure(18),
    'safe_rational_choices': {'mu':'129/100','lambda':'107/50'},
    'winding_energy_ratio': (1 + PI*PI*Q(64,81)).enclosure(18),
    'wick_cubic': {'m4_over_u2':44,'m6_over_u3':11352,'leading_ratio':'64/21'},
    'sanity_family_fourth_excess': {
        'I': str(Q(factorial(2)**2)-2),
        'II': str(Q(m4,u0*u0)-2),
        'III': str(Q(factorial(4)*factorial(2),4)-2),
    },
    'peak_u_cubed': str(Q(463,10000)**3),
    'peak_Gaussian_cubic_remainder_cap': (phi[3]*Q(463,10000)**3).enclosure(18),
    'peak_Wick_cubic_remainder_cap': (phi[3]*Q(1892)*Q(463,10000)**3).enclosure(18),
    'peak_Wick_leading_content_squared': (g[1]*g[1]*128*Q(463,10000)**3).enclosure(18),
}
if __name__ == '__main__':
    print(json.dumps(out, indent=2))
