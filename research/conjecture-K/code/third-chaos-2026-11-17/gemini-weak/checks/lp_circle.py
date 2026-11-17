# Circle relaxation of sup ||Pi_d f||^2 over odd f: R^n -> {+-1}:
#   rho(c) = sum_{m odd} a_m c^m (a_m = ||Pi_m f||^2 >= 0, sum a_m = 1), and for N equally spaced points on a
#   Gaussian circle, (rho(cos(k pi/N)))_k lies in the convex hull of autocorrelations of antiperiodic sign sequences.
# Dual: min t + mu  s.t.  sum_k w_k A_sigma(k) <= t (all sigma),  sum_k w_k c_k^m + mu >= [m == d] (odd m), mu >= 0.
import sys, itertools, numpy as np
from scipy.optimize import linprog
def autocorr_vectors(N):
    K = (N - 1)//2
    S = ((np.arange(2**(N-1))[:, None] >> np.arange(N-1)) & 1).astype(np.int8)*2 - 1
    S = np.hstack([np.ones((S.shape[0], 1), np.int8), S])            # sigma_0 = +1
    ext = np.hstack([S, -S])
    A = np.stack([(S.astype(np.int16)*ext[:, k:k+N]).sum(1) for k in range(1, K+1)], 1)
    return np.unique(A, axis=0).astype(float)/N, K
def solve(N, d, M=6001):
    A, K = autocorr_vectors(N)
    ck = np.cos(np.arange(1, K+1)*np.pi/N)
    ms = np.arange(1, M+1, 2)
    C = ck[None, :]**ms[:, None]                                      # rows m
    # variables x = (w_1..w_K, t, mu); minimise t + mu
    nv = K + 2
    c = np.zeros(nv); c[K] = 1; c[K+1] = 1
    A_ub = np.vstack([np.hstack([A, -np.ones((A.shape[0], 1)), np.zeros((A.shape[0], 1))]),
                      np.hstack([-C, np.zeros((len(ms), 1)), -np.ones((len(ms), 1))])])
    b_ub = np.concatenate([np.zeros(A.shape[0]), -(ms == d).astype(float)])
    bounds = [(None, None)]*K + [(None, None), (0, None)]
    r = linprog(c, A_ub=A_ub, b_ub=b_ub, bounds=bounds, method='highs')
    return r.fun, r.x[:K], r.x[K+1], A.shape[0]
d = int(sys.argv[1]); Ns = [int(x) for x in sys.argv[2:]]
for N in Ns:
    v, w, mu, na = solve(N, d)
    print('d=%d N=%2d  bound on ||Pi_d f||^2: %.6f  -> E|F| <= %.6f   (%d distinct autocorrelation vectors; mu=%.2e)' % (d, N, v, np.sqrt(v), na, mu), flush=True)
