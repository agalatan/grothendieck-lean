"""D1 numerics, part 7: is the Stein kernel tau_{X_s}(x) convex?  (theta_i = 2 lam_i, sum theta_i^2/2 = 1)
tau(x) p_s(x) = sum_i (theta_i^2/2) p_{X_s + theta_i E_i}(x),  E_i ~ Exp(1);  densities by Fourier inversion:
p_V(x) = (1/pi) int_0^inf Re[e^{-itx} phi_V(t)] dt,  phi_{X_s}(t) = prod_j e^{-i theta_j t/2}(1 - i theta_j t)^{-1/2} e^{-s^2 t^2/2}."""
import numpy as np, math
from scipy.integrate import quad
def make(theta, s):
    theta = np.asarray(theta, float)
    def phi(t): return np.prod(np.exp(-1j*theta*t/2)/np.sqrt(1 - 1j*theta*t))*math.exp(-s*s*t*t/2)
    def dens(x, extra=None, limit=1500):
        if extra is None: f = lambda t: (np.exp(-1j*t*x)*phi(t)).real
        else: f = lambda t: (np.exp(-1j*t*x)*phi(t)/(1-1j*extra*t)).real
        return quad(f, 0, np.inf, limit=limit)[0]/math.pi
    def tau(x):
        p = dens(x)
        return sum((th*th/2)*dens(x, th) for th in theta)/p, p
    return tau
def nz(theta): theta = np.asarray(theta, float); return theta*math.sqrt(2/np.sum(theta**2))
rng = np.random.default_rng(21)
cases = [(nz([1,0.5,0.25]),0.0), (nz([1,1,1,0.1,0.1]),0.0), (nz([1]+[0.1]*12),0.0), (nz([1,0.6,0.3,0.1]),0.0),
         (nz([1,0.5]),0.5), (nz([1,0.2]),0.3), (nz([1,0.5,0.25]),1.0), (nz([1,1,1,0.1,0.1]),0.4)]
for k in range(3): cases.append((nz(abs(rng.standard_normal(rng.integers(3,6)))), float(rng.choice([0.0,0.3,1.0]))))
for theta, s in cases:
    tau = make(theta, s)
    m = np.sum(theta)/2; sd = math.sqrt(1+s*s)
    xs = np.linspace(-min(m,3*sd)*0.98 if s==0 else -3*sd, 3*sd, 25)
    vals = []; ps = []
    for x in xs:
        t, p = tau(x); vals.append(t); ps.append(p)
    vals = np.array(vals); ps = np.array(ps)
    d2 = np.diff(vals, 2)
    print(f"theta={np.round(theta,3)} s={s}: tau(0)={tau(0.0)[0]:.4f}  min 2nd diff={d2.min():+.2e} (convex={d2.min()>-1e-6})  "
          f"tau range [{vals.min():.3f},{vals.max():.3f}]  min p on grid={ps.min():.2e}")
    if d2.min() < -1e-6:
        print("    xs:", np.round(xs,2)); print("    tau:", np.round(vals,4))
