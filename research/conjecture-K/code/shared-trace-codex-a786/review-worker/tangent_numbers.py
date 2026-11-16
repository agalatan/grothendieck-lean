# Review of codex-a786's third content-law package (review worker of claude-b9ee, 16 Nov 2026).  N (floating point).
# TANGENT_OBSTRUCTION.md for q = X P_m (u = 1, delta = 4 + 12/m), Z = X(2 S C - 1), C = 1 + P/sqrt m, S = |X|^2.
# The "law-norm Cauchy-Schwarz" certificate of a representative R is theta(R) = (2/(3 delta)) (||R||^2 + |<R, q>|^2).
# Here: five numbers per m.
#   none    = theta(Z): no control at all,                    ||Z||^2 = 17 + 24/m;
#   one N   = the constant of the single tangent divergence of the signed-pairing package (higher-degree ledger 4.21),
#             (17 + 24k - (22 + 16k)^2/(44 + 40k) + 16k)/(6 + 18k), k = 1/m;
#   sign    = theta(E[Z | q, sign P]): a lower bound for EVERY tangent control, because the closure of tangent divergences
#             is orthogonal to all of L^2(sigma(q, sign P)) (both q and F = q sign P are constant along tangent fields);
#   Bessel  = the package's lower bound (5): (32/m + 9 mu^2/(1 - beta^2))/(6 + 18/m), which projects on span{q, F} only;
#   star    = theta(E[Z | q]): the sharp constant over all profiles (first review, 4.6), reached only by averaging the two sign branches.
# Expected: star <= sign, Bessel <= sign <= one N <= none, Bessel >= 6/e^2.
# W = P^2 S; n_+-(w) = int_{+-p>0} f(p) e^{-w/p^2} (w/p^3)(2 w C(p)/p^2 - 1) dp, g_+-(w) = int_{+-p>0} f(p) e^{-w/p^2}/p^2 dp;
# ||E[Z | q, sign]||^2 = sum_+- int n_+-^2/(w g_+-) dw,   ||E[Z | q]||^2 = int (n_+ + n_-)^2/(w (g_+ + g_-)) dw.
import math
import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.special import gammaln

def gl(edges, nq=10):
    x, w = leggauss(nq); ed = np.asarray(edges, float)
    return (np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(len(ed) - 1)]),
            np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(len(ed) - 1)]))

def numbers(m, nw=3600):
    gauss = m is None
    geo = lambda top: np.concatenate([[0.0], top * 2.0 ** (-np.arange(200, -1, -1) / 4.0)])
    if gauss:
        pp, wp = gl(geo(14.0)); pn, wn = pp, wp
        dp = np.exp(-pp * pp / 2) / math.sqrt(2 * math.pi); dn = dp; Cp = np.ones_like(pp); Cn = Cp; rt = None; kap = 0.0
    else:
        rt = math.sqrt(m); pmax = 14 + 34 / rt; kap = 1.0 / m
        pp, wp = gl(geo(pmax)); pn, wn = gl(geo(rt))
        dens = lambda p: rt * np.exp((m - 1) * np.log(m + rt * p) - (m + rt * p) - gammaln(m))
        dp = dens(pp); dn = dens(-pn); Cp = 1 + pp / rt; Cn = 1 - pn / rt
    mu = float(wp @ (dp * pp) + wn @ (dn * pn)); beta = float(wp @ (dp * pp * pp) - wn @ (dn * pn * pn)); mass = float(wp @ dp + wn @ dn)
    xs = np.linspace(math.log(1e-20), math.log(4e5), nw); ws = np.exp(xs)
    out = {}
    for name, p, wd, C in (('+', pp, wp * dp, Cp), ('-', -pn, wn * dn, Cn)):
        n_ = np.empty(nw); g_ = np.empty(nw)
        for i in range(0, nw, 200):
            W = ws[i:i + 200][:, None]; e = np.exp(-W / (p * p)[None, :])
            n_[i:i + 200] = (e * (W / p[None, :] ** 3) * (2 * W * C[None, :] / (p * p)[None, :] - 1)) @ wd
            g_[i:i + 200] = (e / (p * p)[None, :]) @ wd
        out[name] = (n_, g_)
    dx = xs[1] - xs[0]; tr = lambda y: float(dx * (y.sum() - 0.5 * (y[0] + y[-1])))
    q2 = lambda n_, g_: tr(n_ * n_ / np.maximum(g_, 1e-300) * (g_ > 1e-280))
    (np_, gp_), (nm_, gm_) = out['+'], out['-']
    Zsign = q2(np_, gp_) + q2(nm_, gm_); Zstar = q2(np_ + nm_, gp_ + gm_)
    ZqInner = tr((np_ + nm_) * ws)                                  # <Z, q> = 4/sqrt m
    den = 3 * (4 + 12 * kap); k = kap
    th = dict(none=2 * (17 + 24 * k + 16 * k) / den, oneN=(17 + 24 * k - (22 + 16 * k) ** 2 / (44 + 40 * k) + 16 * k) / (6 + 18 * k),
              sign=2 * (Zsign + 16 * k) / den, star=2 * (Zstar + 16 * k) / den, bessel=(32 * k + 9 * mu * mu / (1 - beta * beta)) / (6 + 18 * k))
    chk = max(abs(mass - 1), abs(tr((gp_ + gm_) * ws) - 1), abs(ZqInner - (0.0 if gauss else 4 / rt)))
    return mu, beta, th, chk

if __name__ == '__main__':
    print('6/e^2 = %.6f, 3/pi = %.6f' % (6 / math.e ** 2, 3 / math.pi))
    print('   m  |  mu_m = E|P|   closed form   | beta_m = E[P|P|] | Bessel (5) | sign (lower bound for all tangent controls) | one N (4.21) | none   | star (sharp, both branches averaged) | checks')
    for m in (1, 2, 3, 4, 6, 8, 12, 21, 22, 64, 256, None):
        mu, beta, th, chk = numbers(m)
        closed = math.sqrt(2 / math.pi) if m is None else 2 * math.exp((m - 0.5) * math.log(m) - m - gammaln(m))
        ok = (abs(mu - closed) < 1e-9 and chk < 1e-7 and th['bessel'] >= 6 / math.e ** 2 and th['bessel'] <= th['sign'] * (1 + 1e-9) and th['star'] <= th['sign'] * (1 + 1e-9)
              and th['sign'] <= th['oneN'] * (1 + 1e-9) and th['oneN'] <= th['none'] * (1 + 1e-12))
        print('%5s | %.8f  %.8f | %.6f | %.5f | %.5f | %.5f | %.4f | %.5f | %.0e %s' % ('inf' if m is None else m, mu, closed, beta, th['bessel'], th['sign'], th['oneN'], th['none'], th['star'], chk, 'ok' if ok else 'FAIL'))
        assert ok
    print('ORDER  star <= sign,  6/e^2 <= Bessel <= sign <= one N <= none  HOLDS FOR EVERY m LISTED')
