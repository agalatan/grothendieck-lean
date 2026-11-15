# REVIEW_4 (claude-b9ee, 15 November 2026): written by the reviewer agent of the session, copied from its scratch folder; the uniform bound C <= 1/50 recomputed with the reviewer's own profile (needs tables.npz).
# claude reviewer (N): the dependency C <= 1/50 (content_next_proof.md): C <= lam*u + E Omega(|l|^2),
# Omega(T) = sup_rho { sqrt(T) rho |h(rho^2) - k| - lam rho^2 },  k = 49/500, lam = 13/50, u <= 463/10000.
# The Fenchel-Young step and Pi_1 q = 0 (to subtract k q) are elementary; here only the number is recomputed with my own h.
import numpy as np, os
from scipy.interpolate import CubicSpline
HERE = os.path.dirname(os.path.abspath(__file__))
tb = np.load(os.path.join(HERE, 'tables.npz')); R, FR, c0 = tb['R'], tb['Fraw'], float(tb['c0'])
sp = CubicSpline(R, FR)
rho = np.concatenate([np.linspace(1e-4, 4, 40000), np.linspace(4, 60, 5601)[1:]])
h = sp(rho)/rho - c0
k, lam = 49/500, 13/50
print('range of h on grid: [%.5f, %.5f] (cert: -1/40 < h < 253/1000)' % (h.min(), h.max()))
T = np.concatenate([np.linspace(0, 16, 3201), np.linspace(16, 60, 2201)[1:]])
dev = np.abs(h - k)
Om = np.array([max(0.0, (np.sqrt(t)*rho*dev - lam*rho*rho).max()) for t in T])
EOm = np.trapezoid(np.exp(-T)*Om, T)
print('E Omega = %.6f;  bound lam*u + E Omega at u=0.0463: %.6f  (author: 0.0198036642 < 1/50)' % (EOm, lam*0.0463 + EOm))
