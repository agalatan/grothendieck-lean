"""Second variation of T2 at decoupled (a = 0) cubics q0 = sum_k conj(W_k) F_k(Y) in H_{2,1}(C^3), all 36 real directions (label N).

Q(p) = lim [T2(q0+eps p) + T2(q0-eps p)]/(2 eps^2)  (T2(q0) = 0, first variation zero).  Prints the lowest eigenvalues of the
36x36 real Hessian divided by D(q0), for the sqrt profile (u = 1) and the peak profile (u = 0.0463).
usage: t05_hessian_n3.py <base> <profile>   base in {x2y, wxy, wx2y2, wx2cy2, w1x2w2xy}   profile in {sqrt, peak:<u>, buf:<s2>}
"""
import sys, os, math, time, json
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from dslib import *
from dsn import *

def base_tensor(name):
    t = np.zeros((3, 3, 3), complex)   # coordinates: 0 = X, 1 = Y, 2 = W
    if name == 'x2y': t[0, 0, 1] = 1                        # X^2 conj(Y)
    elif name == 'wxy': t[0, 1, 2] = t[1, 0, 2] = 0.5       # X Y conj(W)
    elif name == 'wx2y2': t[0, 0, 2] = 1; t[1, 1, 2] = 1    # (X^2+Y^2) conj(W)
    elif name == 'wx2cy2': t[0, 0, 2] = 1; t[1, 1, 2] = 0.4
    elif name == 'w1x2w2xy': t[0, 0, 1] = 1; t[0, 0, 2] = 0  # placeholder, replaced below
    else: raise ValueError(name)
    return t

def onb(n):
    B = []
    for i in range(n):
        for j in range(i, n):
            for k in range(n):
                t = np.zeros((n, n, n), complex); t[i, j, k] += 0.5; t[j, i, k] += 0.5
                B.append(normalise(t))
    return B

if __name__ == '__main__':
    base, spec = sys.argv[1], sys.argv[2]
    prof = SqrtProfile(1.0) if spec == 'sqrt' else (peak_profile(float(spec[5:])) if spec.startswith('peak:') else buffer_profile(float(spec[4:])))
    g = ChunkGrid(3, [0, 1, 2.5, 5, 9, 15, 26], 4, 8)
    print('grid points', g.size, flush=True)
    q0 = normalise(base_tensor(base), prof.u)
    (r0,), m0 = g.run(q0, [prof])
    print(f'base {base}: D={r0["D"]:.6e} T1={r0["T1"]:.6e} T2={r0["T2"]:+.2e} chi={m0["delta"]/prof.u**2:.3f}', flush=True)
    B = onb(3); dirs = [b for b in B] + [1j * b for b in B]; nd = len(dirs)
    eps = 0.05
    def Q(p):
        (a,), _ = g.run(normalise(q0 / math.sqrt(prof.u) + eps * p, prof.u), [prof])
        (b,), _ = g.run(normalise(q0 / math.sqrt(prof.u) - eps * p, prof.u), [prof])
        return 0.5 * (a['T2'] + b['T2']) / eps ** 2
    t0 = time.time()
    diag = np.array([Q(d) for d in dirs])
    print('diag done', time.time() - t0, flush=True)
    H = np.diag(diag)
    for a in range(nd):
        for b in range(a + 1, nd):
            qs = Q((dirs[a] + dirs[b]) / math.sqrt(2))
            H[a, b] = H[b, a] = qs - 0.5 * (diag[a] + diag[b])
        if a % 6 == 0: print('row', a, time.time() - t0, flush=True)
    ev, evec = np.linalg.eigh(H)
    print('eigenvalues / D(q0):', np.array2string(ev / r0['D'], precision=4, max_line_width=200))
    np.save(f'hess_n3_{base}_{spec.replace(":", "")}.npy', H)
    v = evec[:, 0]; p = sum(v[i] * dirs[i] for i in range(nd))
    print('lowest eigenvector as a tensor (indices X,Y,W):'); np.set_printoptions(precision=3, suppress=True)
    for k in range(3): print('k=%d' % k); print(p[:, :, k])
