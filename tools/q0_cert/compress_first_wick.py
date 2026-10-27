#!/usr/bin/env python3
"""Exact compression of the first coefficient's conditional Wick polynomial.

This checks algebra only; it does not enclose the Gaussian integral.
"""

if not __debug__:
    raise SystemExit("optimized Python is unsupported: checks must remain enabled")
from fractions import Fraction as Q
from math import comb, factorial, prod
from pathlib import Path
from collections import defaultdict
from time import perf_counter
import json

ROOT = Path(__file__).resolve().parents[2]
data = json.loads((ROOT / 'data/upper-preprocess/certificate.json').read_text())
terms = data['phase']
P = defaultdict(Q)
start = perf_counter()
raw = 0
for term in terms:
    a, b, c = term['powers']
    d = Q(term['coefficient'])
    for h in range(b + 1):
        for l in range((2*h + c)//2 + 1):
            n = 2*h + c - 2*l
            key = (a + h + c - l, b - h + 1 + l, n)
            coeff = (d * comb(b, h) * prod(range(1, 2*(b-h)+2, 2))
                     * comb(2*h+c, 2*l) * prod(range(1, 2*l, 2))
                     * (-1)**n / 2**key[1])
            P[key] += coeff
            raw += 1
P = {k:v for k,v in P.items() if v}
assert len(terms) == 1140 and raw == 35166 and len(P) == 2109
print('source terms', len(terms), 'raw Wick terms', raw, 'combined terms', len(P))
print('key = (power of s, power of inverse beta, power of kappa*u²/beta)')
print('max key exponents', *(max(k[i] for k in P) for i in range(3)))
print('exact symbolic aggregation seconds', round(perf_counter()-start, 3))
print('No source integral or numerical coefficient has been certified.')

# One representative complex Cauchy-polydisc, centered at (s,u)=(1,1)
# with radius 1/8, for a real integration cell of half-width 1/16.
# Rational inequalities are conservative; analytic bridge is documented separately.
S = U = Q(9, 8)
K = Q(29, 25)               # uniform |kappa(s)| bound on the disk
D = Q(7, 10)                # uniform |kappa'(s)| bound there
alpha = Q(41, 20)
rho = Q(1, 8)
# nrmHalf(j)^2 > (3/2)*binom(2j,j)/4^j > 1/4, since pi > 9/4.
assert all(Q(3, 2)*Q(comb(2*j, j), 4**j) > Q(1, 4) for j in range(12))
assert 1 + Q(data['aQ'])**2 < Q(101,100)**2
lag_abs = []
for j in range(12):
    coefficients = []
    for k in range(j + 1):
        choose_half = prod((Q(2*k+1+2*i, 2*(i+1)) for i in range(j-k)), start=Q(1))
        coefficients.append(choose_half / factorial(k))
    lag_abs.append(coefficients)
profile = list(map(Q, data['profileQ']))
k_bound = Q(101, 50)*sum((abs(x)*sum(c*S**k for k,c in enumerate(p))
                         for x,p in zip(profile, lag_abs)), Q(0))
d_bound = Q(101, 50)*sum((abs(x)*sum(k*c*S**(k-1) for k,c in enumerate(p) if k)
                         for x,p in zip(profile, lag_abs)), Q(0))
assert k_bound < K and d_bound < D
B = alpha - K*K*(2*rho + rho*rho) - 2*K*D*rho
assert B > Q(148, 100)
B = Q(148, 100)
T = K*U*U/B
major = sum((abs(c)*S**a * B**(-b) * T**n for (a,b,n), c in P.items()), Q(0))
exponent = alpha*S + alpha*S*U*U/B
assert exponent < 7
# 2/sqrt(pi)<2 and exp(7)<3^7, using pi>1, exp(1)<3.
M = 2*K*S/B * major * 3**7
assert M < 10**9
cell_area = Q(1, 8)**2
remainder = cell_area * 4 * M / 2**80
assert remainder < Q(1, 10**16)
print('representative-cell Cauchy majorant < 10^9, degree-80 tail < 1e-16')
print('Bound calculation seconds', round(perf_counter()-start, 3))
