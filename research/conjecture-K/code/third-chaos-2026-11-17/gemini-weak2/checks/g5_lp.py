# Gemini's claim: circle LP with constraints only for odd m <= 61 gives N=11: 0.783396, N=19: 0.782328.
# Solve exactly that LP, then check mu_m = sum_j w_j t_j^m for ALL odd m up to 20001.
import numpy as np
from scipy.optimize import linprog
def run(N, mmax_lp):
    M = (N - 1)//2
    ts = np.cos(np.arange(1, M+1)*np.pi/N)
    S = ((np.arange(2**(N-1))[:, None] >> np.arange(N-1)) & 1).astype(np.int8)*2 - 1
    S = np.hstack([np.ones((S.shape[0], 1), np.int8), S]); ext = np.hstack([S, -S])
    C = np.unique(np.stack([(S.astype(np.int16)*ext[:, j:j+N]).sum(1) for j in range(1, M+1)], 1), axis=0)/N
    ms = [1] + list(range(5, mmax_lp+1, 2))
    A_ub = np.vstack([np.hstack([C, -np.ones((len(C), 1))]), np.hstack([-np.array([ts**m for m in ms]), np.zeros((len(ms), 1))])])
    b_ub = np.zeros(A_ub.shape[0])
    r = linprog(np.r_[np.zeros(M), 1], A_ub=A_ub, b_ub=b_ub, A_eq=[np.r_[ts**3, 0]], b_eq=[1], bounds=[(None, None)]*M + [(0, None)], method='highs')
    w = r.x[:M]
    allm = np.arange(1, 20002, 2); mu = np.array([np.sum(w*ts**m) for m in allm])
    bad = allm[(mu < -1e-12) & (allm != 3)]
    return r.fun, w, bad, mu
for N in (11, 19):
    v, w, bad, mu = run(N, 61)
    print('N=%d LP(m<=61) value %.6f; odd m with mu_m < 0: %d (first %s, min mu %.3e)' % (N, v, len(bad), bad[:5], mu[np.arange(1, 20002, 2) != 3].min()))
    v2, _, bad2, _ = run(N, 20001)
    print('      LP(all odd m <= 20001) value %.6f; violations %d' % (v2, len(bad2)))
