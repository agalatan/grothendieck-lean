"""E8: the two-parameter cubic family Y = a*H3(g) + b*(g^2-1)*h, conditioned on g (Y affine in h): closed-form in h, 1-D integral in g.
Claim (Key Lemma, k=3):  E[|DY|^2 phi(Y)] <= 3 sigma^2 E[phi(Y)],  |DY|^2 = (3a(g^2-1) + 2 b g h)^2 + b^2 (g^2-1)^2.
Given g: Y = A + B h, A = a(g^3-3g), B = b(g^2-1). E_h[phi(A+Bh)] = phi_{s}(A)/... closed form via Gaussian convolution:
  E_h[phi(A+Bh) h^m] computed by Gauss-Hermite in h (exact enough). Report D(a,b) = 3 sigma^2 E phi(Y) - E[|DY|^2 phi(Y)] (should be >= 0)."""
import numpy as np, math
from numpy.polynomial.hermite_e import hermegauss
gq, gw = hermegauss(200); gw = gw/math.sqrt(2*math.pi)     # standard normal quadrature
hq, hw = hermegauss(120); hw = hw/math.sqrt(2*math.pi)
def phi(y): return np.exp(-y*y/2)/math.sqrt(2*math.pi)
def D(a, b, scale=1.0):
    G = gq[:,None]; H = hq[None,:]; W = gw[:,None]*hw[None,:]
    Y = scale*(a*(G**3-3*G) + b*(G**2-1)*H)
    DY2 = scale**2*((3*a*(G**2-1) + 2*b*G*H)**2 + (b*(G**2-1))**2)
    s2 = scale**2*(6*a*a + 2*b*b)
    lhs = np.sum(W*DY2*phi(Y)); rhs = 3*s2*np.sum(W*phi(Y))
    return (rhs-lhs)/rhs
print("relative margin (RHS-LHS)/RHS, should be > 0; Gaussian would give 0")
for (a,b) in [(1,0),(0,1),(1,1),(1,-1),(0.3,1),(1,0.3),(0.1,1),(1,3),(3,1)]:
    print(f"a={a:4} b={b:4}: " + " ".join(f"s={s:<5}{D(a,b,s):+.4f}" for s in [0.05,0.2,0.5,1,2,5]))
