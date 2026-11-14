"""E2 (real, degree 2): maximise E|X|/||X||_2 over Gaussian quadratic forms X = sum_i lam_i (g_i^2 - 1).
E|X| from the characteristic function: E|X| = (2/pi) * int_0^inf (1 - Re phi(t))/t^2 dt, phi(t) = prod_i exp(-i lam_i t)/sqrt(1 - 2 i lam_i t).
Normalise sum lam_i^2 = 1/2 so that ||X||_2 = 1.  Gaussian value sqrt(2/pi) = 0.797885; rank one: 0.684."""
import numpy as np, math
from scipy.integrate import quad
def E_abs(lam):
    lam = np.asarray(lam, float)
    def integrand(t):
        if t == 0: return 0.0
        phi = np.prod(np.exp(-1j*lam*t)/np.sqrt(1 - 2j*lam*t))
        return (1 - phi.real)/t**2
    v, err = quad(integrand, 0, np.inf, limit=400)
    return 2/math.pi*v
def nrm(lam): return math.sqrt(2*float(np.sum(np.asarray(lam)**2)))
def ratio(lam): return E_abs(lam)/nrm(lam)
print("equal positive eigenvalues, d = 1..64:")
for d in [1,2,3,4,6,8,12,16,32,64]:
    print(f"  d={d:3d}: {ratio([1.0]*d):.5f}")
print("mixed signs (d/2 positive, d/2 negative), d = 2..32:")
for d in [2,4,8,16,32]:
    print(f"  d={d:3d}: {ratio([1.0]*(d//2) + [-1.0]*(d//2)):.5f}")
print("random spectra (Nelder-Mead ascent over 6 eigenvalues, 20 starts):")
from scipy.optimize import minimize
rng = np.random.default_rng(3); best = 0
for s in range(20):
    x0 = rng.standard_normal(6)
    r = minimize(lambda x: -ratio(x), x0, method='Nelder-Mead', options=dict(maxiter=600, xatol=1e-6, fatol=1e-8))
    best = max(best, -r.fun)
    if s % 5 == 4: print(f"  after {s+1} starts: best {best:.5f}  (last spectrum, normalised: {np.round(r.x/nrm(r.x)*math.sqrt(2),3)})")
print(f"Gaussian value sqrt(2/pi) = {math.sqrt(2/math.pi):.5f}")
