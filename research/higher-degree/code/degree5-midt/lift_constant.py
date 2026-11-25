"""N.  The constant c0(a) of the elliptic lift (NOTE.md section 3).

M = X + iY, X ~ N(0, a^2), Y ~ N(0, 1 - a^2) independent.  For lam >= 0:
    kappa(lam) = E[(Y + lam)/R],   c(lam) = E[(X^2 + Y (Y + lam))/R],   R = sqrt(X^2 + (Y + lam)^2),
    r(lam) = c(lam)/sqrt(1 - kappa(lam)^2),    c0(a) = inf_{lam >= 0} r(lam).
At lam = 0: kappa = 0 and r = E|M|; as lam -> infinity r -> a.  a = 1 is the linear lift of Theorem A
(r(0) = sqrt(2/pi) is then the infimum).  Quadrature: scipy dblquad in polar coordinates centred
at the singular point (0, -lam).
"""
import sys
import numpy as np
from scipy import integrate


def moments(a, lam):
    b = np.sqrt(max(1 - a * a, 0.0))
    if b < 1e-12:  # real M: one-dimensional integrals
        f = lambda x, k: np.exp(-x * x / (2 * a * a)) / (a * np.sqrt(2 * np.pi)) * (
            (lam if k == 0 else x * x) / np.sqrt(x * x + lam * lam) if (x != 0 or lam != 0) else 0.0)
        if lam == 0:
            return 0.0, a * np.sqrt(2 / np.pi)
        kap = integrate.quad(f, -np.inf, np.inf, args=(0,), epsabs=1e-12, epsrel=1e-12, limit=400)[0]
        c = integrate.quad(f, -np.inf, np.inf, args=(1,), epsabs=1e-12, epsrel=1e-12, limit=400)[0]
        return kap, c

    def dens(x, y):
        return np.exp(-x * x / (2 * a * a) - y * y / (2 * b * b)) / (2 * np.pi * a * b)

    # polar coordinates around (0, -lam): x = s cos(phi), y + lam = s sin(phi); the 1/R cancels the Jacobian
    def fk(s, phi):
        return s * np.sin(phi) * dens(s * np.cos(phi), s * np.sin(phi) - lam)

    def fc(s, phi):
        x, yl = s * np.cos(phi), s * np.sin(phi)
        return (x * x + (yl - lam) * yl) * dens(x, yl - lam)

    smax = lam + 12.0
    kap = integrate.dblquad(fk, 0, 2 * np.pi, 0, smax, epsabs=1e-11, epsrel=1e-11)[0]
    c = integrate.dblquad(fc, 0, 2 * np.pi, 0, smax, epsabs=1e-11, epsrel=1e-11)[0]
    return kap, c


def r(a, lam):
    kap, c = moments(a, lam)
    return c / np.sqrt(1 - kap * kap), kap


if __name__ == "__main__":
    from scipy.optimize import minimize_scalar
    lams = [0, 0.05, 0.1, 0.2, 0.3, 0.45, 0.6, 0.8, 1.0, 1.3, 1.7, 2.2, 3.0, 4.0, 6.0, 9.0]
    if not sys.argv[1:]:
        print("refined: a, inf of r over [0, 3] (bounded minimisation), r(0), limit a, c0 = the smallest of the three")
        for a in (0.88, 0.89, 0.895, 0.90, 0.905, 0.91):
            m = minimize_scalar(lambda lam: r(a, lam)[0], bounds=(0.0, 3.0), method="bounded", options={"xatol": 1e-4})
            r0 = r(a, 0.0)[0]
            print("%.3f  %.6f at lam = %.4f   %.6f   %.3f   c0 = %.6f" % (a, m.fun, m.x, r0, a, min(m.fun, r0, a)), flush=True)
    print("a      c0(a) = min over the grid   attained at lam (kappa)   r(0) = E|M|   limit a")
    for a in [float(x) for x in sys.argv[1:]] or [1.0, 0.95, 0.9, 0.87, 0.85, 0.83, 0.8, 0.75, 0.7071067811865476]:
        vals = [r(a, lam) for lam in lams]
        i = int(np.argmin([v[0] for v in vals]))
        print("%.4f  %.6f  lam = %.2f (kappa = %.4f)  %.6f  %.4f   r on the grid: %s" % (
            a, vals[i][0], lams[i], vals[i][1], vals[0][0], a, " ".join("%.4f" % v[0] for v in vals)), flush=True)
