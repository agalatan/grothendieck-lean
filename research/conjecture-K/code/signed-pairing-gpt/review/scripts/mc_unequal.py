#!/usr/bin/env python3
# Reviewer (N, Monte Carlo, fixed seed): a Hermitian factor with NINE unequal eigenvalues of both signs and
# kappa = tr A^4/(tr A^2)^2 <= 1/6, so that Theorem 4's second constant 13/10 is exercised away from the equal family:
#     A = diag(1, 1, 0.9, 0.9, -0.8, 0.8, 0.7, -0.7, 0.6),   q = sqrt(u) X (Y*AY - tr A)/sqrt(tr A^2).
# (a) exact moments against the sample; (b) E[N|q] = 0 and the sharp constant theta* by binned regression on |q|
# (bias-corrected); (c) the ratio ||c||^2/(delta Omega_hat) for the two tilted profiles of the six rows at u = 0.5, 0.85, 1 u*.
#   argv: <scripts dir> <content5 dir> <out json>
import sys, json, math
import numpy as np
sys.path.insert(0, sys.argv[1])
import siglib as L
C5 = sys.argv[2]
lam = np.array([1, 1, 0.9, 0.9, -0.8, 0.8, 0.7, -0.7, 0.6]); lam = lam / math.sqrt((lam ** 2).sum())
u0 = 1.0; s3 = (lam ** 3).sum(); s4 = (lam ** 4).sum(); kap = s4; zeta = s3 ** 2
Theta = (17 + 24 * kap - (22 + 16 * kap) ** 2 / (44 + 40 * kap) + 16 * zeta) / (6 + 18 * kap)
G = (33 + 217 * kap + 168 * kap ** 2) / (3 * (1 + 3 * kap) * (11 + 10 * kap))
print('kappa = %.5f (<= 1/6: %s), zeta = %.5f, chi = %.4f;  Theta(kappa, zeta) = %.5f <= G(kappa) = %.5f <= 13/10;  ratio at h(v) = v: 16 zeta/(3 + 9 kappa) = %.5f' % (kap, kap <= 1 / 6, zeta, 4 + 12 * kap, Theta, G, 16 * zeta / (3 + 9 * kap)))
rng = np.random.default_rng(20261116)
NS = 6_000_000; CH = 500_000
rs, sg, Zt, Nt = [], [], [], []
for i in range(NS // CH):
    S = rng.exponential(size=CH); Tm = rng.exponential(size=(CH, len(lam)))
    B = (Tm - 1) @ lam; C = Tm @ (lam ** 2)
    rs.append(np.sqrt(S) * np.abs(B)); sg.append(np.sqrt(S) * np.sign(B))
    Zt.append(np.sqrt(S) * np.sign(B) * (2 * S * C - 1)); Nt.append(np.sqrt(S) * np.sign(B) * (2 * B * B + 4 * C - 4 * S * C))
r = np.concatenate(rs); w1 = np.concatenate(sg); Z = np.concatenate(Zt); Nn = np.concatenate(Nt)
se = lambda x: x.std() / math.sqrt(len(x))
print('sample %d: E|q|^2 = %.5f (1), E|q|^4 - 2 = %.4f +- %.4f (delta = %.4f), <Z,q> = %.4f +- %.4f (4 s3 = %.4f), ||Z||^2 = %.3f +- %.3f (%.3f), ||N||^2 = %.3f +- %.3f (%.3f), <N,q> = %.4f +- %.4f (0)' % (
    NS, (r ** 2).mean(), (r ** 4).mean() - 2, se(r ** 4), 4 + 12 * kap, (Z * r).mean(), se(Z * r), 4 * s3, (Z ** 2).mean(), se(Z ** 2), 17 + 24 * kap, (Nn ** 2).mean(), se(Nn ** 2), 44 + 40 * kap, (Nn * r).mean(), se(Nn * r)))
# binned regression on r (quantile bins); unbiased estimate of sum_bins p_bin (E[Z|bin])^2:  mean^2 - var/n per bin
order = np.argsort(r); nb = 1500; n = NS // nb
def cond2(x):
    xb = x[order][:nb * n].reshape(nb, n); m = xb.mean(1); v = xb.var(1, ddof=1)
    return float((m * m - v / n).mean()), float((m * m).mean())
EZ2, EZ2raw = cond2(Z); EN2, EN2raw = cond2(Nn)
tstar = (2 / 3) * (EZ2 + (4 * s3) ** 2) / (4 + 12 * kap)
print('binned regression (%d bins): ||E[N|q]||^2 = %.4f (raw %.4f; of ||N||^2 = %.2f; should be 0)   ||E[Z|q]||^2 = %.4f (raw %.4f) <= ||Z*||^2 = %.4f' % (
    nb, EN2, EN2raw, 44 + 40 * kap, EZ2, EZ2raw, 17 + 24 * kap - (22 + 16 * kap) ** 2 / (44 + 40 * kap)))
print('sharp profile-free constant theta* = %.4f  <=  Theta = %.4f  <=  13/10' % (tstar, Theta))
assert tstar <= Theta
out = dict(kappa=kap, zeta=zeta, Theta=Theta, G=G, tstar=tstar, rows=[])
print('row profiles (MC; standard error of the ratio from the content estimate):')
for k, t in ((5, '0.80'), (7, '0.82'), (9, '0.84'), (10, '0.845'), (11, '0.85'), (12, '0.855')):
    rec, GA, GB, G0 = L.load_row('%s/out/prof_%d.npz' % (C5, k)); us = rec['sig'] ** 2
    line = []
    for fr in (0.1, 0.5, 0.85, 1.0):
        u = fr * us; best = (0, 0)
        for Gf in (lambda x: GA(x) + 0.4 * G0(x), lambda x: GB(x) + 0.3 * G0(x)):
            pr = L.Profile(Gf, u)
            # tabulate G and f1 on a fine grid of s = sqrt(u) r and interpolate (the sample is large)
            sgrid = np.concatenate([np.linspace(0, 1.5, 3001), np.linspace(1.5, max(6.5, math.sqrt(u) * r.max() * 1.001), 2001)[1:]])
            f1g = pr.f1(sgrid); Gg = Gf(sgrid)
            sp = math.sqrt(u) * r
            cs = w1 * np.interp(sp, sgrid, Gg); c = cs.mean(); cse = se(cs)
            f1 = np.interp(sp, sgrid, f1g)
            Om = 1.5 * (f1 * f1).mean() - 0.75 * (sp * f1).mean() ** 2 / u
            ratio = c * c / (u * u * (4 + 12 * kap) * Om)
            if ratio > best[0]: best = (ratio, 2 * abs(cse / c) * ratio)
        line.append((fr, best)); assert best[0] <= Theta
        out['rows'].append(dict(t=t, ufrac=fr, ratio=best[0], se=best[1]))
    print('  row %-5s ' % t + '   '.join('u = %g u*: %.4f +- %.4f' % (fr, b[0], b[1]) for fr, b in line), flush=True)
json.dump(out, open(sys.argv[3], 'w'), indent=1)
