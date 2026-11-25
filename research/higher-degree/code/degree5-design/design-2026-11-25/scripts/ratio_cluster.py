#!/usr/bin/env python3
"""Largest sector-A (or B) content ratio ||c||^2/(delta Omhat) in the three-cluster family with the exact c = 4 bulk (N).
Model of ledger 4.30 / problem P5 (the evaluation follows checks/chk_p5.py of handoff/degree5-attack-2026-11-25, own code there):
q = sqrt(u) [X A + sigma sqrt(G) e^{i alpha}],  A = a(|X|^2 - 2)/sqrt 2 + sum_k m_k (S_k - c),  sigma^2 = s_R S1 S2 S3/c^3,
|X|^2 ~ Exp(1), S_k ~ Gamma(c), G ~ c Beta(1, c - 1) (the law of the bulk R_4 at c = 4: kappa = 8/5), a^2 + c sum |m_k|^2 + s_R = 1.
For c = 4 these are cubics of H_{2,1}(C^13); a value is a LOWER bound of the largest ratio.  The parameters (a^2, |m_k|, arg m_k, s_R)
are optimised by Nelder-Mead on a fixed Sobol sample (2^M1 points) and the result is re-evaluated on an independent sample (2^M2).
"possible": the law of |q|^2 satisfies the Rice family (R1), min_lam [E rho(lam^2 |q|^2) - lam u/e1] >= t_lo; a penalty keeps the
search inside the possible responses.
With CHIBINS (argument 11, e.g. "0:1.5,1.5:2.5,...") the maximisation is repeated inside each bin of chi = delta/u^2 (penalty), so
that the result is a table "largest ratio found among family members with chi in the bin" (the junta share a^2 moves chi up to 42).
c = 4: G = c Beta(1, c-1) is the exact law for the bulk R_4 (actual cubics).  c = 2 likewise (R_2).  For other c the same G is the
FLOOR law kappa = 2c/(c+1), which no bulk attains (ledger 4.30): the values are then an upper proxy of the family, not cubics.
usage: ratio_cluster.py PROF(.npz of prof2.py | band_row .json) SA,SB E1 TLO u1,u2,... OUT.json [sector A|B] [c] [M1] [M2] [CHIBINS]"""
import sys, json, math, time
import numpy as np
from scipy.interpolate import CubicSpline
from scipy.stats import qmc, gamma as gam, beta as bet
from scipy.special import ive
from scipy.optimize import minimize
from numpy.polynomial.laguerre import laggauss
pf = sys.argv[1]; sa, sb = [float(x) for x in sys.argv[2].split(',')]; E1 = float(sys.argv[3]); tlo = float(sys.argv[4]); us = [float(x) for x in sys.argv[5].split(',')]; outf = sys.argv[6]
sect = sys.argv[7] if len(sys.argv) > 7 else 'A'; c = int(sys.argv[8]) if len(sys.argv) > 8 else 4; M1 = int(sys.argv[9]) if len(sys.argv) > 9 else 15; M2 = int(sys.argv[10]) if len(sys.argv) > 10 else 19
BINS = [tuple(float(v) for v in b.split(':')) for b in sys.argv[11].split(',')] if len(sys.argv) > 11 else [(0.0, 1e9)]
if pf.endswith('.npz'):
    d = np.load(pf); S = d['S']; Gt = d['G' + sect] + (sa if sect == 'A' else sb) * d['G0']
else:
    d = json.load(open(pf)); S = np.array(d['S']); Gt = np.array(d['G' + sect]) + (sa if sect == 'A' else sb) * np.array(d['G0'])
G_ = CubicSpline(S, Gt); smax = S[-1]
def h(v):
    s = np.sqrt(np.maximum(v, 1e-18)); return G_(np.minimum(s, smax)) / s
tau, wt = laggauss(48); Rr2 = math.sqrt(math.pi) / 2
def rho_exact(x): return Rr2 * ((1 + x) * ive(0, x / 2) + x * ive(1, x / 2))
_sx = np.linspace(0, 80.0, 40001); _rt = rho_exact(_sx ** 2)
def rho(x):                                                   # table in sqrt x; beyond 80: sqrt x + 1/(4 sqrt x)
    s = np.sqrt(x); f = np.minimum(s, 79.999) * 500.0; i = f.astype(np.int64); f -= i      # uniform table, step 1/500: direct indexing (np.interp was 90 % of the run time)
    return np.where(s <= 79.999, _rt[i] * (1.0 - f) + _rt[i + 1] * f, s + 0.25 / np.maximum(s, 1.0))
LAMS = np.concatenate([np.linspace(0.1, 3.0, 30), np.linspace(3.2, 8.0, 13)])
def sample(m2, seed):
    U = qmc.Sobol(6, scramble=True, seed=seed).random_base2(m2)
    Rr = -np.log1p(-U[:, 0] * (1 - 1e-12)); Sk = [gam.ppf(U[:, 1 + k], c) for k in range(3)]; cosphi = np.cos(2 * np.pi * U[:, 4]); G = c * bet.ppf(U[:, 5], 1, c - 1)
    return Rr, Sk, cosphi, G
def evaluate(x, u, kp, smp, full=False):
    Rr, Sk, cosphi, G = smp; a2, m1, m2_, m3, g1, g2, g3, sR = np.abs(x[0]), np.abs(x[1]), np.abs(x[2]), np.abs(x[3]), x[4], x[5], x[6], np.abs(x[7])
    nrm = a2 + c * (m1 * m1 + m2_ * m2_ + m3 * m3) + sR; a = math.sqrt(a2 / nrm); sR = sR / nrm
    m = [mm / math.sqrt(nrm) * np.exp(1j * math.pi * g) for mm, g in zip((m1, m2_, m3), (g1, g2, g3))]
    A = a * (Rr - 2) / math.sqrt(2) + sum(mk * (s_ - c) for mk, s_ in zip(m, Sk)); absA = np.abs(A)
    sig2 = sR * Sk[0] * Sk[1] * Sk[2] / c ** 3; kappa = 2.0 * c / (c + 1)
    V = u * (Rr * absA ** 2 + sig2 * G + 2 * np.sqrt(Rr * sig2 * G) * absA * cosphi)
    cx = math.sqrt(u) * np.mean((Rr * A + (A / np.maximum(absA, 1e-12)) * np.sqrt(Rr * sig2 * G) * cosphi) * h(V))
    K = kp(np.minimum(np.sqrt(V), 8.0)); Om = 1.5 * np.mean(V * K * K) - 0.75 * np.mean(V * K) ** 2 / u
    delta = u * u * (np.mean(Rr ** 2 * absA ** 4 + 4 * Rr * absA ** 2 * sig2 + kappa * sig2 ** 2) - 2)
    ratio = abs(cx) ** 2 / (delta * Om)
    T = min(float(np.mean(rho(l * l * V))) - l * u / E1 for l in (LAMS if full else LAMS[::3]))
    if full: return dict(ratio=float(ratio), chi=float(delta / u ** 2), delta=float(delta), Omhat=float(Om), c2=float(abs(cx) ** 2), T_rice=T, possible=bool(T >= tlo), a2=float(a * a), m_abs=[float(abs(z)) for z in m], m_arg_pi=[float(np.angle(z) / math.pi) for z in m], sR=float(sR))
    return ratio, T, delta / u ** 2
X0 = [np.array([0.052, 0.138, 0.141, 0.180, -0.11, -0.15, 0.25, 0.663]), np.array([0.10, 0.15, 0.15, 0.15, 0.0, 0.3, -0.3, 0.5]), np.array([0.03, 0.2, 0.1, 0.1, 0.2, -0.2, 0.5, 0.75])]
out = []; s1 = sample(M1, 5); s2 = sample(M2, 11); XJ = np.array([0.6, 0.08, 0.08, 0.08, 0.0, 0.0, 0.0, 0.2])
for u in us:
    t0 = time.time(); sg = np.linspace(0, 8, 1601); kk = np.array([wt @ h(x * x + u * tau) for x in sg]); kp = CubicSpline(sg, (kk - h(sg * sg)) / u); prev = None
    for lo, hi in BINS:
        def obj(x):
            r, T, chi = evaluate(x, u, kp, s1); return -(r - 50.0 * max(0.0, tlo + 2e-4 - T) - 0.5 * max(0.0, lo - chi) - 0.5 * max(0.0, chi - hi))
        best = None
        for x0 in ([prev] if prev is not None else [X0[1]]) + [X0[0], XJ]:
            r = minimize(obj, x0, method='Nelder-Mead', options={'xatol': 3e-4, 'fatol': 3e-6, 'maxiter': 320})
            if best is None or r.fun < best.fun: best = r
        prev = best.x; rec = evaluate(best.x, u, kp, s2, full=True); rec0 = evaluate(X0[0], u, kp, s2, full=True)
        rec.update(u=u, bin=[lo, hi], in_bin=bool(lo - 0.05 <= rec['chi'] <= hi + 0.05), fit_value=float(-best.fun), stored_candidate=dict(ratio=rec0['ratio'], chi=rec0['chi'], possible=rec0['possible'], T_rice=rec0['T_rice']), secs=time.time() - t0); out.append(rec)
        print('u=%.5f sector %s c=%d chi-bin [%g, %g]: max ratio %.4f (fit %.4f) at chi %.2f%s Rice T %.4f vs t_lo %.4f: %s | stored c=4 candidate: %.4f at chi %.2f (%s) [%.0fs]' % (
            u, sect, c, lo, hi, rec['ratio'], rec['fit_value'], rec['chi'], '' if rec['in_bin'] else ' (OUT OF BIN)', rec['T_rice'], tlo, 'possible' if rec['possible'] else 'NOT possible', rec0['ratio'], rec0['chi'], 'possible' if rec0['possible'] else 'not possible', time.time() - t0), flush=True)
json.dump(dict(prof=pf, tilt=[sa, sb], e1=E1, tlo=tlo, sector=sect, c=c, M1=M1, M2=M2, bins=BINS, pts=out), open(outf, 'w'), indent=1)
