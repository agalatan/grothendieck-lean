# [copy from degree5-cert/{gate/code,share/code,capgate}; claude-b9ee worker d5newcap, 16 Nov 2026: module path made local,
#  game constants from the environment D5_E1, D5_ETA (d5eng.py); nothing else changed]
# Pointwise finite-amplitude remainder for the k-side A/B shells (the (P)-type statement, linear term removed):
#   R(s, u) = sum_pm E_z[ |A_pm + s_pm u| - |A_pm| - Re(conj(s_pm u) ph A_pm) ],  u = rA e11 + rB e20, s_+ = 1, s_- = -1,
# ratio(s, tau) = max over worst directions of R(s, tau d)/(p1 tau^2 |d|^2).  N.
import sys, os, json; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, d5eng as D
rec = json.loads(sys.argv[1]); p1 = 1 / D.E1
z, wz = D.zgrid(half=False); T = np.abs(z) ** 2
base = z * (rec['l'] + rec['beta'] * (T - 2)) + rec['nu5'] * D.e_ab(3, 2, z)
Dz = 1 - rec['bA'] * D.e_ab(1, 1, z) - rec['bB'] * D.e_ab(2, 0, z)
B = np.array([D.e_ab(1, 1, z), 1j * D.e_ab(1, 1, z), D.e_ab(2, 0, z), 1j * D.e_ab(2, 0, z)])
rng = np.random.default_rng(1); worst = 0.0; arg = None; rows = []
for s in (0.0, 0.1, 0.2, 0.3, 0.5, 0.8):
    Ap, Am = base + s * Dz, base - s * Dz; aP, aM = np.abs(Ap), np.abs(Am); pP, pM = Ap / aP, Am / aM
    M = np.zeros((4, 4))
    for A, a, sg in ((Ap, aP, 1.0), (Am, aM, -1.0)):
        Im_ = np.imag(sg * B * np.conj(A / a)[None, :]); M += (Im_ * (wz / (2 * a))[None, :]) @ Im_.T
    w_, V = np.linalg.eigh((M + M.T) / 2)
    best = 0.0
    for d in [V[:, -1], V[:, -2]] + [x / np.linalg.norm(x) for x in rng.standard_normal((10, 4))]:
        u = d @ B
        for tau in np.geomspace(1e-3, 1.0, 16):
            R = ((np.abs(Ap + tau * u) - aP - np.real(np.conj(tau * u) * pP)) + (np.abs(Am - tau * u) - aM - np.real(np.conj(-tau * u) * pM))) @ wz
            best = max(best, R / (p1 * tau * tau))
    rows.append((s, float(w_[-1] / p1), float(best)))
print(json.dumps(dict(t=rec['t'], rows=rows)))
