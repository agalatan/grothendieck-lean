# claude-b9ee research worker (fourpartite): task 4, N-level (floating point, orientation only).
# Normalised deficit D = (1 - E|Q|/(sqrt(2/pi)||Q||)) / kappa4(Q/||Q||) for Q = sum_i lam_i (g_i^2-1) + mu_i g_i.
# Near the Gaussian D -> (1 - kappa3^2/kappa4)/24 >= 1/96; a configuration with D <= 0 would refute task 4's claim.
import numpy as np
from scipy import optimize
import sys, time
sys.path.insert(0, '.')
from n05_general_deg2 import EabsQ

def k34(lam, mu):
    v = np.sum(2*lam**2 + mu**2)
    l = lam/np.sqrt(v); m = mu/np.sqrt(v)
    return np.sum(8*l**3 + 6*m**2*l), np.sum(48*l**4 + 48*m**2*l**2)

def D(z, n):
    lam, mu = z[:n], z[n:]
    if np.sum(lam**2) < 1e-10:
        return 1.0
    k3, k4 = k34(lam, mu)
    return (1 - EabsQ(lam, mu))/k4

if __name__ == '__main__':
    t0 = time.time()
    rng = np.random.default_rng(11)
    print('min of D = (1 - ratio)/kappa4 (Edgeworth value (1 - k3^2/k4)/24 in brackets)')
    for n in [1, 2, 3, 4]:
        bestv = 1e9; bestz = None
        for trial in range(30):
            z = rng.normal(size=2*n)*np.concatenate([np.full(n, rng.uniform(0.05, 1.5)), np.ones(n)])
            v = D(z, n)
            if v < bestv: bestv, bestz = v, z
        res = optimize.minimize(lambda z: D(z, n), bestz, method='Nelder-Mead',
                                options={'maxiter': 250*n, 'xatol': 1e-6, 'fatol': 1e-10})
        z = res.x; lam, mu = z[:n], z[n:]
        nrm = np.sqrt(np.sum(2*lam**2 + mu**2)); k3, k4 = k34(lam, mu)
        print('n=%d: min D ~ %.6f  [%.6f]  at lam=%s mu=%s  kappa4=%.4g ratio=%.8f' % (
            n, res.fun, (1 - k3*k3/k4)/24, np.round(lam/nrm, 4), np.round(mu/nrm, 4), k4, EabsQ(lam, mu)))
        sys.stdout.flush()
    # compare: bipartite one block (lam pair +-c/2, mu = (a+b)/sqrt2, (a-b)/sqrt2) at a = b
    print('bipartite one block a = b (Theorem 1 family) in the same normalisation:')
    for c in [0.05, 0.2, 0.5, 0.8]:
        a = np.sqrt((1 - c*c)/2)
        lam = np.array([c/2, -c/2]); mu = np.array([np.sqrt(2)*a, 0.0])
        k3, k4 = k34(lam, mu)
        print('  c=%.2f: D = %.6f [%.6f]' % (c, (1 - EabsQ(lam, mu))/k4, (1 - k3*k3/k4)/24))
    print('time %.0f s' % (time.time() - t0))
