# run_pair.py -- nested Monte Carlo for P near h3, with h3(X_1) itself as a control variate on common random numbers.
# usage: python3 run_pair.py <name> <tensor.npy> <nout> <M> <nv> <seed>
# Cov(P) = Cov_hat(P) - beta (Cov_hat(h3) - Cov_exact(h3)), beta fitted from the per-sample influence functions,
# Cov_exact(h3) from the 1-D quadrature on the same t-grid (h3_1d.py). Standard errors from the residual influence.
import numpy as np, sys, time, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from omega3lib import *
from scipy.special import ndtr

name, tf, nout, M, nv, seed = sys.argv[1], sys.argv[2], int(sys.argv[3]), int(sys.argv[4]), int(sys.argv[5]), int(sys.argv[6])
if tf.startswith('e3:'):
    P = E3Cubic(int(tf[3:])); P0 = RotH3(np.ones(P.n))       # e3(N) and its L2 limit h3(mean)
else:
    P = TensorCubic(np.load(tf))
    lam = np.zeros(P.n); lam[0] = 1.0
    P0 = DiagCubic(lam)
n = P.n
d = 3
v, wv, t, wt = tgrid(nv)
# exact h3 quantities on this t-grid (1-D quadrature)
xq = np.linspace(-12, 12, 480001); wq = phi(xq)*(xq[1]-xq[0]); s3 = np.sqrt(3)
mu_ex = np.zeros(nv); A_ex = np.zeros(nv)
for j, tt in enumerate(t):
    sg = np.sqrt(1-tt); m = np.sqrt(tt)*xq
    p = np.zeros_like(xq)
    for a, b in [(-s3, 0.0), (s3, np.inf)]:
        za, zb = (a-m)/sg, (b-m)/sg
        p += np.where(za >= 0, ndtr(-za) - ndtr(-zb), ndtr(zb) - ndtr(za))
    It = I_of_p(p); mu_ex[j] = np.sum(It*wq); A_ex[j] = np.sum(It*wq*(xq*xq-1)**2/2)
wtd = wt*d*t**(d-1)
cov0_exact = np.sum(wtd*(A_ex/mu_ex - 1.0))
rng = np.random.default_rng(seed)
x = rng.standard_normal((nout, n))
t0 = time.time()
Pv, Gm, Ij, Ir = nested_run(P, d, t, nout, M, np.random.default_rng(seed+1), chunk=128, x_given=x, inner='mc')
P0v, G0, I0, _ = nested_run(P0, d, t, nout, 4, np.random.default_rng(seed+2), chunk=4096, x_given=x, inner='mc')
el = time.time()-t0
s = summarise(Gm, Ij, t, wt, d, v, wv)
s0 = summarise(G0, I0, t, wt, d, v, wv)
# use the E Gamma = 1 form for both (influence 'infl' without the Gamma-mean CV) and the CV form; take the better
res = {}
for key, cv in [('plain', False), ('gcv', True)]:
    mu = Ij.mean(0); A = (Ij*Gm[:, None]).mean(0); mu0 = I0.mean(0); A0 = (I0*G0[:, None]).mean(0)
    if cv:
        c1 = np.sum(wtd*(A/mu - Gm.mean())); c0 = np.sum(wtd*(A0/mu0 - G0.mean()))
        f1 = np.sum(wtd[None, :]*Ij*(Gm[:, None]-(A/mu)[None, :])/mu[None, :], 1) - (Gm-Gm.mean())*np.sum(wtd)
        f0 = np.sum(wtd[None, :]*I0*(G0[:, None]-(A0/mu0)[None, :])/mu0[None, :], 1) - (G0-G0.mean())*np.sum(wtd)
    else:
        c1 = np.sum(wtd*(A/mu - 1)); c0 = np.sum(wtd*(A0/mu0 - 1))
        f1 = np.sum(wtd[None, :]*Ij*(Gm[:, None]-(A/mu)[None, :])/mu[None, :], 1)
        f0 = np.sum(wtd[None, :]*I0*(G0[:, None]-(A0/mu0)[None, :])/mu0[None, :], 1)
    beta = np.cov(f1, f0)[0, 1]/np.var(f0, ddof=1)
    est = c1 - beta*(c0 - cov0_exact)
    se = np.std(f1 - beta*f0, ddof=1)/np.sqrt(nout)
    res[key] = (est, se, beta, c1, np.std(f1, ddof=1)/np.sqrt(nout), c0)
key = min(res, key=lambda k: res[k][1])
est, se, beta, c1, se1, c0 = res[key]
R = np.sqrt(2/np.pi)*np.sqrt(1+est)
rng2 = np.random.default_rng(seed + 10**6)
acc = np.concatenate([np.abs(P.val(rng2.standard_normal((200000, n)))) for _ in range(20)])
np.savez_compressed(name + '.npz', Pv=Pv, Gm=Gm, Ij=Ij, Ir=Ir, G0=G0, I0=I0, t=t, wt=wt, v=v, wv=wv)
print('%-14s n=%d nout=%6d M=%3d nv=%2d | E|P|=%.5f+-%.5f  B=%.5f  R=%.5f+-%.5f  Cov=%+.5f+-%.5f [%s, beta=%.3f; raw Cov %+.5f+-%.5f; h3 on same samples %+.5f vs exact %+.6f] | %.0fs'
      % (name, n, nout, M, nv, acc.mean(), acc.std()/np.sqrt(len(acc)), s['B'], R, np.sqrt(2/np.pi)*se/(2*np.sqrt(1+est)),
         est, se, key, beta, c1, se1, c0, cov0_exact, el), flush=True)
print('   c(t): ' + ' '.join('%.3f:%+.4f' % (a, b) for a, b in zip(t, s['ct'])), flush=True)
