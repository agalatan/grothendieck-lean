#!/usr/bin/env python3
# Reviewer (N): sharp profile-free constant theta*(d) of the Hermitian-basis family q = Y*NY - tr N, d = 2..12
# (the same computation as part D of thm1_check.py), to locate the first d with theta* < 0.37.
import sys, math
import numpy as np
from scipy.special import gammaln
sys.path.insert(0, sys.argv[1])
import siglib as L
for d in range(2, 13):
    Rn, wR = L.panels(np.linspace(0, d + 14 * math.sqrt(d) + 30, 1401), 8); wR = wR * np.exp((d - 1) * np.log(Rn) - Rn - gammaln(d))
    a = (Rn - 1) ** 2 + d - 1; u0 = d * d; L0 = 2 * (d * d * (1 + 2 * d) + d)
    nu = wR * ((a - u0) * (Rn - d) + 2 * (Rn * Rn - Rn)) / math.sqrt(d)
    v, wv = L.panels([0.0] + L.geom_edges(1e-7 * u0, 0.02 * u0) + list(np.linspace(0.02 * u0, 6 * u0, 301)[1:]) + list(np.geomspace(6 * u0, 80 * float(a.max()), 400)[1:]), 6)
    pV = np.zeros(len(v)); zk = np.zeros(len(v))
    for i in range(0, len(v), 200):
        E = np.exp(-v[i:i + 200][:, None] / a[None, :]); pV[i:i + 200] = E @ (wR / a); zk[i:i + 200] = v[i:i + 200] * (E @ (nu / a ** 2))
    pos = pV > 1e-300
    ts = (2 / 3) * (float(wv[pos] @ (zk[pos] ** 2 / (v[pos] * pV[pos]))) + float(wv @ zk) ** 2 / u0) / (2 * L0)
    th1 = (1 + 2 * (1 + 7 * d) / (d * d * (1 + 2 * d) + d)) / 3
    print('d = %2d  chi = %.4f  theta* = %.5f  formula (1) = %.5f  ratio at h = v: %.5f' % (d, 2 * L0 / u0 ** 2, ts, th1, (4 * d * math.sqrt(d)) ** 2 / (2 * L0 * 0.75 * u0)))
