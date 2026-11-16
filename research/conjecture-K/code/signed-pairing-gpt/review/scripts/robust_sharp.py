#!/usr/bin/env python3
# Reviewer (N): robustness of the sharp constants theta* reported in REVIEW.md.
#  (a) kernel quadrature with other grids;  (b) an independent Monte Carlo estimate by binned regression on |q|
#      (fixed seed; unbiased bin estimator mean^2 - var/n, bin edges from a pilot sample, 8 batches), for X(|Y|^2-1), the equal family m = 22, the limit model at
#      rho = 0.2 and 0.6, and the junta.
import sys, math
import numpy as np
sys.path.insert(0, sys.argv[1])
import siglib as L
rng = np.random.default_rng(7)
def binned(r, Z, nb=1500, batches=8, pilot=1_000_000):
    """sum over bins of p_bin (E[Z|bin])^2 with the unbiased bin estimator mean^2 - var/n.  The bins are intervals of
    r whose edges are fixed from a PILOT part of the sample (equal shares of sum Z^2 there: the laws are heavy-tailed
    and equal-count bins are too coarse in the tail); the estimate uses the rest of the sample, so the edges do not
    depend on the values averaged.  What is estimated is a lower bound of ||E[Z|q]||^2 (Jensen inside a bin).
    Returned: mean and standard error over independent batches (the tails are heavy: read the error as indicative)."""
    rp, zp_ = r[:pilot], Z[:pilot]; order = np.argsort(rp); cum = np.cumsum(zp_[order] ** 2)
    idx = np.unique(np.searchsorted(cum, np.linspace(0, cum[-1], nb + 1)[1:-1]))
    edges = np.unique(rp[order][np.minimum(idx, pilot - 1)])
    est = []
    for rb, zb in zip(np.array_split(r[pilot:], batches), np.array_split(Z[pilot:], batches)):
        which = np.searchsorted(edges, rb); n = len(rb); nbin = len(edges) + 1
        cnt = np.bincount(which, minlength=nbin).astype(float); s1 = np.bincount(which, weights=zb, minlength=nbin); s2 = np.bincount(which, weights=zb * zb, minlength=nbin)
        ok = cnt >= 2
        mean = s1[ok] / cnt[ok]; var = (s2[ok] - cnt[ok] * mean ** 2) / (cnt[ok] - 1)
        est.append(float(((cnt[ok] / n) * (mean ** 2 - var / cnt[ok])).sum()))
    est = np.array(est)
    return float(est.mean()), float(est.std(ddof=1) / math.sqrt(batches))
NS = 9_000_000
print('(a) other quadrature grids')
for m in (1, 22):
    vals = []
    for rmax, fine in ((90.0, 0.05), (60.0, 0.05), (120.0, 0.025)):
        r, wr = L.r_grid(rmax)
        law = L.EqualLaw(m)
        if fine != 0.05:
            sm = math.sqrt(m); law.b, w = L.refined_nodes(-sm, 70.0 / sm + 25.0, [0.0], fine=fine)
            from scipy.special import gammaln
            R = m + sm * law.b; law.wf = w * sm * np.exp((m - 1) * np.log(R) - R - gammaln(m)); law.Cbar = 1 + law.b / sm
        p, w1, zp, _ = L.hermitian_kernels(law, r); pos = p > 1e-300
        vals.append((2 / 3) * (float(wr[pos] @ (zp[pos] ** 2 / p[pos])) + float(wr @ (r * zp)) ** 2) / (4 + 12 / m))
    print('   equal m = %d: theta* = %s' % (m, ', '.join('%.6f' % v for v in vals)))
for rho in (0.2, 0.6):
    vals = []
    for fine, smax in ((0.1, 240 * rho + 12), (0.05, 300 * rho + 20)):
        s, ws = L.s_grid(smax); p, w1, zp = L.limit_kernels(rho, s, L.t_grid(40.0 if fine == 0.1 else 48.0, fine)); pos = p > 1e-300
        vals.append((float(ws[pos] @ (zp[pos] ** 2 / p[pos])) + 1024 * rho * rho / (1 + 2 * rho * rho)) / 252)
    print('   limit model rho = %.1f: theta* = %s' % (rho, ', '.join('%.6f' % v for v in vals)))
print('(b) Monte Carlo, %d samples, binned regression' % NS)
for m, ref in ((1, 1.54731), (22, 0.30993)):
    S = rng.exponential(size=NS); R = rng.gamma(m, size=NS); B = (R - m) / math.sqrt(m); C = R / m
    r = np.sqrt(S) * np.abs(B); Z = np.sqrt(S) * np.sign(B) * (2 * S * C - 1)
    e, se = binned(r, Z)
    ts = (2 / 3) * (e + 16 / m) / (4 + 12 / m)
    print('   equal m = %2d: ||E[Z|q]||^2 = %.4f +- %.4f  ->  theta* = %.4f +- %.4f   (quadrature %.5f)' % (m, e, se, ts, (2 / 3) * se / (4 + 12 / m), ref))
for rho, ref in ((0.2, 1.16951), (0.6, 3.28195)):
    T = rng.exponential(size=NS); W = (rng.standard_normal(NS) + 1j * rng.standard_normal(NS)) / math.sqrt(2)
    X = np.sqrt(T)                                            # arg X = 0 by rotation invariance
    Q = rho * X * (T - 2) + W; C0 = X * (3 * T * T - 2 * T - 2)
    Z = np.real(C0 * np.conj(Q / np.abs(Q)))
    e, se = binned(np.abs(Q), Z)
    ts = (e + 1024 * rho * rho / (1 + 2 * rho * rho)) / 252
    print('   limit model rho = %.1f: ||E[C_0|Q]||^2 = %.2f +- %.2f  ->  theta* = %.4f +- %.4f   (quadrature %.5f)' % (rho, e, se, ts, se / 252, ref))
T = rng.exponential(size=NS); r = np.sqrt(T) * np.abs(T - 2); Z = np.sqrt(T) * (3 * T * T - 2 * T - 2) * np.sign(T - 2)
e, se = binned(r, Z)
print('   junta: ||E[C_0|p]||^2 = %.2f +- %.2f  ->  theta* = %.4f +- %.4f   (quadrature 4.99978; h = v gives 256/63 = 4.0635)' % (e, se, (e + 512) / 252, se / 252))
