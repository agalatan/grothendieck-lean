# Gemini "Theorem A": N = 9 circle LP with odd m in {1, 5..39}, mu_3 = 1, w in [-10, 10] -> claims 0.762548.
import itertools, numpy as np
from scipy.optimize import linprog
N = 9; c = np.cos(np.arange(1, 5)*np.pi/N)
sig = []
for bits in itertools.product([-1.0, 1.0], repeat=N):
    seq = list(bits) + [-x for x in bits]
    sig.append([sum(seq[r]*seq[r+k] for r in range(N))/N for k in range(1, 5)])
sig = np.array(sig)
def solve(ms):
    A_ub = np.vstack([np.hstack([sig, -np.ones((len(sig), 1))]), np.array([[-(c[k]**m) for k in range(4)] + [0.0] for m in ms])])
    b_ub = np.zeros(A_ub.shape[0])
    r = linprog([0, 0, 0, 0, 1], A_ub=A_ub, b_ub=b_ub, A_eq=[[*(c**3), 0]], b_eq=[1], bounds=[(-10, 10)]*4 + [(0, 2)], method='highs')
    return r.fun, r.x[:4]
for name, ms in [('m in {1,5..39} (Gemini)', [1] + list(range(5, 41, 2))), ('all odd m <= 20001', [1] + list(range(5, 20002, 2)))]:
    v, w = solve(ms)
    mu = np.array([np.sum(w*c**m) for m in range(1, 20002, 2)]); mu[1] = 0
    print('%-26s value %.6f -> E|F| <= %.6f; min_m mu_m = %.3e at m = %d' % (name, v, np.sqrt(v), mu.min(), 2*int(np.argmin(mu)) + 1))
