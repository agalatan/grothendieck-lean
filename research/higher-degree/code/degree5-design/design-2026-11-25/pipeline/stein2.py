# [stage 2c copy of degree5-cert/cert2b/stein2.py: the SOCP solve is single-threaded (see _CLARABEL_OPTS); nothing else changed]
# Scalar Stein family in the law layer of the degree-5 q-only row (stage 2b; claude-b9ee d5cert worker, 16 Nov 2026).
#
# Input (P, real-stein-radius.tex eq. (real-stein-square)): for q in H_{2,1} with ||q||_2 = 1, X = Re q, s = E|q|^4 - 2,
# every even, continuous, piecewise-linear w that is constant beyond its last knot and every mu > 0,
#     E h_w(X) <= mu s/24,   h_w(x) = x V_w(x) - w(x)/2 - w(x)^2/(2 mu),  V_w(x) = int_0^x w.
# Physical form used here (same statement for w(x) = W(sigma x), mu = M sigma^2; q -> sigma q):  for ||q||_2 = sigma,
#     E h_{W,c}(Re q) <= M sigma^4 s/24  with  c = sigma^2,  h_{W,c}(y) = y V_W(y) - (c/2) W(y) - W(y)^2/(2M).
# By circular symmetry E h(Re q) = E Psi_h(|q|), Psi_h(r) = (2/pi) int_0^1 h(r u) (1 - u^2)^(-1/2) du.
#
# A Stein majorant at nu (for a sigma-box [sa, sb]) is (a, W, M): p(s) = a0 + a1 s + a2 s^2 + a4 s^4 + a6 s^6 (a1, a6 >= 0),
# W piecewise linear on the physical knots KP = sref * KN (constant beyond the last), M > 0, such that
#     Q_c(s) = p(s) + Psi_{h_{W,c}}(s) - Psi5(s; nu) >= 0   for all s >= 0,  for c = sa^2 and c = sb^2.
# Q_c is affine in c, so Q_{sigma^2} >= 0 for every sigma in [sa, sb], and for every law in the x-box
#     E Psi5(sigma R; nu) <= E p(sigma R) + E Psi_h(sigma R) <= J(sigma, x) + M x^2 sigma^4/24.
# Q_c >= 0 is verified on the cap segments (Psi5 <= chord, convexity in s) and on the Lipschitz tail line by cells:
#   Psi_h = Psi[h_C1] + sum_j J_j K_j, J_j the jumps of h' at the knots, K_j(s) = Psi[(y - x_j)_+](s) (convex),
#   positive kinks replaced by their tangent at the left cell end (a lower bound), the rest has second derivative
#   <= p'' + sup_{[0, b]} (h'')^+ / 2; so on [a, b]:  Q >= min(Q(a), Q(b) - sum_{J_j > 0} J_j D_j) - M2 (b - a)^2/8.
# Evaluation in interval arithmetic with outward rounding (nextafter); arcsin is numpy's, widened by 8 ulp (the same
# assumption as smallt/cert.py: libm arcsin accurate to 4 ulp).  Beyond s_T = 30 an exact polynomial tail test.
import math, os
import numpy as np
from fractions import Fraction as F
import law2 as law
# stage 2c: Clarabel is told to use one thread (its default takes every core, and the covers already run one process
# per core); set D5_CLARABEL_THREADS=0 to restore the solver's default.  The solver only selects data (N).
_CLARABEL_OPTS = ({'max_threads': int(os.environ.get('D5_CLARABEL_THREADS', '1'))} if os.environ.get('D5_CLARABEL_THREADS', '1') != '0' else {})

# ---------------------------------------------------------------- interval arithmetic (outward rounding)
INF = np.inf
def dn(x): return np.nextafter(x, -INF)
def up(x): return np.nextafter(x, INF)

class I:
    __slots__ = ('lo', 'hi')
    def __init__(self, lo, hi=None):
        self.lo = np.asarray(lo, float); self.hi = np.asarray(self.lo if hi is None else hi, float)
    @staticmethod
    def frac(Fv):
        f = float(Fv)
        lo = f if F(f) <= Fv else float(dn(f)); hi = f if F(f) >= Fv else float(up(f))
        return I(lo, hi)
    @staticmethod
    def fracs(vals):
        f = np.array([float(v) for v in vals])
        lo = np.array([x if F(x) <= v else float(dn(x)) for x, v in zip(f, vals)])
        hi = np.array([x if F(x) >= v else float(up(x)) for x, v in zip(f, vals)])
        return I(lo, hi)
    def __add__(s, o):
        o = o if isinstance(o, I) else I(o)
        return I(dn(s.lo + o.lo), up(s.hi + o.hi))
    __radd__ = __add__
    def __neg__(s): return I(-s.hi, -s.lo)
    def __sub__(s, o):
        o = o if isinstance(o, I) else I(o)
        return I(dn(s.lo - o.hi), up(s.hi - o.lo))
    def __rsub__(s, o): return I(o) - s
    def __mul__(s, o):
        o = o if isinstance(o, I) else I(o)
        c = np.stack(np.broadcast_arrays(s.lo * o.lo, s.lo * o.hi, s.hi * o.lo, s.hi * o.hi))
        return I(dn(c.min(0)), up(c.max(0)))
    __rmul__ = __mul__
    def sqrt(s):
        return I(np.maximum(dn(np.sqrt(np.maximum(s.lo, 0))), 0), up(np.sqrt(np.maximum(s.hi, 0))))
    def arcsin(s):
        lo = np.clip(s.lo, 0, 1); hi = np.clip(s.hi, 0, 1)
        a = np.arcsin(lo); b = np.arcsin(hi)
        for _ in range(8):
            a = dn(a); b = up(b)
        return I(np.maximum(a, 0), b)
    def div(s, o):  # o > 0
        o = o if isinstance(o, I) else I(o)
        c = np.stack(np.broadcast_arrays(s.lo / o.lo, s.lo / o.hi, s.hi / o.lo, s.hi / o.hi))
        return I(dn(c.min(0)), up(c.max(0)))

PI = I(float(dn(np.pi)), float(up(np.pi)))
TWO_OVER_PI = I(2.0).div(PI)
TWO_OVER_PI_LO = F(2) / F(math.pi + 1e-12)
TWO_OVER_PI_HI = F(2) / F(math.pi - 1e-12)
assert TWO_OVER_PI_LO * F(314159265358980, 10 ** 14) < 2 < TWO_OVER_PI_HI * F(314159265358979, 10 ** 14)   # pi in (3.14159265358979, 3.14159265358980)

# ---------------------------------------------------------------- knots and exact h
KN_NORM = [F(0)] + [F(k, 20) for k in range(1, 33)] + [F(9, 5), F(2), F(23, 10), F(13, 5), F(3), F(7, 2), F(4), F(5), F(6), F(8), F(10)]
NK = len(KN_NORM)

def knots(sref):
    return [sref * k for k in KN_NORM]

def flj(KP):
    """largest double <= each knot"""
    out = []
    for x in KP:
        f = float(x)
        out.append(f if F(f) <= x else float(dn(f)))
    return np.array(out)

def exact_h(KP, W, M, c):
    """piecewise-cubic coefficients of h(y) = y V_W(y) - (c/2) W(y) - W(y)^2/(2M) on [KP_j, KP_j+1], and beyond."""
    K = len(KP)
    V = [F(0)]
    for j in range(K - 1):
        V.append(V[-1] + (W[j] + W[j + 1]) * (KP[j + 1] - KP[j]) / 2)
    pieces = []
    for j in range(K - 1):
        xj = KP[j]; m = (W[j + 1] - W[j]) / (KP[j + 1] - KP[j])
        al = W[j] - m * xj
        c1 = V[j] - W[j] * xj + m * xj * xj / 2
        pieces.append((-c * al / 2 - al * al / (2 * M), c1 - c * m / 2 - al * m / M, al - m * m / (2 * M), m / 2))
    WK = W[-1]; VK = V[-1]; xK = KP[-1]
    last = (-c * WK / 2 - WK * WK / (2 * M), VK - WK * xK, WK, F(0))
    return pieces, last, V

def hd1(co, y): return co[1] + 2 * co[2] * y + 3 * co[3] * y * y
def hd2(co, y): return 2 * co[2] + 6 * co[3] * y

def kink_jumps(KP, pieces, last):
    """J_j = h'(x_j+) - h'(x_j-) at the knots x_1..x_{K-1}"""
    K = len(KP); J = []
    for j in range(1, K):
        right = pieces[j] if j < K - 1 else last
        J.append(hd1(right, KP[j]) - hd1(pieces[j - 1], KP[j]))
    return J            # J[j-1] belongs to knot KP[j]

def hpp_prefix(KP, pieces, last):
    """PM[j] = max(0, sup of h'' over [0, KP_j]) (exact); h'' is linear on each piece."""
    PM = [F(0)]
    for j in range(len(KP) - 1):
        PM.append(max(PM[-1], hd2(pieces[j], KP[j]), hd2(pieces[j], KP[j + 1])))
    return PM

# ---------------------------------------------------------------- enclosures
def Ik(k, u, s1):
    if k == 0: return u.arcsin()
    if k == 1: return 1 - s1
    if k == 2: return (u.arcsin() - u * s1) * 0.5
    return (I(2.0) - (I(2.0) + u * u) * s1).div(I(3.0))

def psi_enc(s, KP, FLJ, pieces, last):
    """interval enclosure of Psi_h(s) for an array of doubles s > 0; also returns (u_j, s1_j) per knot."""
    s = np.asarray(s, float)
    S = I(s); K = len(KP)
    us = []; s1s = []
    for j in range(K):
        if KP[j] == 0:
            us.append(I(np.zeros_like(s))); s1s.append(I(np.ones_like(s))); continue
        xj = I.frac(KP[j])
        inside = s > FLJ[j]
        u = xj.div(S); u = I(np.minimum(u.lo, 1.0), np.minimum(u.hi, 1.0))
        d = S - xj; d = I(np.maximum(d.lo, 0), np.maximum(d.hi, 0))
        s1 = (d * (S + xj)).sqrt().div(S); s1 = I(np.minimum(s1.lo, 1.0), np.minimum(s1.hi, 1.0))
        us.append(I(np.where(inside, u.lo, 1.0), np.where(inside, u.hi, 1.0)))
        s1s.append(I(np.where(inside, s1.lo, 0.0), np.where(inside, s1.hi, 0.0)))
    one = I(np.ones_like(s)); zero = I(np.zeros_like(s))
    Iv = [[Ik(k, us[j], s1s[j]) for k in range(4)] for j in range(K)]
    Itop = [Ik(k, one, zero) for k in range(4)]
    rk = [one, S, S * S, S * S * S]
    tot = I(np.zeros_like(s))
    for j in range(K - 1):
        for k in range(4):
            if pieces[j][k] == 0: continue
            tot = tot + I.frac(pieces[j][k]) * rk[k] * (Iv[j + 1][k] - Iv[j][k])
    for k in range(3):
        if last[k] == 0: continue
        tot = tot + I.frac(last[k]) * rk[k] * (Itop[k] - Iv[K - 1][k])
    return tot * TWO_OVER_PI, us, s1s

def poly_enc(a, s):
    S = I(np.asarray(s, float)); S2 = S * S
    A = [I.frac(v) for v in a]
    return A[0] + S * (A[1] + S * (A[2] + S2 * (A[3] + A[4] * S2)))

def ppp_sup(a, s0, s1):
    """upper bound of p'' = 2a2 + 12a4 s^2 + 30a6 s^4 on [s0, s1] (convex in s^2: max at the ends)."""
    A2, A4, A6 = I.frac(2 * a[2]), I.frac(12 * a[3]), I.frac(30 * a[4])
    out = None
    for s in (s0, s1):
        Si = I(np.asarray(s, float)); S2 = Si * Si
        v = A2 + S2 * (A4 + A6 * S2)
        out = v.hi if out is None else np.maximum(out, v.hi)
    return out

# ---------------------------------------------------------------- one-sided verification of Q_c >= 0 on [0, oo)
S_T = F(30)

class SteinData:
    def __init__(self, sref, W, M, c):
        self.sref = F(sref); self.W = [F(w) for w in W]; self.M = F(M); self.c = F(c)
        self.KP = knots(self.sref); self.FLJ = flj(self.KP); self.KPf = np.array([float(x) for x in self.KP])
        self.pieces, self.last, self.V = exact_h(self.KP, self.W, self.M, self.c)
        self.J = kink_jumps(self.KP, self.pieces, self.last)
        self.PM = hpp_prefix(self.KP, self.pieces, self.last)
        self.PMf = np.array([float(up(float(v))) for v in self.PM])
        self.pos = [(j + 1, Jv) for j, Jv in enumerate(self.J) if Jv > 0]      # (knot index, jump > 0)
        self.h0 = self.pieces[0][0]
        # h'' upper bound on the piece containing b: max(PM[j], h''(KP_j), h''(b)), linear on the piece
        K = len(self.KP)
        self.c2 = [I.frac(2 * self.pieces[j][2]) if j < K - 1 else I.frac(2 * self.last[2]) for j in range(K)]
        self.c3 = [I.frac(6 * self.pieces[j][3]) if j < K - 1 else I.frac(F(0)) for j in range(K)]
        self.leftv = np.array([float(up(float(max(hd2(self.pieces[j], self.KP[j]), F(0)) if j < K - 1 else max(2 * self.last[2], F(0)))))
                               for j in range(K)])

    def hpp_sup(self, b):
        """upper bound of sup_{[0, b]} (h'')^+ for an array b >= 0"""
        b = np.asarray(b, float)
        # piece index from b + 1e-9 (a float knot may round either way; PM[j] covers [0, KP_j] in any case)
        j = np.clip(np.searchsorted(self.KPf, b + 1e-9, side='right') - 1, 0, len(self.KP) - 1)
        out = np.maximum(self.PMf[j], self.leftv[j])
        # value at b on its piece
        vb = np.empty_like(b)
        for jj in np.unique(j):
            m = j == jj
            v = self.c2[jj] + self.c3[jj] * I(b[m])
            vb[m] = v.hi
        return np.maximum(out, np.maximum(vb, 0))

def cell_lower(a, sd, s0, s1, L0, L1):
    """rigorous lower bounds of Q = p + Psi_h - (L0 + L1 s) on the cells [s0, s1] (arrays); L0, L1 interval arrays."""
    zero0 = s0 <= 0
    s0p = np.where(zero0, 1.0, s0)
    Pa, ua, s1a = psi_enc(s0p, sd.KP, sd.FLJ, sd.pieces, sd.last)
    Pb, ub, s1b = psi_enc(s1, sd.KP, sd.FLJ, sd.pieces, sd.last)
    h0 = I.frac(sd.h0)
    Pa = I(np.where(zero0, h0.lo, Pa.lo), np.where(zero0, h0.hi, Pa.hi))
    Qa = poly_enc(a, s0) + Pa - (L0 + L1 * I(s0))
    Qb = poly_enc(a, s1) + Pb - (L0 + L1 * I(s1))
    width = I(s1) - I(s0)
    D = I(np.zeros_like(s0))
    for j, Jv in sd.pos:
        x = I.frac(sd.KP[j])
        Ka = TWO_OVER_PI * (I(s0p) * s1a[j] + x * ua[j].arcsin()) - x
        Kpa = TWO_OVER_PI * s1a[j]
        Ka = I(np.where(zero0, 0.0, Ka.lo), np.where(zero0, 0.0, Ka.hi))
        Kpa = I(np.where(zero0, 0.0, Kpa.lo), np.where(zero0, 0.0, Kpa.hi))
        Kb = TWO_OVER_PI * (I(s1) * s1b[j] + x * ub[j].arcsin()) - x
        D = D + I.frac(Jv) * (Kb - Ka - Kpa * width)
    M2 = ppp_sup(a, s0, s1) + sd.hpp_sup(s1) / 2
    M2 = up(np.maximum(M2, 0))
    curv = up(up(M2 * up(width.hi * width.hi)) / 8)
    lower = np.minimum(Qa.lo, dn(Qb.lo - np.maximum(D.hi, 0))) - curv
    return dn(lower), np.minimum(Qa.lo, Qb.lo)

def tail_ok(a, sd, cN, sN, lip):
    """exact: s Q(s) >= T(s) > 0 for s >= S_T (beyond the last knot; Psi_h >= its quadratic part - D xK / s)."""
    KP = sd.KP; xK = KP[-1]; q = sd.last
    assert S_T > 2 * xK
    D = F(0)
    for j, co in enumerate(sd.pieces):
        b = KP[j + 1]
        D = max(D, sum(abs(co[k] - q[k]) * b ** k for k in range(4)))
    lin = q[1]
    t2 = lin * (TWO_OVER_PI_LO if lin >= 0 else TWO_OVER_PI_HI)
    # s Q(s) >= s p(s) + (WK/2) s^3 + t2 s^2 + q0 s - D xK - (cN - lip sN) s - lip s^2
    co = [F(0)] * 8
    co[0] += -D * xK
    co[1] += a[0] + q[0] - (cN - lip * sN)
    co[2] += a[1] + t2 - lip
    co[3] += a[2] + q[2] / 2
    co[5] += a[3]
    co[7] += a[4]
    if min(law.taylor_shift(co, S_T)) >= 0 and law.peval(co, S_T) > 0: return True
    return law.peval(co, S_T) > 0 and law.nonneg_ray(co, S_T)

def fl_dn(x):
    f = float(x); return f if F(f) <= x else float(dn(f))
def fl_up(x):
    f = float(x); return f if F(f) >= x else float(up(f))

def verify_stein_majorant(row, nu, a, sd, wmax=F(1, 100), maxdepth=12):
    """exact-arithmetic-free rigorous check that p + Psi_h >= Psi5(.; nu) on [0, oo) (caps + chord + Lipschitz tail).
    Returns (ok, worst lower bound over the cells, failing points)."""
    if a[1] < 0 or a[4] < 0 or sd.M <= 0: return False, -1.0, []
    S, Cc = row.caps[nu]
    segs = []
    for k in range(len(S) - 1):
        L1 = (Cc[k + 1] - Cc[k]) / (S[k + 1] - S[k]); L0 = Cc[k] - L1 * S[k]
        segs.append((S[k], S[k + 1], L0, L1))
    sN, cN = S[-1], Cc[-1]
    L1 = row.lip; L0 = cN - row.lip * sN
    tail_pts = [sN + F(k, 4) for k in range(0, int((S_T - sN) * 4))] + [S_T]
    for k in range(len(tail_pts) - 1):
        segs.append((tail_pts[k], tail_pts[k + 1], L0, L1))
    s0 = []; s1 = []; L0s = []; L1s = []
    for (x0, x1, l0, l1) in segs:
        n = max(1, int(math.ceil((x1 - x0) / wmax)))
        f0, f1 = fl_dn(x0), fl_up(x1)
        e = np.linspace(f0, f1, n + 1); e[0] = f0; e[-1] = f1
        s0.extend(e[:-1]); s1.extend(e[1:]); L0s.extend([l0] * n); L1s.extend([l1] * n)
    s0 = np.array(s0); s1 = np.array(s1)
    L0i = I.fracs(L0s); L1i = I.fracs(L1s)
    worst = np.inf
    for depth in range(maxdepth + 1):
        low, pt = cell_lower(a, sd, s0, s1, L0i, L1i)
        ok = low > 0
        if ok.any(): worst = min(worst, float(low[ok].min()))
        bad = ~ok
        if not bad.any(): break
        if depth == maxdepth or bad.sum() > 200000:
            # failure: the deficit is the smallest lower bound left (a lift of a0 by more than it passes every cell);
            # the most negative cells are returned as new solver points
            lb = low[bad]; mid = ((s0[bad] + s1[bad]) / 2)
            pts = []
            for k in np.argsort(lb):                      # at most 12 points, the most negative ones, >= 0.004 apart
                if all(abs(mid[k] - p) >= 0.004 for p in pts): pts.append(float(mid[k]))
                if len(pts) >= 12: break
            return False, float(lb.min()), sorted(round(p, 6) for p in pts)
        m = (s0[bad] + s1[bad]) / 2
        s0 = np.concatenate([s0[bad], m]); s1 = np.concatenate([m, s1[bad]])
        L0i = I(np.concatenate([L0i.lo[bad], L0i.lo[bad]]), np.concatenate([L0i.hi[bad], L0i.hi[bad]]))
        L1i = I(np.concatenate([L1i.lo[bad], L1i.lo[bad]]), np.concatenate([L1i.hi[bad], L1i.hi[bad]]))
    if not tail_ok(a, sd, cN, sN, row.lip): return False, -1.0, [float(S_T)]
    return True, worst, []

# ---------------------------------------------------------------- solving (floats; it only selects the data)
def hats(x, KPf):
    """hat basis phi_j on the knots (the last one constant beyond its knot) and Phi_j(x) = int_0^x phi_j, x >= 0."""
    x = np.asarray(x, float); K = len(KPf)
    phi = np.zeros(x.shape + (K,)); Phi = np.zeros(x.shape + (K,))
    for j in range(K):
        if j == 0:
            m, r = KPf[0], KPf[1]
            f = np.where(x < r, (r - x) / (r - m), 0.0); xc = np.minimum(x, r)
            Fv = (r * xc - xc ** 2 / 2) / (r - m)
        elif j == K - 1:
            l, m = KPf[j - 1], KPf[j]
            f = np.where(x <= l, 0.0, np.where(x < m, (x - l) / (m - l), 1.0)); xc = np.clip(x, l, m)
            Fv = (xc - l) ** 2 / (2 * (m - l)) + np.maximum(x - m, 0)
        else:
            l, m, r = KPf[j - 1], KPf[j], KPf[j + 1]
            f = np.where((x > l) & (x < m), (x - l) / (m - l), np.where((x >= m) & (x < r), (r - x) / (r - m), 0.0))
            x1 = np.clip(x, l, m); x2 = np.clip(x, m, r)
            Fv = (x1 - l) ** 2 / (2 * (m - l)) + ((r - m) ** 2 - (r - x2) ** 2) / (2 * (r - m))
        phi[..., j] = f; Phi[..., j] = Fv
    return phi, Phi

_TAB = {}
def tab_rows(points, sref, nth=2000):
    cache = _TAB.setdefault(sref, {})
    KPf = np.array([float(x) for x in knots(F(sref))])
    U = np.abs(np.cos((2 * np.arange(1, nth + 1) - 1) * np.pi / (2 * nth)))
    for p in points:
        if p in cache: continue
        X = p * U; phi, Phi = hats(X, KPf)
        G = phi.T @ phi / nth                      # tridiagonal (at most two adjacent hats are nonzero at a point)
        C = np.linalg.cholesky(G + 1e-13 * np.eye(len(KPf)))   # lower bidiagonal, G + eps I = C C^T (solver only)
        C[np.abs(C) < 1e-15] = 0.0
        cache[p] = ((X[:, None] * Phi).mean(0), phi.mean(0), C)
    return (np.array([cache[p][0] for p in points]), np.array([cache[p][1] for p in points]), np.array([cache[p][2] for p in points]))

SG0 = np.round(np.concatenate([np.linspace(0, 1.2, 49), np.linspace(1.2, 3, 61)[1:], np.linspace(3, 6, 61)[1:],
                               np.linspace(6, 12, 61)[1:], np.linspace(12, 30, 37)[1:]]), 9)

def ub_float(row, nu, s):
    S, Cc = row.caps[nu]
    Sf = np.array([float(v) for v in S]); Cf = np.array([float(v) for v in Cc])
    lip = float(row.lip)
    return np.where(s <= Sf[-1], np.interp(s, Sf, Cf), Cf[-1] + lip * (s - Sf[-1]))

def solve_box(row, nu0, nu1, sa, sb, xa, xb, sref, SG, margin0=2e-5, margin2=1e-6, margin4=1e-7, wmax=6.0, nsig=7, nlam=5):
    import cvxpy as cp
    cs = [float(sa) ** 2, float(sb) ** 2]
    Alin, Aw, L = tab_rows(list(SG), sref)
    G, K = Alin.shape
    import scipy.sparse as sps
    Lst = sps.csr_matrix(L.transpose(0, 2, 1).reshape(G * K, K))
    Pm = np.stack([np.ones(G), SG, SG ** 2, (SG / 6) ** 4, (SG / 6) ** 6], 1)
    marg = margin0 + margin2 * SG ** 2 + margin4 * SG ** 4      # costs margin0 + margin2 sigma^2 + margin4 E S^4 in the bound
    av = [cp.Variable(5), cp.Variable(5)]; Wv = [cp.Variable(K), cp.Variable(K)]; Mv = [cp.Variable(), cp.Variable()]
    t = cp.Variable()
    cons = []
    for i, nu in enumerate((nu0, nu1)):
        UB = ub_float(row, nu, SG)
        cons += [av[i][1] >= 0, av[i][4] >= 0, Mv[i] >= 1e-6, cp.abs(Wv[i]) <= wmax]
        LW = cp.reshape(Lst @ Wv[i], (K, G), order='F')
        for c in cs:
            z = Pm @ av[i] + (Alin - (c / 2) * Aw) @ Wv[i] - UB - marg
            X = cp.vstack([np.sqrt(2) * LW, cp.reshape(z - Mv[i], (1, G), order='F')])
            cons.append(cp.SOC(z + Mv[i], X, axis=0))
    kap = float(row.kappa); eta = float(law.ETA); rho = float(law.rho_on_x(F(xa), F(xb))); c6 = float(law.C6)
    rowsJ = []; rhs = []
    dn_ = float(nu1 - nu0)
    for sg in np.linspace(float(sa), float(sb), nsig):
        for x in (float(xa), float(xb)):
            jv = np.array([1, rho * sg, sg * sg, (2 + x * x) * sg ** 4 / 1296, (6 + 9 * x * x + c6 * x ** 3) * sg ** 6 / 46656])
            jm = x * x * sg ** 4 / 24
            for lam in np.linspace(0, 1, nlam):
                nu = float(nu0) + lam * dn_
                rowsJ.append(np.concatenate([(1 - lam) * jv, lam * jv, [(1 - lam) * jm, lam * jm]]))
                rhs.append(kap * sg * sg + nu * nu / eta)
    Jm = np.array(rowsJ); rhs = np.array(rhs)
    allv = cp.hstack([av[0], av[1], Mv[0], Mv[1]])
    cons.append(Jm @ allv - rhs <= t)
    prob = cp.Problem(cp.Minimize(t), cons)
    try:
        prob.solve(solver='CLARABEL', **_CLARABEL_OPTS)
    except Exception as e:
        return None
    if prob.status not in ('optimal', 'optimal_inaccurate') or av[0].value is None: return None
    out = []
    for i in range(2):
        a = np.array(av[i].value); a[3] /= 1296; a[4] /= 46656
        out.append((a, np.array(Wv[i].value), float(Mv[i].value)))
    return out, float(t.value)

def rat_major(a, W, M):
    ar = [law.to_rat(v) for v in a]
    ar[1] = max(ar[1], F(0)); ar[4] = max(ar[4], F(0))
    Wr = [F(round(w * 10 ** 12), 10 ** 12) for w in W]
    Mr = F(math.ceil(max(M, 1e-6) * 10 ** 12), 10 ** 12)
    return ar, Wr, Mr

def J_coeffs_stein(a, M, x, rho=None):
    """J(sigma, x) + M x^2 sigma^4/24 as ascending coefficients in sigma (rho: the radius input valid on the x-box)."""
    rho = law.RHO if rho is None else rho
    return [a[0], a[1] * rho, a[2], F(0), a[3] * (2 + x * x) + M * x * x / 24, F(0), a[4] * (6 + 9 * x * x + law.C6 * x ** 3)]

def box_bound_stein(row, nu0, nu1, a0, a1, M0, M1, sa, sb, xa, xb):
    """exact upper bound of max over [sa,sb] x [xa,xb] x [nu0,nu1] of (1-lam) J0 + lam J1 - kappa sigma^2 - nu^2/eta
    (J including the Stein term M x^2 sigma^4/24; cubic endpoint lemma in x as in law2.box_bound)."""
    dnu = nu1 - nu0
    best = None
    rho = law.rho_on_x(xa, xb)         # stage 2c: the s-dependent radius input on the x-box
    for x in (xa, xb):
        J0 = J_coeffs_stein(a0, M0, x, rho); J1 = J_coeffs_stein(a1, M1, x, rho)
        f = [[J0[i], J1[i] - J0[i], F(0)] for i in range(7)]
        f[2][0] -= row.kappa
        f[0][0] -= nu0 * nu0 / law.ETA
        f[0][1] -= 2 * nu0 * dnu / law.ETA
        f[0][2] -= dnu * dnu / law.ETA
        v = law.bern2_max(f, sa, sb)
        best = v if best is None else max(best, v)
    return best

def sref_for(sa, sb):
    return F(round(float(sa + sb) / 2 * 20), 20)

def q_float(row, nu, a, sd, pts):
    """float (lower-end) values of Q on the points (selection only)."""
    P, _, _ = psi_enc(np.maximum(pts, 1e-9), sd.KP, sd.FLJ, sd.pieces, sd.last)
    return poly_enc(a, pts).lo + P.lo - ub_float(row, nu, pts)

_FINE = {}
def fine_pts(row, nu):
    if nu not in _FINE:
        S = np.array([float(v) for v in row.caps[nu][0]])
        mids = (S[:-1] + S[1:]) / 2
        tail = np.linspace(S[-1], 30.0, 2401)
        _FINE[nu] = np.unique(np.concatenate([S[1:], mids, np.linspace(1e-4, S[-1], 3000), tail]))
    return _FINE[nu]

def certify_box_stein(row, nu0, nu1, sa, sb, xa, xb, maxref=3, lift_max=F(5, 10 ** 5)):
    """SOCP, rationalise; float check on a fine grid adds points (<= maxref rounds); then the rigorous check of both
    majorants at c = sa^2 and sb^2, lifting a0 by the verified deficit if needed; exact box bound."""
    sref = sref_for(sa, sb)
    SG = SG0.copy()
    cs = (sa * sa, sb * sb)
    for it in range(maxref + 1):
        res = solve_box(row, nu0, nu1, sa, sb, xa, xb, float(sref), SG)
        if res is None: return None, 'socp'
        maj, tval = res
        rats = [rat_major(*maj[i]) for i in range(2)]
        newpts = []
        if it < maxref:
            for i, nu in enumerate((nu0, nu1)):
                a, W, M = rats[i]
                pts = fine_pts(row, nu)
                for c in cs:
                    q = q_float(row, nu, a, SteinData(sref, W, M, c), pts)
                    bad = np.where(q < 5e-6)[0]
                    if len(bad):
                        # local minima of q among the bad points (at most 15 per check)
                        order = bad[np.argsort(q[bad])]
                        chosen = []
                        for k in order:
                            if all(abs(pts[k] - p) >= 0.004 for p in chosen): chosen.append(float(pts[k]))
                            if len(chosen) >= 15: break
                        newpts += chosen
        if newpts:
            SG = np.unique(np.round(np.concatenate([SG, np.array(newpts, float)]), 9))
            continue
        break
    out = []
    for i, nu in enumerate((nu0, nu1)):
        a, W, M = rats[i]
        a = list(a)
        worst = None
        for c in cs:
            ok, wl, bp = verify_stein_majorant(row, nu, a, SteinData(sref, W, M, c))
            worst = wl if worst is None else min(worst, wl)
        if worst is not None and worst <= 0:
            if -worst > float(lift_max): return None, ('deficit', float(-worst))
            a[0] += F(math.ceil(-worst * 10 ** 12) + 10, 10 ** 12)
            for c in cs:
                ok, wl, bp = verify_stein_majorant(row, nu, a, SteinData(sref, W, M, c))
                if not ok: return None, ('lift failed', float(-worst))
        out.append((a, W, M))
    (a0, W0, M0), (a1, W1, M1) = out
    bound = box_bound_stein(row, nu0, nu1, a0, a1, M0, M1, sa, sb, xa, xb)
    return bound, dict(stein=True, sref=str(sref), a0=[str(v) for v in a0], a1=[str(v) for v in a1],
                       W0=[str(v) for v in W0], W1=[str(v) for v in W1], M0=str(M0), M1=str(M1), socp=tval, grid=len(SG))

def check_box_stein(row, b):
    """replay of a Stein box: both majorants at both c, then the exact box bound <= stored bound."""
    nu0, nu1, sa, sb, xa, xb = (F(v) for v in b['box'])
    sref = F(b['sref'])
    for nu, ak, Wk, Mk in ((nu0, 'a0', 'W0', 'M0'), (nu1, 'a1', 'W1', 'M1')):
        a = [F(v) for v in b[ak]]; W = [F(v) for v in b[Wk]]; M = F(b[Mk])
        for c in (sa * sa, sb * sb):
            ok, _, _ = verify_stein_majorant(row, nu, a, SteinData(sref, W, M, c))
            if not ok: return False
    bd = box_bound_stein(row, nu0, nu1, [F(v) for v in b['a0']], [F(v) for v in b['a1']], F(b['M0']), F(b['M1']), sa, sb, xa, xb)
    return bd <= F(b['bound'])
