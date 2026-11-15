"""E7b: precise small-eps asymptotics of F(G) - F(sigma W) for a(T) = T (and T+eta), G = eps z2 (T-1+delta(S-2)), delta=1/12.
Adaptive quadrature in T (resolves T ~ eps^{2/3}), Gauss-Laguerre (200) in S; theta-average by the elliptic formula."""
import numpy as np, math
from scipy.special import ellipe
from scipy.integrate import quad
from numpy.polynomial.laguerre import laggauss
sq, sw = laggauss(120); delta = 1/12
tau2 = float(np.sum(sw*sq*(0-1+delta*(sq-2))**2*0)) # placeholder
def mabs(x, y):
    s = x + y; m = 4*x*y/max(s,1e-300)**2 if s > 0 else 0.0; return (2/math.pi)*s*ellipe(min(m,1.0))
def inner(T, eta, eps, gauss, tau2):
    x = math.sqrt(T)*abs(T + eta)
    if gauss: ys = eps*math.sqrt(tau2)*np.sqrt(sq)
    else: ys = eps*np.sqrt(sq)*np.abs(T-1+delta*(sq-2))
    return float(np.sum(sw*np.array([mabs(x, y) for y in ys])))
def F(eta, eps, gauss, tau2):
    f = lambda T: math.exp(-T)*inner(T, eta, eps, gauss, tau2)
    a = eps**(2/3)
    v1,_ = quad(f, 0, 20*a, limit=400); v2,_ = quad(f, 20*a, 2.0, limit=400); v3,_ = quad(f, 2.0, 60, limit=400)
    return 2*(v1+v2+v3)
# tau^2 = E[S (T-1+delta(S-2))^2] over T,S ~ Exp(1): E_T (T-1)^2 = 1; cross term 0; E_S S (delta(S-2))^2 = delta^2 E[S(S-2)^2] = 2 delta^2
tau2 = 1 + 2*delta**2
for eta in [0.0, 0.01]:
    print(f"a(T) = T + {eta}:")
    for eps in [3e-3, 1e-3, 3e-4, 1e-4, 3e-5, 1e-5]:
        d = F(eta, eps, False, tau2) - F(eta, eps, True, tau2)
        print(f"   eps={eps:<7} F(G)-F(sW) = {d:+.3e}   /eps^(5/3) = {d/eps**(5/3):+.4f}   /eps^2 = {d/eps**2:+.3f}", flush=True)
