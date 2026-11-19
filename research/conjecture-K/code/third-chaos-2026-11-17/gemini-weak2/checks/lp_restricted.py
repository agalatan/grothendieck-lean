# Circle-rotation bound restricted to sign patterns that a degree-d odd trig polynomial can have:
# at most d sign changes per half-turn (an odd number).  For f = sign F, F in V_d, sigma_r = sign F(U cos(r pi/N) + V sin(r pi/N))
# is the sign of g(phi) = F(U cos phi + V sin phi), an odd trig polynomial of degree <= d, sampled at phi = r pi/N.
import sys, itertools, numpy as np
from scipy.optimize import linprog
def patterns(N, d):
    out = []
    for c in range(1, d+1, 2):                       # number of sign changes among the N gaps 0->1, ..., (N-1)->N
        for cuts in itertools.combinations(range(N), c):
            s = np.ones(N, np.int8); sgn = 1; j = 0
            for r in range(N):
                s[r] = sgn
                if j < len(cuts) and cuts[j] == r: sgn = -sgn; j += 1
            out.append(s)                            # gap r->r+1 flips after r; gap (N-1)->N must flip (antiperiodic) iff c odd: ok
    return np.array(out)
def solve(N, d, M=6001):
    S = patterns(N, d); ext = np.hstack([S, -S]); K = N//2 if N % 2 else N//2 - 1
    A = np.unique(np.stack([(S.astype(np.int32)*ext[:, k:k+N]).sum(1) for k in range(1, K+1)], 1), axis=0)/N
    ck = np.cos(np.arange(1, K+1)*np.pi/N); ms = np.arange(1, M+1, 2)
    C = ck[None, :]**ms[:, None]
    A_ub = np.vstack([np.hstack([A, -np.ones((len(A), 1)), np.zeros((len(A), 1))]), np.hstack([-C, np.zeros((len(ms), 1)), -np.ones((len(ms), 1))])])
    b_ub = np.concatenate([np.zeros(len(A)), -(ms == d).astype(float)])
    r = linprog(np.r_[np.zeros(K), 1, 1], A_ub=A_ub, b_ub=b_ub, bounds=[(None, None)]*(K+1) + [(0, None)], method='highs')
    return r.fun, len(S), len(A)
d = int(sys.argv[1])
for N in [int(x) for x in sys.argv[2:]]:
    v, ns, na = solve(N, d)
    print('d=%d N=%3d: bound on (E|F|)^2 = %.6f -> E|F| <= %.6f  (%d patterns, %d distinct)   [2/pi = 0.636620, 17/25 = 0.68]' % (d, N, v, np.sqrt(v), ns, na), flush=True)
