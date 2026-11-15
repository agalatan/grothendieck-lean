#!/usr/bin/env python3
"""Exact direct all-sector bound on one global energy region.

Agent-ID: codex-91d4, #436. This does not certify the whole response cap.
The integral envelopes are pointwise rational-polynomial inequalities
on the entire positive half-line, integrated by exact Gamma moments.
"""
from fractions import Fraction as F
from pathlib import Path
import hashlib
import json
import sys
if sys.flags.optimize:
    raise RuntimeError('Run without -O or -OO')
sys.dont_write_bytecode = True
HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from verify_primitives import pi_bounds, sqrt_up, require


def add(a, b):
    c = [F(0)]*max(len(a), len(b))
    for i, x in enumerate(a): c[i] += x
    for i, x in enumerate(b): c[i] += x
    while len(c) > 1 and c[-1] == 0: c.pop()
    return c


def scale(a, c):
    return [x*c for x in a]


def mul(a, b):
    c = [F(0)]*(len(a)+len(b)-1)
    for i, x in enumerate(a):
        for j, y in enumerate(b): c[i+j] += x*y
    return c


def evaluate(a, t):
    answer = F(0)
    for x in reversed(a): answer = answer*t+x
    return answer


def divide_by_t_plus_c(a, c):
    remainder = a[:]
    q = [F(0)]*(len(a)-1)
    for j in range(len(a)-1, 0, -1):
        q[j-1] = remainder[j]
        remainder[j-1] -= c*q[j-1]
        remainder[j] = 0
    require(remainder[0] == 0, 'polynomial division was not exact')
    require(add(mul(q, [c, F(1)]), scale(a, -1)) == [0], 'division identity')
    return q


def laguerre_monic(n, shape):
    previous, current = [F(0)], [F(1)]
    for j in range(n):
        following = add(mul(current, [-(2*j+shape), F(1)]),
                        scale(previous, -j*(j+shape-1)))
        previous, current = current, following
    return current


def gamma_expectation(poly, shape):
    moment, answer = F(1), F(0)
    for j, coefficient in enumerate(poly):
        if j: moment *= shape+j-1
        answer += coefficient*moment
    return answer


def stieltjes_bounds(shape, c, degree=12):
    # For ANY polynomial P nonzero at -c, the two identities below
    # have nonnegative errors for t>=0. Laguerre only chooses tight P.
    P = laguerre_monic(degree, shape)
    denominator = evaluate(P, -c)**2
    require(denominator > 0, 'zero lower denominator')
    numerator = add([F(1)], scale(mul(P, P), -1/denominator))
    lower_poly = divide_by_t_plus_c(numerator, c)
    Q = laguerre_monic(degree-1, shape+1)
    denominator = c*evaluate(Q, -c)**2
    require(denominator > 0, 'zero upper denominator')
    numerator = add([F(1)], [F(0)]+scale(mul(Q, Q), 1/denominator))
    upper_poly = divide_by_t_plus_c(numerator, c)
    lower = gamma_expectation(lower_poly, shape)
    upper = gamma_expectation(upper_poly, shape)
    require(0 < lower < upper, 'invalid Stieltjes enclosure')
    return lower, upper


def main():
    a, b, p, s, rho = F(699,1250), F(179,1250), F(2500,1891), F(3,5), F(5053,10000)
    pi_lo, pi_hi = pi_bounds()
    rt_hi = sqrt_up(pi_hi)
    rt_lo = 1/sqrt_up(1/pi_lo)
    require(rt_lo**2 <= pi_lo and rt_hi**2 >= pi_hi, 'sqrt pi enclosure')
    integrals = []
    gamma_factor = F(1)
    for k in range(4):
        if k: gamma_factor *= F(2*k-1,2)
        lo, hi = stieltjes_bounds(F(2*k+1,2), a/b)
        integrals.append((rt_lo*gamma_factor*lo/b, rt_hi*gamma_factor*hi/b))
    L = [x[0] for x in integrals]
    H = [x[1] for x in integrals]
    q_upper = H[0]-p
    A_upper = s*s+H[2]-F(4,5)*L[1]+F(4,25)*H[0]-p
    B_upper = s*s*rho*rho*(1+H[0])+H[2]/2-p
    C_lower = s*s*rho+s*rho*(L[1]-F(2,5)*H[0])
    C_upper = s*s*rho+s*rho*(H[1]-F(2,5)*L[0])
    C_abs = max(abs(C_lower),abs(C_upper))
    lam = F(43,250)
    require(lam>A_upper and lam>B_upper, 'matrix diagonal bound')
    determinant = (lam-A_upper)*(lam-B_upper)-C_abs*C_abs
    require(determinant > 0, 'matrix positive-definite bound')
    require(q_upper < F(771,500), 'remote coefficient')
    require(H[1]-p < -F(16,125), 'Q/P coefficient')
    nu_upper = (H[3]-4*L[2]+4*H[1])/2-p
    require(nu_upper < -F(33,100), 'nu coefficient')
    S_lower = F(13739535256614,10**13)  # Inherited certified benchmark lower bound.
    B0_upper = F(387,500)*rt_hi
    regional_budget = F(1087,500000)
    reserve = S_lower+F(1,10000)-B0_upper-regional_budget
    require(reserve > F(245,10**9), 'regional strict payoff reserve')
    print(json.dumps({
        'Agent-ID':'codex-91d4', 'issue':436,
        'status':'C: exact regional all-sector scalar/integral certificate; whole cap remains OPEN',
        'region':'(771/500)u+(43/250)V-(16/125)(W_Q+W_P)-(33/100)W_nu <=1087/500000',
        'trial':'xi0=-(3/5)(r_A+(5053/10000)r_B), c=0',
        'scope':'Every dimension and arbitrary sharing on this region; no premise (P) used',
        'integral_enclosures': [[str(lo),str(hi)] for lo,hi in integrals],
        'integral_decimal_displays_N':[[float(lo),float(hi)]for lo,hi in integrals],
        'matrix_determinant_lower':str(determinant),
        'regional_budget':str(regional_budget), 'S_lower_inherited':str(S_lower),
        'strict_reserve_above_245e_9':str(reserve),
        'source_sha256':{p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in [Path(__file__),HERE/'verify_primitives.py']}
    }, indent=2))


if __name__=='__main__': main()
