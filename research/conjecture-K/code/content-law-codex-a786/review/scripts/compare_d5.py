# Review of codex-a786's content-law package (worker of claude-b9ee, 16 Nov 2026).  N.
# (1) The family X(|Y|^2-1) (the package's P1 at m = 1) against the degree-5 study's own numbers (t4fam_<k>.log):
#     content/delta, Omhat, D/delta and the share of the allowance 4 mu kappa (D + V_sl), at u = 0.85 u* and u*.
# (2) Outside the package's class, for orientation only: the one-coordinate junta q = sqrt(u) X(|X|^2-2)/sqrt 2 (chi = 42),
#     the ratio c^2/(delta Omhat) across the band of energies, against the row targets of the question.
# usage (from the review folder): python3 -I -c "import sys; sys.path.insert(0,'scripts'); sys.argv=['compare_d5.py','data']; exec(open('scripts/compare_d5.py').read())"
import sys, json, math
import numpy as np
from scipy.interpolate import CubicSpline
from scipy.optimize import minimize_scalar
import content_ratio as CR
pdir = sys.argv[1]
MU = {'0.80': 0.36745, '0.82': 0.39973, '0.84': 0.43086, '0.845': 0.43846, '0.85': 0.44600, '0.855': 0.45345}      # pointwise margins used by the study's lanes
KAPPA = 0.82
TARGET = {'0.80': 0.37, '0.82': 0.64, '0.84': 1.33, '0.845': 1.88, '0.85': 2.5, '0.855': 3.7}
# study's log values: (content/delta, Omhat, D/delta, truth share) at u/u* = 0.85 and 1.00
REF_XY = {'0.80': [(0.01195, 0.1105, 0.1645, 0.060), (0.01011, 0.1115, 0.1478, 0.057)], '0.82': [(0.01380, 0.0926, 0.1815, 0.058), (0.01211, 0.0957, 0.1647, 0.056)],
          '0.84': [(0.01570, 0.0717, 0.2068, 0.053), (0.01437, 0.0762, 0.1899, 0.054)], '0.845': [(0.01613, 0.0659, 0.2152, 0.052), (0.01494, 0.0705, 0.1983, 0.052)],
          '0.85': [(0.01651, 0.0598, 0.2248, 0.050), (0.01549, 0.0645, 0.2080, 0.051)], '0.855': [(0.01680, 0.0535, 0.2360, 0.048), (0.01599, 0.0581, 0.2194, 0.049)]}
REF_J = {'0.80': [(0.01333, 0.1397, 0.0923, 0.119), (0.01140, 0.1450, 0.0815, 0.116)], '0.82': [(0.01536, 0.1111, 0.1056, 0.110), (0.01348, 0.1181, 0.0940, 0.109)],
         '0.84': [(0.01790, 0.0807, 0.1262, 0.100), (0.01619, 0.0879, 0.1137, 0.101)], '0.845': [(0.01863, 0.0729, 0.1334, 0.097), (0.01699, 0.0798, 0.1205, 0.098)],
         '0.85': [(0.01939, 0.0648, 0.1418, 0.093), (0.01786, 0.0715, 0.1286, 0.095)], '0.855': [(0.02019, 0.0568, 0.1518, 0.089), (0.01878, 0.0629, 0.1383, 0.091)]}
worst = 0.0
Tj, wj = CR.gl(np.concatenate([np.linspace(0, 2, 49), 2 + 58 * np.linspace(0, 1, 161)[1:] ** 1.5]), 10); wj = wj * np.exp(-Tj); wj /= wj.sum()
for tname, k in CR.ROWK.items():
    d = np.load('%s/prof_hp_%d.npz' % (pdir, k)); rec = json.loads(str(d['rec'])); S = d['S']; sig = float(d['sigma'])
    psp = CubicSpline(S, d['psi']); smax = S[-1]
    ps = lambda s: psp(np.minimum(s, smax)) + np.maximum(s - smax, 0.0) * psp(smax, 1)
    Tg, wg = CR.exp_geo(); wg = wg / wg.sum()
    B5 = lambda u: float(wg @ ps(np.sqrt(u * Tg)))
    kq = 1 / CR.E1 - (rec['bA'] ** 2 + rec['bB'] ** 2) / CR.ETA
    us = CR.ustar(S, d['psi'], rec); S5 = B5(us) - kq * us
    profs = {sec: CR.Prof(S, d[g] + tl * d['G0']) for sec, (g, tl) in CR.TILT.items()}
    P, wP = CR.gamma_nodes(1)
    print('=== t = %s (u* = %.6f, sigma^2 = %.6f, target %.2f)' % (tname, us, sig * sig, TARGET[tname]))
    for i, f in enumerate((0.85, 1.0)):
        u = f * us; c2 = 0.0; om = 0.0
        for sec, pr in profs.items():
            kp = CR.kprime(pr, u); tab = CR.a_tables(pr.h, kp, u); r = CR.evaluate(1, 1.0, None, u, tab); c2 += r['c'] ** 2; om += r['Omhat']
        Epsi = float((wP[:, None] * wg[None, :] * ps(np.sqrt(u * Tg)[None, :] * np.abs(P)[:, None])).sum())
        D = B5(u) - Epsi; Vsl = S5 - B5(u) + kq * u; delta = 16 * u * u; share = c2 / (4 * MU[tname] * KAPPA * (D + Vsl))
        ref = REF_XY[tname][i]; mine = (c2 / delta, om, D / delta, share)
        dev = max(abs(a - b) for a, b in zip(mine, ref)); worst = max(worst, max(abs(mine[0] - ref[0]) / 5e-6, abs(mine[1] - ref[1]) / 5e-5, abs(mine[2] - ref[2]) / 5e-5, abs(mine[3] - ref[3]) / 5e-4))
        print('  X(|Y|^2-1)  u = %.2f u*: content/delta %.5f (study %.5f)  Omhat %.4f (%.4f)  D/delta %.4f (%.4f)  share of 4 mu kappa (D+Vsl) %.3f (%.3f)' % (f, mine[0], ref[0], mine[1], ref[1], mine[2], ref[2], mine[3], ref[3]))
    # junta
    line = []
    for f in (0.3, 0.5, 0.7, 0.85, 1.0, 1.3):
        u = f * us; V = u * Tj * (Tj - 2) ** 2 / 2; delta = 42 * u * u; out = {}
        for sec, pr in profs.items():
            kp = CR.kprime(pr, u); kv = kp(V)
            c = math.sqrt(u) * float(wj @ (Tj * (Tj - 2) / math.sqrt(2) * pr.h(V))); EVk = float(wj @ (V * kv)); EVk2 = float(wj @ (V * kv * kv))
            out[sec] = (c, 1.5 * EVk2 - 0.75 * EVk ** 2 / u)
        ra, rb = out['A'][0] ** 2 / (delta * out['A'][1]), out['B'][0] ** 2 / (delta * out['B'][1])
        tot = ((out['A'][0] ** 2 + out['B'][0] ** 2) / delta, out['A'][1] + out['B'][1])
        line.append((f, ra, rb, tot))
        if f in (0.85, 1.0):
            ref = REF_J[tname][0 if f == 0.85 else 1]
            print('  junta       u = %.2f u*: content/delta %.5f (study %.5f)  Omhat %.4f (%.4f)   [the study reports T3 errors up to 7.5e-4 on the junta, from its 3-D rule]' % (f, tot[0], ref[0], tot[1], ref[1]))
    print('  junta (NOT in the package\'s class; chi = 42): ratio c^2/(delta Omhat), sector A / B, by u/u*:  ' + '  '.join('%.2f: %.3f/%.3f' % (f, ra, rb) for f, ra, rb, _ in line)
          + '   | u -> 0 limit 256/63 = 4.063')
print('X(|Y|^2-1): largest deviation from the study\'s printed values, in units of half a last printed digit: %.2f' % worst)
