"""D1 numerics, part 2. (E) tau(0) = E|X| / (2 p_X(0)) <= 1 ?  (F) shape interpolation Phi(n) = E|sum lam_i (chi2_n - n)/sqrt n| monotone in n ?
(G) monotonicity in theta of the pair test;  (H) Stein identity E|X| - E|G| = sqrt(2/pi) E[X2 w(X)], w(x) = 1 - |x| Mills(|x|)."""
import numpy as np, math
from scipy.integrate import quad
from scipy.stats import norm
from scipy.special import gammaln

def E_abs_shape(lam, n=1.0, limit=800):
    """E|sum_i lam_i (chi2_n(i) - n)/sqrt(n)| via the cf  prod exp(-i lam sqrt(n) t) (1 - 2 i lam t/sqrt(n))^{-n/2}."""
    lam = np.asarray(lam, float); rn = math.sqrt(n)
    def integrand(t):
        if t == 0: return 0.0
        phi = np.prod(np.exp(-1j*lam*rn*t) * (1 - 2j*lam*t/rn)**(-n/2))
        return (1 - phi.real)/t**2
    v, err = quad(integrand, 0, np.inf, limit=limit)
    return 2/math.pi*v
def E_abs(lam): return E_abs_shape(lam, 1.0)
def density0(lam, limit=800):
    lam = np.asarray(lam, float)
    f = lambda t: np.prod(np.exp(-1j*lam*t)/np.sqrt(1 - 2j*lam*t)).real
    v, err = quad(f, 0, np.inf, limit=limit)
    return v/math.pi
def normalise(lam):
    lam = np.asarray(lam, float); return lam/math.sqrt(2*np.sum(lam**2))

rng = np.random.default_rng(7)
print("(E) tau(0) = E|X|/(2 p(0)) for normalised spectra (||X||_2 = 1), d >= 3 (density integral converges):")
for trial in range(8):
    k = rng.integers(3, 7); lam = normalise(rng.standard_normal(k) if trial % 2 else abs(rng.standard_normal(k)))
    e = E_abs(lam); p0 = density0(lam)
    print(f"   lam={np.round(lam,3)}: E|X|={e:.5f} p(0)={p0:.5f} tau(0)={e/(2*p0):.4f}")

print("\n(F) shape interpolation Phi(n), n in {0.5,1,1.5,2,3,5,10,30,100}; differences should be >= 0:")
ns = [0.5, 1, 1.5, 2, 3, 5, 10, 30, 100]
for trial in range(6):
    k = rng.integers(1, 5); lam = normalise(rng.standard_normal(k) if trial % 2 else abs(rng.standard_normal(k)))
    vals = [E_abs_shape(lam, n) for n in ns]
    d = np.diff(vals)
    print(f"   lam={np.round(lam,3)}: Phi={np.round(vals,5)}  min diff={d.min():+.5f}")

print("\n(G) pair test: f(theta) for theta in [pi/4, pi/2], should be decreasing; and on [pi/2, pi] shape:")
for trial in range(4):
    k = rng.integers(0, 4); mu = list(rng.standard_normal(k)) if k else []
    r = float(rng.uniform(0.3, 2.0))
    ths = np.linspace(math.pi/4, math.pi/2, 9)
    vals = np.array([E_abs(mu + [r*math.cos(t), r*math.sin(t)]) for t in ths])
    ths2 = np.linspace(math.pi/2, math.pi, 9)
    vals2 = np.array([E_abs(mu + [r*math.cos(t), r*math.sin(t)]) for t in ths2])
    print(f"   Y={np.round(mu,3)} r={r:.3f}: f on [pi/4,pi/2] diffs max={np.diff(vals).max():+.6f};  f on [pi/2,pi]: {np.round(vals2,4)}")

print("\n(H) Stein identity check: E|X| - sqrt(2/pi) vs sqrt(2/pi) E[X2 w(X)] by Monte Carlo (X2 = 2 sum lam_i^2 xi_i):")
def mills(x): return norm.sf(x)/norm.pdf(x)
for trial in range(3):
    k = rng.integers(1, 5); lam = normalise(abs(rng.standard_normal(k)))
    N = 4_000_000; g2 = rng.standard_normal((N, k))**2 - 1
    X = g2 @ lam; X2 = g2 @ (2*lam**2)
    ax = abs(X); w = 1 - ax*mills(ax)
    lhs = E_abs(lam) - math.sqrt(2/math.pi); rhs = math.sqrt(2/math.pi)*np.mean(X2*w)
    print(f"   lam={np.round(lam,3)}: lhs={lhs:+.5f}  rhs(MC)={rhs:+.5f}  (MC E|X|={ax.mean():.5f} exact {E_abs(lam):.5f})")
