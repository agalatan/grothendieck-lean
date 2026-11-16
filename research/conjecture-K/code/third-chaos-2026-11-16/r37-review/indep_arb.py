#!/usr/bin/env python3
"""Independent rigorous re-check of the 13 radial majorants Q(r) >= 0 on [0, oo)
(claude-b9ee review of ledger row 3.7).  Written from the mathematical definitions, without
reusing the certificate's code.

Q(r) = lam0 + lam1 r^2 + L2 r^4 + L3 r^6 + Psi(r) - r,
Psi(r) = E_theta h(r cos theta) = (2/pi) int_0^{pi/2} h(r cos theta) d theta,
h(x) = x V(x) - w(x)/2 - w(x)^2/(2 mu), V(x) = int_0^x w, w the even piecewise-linear
interpolant of (xi_k, v_k), constant beyond xi_K.

Method.
* The cubic h_k of every piece is built EXACTLY in rational arithmetic by polynomial algebra; its
  continuity at every knot is asserted exactly.
* theta-formulation: piece k occupies theta in [theta_{k+1}(r), theta_k(r)], theta_k(r) =
  arccos(min(xi_k / r, 1)); with C_m(theta) = int_0^theta cos^m (C_0 = theta, C_1 = sin,
  C_2 = theta/2 + sin cos/2, C_3 = sin - sin^3/3),
  Psi(r) = (2/pi) sum_k sum_m c_{k,m} r^m [C_m(theta_k) - C_m(theta_{k+1})],
  Psi'(r) = (2/pi) sum_k sum_{m>=1} m c_{k,m} r^{m-1} [C_m(theta_k) - C_m(theta_{k+1})].
* On a radial cell [lo, hi] (dyadic), C_m(theta_k(r)) is nondecreasing in r (theta_k increases with
  r and cos^m >= 0 on [0, pi/2]), so its range is the hull of its values at lo and hi.  This gives
  an enclosure of Q' on the cell; the cell is accepted when Q(mid) - (hi-lo)/2 sup|Q'| > 0.
* Tail r >= R1: Psi = Psi_K + Delta with Psi_K(r) = sum_m c_{K,m} kappa_m r^m (kappa = 1, 2/pi,
  1/2, 4/(3 pi)) and |Delta(r)| <= (2/pi) D / sqrt(r^2 - xi_K^2), D >= int_0^{xi_K} |h - h_K|
  (bounded crudely by sum_m |c_{k,m} - c_{K,m}| xi_{k+1}^m per piece).  With rational bounds for
  2/pi, Q(R1 + t) is bounded below by a polynomial in t with rational coefficients, all of which
  are checked to be positive.
Usage: python3 -I indep_arb.py radius_certificates.json ROW [R1]
"""
import json, sys, time
from fractions import Fraction as F
from math import isqrt
from flint import arb, ctx

ctx.prec = 128
PI = arb.pi()
HALFPI = PI / 2

def A(q):
    q = F(q)
    return arb(q.numerator) / arb(q.denominator)

def polymul(p, q):
    out = [F(0)] * (len(p) + len(q) - 1)
    for i, a in enumerate(p):
        for j, b in enumerate(q):
            out[i + j] += a * b
    return out

def polyadd(p, q, s=1):
    n = max(len(p), len(q)); out = [F(0)] * n
    for i, a in enumerate(p): out[i] += a
    for i, b in enumerate(q): out[i] += s * b
    return out

def peval(p, x):
    return sum(c * x ** i for i, c in enumerate(p))

class Row:
    def __init__(self, c):
        self.xi = xi = [F(x) for x in c['xi']]
        self.v = v = [F(x) for x in c['v']]
        self.mu = F(c['mu']); self.l0 = F(c['lam0']); self.l1 = F(c['lam1'])
        self.l2 = F(c['L2']); self.l3 = F(c['L3'])
        assert self.mu > 0 and self.l3 >= 0
        assert xi[0] == 0 and all(a < b for a, b in zip(xi, xi[1:])) and len(xi) == len(v)
        self.K = K = len(xi) - 1
        self.h = []
        G = F(0)
        for k in range(K + 1):
            if k < K:
                be = (v[k + 1] - v[k]) / (xi[k + 1] - xi[k])
            else:
                be = F(0)
            wp = [v[k] - be * xi[k], be]                    # w on the piece
            # V(x) = G + int_{xi_k}^x w
            prim = [F(0), wp[0], wp[1] / 2]                 # antiderivative of w
            Vp = polyadd([G - peval(prim, xi[k])], prim)    # G + prim(x) - prim(xi_k)
            hp = polyadd(polyadd(polymul([F(0), F(1)], Vp), [c / 2 for c in wp], -1),
                         [c / (2 * self.mu) for c in polymul(wp, wp)], -1)
            hp = (hp + [F(0)] * 4)[:4]
            self.h.append(hp)
            if k < K:
                G = peval(Vp, xi[k + 1])
        # exact continuity of h and of V at every interior knot
        for k in range(K):
            assert peval(self.h[k], xi[k + 1]) == peval(self.h[k + 1], xi[k + 1]), ('h jump', k)
        assert self.h[K][3] == 0
        self.hA = [[A(c) for c in hp] for hp in self.h]
        self.xiA = [A(x) for x in xi]
        self.cache = {}

    # C-values at radius r (exact Fraction >= 0): list over knots k of (C0..C3) at theta_k(r)
    def cvals(self, r):
        if r in self.cache:
            return self.cache[r]
        out = []
        zero = (arb(0), arb(0), arb(0), arb(0))
        top = (HALFPI, arb(1), PI / 4, arb(2) / 3)   # C_m(pi/2)
        for k, x in enumerate(self.xi):
            if k == 0:
                out.append(top)
            elif r == 0 or x >= r:
                out.append(zero)
            else:
                z = A(x / r)
                s = (1 - z * z).sqrt()
                t = z.acos()
                out.append((t, s, t / 2 + s * z / 2, s - s * s * s / 3))
        self.cache[r] = out
        return out

    def active(self, r):
        # number of pieces with xi_k < r (piece 0 always counts)
        n = 1
        while n <= self.K and self.xi[n] < r:
            n += 1
        return n

    def Psi(self, r):
        cv = self.cvals(r); R = A(r); n = self.active(r)
        Rp = [arb(1), R, R * R, R * R * R]
        tot = arb(0)
        for k in range(n):
            up = cv[k]
            lo = cv[k + 1] if k + 1 <= self.K else (arb(0),) * 4
            for m in range(4):
                tot += self.hA[k][m] * Rp[m] * (up[m] - lo[m])
        return 2 * tot / PI

    def Q(self, r):
        R = A(r)
        return A(self.l0) + A(self.l1) * R ** 2 + A(self.l2) * R ** 4 + A(self.l3) * R ** 6 + self.Psi(r) - R

    def dQ(self, lo, hi):
        cl = self.cvals(lo); ch = self.cvals(hi)
        R = A(lo).union(A(hi)); n = self.active(hi)
        Rp = [arb(1), R, R * R]
        hull = [tuple(a.union(b) for a, b in zip(cl[k], ch[k])) for k in range(min(n + 1, self.K + 1))]
        tot = arb(0)
        for k in range(n):
            up = hull[k]
            low = hull[k + 1] if k + 1 <= self.K else (arb(0),) * 4
            for m in range(1, 4):
                tot += m * self.hA[k][m] * Rp[m - 1] * (up[m] - low[m])
        dpsi = 2 * tot / PI
        return 2 * A(self.l1) * R + 4 * A(self.l2) * R ** 3 + 6 * A(self.l3) * R ** 5 - 1 + dpsi

    def cover(self, R1, n0=256, minw=F(1, 2 ** 40)):
        stack = [(R1 * i / n0, R1 * (i + 1) / n0) for i in range(n0 - 1, -1, -1)]
        n = 0; worst = None; maxdepth = 0
        while stack:
            lo, hi = stack.pop()
            mid = (lo + hi) / 2
            q = self.Q(mid)
            d = abs(self.dQ(lo, hi)).upper()
            lower = q - A((hi - lo) / 2) * d
            n += 1
            if lower > 0:
                lv = float(lower.lower()); worst = lv if worst is None else min(worst, lv)
            else:
                if hi - lo < minw:
                    raise AssertionError(('cell failed', float(lo), float(hi), q.str(10)))
                stack.append((mid, hi)); stack.append((lo, mid))
                maxdepth = max(maxdepth, int(round(float(R1 / n0 / (hi - lo)))).bit_length())
            if len(self.cache) > 3000:
                self.cache.clear()
        return n, worst, maxdepth

    def tail(self, R1):
        K = self.K; xiK = self.xi[K]
        assert R1 > xiK
        # rational enclosure of 2/pi
        pi_lo, pi_hi = F(314159265358979, 10 ** 14), F(314159265358980, 10 ** 14)
        assert A(pi_lo) < PI < A(pi_hi)
        tp_lo, tp_hi = 2 / pi_hi, 2 / pi_lo
        cK = self.h[K]
        # D >= int_0^{xi_K} |h - h_K|
        D = F(0)
        from math import comb as _comb
        for k in range(K):
            dc = [a - b for a, b in zip(self.h[k], cK)]
            xm = (self.xi[k] + self.xi[k + 1]) / 2; hw = (self.xi[k + 1] - self.xi[k]) / 2
            # exact Taylor shift d(xm + y) = sum_j e_j y^j, then |d| <= sum_j |e_j| hw^j on the piece
            e = [sum(dc[m] * _comb(m, j) * xm ** (m - j) for m in range(j, 4)) for j in range(4)]
            D += 2 * hw * sum(abs(ej) * hw ** j for j, ej in enumerate(e))
        # sqrt(R1^2 - xi_K^2) from below
        X = R1 * R1 - xiK * xiK
        sc = 10 ** 20
        sq_lo = F(isqrt(X.numerator * X.denominator * sc * sc), X.denominator * sc)
        assert sq_lo * sq_lo <= X
        Dterm = tp_hi * D / sq_lo                      # >= |Delta(r)| for all r >= R1
        # polynomial lower bound of Q(r) - (Delta part), r >= R1 >= 0:
        # l0 + c0 + (kappa_1 c1 - 1) r + (l1 + c2/2) r^2 + kappa_3 c3 r^3 + l2 r^4 + l3 r^6
        c0, c1, c2, c3 = cK
        assert c3 == 0
        k1 = tp_lo if c1 >= 0 else tp_hi            # (2/pi) c1 >= k1 c1
        P = [self.l0 + c0 - Dterm, k1 * c1 - 1, self.l1 + c2 / 2, F(0), self.l2, F(0), self.l3]
        # shift r = R1 + t
        from math import comb
        S = [F(0)] * 7
        for m, cm in enumerate(P):
            for j in range(m + 1):
                S[j] += cm * comb(m, j) * R1 ** (m - j)
        ok = all(c > 0 for c in S)
        return ok, [float(c) for c in S], float(D), float(Dterm)

if __name__ == '__main__':
    rows = json.load(open(sys.argv[1]))
    i = int(sys.argv[2]); R1 = F(sys.argv[3]) if len(sys.argv) > 3 else F(64)
    row = Row(rows[i])
    t0 = time.time()
    q0 = row.Q(F(0))
    ok, S, D, Dt = row.tail(R1)
    n, worst, depth = row.cover(R1)
    print(json.dumps(dict(row=i, s_interval=rows[i]['s_interval'], R1=str(R1), Q0=q0.str(12),
                          cells=n, min_cell_lower=worst, max_bisection_depth=depth,
                          tail_ok=ok, tail_shifted_coeffs=S, tail_D=D, tail_Dterm=Dt,
                          seconds=round(time.time() - t0, 1))), flush=True)
    assert ok, 'tail failed'
    assert q0 > 0
    print('ROW', i, 'PASS')
