"""N.  Search for the symmetrised spiked cubic radius

    rho_s(theta) = sup_G  (1/2)(E|cos(theta) z1 + sin(theta) G| + E|cos(theta) z1 - sin(theta) G|),  ||G|| = 1,

in the diffuse one-spike model of midt_lib.py.  A search bounds the supremum from below only.
Usage: python3 spiked_radius_search.py [nstarts] [seed]
"""
import sys
import numpy as np
from scipy.optimize import minimize
import midt_lib as L

nstarts = int(sys.argv[1]) if len(sys.argv) > 1 else 40
rng = np.random.default_rng(int(sys.argv[2]) if len(sys.argv) > 2 else 1)


def ratio(theta, g):
    n = np.sqrt(L.norm2(g))
    if n < 1e-12:
        return L.MU * np.cos(theta)
    gg = np.array(g, float).copy()
    for i in (0, 1, 2, 3, 5, 6, 7, 9):
        gg[i] *= np.sin(theta) / n
    return L.phi_sym(np.cos(theta), gg)


print("checks: pure spike %.6f  (sqrt(pi)/2 = %.6f)" % (ratio(0.0, [0, 0, 0, 0, 0, 0, 0, 0, 0, 1]), L.MU))
print("        diffuse cubic alone %.6f, z1*N_R alone at theta=pi/4 %.6f, z1*N_C %.6f" % (
    ratio(np.pi / 2, [0, 0, 0, 0, 0, 0, 0, 0, 0, 1]), ratio(np.pi / 4, [0, 0, 0, 1, np.pi / 2, 0, 0, 0, 0, 0]),
    ratio(np.pi / 4, [0, 0, 1, 0, 0, 0, 0, 0, 0, 0])))
print("theta/(pi/2)  best ratio  minus sqrt(pi)/2   maximiser (" + ", ".join(L.NAMES) + ")")
worst = -1
for frac in (0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0):
    th = frac * np.pi / 2
    best, arg = -1, None
    for s in range(nstarts):
        g0 = rng.normal(size=10)
        g0[[4, 8]] = rng.uniform(0, np.pi, 2)
        if s % 4 == 0:
            g0[[0, 1, 2, 3, 5, 6, 7]] *= 0.1
        r = minimize(lambda g: -ratio(th, g), g0, method="BFGS", options={"gtol": 1e-7, "maxiter": 300})
        if -r.fun > best:
            best, arg = -r.fun, r.x
    n = np.sqrt(L.norm2(arg))
    a = arg.copy()
    for i in (0, 1, 2, 3, 5, 6, 7, 9):
        a[i] /= n
    print("%.1f  %.7f  %+.2e  %s" % (frac, best, best - L.MU, np.array2string(a, precision=3, suppress_small=True)), flush=True)
    worst = max(worst, best)
print("largest ratio found: %.7f; sqrt(pi)/2 = %.7f" % (worst, L.MU))
