# claude-b9ee: independent float check of the Gaussian benchmarks S_i of the ten central rows (4d8a CENTRAL_TEN_ROWS.md)
# S = sup_v { 2 E|Z(l + b(|Z|^2 - 2)) + sqrt(v) W| - (400/299) v },  Z, W independent standard complex Gaussians.
import numpy as np
from scipy.special import ive
from scipy.optimize import minimize_scalar
from numpy.polynomial.legendre import leggauss
x, w = leggauss(400); R = 9.0
r = (x + 1) * R / 2; wr = w * R / 2 * 2 * r * np.exp(-r * r)        # density of |Z|
def Eabs(a, s):                                                     # E|a + s W|, E|W|^2 = 1 (Rice mean)
    if s == 0: return np.abs(a)
    y = a * a / (s * s)
    return s * np.sqrt(np.pi) / 2 * ((1 + y) * ive(0, y / 2) + y * ive(1, y / 2))
def S(l, b):
    a = r * np.abs(l + b * (r * r - 2))
    f = lambda v: -(2 * np.sum(wr * Eabs(a, np.sqrt(max(v, 0)))) - 400 / 299 * v)
    res = minimize_scalar(f, bounds=(0, 0.3), method='bounded', options=dict(xatol=1e-12))
    return -res.fun, res.x
rows = [(.7900201, .1288031, 1.290924109), (.7994359, .1314385, 1.304606446), (.8090028, .1341068, 1.318572696),
        (.8187258, .1368084, 1.332832519), (.8286105, .1395437, 1.347396692), (.8386627, .1423132, 1.362276379),
        (.8488892, .1451174, 1.377484568), (.854, .1465137, 1.385111373), (.8592972, .147957, 1.393034927),
        (.869895, .1508325, 1.408943329)]
for i, (l, b, su) in enumerate(rows, 1):
    s, v = S(l, b)
    print(f'row {i:2d}: S = {s:.9f} at v = {v:.5f}; certified upper {su:.9f}; upper - S = {su - s:+.2e}')
