# [copy from degree5-cert/{gate/code,share/code,capgate}; claude-b9ee worker d5newcap, 16 Nov 2026: module path made local,
#  game constants from the environment D5_E1, D5_ETA (d5eng.py); nothing else changed]
# Pointwise worst-direction second-variation ratio for the k-side A/B shells (r_A e11 + r_B e20, arbitrary complex values
# at fixed w), the H11 odd pair, and the h-side quintic first-order sectors, relative to their costs.  Linear terms removed
# (second variation only).  Pointwise in s = |q|.  N.
import sys, os, json; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, d5eng as D
rec = json.loads(sys.argv[1])
z, wz = D.zgrid(half=False); T = np.abs(z) ** 2
base = z * (rec['l'] + rec['beta'] * (T - 2)) + rec['nu5'] * D.e_ab(3, 2, z)
Dz = 1 - rec['bA'] * D.e_ab(1, 1, z) - rec['bB'] * D.e_ab(2, 0, z)
sets = {'AB(k)': ([D.e_ab(1, 1, z), D.e_ab(2, 0, z)], -1, 1 / D.E1),
        'h-first(p10,p01,p21,p12,p30)': ([D.e_ab(1, 0, z), D.e_ab(0, 1, z), D.e_ab(2, 1, z), D.e_ab(1, 2, z), D.e_ab(3, 0, z)], 1, 1 / D.ETA)}
out = {k: [] for k in sets}; S = np.linspace(0, 1.2, 13)
for s in S:
    Ap, Am = base + s * Dz, base - s * Dz
    for name, (E, sgn, cost) in sets.items():
        B = []
        for e in E: B += [e, 1j * e]
        B = np.array(B); M = np.zeros((len(B), len(B)))
        for A, sg in ((Ap, 1.0), (Am, float(sgn))):
            a = np.abs(A); Im_ = np.imag(sg * B * np.conj(A / a)[None, :]); M += (Im_ * (wz / (2 * a))[None, :]) @ Im_.T
        out[name].append(float(np.linalg.eigvalsh((M + M.T) / 2)[-1] / cost))
print(json.dumps(dict(t=rec['t'], S=list(map(float, S)), **out)))
