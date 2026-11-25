#!/usr/bin/env python3
"""A/B secant margin of a tuned degree-5 row at finite amplitude (N: floating point; searches give UPPER bounds of infima).
Definitions as in problems/P2-ab-secant-margin.md (handoff/degree5-attack-2026-11-25): for w = s >= 0, rho = (rho_A, rho_B),
  Y = L'(z) + s (1 - bA e11) - bB s e20,  d = (e11 + sA) rho_A + e20 conj(rho_B) + sB rho_B,
  Rem = 2 E[|Y + d| - |Y| - Re(d conj ph Y)],  cost = p1 |rho|^2 - |sA rho_A + sB rho_B|^2,  m = cost - Rem.
Output per row: mu0 = min_s lam_min(C - M(s)) (second order), the table mu(s, tau) = min over directions of m/tau^2 at
|rho| = tau, env(tau) = min_s, mu_glob = min of everything (after a free polish), b = max_tau (mu0 - env(tau))/tau.
usage: margin_scan.py ROWS.lines t OUT.json [sA,sB] [E1]      (one row; one process)"""
import sys, os, json, math, time
import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.optimize import minimize
FAST = os.environ.get('MARGIN_FAST', '1') == '1'       # FAST: the grids of checks/chk_sec6.py (72 x 8 x 256 nodes), s step 0.125 refined near the minimum
def zgrid(npan=(72 if FAST else 80), nq=8, nth=(256 if FAST else 320), R=6.6):
    x, w = leggauss(nq); ed = np.linspace(0, R, npan + 1)
    r = np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(npan)])
    wr = np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(npan)]) * 2 * r * np.exp(-r * r)
    th = (np.arange(nth) + 0.5) * 2 * np.pi / nth
    Rm, TH = np.meshgrid(r, th, indexing='ij'); W = (wr[:, None] * np.ones(nth)[None, :] / nth).ravel()
    return (Rm * np.exp(1j * TH)).ravel(), W / W.sum()
rowsf, t, outf = sys.argv[1], float(sys.argv[2]), sys.argv[3]
sa, tb = [float(x) for x in sys.argv[4].split(',')] if len(sys.argv) > 4 else (0.4, 0.3)
E1 = float(sys.argv[5]) if len(sys.argv) > 5 else 0.78
rec = [r for r in (json.loads(l) for l in open(rowsf) if l.strip()) if abs(r['t'] - t) < 1e-9][0]
p1 = 1 / E1; z, w = zgrid(); T = np.abs(z) ** 2
e11 = T - 1; e20 = z * z / math.sqrt(2); e32 = z * (T * T - 6 * T + 6) / math.sqrt(12)
B = z * (rec['l'] + rec['beta'] * (T - 2)) + rec['nu5'] * e32; Dz = 1 - rec['bA'] * e11 - rec['bB'] * e20
C = np.diag([p1 - sa ** 2] * 2 + [p1 - tb ** 2] * 2); C[0, 2] = C[2, 0] = C[1, 3] = C[3, 1] = -sa * tb
Bm = np.array([e11 + sa, 1j * (e11 + sa), e20 + tb, -1j * e20 + 1j * tb])
def base(s):
    Y = B + s * Dz; aY = np.abs(Y); return Y, aY, np.conj(Y / aY)
def Rem(bs, x):
    Y, aY, cph = bs; d = (e11 + sa) * (x[0] + 1j * x[1]) + e20 * (x[2] - 1j * x[3]) + tb * (x[2] + 1j * x[3])
    return 2 * ((np.abs(Y + d) - aY - np.real(d * cph)) @ w)
def M(s):
    Mm = np.zeros((4, 4))
    for A, sg in ((B + s * Dz, 1.0), (B - s * Dz, -1.0)):
        a = np.abs(A); Im_ = np.imag(sg * Bm * np.conj(A / a)[None, :]); Mm += (Im_ * (w / (2 * a))[None, :]) @ Im_.T
    return (Mm + Mm.T) / 2
T0 = time.time()
S2 = np.arange(0, 3.0001, 0.025); ev2 = [float(np.linalg.eigvalsh(C - M(s))[0]) for s in S2]
i0 = int(np.argmin(ev2)); mu0 = ev2[i0]
SS = np.arange(0, 1.7501, 0.05); TAUS = [0.02, 0.03, 0.045, 0.06, 0.08, 0.1, 0.125, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.6, 0.8, 1.0]
if FAST: SS = np.array(sorted(set(np.round(np.arange(0, 1.6251, 0.125), 4)) | {0.7, 0.8, 0.95, 1.05})); TAUS = [0.03, 0.06, 0.1, 0.15, 0.2, 0.3, 0.4, 0.5, 0.6, 0.8, 1.0]
tab = []; best = (9, None)
al = np.array([0.74, 0.02, 0.67, 0.02])
for s in SS:
    bs = base(s); evs, V = np.linalg.eigh(C - M(s)); row = []; prev = None
    for tau in TAUS:
        def f(v):
            x = v / np.linalg.norm(v) * tau; return (x @ C @ x - Rem(bs, x)) / (tau * tau)
        starts = [V[:, 0], al] + ([prev] if prev is not None else [-al])
        rs = [minimize(f, x0, method='Nelder-Mead', options={'xatol': 2e-3, 'fatol': 2e-5, 'maxiter': (80 if FAST else 90)}) for x0 in starts]
        r = min(rs, key=lambda r_: r_.fun); prev = r.x / np.linalg.norm(r.x); row.append(float(r.fun))
        if r.fun < best[0]: best = (float(r.fun), (float(s), tau, (prev * tau).tolist()))
    tab.append(dict(s=float(s), second_order=float(evs[0]), m=row))
    print('s=%.2f 2nd %.4f | ' % (s, evs[0]) + ' '.join('%.3f' % v for v in row), flush=True)
# free polish of the global minimum over (s, rho)
s_, tau_, x_ = best[1]
def neg(v):
    s = abs(v[0]); x = v[1:]; return (x @ C @ x - Rem(base(s), x)) / (x @ x)
rp = minimize(neg, np.concatenate([[s_], x_]), method='Nelder-Mead', options={'xatol': 1e-4, 'fatol': 1e-7, 'maxiter': 500})
mu_glob = min(best[0], float(rp.fun))
env = [min(r['m'][j] for r in tab) for j in range(len(TAUS))]
bfit = max((mu0 - e) / tau for e, tau in zip(env, TAUS) if tau >= 0.03)
out = dict(t=t, row={k: rec[k] for k in ('l', 'beta', 'bA', 'bB', 'nu5')}, tilt=[sa, tb], e1=E1, mu0=mu0, mu0_at_s=float(S2[i0]), mu_s0=ev2[0],
           second_order=dict(s=S2.tolist(), lam_min=ev2), taus=TAUS, env=env, table=tab, mu_glob=mu_glob,
           glob_at=dict(s=abs(float(rp.x[0])), rho=[float(v) for v in rp.x[1:]], norm=float(np.linalg.norm(rp.x[1:]))), b_fit=bfit,
           grid=('polar 72x8x256' if FAST else 'polar 80x8x320'), secs=time.time() - T0)
json.dump(out, open(outf, 'w'), indent=1)
print('row %.3f tilt (%.2f, %.2f): mu0 %.4f (at s=%.3f; s=0: %.4f) | mu_glob <= %.4f at s=%.3f |rho|=%.3f | b_fit %.3f | env: %s (%.0fs)' % (
    t, sa, tb, mu0, S2[i0], ev2[0], mu_glob, out['glob_at']['s'], out['glob_at']['norm'], bfit, ' '.join('%.3f' % e for e in env), time.time() - T0), flush=True)
