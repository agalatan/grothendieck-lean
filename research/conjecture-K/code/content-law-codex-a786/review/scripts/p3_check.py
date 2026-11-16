# Review of codex-a786's content-law package (worker of claude-b9ee, 16 Nov 2026).  N, with exact rational lower bounds.
# P3 at an UNEQUAL spectrum (the package's replay covers equal eigenvalues only):  q = sqrt(u) X P,
#   P = l1 (T1 - 1) + l2 (T2 - 1),  l1^2 + l2^2 = 1,  B = l1^2 T1 + l2^2 T2,  R = P^2.
# Computes   (7):  theta(P) = 2 [24 E(b^2/R) - 8 E(pb/R) + E(p^2/R) + 16 s3^2] / [3 (4 + 12 kappa)],   p = E[P|R], b = E[PB|R],
#            (8):  the simpler sufficient bound,
#            theta_*: the sharp profile-free constant (conditioning on V = u R S instead of (R, S)),
#            and, exactly (rational arithmetic), the supremum of c^2/(delta Omhat) over polynomial profiles of bounded degree.
# Expected chain:  h = v  <=  polynomial sup  <=  theta_*  <=  (7)  <=  (8).
import math
from fractions import Fraction as Fr
from math import comb, factorial
import numpy as np
import sympy as sp
from numpy.polynomial.legendre import leggauss

X16, W16 = leggauss(16)
def comp(a, b, npan):
    ed = np.linspace(a, b, npan + 1)
    return (np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * X16 for i in range(npan)]),
            np.concatenate([(ed[i + 1] - ed[i]) / 2 * W16 for i in range(npan)]))

def fg(l1, l2):
    """density f(x) of P and g(x) = E[B; P in dx]/dx, vectorised in x (numerical integral over t = T1)."""
    c0 = l1 + l2
    def both(x):
        x = np.atleast_1d(np.asarray(x, float)); s = x + c0; f = np.zeros_like(x); g = np.zeros_like(x)
        for i, si in enumerate(s):
            if l2 > 0:
                if si <= 0: continue
                t, w = comp(0.0, si / l1, 12)
            else:
                t0 = max(0.0, si / l1); t, w = comp(t0, t0 + 70.0 / (1 + l1 / abs(l2)), 40)
            T2 = (si - l1 * t) / l2; e = np.exp(-t - T2) / abs(l2)
            f[i] = w @ e; g[i] = w @ ((l1 * l1 * t + l2 * l2 * T2) * e)
        return f, g
    return both

def derange(K):                                         # E (T - 1)^k
    return [sum(comb(k, j) * (-1) ** (k - j) * factorial(j) for j in range(k + 1)) for k in range(K + 1)]

def poly_sup(l1, l2, n):
    """exact sup over polynomial profiles with deg k' <= n - 1 (u = 1)."""
    K = 4 * n + 4; d = derange(K)
    mom = [sum(comb(k, j) * Fr(l1) ** j * d[j] * Fr(l2) ** (k - j) * d[k - j] for j in range(k + 1)) for k in range(K + 1)]     # E P^k
    assert mom[1] == 0 and mom[2] == 1
    EV = lambda k: factorial(k) * mom[2 * k]; cont = lambda i: factorial(i + 1) * mom[2 * i + 1]
    kap = Fr(l1) ** 4 + Fr(l2) ** 4; delta = 4 + 12 * kap
    assert EV(2) - 2 == delta
    S_ = lambda fr: sp.Rational(Fr(fr).numerator, Fr(fr).denominator)
    C = sp.Matrix([S_(Fr(1, j + 1) * cont(j + 1) - cont(j)) for j in range(n)])
    Q = sp.Matrix(n, n, lambda i, j: S_(Fr(3, 2) * EV(i + j + 1) - Fr(3, 4) * EV(i + 1) * EV(j + 1)))
    return float((C.T * Q.LUsolve(C))[0, 0] / S_(delta))

def analyse(l1f, l2f, label):
    l1, l2 = float(l1f), float(l2f); kap = l1 ** 4 + l2 ** 4; s3 = l1 ** 3 + l2 ** 3; F = fg(l1, l2)
    # one-dimensional integrals over r = |P|, kink at |l1 + l2|
    kink = abs(l1 + l2); r, w = (np.concatenate(z) for z in zip(comp(0.0, kink, 60), comp(kink, kink + 4, 60), comp(kink + 4, kink + 60, 120)))
    fp, gp = F(r); fm, gm = F(-r); den = fp + fm
    Ipp = float(w @ ((fp - fm) ** 2 / den)); Ibb = float(w @ ((gp - gm) ** 2 / den)); Ipb = float(w @ ((fp - fm) * (gp - gm) / den))
    chk = [float(w @ den) - 1, float(w @ (r * r * den)) - 1, float(w @ (r * (gp - gm))) - s3]            # mass, E P^2 = 1, E[PB] = s3
    th7 = 2 * (24 * Ibb - 8 * Ipb + Ipp + 16 * s3 * s3) / (3 * (4 + 12 * kap))
    th8 = 2 * ((math.sqrt(17 * Ipp) + math.sqrt(24 * kap)) ** 2 + 16 * s3 * s3) / (3 * (4 + 12 * kap))
    # sharp constant: n(w) = int dx e^{-w/x^2} (w/x^3)(2 w g(x)/x^2 - f(x)),  gW(w) = int dx f(x) e^{-w/x^2}/x^2
    # nodes in x on both sides: geometric panels on (0, kink] (they resolve exp(-w/x^2) for every w), then panels up to kink + 60;
    # the break at |x| = kink = |l1 + l2| is where the support of P ends (same signs) or where its density has a kink (opposite signs)
    geo = lambda top: np.concatenate([[0.0], top * 2.0 ** (-np.arange(160, -1, -1) / 4.0), top + 60 * np.linspace(0, 1, 81)[1:] ** 1.5])
    def gl(ed):
        return (np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * X16 for i in range(len(ed) - 1)]),
                np.concatenate([(ed[i + 1] - ed[i]) / 2 * W16 for i in range(len(ed) - 1)]))
    xp, wp = gl(geo(kink)); x = np.concatenate([xp, -xp]); wx = np.concatenate([wp, wp]); f, g = F(x)
    chk += [float(wx @ f) - 1, float(wx @ (x * x * f)) - 1, float(wx @ (x * g)) - s3]
    xs = np.linspace(math.log(1e-18), math.log(4e5), 2400); ws = np.exp(xs); n_ = np.empty(len(ws)); gW = np.empty(len(ws))
    for i in range(0, len(ws), 200):
        Wm = ws[i:i + 200][:, None]; e = np.exp(-Wm / (x * x)[None, :])
        n_[i:i + 200] = (e * (Wm / x[None, :] ** 3) * (2 * Wm * g[None, :] / (x * x)[None, :] - f[None, :])) @ wx
        gW[i:i + 200] = (e * f[None, :] / (x * x)[None, :]) @ wx
    dx = xs[1] - xs[0]; tr = lambda y: float(dx * (y.sum() - 0.5 * (y[0] + y[-1])))
    chk += [tr(gW * ws) - 1, tr(n_ * ws) - 4 * s3]
    ths = 2 * (tr(n_ * n_ / np.maximum(gW, 1e-300) * (gW > 1e-280)) + 16 * s3 * s3) / (3 * (4 + 12 * kap))
    hv = 2 * 32 * s3 * s3 / (3 * (4 + 12 * kap))                                                   # the ratio of h(v) = v
    out = dict(kap=kap, s3=s3, hv=hv, ths=ths, th7=th7, th8=th8, alpha2=Ipp, chk=max(abs(c) for c in chk))
    if isinstance(l1f, Fr):
        out['poly'] = [poly_sup(l1f, l2f, n) for n in (1, 3, 6)]
        assert abs(out['poly'][0] - hv) < 1e-12
    ok = hv <= ths * (1 + 1e-7) and ths <= th7 * (1 + 1e-7) and th7 <= th8 * (1 + 1e-9) and ('poly' not in out or out['poly'][-1] <= ths * (1 + 1e-7)) and out['chk'] < 2e-6
    print('%-26s kappa %.4f s3 %+.4f | h=v %.5f%s <= sharp %.5f <= (7) %.5f <= (8) %.5f | alpha^2 %.6f | checks %.0e | %s' % (
        label, kap, s3, hv, (' <= polynomials (deg k\' <= 2, 5) %.5f, %.5f' % tuple(out['poly'][1:])) if 'poly' in out else '', ths, th7, th8, Ipp, out['chk'], 'ok' if ok else 'FAIL'))
    assert ok
    return out

if __name__ == '__main__':
    r2 = 1 / math.sqrt(2)
    o = analyse(r2, r2, 'equal, m = 2 (test)')
    assert abs(o['th7'] - 1.56224) < 2e-5 and abs(o['ths'] - 1.30078) < 2e-5 and abs(o['alpha2'] - 0.2019793331) < 1e-7       # values of exact_checks.py / sharp_table.py
    analyse(Fr(3, 5), Fr(4, 5), '(3/5, 4/5)')
    analyse(Fr(4, 5), Fr(-3, 5), '(4/5, -3/5)')
    analyse(Fr(5, 13), Fr(12, 13), '(5/13, 12/13)')
    analyse(Fr(12, 13), Fr(-5, 13), '(12/13, -5/13)')
    analyse(Fr(20, 29), Fr(-21, 29), '(20/29, -21/29)')
    print('P3 CHECKS PASSED')
