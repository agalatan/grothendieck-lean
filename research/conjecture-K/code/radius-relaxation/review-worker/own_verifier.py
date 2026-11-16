#!/usr/bin/env python3
"""Reviewer's independent exact verifier of the radius certificates (claude-b9ee reviewer, 16 November 2026).

Written from the statement of (C1)-(C3) in the docstring of scripts/verify_cert.py and from the JSON format,
without using the author's code.  Differences of method:
  * (C2) is decided by Bernstein coefficients with exact subdivision (integers; no Sturm sequences); the tail
    [e_K, oo) by the substitution r = e_K + t/(1-t);
  * the primitives G_i at the knots are accumulated by the trapezoid rule and compared with the piece polynomials;
  * the linear data of (C3) are built from named linear forms in (n, h, b, y, z), not from tables.
Only the standard library; every decision is an exact comparison of integers or Fractions.

Usage:  python3 -I own_verifier.py CERT.json [--quiet]
Exit status 0 iff every row passes, the rows cover [0, 42] and the largest bound is below the claim.
"""
import json
import sys
import time
from fractions import Fraction as Fr
from math import comb, gcd

C6 = Fr(4045313, 100000)          # Grothe/Lower/Moment.lean: C6
S_MAX = 42                        # Circular.gaussian_fourth_moment_le_44:  E V^2 <= 44
MAX_DEPTH = 60


# ----------------------------------------------------------------------------- polynomials (Fractions)
class Poly:
    __slots__ = ('c',)

    def __init__(self, c=()):
        c = [Fr(x) for x in c]
        while c and c[-1] == 0:
            c.pop()
        self.c = c

    def __add__(self, o):
        o = _poly(o)
        n = max(len(self.c), len(o.c))
        return Poly([(self.c[i] if i < len(self.c) else 0) + (o.c[i] if i < len(o.c) else 0) for i in range(n)])
    __radd__ = __add__

    def __neg__(self):
        return Poly([-x for x in self.c])

    def __sub__(self, o):
        return self + (-_poly(o))

    def __rsub__(self, o):
        return _poly(o) + (-self)

    def __mul__(self, o):
        o = _poly(o)
        if not self.c or not o.c:
            return Poly()
        out = [Fr(0)] * (len(self.c) + len(o.c) - 1)
        for i, x in enumerate(self.c):
            if x:
                for j, y in enumerate(o.c):
                    out[i + j] += x * y
        return Poly(out)
    __rmul__ = __mul__

    def __call__(self, x):
        acc = Fr(0)
        for a in reversed(self.c):
            acc = acc * x + a
        return acc

    def is_zero(self):
        return not self.c

    def primitive(self):
        """the primitive vanishing at 0."""
        return Poly([0] + [a / (i + 1) for i, a in enumerate(self.c)])

    def in_square(self):
        """p(v) -> p(r^2)."""
        out = []
        for a in self.c:
            out += [a, 0]
        return Poly(out)

    def affine(self, a, w):
        """p(x) -> p(a + w t) as a polynomial in t."""
        res = Poly()
        lin = Poly([a, w])
        for coef in reversed(self.c):
            res = res * lin + coef
        return res


def _poly(o):
    return o if isinstance(o, Poly) else Poly([o])


X = Poly([0, 1])


# ----------------------------------------------------------------------------- Bernstein positivity (integers)
def _to_int(fracs):
    den = 1
    for x in fracs:
        den = den * x.denominator // gcd(den, x.denominator)
    return [int(x * den) for x in fracs]


def bernstein_positive(bern, stats):
    """bern: integer Bernstein coefficients (any common positive scale) of a polynomial on [0, 1].
    True iff strict positivity on [0, 1] is proved by subdivision: every leaf has all coefficients > 0."""
    n = len(bern) - 1
    stack = [(bern, 0)]
    while stack:
        b, depth = stack.pop()
        if min(b) > 0:
            stats['leaves'] += 1
            stats['depth'] = max(stats['depth'], depth)
            continue
        if b[0] <= 0 or b[-1] <= 0:          # the polynomial itself is <= 0 at an end of this cell
            return False
        if depth >= MAX_DEPTH:
            return False
        rows = [b]
        for _ in range(n):
            prev = rows[-1]
            rows.append([prev[i] + prev[i + 1] for i in range(len(prev) - 1)])
        left = [rows[k][0] << (n - k) for k in range(n + 1)]
        right = [rows[n - j][j] << j for j in range(n + 1)]
        stack.append((left, depth + 1))
        stack.append((right, depth + 1))
    return True


def positive_on_segment(p, a, b, stats):
    """p > 0 on [a, b] (a < b rationals)."""
    q = p.affine(a, b - a).c                       # coefficients in t, t in [0, 1]
    if not q:
        return False
    n = len(q) - 1
    A = _to_int(q)
    M = 1
    for j in range(n + 1):
        M = M * comb(n, j) // gcd(M, comb(n, j))
    bern = [sum(comb(i, j) * (M // comb(n, j)) * A[j] for j in range(i + 1)) for i in range(n + 1)]
    return bernstein_positive(bern, stats)


def positive_on_ray(p, a, stats):
    """p > 0 on [a, oo): with r = a + x, x = t/(1-t), (1-t)^n p = sum_i [p_i / C(n,i)] B_{i,n}(t)."""
    q = p.affine(a, 1).c
    if not q:
        return False
    n = len(q) - 1
    A = _to_int(q)
    M = 1
    for j in range(n + 1):
        M = M * comb(n, j) // gcd(M, comb(n, j))
    bern = [A[i] * (M // comb(n, i)) for i in range(n + 1)]
    return bernstein_positive(bern, stats)


# ----------------------------------------------------------------------------- linear forms in (n, h, b, y, z)
class Lin:
    """a linear form in the contraction scalars, as a tuple over (n, h, b, y, z)."""
    __slots__ = ('v',)

    def __init__(self, v):
        self.v = tuple(Fr(x) for x in v)

    def __add__(self, o):
        return Lin([a + b for a, b in zip(self.v, o.v)])

    def __sub__(self, o):
        return Lin([a - b for a, b in zip(self.v, o.v)])

    def __mul__(self, k):
        return Lin([a * k for a in self.v])
    __rmul__ = __mul__


n_, h_, b_, y_, z_ = (Lin([1 if i == j else 0 for j in range(5)]) for i in range(5))
ZERO = Lin([0] * 5)
S_FORM = 32 * n_ + 8 * h_ + 32 * b_ + 96 * y_                       # s = E V^2 - 2          [Lean]
VAR_C2 = 16 * n_ + 4 * h_                                           # E (c2 - 1)^2
VAR_C1M2 = 16 * n_ + 20 * h_ + 16 * b_                              # E (c1 - c2 - 1)^2
VAR_C1P2 = 80 * n_ + 20 * h_ + 16 * b_ + 96 * y_ + 32 * z_          # E (c1 + c2 - 3)^2      [Lean]
VAR_C1 = 32 * n_ + 16 * h_ + 16 * b_ + 48 * y_ + 16 * z_            # E (c1 - 2)^2
E_A2 = 32 * b_ + 24 * y_                                            # E |a|^2 >= E rho^2     [Lean]
E_VRHO = 32 * b_ + 48 * y_                                          # E [V rho]              [Lean]
S0 = 8 * n_ + 2 * h_ + 8 * b_ + 8 * z_                              # jointS0                [Lean]
H0 = Fr(8, 3) * n_ + Fr(2, 3) * h_ + Fr(8, 3) * b_ + 24 * y_ - Fr(16, 3) * z_   # jointH0  [Lean]
M_FORM = n_ + b_ + 3 * y_ - z_                                      # m >= 0                 [Lean gram1a]
T_FORM = 3 * y_ - z_
BUDGETS = [VAR_C2, VAR_C1M2, VAR_C1P2, VAR_C1, E_A2]
C_J = [Fr(1), Fr(1), Fr(3), Fr(2)]                                  # centres of c2, c1-c2, c1+c2, c1
# upper bounds of the coordinates on P1 = {s-form = 1, all cuts}:  32n <= 1, 8h <= 1, 32b <= 1, 96y <= 1, and
# h0 >= 0 gives 16 z <= 8n + 2h + 8b + 72 y = (1 - 96y)/4 + 72 y = 1/4 + 48 y <= 3/4.
P_UPPER = (Fr(1, 32), Fr(1, 8), Fr(1, 32), Fr(1, 96), Fr(3, 64))


def cut_form(kind, theta):
    """a linear form that is >= 0 on the scalars of every cubic."""
    simple = {'n': n_, 'h': h_, 'b': b_, 'y': y_, 'z': z_, 'bn': n_ - b_, 'yz': z_ - y_, 'h0': H0, 'm': M_FORM}
    if kind in simple:
        return simple[kind]
    if theta is None or theta <= 0:
        raise ValueError('theta')
    if kind == 'c1':            # z^2 <= n h, n, h >= 0:   2 z <= theta n + h / theta
        return theta * n_ + (1 / theta) * h_ - 2 * z_
    if kind == 'c2+':           # (3y - z)^2 <= h m, h, m >= 0:   2 (3y - z) <= theta h + m / theta
        return theta * h_ + (1 / theta) * M_FORM - 2 * T_FORM
    if kind == 'c2-':           #                               -2 (3y - z) <= theta h + m / theta
        return theta * h_ + (1 / theta) * M_FORM + 2 * T_FORM
    raise ValueError('unknown cut %r' % (kind,))


class Reject(Exception):
    pass


def need(cond, msg):
    if not cond:
        raise Reject(msg)


# ----------------------------------------------------------------------------- one row
def verify_row(row):
    F = lambda x: Fr(x)
    e = [F(x) for x in row['knots']]
    K = len(e) - 1
    need(K >= 1 and e[0] == 0 and all(e[i] < e[i + 1] for i in range(K)), 'knots')
    u = [x * x for x in e]
    arr = {}
    for nm in ('phi1', 'phi2', 'xi2', 'xi1', 'xia', 'th2', 'th4'):
        arr[nm] = [F(x) for x in row[nm]]
        need(len(arr[nm]) == K + 1, 'length of ' + nm)
    lam = [F(x) for x in row['lam']]
    need(len(lam) == 3, 'lam')
    slope = [F(x) for x in row.get('slope', ['0', '0'])]
    need(len(slope) == 2, 'slope')
    l3 = [F(x) for x in row['l3']]
    mu = [F(x) for x in row['mu']]
    sigma = F(row['sigma'])
    need(len(l3) == 3 and len(mu) == 5, 'lengths of l3, mu')
    need(all(x >= 0 for x in l3), 'l3 >= 0')
    need(all(x >= 0 for x in mu), 'mu >= 0')
    need(mu[4] > 0, 'mu_5 > 0')
    lam3 = sum(l3)
    need(lam3 > 0, 'lam3 > 0')

    # ---- (C1)
    for k in range(K + 1):
        need(arr['xi2'][k] >= 0 and arr['xi1'][k] >= 0 and arr['xia'][k] ** 2 <= 4 * arr['xi1'][k] * arr['xi2'][k],
             'cone at knot %d' % k)
    if mu[1] == 0:
        need(all(x == 0 for x in arr['th2']), 'th2 must vanish (mu_2 = 0)')
    if mu[3] == 0:
        need(all(x == 0 for x in arr['th4']), 'th4 must vanish (mu_4 = 0)')

    # ---- (C2)
    stats = dict(leaves=0, depth=0)
    lamP = Poly([lam[0], lam[1], lam[2], lam3])
    Gk = [Fr(0), Fr(0)]                       # G_1(u_k), G_2(u_k)
    failed = []
    for k in range(K + 1):
        tail = (k == K)
        u0 = u[k]
        if tail:
            piece = lambda nm: Poly([arr[nm][K]])
        else:
            u1 = u[k + 1]
            def piece(nm, k=k, u0=u0, u1=u1):
                a0, a1 = arr[nm][k], arr[nm][k + 1]
                sl = (a1 - a0) / (u1 - u0)
                return Poly([a0 - sl * u0, sl])
        ph = [piece('phi1') + slope[0] * X, piece('phi2') + slope[1] * X]
        G = []
        for i in range(2):
            pr = ph[i].primitive()
            G.append(pr - pr(u0) + Gk[i])
        t2, t4 = piece('th2'), piece('th4')
        t3 = piece('xi1') + Fr(1, 2) * ph[1] - t2 - t4
        t1 = piece('xi2') + ph[0] + t2 - t3
        th = [t1, t2, t3, t4]
        vth5 = X * piece('xia') + (X * ph[0] - G[0]) + Fr(1, 2) * (X * ph[1] - G[1]) - sigma * X * X
        bracket = lamP + G[0] + G[1]
        for j in range(4):
            if mu[j] == 0:
                need(th[j].is_zero(), 'th%d must vanish identically (mu_%d = 0), piece %d' % (j + 1, j + 1, k))
            else:
                bracket = bracket - C_J[j] * th[j] - (1 / (4 * mu[j])) * (th[j] * th[j])
        Fv = X * X * bracket - (1 / (4 * mu[4])) * (vth5 * vth5)
        if k == 0:
            need(len(Fv.c) < 2 or (Fv.c[0] == 0 and Fv.c[1] == 0), 'v^2 does not divide on the first piece')
            pr_ = Poly(Fv.c[2:]).in_square() - Poly([0, 1])            # F(r^2)/r^4 - r
            ok = positive_on_segment(pr_, e[0], e[1], stats)
        else:
            pr_ = Fv.in_square() - Poly([0, 0, 0, 0, 0, 1])            # F(r^2) - r^5
            ok = positive_on_ray(pr_, e[K], stats) if tail else positive_on_segment(pr_, e[k], e[k + 1], stats)
        if not ok:
            failed.append('tail' if tail else k)
        if not tail:
            for i in range(2):
                val = (Gk[i] + (arr['phi%d' % (i + 1)][k] + arr['phi%d' % (i + 1)][k + 1]) / 2 * (u1 - u0)
                       + slope[i] * (u1 * u1 - u0 * u0) / 2)            # trapezoid rule (exact for these tests)
                need(val == G[i](u1), 'primitive bookkeeping')
                Gk[i] = val
    need(not failed, '(C2) fails on pieces %s' % failed[:6])

    # ---- (C3)
    d_lin = ZERO
    for j in range(5):
        d_lin = d_lin + mu[j] * BUDGETS[j]
    d_lin = d_lin + sigma * E_VRHO
    bounds = {}
    cut_kinds = set()
    for end in ('lo', 'hi'):
        s_e = F(row['s_' + end])
        need(s_e >= 0, 's >= 0')
        if s_e == 0:
            bounds[end] = lam[0] + lam[1] + 2 * lam[2] + 6 * lam3
            continue
        pd = row['par'][end]
        al_a, al_b = (F(x) for x in pd['alpha'])
        need(al_a > 0 and al_b > 0, 'alpha > 0')
        sb = F(pd['sqrt_ub'])
        need(sb > 0 and sb * sb >= s_e, 'sqrt_ub')
        d_J = (l3[1] * (150 * al_a * S0 + (198 + 150 / al_a) * H0)
               + l3[2] * (Fr(135, 2) * al_b * S0 + (Fr(11781, 32) + Fr(135, 2) / al_b) * H0))
        obj = d_lin + sb * d_J
        eta = F(pd['eta'])
        resid = obj - eta * S_FORM
        for kind, theta, yv in pd['cuts']:
            yv = F(yv)
            need(yv >= 0, 'cut multiplier >= 0')
            resid = resid + yv * cut_form(kind, None if theta is None else F(theta))
            cut_kinds.add(kind)
        # for p in P1:  obj.p = eta + resid.p - sum_k y_k cut_k.p <= eta + sum_i max(resid_i, 0) P_UPPER_i
        L = eta + sum(max(r, 0) * pu for r, pu in zip(resid.v, P_UPPER))
        bounds[end] = (lam[0] + lam[1] + lam[2] * (2 + s_e) + l3[0] * (6 + 9 * s_e + C6 * s_e * sb)
                       + (l3[1] + l3[2]) * (6 + 9 * s_e) + s_e * L)
    spline_only_lean = (all(x == 0 for nm in ('xi2', 'xi1', 'xia', 'th2', 'th4') for x in arr[nm])
                        and mu[0] == 0 and mu[1] == 0 and mu[3] == 0
                        and all(arr['phi2'][k] == 2 * arr['phi1'][k] for k in range(K + 1)) and slope[1] == 2 * slope[0])
    used = dict(budgets=[j + 1 for j in range(5) if mu[j] > 0],
                cone=any(x != 0 for nm in ('xi2', 'xi1', 'xia') for x in arr[nm]),
                th24=any(x != 0 for nm in ('th2', 'th4') for x in arr[nm]),
                separate=not (all(arr['phi2'][k] == 2 * arr['phi1'][k] for k in range(K + 1)) and slope[1] == 2 * slope[0]),
                slope=any(x != 0 for x in slope), sigma=(sigma != 0),
                l3=[nm for nm, x in zip(('scalar', 'J2', 'J3'), l3) if x > 0], cuts=sorted(cut_kinds),
                lean_only=spline_only_lean)
    return dict(bound=max(bounds.values()), bounds=bounds, K=K, stats=stats, used=used)


def verify_cert(cert, quiet=False, out=print):
    rows = cert['rows']
    prev = Fr(0)
    worst = None
    all_ok = True
    lean_only = True
    cuts = set()
    leaves = 0
    for i, row in enumerate(rows):
        s_lo, s_hi = Fr(row['s_lo']), Fr(row['s_hi'])
        if not (s_lo == prev and s_hi > s_lo):
            out('row %d: the s-intervals are not contiguous from 0' % i)
            return False, None
        prev = s_hi
        try:
            res = verify_row(row)
        except Reject as ex:
            out('row %2d  s in [%s, %s]  REJECTED: %s' % (i, row['s_lo'], row['s_hi'], ex))
            all_ok = False
            continue
        worst = res['bound'] if worst is None else max(worst, res['bound'])
        lean_only = lean_only and res['used']['lean_only']
        cuts |= set(res['used']['cuts'])
        leaves += res['stats']['leaves']
        if not quiet:
            f = float(res['bound'])
            out('row %2d  s in [%s, %s]  K=%d  PASS  leaves %d  depth %d  bound <= %.9f  %s' % (
                i, row['s_lo'], row['s_hi'], res['K'], res['stats']['leaves'], res['stats']['depth'], f + 1e-9,
                json.dumps(res['used'])))
    covered = prev
    claim = Fr(cert['claim'])
    ok = all_ok and worst is not None and covered >= S_MAX and worst < claim
    out('rows %d; covered [0, %s]; all rows pass: %s; Bernstein leaves %d; rows using Lean inputs only: %s; cut types %s'
        % (len(rows), covered, all_ok, leaves, lean_only, sorted(cuts)))
    if worst is not None:
        out('max bound = %s  (<= %.10f);  claim %s:  %s' % (worst, float(worst) + 1e-10, cert['claim'],
                                                          'VERIFIED' if ok else 'NOT VERIFIED'))
    return ok, worst


if __name__ == '__main__':
    t0 = time.time()
    cert = json.load(open(sys.argv[1]))
    ok, worst = verify_cert(cert, quiet='--quiet' in sys.argv)
    print('time %.1f s' % (time.time() - t0))
    sys.exit(0 if ok else 1)
