"""D1 numerics, part 5: the OU path X_c = c X + sqrt(1-c^2) G.
(a) C7: D(sigma) = E[X2 exp(-X^2/(2 sigma^2))] <= 0 for all sigma, X2 = 2 sum lam_i^2 xi_i, via Fourier:
    D(sigma) = (2 sigma/sqrt(2pi)) int_0^inf Re Xi(t) e^{-sigma^2 t^2/2} dt, Re Xi(t) = -4 t Im[phi_X(t) sum lam_i^3/(1-2i lam_i t)].
(b) direct: E|X_c| decreasing in c (cf phi_X(ct) e^{-(1-c^2)t^2/2}).  (c) derivative formula check."""
import numpy as np, math
from scipy.integrate import quad
def phiX(lam, t): return np.prod(np.exp(-1j*lam*t)/np.sqrt(1 - 2j*lam*t))
def E_abs_c(lam, c, limit=1000):
    lam = np.asarray(lam, float)
    f = lambda t: 0.0 if t == 0 else (1 - (phiX(lam, c*t)*math.exp(-(1-c*c)*t*t/2)).real)/t**2
    return 2/math.pi*quad(f, 0, np.inf, limit=limit)[0]
def D(lam, sigma, limit=1000):
    lam = np.asarray(lam, float)
    def reXi(t):
        return -4*t*(phiX(lam, t)*np.sum(lam**3/(1-2j*lam*t))).imag
    f = lambda t: reXi(t)*math.exp(-sigma*sigma*t*t/2)
    return 2*sigma/math.sqrt(2*math.pi)*quad(f, 0, np.inf, limit=limit)[0]
def nz(lam): lam = np.asarray(lam, float); return lam/math.sqrt(2*np.sum(lam**2))
rng = np.random.default_rng(11)
spectra = [nz([1.0]), nz([1,1,1,0.1/math.sqrt(2),0.1/math.sqrt(2)]), nz([1,1,1,0.3*math.cos(1.4),0.3*math.sin(1.4)]),
           nz([1]+[0.05]*64), nz([1,1,0.3,0.3,0.3,0.3]), nz([1,-1]), nz([1,-0.5]), nz([1,1,-0.7]), nz([0.567,-0.208,-0.263,0.207,0.151]),
           nz([2,-1,-1]), nz([1,1,1,-0.3,-0.3])]
for k in range(5):
    spectra.append(nz(rng.standard_normal(rng.integers(2,7))))
sigmas = [0.02, 0.05, 0.1, 0.2, 0.4, 0.7, 1.0, 1.5, 2.5, 5.0, 20.0]
cs = [1.0, 0.98, 0.95, 0.9, 0.8, 0.7, 0.5, 0.3, 0.1]
print("(a) D(sigma) = E[X2 exp(-X^2/2sigma^2)] (should be <= 0), (b) E|X_c| for decreasing c (should increase)")
viol = 0
for lam in spectra:
    Ds = [D(lam, s) for s in sigmas]
    Es = [E_abs_c(lam, c) for c in cs]
    bad = max(Ds) > 1e-9 or min(np.diff(Es)) < -1e-9
    viol += bad
    print(f" lam={np.round(lam,3)}\n    D: {np.round(Ds,5)}  maxD={max(Ds):+.2e}\n    E|X_c|: {np.round(Es,5)}  min increment={min(np.diff(Es)):+.2e}{'  <-- VIOLATION' if bad else ''}")
print("violations:", viol)
print("(c) derivative check at c=0.8 for spectrum 2: FD vs (2c/s) E[X2 phi(cX/s)] = (2c/s) D(s/c)/sqrt(2pi)")
lam = spectra[2]; c = 0.8; s = math.sqrt(1-c*c); h = 1e-4
fd = (E_abs_c(lam, c+h) - E_abs_c(lam, c-h))/(2*h)
print(f"    FD={fd:+.6f}  formula={(2*c/s)*D(lam, s/c)/math.sqrt(2*math.pi):+.6f}")
