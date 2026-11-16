# Complex analogue of the diagonal part of Koenig's kernel exp(-|x|^2/2-|y|^2/2) sin<x,y> on C^n = R^2n.  [N, P sketch]
# With U, V standard complex Gaussians and normalised Hermite H_{k+1,k}:
#   a_k = (pi/2) E[ conj(H_{k+1,k}(U)) sin(Re(U conj V)) H_{k+1,k}(V) ] = (pi/2) (-1)^k I_k,
#   I_k = 2^{-(2k+1)} / ((k+1)! k!) * E[ (-1)^k k! L_k^(1)(S) S^{k+1} e^{-S/4} ],  S = |U|^2 ~ Exp(1).
# (E_V[e^{i Re(U conj V)} H_{p,q}(V)] = (iU/2)^p (i conj U/2)^q e^{-|U|^2/4}.)  Checked below by Monte Carlo.
import numpy as np, sys
from math import factorial
from scipy.special import eval_genlaguerre
from scipy.integrate import quad
def I(k):
    f = lambda s: (-1) ** k * factorial(k) * eval_genlaguerre(k, 1, s) * s ** (k + 1) * np.exp(-s / 4) * np.exp(-s)
    v, _ = quad(f, 0, 200, limit=400)
    return 2.0 ** (-(2 * k + 1)) * v / (factorial(k + 1) * factorial(k))
Ik = np.array([I(k) for k in range(12)])
lam = np.array([(-1) ** k * Ik[k] / Ik[0] for k in range(12)])
print('I_k', np.round(Ik, 8)); print('Koenig game lambda_k', np.round(lam, 6))
print('ratios |lam_{k+1}/lam_k|', np.round(np.abs(lam[1:] / lam[:-1]), 4))
if len(sys.argv) > 1:
    # Monte Carlo check of a_k for k = 0, 1, 2
    from gm import herm_c
    rng = np.random.default_rng(0); N = 2_000_000
    U = (rng.normal(size=N) + 1j * rng.normal(size=N)) / np.sqrt(2); V = (rng.normal(size=N) + 1j * rng.normal(size=N)) / np.sqrt(2)
    for k in range(3):
        hU = herm_c(k + 1, k, U); hV = herm_c(k + 1, k, V)
        mc = np.mean(np.conj(hU) * np.sin(np.real(U * np.conj(V))) * hV)
        print('k', k, 'MC', mc, ' formula (-1)^k I_k', (-1) ** k * Ik[k])
