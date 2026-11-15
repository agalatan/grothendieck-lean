"""D1 numerics, part 1 (worker claude-b9ee/d1).
E|X| for X = sum lam_i (g_i^2 - 1) via the characteristic-function integral (as in e2_quadratic.py),
cross-checked against the closed form for equal eigenvalues, E|chi2_d - d| = 4 (d/2)^{d/2} e^{-d/2} / Gamma(d/2).
Tests: (A) closed form vs integral; (B) two-eigenvalue Schur test with an independent remainder;
(C) doubling E|X+X'| >= sqrt2 E|X|; (D) sign flip F(lam) <= F(|lam|)."""
import numpy as np, math
from scipy.integrate import quad
from scipy.special import gammaln

def E_abs(lam, limit=800):
    lam = np.asarray(lam, float)
    def integrand(t):
        if t == 0: return 0.0
        phi = np.prod(np.exp(-1j*lam*t)/np.sqrt(1 - 2j*lam*t))
        return (1 - phi.real)/t**2
    v, err = quad(integrand, 0, np.inf, limit=limit)
    return 2/math.pi*v

def closed_equal(d):
    a = d/2
    return 4*math.exp(a*math.log(a) - a - gammaln(a))   # E|chi2_d - d|

G = math.sqrt(2/math.pi)
print("(A) closed form E|chi2_d - d| vs integral with lam_i = 1 (X = chi2_d - d):")
for d in [1,2,3,5,8,20]:
    print(f"   d={d:2d}  closed {closed_equal(d):.8f}  integral {E_abs([1.0]*d):.8f}   ratio to ||X||={closed_equal(d)/math.sqrt(2*d):.6f}")
print(f"   limit sqrt(2/pi) = {G:.6f}")

print("\n(B) two-eigenvalue Schur test: f(theta) = E|r cos(th) xi1 + r sin(th) xi2 + Y|, Y = sum mu_j xi_j fixed")
rng = np.random.default_rng(1)
worst = -1
for trial in range(6):
    k = rng.integers(0, 4)
    mu = list(rng.standard_normal(k)) if k > 0 else []
    r = float(rng.uniform(0.3, 2.0))
    ths = np.linspace(0, math.pi, 37)
    vals = np.array([E_abs(mu + [r*math.cos(t), r*math.sin(t)]) for t in ths])
    i_eq = np.argmin(abs(ths - math.pi/4)); i_eqm = np.argmin(abs(ths - 3*math.pi/4))
    print(f"   Y={np.round(mu,3)} r={r:.3f}: max over th in [0,pi/2] at th={ths[np.argmax(vals[:19])]:.3f} "
          f"(f(pi/4)={vals[i_eq]:.5f}, max={vals[:19].max():.5f}); "
          f"mixed quadrant: f(pi/2)={vals[18]:.5f} f(3pi/4)={vals[i_eqm]:.5f} f(pi)={vals[36]:.5f} max={vals[18:].max():.5f}")

print("\n(C) doubling: E|X+X'| - sqrt2 E|X| for random spectra (should be >= 0 if doubling holds):")
for trial in range(8):
    k = rng.integers(1, 5); lam = rng.standard_normal(k)
    if trial % 2 == 0: lam = abs(lam)
    a = E_abs(np.concatenate([lam, lam])); b = math.sqrt(2)*E_abs(lam)
    print(f"   lam={np.round(lam,3)}: E|X+X'|={a:.6f}  sqrt2 E|X|={b:.6f}  diff={a-b:+.6f}")

print("\n(D) sign flips: F(lam) vs F(|lam|):")
for trial in range(6):
    k = rng.integers(2, 5); lam = rng.standard_normal(k)
    print(f"   lam={np.round(lam,3)}: F(lam)={E_abs(lam):.6f}  F(|lam|)={E_abs(abs(lam)):.6f}")
