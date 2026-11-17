# claude-b9ee research worker, 17 Nov 2026. NUMERICS ONLY (N): sanity checks of the Fourier formula on a few vectors:
# E|S| = sqrt(2/pi) - (2/pi) int_0^T (prod psi(lambda_i t) - e^{-t^2/2}) t^{-2} dt (Gauss-Legendre in t, psi by direct
# quadrature psi1 of n01 at every node; truncation at T = 60/M, the rest bounded by int_T^inf (0.78/sqrt(Mt)) t^-2 dt),
# against Monte Carlo (4e6 samples).
import numpy as np
from n01_psi_numerics import psi1, nodes
rng = np.random.default_rng(20261117)
s6 = np.sqrt(6.0); h = lambda x: (x**3 - 3*x) / s6
def fourier(lam):
    M = max(lam); T = 60 / M
    t, w = nodes(0.0, T, 0.05)
    ph = np.ones_like(t); cache = {}
    for l in lam:
        if l not in cache: cache[l] = psi1(l * t)
        ph *= cache[l]
    D = np.sum((ph - np.exp(-t**2/2)) / t**2 * w)
    err = 0.78 / np.sqrt(M) * (2/3) * T**-1.5
    return np.sqrt(2/np.pi) - 2/np.pi * D, D, 2/np.pi * err
def mc(lam, N=4_000_000):
    s = np.zeros(N)
    for l in lam: s += l * h(rng.standard_normal(N))
    a = np.abs(s); return a.mean(), a.std() / np.sqrt(N)
print('sqrt(2/pi) = %.5f; E|h| exact = %.5f' % (np.sqrt(2/np.pi), (1 + 4*np.exp(-1.5)) / np.sqrt(3*np.pi)))
for lam in [[1.0], [2**-0.5]*2, [0.74, np.sqrt(1 - 0.74**2)], [3**-0.5]*3, [0.5]*4, [0.9, np.sqrt(0.19)], [0.6, 0.6, np.sqrt(0.28)], [0.2]*25]:
    f, D, e = fourier(lam); m, se = mc(lam)
    print('n = %3d, M = %.4f: E|S| Fourier %.5f (truncation <= %.1e), MC %.5f +- %.5f; Delta = %.4f' % (len(lam), max(lam), f, e, m, se, D))
