"""Sanity check (label N, Gauss-Hermite 200x200, accuracy about 3e-3 at sigma = 0) of the real analogue, REPORT section 5.5:
for h = a He3(X) + X Q(Y), u = E h^2:  sqrt(2/pi) sqrt(sigma^2+u) - E|sigma G + h| >= (6 a^2/sqrt(pi u)) int_0^{u/(2 sigma^2)} mu^{1/2}(2-mu)(1+2mu)^{-7/2} dmu."""
import numpy as np, math
from scipy import integrate, special
def lhs(a, b, sig):
    x, wx = np.polynomial.hermite_e.hermegauss(200); wx = wx / math.sqrt(2 * math.pi)
    X, Y = np.meshgrid(x, x, indexing='ij'); W = np.outer(wx, wx)
    h = a * (X ** 3 - 3 * X) + X * b * (Y ** 2 - 1) / math.sqrt(2)
    if sig == 0: return np.sum(W * np.abs(h))
    return np.sum(W * (sig * math.sqrt(2 / math.pi) * np.exp(-h ** 2 / (2 * sig ** 2)) + h * special.erf(h / (sig * math.sqrt(2)))))
for (a, b) in [(1 / math.sqrt(6), 0.0), (0.3, math.sqrt(1 - 6 * 0.09)), (0.1, math.sqrt(1 - 0.06))]:
    u = 6 * a * a + b * b
    for sig in [0.0, 0.3, 1.0, 3.0]:
        M = np.inf if sig == 0 else u / (2 * sig ** 2)
        I = integrate.quad(lambda m: m ** 0.5 * (2 - m) * (1 + 2 * m) ** -3.5, 0, M)[0]
        bound = 6 * a * a / math.sqrt(math.pi * u) * I
        true = math.sqrt(2 / math.pi) * math.sqrt(sig ** 2 + u) - lhs(a, b, sig)
        print(f'a={a:.3f} b={b:.3f} u={u:.3f} sigma={sig}: true deficit {true:.6f} >= bound {bound:.6f}  {"OK" if true >= bound - 1e-6 else "VIOLATION"}')
