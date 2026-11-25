"""N.  The tail row of NOTE.md section 5 in the diffuse one-spike model.

For every unimodular pair and all real l, beta (NOTE.md (5.1)):

    V <= (1-eta) t^2 - 2 l t + 2 beta^2/(eps+eta) + sup_G [ E Phi_eta(L+G, L-G) - ||G||^2/eps ],
    L = l z1 + beta sqrt2 e21(z1),   Phi_eta(a,b) = sup_{|f|=|g|=1} Re(conj(a) f) + Re(conj(b) g) + eta |f+g|^2/4.

For each t the script
 (1) minimises over (l, beta) the value with G restricted to diffuse remote cubics sigma*W ("ideal");
 (2) at that row maximises the bracket over the ten sector parameters of midt_lib.py (random starts
     and the ideal point): a positive excess over (1) means that sectors depending on z1 raise the
     row functional above its diffuse value in this model.
Floating point; Phi_eta by coordinate ascent (a lower bound of the supremum).  A search bounds
suprema from below only.   Usage: python3 tail_row_model.py [nstarts] [seed] [t ...]
"""
import sys
import numpy as np
from scipy.optimize import minimize, minimize_scalar
import midt_lib as L

nstarts = int(sys.argv[1]) if len(sys.argv) > 1 else 4
rng = np.random.default_rng(int(sys.argv[2]) if len(sys.argv) > 2 else 1)
ts = [float(a) for a in sys.argv[3:]] or [0.2528, 0.30, 0.35, 0.40, 0.45, 0.50, 0.55, 0.60, 0.649]


def gvec(sig):
    g = np.zeros(10)
    g[9] = sig
    return g


def inner(l, beta):
    r = minimize_scalar(lambda s: -L.M_tail(l, beta, gvec(s)), bounds=(0.0, 1.2), method="bounded",
                        options={"xatol": 1e-5})
    return -r.fun, r.x


def row(t, l, beta):
    return (1 - L.ETA) * t * t - 2 * l * t + 2 * beta * beta / (L.EPS + L.ETA) + inner(l, beta)[0]


print("t   l  beta  sigma  ideal bound  room to 500/701 | sup over sectors minus ideal, bound, room | maximiser ("
      + ", ".join(L.NAMES) + ")")
for t in ts:
    r = minimize(lambda p: row(t, p[0], p[1]), [L.EPS * t, 0.0], method="Nelder-Mead",
                 options={"xatol": 2e-4, "fatol": 1e-7, "maxiter": 120})
    l, beta = r.x
    m0, sig = inner(l, beta)
    ideal = r.fun
    best, arg = m0, gvec(sig)
    for s in range(nstarts):
        g0 = gvec(sig) + (0.05 if s % 2 == 0 else 0.4) * rng.normal(size=10)
        g0[[4, 8]] = rng.uniform(0, np.pi, 2)
        rr = minimize(lambda g: -L.M_tail(l, beta, g), g0, method="BFGS", options={"gtol": 1e-6, "maxiter": 80})
        if -rr.fun > best:
            best, arg = -rr.fun, rr.x
    print("%.4f  %.4f %.4f %.4f  %.6f  %+.5f | %+.2e  %.6f  %+.5f | %s" % (
        t, l, beta, sig, ideal, L.TARGET - ideal, best - m0, ideal + best - m0, L.TARGET - ideal - (best - m0),
        np.array2string(np.array(arg), precision=3, suppress_small=True)), flush=True)
