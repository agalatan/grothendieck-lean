# Koenig-type complex games [N]: diagonal (charge-one) coefficients of the Gaussian-space kernel
#   e^{-d(|X|^2+|Y|^2)} sin(c Re<X,Y>)  w.r.t. gamma_C x gamma_C:
#   a_k = (-1)^k (c/2)^{2k+1}/((k+1)!k!) E[(-1)^k k! L_k^(1)(S) S^{k+1} e^{-(c^2/4 + d) S}] / (1+d)^{...}   (d = damping)
# derived from E_V[e^{i c Re(U conj V)} H_{p,q}(V) e^{-d|V|^2}] for d = 0; for d > 0 a Gaussian rescaling (done numerically).
import numpy as np, sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from math import factorial
from scipy.special import eval_genlaguerre
from scipy.integrate import quad
def coeffs(c, K=8):
    out = []
    for k in range(K + 1):
        f = lambda s: (-1) ** k * factorial(k) * eval_genlaguerre(k, 1, s) * s ** (k + 1) * np.exp(-(c * c / 4) * s) * np.exp(-s)
        v, _ = quad(f, 0, 400, limit=800)
        out.append((-1) ** k * (c / 2) ** (2 * k + 1) * v / (factorial(k + 1) * factorial(k)))
    out = np.array(out); return out / out[0]
for c in [0.3, 0.6, 1.0, 1.4142, 2.0, 2.5, 3.0, 4.0]:
    print(f'c={c:5.3f}', np.round(coeffs(c), 4))
