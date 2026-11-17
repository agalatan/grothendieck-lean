#!/usr/bin/env python3
"""Self-contained exact rational and outward interval verifier for #513 (#509).

Agent-ID: gemini-5331; Refs #513, #509, #177.
Run with:
    python3 -I verify_raw_content.py [--write-result]

Zero external dependencies: uses only Python 3 standard library (`fractions`,
`math`, `json`, `hashlib`, `bisect`, `pathlib`). Floating point never enters
acceptance. Assertions must be enabled (running with `-O` raises RuntimeError).

What this script certifies:
  1. Outward 220-bit dyadic rational enclosures of the endpoint Laplace moments
     M_j^A, M_j^B at the peak, flank, and upper rows, proving the universal
     O(delta^{3/2}) bounds (where the exponent 3/2 is attained; see 6.3.12):
       - Peak:  K_A(0) < 5353/625 = 8.5648, K_B(0) < 9801/5000 = 1.9602,
                K_{A - sqrt(2)B}(0) < 9/10 = 0.90;
       - Flank: K_A(0) < 427/50 = 8.54,     K_B(0) < 77/40 = 1.925;
       - Upper: K_A(0) < 1493/200 = 7.465,  K_B(0) < 167/100 = 1.67.
  2. Algebraic degree-4 Radau-Hermite polynomial upper bounds
     Q_4(y) >= (1 + y)^{-5/2} for all y >= 0 (verified via Q_4(y) > 0 and
     Q_4(y)^2 (1 + y)^5 - 1 = y (y - y_1)^2 (y - y_2)^2 R_10(y) >= 0 in exact
     Fraction arithmetic), certifying energy-smoothed constants K_A(u) at the
     peak row:
       u >= 1/100: 3577/500 = 7.154,   u >= 1/50:  6117/1000 = 6.117,
       u >= 3/100: 5323/1000 = 5.323,  u >= 7/200: 5,
       u >= 1/25:  471/100 = 4.71,     u >= 11/250: 9/2 = 4.50.
  3. Universal linear-in-delta raw A-content bound gamma_univ^A = 32/(225 pi a^4)
     < 58/125 = 0.464 at the peak row, and algebraic Bernstein proof of
     (1 - (1 - t)e^{-t})^2 < (26/25) t for all t > 0, certifying the
     low-influence raw content bound C_A(q)^2 <= (507/100) u^2 tau_max(q).
     Because every remote (2,1)-cubic satisfies delta <= 50 u^2 tau_max(q)
     (so chi <= 50 tau_max(q)), tau_max(q) <= 1/455 implies chi <= 10/91 < 1/4
     (inside Cover A1) and closes the raw A-core directly from 3.3 + 3.14 + 6.2.1
     without Stein duals.
  4. Analytical consequences with zero new duals:
       - Closing row 6.1.5 (chi <= 0.05) and all 0 <= chi <= 9/100 = 0.09 on
         0 <= u <= 463/10000 from 3.3 + 3.14 + 6.2.1 + K_A(0) < 5353/625;
       - Exact zero-slack C_A(q)^2 <= (4/125) D(q) < (6/25) D(q) on
         (0, 463/10000] x [0, 1/10000] and C_A(q)^2 <= (2/25) D(q) < (6/25) D(q)
         for all shapes chi in [0, 42] on [0, 1/4000] (from 3.19 + K_A(0)).
  5. Fresh pure-Python algebraic Radau-Hermite lower bounds L_8(y) <= sqrt(1 + y)
     for all y >= 0, certifying the Gaussian Rice benchmark B_lo(u) <= B(u) at
     all 55 energy nodes without Bessel functions or external libraries,
     self-contained verification of -V''(0) < 1673/1000 (giving
     |V''(s)| <= -V''(0) < 1673/1000 for all s >= 0 by complete monotonicity 2.7),
     and closed-form Stieltjes-Maclaurin deficit bounds on [0, 3/200].
  6. Complete exact continuum covers (gap-free rectangle partitions, exact
     half-line polynomial verification against SHA-256-pinned profile-caps.json
     and moment-boxes.json):
       - Cover A1: Lambda(q) + (25/6) C_A(q)^2 < S_lo + 10^{-4} on
                   [0, 463/10000] x [0, 1/4] (all 0 <= chi <= 0.25);
       - Cover A2: Lambda(q) + (25/6) C_A(q)^2 < S_lo + 10^{-4} on
                   [0, 1/50] x [0, 49/25] (all 0 <= chi <= 1.96 for u <= 0.02);
       - Cover B:  Signed C_A(q)^2 <= (6/25) D(q) + 10^{-6} on
                   [0, 463/10000] x [0, 841/10000] (all 0 <= chi <= 0.0841,
                   implying Lambda(q + (T-1)U) < S + 4.17e-6 without 3.3);
       - Cover C:  Exact zero-slack C_A(q)^2 <= (6/25) D(q) on
                   [1/4000, 3/250] x [1/64, 49/625] and
                   [3/250, 463/10000] x [49/10000, 49/625]
                   (leaving only the near-Gaussian gap (1/10000, 1/64) on
                   (1/4000, 3/250] and (1/10000, 49/10000) on [3/250, 463/10000]
                   below 49/625 = 0.0784);
       - Cover D:  Strict peak remote deficit positivity D(q) > 0 on
                   [1/4000, 3/250] x [1/64, 49/100] and
                   [3/250, 463/10000] x [49/10000, 49/100] (complementing 3.19).
  7. Five negative/rejection self-tests verifying that perturbed duals,
     perturbed Radau polynomials, partition gaps, and over-tight bounds fail.
"""
import argparse
from bisect import bisect_right
from fractions import Fraction as Q
import hashlib
import json
from math import comb, factorial, isqrt
from pathlib import Path
import sys
import time

if not __debug__:
    raise RuntimeError('Assertions must be enabled; do not run Python with -O.')
sys.dont_write_bytecode = True

HERE = Path(__file__).resolve().parent
ARCHIVE = HERE.parent / 'audit-2026-11-15-codex-a7c4' / 'remote_stein_original'

# Pinned SHA-256 hashes of audited upstream files in remote_stein_original/
EXPECTED_UPSTREAM_SHA256 = {
    'profile-caps.json': '01c2e2a7b4af452ce8729ec47cb0cd2c3aa7e1368c6b58336270c2a19b349514',
    'moment-boxes.json': 'cef37c2a66eacd66296add7ed2efc5a8d6afc336d2ed614102de08429d449695',
}

PRICE = Q(2500, 1891)
C6 = Q(4045313, 100000)
KAPPA = Q(6, 25)
S_LOWER_314 = Q('1.3739535256614')
REMOTE_CAP_33 = Q(1373953883, 10**9)
V2_BOUND = Q(1673, 1000)  # Certified upper bound on -V''(0) >= |V''(s)| for all s >= 0

# ============================================================================
# 1. Outward 220-bit Dyadic Rational Interval Arithmetic
# ============================================================================
BITS = 220
SCALE = 1 << BITS


class Interval:
    __slots__ = ('lo', 'hi')

    def __init__(self, lo, hi=None):
        lo_q = Q(lo)
        hi_q = Q(lo_q if hi is None else hi)
        assert lo_q <= hi_q, (lo_q, hi_q)
        self.lo = Q((lo_q * SCALE).__floor__(), SCALE)
        self.hi = Q((hi_q * SCALE).__ceil__(), SCALE)

    @staticmethod
    def lift(x):
        return x if isinstance(x, Interval) else Interval(x)

    def __add__(self, x):
        x = self.lift(x)
        return Interval(self.lo + x.lo, self.hi + x.hi)

    __radd__ = __add__

    def __neg__(self):
        return Interval(-self.hi, -self.lo)

    def __sub__(self, x):
        return self + (-self.lift(x))

    def __rsub__(self, x):
        return self.lift(x) + (-self)

    def __mul__(self, x):
        x = self.lift(x)
        ends = (self.lo * x.lo, self.lo * x.hi, self.hi * x.lo, self.hi * x.hi)
        return Interval(min(ends), max(ends))

    __rmul__ = __mul__

    def __truediv__(self, x):
        x = self.lift(x)
        assert x.lo > 0 or x.hi < 0, f'Division by interval containing 0: [{x.lo}, {x.hi}]'
        return self * Interval(Q(1) / x.hi, Q(1) / x.lo)

    def __rtruediv__(self, x):
        return self.lift(x) / self

    def sqrt(self):
        assert self.lo >= 0
        low = isqrt(self.lo.numerator * SCALE * SCALE // self.lo.denominator)
        high = isqrt(self.hi.numerator * SCALE * SCALE // self.hi.denominator) + 1
        return Interval(Q(low, SCALE), Q(high, SCALE))

    def enclosure(self, digits=15):
        unit = 10**digits
        lo = (self.lo * unit).__floor__()
        hi = (self.hi * unit).__ceil__()

        def fmt(n):
            return ('-' if n < 0 else '') + str(abs(n) // unit) + '.' + str(abs(n) % unit).zfill(digits)

        return [fmt(lo), fmt(hi)]


def atan_reciprocal(n):
    count = 160
    q = Q(1, n)
    total = sum(Q((-1)**k, 2 * k + 1) * (q**(2 * k + 1)) for k in range(count))
    return Interval(total, total + (q**(2 * count + 1)) / Q(2 * count + 1))


PI = 16 * atan_reciprocal(5) - 4 * atan_reciprocal(239)
SQRT_PI = PI.sqrt()
SQRT_2 = Interval(2).sqrt()
SQRT_6 = Interval(6).sqrt()


def exp_positive(r):
    r = Q(r)
    assert 0 <= r < 8
    count = 180
    total = sum((r**k) / Q(factorial(k)) for k in range(count))
    first = (r**count) / Q(factorial(count))
    return Interval(total, total + first / (1 - r / Q(count + 1)))


E_CONST = exp_positive(1)


def j0_integral(a, b):
    """Enclose J_0 = int_0^inf t^{-1/2} e^{-t} / (a + b t) dt."""
    a, b = Q(a), Q(b)
    assert a > 0 and b > 0
    r = a / b
    count = 180
    assert r < count
    total = sum(((-r)**k) / Q(factorial(k) * (2 * k + 1)) for k in range(count))
    next_term = (r**count) / Q(factorial(count) * (2 * count + 1))
    erf_series = Interval(total, total + next_term)
    return exp_positive(r) * (PI / (b * Interval(r).sqrt()) - 2 * SQRT_PI * erf_series / b)


def single_pole_integrals(a, b, n=26):
    """Enclose I_k = int_0^inf exp(-x^2) / (a + b x^2)^k dx for k = 0..n."""
    a, b = Q(a), Q(b)
    out = [SQRT_PI / 2, j0_integral(a, b) / 2]
    for k in range(1, n):
        out.append(((2 * k - 1 - 2 * a / b) * out[k] + 2 * out[k - 1] / b) / (2 * k * a))
    assert all(x.lo > 0 for x in out)
    return out


# ============================================================================
# 2. Exact Rational Polynomial & Bernstein Utilities (Ascending Powers)
# ============================================================================
def poly_add(*ps):
    z = [Q(0)] * max(map(len, ps))
    for p in ps:
        for i, c in enumerate(p):
            z[i] += c
    return z


def poly_mul(p, q):
    z = [Q(0)] * (len(p) + len(q) - 1)
    for i, a in enumerate(p):
        for j, b in enumerate(q):
            z[i + j] += a * b
    return z


def poly_pow(p, k):
    r = [Q(1)]
    for _ in range(k):
        r = poly_mul(r, p)
    return r


def poly_div_exact(num, den):
    """Exact polynomial division in Q[y] (ascending powers); asserts zero remainder."""
    rem = list(map(Q, num))
    d = list(map(Q, den))
    while len(d) > 1 and d[-1] == 0:
        d.pop()
    assert d and d[-1] != 0
    deg_d = len(d) - 1
    if len(rem) < len(d):
        assert all(x == 0 for x in rem)
        return [Q(0)]
    quot = [Q(0)] * (len(rem) - deg_d)
    for k in range(len(rem) - 1, deg_d - 1, -1):
        c = rem[k] / d[-1]
        quot[k - deg_d] = c
        if c != 0:
            for j in range(deg_d + 1):
                rem[k - deg_d + j] -= c * d[j]
    assert all(x == 0 for x in rem), f'Nonzero polynomial division remainder: {rem}'
    return quot


def poly_scale(p, c):
    c = Q(c)
    return [x * c for x in p]


def poly_shift(p, k):
    return [Q(0)] * k + list(p)


def poly_eval(p, x):
    x = Q(x)
    y = Q(0)
    for c in reversed(p):
        y = y * x + c
    return y


def poly_affine(p, a, d):
    a, d = Q(a), Q(d)
    return [sum(p[j] * comb(j, i) * (a**(j - i)) * (d**i) for j in range(i, len(p))) for i in range(len(p))]


def bernstein_1d(p, a, b):
    p_aff = poly_affine(p, a, b - a)
    n = len(p_aff) - 1
    return [sum(p_aff[j] * Q(comb(k, j), comb(n, j)) for j in range(k + 1)) for k in range(n + 1)]


def positive_on(p, a, b, depth=20):
    cs = bernstein_1d(p, a, b)
    if min(cs) >= 0:
        return True
    if cs[0] < 0 or cs[-1] < 0 or depth == 0:
        return False
    mid = (a + b) / 2
    return positive_on(p, a, mid, depth - 1) and positive_on(p, mid, b, depth - 1)


def tail_positive(p, a):
    return min(poly_affine(p, a, Q(1))) >= 0


def bernstein_2d(grid, box):
    """Exact bivariate Bernstein coefficients of sum_{i,j} grid[i][j] u^i x^j on [a,b]x[c,d]."""
    a, b, c, d = map(Q, box)
    du, dx = b - a, d - c
    deg_u = len(grid) - 1
    deg_x = len(grid[0]) - 1
    trans = [
        [
            sum(
                grid[i][j] * comb(i, k) * comb(j, l) * (a**(i - k)) * (c**(j - l)) * (du**k) * (dx**l)
                for i in range(k, deg_u + 1)
                for j in range(l, deg_x + 1)
            )
            for l in range(deg_x + 1)
        ]
        for k in range(deg_u + 1)
    ]
    return [
        sum(
            trans[k][l] * Q(comb(i, k), comb(deg_u, k)) * Q(comb(j, l), comb(deg_x, l))
            for k in range(i + 1)
            for l in range(j + 1)
        )
        for i in range(deg_u + 1)
        for j in range(deg_x + 1)
    ]


# ============================================================================
# 3. Laplace Recurrence Integrals for A, B, and Deficit Kernels
# ============================================================================
def expand_recurrence(terms, b):
    b = Q(b)
    out = {}
    for (p, q), v in terms.items():
        for key, coeff in [((p + 1, q + 1), v), ((p + 2, q + 1), v * p * b), ((p + 1, q + 2), v * 3 * q * b)]:
            if coeff:
                assert coeff > 0
                out[key] = out.get(key, Q(0)) + coeff
    return out


def mixed_integral(p, q, a, ia, ib):
    if q == 0:
        return ia[p]
    if p == 0:
        return ib[q]
    a = Q(a)
    ca = {i: Q((-1)**q) * Q(comb(q + p - i - 1, p - i)) * (3**(p - i)) / ((2 * a)**(q + p - i)) for i in range(1, p + 1)}
    cb = {j: Q((3**p) * ((-1)**(q - j))) * Q(comb(p + q - j - 1, q - j)) / ((2 * a)**(p + q - j)) for j in range(1, q + 1)}
    # Exact algebraic partial-fraction identity verification
    ident = [Q(0)] * (p + q)
    for coeffs, which in ((ca, 'A'), (cb, 'B')):
        for k, c in coeffs.items():
            term = poly_mul(
                poly_pow([Q(0), Q(1)], p - k if which == 'A' else p),
                poly_pow([-2 * a, Q(3)], q if which == 'A' else q - k),
            )
            for idx, val in enumerate(term):
                ident[idx] += c * val
    assert ident == [Q(1)] + [Q(0)] * (p + q - 1)
    return sum((c * ia[i] for i, c in ca.items()), Interval(0)) + sum((c * ib[j] for j, c in cb.items()), Interval(0))


def weighted_integral(terms, a, ia, ib):
    total = Interval(0)
    for (p, q), c in terms.items():
        part = (3 * ia[p - 1] - 2 * Q(a) * ia[p]) if q == 0 else mixed_integral(p, q - 1, a, ia, ib)
        total = total + c * part
    return total


# ============================================================================
# 4. Theorem 1 & 2 Verification: O(delta^{3/2}), K_A(u), O(delta), Low-Influence
# ============================================================================
def certify_radau_q4(r1, r2):
    """Construct and algebraically certify degree-4 Radau-Hermite polynomial
    Q_4(y) >= (1 + y)^{-5/2} for all y >= 0, interpolating (1 + y)^{-5/2} at y = 0
    and to first order at y_1 = r1^2 - 1, y_2 = r2^2 - 1 (1 < r1 < r2 in Q)."""
    r1, r2 = Q(r1), Q(r2)
    assert 1 < r1 < r2
    y1, y2 = r1 * r1 - 1, r2 * r2 - 1
    z = [Q(0), y1, y1, y2, y2]
    inv1, inv2 = Q(1) / r1, Q(1) / r2
    fvals = [Q(1), inv1**5, inv1**5, inv2**5, inv2**5]
    dvals = {y1: Q(-5, 2) * (inv1**7), y2: Q(-5, 2) * (inv2**7)}
    n = 5
    tab = [[Q(0)] * n for _ in range(n)]
    for i in range(n):
        tab[i][0] = fvals[i]
    for j in range(1, n):
        for i in range(n - j):
            if z[i + j] == z[i]:
                tab[i][j] = dvals[z[i]]
            else:
                tab[i][j] = (tab[i + 1][j - 1] - tab[i][j - 1]) / (z[i + j] - z[i])
    q4 = [Q(0)] * n
    basis = [Q(1)]
    for j in range(n):
        for k, bc in enumerate(basis):
            q4[k] += tab[0][j] * bc
        if j < n - 1:
            nb = [Q(0)] * (len(basis) + 1)
            for k, bc in enumerate(basis):
                nb[k] -= z[j] * bc
                nb[k + 1] += bc
            basis = nb
    # 1) Verify Q_4(y) > 0 for all y >= 0:
    assert positive_on(q4, Q(0), y2 + 2, depth=16) and tail_positive(q4, y2 + 2)
    # 2) Verify Q_4(y)^2 * (1 + y)^5 - 1 = y * (y - y_1)^2 * (y - y_2)^2 * R_10(y) >= 0 on [0, inf):
    diff = poly_add(poly_mul(poly_mul(q4, q4), poly_pow([Q(1), Q(1)], 5)), [Q(-1)])
    fac = poly_mul([Q(0), Q(1)], poly_mul(poly_pow([-y1, Q(1)], 2), poly_pow([-y2, Q(1)], 2)))
    quot = poly_div_exact(diff, fac)
    assert positive_on(quot, Q(0), y2 + 4, depth=16) and tail_positive(quot, y2 + 4)
    return q4


def certify_section_ab():
    rows = {
        'peak': (Q(699, 1250), Q(179, 1250), Q(5353, 625), Q(9801, 5000), Q(9, 10), Q(58, 125)),
        'flank': (Q(14, 25), Q(1467, 10000), Q(427, 50), Q(77, 40), Q(93, 100), Q(116, 250)),
        'upper': (Q(573, 1000), Q(19, 125), Q(1493, 200), Q(167, 100), Q(83, 100), Q(21, 50)),
    }
    row_results = {}
    peak_moments = None

    for name, (a, b, ka_cap, kb_cap, kdiff_cap, gamma_cap) in rows.items():
        ia = single_pole_integrals(a, b, n=26)
        ib = single_pole_integrals(a, 3 * b, n=26)
        ta = {(2, 0): Q(1)}
        tb = {(3, 1): Q(1)}
        ma = []
        mb = [(ia[0] - a * ia[1]) / (b * SQRT_2)]
        for j in range(6):
            ang = Q(comb(2 * j + 2, j + 1), 4**(j + 1))
            ma.append(ang * weighted_integral(ta, a, ia, ib))
            if 1 <= j <= 4:
                mb.append(ang * weighted_integral(tb, a, ia, ib) / SQRT_2)
                tb = expand_recurrence(tb, b)
            ta = expand_recurrence(ta, b)
        assert all(v.lo > 0 for v in ma + mb)

        ka0 = (Q(3, 4) * SQRT_6) * ma[1] * ma[1]
        kb0 = (Q(3, 4) * SQRT_6) * mb[1] * mb[1]
        diff_m1 = ma[1] - SQRT_2 * mb[1]
        assert diff_m1.lo > 0
        kdiff0 = (Q(3, 4) * SQRT_6) * diff_m1 * diff_m1
        gamma_univ = Q(32, 225) / (PI * (a**4))

        assert ka0.hi < ka_cap, (name, ka0.enclosure(), ka_cap)
        assert kb0.hi < kb_cap, (name, kb0.enclosure(), kb_cap)
        assert kdiff0.hi < kdiff_cap, (name, kdiff0.enclosure(), kdiff_cap)
        assert gamma_univ.hi < gamma_cap, (name, gamma_univ.enclosure(), gamma_cap)

        row_results[name] = {
            'M0_A': ma[0].enclosure(),
            'M1_A': ma[1].enclosure(),
            'M0_B': mb[0].enclosure(),
            'M1_B': mb[1].enclosure(),
            'K_A0': ka0.enclosure(),
            'K_A0_certified_upper': str(ka_cap),
            'K_B0': kb0.enclosure(),
            'K_B0_certified_upper': str(kb_cap),
            'K_A_minus_sqrt2_B0': kdiff0.enclosure(),
            'gamma_univ_A': gamma_univ.enclosure(),
            'gamma_univ_A_certified_upper': str(gamma_cap),
        }
        if name == 'peak':
            peak_moments = (a, b, ia, ib, ma)

    # Peak OU-smoothed K_A(u) bounds via algebraically certified Q_4(y) >= (1 + y)^{-5/2}
    a_pk, b_pk, ia_pk, ib_pk, ma_pk = peak_moments
    # L_j = int_0^inf lam^{j + 1/2} mu_A(d lam) = (2 * 4^{j+2} / (sqrt(pi) * comb(2j+4, j+2))) * M_{j+1}^A
    L_mom = []
    for j in range(5):
        c_ang = Q(comb(2 * j + 4, j + 2), 4**(j + 2))
        L_mom.append(ma_pk[j + 1] / ((SQRT_PI / 2) * c_ang))
    Z_mom = [Q(3, 4)]  # int_0^1 z^{1/3} (1 - z^2)^k dz
    for k in range(1, 5):
        Z_mom.append(Z_mom[-1] * Q(3 * k, 3 * k + 2))

    ka_slabs_spec = [
        (Q(0), None, Q(5353, 625)),
        (Q(1, 100), (Q(41, 40), Q(9, 8)), Q(3577, 500)),
        (Q(1, 50), (Q(21, 20), Q(5, 4)), Q(6117, 1000)),
        (Q(3, 100), (Q(15, 14), Q(4, 3)), Q(5323, 1000)),
        (Q(7, 200), (Q(13, 12), Q(7, 5)), Q(5)),
        (Q(1, 25), (Q(11, 10), Q(3, 2)), Q(471, 100)),
        (Q(11, 250), (Q(11, 10), Q(3, 2)), Q(9, 2)),
    ]
    ka_smoothed = []
    for u_edge, r_pair, cap_target in ka_slabs_spec:
        if u_edge == 0:
            ka_val = (Q(3, 4) * SQRT_6) * ma_pk[1] * ma_pk[1]
        else:
            q4 = certify_radau_q4(*r_pair)
            psi2_0 = (2 / SQRT_PI) * sum(q4[k] * Z_mom[k] * L_mom[k] * (u_edge**k) for k in range(5))
            assert psi2_0.lo > 0
            # (pi^2 / 8) * (3/8)^{3/2} = (3 sqrt(6) / 256) * pi^2
            ka_val = (Q(3, 256) * SQRT_6) * PI * PI * psi2_0 * psi2_0
        assert ka_val.hi < cap_target, (u_edge, ka_val.enclosure(), cap_target)
        ka_smoothed.append({
            'u_min': str(u_edge),
            'K_A_enclosure': ka_val.enclosure(),
            'certified_upper': str(cap_target),
        })

    # Algebraic proof of (1 - (1 - t)e^{-t})^2 < (26/25) t for all t > 0 (Theorem 2b)
    # 1) On t >= 3/2: max_{t>=1} (t-1)e^{-t} = e^{-2} < 1/7 (since e > 8/3 => e^2 > 64/9 > 7),
    #    so (1 + (t-1)e^{-t})^2 < (8/7)^2 = 64/49 < 39/25 = (26/25)*(3/2) <= (26/25)*t.
    assert E_CONST.lo > Q(8, 3) and (E_CONST * E_CONST).lo > 7
    assert Q(64, 49) < Q(26, 25) * Q(3, 2)
    # 2) On t in (0, 3/2]: e^{2t} >= sum_{k=0}^9 (2t)^k / k!, and
    #    0 < e^t - 1 + t <= 2t + sum_{k=2}^9 t^k/k! + t^{10}/(10! * (1 - (3/2)/11)).
    exp2_lo = [Q(2**k, factorial(k)) for k in range(10)]
    p_up = [Q(0), Q(2)] + [Q(1, factorial(k)) for k in range(2, 10)] + [Q(1, factorial(10)) / (1 - Q(3, 22))]
    # Check (26/25) t * exp2_lo(t) - p_up(t)^2 > 0 for t in (0, 3/2] after dividing out one factor of t:
    diff_alpha = poly_add(poly_scale(poly_shift(exp2_lo, 1), Q(26, 25)), poly_scale(poly_mul(p_up, p_up), -1))
    assert diff_alpha[0] == 0
    quot_alpha = diff_alpha[1:]
    assert positive_on(quot_alpha, Q(0), Q(3, 2), depth=16) and poly_eval(quot_alpha, Q(0)) > 0

    # Certify low-influence constant C_inf(peak) = (4 / (9 pi a^4)) * (sqrt(52/25) + 1/sqrt(2 e))^2 < 507/100
    term_inf = Interval(Q(52, 25)).sqrt() + Q(1) / (2 * E_CONST).sqrt()
    c_inf_pk = (Q(4, 9) / (PI * (a_pk**4))) * term_inf * term_inf
    assert c_inf_pk.hi < Q(507, 100), c_inf_pk.enclosure()
    # Check tau_max <= 1/455 (which forces chi <= 50 * tau_max <= 10/91 < 1/4) closes directly via 3.3 + 3.14 + 6.2.1:
    s_slack_33 = S_LOWER_314 + Q(1, 10000) - REMOTE_CAP_33
    assert (Q(25, 6) * Q(507, 100) * (Q(463, 10000)**2) * Q(1, 455)) < s_slack_33
    assert Q(50) * Q(1, 455) == Q(10, 91) and Q(10, 91) < Q(1, 4)

    return row_results, ka_smoothed, c_inf_pk, peak_moments


# ============================================================================
# 5. Pure-Python Rice Benchmark B_lo(u) and Stieltjes-Maclaurin Deficit
# ============================================================================
def build_radau_sqrt_l8():
    """Construct and algebraically certify degree-8 Radau-Hermite lower bound
    L_8(y) <= sqrt(1 + y) for all y >= 0 using four rational squares."""
    ratios = [Q(33, 32), Q(9, 8), Q(11, 8), Q(7, 4)]
    nodes = [r * r - 1 for r in ratios]
    z = [Q(0)]
    rts = [Q(1)]
    for r, y in zip(ratios, nodes):
        z.extend([y, y])
        rts.extend([r, r])
    n = len(z)
    tab = [[Q(0)] * n for _ in range(n)]
    for i in range(n):
        tab[i][0] = rts[i]
    for j in range(1, n):
        for i in range(n - j):
            if z[i + j] == z[i]:
                tab[i][j] = Q(1) / (2 * rts[i])
            else:
                tab[i][j] = (tab[i + 1][j - 1] - tab[i][j - 1]) / (z[i + j] - z[i])
    poly = [Q(0)] * n
    basis = [Q(1)]
    for j in range(n):
        for k, bc in enumerate(basis):
            poly[k] += tab[0][j] * bc
        if j < n - 1:
            nb = [Q(0)] * (len(basis) + 1)
            for k, bc in enumerate(basis):
                nb[k] -= z[j] * bc
                nb[k + 1] += bc
            basis = nb
    # Algebraic proof that L_8(y) <= sqrt(1 + y) for all y >= 0:
    # 1) Exact factorization (1 + y) - L_8(y)^2 = y * prod_{j=1}^4 (y - y_j)^2 * quot_l8(y),
    #    with quot_l8(y) > 0 on [0, 4], proving L_8(y) <= |L_8(y)| <= sqrt(1 + y) on [0, 4].
    diff_sq = poly_add([Q(1), Q(1)], poly_scale(poly_mul(poly, poly), -1))
    fac_l8 = [Q(0), Q(1)]
    for y in nodes:
        fac_l8 = poly_mul(fac_l8, poly_pow([-y, Q(1)], 2))
    quot_l8 = poly_div_exact(diff_sq, fac_l8)
    assert positive_on(quot_l8, Q(0), Q(4), depth=16)
    # 2) On [4, inf): -L_8(y) >= 0 (so L_8(y) <= 0 < sqrt(1 + y)).
    assert tail_positive(poly_scale(poly, -1), Q(4))
    return poly


def compute_deficit_moments_and_rice_poly(a_pk, b_pk, ia_pk, ib_pk):
    """Compute outward enclosures of V^{(0)}(0)..V^{(8)}(0), positive measures M_D[k],
    and certified lower-bound polynomial coeffs for B(u) >= sum_k b_lo[k] u^k."""
    td = {(1, 1): Q(1)}
    v_derivs = [Q(387, 500) * SQRT_PI]
    for m in range(8):
        w_int = weighted_integral(td, a_pk, ia_pk, ib_pk)
        ang = Q(comb(2 * m, m), 4**m)
        vk = Q((-1)**m, m + 1) * ang * w_int
        v_derivs.append(vk)
        td = expand_recurrence(td, b_pk)

    binom_half = [Q(1)]
    for k in range(1, 9):
        binom_half.append(binom_half[-1] * (Q(1, 2) - (k - 1)) / k)
    md = [v_derivs[k] / binom_half[k] for k in range(9)]
    assert all(x.lo > 0 for x in md)

    l8 = build_radau_sqrt_l8()
    # For u >= 0, taking the lower endpoint of each (l8[k] * md[k]) interval preserves a global lower bound.
    b_rice_lo = [(l8[k] * md[k]).lo for k in range(9)]
    return v_derivs, b_rice_lo


# ============================================================================
# 6. Analytical Consequences & Continuum Spectral/Moment Covers
# ============================================================================
def ka_piecewise(u_lo):
    out = Q(5353, 625)
    for edge, val in (
        (Q(1, 100), Q(3577, 500)),
        (Q(1, 50), Q(6117, 1000)),
        (Q(3, 100), Q(5323, 1000)),
        (Q(7, 200), Q(5)),
        (Q(1, 25), Q(471, 100)),
        (Q(11, 250), Q(9, 2)),
    ):
        if u_lo >= edge:
            out = val
    return out


def cut_numerator(A, B, e, beta, t, lam, mu, nu):
    f = [-(A + beta) / 2, -B / 2 + 2 * t + lam / 3]
    ug = [e / 2, Q(0), -B / 4 + t + mu / 3 - nu / 2]
    aa = [e - A, A - B, B / 2]
    return poly_add(
        poly_scale(poly_shift(poly_mul(f, f), 2), Q(1) / lam),
        poly_scale(poly_mul(ug, ug), Q(1) / mu),
        poly_shift(aa, 2),
        [Q(0), Q(0), -2 * (nu / 3 - 2 * t), Q(0), nu / 3 - 2 * t],
    )


def test_pieces(knots, values):
    integral = Q(0)
    out = []
    for a, b, fa, fb in zip(knots, knots[1:], values, values[1:]):
        B = (fb - fa) / (b - a)
        A = fa - B * a
        e = integral - A * a - B * a * a / 2
        out.append((a, b, A, B, e))
        integral += (b - a) * (fa + fb) / 2
    a = knots[-1]
    A = values[-1]
    out.append((a, None, A, Q(0), integral - A * a))
    return out


def check_stein_node(row, knots, caps, depth=20):
    v = Q(row['v'])
    values = list(map(Q, row['phi']))
    beta, t, lam, mu, nu = (Q(row[k]) for k in ('beta', 't', 'lam', 'mu', 'nu'))
    if not (lam > 0 and mu > 0 and nu >= 0 and knots[0] == 0 and len(knots) == len(values)):
        return False
    P = list(map(Q, row['coefficients']))
    if not (len(P) == 4 and P[3] >= 0):
        return False
    pieces = test_pieces(knots, values)
    starts = [c[0] / v for c in caps]
    tail = Q(128)
    while tail <= max(knots[-1], starts[-1]):
        tail *= 2
    pts = sorted(set(knots + starts + [tail]))
    for a, b in zip(pts, pts[1:]):
        j = bisect_right(knots, a) - 1
        k = bisect_right(starts, a) - 1
        _, _, A, B, e = pieces[j]
        cap = [c * (v**i) for i, c in enumerate(caps[k][2])]
        R = poly_add(
            poly_shift(poly_add(P, poly_scale(cap, -1)), 2),
            poly_scale(cut_numerator(A, B, e, beta, t, lam, mu, nu), -1),
        )
        if a == 0:
            if not (R[0] == 0 and R[1] == 0):
                return False
            R = R[2:]
        if not positive_on(R, a, b, depth):
            return False
    _, _, A, B, e = pieces[-1]
    cap = [c * (v**i) for i, c in enumerate(caps[-1][2])]
    R = poly_add(
        poly_shift(poly_add(P, poly_scale(cap, -1)), 2),
        poly_scale(cut_numerator(A, B, e, beta, t, lam, mu, nu), -1),
    )
    return tail_positive(R, tail)


def verify_partition(boxes, u_lo, u_hi, x_lo, x_hi):
    """Exact rational check that `boxes` = [(a,b,c,d), ...] is a pairwise interior-disjoint
    cover of [u_lo, u_hi] x [x_lo, x_hi]."""
    u_lo, u_hi, x_lo, x_hi = map(Q, (u_lo, u_hi, x_lo, x_hi))
    if not boxes:
        return False
    area = Q(0)
    for i, (a, b, c, d) in enumerate(boxes):
        if not (u_lo <= a < b <= u_hi and x_lo <= c < d <= x_hi):
            return False
        area += (b - a) * (d - c)
        for A, B, C0, D0 in boxes[:i]:
            if not (max(a, A) >= min(b, B) or max(c, C0) >= min(d, D0)):
                return False
    if area != (u_hi - u_lo) * (x_hi - x_lo):
        return False
    u_cuts = sorted({z for r in boxes for z in r[:2]})
    if u_cuts[0] != u_lo or u_cuts[-1] != u_hi:
        return False
    for a, b in zip(u_cuts, u_cuts[1:]):
        ivs = sorted((c, d) for l, h, c, d in boxes if l <= a and b <= h)
        if not ivs or ivs[0][0] != x_lo or ivs[-1][1] != x_hi:
            return False
        if not all(p[1] == q[0] for p, q in zip(ivs, ivs[1:])):
            return False
    return True


def certify_analytical_and_covers(v_derivs, b_rice_lo):
    # --- Self-contained check that -V''(0) < 1673/1000 (giving |V''(s)| < 1673/1000 for all s >= 0 by 2.7) ---
    assert (-v_derivs[2]).hi < V2_BOUND, (-v_derivs[2]).enclosure()

    # --- Analytical Zero-Dual Consequences ---
    # 1) Closing open row 6.1.5 (chi <= 0.05) and all 0 <= chi <= 9/100 on [0, 463/10000]
    u_top = Q(463, 10000)
    x_09 = Q(3, 10)  # chi = 9/100 = 0.09 > 0.05
    lhs_09 = REMOTE_CAP_33 + (Q(5353, 625) / KAPPA) * (u_top**3) * (x_09**3)
    target_a = S_LOWER_314 + Q(1, 10000)
    assert lhs_09 < target_a
    # Check delta <= 1981/10^7 and u <= 217/100000 (across all chi <= 42):
    delta_cut = Q(1981, 10**7)
    assert (delta_cut**3) * (Q(5353, 625)**2) < ((target_a - REMOTE_CAP_33) * KAPPA)**2
    assert Q(42) * (Q(217, 100000)**2) < delta_cut

    # 2) Near-Gaussian (chi <= 10^{-4}) and small-energy (u <= 1/4000, all chi <= 42) exact C_A^2 <= (6/25) D(q) via 3.19:
    #    On chi <= 10^{-4} (sqrt(chi) <= 1/100), 3.19 gives D(q) >= delta / 8, so C_A^2 <= (4/125) D(q):
    assert Q(5353, 625) * u_top * Q(1, 100) < Q(4, 125) * Q(1, 8)
    assert Q(4, 125) < KAPPA
    #    On u <= 1/4000 and all chi <= 42 (sqrt(chi) < 13/2), 3.19 gives D(q) >= (9/50) delta, so C_A^2 <= (2/25) D(q):
    assert Q(13, 2)**2 > 42
    assert Q(5353, 625) * Q(1, 4000) * Q(13, 2) < Q(2, 25) * Q(9, 50)
    assert Q(2, 25) < KAPPA

    # 3) Fresh pure-Python Rice benchmark sanity check at v0 = 403448 / 10^7:
    v0 = Q(403448, 10**7)
    s_lo_pure = poly_eval(b_rice_lo, v0) - PRICE * v0
    assert s_lo_pure > Q('1.37395350')

    # 4) Closed-form Stieltjes-Maclaurin bivariate deficit polynomial on [0, 3/200]:
    #    D(q) >= (-V2/2 - (3/2) V3 u) u^2 x^2 - (C6/6) V3 u^3 x^3 + V4 u^4 + V5 u^5 + V6 u^6
    c2_lo = (-v_derivs[2] / 2).lo        # > 0.836
    c3_hi = v_derivs[3].hi               # > 0, subtracted
    v4_lo = v_derivs[4].lo               # < 0
    v5_lo = v_derivs[5].lo               # > 0
    v6_lo = v_derivs[6].lo               # < 0

    def maclaurin_margin_grid(eta_q, ka_q, scale_d=KAPPA):
        g = [[Q(0)] * 4 for _ in range(7)]
        g[0][0] = Q(eta_q)
        g[2][2] = scale_d * c2_lo
        g[3][2] = -scale_d * Q(3, 2) * c3_hi
        g[3][3] = -scale_d * (C6 / 6) * c3_hi - Q(ka_q)
        g[4][0] = scale_d * v4_lo
        g[5][0] = scale_d * v5_lo
        g[6][0] = scale_d * v6_lo
        return g

    # Certify [0, 3/200] x [0, 1/2] (0 <= chi <= 0.25) for signed C_A^2 <= (6/25) D(q) + 10^{-6} with Maclaurin alone:
    mac_signed_boxes = []
    q_mac = [(Q(0), Q(3, 200), Q(0), Q(1, 2), 0)]
    while q_mac:
        a, b, c, d, dep = q_mac.pop()
        grid = maclaurin_margin_grid(Q(1, 10**6), ka_piecewise(a))
        if min(bernstein_2d(grid, (a, b, c, d))) >= 0:
            mac_signed_boxes.append((a, b, c, d))
            continue
        assert dep < 14, ('Maclaurin signed subdivision exhausted', a, b, c, d)
        if (b - a) / Q(3, 200) >= (d - c) / Q(1, 2):
            m = (a + b) / 2
            q_mac.extend([(a, m, c, d, dep + 1), (m, b, c, d, dep + 1)])
        else:
            m = (c + d) / 2
            q_mac.extend([(a, b, c, m, dep + 1), (a, b, m, d, dep + 1)])
    assert verify_partition(mac_signed_boxes, Q(0), Q(3, 200), Q(0), Q(1, 2))

    # Certify [1/4000, 3/250] x [1/8, 1/2] (1/64 <= chi <= 1/4 on u in [0.00025, 0.012]) for exact zero-slack C_A^2 <= (6/25) D(q):
    x_c_mac_lo = Q(1, 8)
    mac_exact_boxes = []
    q_mac0 = [(Q(1, 4000), Q(3, 250), x_c_mac_lo, Q(1, 2), 0)]
    while q_mac0:
        a, b, c, d, dep = q_mac0.pop()
        grid = maclaurin_margin_grid(Q(0), ka_piecewise(a))
        if min(bernstein_2d(grid, (a, b, c, d))) >= 0:
            mac_exact_boxes.append((a, b, c, d))
            continue
        assert dep < 16, ('Maclaurin exact subdivision exhausted', a, b, c, d)
        if (b - a) / Q(3, 250) >= (d - c) / Q(3, 8):
            m = (a + b) / 2
            q_mac0.extend([(a, m, c, d, dep + 1), (m, b, c, d, dep + 1)])
        else:
            m = (c + d) / 2
            q_mac0.extend([(a, b, c, m, dep + 1), (a, b, m, d, dep + 1)])
    assert verify_partition(mac_exact_boxes, Q(1, 4000), Q(3, 250), x_c_mac_lo, Q(1, 2))

    # Certify strict D(q) > 0 on [1/4000, 3/250] x [1/8, 7/10] (1/64 <= chi <= 49/100 on u in [0.00025, 0.012]):
    x_d_hi = Q(7, 10)
    d_pos_mac_grid = maclaurin_margin_grid(Q(0), Q(0), scale_d=Q(1))
    d_pos_mac_coeffs = bernstein_2d(d_pos_mac_grid, (Q(1, 4000), Q(3, 250), x_c_mac_lo, x_d_hi))
    assert min(d_pos_mac_coeffs) > 0
    d_pos_mac_boxes = [(Q(1, 4000), Q(3, 250), x_c_mac_lo, x_d_hi)]
    assert verify_partition(d_pos_mac_boxes, Q(1, 4000), Q(3, 250), x_c_mac_lo, x_d_hi)

    # --- Load & Verify Upstream Caps and Stein Dual Bank ---
    for fname, sha in EXPECTED_UPSTREAM_SHA256.items():
        actual = hashlib.sha256((ARCHIVE / fname).read_bytes()).hexdigest()
        assert actual == sha, f'SHA-256 mismatch on {fname}: {actual} != {sha}'

    caps_json = json.loads((ARCHIVE / 'profile-caps.json').read_text())
    caps = [(Q(d['interval'][0]), Q(d['interval'][1]), list(map(Q, d['coefficients']))) for d in caps_json['cells']]
    caps.append((caps[-1][1], None, list(map(Q, caps_json['tail']))))
    assert caps[0][0] == 0 and all(l[1] == r[0] for l, r in zip(caps[:-1], caps[1:]))

    moment_rows = json.loads((ARCHIVE / 'moment-boxes.json').read_text())
    moment_polys = [tuple(map(Q, r['coefficients'])) for r in moment_rows]

    dual_bank = json.loads((HERE / 'stein_duals.json').read_text())
    knots = list(map(Q, dual_bank['knots']))
    energies = list(map(Q, dual_bank['energies']))
    assert energies == sorted(set(energies)) and energies[0] == Q(3, 250) and energies[-1] == u_top

    models_by_u = {u: [] for u in energies}
    for idx, m in enumerate(dual_bank['models']):
        assert check_stein_node(m, knots, caps, depth=20), f'Stein dual {idx} at v={m["v"]} failed exact half-line check!'
        models_by_u[Q(m['v'])].append((idx, list(map(Q, m['coefficients']))))
    assert all(models_by_u.values())

    # --- Cover A1 ([0, 463/10000] x [0, 1/2], chi <= 1/4) & Cover A2 ([0, 1/50] x [0, 7/5], chi <= 49/25) ---
    def moment_cover_lambda(u_lo, u_hi, x_lo, x_hi):
        boxes = []
        stack = [(u_lo, u_hi, x_lo, x_hi, 0)]
        worst = Q(0)
        while stack:
            a, b, c, d, dep = stack.pop()
            ka = ka_piecewise(a)
            umid, xmid = (a + b) / 2, (c + d) / 2

            def poly_m(i, x, br):
                c0, c1, c2, c3 = moment_polys[i]
                assert c3 > 0
                res = [c0, c1 - PRICE, c2 * (2 + x * x), c3 * (6 + 9 * x * x + C6 * (x**3))]
                if br == 'cubic':
                    res[3] += (ka / KAPPA) * (x**3)
                else:
                    res[2] += (Q(58, 125) / KAPPA) * (x * x)
                return res

            choices = sorted((poly_eval(poly_m(i, xmid, br), umid), i, br) for i in range(len(moment_polys)) for br in ('cubic', 'delta'))
            accepted_leaf = False
            for _, i, br in choices[:6]:
                up = max(max(bernstein_1d(poly_m(i, x, br), a, b)) for x in (c, d))
                if up < target_a:
                    boxes.append((a, b, c, d))
                    worst = max(worst, up)
                    accepted_leaf = True
                    break
            if accepted_leaf:
                continue
            assert dep < 18, ('Moment Cover A subdivision exhausted', a, b, c, d)
            if (b - a) / u_top >= (d - c) / max(x_hi, Q(1, 2)):
                stack.extend([(a, umid, c, d, dep + 1), (umid, b, c, d, dep + 1)])
            else:
                stack.extend([(a, b, c, xmid, dep + 1), (a, b, xmid, d, dep + 1)])
        assert verify_partition(boxes, u_lo, u_hi, x_lo, x_hi)
        return boxes, worst

    # Cover A1: [0, 7/200] via moment_polys, [7/200, 463/10000] via Stein slabs, x in [0, 1/2] (chi <= 1/4)
    x_a1 = Q(1, 2)
    a1_moment_boxes, a1_worst = moment_cover_lambda(Q(0), Q(7, 200), Q(0), x_a1)
    a1_stein_boxes = []
    stein_u_a1 = [u for u in energies if u >= Q(7, 200)]
    for uL, uR in zip(stein_u_a1, stein_u_a1[1:]):
        ka = ka_piecewise(uL)
        stack_x = [(Q(0), x_a1, 0)]
        while stack_x:
            xL, xR, dep = stack_x.pop()
            # By complete monotonicity (2.7), |V''(s)| <= -V''(0) < V2_BOUND = 1673/1000, so
            # |d^2/du^2 E[V(u|Q|^2)]| <= V2_BOUND * (2 + xR^2), giving chord allowance (V2_BOUND / 8) (2 + xR^2) (du)^2:
            interp = V2_BOUND * Q(1, 8) * (2 + xR * xR) * ((uR - uL)**2)
            surcharge = (ka / KAPPA) * (uR**3) * (xR**3)
            end_up = []
            for u_end in (uL, uR):
                best_u = min(
                    max(P[0] + P[1] + P[2] * (2 + x * x) + P[3] * (6 + 9 * x * x + C6 * (x**3)) - PRICE * u_end for x in (xL, xR))
                    for _, P in models_by_u[u_end]
                )
                end_up.append(best_u)
            slab_up = max(end_up) + interp + surcharge
            if slab_up < target_a:
                a1_stein_boxes.append((uL, uR, xL, xR))
                a1_worst = max(a1_worst, slab_up)
            else:
                assert dep < 10, ('Stein Cover A1 failed', uL, uR, xL, xR, float(slab_up - target_a))
                xm = (xL + xR) / 2
                stack_x.extend([(xL, xm, dep + 1), (xm, xR, dep + 1)])
    a1_all = a1_moment_boxes + a1_stein_boxes
    assert verify_partition(a1_all, Q(0), u_top, Q(0), x_a1)

    # Cover A2: [0, 1/50] x [0, 7/5] (chi <= 49/25 = 1.96)
    x_a2 = Q(7, 5)
    a2_boxes, a2_worst = moment_cover_lambda(Q(0), Q(1, 50), Q(0), x_a2)

    # --- Stein Deficit Slabs Helper (for Cover B, Cover C, and Cover D) ---
    b_lo_at = {u: poly_eval(b_rice_lo, u) for u in energies}

    def certify_stein_deficit_slabs(u_nodes, x_lo, x_hi, eta_q, include_ka=True, strict=False):
        out_boxes = []
        min_margin = Q(1)
        scale_d = KAPPA if include_ka else Q(1)
        for uL, uR in zip(u_nodes, u_nodes[1:]):
            ka = ka_piecewise(uL) if include_ka else Q(0)
            stack_x = [(x_lo, x_hi, 0)]
            while stack_x:
                xL, xR, dep = stack_x.pop()
                # Concavity of B gives B(u) >= chord(B_lo(uL), B_lo(uR)); |d^2/du^2 E[V(u|Q|^2)]| <= V2_BOUND * (2 + xR^2):
                interp_loss = scale_d * V2_BOUND * Q(1, 8) * (2 + xR * xR) * ((uR - uL)**2)
                end_margins = []
                ok_both = True
                for u_end in (uL, uR):
                    best_m = None
                    for _, P in models_by_u[u_end]:
                        d0 = scale_d * (b_lo_at[u_end] - (P[0] + P[1] + 2 * P[2] + 6 * P[3])) + eta_q - interp_loss
                        d2 = -scale_d * (P[2] + 9 * P[3])
                        d3 = -scale_d * P[3] * C6 - ka * (uR**3)
                        b_coeffs = bernstein_1d([d0, Q(0), d2, d3], xL, xR)
                        m_val = min(b_coeffs)
                        if best_m is None or m_val > best_m:
                            best_m = m_val
                    if best_m is None or (best_m <= 0 if strict else best_m < 0):
                        ok_both = False
                        break
                    end_margins.append(best_m)
                if ok_both:
                    out_boxes.append((uL, uR, xL, xR))
                    min_margin = min(min_margin, min(end_margins))
                else:
                    assert dep < 12, ('Stein deficit cover failed', uL, uR, xL, xR, eta_q, include_ka, strict)
                    xm = (xL + xR) / 2
                    stack_x.extend([(xL, xm, dep + 1), (xm, xR, dep + 1)])
        assert verify_partition(out_boxes, u_nodes[0], u_nodes[-1], x_lo, x_hi)
        return out_boxes, min_margin

    # Cover B: Signed C_A(q)^2 <= (6/25) D(q) + 10^{-6} on [0, 463/10000] x [0, 29/100] (0 <= chi <= 841/10000 = 0.0841)
    x_b = Q(29, 100)
    b_mac_sub = []
    for a, b, c, d in mac_signed_boxes:
        aa, bb = max(a, Q(0)), min(b, Q(3, 250))
        cc, dd = max(c, Q(0)), min(d, x_b)
        if aa < bb and cc < dd:
            b_mac_sub.append((aa, bb, cc, dd))
    b_stein_boxes, b_stein_min = certify_stein_deficit_slabs(energies, Q(0), x_b, Q(1, 10**6), include_ka=True, strict=False)
    cover_b_all = b_mac_sub + b_stein_boxes
    assert verify_partition(cover_b_all, Q(0), u_top, Q(0), x_b)

    # Cover C: Exact zero-slack C_A(q)^2 <= (6/25) D(q) on:
    #   - [1/4000, 3/250] x [1/8, 7/25] (chi in [1/64, 49/625] = [0.015625, 0.0784]) via Maclaurin, and
    #   - [3/250, 463/10000] x [7/100, 7/25] (chi in [49/10000, 49/625] = [0.0049, 0.0784]) via Stein slabs.
    x_c_stein_lo = Q(7, 100)
    x_c_hi = Q(7, 25)
    c_mac_sub = []
    for a, b, c, d in mac_exact_boxes:
        cc, dd = max(c, x_c_mac_lo), min(d, x_c_hi)
        if cc < dd:
            c_mac_sub.append((a, b, cc, dd))
    assert verify_partition(c_mac_sub, Q(1, 4000), Q(3, 250), x_c_mac_lo, x_c_hi)
    c_stein_boxes, c_stein_min = certify_stein_deficit_slabs(energies, x_c_stein_lo, x_c_hi, Q(0), include_ka=True, strict=False)
    assert verify_partition(c_stein_boxes, Q(3, 250), u_top, x_c_stein_lo, x_c_hi)

    # Cover D: Strict peak remote deficit positivity D(q) > 0 on:
    #   - [1/4000, 3/250] x [1/8, 7/10] (chi in [1/64, 49/100] = [0.015625, 0.49]) via Maclaurin, and
    #   - [3/250, 463/10000] x [7/100, 7/10] (chi in [49/10000, 49/100] = [0.0049, 0.49]) via Stein slabs.
    d_stein_boxes, d_stein_min = certify_stein_deficit_slabs(energies, x_c_stein_lo, x_d_hi, Q(0), include_ka=False, strict=True)
    assert verify_partition(d_stein_boxes, Q(3, 250), u_top, x_c_stein_lo, x_d_hi)

    def fmt_floor(q_val, digits=15):
        q_val = Q(q_val)
        assert q_val >= 0
        unit = 10**digits
        n = (q_val * unit).__floor__()
        return f'{n // unit}.{str(n % unit).zfill(digits)}'

    return {
        'v2_at_zero_certified_upper': str(V2_BOUND),
        'zero_dual_raw_core_chi_max': '9/100',
        'zero_dual_raw_core_margin': str(target_a - lhs_09),
        'pure_python_S_lower_at_v0_floor15': fmt_floor(s_lo_pure, 15),
        'cover_A1_raw_core_full_band': {
            'domain_u': ['0', str(u_top)],
            'domain_chi': ['0', str(x_a1 * x_a1)],
            'box_count': len(a1_all),
            'strict_margin_floor15': fmt_floor(target_a - a1_worst, 15),
        },
        'cover_A2_raw_core_u_le_002': {
            'domain_u': ['0', '1/50'],
            'domain_chi': ['0', str(x_a2 * x_a2)],
            'box_count': len(a2_boxes),
            'strict_margin_floor15': fmt_floor(target_a - a2_worst, 15),
        },
        'cover_B_signed_deficit_1e6': {
            'claim': 'C_A(q)^2 <= (6/25) D(q) + 1/1000000 (signed D)',
            'domain_u': ['0', str(u_top)],
            'domain_chi': ['0', str(x_b * x_b)],
            'box_count': len(cover_b_all),
            'min_stein_margin_floor15': fmt_floor(b_stein_min, 15),
        },
        'cover_C_exact_deficit_zero_slack': {
            'claim': 'C_A(q)^2 <= (6/25) D(q) (exact zero slack)',
            'analytic_near_gaussian': '(0, 463/10000] x [0, 1/10000] via 3.19',
            'analytic_low_energy_all_shapes': '[0, 1/4000] x [0, 42] via 3.19',
            'maclaurin_domain_u': ['1/4000', '3/250'],
            'maclaurin_domain_chi': ['1/64', str(x_c_hi * x_c_hi)],
            'maclaurin_box_count': len(c_mac_sub),
            'stein_domain_u': ['3/250', str(u_top)],
            'stein_domain_chi': ['49/10000', str(x_c_hi * x_c_hi)],
            'stein_box_count': len(c_stein_boxes),
            'min_stein_margin_floor15': fmt_floor(c_stein_min, 15),
        },
        'cover_D_strict_deficit_positivity': {
            'claim': 'D(q) > 0 (strict peak remote deficit positivity)',
            'analytic_complement_319': '(0, 463/10000] x (0, 1/5000] and (0, 1/4000] x (0, 42] via 3.19',
            'maclaurin_domain_u': ['1/4000', '3/250'],
            'maclaurin_domain_chi': ['1/64', str(x_d_hi * x_d_hi)],
            'maclaurin_box_count': len(d_pos_mac_boxes),
            'maclaurin_min_margin_floor15': fmt_floor(min(d_pos_mac_coeffs), 15),
            'stein_domain_u': ['3/250', str(u_top)],
            'stein_domain_chi': ['49/10000', str(x_d_hi * x_d_hi)],
            'stein_box_count': len(d_stein_boxes),
            'min_stein_margin_floor15': fmt_floor(d_stein_min, 15),
        },
        'stein_duals_verified': len(dual_bank['models']),
    }


# ============================================================================
# 7. Mandatory Rejection / Corruption Self-Tests
# ============================================================================
def run_negative_controls(peak_ma1):
    # Control 1: Over-tight K_A(0) bound 856/100 = 8.56 < 8.56475 must NOT pass
    ka0 = (Q(3, 4) * SQRT_6) * peak_ma1 * peak_ma1
    assert not (ka0.hi < Q(856, 100)), 'Negative control 1 failed!'

    # Control 2: Perturbed Stein dual P0 - 10^{-4} must be rejected by check_stein_node
    caps_json = json.loads((ARCHIVE / 'profile-caps.json').read_text())
    caps = [(Q(d['interval'][0]), Q(d['interval'][1]), list(map(Q, d['coefficients']))) for d in caps_json['cells']]
    caps.append((caps[-1][1], None, list(map(Q, caps_json['tail']))))
    dual_bank = json.loads((HERE / 'stein_duals.json').read_text())
    knots = list(map(Q, dual_bank['knots']))
    bad_dual = dict(dual_bank['models'][-1])
    p_orig = list(map(Q, bad_dual['coefficients']))
    bad_dual['coefficients'] = [str(p_orig[0] - Q(1, 10000))] + [str(x) for x in p_orig[1:]]
    assert not check_stein_node(bad_dual, knots, caps, depth=20), 'Negative control 2 failed!'

    # Control 3: Perturbed Q_4(y) downward by -10^{-3} y must fail Q_4(y)^2 (1+y)^5 - 1 >= 0
    q4_good = certify_radau_q4(Q(11, 10), Q(3, 2))
    q4_bad = list(q4_good)
    q4_bad[1] -= Q(1, 1000)
    diff_bad = poly_add(poly_mul(poly_mul(q4_bad, q4_bad), poly_pow([Q(1), Q(1)], 5)), [Q(-1)])
    assert not positive_on(diff_bad[1:], Q(0), Q(2), depth=14), 'Negative control 3 failed!'

    # Control 4: Perturbed L_8(y) upward by +10^{-4} y must fail (1+y) - L_8(y)^2 >= 0
    l8_good = build_radau_sqrt_l8()
    l8_bad = list(l8_good)
    l8_bad[1] += Q(1, 10000)
    diff_l8_bad = poly_add([Q(1), Q(1)], poly_scale(poly_mul(l8_bad, l8_bad), -1))
    assert not positive_on(diff_l8_bad[1:], Q(0), Q(2), depth=14), 'Negative control 4 failed!'

    # Control 5: Partition with a 10^{-6} gap or overlap must be rejected by verify_partition
    gap_boxes = [(Q(0), Q(1, 2) - Q(1, 10**6), Q(0), Q(1)), (Q(1, 2), Q(1), Q(0), Q(1))]
    overlap_boxes = [(Q(0), Q(3, 5), Q(0), Q(1)), (Q(2, 5), Q(1), Q(0), Q(1))]
    assert not verify_partition(gap_boxes, Q(0), Q(1), Q(0), Q(1)), 'Negative control 5a failed!'
    assert not verify_partition(overlap_boxes, Q(0), Q(1), Q(0), Q(1)), 'Negative control 5b failed!'
    return 5


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write-result', action='store_true', help='Write verify_raw_content_result.json')
    args = parser.parse_args()

    t0 = time.monotonic()
    row_results, ka_smoothed, c_inf_pk, peak_moments = certify_section_ab()
    a_pk, b_pk, ia_pk, ib_pk, ma_pk = peak_moments
    v_derivs, b_rice_lo = compute_deficit_moments_and_rice_poly(a_pk, b_pk, ia_pk, ib_pk)
    cover_summary = certify_analytical_and_covers(v_derivs, b_rice_lo)
    n_neg = run_negative_controls(ma_pk[1])
    elapsed = round(time.monotonic() - t0, 3)

    report = {
        'agent_id': 'gemini-5331',
        'issue': '#513 (part of #509, #177)',
        'status': 'PASS',
        'arithmetic': '100% pure-Python standard library Fraction + 220-bit outward dyadic Interval + exact Bernstein',
        'upstream_sha256': EXPECTED_UPSTREAM_SHA256,
        'stein_duals_sha256': hashlib.sha256((HERE / 'stein_duals.json').read_bytes()).hexdigest(),
        'row_constants': row_results,
        'peak_smoothed_K_A': ka_smoothed,
        'peak_low_influence_C_inf': c_inf_pk.enclosure(),
        'peak_low_influence_certified_upper': '507/100',
        'peak_low_influence_raw_core_tau_threshold': '1/455',
        'peak_low_influence_implied_chi_max': '10/91',
        'covers_and_corollaries': cover_summary,
        'negative_controls_passed': n_neg,
        'elapsed_seconds': elapsed,
    }
    text = json.dumps(report, indent=2) + '\n'
    if args.write_result:
        (HERE / 'verify_raw_content_result.json').write_text(text)
    print(text, end='')


if __name__ == '__main__':
    main()
