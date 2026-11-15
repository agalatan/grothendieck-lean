"""E6: test the law inequality (diamond): for a Wiener chaos variable Y at any scale,
     E[ g(Y) ] <= 2 E[Y^2] E[phi(Y)],   g(y) = |y|(2 Phi(|y|) - 1),  phi = N(0,1) density, Phi its cdf.
Equality for Gaussian Y.  By the OU/Stein argument this family (over the scale of Y) implies E|X| <= sqrt(2/pi)||X||_2
for every real Wiener chaos X of any order, hence the complex charge-one case by phase averaging (K* with L = 0).
Report min over scales of D(rho) = RHS - LHS (>= 0 expected; Rademacher must FAIL)."""
import numpy as np, math
from scipy.special import erf
from scipy.stats import norm
rng = np.random.default_rng(7); n = 4_000_000
def g(y): ay = np.abs(y); return ay*(2*norm.cdf(ay) - 1)
def phi(y): return np.exp(-y*y/2)/math.sqrt(2*math.pi)
def test(X, label):
    X = X/np.sqrt(np.mean(X**2)); worst = (1e9, None)
    out = []
    for rho in [0.02, 0.05, 0.1, 0.2, 0.5, 1, 2, 5, 10, 30, 100]:
        Y = math.sqrt(rho)*X; D = 2*np.mean(Y**2)*np.mean(phi(Y)) - np.mean(g(Y)); rel = D/(2*rho*np.mean(phi(Y)))
        out.append(f"{rel:+.1e}")
        if rel < worst[0]: worst = (rel, rho)
    print(f"{label:34s} m4={np.mean(X**4):6.2f}  min rel.margin {worst[0]:+.2e} at rho={worst[1]:<5}  | " + " ".join(out))
G = rng.standard_normal((n, 4))
test(G[:,0], "Gaussian (identity check)")
test((G[:,0]**3 - 3*G[:,0])/math.sqrt(6), "H3(g)")
test((G[:,0]**2 - 1)*G[:,1]/math.sqrt(2), "(g1^2-1) g2")
test(G[:,0]*G[:,1]*G[:,2], "g1 g2 g3")
test((G[:,0]**2-1)/math.sqrt(2), "H2(g) (degree 2, proved)")
test((G[:,0]**4 - 6*G[:,0]**2 + 3)/math.sqrt(24), "H4(g)")
test((G[:,0]**5 - 10*G[:,0]**3 + 15*G[:,0])/math.sqrt(120), "H5(g)")
for s in range(3):
    a = rng.standard_normal((4,4,4)); a = (a + a.transpose(1,0,2) + a.transpose(0,2,1) + a.transpose(2,1,0) + a.transpose(1,2,0) + a.transpose(2,0,1))/6
    X = np.einsum('ijk,ni,nj,nk->n', a, G, G, G) - 3*np.einsum('iik,nk->n', a, G)   # Wick cubic form (symmetric a)
    test(X, f"random symmetric cubic form #{s}")
# cubic in 2 variables mixing H3 and (g1^2-1)g2
X = 0.6*(G[:,0]**3-3*G[:,0])/math.sqrt(6) + 0.8*(G[:,0]**2-1)*G[:,1]/math.sqrt(2); test(X, "0.6 H3(g1) + 0.8 (g1^2-1)g2")
# complex charge-one cubic real part: Re(H21(z)) with z complex
Z = (G[:,0] + 1j*G[:,1])/math.sqrt(2); test(np.real(Z*(np.abs(Z)**2-2)), "Re H21(z) (complex cubic)")
print("--- non-chaos sanity (should fail):")
test(rng.choice([-1.0,1.0], n), "Rademacher")
test(rng.poisson(0.5, n) - 0.5, "centred Poisson(1/2)")
