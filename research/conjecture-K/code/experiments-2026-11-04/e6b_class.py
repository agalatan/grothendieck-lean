"""E6b: which laws satisfy (diamond)?  mixed chaos (polynomials of Gaussians), analytic non-polynomial images, bounded images."""
import numpy as np, math
from scipy.stats import norm
rng = np.random.default_rng(11); n = 4_000_000
def g(y): ay = np.abs(y); return ay*(2*norm.cdf(ay) - 1)
def phi(y): return np.exp(-y*y/2)/math.sqrt(2*math.pi)
def test(X, label):
    X = X - np.mean(X); X = X/np.sqrt(np.mean(X**2)); worst = (1e9, None); out=[]
    for rho in [0.02, 0.1, 0.5, 1, 2, 5, 10, 30, 100, 1000]:
        Y = math.sqrt(rho)*X; rel = (2*np.mean(Y**2)*np.mean(phi(Y)) - np.mean(g(Y)))/(2*rho*np.mean(phi(Y))); out.append(f"{rel:+.1e}")
        if rel < worst[0]: worst = (rel, rho)
    print(f"{label:30s} E|X|/s={np.mean(np.abs(X)):.4f}  min margin {worst[0]:+.2e} @rho={worst[1]:<5} | " + " ".join(out))
G = rng.standard_normal((n,3)); g1=G[:,0]; g2=G[:,1]
print("sqrt(2/pi) = 0.7979; mixed chaos (polynomials of Gaussians):")
test(g1**3, "g^3 (H3+3H1)")
test(g1**4, "g^4")
test(g1**2 + 0.5*g1, "g^2 + 0.5 g")
test(g1*g2 + 0.3*g1, "g1 g2 + 0.3 g1")
test(g1**6, "g^6")
test(np.exp(g1), "exp(g) (lognormal)")
test(np.exp(0.3*g1), "exp(0.3 g)")
test(g1**2*g2 + g2**3, "g1^2 g2 + g2^3")
print("bounded / other images of a Gaussian:")
test(np.sin(g1), "sin(g)")
test(np.sin(3*g1), "sin(3g)")
test(np.tanh(g1), "tanh(g)")
test(np.tanh(3*g1), "tanh(3g)")
test(np.abs(g1), "|g|")
test(np.maximum(g1,0), "max(g,0)")
test(np.sign(g1)*np.abs(g1)**0.5, "sign(g)|g|^0.5")
test(np.sign(g1)*np.abs(g1)**1.5, "sign(g)|g|^1.5")
test(rng.laplace(size=n), "Laplace")
test(rng.standard_t(5, size=n), "Student t5")
test(rng.uniform(-1,1,size=n), "Uniform")
