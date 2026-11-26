# [copy from degree5-cert/{gate/code,share/code,capgate}; claude-b9ee worker d5newcap, 16 Nov 2026: module path made local,
#  game constants from the environment D5_E1, D5_ETA (d5eng.py); nothing else changed]
"""crude_h.py -- the design note's elementary pointwise block majorant for the h-side quintic first-order sectors on the
capped rows: |a + g| <= |a| + Re(conj(g) ph a) + |g|^2/(2|a|) gives curvature <= lambda_max(sum_pm E_z[e e^*/(2|A_pm|)]),
against the cost p2 = 1/0.0779, max over s in [0, 1.2].  If < 1, the h-side first-order sectors are pure cost by an
elementary argument (P given the integral).  N."""
import sys, os, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, d5eng as D
p2 = 1 / D.ETA
z, wz = D.zgrid(half=False); T = np.abs(z) ** 2
rows = [json.loads(l) for l in open(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'rows5.lines')).read().split('\n') if l.strip()]
E = np.array([D.e_ab(1, 0, z), D.e_ab(0, 1, z), D.e_ab(2, 1, z), D.e_ab(1, 2, z), D.e_ab(3, 0, z)])
out = []
for k, rec in enumerate(rows, 1):
    base = z * (rec['l'] + rec['beta'] * (T - 2)) + rec['nu5'] * D.e_ab(3, 2, z)
    Dz = 1 - rec['bA'] * D.e_ab(1, 1, z) - rec['bB'] * D.e_ab(2, 0, z)
    worst = (0, None)
    for s in np.linspace(0, 1.2, 25):
        M = np.zeros((5, 5), complex)
        for A in (base + s * Dz, base - s * Dz):
            M += (E * (wz / (2 * np.abs(A)))[None, :]) @ np.conj(E).T
        lam = float(np.linalg.eigvalsh((M + np.conj(M).T) / 2)[-1]) / p2
        if lam > worst[0]: worst = (lam, float(s))
    out.append(dict(t=rec['t'], crude=worst[0], at_s=worst[1]))
    print('t=%.3f elementary h-block majorant / p2: max %.3f at s = %.2f' % (rec['t'], worst[0], worst[1]))
json.dump(out, open(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'out', 'crude_h.json'), 'w'), indent=1)
