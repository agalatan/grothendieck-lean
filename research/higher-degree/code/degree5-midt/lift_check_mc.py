#!/usr/bin/env python3
"""N.  Monte Carlo check of the lift behind Theorem A (NOTE.md section 2) on explicit pairs.

For a pair (f, g) on C^2 = (z, y) and a cubic G in H_{2,1}(C^2), with h = (f+g)/2, k = (f-g)/2 and m a
standard real Gaussian independent of (z, y) (the diffuse limit of a real element of H_{1,1}):

    E| l z m + G |  >=  Re E[conj(l z m + G) (sgn(m) h + k)]  =  l sqrt(2/pi) Re<z, h> + Re<G, k>,

and the left side is at most rho* sqrt(l^2 + ||G||^2).  The script prints the three numbers for random
cubics, for the pairs f = ph(a z + G), g = ph(a z - G) (the optimal responses to a spike a z) and for
random twists of them.  It checks the middle identity by Monte Carlo as well.  Seeded; 4*10^5 samples.
"""
import numpy as np

rng = np.random.default_rng(20261125)
N = 400000
z = (rng.normal(size=N) + 1j * rng.normal(size=N)) / np.sqrt(2)
y = (rng.normal(size=N) + 1j * rng.normal(size=N)) / np.sqrt(2)
m = rng.normal(size=N)
T1, T2 = np.abs(z) ** 2, np.abs(y) ** 2
B = [z * (T1 - 2) / np.sqrt(2), z * z / np.sqrt(2) * np.conj(y), (T1 - 1) * y, z * (T2 - 1),
     np.conj(z) * y * y / np.sqrt(2), y * (T2 - 2) / np.sqrt(2)]
ph = lambda a: a / np.maximum(np.abs(a), 1e-300)
worst = 1e9
print("l      ||G||   E|l z m + G|   E Re conj(U) F   l sqrt(2/pi) Re<z,h> + Re<G,k>   rho0 sqrt(l^2+||G||^2)")
for trial in range(8):
    c = (rng.normal(size=6) + 1j * rng.normal(size=6)) * rng.uniform(0.1, 0.6)
    G = sum(ci * bi for ci, bi in zip(c, B))
    a = rng.uniform(0.2, 1.5)
    f, g = ph(a * z + G), ph(a * z - G)
    if trial % 2:
        tw = np.exp(1j * 0.7 * np.sin(T2))          # a unimodular twist of both functions
        f, g = f * tw, g * np.conj(tw)
    h, k = (f + g) / 2, (f - g) / 2
    l = rng.uniform(0.2, 1.2)
    U = l * z * m + G
    lhs = np.mean(np.abs(U))
    mid = np.mean((np.conj(U) * (np.sign(m) * h + k)).real)
    rhs = l * np.sqrt(2 / np.pi) * np.mean((np.conj(z) * h).real) + np.mean((np.conj(G) * k).real)
    nG = np.sqrt(np.sum(np.abs(c) ** 2))
    cap = 2287 / 2500 * np.sqrt(l * l + nG * nG)
    worst = min(worst, lhs - mid)
    print("%.3f  %.3f  %.5f  %.5f  %.5f  %.5f" % (l, nG, lhs, mid, rhs, cap))
    if not (lhs >= mid - 1e-9 and abs(mid - rhs) < 0.01 and lhs <= cap + 0.01):
        raise SystemExit("CHECK FAILED")
print("smallest E|U| - E Re conj(U)F: %.5f (>= 0 pointwise); identity within Monte Carlo error; all below the cap" % worst)
