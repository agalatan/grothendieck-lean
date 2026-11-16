"""Best bound on a single chaos energy W_d = ||Pi_d f||^2 of an odd +-1 function f
obtainable from the N-point circle (cut-polytope) constraints of HJM Appendix B.

sigma_r = f(cos(r pi/N) U + sin(r pi/N) V), sigma_{r+N} = -sigma_r.
Gaussian kernel  K(j) = E[sigma_0 sigma_j] = sum_{m odd} W_m cos^m(pi j/N),  W>=0, sum W = 1.
Realisable kernels lie in conv{K_sigma : sigma in {+-1}^N}.
LP:  max W_d  s.t.  sum_m W_m cos^m(pi j/N) = sum_s lam_s K_s(j),  lam>=0, sum lam = 1.
Truth (diffuse sign of chaos-d Gaussian): W_d = 2/pi.
"""
import itertools, sys
import numpy as np
from scipy.optimize import linprog


def kernels(N):
    ks = set()
    for bits in itertools.product([1, -1], repeat=N - 1):
        s = np.array((1,) + bits, dtype=float)
        full = np.concatenate([s, -s])
        K = tuple(np.round([np.dot(s, full[j:j + N]) / N for j in range(N)], 12))
        ks.add(K)
    return np.array(sorted(ks))


def lp(N, d, M=301):
    Ks = kernels(N)                      # (S, N)
    ms = np.arange(1, M + 1, 2)
    ang = np.pi * np.arange(N) / N
    C = np.cos(ang)[:, None] ** ms[None, :]   # (N, nm)
    S, nm = Ks.shape[0], len(ms)
    # variables: W (nm), lam (S)
    A_eq = np.hstack([C, -Ks.T])
    b_eq = np.zeros(N)
    A_eq = np.vstack([A_eq, np.concatenate([np.zeros(nm), np.ones(S)])])
    b_eq = np.append(b_eq, 1.0)
    c = np.zeros(nm + S)
    c[list(ms).index(d)] = -1.0
    res = linprog(c, A_eq=A_eq, b_eq=b_eq, bounds=(0, None), method="highs")
    return -res.fun, S


if __name__ == "__main__":
    for d in (1, 3):
        for N in range(3, int(sys.argv[1]) + 1, 2):
            v, S = lp(N, d)
            print(f"d={d} N={N:2d} kernels={S:6d}  max W_d = {v:.6f}   (2/pi = {2/np.pi:.6f})", flush=True)
