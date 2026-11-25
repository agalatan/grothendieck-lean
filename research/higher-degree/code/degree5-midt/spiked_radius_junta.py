"""N.  The symmetrised spiked cubic radius on juntas with a Gaussian bath:

    G = sum_i c_i b_i(z, y) + tau W,   b_i the six Wick monomials of H_{2,1}(C^2) in the visible z and one
    remote coordinate y, W a standard complex Gaussian independent of (z, y) (a diffuse remote cubic).

Maximises (1/2)(E|l z + G| + E|l z - G|)/sqrt(l^2 + ||G||^2) at fixed angle theta (l = cos, ||G|| = sin).
Quadrature: Gauss-Laguerre in |z|^2 and |y|^2, trapezoid in the relative phase, closed form in W;
the search runs on a 24 x 24 x 32 grid and the best point is re-evaluated on 48 x 48 x 96.
A search bounds the supremum from below only.   Usage: python3 spiked_radius_junta.py [nstarts] [seed]
"""
import sys
import numpy as np
from numpy.polynomial.laguerre import laggauss
from scipy.optimize import minimize
from scipy.special import ive

MU = np.sqrt(np.pi) / 2


def grid(NT, NP):
    T, WT = laggauss(NT)
    ph = 2 * np.pi * (np.arange(NP) + 0.5) / NP
    T1, T2, PH = np.meshgrid(T, T, ph, indexing="ij")
    WW = WT[:, None, None] * WT[None, :, None] / NP + 0 * PH
    z = np.sqrt(T1) + 0j
    y = np.sqrt(T2) * np.exp(1j * PH)
    B = np.array([z * (T1 - 2) / np.sqrt(2), z * z / np.sqrt(2) * np.conj(y), (T1 - 1) * y,
                  z * (T2 - 1), np.conj(z) * y * y / np.sqrt(2), y * (T2 - 2) / np.sqrt(2)])
    gram = np.array([[np.sum(WW * np.conj(a) * b) for b in B] for a in B])
    if not np.allclose(gram, np.eye(6), atol=1e-8):
        raise SystemExit("basis not orthonormal on the grid")
    return z, B, WW


COARSE, FINE = grid(24, 32), grid(48, 96)


def rho(x):
    return MU * ((1 + x) * ive(0, x / 2) + x * ive(1, x / 2))


def ratio(theta, p, g=COARSE):
    z, B, WW = g
    c = p[:6] + 1j * p[6:12]
    tau = abs(p[12])
    n = np.sqrt(np.sum(np.abs(c) ** 2) + tau * tau)
    c = c * np.sin(theta) / n
    tau = tau * np.sin(theta) / n
    G = np.tensordot(c, B, axes=1)
    l = np.cos(theta)
    tot = 0.0
    for s in (1, -1):
        a = np.abs(l * z + s * G)
        if tau > 1e-9:
            tot += np.sum(WW * tau * rho(a * a / (tau * tau)))
        else:
            tot += np.sum(WW * a)
    return 0.5 * tot


if __name__ == "__main__":
    nstarts = int(sys.argv[1]) if len(sys.argv) > 1 else 30
    rng = np.random.default_rng(int(sys.argv[2]) if len(sys.argv) > 2 else 1)
    e = np.zeros(13); e[12] = 1
    print("check: bath alone %.7f, e21(y) alone at theta = pi/2 %.7f" % (ratio(0.7, e), ratio(np.pi / 2, np.eye(13)[5])))
    print("theta/(pi/2)  best ratio (fine grid)  minus sqrt(pi)/2  best with tau = 0 (coarse)   maximiser |c_1..6|, tau")
    worst = -1
    FRACS = [float(a) for a in sys.argv[3:]] or [0.15, 0.3, 0.45, 0.6, 0.8]
    for frac in FRACS:
        th = frac * np.pi / 2
        best, arg, best0 = -1, None, -1
        for s in range(nstarts):
            p0 = rng.normal(size=13)
            if s % 3 == 0:
                p0[12] = 0.0
                f = lambda p: -ratio(th, np.concatenate([p[:12], [0.0]]))
            else:
                f = lambda p: -ratio(th, p)
            r = minimize(f, p0, method="BFGS", options={"gtol": 1e-6, "maxiter": 150})
            if s % 3 == 0:
                best0 = max(best0, -r.fun)
            if -r.fun > best:
                best, arg = -r.fun, (np.concatenate([r.x[:12], [0.0]]) if s % 3 == 0 else r.x)
        c = arg[:6] + 1j * arg[6:12]
        n = np.sqrt(np.sum(np.abs(c) ** 2) + arg[12] ** 2)
        best = ratio(th, arg, FINE)
        print("%.2f  %.7f  %+.2e  %.7f  %s %.3f" % (frac, best, best - MU, best0,
              np.array2string(np.abs(c) / n, precision=3, suppress_small=True), abs(arg[12]) / n), flush=True)
        worst = max(worst, best)
    print("largest ratio found: %.7f; sqrt(pi)/2 = %.7f" % (worst, MU))
