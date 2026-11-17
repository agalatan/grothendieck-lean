# claude-b9ee research worker (fourpartite): N-level exploration of Lemma (L).
# g = c0 Z0 + sum_j (a_j X_j + b_j Y_j + c_j X_j Y_j), unit variance.
# Fourier: sqrt(2/pi) - E|g| = (2/pi) J,  J = int_0^inf (Re phi_g(t) - e^{-t^2/2}) t^{-2} dt.
# Cross-check one block against the conditional formula E|g| = E_Y psi(bY, sqrt(c0^2 + (a+cY)^2)).
import numpy as np
from scipy import integrate, special
import sys

SQ2PI = np.sqrt(2/np.pi)

def logR_theta(t, c0, blocks):
    t2 = t*t
    lr = -c0*c0*t2/2
    th = 0.0
    for (a, b, c) in blocks:
        s = c*c; w = a*a + b*b
        d = 1 + s*t2
        lr += -0.5*np.log(d) - w*t2/(2*d)
        th += a*b*c*t*t2/d
    return lr, th

def integrand(t, c0, blocks):
    if t < 1e-3:
        # series: G - Theta^2/2 ~ t^4(...) ; integrand ~ e^{-t^2/2}(G - Th^2/2)/t^2, use direct but guarded
        pass
    lr, th = logR_theta(t, c0, blocks)
    return (np.exp(lr)*np.cos(th) - np.exp(-t*t/2))/(t*t)

def J(c0, blocks, T=200.0):
    v = c0*c0 + sum(a*a+b*b+c*c for a, b, c in blocks)
    assert abs(v-1) < 1e-12, v
    pts = [0, 1, 2, 3, 4, 6, 8, 12, 16, 24, 32, 48, 64, 100, T]
    tot = 0.0
    for lo, hi in zip(pts[:-1], pts[1:]):
        r, e = integrate.quad(integrand, lo, hi, args=(c0, blocks), limit=400, epsabs=1e-13, epsrel=1e-11)
        tot += r
    # tail beyond T: |integrand| <= (R + e^{-t^2/2})/t^2 ; R <= prod (1+s t^2)^{-1/2}
    return tot

def Eabs_one_block_direct(a, b, c, c0):
    def f(y):
        m = b*y; sg = np.sqrt(c0*c0 + (a + c*y)**2)
        if sg < 1e-300:
            val = abs(m)
        else:
            mu = m/sg
            val = sg*SQ2PI*np.exp(-mu*mu/2) + m*special.erf(mu/np.sqrt(2))
        return val*np.exp(-y*y/2)/np.sqrt(2*np.pi)
    # split at the zero of a + c y
    pts = [-12, 12]
    if c != 0:
        z = -a/c
        if -12 < z < 12:
            pts = [-12, z, 12]
    tot = 0.0
    for lo, hi in zip(pts[:-1], pts[1:]):
        r, e = integrate.quad(f, lo, hi, limit=400, epsabs=1e-14, epsrel=1e-12)
        tot += r
    return tot

if __name__ == '__main__':
    rng = np.random.default_rng(1)
    print('cross-check one block: E|g| Fourier vs conditional')
    for trial in range(6):
        v = rng.normal(size=4); v /= np.linalg.norm(v)
        a, b, c, c0 = v
        e1 = SQ2PI - 2/np.pi*J(c0, [(a, b, c)])
        e2 = Eabs_one_block_direct(a, b, c, c0)
        print('%+.4f %+.4f %+.4f %+.4f  fourier %.12f direct %.12f diff %.1e ratio %.6f' % (a, b, c, c0, e1, e2, e1-e2, e2/SQ2PI))
    # worst one block on a grid: a = b (max |ab|), c0 = 0
    print('one block, a=b, c0=0: J and ratio E|g|/sqrt(2/pi)')
    for c in [0.02, 0.05, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.95, 0.99]:
        a = np.sqrt((1-c*c)/2)
        j = J(0.0, [(a, a, c)])
        print('c=%.2f J=%.3e  ratio=%.8f  J/c^2=%.4f' % (c, j, 1 - 2/np.pi*j/SQ2PI, j/c**2))
