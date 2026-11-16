#!/usr/bin/env python3
# Reviewer (N): Lemma 5 of PROOFS.md.  The sign-averaged representative
#     Ztilde = X' [ (2S - 1) g_m(b) + 2 S b / sqrt(m) ],   b = |B|, X' = sign(B) X,
# must (i) have the same conditional expectation given q as Z = X(2S(1 + B/sqrt m) - 1), i.e. the same Z-kernel,
# (ii) squared norm 17 J_m + 24/m, (iii) <Ztilde, q> = 4/sqrt(m)   (normalised: sigma = 1).
import sys, math
import numpy as np
from scipy.special import gammaln
sys.path.insert(0, sys.argv[1])
import siglib as L
r, wr = L.r_grid(90.0)
for m in (1, 2, 4, 12, 22):
    sm = math.sqrt(m)
    law = L.EqualLaw(m); p, w1, zp, _ = L.hermitian_kernels(law, r)
    f = lambda b: np.where(m + sm * b > 0, sm * np.exp((m - 1) * np.log(np.maximum(m + sm * b, 1e-300)) - (m + sm * b) - gammaln(m)), 0.0)
    # nodes for b = |B| > 0 with geometric refinement at 0 and a break at sqrt(m) (end of the support of the reflected density)
    b, wb = L.refined_nodes(0.0, 70.0 / sm + 25.0, [0.0, sm]); b = np.maximum(b, 1e-300)
    fp, fm_ = f(b), f(-b); dens = fp + fm_; g = (fp - fm_) / np.maximum(dens, 1e-300)
    J = float(wb @ (g * g * dens))
    # kernel of Ztilde:  E[kappa(r, b) sqrt(S) ((2S - 1) g(b) + 2 S b/sqrt m)],  S = r^2/b^2
    zt = np.zeros(len(r)); pt = np.zeros(len(r))
    for i in range(0, len(r), 256):
        rr = r[i:i + 256][:, None]; S = rr * rr / (b * b)[None, :]
        K = 2 * rr / (b * b)[None, :] * np.exp(-S) * (wb * dens)[None, :]
        zt[i:i + 256] = (K * (rr / b[None, :]) * ((2 * S - 1) * g[None, :] + 2 * S * b[None, :] / sm)).sum(1)
        pt[i:i + 256] = K.sum(1)
    scale = np.abs(zp).max()
    # exact moments of Ztilde: E[S((2S-1) g + 2 S b/sqrt m)^2] = 17 J + (40/sqrt m) E[b g] + 24/m,  E[b g(b)] = E B = 0
    Ebg = float(wb @ (b * g * dens)); Eb2 = float(wb @ (b * b * dens))
    n2 = 17 * J + 40 / sm * Ebg + 24 / m * Eb2
    zq = float(wr @ (r * zt))
    print('m = %2d: kernels of Z and Ztilde agree to %.1e (relative to max |zp| = %.3f); density of |q| agrees to %.1e; E[b g_m(b)] = %.1e, E b^2 = %.10f;  ||Ztilde||^2 = %.6f = 17 J_m + 24/m = %.6f (J_m = %.8f);  <Ztilde, q> = %.8f (4/sqrt m = %.8f)' % (
        m, np.abs(zt - zp).max() / scale, scale, np.abs(pt - p).max(), Ebg, Eb2, n2, 17 * J + 24 / m, J, zq, 4 / sm))
    assert np.abs(zt - zp).max() / scale < 1e-8 and abs(Ebg) < 1e-9 and abs(zq - 4 / sm) < 1e-8
print('Lemma 5: ok')
