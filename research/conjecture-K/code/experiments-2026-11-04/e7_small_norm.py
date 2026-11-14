"""E7: same-norm comparison at SMALL norm (the regime of the pasted counterexamples), by quadrature.
F(G) = E|L+G| + E|L-G|, L = z1 a(T), T=|z1|^2 ~ Exp(1); G = eps*Y with Y = z2*(T-1+delta*(S-2)) (S=|z2|^2 ~ Exp(1), mean-zero factor),
|Y|^2 = S (T-1+delta(S-2))^2 ; competitor eps*tau*W, tau = ||Y||.  Relative phase uniform in both cases.
E_theta |x + y e^{i theta}| = (2/pi)(x+y) E_ell(4xy/(x+y)^2).  Quadrature: Gauss-Laguerre in T and S (and V=|W|^2)."""
import numpy as np, math
from scipy.special import ellipe
from numpy.polynomial.laguerre import laggauss
tq, tw = laggauss(160)           # Exp(1) nodes/weights
def mabs(x, y):
    s = x + y; m = np.where(s > 0, 4*x*y/np.maximum(s,1e-300)**2, 0.0); return (2/math.pi)*s*ellipe(np.minimum(m, 1.0))
def F_pair(a, Y2fun, eps):
    """E over T,S of E_theta|x + eps*y e^{i th}| *2 (both signs equal) with x = sqrt(T)|a(T)|, y = sqrt(Y2(T,S))"""
    T = tq[:,None]; S = tq[None,:]; w = tw[:,None]*tw[None,:]
    x = np.sqrt(T)*np.abs(a(T)); y = eps*np.sqrt(Y2fun(T,S))
    return 2*np.sum(w*mabs(x, y))
def run(a, label, delta=1/12):
    Y2 = lambda T,S: S*(T-1+delta*(S-2))**2
    tau2 = np.sum(tw[:,None]*tw[None,:]*Y2(tq[:,None], tq[None,:])); tau = math.sqrt(tau2)
    W2 = lambda T,S: tau2*S          # tau*W: |tau W|^2 = tau^2 * Exp(1)
    print(f"{label}: tau^2 = {tau2:.4f}")
    for eps in [0.003, 0.01, 0.03, 0.1, 0.2, 0.3]:
        fg = F_pair(a, Y2, eps); fw = F_pair(a, W2, eps)
        print(f"   eps={eps:<6} F(G)-F(sigma W) = {fg-fw:+.3e}   (F(G)={fg:.7f}, scaled by eps^(5/3): {(fg-fw)/eps**(5/3):+.3e}, by eps^2: {(fg-fw)/eps**2:+.3e})")
run(lambda T: T, "paste example 2: a(T) = T")
run(lambda T: T + 0.05, "a(T) = T + 0.05")
run(lambda T: 0.8456 + 0.1432*(T-2), "peak row a(T) = 0.8456 + 0.1432(T-2)")
run(lambda T: 0.8456 + 0.1432*(T-2), "peak row, delta = 0 (Y = z2(T-1))", delta=0.0)
run(lambda T: 0.8456 + 0.1432*(T-2), "peak row, delta = 0.3", delta=0.3)
