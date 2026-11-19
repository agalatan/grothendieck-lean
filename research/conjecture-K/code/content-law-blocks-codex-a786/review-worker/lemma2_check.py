# Review of codex-a786's second content-law package (review worker of claude-b9ee, 16 Nov 2026).  N.
# Lemma 2 of PROOFS.md:  alpha^2 = E[E(P|P^2)^2/P^2] <= min(1, 2 sqrt(kappa)) for P = sum lam_j (T_j - 1), kappa = sum lam_j^4.
# Its proof:  g(x) = (p(x) - p(-x))/(p(x) + p(-x)),  s(x) = -e^{x^2/2} int_x^inf g(t) e^{-t^2/2} dt  (so s' - x s = g, |x s| <= 1, |s'| <= 2),
#             alpha^2 = E g(P) = E[s'(P) - P s(P)] = E[(1 - B) s'(P)],  B = sum lam_j^2 T_j.
# Checked here numerically: the two formulas for alpha^2, the identity alpha^2 = E[(1 - B) s'(P)], the bounds on s, and three bounds:
#   Lemma 2:               alpha^2 <= 2 sqrt(kappa);
#   a sharpening (review): alpha^2 <= sqrt(kappa)(1 + alpha), from E[(1-B) g(P)] <= sqrt(kappa) alpha and |x s| <= 1;
#   the Edgeworth size (2/3) s3^2 (review's guess of the first report, NOT proved).
# Spectra: equal eigenvalues (m = 1, 2, 4, 16, 64, 576) and two signed pairs.
import math
import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.special import gammaln
X, W = leggauss(16)
def comp(a, b, n):
    ed = np.linspace(a, b, n + 1)
    return (np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * X for i in range(n)]), np.concatenate([(ed[i + 1] - ed[i]) / 2 * W for i in range(n)]))

def equal(m):
    rt = math.sqrt(m)
    def p(x):
        g = m + rt * x; out = np.zeros_like(x); ok = g > 0
        out[ok] = rt * np.exp((m - 1) * np.log(g[ok]) - g[ok] - gammaln(m)); return out
    EB = lambda x: 1 + x / rt                                   # E[B | P = x]
    return p, EB, rt, 1.0 / m, 1.0 / rt, 'equal, m = %d' % m

def pair(l1, l2):
    """two eigenvalues, l1 > 0 > l2: P = l1 (T1 - 1) + l2 (T2 - 1); density and E[B | P] by integrating over T1."""
    a = -l2; c0 = l1 - a
    def both(x):
        x = np.asarray(x, float); f = np.zeros_like(x); gB = np.zeros_like(x)
        for i, xi in enumerate(x.ravel()):
            s = xi + c0; t0 = max(0.0, s / l1); t, w = comp(t0, t0 + 60.0 / (1 + l1 / a), 24)
            T2 = (l1 * t - s) / a; e = np.exp(-t - T2) / a
            f.ravel()[i] = w @ e; gB.ravel()[i] = w @ ((l1 * l1 * t + a * a * T2) * e)
        return f, gB
    cache = {}
    def p(x):
        key = x.tobytes()
        if key not in cache: cache[key] = both(x)
        return cache[key][0]
    def EB(x):
        f, gB = cache[x.tobytes()] if x.tobytes() in cache else both(x); return gB / np.maximum(f, 1e-300)
    return p, EB, abs(c0), l1 ** 4 + l2 ** 4, l1 ** 3 + l2 ** 3, 'pair (%.4f, %.4f)' % (l1, l2)

def run(spec):
    p, EB, kink, kappa, s3, label = spec
    # nodes on x > 0 with a break at the kink of the densities
    xs, ws = (np.concatenate(z) for z in zip(comp(0, kink, 40), comp(kink, kink + 6, 40), comp(kink + 6, kink + 46, 60)))
    pp, pm = p(xs), p(-xs); den = pp + pm; g = (pp - pm) / np.maximum(den, 1e-300)        # both densities underflow far out: g := 0 there
    alpha2 = float(ws @ ((pp - pm) ** 2 / np.maximum(den, 1e-300))); Eg = float(ws @ (g * (pp - pm))); mass = float(ws @ den)
    # s(x) = -int_0^inf g(x + y) exp(-x y - y^2/2) dy  for x >= 0 (stable); s even
    # (the y-panels are broken at x + y = kink, where g is not smooth)
    sx = np.empty_like(xs)
    for i, xi in enumerate(xs):
        if xi < kink: y, wy = (np.concatenate(z) for z in zip(comp(0, kink - xi, 12), comp(kink - xi, kink - xi + 2, 16), comp(kink - xi + 2, kink - xi + 13, 16)))
        else: y, wy = (np.concatenate(z) for z in zip(comp(0, 2, 16), comp(2, 13, 16)))
        xx = xi + y; p1, p2 = p(xx), p(-xx)
        gg = (p1 - p2) / np.maximum(p1 + p2, 1e-300)
        sx[i] = -float((gg * np.exp(-xi * y - y * y / 2)) @ wy)
    sp_ = xs * sx + g                                           # s'(x) for x > 0; s'(-x) = -s'(x) (s even)
    # E[(1 - B) s'(P)] = int_0^inf s'(x) [ (1 - E[B|x]) p(x) - (1 - E[B|-x]) p(-x) ] dx
    val = float(ws @ (sp_ * ((1 - EB(xs)) * pp - (1 - EB(-xs)) * pm)))
    alpha = math.sqrt(alpha2); lem = min(1.0, 2 * math.sqrt(kappa)); rk = math.sqrt(kappa); sharp = ((rk + math.sqrt(kappa + 4 * rk)) / 2) ** 2
    okk = abs(mass - 1) < 1e-8 and abs(Eg - alpha2) < 1e-9 and abs(val - alpha2) < 2e-7 and np.abs(xs * sx).max() <= 1 + 1e-9 and np.abs(sp_).max() <= 2 and alpha2 <= min(1.0, sharp) <= lem + 1e-12
    print('%-24s kappa %.5f | alpha^2 = %.8f = E g(P) (diff %.0e) = E[(1-B) s\'(P)] (diff %.0e) | sup|x s| %.3f, sup|s\'| %.3f | Lemma 2: %.4f; sharpened: %.4f; (2/3) s3^2 = %.5f | %s'
          % (label, kappa, alpha2, abs(Eg - alpha2), abs(val - alpha2), np.abs(xs * sx).max(), np.abs(sp_).max(), lem, min(1.0, sharp), 2 * s3 * s3 / 3, 'ok' if okk else 'FAIL'), flush=True)
    assert okk
    return alpha2

if __name__ == '__main__':
    for m in (1, 2, 4, 16, 64, 576): run(equal(m))
    run(pair(0.8, -0.6)); run(pair(12 / 13, -5 / 13))
    # the kappa thresholds of Corollary 3 with the sharpened sign bound (floating point; a suggestion, not a claim of the package)
    def theta(kappa, a2):
        return 2 / (3 * (4 + 12 * kappa)) * ((math.sqrt(17 * a2) + math.sqrt(24 * kappa)) ** 2 + 16 * kappa) + a2 / 3
    from scipy.optimize import brentq
    lem = lambda k: min(1.0, 2 * math.sqrt(k)); shp = lambda k: min(1.0, ((math.sqrt(k) + math.sqrt(k + 4 * math.sqrt(k))) / 2) ** 2)
    print('kappa needed for theta below the six targets (K, M, a^2 evaluated at kappa; equal to the package\'s (27) in the first line):')
    for name, fn in (('Lemma 2, alpha^2 <= 2 sqrt(kappa)', lem), ('sharpened, alpha^2 <= sqrt(kappa)(1 + alpha)', shp)):
        print('  %-46s ' % name + '  '.join('%.2f: 1/%.0f' % (tg, 1 / brentq(lambda k: theta(k, fn(k)) - tg, 1e-9, 1 / 3)) for tg in (0.37, 0.64, 1.33, 1.88, 2.5)))
    print('LEMMA 2 CHECKS PASSED')
