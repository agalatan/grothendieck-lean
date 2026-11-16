"""Exact (rational) coefficient of the nu > 0 rank-one correction and its per-cell verifier (claude-b9ee worker, stage 0b,
15 Nov 2026).  Theorem 1 of PROOF.tex: for nu >= 0, d2, d3 > nu, R >= 0, 0 <= g <= gstar(R), every L with |L| <= R and every p,

    Phi_d(L+p, L-p) - (g/16) (4 Re(p conj L) - c0 - c1 |L|^2)^2  >=  Psi_nu(L+p, L-p),

    gstar(R) = 8 sig (e2 e3)^2 / ( Delta * ( Delta (sig^2 + 2 R |e3 - e2|)^2 + 16 R^2 (e2 e3)^2 ) ),
    e_i = d_i - nu, sig = e2 + e3, Delta = d2 d3 - nu^2,
    c1 = -4 nu (d2 - d3)/(e2 e3),   c0 = d2^2 - d3^2 + nu (d2 - d3)(e2^2 + e3^2)/(e2 e3).

gstar(R) is sharp (the largest g valid at |L| = R) and decreasing in R; at nu = 0 it is AF's 8/(S (S^2 + 4 R^2 + 4 R |d2 - d3|)).
This module is meant for the exact cap generator (stage 0b) and the integer verifier (stage 0d):
    gstar_exact(d2, d3, nu, R)            -> Fraction            (exact)
    g_round_down(d2, d3, nu, R, bits=60)  -> Fraction g <= gstar(R) with denominator 2^k and relative loss < 2^-bits
    cell_ok(d2, d3, nu, R, g)             -> bool                the verifier (cross-multiplied, no division)
    centre_exact(d2, d3, nu)              -> (c0, c1)            exact rationals
Inputs: Fractions or ints (floats are converted exactly).  Pure Python, no dependencies.
usage: python3 gstar.py          (self-test: AF at nu = 0, the stage-0 discriminant formula, rounding, the verifier)"""
from fractions import Fraction as F
import math, random

def _q(x):
    return x if isinstance(x, F) else F(x)

def _parts(d2, d3, nu):
    d2, d3, nu = _q(d2), _q(d3), _q(nu)
    e2, e3 = d2 - nu, d3 - nu
    if not (nu >= 0 and e2 > 0 and e3 > 0):
        raise ValueError("Theorem 1 needs nu >= 0 and d2, d3 > nu")
    return d2, d3, nu, e2, e3, e2 + e3, abs(e3 - e2), d2 * d3 - nu * nu, e2 * e3

def gstar_exact(d2, d3, nu, R):
    d2, d3, nu, e2, e3, s, dl, D, P = _parts(d2, d3, nu); R = _q(R)
    if R < 0: raise ValueError("R >= 0")
    return 8 * s * P * P / (D * (D * (s * s + 2 * R * dl) ** 2 + 16 * R * R * P * P))

def cell_ok(d2, d3, nu, R, g):
    """True iff nu >= 0, d2, d3 > nu, R >= 0, g >= 0 and g <= gstar(R).  Polynomial comparison, no division."""
    try:
        d2, d3, nu, e2, e3, s, dl, D, P = _parts(d2, d3, nu)
    except ValueError:
        return False
    R, g = _q(R), _q(g)
    if R < 0 or g < 0: return False
    return g * D * (D * (s * s + 2 * R * dl) ** 2 + 16 * R * R * P * P) <= 8 * s * P * P

def g_round_down(d2, d3, nu, R, bits=60):
    """a dyadic rational g with gstar(R) (1 - 2^-bits) < g <= gstar(R) (g = 0 if gstar = 0)"""
    gs = gstar_exact(d2, d3, nu, R)
    if gs == 0: return F(0)
    k = bits - (gs.numerator.bit_length() - gs.denominator.bit_length()) + 2      # 2^k gs >= 2^(bits+1)
    g = F(math.floor(gs * 2 ** k), 2 ** k) if k >= 0 else F(math.floor(gs / 2 ** (-k)) * 2 ** (-k))
    assert g <= gs and cell_ok(d2, d3, nu, R, g)
    return g

def centre_exact(d2, d3, nu):
    d2, d3, nu, e2, e3, s, dl, D, P = _parts(d2, d3, nu)
    return d2 * d2 - d3 * d3 + nu * (d2 - d3) * (e2 * e2 + e3 * e3) / P, -4 * nu * (d2 - d3) / P

def _gd_far(d2, d3, nu, l, sgn):
    """the stage-0 discriminant formula (capnu.gamma_closed, far piece of sign sgn, no regime test), exact"""
    d2, d3, nu, e2, e3, s, dl, D, P = _parts(d2, d3, nu); l = _q(l)
    c0, c1 = centre_exact(d2, d3, nu); c = c0 + c1 * l * l; cP = (d2 + d3 - 2 * nu) / (2 * D)
    k0 = (d2 + d3) / 2 + nu + (d2 + d3 + 2 * nu) * l * l / (2 * D); b1 = l * c / 2; b0 = (d3 - d2) * l / D - 2 * sgn
    return (4 * cP * k0 - b0 * b0) / (2 * b0 * b1 + cP * c * c / 4 + 4 * l * l * k0)

if __name__ == "__main__":
    rnd = random.Random(2026)
    def rq(lo, hi): return F(rnd.randint(int(lo * 10 ** 6), int(hi * 10 ** 6)), 10 ** 6)
    n = 0
    for _ in range(3000):
        nu = rnd.choice([F(0), F(47, 1953), rq(0, 0.3)]); d2 = nu + rq(0.000001, 2); d3 = nu + rq(0.000001, 2); R = rq(0, 3)
        gs = gstar_exact(d2, d3, nu, R)
        # the stage-0 discriminant formula of the binding far piece equals gstar exactly (PROOF.tex, identity (6.1)/(6.2))
        assert min(_gd_far(d2, d3, nu, R, 1), _gd_far(d2, d3, nu, R, -1)) == gs
        if nu == 0:                       # AF eq. (4)
            S = d2 + d3; assert gs == 8 / (S * (S * S + 4 * R * R + 4 * R * abs(d2 - d3)))
        assert gstar_exact(d2, d3, nu, R + F(1, 1000)) < gs                       # strictly decreasing in R
        g = g_round_down(d2, d3, nu, R); assert cell_ok(d2, d3, nu, R, g) and not cell_ok(d2, d3, nu, R, gs * (1 + F(1, 10 ** 15)))
        assert (gs - g) / gs < F(1, 2 ** 60)
        n += 1
    assert not cell_ok(F(1, 100), F(1), F(1, 50), F(1), F(0))                     # d2 <= nu: no correction allowed
    print(f"gstar.py self-test: {n} exact random cases OK (stage-0 far discriminant formula == gstar, AF at nu = 0, monotone in R, rounding + verifier)")
