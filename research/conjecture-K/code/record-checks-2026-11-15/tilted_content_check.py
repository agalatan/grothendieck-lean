#!/usr/bin/env python3
"""Check written when research/conjecture-K was updated (15 November 2026); see STATUS.md, section 11 (e).

Question: how far are the content bounds of the report on the tilted sector from the comparison with the deficit
that the sector needs, on the Wick monomial?  The first review has a table for this; its column for the structural
bound rests on second derivatives of a spline through noisy quadrature values (it prints sup m_h = 244 at v = 0.46).
This script recomputes the table without a spline in the derivatives, and adds the bounds of the later versions of
the report.

Peak row, tilt s = 3/5 (d = 2/5): a = 699/1250, b = 179/1250, L = Z(a + b|Z|^2), T = |Z|^2, l(T) = |L|.
    F(R) = E_T[(T - d) rho(l(T), R)],   rho(l, R) = E_theta Re ph(R + l e^{i theta}),
so E_Z[(T - d) ph(L + x)] = F(|x|) x/|x| and the tilted profile is h(v) = F(sqrt v)/sqrt v - F'(0).  The Hessian of
Phi(x) = x h(|x|^2) at x = (R, 0) has the entries A = F''(R) (once) and B = (F'(R) - F(R)/R)/R (three times), so
    m_h(R^2) = A^2 + 3 B^2          (the m_h of STATUS.md 11.29),
    N(R) = max{(3A^2 - 2AB + 3B^2)/8, B^2}   (the quantity whose supremum the later versions certify below 1/3).
F is computed by adaptive quadrature in T, split at the point where l(T) = R (logarithmic singularity of the elliptic
integral), on a uniform grid in R; F' and F'' by fourth-order central differences on that grid (F is odd in R).
Wick monomial q = sqrt(u/2) y(|y|^2 - 2): |q| = sqrt(u/2) sqrt(Y)|Y - 2| with Y = |y|^2 ~ Exp(1), delta = 42 u^2,
content = E[sqrt(Y) sign(Y - 2) F(|q|)], deficit D = 2E|L + sqrt(u) W| - 2E|L + q| (Gauss-Legendre panels in sqrt(T)
and sqrt(Y)).  The values of the first review's log (check_tilt_report.log) are printed beside the new ones.
Floating point; no interval arithmetic: status N.  Needs NumPy and SciPy.  Run: python3 -I tilted_content_check.py

Output on 15 November 2026 (Python 3.12.3, NumPy 2.3.5, SciPy 1.17.1):

    1. F'(0) = 0.02404849  (g0 + s j0 = 0.02404834);  Hessian entries of Phi at (R, 0):
       R = 0.15   A = +0.82361112  B = +0.30160849   m_h = 0.95124   N = 0.226387
       R = 0.40   A = +0.62446855  B = +0.39807227   m_h = 0.86535   N = 0.158462
       R = 1.00   A = -0.26229072  B = +0.04831991   m_h = 0.07580   N = 0.029843
       R = 2.50   A = -0.06777075  B = -0.05669997   m_h = 0.01424   N = 0.003215
       R = 4.00   A = -0.01304746  B = -0.03141492   m_h = 0.00313   N = 0.000987
       sup of m_h = 1.3499 at v = R^2 = 0.0625;   m_h at v = 0.46: 0.1386;   sup of N = 0.2957 at R = 0.230  (claim: < 1/3)
    2. Wick monomial.  c2 = content^2, b5 = (3/4) delta E m_h; the bounds of the later versions: b9 = (2/25) delta,
       bt = 3 delta^(3/2), br = (19321/10^6) u, bu = 1/2500, and min = the smallest of these four;
       in brackets the values of the first review (none at the third energy, where b9 = br):
       u         D [review]                c2 [review]               E m_h    b5 [review]               b5/c2   b5/D    b9/D    bt/D    br/D    bu/D    min/D
       0.00050   7.6379e-06 [7.6370e-06]   1.4547e-08 [1.4530e-08]   0.02524  1.9878e-07 [2.6052e-07]     13.7   0.026   0.110   0.013   1.265  52.371   0.013
       0.00500   4.5721e-04 [4.5721e-04]   3.7356e-06 [3.7333e-06]   0.15210  1.1978e-04 [1.7852e-04]     32.1   0.262   0.184   0.223   0.211   0.875   0.184
       0.00575   5.7415e-04 [    --    ]   4.9627e-06 [    --    ]   0.16878  1.7579e-04 [    --    ]     35.4   0.306   0.194   0.270   0.194   0.697   0.194
       0.02000   3.8498e-03 [3.8498e-03]   4.5072e-05 [4.5073e-05]   0.42090  5.3033e-03 [8.2176e-03]    117.7   1.378   0.349   1.697   0.100   0.104   0.100
       0.04630   1.2063e-02 [1.2063e-02]   1.3701e-04 [1.3702e-04]   0.72387  4.8880e-02 [2.2965e-01]    356.8   4.052   0.597   6.718   0.074   0.033   0.033

Reading.  (1) A and B agree with the reviewer's later check, which was in progress and is not in the repository
(A = +0.82361150, B = +0.30160848 at R = 0.15; A = -0.26229072, B = +0.04831991 at R = 1).  sup m_h is 1.35 near
v = 0.063, and m_h is 0.14 at v = 0.46: the value 244 of the first review is an artefact.  sup N is 0.296, below 1/3.
(2) D and content^2 reproduce the first review's values.  With the corrected E m_h the structural bound b5 divided
by D is 0.026, 0.26, 1.4, 4.1 at u = 0.0005, 0.005, 0.02, 0.0463, where the first review has 0.03, 0.39, 2.1, 19.
(3) The bounds of the later versions: the smallest of the four, divided by D, is 0.013, 0.18, 0.10, 0.033 at those
energies.  It is largest where b9 and br cross, at u = 0.00575, and is 0.19 there.  The true ratio content^2/D is at
most 0.012.
"""
import math

import numpy as np
from scipy import integrate, special
from scipy.interpolate import CubicSpline

a, b, d = 699/1250, 179/1250, 2/5
STEP, RMAX = 0.01, 14.0


def rho(ell, R):
    s = ell + R
    k2 = min(4*ell*R/(s*s), 1 - 1e-16)
    mean = 2/math.pi*s*special.ellipe(k2)
    inv = 2/math.pi*special.ellipk(k2)/s
    return (mean + (R*R - ell*ell)*inv)/(2*R)


def troot(R):
    lo, hi = 0.0, 1.0
    while math.sqrt(hi)*(a + b*hi) < R:
        hi *= 2
    for _ in range(200):
        mid = (lo + hi)/2
        lo, hi = (mid, hi) if math.sqrt(mid)*(a + b*mid) < R else (lo, mid)
    return (lo + hi)/2


def F(R):
    if R == 0.0:
        return 0.0
    ts = troot(R)

    def f(t):
        return (t - d)*math.exp(-t)*rho(math.sqrt(t)*(a + b*t), R)
    return sum(integrate.quad(f, lo, hi, epsabs=1e-13, epsrel=1e-13, limit=400)[0]
               for lo, hi in ((0, ts), (ts, ts + 2), (ts + 2, 60)))


def panels(n, pan, rmax):
    """Nodes and weights for E f(X), X ~ Exp(1), with X = r^2: Gauss-Legendre panels in r, graded towards 0."""
    xg, wg = np.polynomial.legendre.leggauss(n)
    edges = np.linspace(0, 1, pan + 1)**1.5*rmax
    r = np.concatenate([(lo + hi)/2 + (hi - lo)/2*xg for lo, hi in zip(edges[:-1], edges[1:])])
    w = np.concatenate([(hi - lo)/2*wg for lo, hi in zip(edges[:-1], edges[1:])])
    return r*r, w*2*r*np.exp(-r*r)


def mean_abs(x, z):
    """E_theta |x + z e^{i theta}| for arrays x, z >= 0."""
    s = x + z
    return 2/math.pi*s*special.ellipe(np.clip(4*x*z/(s*s), 0, 1))


def deficit(u):
    T, wT = panels(16, 40, 7.5)
    Y, wY = panels(16, 40, 7.5)
    ell = (np.sqrt(T)*(a + b*T))[None, :]
    gauss = wY@(mean_abs(ell, np.sqrt(u*Y)[:, None])@wT)
    cubic = wY@(mean_abs(ell, (math.sqrt(u/2)*np.sqrt(Y)*np.abs(Y - 2))[:, None])@wT)
    return 2*float(gauss - cubic)


def main():
    n = int(round(RMAX/STEP))
    Rg = STEP*np.arange(0, n + 3)
    Fg = np.array([F(float(R)) for R in Rg])
    Fe = np.concatenate([-Fg[2:0:-1], Fg])                 # odd extension: F(-2h), F(-h), F(0), F(h), ...
    i = np.arange(2, 2 + n + 1)
    F1 = (-Fe[i + 2] + 8*Fe[i + 1] - 8*Fe[i - 1] + Fe[i - 2])/(12*STEP)
    F2 = (-Fe[i + 2] + 16*Fe[i + 1] - 30*Fe[i] + 16*Fe[i - 1] - Fe[i - 2])/(12*STEP*STEP)
    R = Rg[:n + 1]
    A = F2
    B = np.zeros_like(R)
    B[1:] = (F1[1:] - Fg[1:n + 1]/R[1:])/R[1:]
    m = A*A + 3*B*B
    N = np.maximum((3*A*A - 2*A*B + 3*B*B)/8, B*B)
    print("1. F'(0) = %.8f  (g0 + s j0 = %.8f);  Hessian entries of Phi at (R, 0):"
          % (F1[0], -0.835135932614 + 0.6*1.431973791291))
    for Rq in (0.15, 0.40, 1.00, 2.50, 4.00):
        k = int(round(Rq/STEP))
        print('   R = %.2f   A = %+.8f  B = %+.8f   m_h = %.5f   N = %.6f' % (R[k], A[k], B[k], m[k], N[k]))
    k, kn = int(np.argmax(m)), int(np.argmax(N))
    print('   sup of m_h = %.4f at v = R^2 = %.4f;   m_h at v = 0.46: %.4f;   sup of N = %.4f at R = %.3f  (claim: < 1/3)'
          % (m[k], R[k]**2, m[int(round(math.sqrt(0.46)/STEP))], N[kn], R[kn]))
    msp, Fsp = CubicSpline(R, m), CubicSpline(R, Fg[:n + 1])
    review = {0.0005: (1.4530e-08, 7.6370e-06, 2.6052e-07), 0.005: (3.7333e-06, 4.5721e-04, 1.7852e-04),
              0.02: (4.5073e-05, 3.8498e-03, 8.2176e-03), 0.0463: (1.3702e-04, 1.2063e-02, 2.2965e-01)}
    ucross = 0.019321/3.36
    print('2. Wick monomial.  c2 = content^2, b5 = (3/4) delta E m_h; the bounds of the later versions: b9 = (2/25) delta,')
    print('   bt = 3 delta^(3/2), br = (19321/10^6) u, bu = 1/2500, and min = the smallest of these four;')
    print('   in brackets the values of the first review (none at the third energy, where b9 = br):')
    print('   u         D [review]                c2 [review]               E m_h    b5 [review]               '
          'b5/c2   b5/D    b9/D    bt/D    br/D    bu/D    min/D')
    for u in (0.0005, 0.005, ucross, 0.02, 0.0463):
        old = ['%.4e' % x for x in review[u]] if u in review else ['    --    ']*3
        D = deficit(u)
        def radius(Y):
            return math.sqrt(u/2)*math.sqrt(Y)*abs(Y - 2)

        def em(Y):
            r = radius(Y)
            return math.exp(-Y)*(float(msp(r)) if r < RMAX else 0.0)

        def ec(Y):
            r = radius(Y)
            return math.exp(-Y)*math.sqrt(Y)*(1 if Y > 2 else -1)*(float(Fsp(r)) if r < RMAX else 0.0)
        parts = ((0, 2), (2, 12), (12, 40))
        Em = sum(integrate.quad(em, lo, hi, epsabs=1e-13, epsrel=1e-11, limit=400)[0] for lo, hi in parts)
        c2 = sum(integrate.quad(ec, lo, hi, epsabs=1e-14, epsrel=1e-11, limit=400)[0] for lo, hi in parts)**2
        delta = 42*u*u
        b5, b9, bt, br, bu = 0.75*delta*Em, 0.08*delta, 3*delta**1.5, 0.019321*u, 1/2500
        print('   %.5f   %.4e [%s]   %.4e [%s]   %.5f  %.4e [%s]   %6.1f  %6.3f  %6.3f  %6.3f  %6.3f  %6.3f  %6.3f'
              % (u, D, old[1], c2, old[0], Em, b5, old[2], b5/c2, b5/D, b9/D, bt/D, br/D, bu/D, min(b9, bt, br, bu)/D))


if __name__ == '__main__':
    main()
