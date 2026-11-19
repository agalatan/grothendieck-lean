# run_case.py -- nested Monte Carlo for one P of the third chaos (claude-b9ee research worker, 17 Nov 2026).
# usage: python3 run_case.py <name> <spec> <nout> <M> <nv> <seed> [chunk]
#   spec: diag:l1,l2,...          P = sum l_i h3(X_i) (normalised)
#         FN:N                    P = N^(-1/2) sum_{i<=N} h3(X_i)
#         tensor:<file.npy>       P = T(x,x,x) - 3<trT,x> with T from the file (normalised)
# Output: <name>.npz (per-sample arrays) and one summary line on stdout.
import numpy as np, sys, time, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from omega3lib import *

name, spec, nout, M, nv, seed = sys.argv[1], sys.argv[2], int(sys.argv[3]), int(sys.argv[4]), int(sys.argv[5]), int(sys.argv[6])
chunk = int(sys.argv[7]) if len(sys.argv) > 7 else 128
kind, arg = spec.split(':', 1)
if kind == 'diag':
    P = DiagCubic([float(a) for a in arg.split(',')])
elif kind == 'FN':
    P = DiagCubic(np.ones(int(arg)))
elif kind == 'tensor':
    P = TensorCubic(np.load(arg))
elif kind == 'e3':                       # complete multilinear cubic e3(Z_1..Z_N), normalised
    import itertools
    P = SparseCubic([(i, j, k, 1.0) for i, j, k in itertools.combinations(range(int(arg)), 3)])
elif kind == 'fano':                     # Fano-plane cubic, signs given as a string of + and -
    F = [(0, 1, 2), (0, 3, 4), (0, 5, 6), (1, 3, 5), (1, 4, 6), (2, 3, 6), (2, 4, 5)]
    sg = [1.0 if ch == '+' else -1.0 for ch in arg]
    P = SparseCubic([(i, j, k, s) for (i, j, k), s in zip(F, sg)])
elif kind in ('mlG', 'mlS'):             # random multilinear cubic, Gaussian or sign coefficients: mlG:n:seed
    import itertools
    nn, sd = [int(a) for a in arg.split(':')]
    r = np.random.default_rng(sd)
    P = SparseCubic([(i, j, k, r.standard_normal() if kind == 'mlG' else r.choice([-1.0, 1.0]))
                     for i, j, k in itertools.combinations(range(nn), 3)])
elif kind == 'mix':                      # mix:<eps>:<kind2>:<N>  eps*Q + sqrt(1-eps^2) F_N, Q in {h3, x1He2x2, x1x2x3}
    e_, q_, N_ = arg.split(':'); e_ = float(e_); N_ = int(N_)
    if q_ == 'h3':
        Q = DiagCubic([1.0])
    elif q_ == 'x1He2x2':
        Q = SparseCubic([(0, 1, 2, 1.0)]) if False else TensorCubic(np.load('pert_x1_He2x2_+1.57.npy'))
    elif q_ == 'x1x2x3':
        Q = SparseCubic([(0, 1, 2, 1.0)])
    P = CompositeCubic(Q, DiagCubic(np.ones(N_)), e_, np.sqrt(1-e_*e_))
else:
    raise SystemExit('bad spec')
d = 3
v, wv, t, wt = tgrid(nv)
rng = np.random.default_rng(seed)
t0 = time.time()
Pv, Gm, Ij, Ir = nested_run(P, d, t, nout, M, rng, chunk=chunk, inner='mc' if P.n > 1 else 'none')
el = time.time() - t0
s = summarise(Gm, Ij, t, wt, d, v, wv)
sr = summarise(Gm, Ir, t, wt, d, v, wv)
# E|P| by a separate plain Monte Carlo
rng2 = np.random.default_rng(seed + 10**6)
acc = [];
for _ in range(20):
    acc.append(np.abs(P.val(rng2.standard_normal((200000, P.n)))))
acc = np.concatenate(acc)
EP, EPse = acc.mean(), acc.std()/np.sqrt(len(acc))
np.savez_compressed(name + '.npz', Pv=Pv, Gm=Gm, Ij=Ij, Ir=Ir, t=t, wt=wt, v=v, wv=wv, spec=spec, nout=nout, M=M, nv=nv, seed=seed)
print('%-14s %-28s n=%2d nout=%7d M=%4d nv=%2d | E|P|=%.5f+-%.5f  B=%.5f  R=%.5f+-%.5f  Cov=%+.5f+-%.5f (raw-plugin Cov %+.5f; Cov w/o CV %+.5f+-%.5f) | %.0fs'
      % (name, spec[:28], P.n, nout, M, nv, EP, EPse, s['B'], s['R'], s['R_se'], s['cov_cv'], s['cov_cv_se'], sr['cov_cv'], s['cov'], s['cov_se'], el), flush=True)
print('   c(t): ' + ' '.join('%.3f:%+.4f' % (a, b) for a, b in zip(t, s['ct'])), flush=True)
