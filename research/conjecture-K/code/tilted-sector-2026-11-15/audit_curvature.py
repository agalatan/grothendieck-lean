#!/usr/bin/env python3
"""N ONLY: adaptive, root-split tilted-sector curvature diagnostic.

Agent-ID: codex-6e2b. Requires NumPy/SciPy; writes no files.
Example:
OPENBLAS_NUM_THREADS=1 /Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I audit_curvature.py

This is floating-point evidence, not an interval certificate. The logarithmic
elliptic singularity is split at its unique positive radial root. No global
supremum is asserted, even with --search.
"""
import sys
sys.dont_write_bytecode = True
import numpy as np
from scipy.integrate import quad_vec
from scipy.optimize import differential_evolution, minimize
from scipy.special import ellipe, ellipkm1

a, b, d = 699 / 1250, 179 / 1250, 2 / 5


def curvature(x, y, rho, tol=2e-9):
    """(largest integrated eigenvalue, integral of pointwise largest eigenvalue).

    Rotate rho to be nonnegative real; w=x+iy. The second result is an upper
    bound on the first at the exact-integral level, but both outputs here are N.
    """
    assert 0 <= rho <= .3
    c = x - rho * d
    # ell(t)^2 - |w+rho(t-d)|^2. Since 2ab-rho^2>0,
    # Descartes' rule gives exactly one positive root unless c=y=0.
    roots = np.roots([b*b, 2*a*b-rho*rho,
                      a*a-2*rho*c, -c*c-y*y])
    breaks = [0.0] + sorted(z.real for z in roots
                           if abs(z.imag) < 1e-9 and 1e-14 < z.real < 45) + [45.0]

    def integrand(t):
        if t == 0:
            t = 1e-300
        radius = np.sqrt(t) * (a + b*t)
        vx, vy = x + rho*(t-d), y
        v = np.hypot(vx, vy)
        if v / radius < 1e-4:
            # Numerically stable local series. Its neglected tail is NOT
            # certified by this floating-point diagnostic.
            z = (v / radius)**2
            tang = (.5 + z/16 + 3*z*z/128) / radius
            radial = (.5 + 3*z/16 + 15*z*z/128) / radius
        else:
            total = radius + v
            complement = ((radius-v)/total)**2
            # ellipkm1 avoids loss of precision from 1-m near m=1.
            # The floor merely prevents floating-point infinity at a rounded
            # node; it is another reason this script is N only.
            inverse_mean = 2/np.pi * ellipkm1(max(complement, 1e-300)) / total
            mean = 2/np.pi * total * ellipe(1-complement)
            tang = (mean + (v*v-radius*radius)*inverse_mean) / (2*v*v)
            radial = inverse_mean - tang
        nx, ny = (1., 0.) if v < 1e-100 else (vx/v, vy/v)
        weight = np.exp(-t) * (t-d)**2
        return weight * np.array([
            tang + (radial-tang)*nx*nx,
            tang + (radial-tang)*ny*ny,
            (radial-tang)*nx*ny,
            max(tang, radial),
        ])

    val = sum((quad_vec(integrand, lo, hi, epsabs=tol, epsrel=tol,
                        limit=180)[0]
               for lo, hi in zip(breaks[:-1], breaks[1:])), np.zeros(4))
    q1, q2, q12, relaxed = val
    return (q1+q2)/2 + np.hypot((q1-q2)/2, q12), relaxed


def main():
    print('Agent-ID: codex-6e2b; N only; t tail truncated at 45.')
    for x in (.640204417, .683589101):
        eig, relaxed = curvature(x, 0., .3, 2e-10)
        print(f'rho=.3, w={x:.9f}: eigen={eig:.12f}, relaxed={relaxed:.12f}')
    if '--search' in sys.argv[1:]:
        for index, name in ((0, 'eigen'), (1, 'relaxed')):
            result = differential_evolution(
                lambda z: -curvature(*z, tol=1e-6)[index],
                [(-1, 2), (0, 1), (0, .3)], popsize=5,
                maxiter=16, tol=2e-5, polish=False, seed=4)
            print(name, 'three-parameter search', result.x,
                  curvature(*result.x), flush=True)
            refined = minimize(
                lambda z: -curvature(z[0], abs(z[1]), .3)[index],
                result.x[:2], method='Nelder-Mead',
                options={'xatol': 2e-6, 'fatol': 1e-9, 'maxiter': 100})
            print(name, 'rho=.3 refinement', refined.x,
                  curvature(*refined.x, .3, tol=2e-10), flush=True)


if __name__ == '__main__':
    assert set(sys.argv[1:]).issubset({'--search'})
    main()
