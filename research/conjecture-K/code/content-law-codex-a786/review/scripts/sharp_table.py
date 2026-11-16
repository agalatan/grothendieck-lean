# Review of codex-a786's content-law package (worker of claude-b9ee, 16 Nov 2026).  N (floating point).
# The sharp profile-free constant on P1 (q = sqrt(u) X P_m), for m = 1..24:
#   theta_*(m) = sup over admissible h of c_X[h]^2/(delta Omhat[h]) = (2/3)(E_mu[E_mu[d | V]^2] + 16/m)/(4 + 12/m)
# (duality in the package's (9), with the conditional expectation taken given V instead of (R, S)); same code as part C of
# exact_checks.py.  Against: the value 16/(3(m+3)) of h(v) = v, the package's (17) with the exact sign bias, and 77/(9(m+3)).
import math
import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.special import gammaln
from scipy.integrate import quad
def gl(edges, nq=10):
    x, w = leggauss(nq); ed = np.asarray(edges, float)
    return (np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(len(ed) - 1)]),
            np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(len(ed) - 1)]))
def sharp(mm, nw=3600):
    rt = math.sqrt(mm); pmax = 14 + 34 / rt
    geo = lambda top: np.concatenate([[0.0], top * 2.0 ** (-np.arange(200, -1, -1) / 4.0)])
    pp, wp = gl(geo(pmax)); pn, wn = gl(geo(rt))
    p = np.concatenate([pp, -pn]); w = np.concatenate([wp, wn]); g = mm + rt * p
    dens = rt * np.exp((mm - 1) * np.log(g) - g - gammaln(mm)); wd = w * dens; B = 1 + p / rt
    xs = np.linspace(math.log(1e-20), math.log(4e5), nw); ws = np.exp(xs); n_ = np.empty(nw); gW = np.empty(nw)
    for i in range(0, nw, 200):
        W = ws[i:i + 200][:, None]; e = np.exp(-W / (p * p)[None, :])
        n_[i:i + 200] = (e * (W / p[None, :] ** 3) * (2 * W * B[None, :] / (p * p)[None, :] - 1)) @ wd
        gW[i:i + 200] = (e / (p * p)[None, :]) @ wd
    dx = xs[1] - xs[0]; tr = lambda y: float(dx * (y.sum() - 0.5 * (y[0] + y[-1])))
    # sign bias alpha_m^2 with the same nodes: sum over the positive nodes of (f(p) - f(-p))^2/(f(p) + f(-p))
    fpos = rt * np.exp((mm - 1) * np.log(mm + rt * pp) - (mm + rt * pp) - gammaln(mm))
    gneg = mm - rt * pp; fneg = np.where(gneg > 0, rt * np.exp((mm - 1) * np.log(np.maximum(gneg, 1e-300)) - gneg - gammaln(mm)), 0.0)
    return tr(n_ * n_ / np.maximum(gW, 1e-300) * (gW > 1e-280)), max(abs(tr(gW * ws) - 1), abs(tr(gW * ws * ws) - 1), abs(tr(n_ * ws) * rt / 4 - 1)), fpos, fneg, pp, wp
def alpha2(mm):
    rt = math.sqrt(mm)
    f = lambda p: rt * math.exp((mm - 1) * math.log(mm + rt * p) - (mm + rt * p) - gammaln(mm)) if mm + rt * p > 0 else 0.0
    a = quad(lambda p: (f(p) - f(-p)) ** 2 / (f(p) + f(-p)), 0, rt, epsabs=1e-13, epsrel=1e-13, limit=400)[0]
    b = quad(f, rt, rt + 60, epsabs=1e-13, epsrel=1e-13, limit=400)[0]
    return a + b
TARGETS = [('0.80', 0.37), ('0.82', 0.64), ('0.84', 1.33), ('0.845', 1.88), ('0.85', 2.5), ('0.855', 3.7)]
print('  m | h=v: 16/(3(m+3)) | sharp theta_* | (17), exact alpha | 77/(9(m+3)) | theta_*/(h=v) | proved/theta_* | alpha_m^2 | checks')
tab = {}
for mm in range(1, 25):
    Ed2, chk, *_ = sharp(mm); den = 3 * (4 + 12 / mm); al = alpha2(mm)
    ths = 2 * (Ed2 + 16 / mm) / den; th17 = 2 * (17 * al + 40 / mm) / den; lo = 16 / (3 * (mm + 3)); pr = 77 / (9 * (mm + 3)); tab[mm] = (lo, ths, th17, pr)
    assert lo <= ths <= th17 <= pr and chk < 1e-6
    print(' %2d | %.5f | %.5f | %.5f | %.5f | %.3f | %.3f | %.6f | %.0e' % (mm, lo, ths, th17, pr, ths / lo, pr / ths, al, chk))
print()
print('Row/rank pairs (rows of the question; m from 1) by what could cover them, at EVERY energy and for EVERY admissible profile:')
tot = [0, 0, 0, 0]
for t, tg in TARGETS:
    a = [m for m in tab if tab[m][3] < tg]; b = [m for m in tab if tab[m][2] < tg <= tab[m][3]]; c = [m for m in tab if tab[m][1] < tg <= tab[m][2]]
    d = [m for m in tab if tab[m][0] < tg <= tab[m][1]]; e = [m for m in tab if tg <= tab[m][0]]
    tot[0] += len(b); tot[1] += len(c); tot[2] += len(d); tot[3] += len(e)
    print(' t=%-5s target %.2f: proved by the package: m >= %s | (17) with the exact alpha_m would add m in %s | the sharp constant would add m in %s | above the sharp constant (profile or band needed) m in %s | of these, already h(v) = v fails: m in %s'
          % (t, tg, min(a) if a else '-', b, c, d + e, e))
print('totals over the 34 pairs left open by P1: (17) exact alpha: %d; sharp constant: %d more; need the profile or the band: %d (of which %d by h(v) = v alone)' % (tot[0], tot[1], tot[2] + tot[3], tot[3]))
