# [copy from degree5-cert/{gate/code,share/code,capgate}; claude-b9ee worker d5newcap, 16 Nov 2026: module path made local,
#  game constants from the environment D5_E1, D5_ETA (d5eng.py); nothing else changed]
"""zero_core.py -- the zero-core odd ratio of every capped row (claude-b9ee worker, 16 Nov 2026).
At s = |q| = 0 the base is z g(|z|^2), g real (L + nu5 e32), and the worst direction of the odd shell z.Q is an imaginary Q:
second variation / cost = eps1 E_z[|z|/|g(|z|^2)|] (P).  Also the pointwise worst ratio of {zQ, zbar P} at s = 0.1, 0.2
(as gate/code/h11c.py) and the A/B ratio at s = 0 (as hab.py).  N."""
import sys, os, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, d5eng as D
E1 = D.E1; p1 = 1 / E1
z, wz = D.zgrid(half=False); T = np.abs(z) ** 2
rows = [json.loads(l) for l in open(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'rows5.lines')).read().split('\n') if l.strip()]
B = np.array([z, 1j * z, np.conj(z), 1j * np.conj(z)])
out = []
for k, rec in enumerate(rows, 1):
    base = z * (rec['l'] + rec['beta'] * (T - 2)) + rec['nu5'] * D.e_ab(3, 2, z)
    Dz = 1 - rec['bA'] * D.e_ab(1, 1, z) - rec['bB'] * D.e_ab(2, 0, z)
    g = np.real(base / np.where(np.abs(z) > 0, z, 1))
    closed = E1 * float(wz @ (np.abs(z) / np.abs(g)))
    rat = {}
    for s in (0.0, 0.1, 0.2):
        M = np.zeros((4, 4))
        for A in (base + s * Dz, base - s * Dz):
            a = np.abs(A); Im_ = np.imag(B * np.conj(A / a)[None, :]); M += (Im_ * (wz / (2 * a))[None, :]) @ Im_.T
        rat[s] = float(np.linalg.eigvalsh((M + M.T) / 2)[-1] / p1)
    out.append(dict(k=k, t=rec['t'], closed=closed, r0=rat[0.0], r01=rat[0.1], r02=rat[0.2]))
    print('k=%2d t=%.3f  eps1 E|z|/|g| = %.4f   pointwise worst ratio s=0 %.4f  s=0.1 %.4f  s=0.2 %.4f' % (k, rec['t'], closed, rat[0.0], rat[0.1], rat[0.2]))
json.dump(out, open(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'out', 'zero_core.json'), 'w'), indent=1)
