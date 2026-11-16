# Review of codex-a786's third content-law package (review worker of claude-b9ee, 16 Nov 2026).  N (floating point) unless marked.
#
# A. The SHARP profile-free constant of a single shared block Q_{d,lam} (the theta* of K ledger 6.3.30):
#      theta*(Q_{d,lam}) = (I + 16 u)/(3 d L),   I = E[V m(V)^2],  m(V) = E[N/A | V],  V = A(S) tau,
#    against the constant of the package's proof before its rational bound, (E[N^2/A] + 16 u)/(3 d L), and the rational Theta_d.
#    p(v) = E_S[e^{-v/A}/A] is the density of V, n(v) = E_S[(N/A) e^{-v/A}/A], I = int v n^2/p dv.
#    d = 1 is X(|Y|^2 - 1): the value must be the 1.54731 of the first review (sharp_table.log), a validation of the method.
# B. The floor theta(E[Z | q, sign P]) of the tangent architecture at m = 5 (the question "13/10 without sign averaging?").
# C. (exact) the largest Theta_d / (16/(3(2d^2+d+1))) over d >= 2, and the second requirement b_d/(3d) <= Theta_d.
# D. (exact decimals -> floats) p_0, p_1, p_2 of PROOFS section 6 for the six rows.
# E. Q_1 with the row profiles through trace_blocks.py against the m = 1 block of multiblock.py (second review): two codes,
#    two formulas (Gamma radius / conditioning on P), same cubic X(|Y|^2 - 1).
# usage (from the review folder): python3 -I -B scripts/sharp_trace.py data package-copy/rows.json
import sys, json, math
from fractions import Fraction as Fr
import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.special import gammaln

def gl(edges, nq=8):
    x, w = leggauss(nq); ed = np.asarray(edges, float)
    return (np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(len(ed) - 1)]),
            np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(len(ed) - 1)]))

def theta_d(d):
    pol = Fr(d ** 4 - d ** 3 + 30 * d * d + 6 * d + 4, 6 * d * d * (2 * d * d + d + 1))
    return pol if d < 4 else min(pol, Fr(20 * d ** 3 - 51 * d * d + 28 * d - 4, 3 * d * (d - 2) * (d - 1) * (2 * d * d + d + 1)))

def sharp(d, lam=0.0, npan=480):
    smax = d + 14 * math.sqrt(d) + 34; singular = (d == 1 and lam == 0)
    if singular:                                   # A = (s - 1)^2 vanishes at s = 1: geometric panels on both sides
        geo = lambda top: np.concatenate([[0.0], top * 2.0 ** (-np.arange(160, -1, -1) / 4.0)])
        xl, wl = gl(geo(1.0), 10); xr, wr = gl(geo(smax - 1.0), 10); x = np.concatenate([-xl, xr]); s = 1 + x; w = np.concatenate([wl, wr])
    else:
        s, w = gl(np.concatenate([np.linspace(0, d, 41), (d + (smax - d) * np.linspace(0, 1, 97) ** 1.6)[1:]]), 8)
    w = w * np.exp((d - 1) * np.log(s) - s - gammaln(d))
    A = x * x if singular else (1 + lam) * s * s - 2 * s + d; u = d * d + lam * d * (d + 1)    # x = s - 1 kept exactly in the singular case
    L = 2 * d * ((2 * d * d + d + 1) + (4 * d * d + 6 * d + 2) * lam + (2 * d * d + 5 * d + 3) * lam * lam)
    N = (s - d) * (A - u) + s * (2 * (1 + lam) * s - 2)
    NA = s * s / x if singular else N / A; B = float(w @ (s ** 4)) if singular else float(w @ (N * N / A))       # N_1 = S^2 (S - 1)
    assert abs(w.sum() - 1) < 1e-10 and abs(w @ A - u) < 1e-9 * u and abs(w @ N - 4 * u) < 1e-8 * u and abs(w @ (A * A) - u * u - L) < 1e-8 * L
    tmax = (A.max() * 45.0) ** (1 / 3); ted = np.linspace(0, tmax, npan + 1)
    if singular: ted = np.concatenate([[0.0], ted[1] * 2.0 ** (-np.arange(80, 0, -1) / 2.0), ted[1:]])      # p(v) ~ v^(-1/2) at 0 when d = 1
    t, wt = gl(ted, 8); v = t ** 3; wv = 3 * t * t * wt
    I = mass = first = 0.0
    for i in range(0, len(v), 256):
        E = np.exp(-v[i:i + 256][:, None] / A[None, :]) / A[None, :]
        p = E @ w; n = E @ (w * NA); ww = wv[i:i + 256]; vv = v[i:i + 256]
        I += float(ww @ (vv * n * n / p)); mass += float(ww @ p); first += float(ww @ (vv * n))
    assert abs(mass - 1) < 2e-7 and abs(first - 4 * u) < 2e-6 * u, (d, lam, mass, first / (4 * u))   # int p = 1, E[tau N] = 4u
    assert I <= B * (1 + 1e-9)
    return dict(chi=2 * L / u ** 2, hv=32 * u / (3 * d * L), star=(I + 16 * u) / (3 * d * L), proof=(B + 16 * u) / (3 * d * L),
                theta=float(theta_d(d)) if d >= 1 else None, I=I, B=B, checks=(abs(mass - 1), abs(first / (4 * u) - 1)))

if __name__ == '__main__':
    pdir, rowsjson = sys.argv[1], sys.argv[2]
    print('A. sharp profile-free constants of single shared blocks')
    print('   d  lam |   chi   | h = v    | poly sup (deg k\' <= 5) | theta* (sharp) | proof, exact E[N^2/A] | Theta_d (rational) | Theta_d/theta* | checks')
    POLY = {(1, 0.0): None, (2, 0.0): 0.518476, (3, 0.0): 0.254043, (4, 0.0): 0.149404, (5, 0.0): 0.098127, (8, 0.0): 0.039846, (2, 1.0): 0.224619, (3, 4.0): 0.042273}
    for d, lam in ((1, 0.0), (2, 0.0), (3, 0.0), (4, 0.0), (5, 0.0), (8, 0.0), (16, 0.0), (2, 1.0), (3, 2.0), (3, 4.0)):
        r = sharp(d, lam); r2 = sharp(d, lam, npan=320); ps = POLY.get((d, lam))
        assert abs(r['star'] / r2['star'] - 1) < 2e-6, (d, lam, r['star'], r2['star'])
        assert r['hv'] <= r['star'] * (1 + 1e-9) <= r['proof'] * (1 + 1e-9) and r['proof'] <= r['theta'] * (1 + 1e-9)
        if ps: assert ps <= r['star'] * (1 + 1e-6)
        if d == 1: assert abs(r['star'] - 1.54731) < 2e-5 and abs(r['proof'] - 5 / 3) < 1e-9 and theta_d(1) == Fr(5, 3)
        if lam == 0: assert abs(r['hv'] - 16 / (3 * (2 * d * d + d + 1))) < 1e-12
        print('  %2d %4.1f | %7.4f | %.6f | %s | %.6f | %.6f | %.6f | %.3f | %.0e %.0e' % (d, lam, r['chi'], r['hv'], ('%.6f' % ps) if ps else '   --   ', r['star'], r['proof'], r['theta'], r['theta'] / r['star'], *r['checks']))
    print('   (d = 1 is X(|Y|^2 - 1): theta* = 1.54731 as in the first review; the trace argument gives exactly 5/3 there)')

    print('B. tangent architecture at m = 5, 6 (13/10 without sign averaging?)')
    import tangent_numbers as TN
    for m in (4, 5, 6):
        mu, beta, th, chk = TN.numbers(m); assert chk < 1e-7
        print('   m = %d: Bessel (5) %.5f | floor theta(E[Z | q, sign P]) %.5f | one tangent divergence (4.21) %.5f | sharp theta* %.5f' % (m, th['bessel'], th['sign'], th['oneN'], th['star']))

    print('C. exact: Theta_d against the lower bound 16/(3(2d^2+d+1)) of h = v, d = 2 .. 2000')
    best = max((theta_d(d) / Fr(16, 3 * (2 * d * d + d + 1)), d) for d in range(2, 2001))
    small = min((theta_d(d) / Fr(16, 3 * (2 * d * d + d + 1)), d) for d in range(2, 2001))
    print('   largest Theta_d/(h = v): %.4f at d = %d; smallest %.4f at d = %d; at d = 2000: %.4f (limit 5/4)' % (float(best[0]), best[1], float(small[0]), small[1], float(theta_d(2000) / Fr(16, 3 * (2 * 2000 ** 2 + 2000 + 1)))))
    # second requirement theta >= b_d/(3d): b_d <= 1 (all d >= 2) and b_d <= d(d+2)/((d-2)(d-1)^2) (d > 2)
    for d in range(2, 2001):
        bd = Fr(1) if d == 2 else min(Fr(1), Fr(d * (d + 2), (d - 2) * (d - 1) ** 2)); assert bd / (3 * d) <= theta_d(d), d
    print('   second requirement b_d/(3d) <= Theta_d with b_d <= min(1, d(d+2)/((d-2)(d-1)^2)): holds for d = 2 .. 2000; ratio (b-bound/(3d))/Theta_d = %.3f, %.3f, %.3f, %.3f at d = 2, 3, 10, 2000'
          % tuple(float((Fr(1) if d == 2 else min(Fr(1), Fr(d * (d + 2), (d - 2) * (d - 1) ** 2))) / (3 * d) / theta_d(d)) for d in (2, 3, 10, 2000)))

    print('D. the regularity constants of PROOFS section 6')
    for r in json.load(open(rowsjson)):
        l, be, nu = float(r['l']), float(r['beta']), float(r['nu5']); p0 = l - 2 * be + math.sqrt(3) * nu; p1 = be - math.sqrt(3) * nu; p2 = nu / math.sqrt(12)
        assert p0 > 0.5 and p1 > 0.1 and p2 > 0
        print('   t = %-5s p0 = %.4f (> 1/2)  p1 = %.4f (> 1/10)  p2 = %.5f (> 0)' % (r['t'], p0, p1, p2))

    print('E. Q_1 through trace_blocks.py against the m = 1 block of multiblock.py (second review: 0.1891/0.1628 at t = 0.80, 0.2493/0.2207 at t = 0.82, u = 0.5 u*)')
    import content_ratio as CR, multiblock as MB, trace_blocks as TB
    M = TB.Model('Q_1 = X(|Y|^2 - 1)', [(1.0, 1, 0.0)]); assert abs(M.chi - 16) < 1e-9 and abs(M.hv - 4 / 3) < 1e-9 and M.theta == Fr(5, 3)
    REF = {'0.80': (0.1891, 0.1628), '0.82': (0.2493, 0.2207)}
    for tname, ref in REF.items():
        dd = np.load('%s/prof_hp_%d.npz' % (pdir, CR.ROWK[tname])); rec = json.loads(str(dd['rec'])); S = dd['S']; us = CR.ustar(S, dd['psi'], rec); u = 0.5 * us; got = []
        for sec, (gname, tilt) in CR.TILT.items():
            pr = CR.Prof(S, dd[gname] + tilt * dd['G0']); tv = MB.tables(pr.h, CR.kprime(pr, u), u); r = M.evaluate(u, tv); got.append(r['ratio']); assert r['pairing_err'] < 1e-6 and r['ratio'] <= 5 / 3
        assert abs(got[0] - ref[0]) < 6e-5 and abs(got[1] - ref[1]) < 6e-5, (got, ref)
        print('   t = %s: %.4f/%.4f (trace code) against %.4f/%.4f (second review)' % (tname, got[0], got[1], ref[0], ref[1]))
    print('ALL CHECKS PASSED')
